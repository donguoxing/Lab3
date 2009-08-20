// implement fork from user space

#include <inc/string.h>
#include <inc/lib.h>

// PTE_COW marks copy-on-write page table entries.
// It is one of the bits explicitly allocated to user processes (PTE_AVAIL).
#define PTE_COW		0x800

//
// Custom page fault handler - if faulting page is copy-on-write,
// map in our own private writable copy.
//
static void
pgfault(struct UTrapframe *utf)
{
	char *addr = (char *) utf->utf_fault_va;
	uint32_t err = utf->utf_err;
	int r;

	// Check that the faulting access was (1) a write, and (2) to a
	// copy-on-write page.  If not, panic.
	// Hint:
	//   Use the read-only page table mappings at vpt
	//   (see <inc/memlayout.h>).

	// LAB 4: Your code here.
	if (!(err & FEC_WR))
		panic("pgfault: fault is not a write (err: %08x va: %08x ip: %08x)",
		      err, addr, utf->utf_eip);

	if (!(vpt[((uint32_t) addr / PGSIZE)] & PTE_COW))
		panic("pgfault: va %08x (%08x) pte %08x is not PTE_COW",
		      addr, round_down(addr, PGSIZE),
		      vpt[((uint32_t) addr / PGSIZE)]);

	// Allocate a new page, map it at a temporary location (PFTEMP),
	// copy the data from the old page to the new page, then move the new
	// page to the old page's address.
	// Hint:
	//   You should make three system calls.
	//   No need to explicitly delete the old page's mapping.
	
	// LAB 4: Your code here.
	//panic("pgfault not implemented");
	r = sys_page_alloc(0, (void *)PFTEMP, PTE_P|PTE_U|PTE_W);
	if (r)
		panic("sys_page_alloc: %e", r);

	memcpy((void *)PFTEMP, round_down(addr, PGSIZE), PGSIZE);

	r = sys_page_map(0, (void *)PFTEMP, 0, round_down(addr, PGSIZE), PTE_P|PTE_U|PTE_W);
	if (r)
		panic("sys_page_map: %e", r);

	r = sys_page_unmap(0, (void *)PFTEMP);
	if (r)
		panic("sys_page_unmap: %e", r);
}

//
// Map our virtual page pn (address pn*PGSIZE) into the target envid
// at the same virtual address.  If the page is writable or copy-on-write,
// the new mapping must be created copy-on-write, and then our mapping must be
// marked copy-on-write as well.  (Exercise: Why mark ours copy-on-write again
// if it was already copy-on-write?)
//
// Returns: 0 on success, < 0 on error.
// It is also OK to panic on error.
// 
static int
duppage(envid_t envid, unsigned pn)
{
	int r;
	void *addr;
	pte_t pte;

	// LAB 4: Your code here.
	//panic("duppage not implemented");
	int perm;
	pte = vpt[pn];
	addr = (void *) (pn * PGSIZE);
	perm = pte & PTE_USER;

	if (perm & PTE_SHARE)
		return sys_page_map(0, addr, envid, addr, perm);

	if (perm & (PTE_W|PTE_COW)) {
		perm &= ~PTE_W;
		perm |= PTE_COW;

		// Map in the child
		r = sys_page_map(0, addr, envid, addr, perm);
		if (r)
			return r;

		// Remaps in the parent
		return sys_page_map(0, addr, 0, addr, perm);
	}

	// Map in the child
	return sys_page_map(0, addr, envid, addr, perm);
}

//
// User-level fork with copy-on-write.
// Set up our page fault handler appropriately.
// Create a child.
// Copy our address space and page fault handler setup to the child.
// Then mark the child as runnable and return.
//
// Returns: child's envid to the parent, 0 to the child, < 0 on error.
// It is also OK to panic on error.
//
// Hint:
//   Use vpd, vpt, and duppage.
//   Remember to fix "env" and the user exception stack in the child process.
//   Neither user exception stack should ever be marked copy-on-write,
//   so you must allocate a new page for the child's user exception stack.
//
envid_t
fork(void)
{
	// LAB 4: Your code here.
	//panic("fork not implemented");
	uint32_t pn;
	envid_t envid;
	unsigned int pdeno, pteno, err;

	set_pgfault_handler(pgfault);

	envid = sys_exofork();
	if (envid < 0)
		return envid;
	if (envid == 0) {
		// Child
		env = &envs[ENVX(sys_getenvid())];
		return 0;
	}
	
	// Parent
	pn = 0;

	for (pdeno = 0; pdeno < PDX(UTOP); pdeno++) {
		if (vpd[pdeno] == 0) {
			// skip empty PDEs
			pn += NPTENTRIES;
			continue;
		}

		for (pteno = 0; pteno < NPTENTRIES; pteno++,pn++) {
			if (vpt[pn] == 0) {
				// skipt empty PTEs
				continue;
			}

			// Do not duplicate the exception stack
			if ((pn * PGSIZE) == (UXSTACKTOP - PGSIZE))
				continue;

			err = duppage(envid, pn);
			if (err)
				panic("duppage: %e", err);
		}
	}

	// Child's mapping done, allocate a page for its exception
	// stack, set its page fault handler and mark it runnable

	err = sys_page_alloc(envid, (void *) (UXSTACKTOP - PGSIZE),
			     PTE_P|PTE_U|PTE_W);
	if (err)
		panic("sys_page_alloc: e%", err);

	sys_env_set_pgfault_upcall(envid, env->env_pgfault_upcall);

	err = sys_env_set_status(envid, ENV_RUNNABLE);
	if (err)
		panic("sys_env_set_status: %e", err);

	return envid;
}
