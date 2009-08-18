/* See COPYRIGHT for copyright information. */

#include <inc/x86.h>
#include <inc/error.h>
#include <inc/string.h>
#include <inc/assert.h>

#include <kern/env.h>
#include <kern/pmap.h>
#include <kern/trap.h>
#include <kern/syscall.h>
#include <kern/console.h>
#include <kern/sched.h>


/**********************************
 * SYSTEM CALLS FOR LAB 3, PART 2 *
 *                                *
 **********************************/

// Print a string to the system console.
// The string is exactly 'len' characters long.
// Destroys the environment on memory errors.
static void
sys_cputs(const char *s, size_t len)
{
	// Check that the user has permission to read memory [s, s+len).
	// Destroy the environment if not.

	// LAB 3: Your code here. (Exercise 7)
	user_mem_assert(curenv, s, len, PTE_U|PTE_P);
	// Print the string supplied by the user.
	cprintf("%.*s", len, s);
}

// Read a character from the system console.
// Returns the character.
static int
sys_cgetc(void)
{
	int c;

	// The cons_getc() primitive doesn't wait for a character,
	// but the sys_cgetc() system call does.
	while ((c = cons_getc()) == 0)
		/* do nothing */;

	return c;
}

// Returns the current environment's envid.
static envid_t
sys_getenvid(void)
{
	return curenv->env_id;
}

// Destroy a given environment (possibly the currently running environment).
//
// Returns 0 on success, < 0 on error.  Errors are:
//	-E_BAD_ENV if environment envid doesn't currently exist,
//		or the caller doesn't have permission to change envid.
static int
sys_env_destroy(envid_t envid)
{
	int r;
	Env *e;

	if ((r = envid2env(envid, &e, 1)) < 0)
		return r;
	if (e == curenv)
		cprintf("[%08x] exiting gracefully\n", curenv->env_id);
	else
		cprintf("[%08x] destroying %08x\n", curenv->env_id, e->env_id);
	env_destroy(e);
	return 0;
}



/********************************************************
 * SYSTEM CALLS FOR LAB 3, PART 3                       *
 *                                                      *
 * No need to implement these until you get to Part 3.  *
 *                                                      *
 ********************************************************/

// Deschedule current environment and pick a different one to run.
// The system call will appear to return 0.
static uint32_t
sys_yield(void)
{
	sched_yield();
	return 0;
}

// Lab 3 Exercise 10:
// Allocate a new environment.
// Returns envid of new environment, or < 0 on error.  Errors are:
//	-E_NO_FREE_ENV if no free environment is available.
static envid_t
sys_exofork(void)
{
	// Create the new environment with env_alloc(), from kern/env.c.
	// It should be left as env_alloc created it, except that
	// status is set to ENV_NOT_RUNNABLE, and the register set is copied
	// from the current environment -- but tweaked so sys_exofork
	// will appear to return 0.
	//
	// Hint: Your code in env_run() shows how to copy a register set.
	
	// LAB 3: Your code here.
	struct Env *child;

	if (env_alloc(&child, curenv->env_id) < 0)
		return -E_NO_FREE_ENV;

	child->env_status = ENV_NOT_RUNNABLE;
	child->env_tf = curenv->env_tf;
	child->env_tf.tf_regs.reg_eax = 0;

	return child->env_id;
//	panic("sys_exofork not implemented");
}

// Lab 3 Exercise 10:
// Set envid's env_status to status, which must be ENV_RUNNABLE
// or ENV_NOT_RUNNABLE.
//
// Returns 0 on success, < 0 on error.  Errors are:
//	-E_BAD_ENV if environment envid doesn't currently exist,
//		or the caller doesn't have permission to change envid.
//	-E_INVAL if status is not a valid status for an environment.
static int
sys_env_set_status(envid_t envid, int status)
{
  	// Hint: Use the 'envid2env' function from kern/env.c to translate an
  	// envid to an Env.
	// You should set envid2env's third argument to 1, which will
	// check whether the current environment has permission to set
	// envid's status.
	
	// LAB 3: Your code here.
	int r;
	struct Env *task;

	if((r = envid2env(envid, &task, 1)) < 0)
		return -E_BAD_ENV;

	if(status != ENV_FREE && status != ENV_RUNNABLE && status != ENV_NOT_RUNNABLE)
		return  -E_INVAL;

	task->env_status = status;

	return 0;
//	panic("sys_env_set_status not implemented");
}

// Lab 3 Exercise 10:
// Allocate a page of memory and map it at 'va' with permission
// 'perm' in the address space of 'envid'.
// The page's contents are set to 0.
// If a page is already mapped at 'va', that page is unmapped as a
// side effect.
//
// perm -- PTE_U | PTE_P must be set, PTE_AVAIL | PTE_W may or may not be set,
//         but no other bits may be set.
//
// Return 0 on success, < 0 on error.  Errors are:
//	-E_BAD_ENV if environment envid doesn't currently exist,
//		or the caller doesn't have permission to change envid.
//	-E_INVAL if va >= UTOP, or va is not page-aligned.
//	-E_INVAL if perm is inappropriate (see above).
//	-E_NO_MEM if there's no memory to allocate the new page,
//		or to allocate any necessary page tables.
static int
sys_page_alloc(envid_t envid, uintptr_t va, int perm)
{
	// Hint: This function is a wrapper around page_alloc() and
	//   page_insert() from kern/pmap.c.
	//   Most of the new code you write should be to check the
	//   parameters for correctness.
	//   If page_insert() fails, remember to free the page you
	//   allocated!

	// LAB 3: Your code here.
	struct Env *task;
	struct Page *page;

	if(envid2env(envid, &task, 1) < 0)
		return -E_BAD_ENV;
	
	if((page = page_alloc()) < 0)
		return -E_NO_MEM;

	if((uint32_t)va >= UTOP || va != round_down(va, PGSIZE))
		return -E_INVAL;

	//set PTE_U and PTE_P
	if(!(perm & PTE_U) || !(perm &PTE_P))
		return -E_INVAL;

	if(perm & ((~(PTE_U | PTE_P | PTE_W | PTE_AVAIL)) & 0xfff))
		return -E_INVAL;

	memset((uintptr_t *)page->data(), 0, PGSIZE);
	if(page_insert(task->env_pgdir, page, va, perm) < 0) {
		page_free(page);
		return -E_NO_MEM;	
	}
	
	return 0;
//	panic("sys_page_alloc not implemented");
}

// Does the actual page map work
static int
page_map(struct Env *srcenv, uintptr_t srcva,
	 struct Env *dstenv, uintptr_t dstva, int perm)
{
	pte_t *pte;
	struct Page *pp;

	pp = page_lookup(srcenv->env_pgdir, srcva, &pte);
	if (!pp)
		return -E_INVAL;

	if (perm & PTE_W) {
		if (!(srcenv->env_pgdir[PDX(srcva)] & PTE_W))
			return -E_INVAL;

		if (!(*pte & PTE_W))
			return -E_INVAL;
	}

	// the real job...
	return page_insert(dstenv->env_pgdir, pp, dstva, perm);
}
// Lab 3 Exercise 10:
// Map the page of memory at 'srcva' in srcenvid's address space
// at 'dstva' in dstenvid's address space with permission 'perm'.
// Perm has the same restrictions as in sys_page_alloc, except
// that it also must not grant write access to a read-only
// page.
//
// Return 0 on success, < 0 on error.  Errors are:
//	-E_BAD_ENV if srcenvid and/or dstenvid doesn't currently exist,
//		or the caller doesn't have permission to change one of them.
//	-E_INVAL if srcva >= UTOP or srcva is not page-aligned,
//		or dstva >= UTOP or dstva is not page-aligned.
//	-E_INVAL is srcva is not mapped in srcenvid's address space.
//	-E_INVAL if perm is inappropriate (see sys_page_alloc).
//	-E_INVAL if (perm & PTE_W), but srcva is read-only in srcenvid's
//		address space.
//	-E_NO_MEM if there's no memory to allocate the new page,
//		or to allocate any necessary page tables.
static int
sys_page_map(envid_t srcenvid, uintptr_t srcva,
	     envid_t dstenvid, uintptr_t dstva, int perm)
{
	// Hint: This function is a wrapper around page_lookup() and
	//   page_insert() from kern/pmap.c.
	//   Again, most of the new code you write should be to check the
	//   parameters for correctness.
	//   Use the third argument to page_lookup() to
	//   check the current permissions on the page.

	// LAB 3: Your code here.
/*	int err;
	struct Env *srcenv, *dstenv;

	// env checks
	err = envid2env(srcenvid, &srcenv, 1);
	if (err)
		return err;

	err = envid2env(dstenvid, &dstenv, 1);
	if (err)
		return err;

	// the real job
	return page_map(srcenv, srcva, dstenv, dstva, perm);
*/
//	panic("sys_page_map not implemented");
        struct Env *se, *de;
        int ret;
        if((ret = envid2env(srcenvid,&se,1)) < 0){
                return ret;
        }
        if((ret = envid2env(dstenvid,&de,1)) < 0){
                return ret;
        }
        if( srcva >= UTOP || PGOFF(srcva) != 0){
                return -E_INVAL;
        }
        if( dstva >= UTOP || PGOFF(dstva) != 0){
                return -E_INVAL;
        }
        struct Page *p;
        pte_t *ppte;
        if(((p = page_lookup(se->env_pgdir, srcva, &ppte)) == NULL)
                || (*ppte | PTE_P) == 0){
                return -E_INVAL;
        }       
        if((perm & PTE_U) == 0 ||
                (perm & PTE_P) == 0 ||
                (perm & ~PTE_U & ~PTE_P & ~PTE_AVAIL & ~PTE_W) != 0 ||
                ((perm & PTE_W) && (*ppte & PTE_W) == 0)){
                return -E_INVAL;
        }
        if((ret = page_insert(de->env_pgdir, p, dstva, perm)) < 0){
                return ret;
        } 
        return 0;

}

// Lab 3 Exercise 10:
// Unmap the page of memory at 'va' in the address space of 'envid'.
// If no page is mapped, the function silently succeeds.
//
// Return 0 on success, < 0 on error.  Errors are:
//	-E_BAD_ENV if environment envid doesn't currently exist,
//		or the caller doesn't have permission to change envid.
//	-E_INVAL if va >= UTOP, or va is not page-aligned.
static int
sys_page_unmap(envid_t envid, uintptr_t va)
{
	// Hint: This function is a wrapper around page_remove().
	
	// LAB 3: Your code here.
	struct Env *task;

	if(envid2env(envid, &task, 1) < 0)
		return -E_BAD_ENV;

	if((uint32_t)va >= UTOP || va != round_down(va, PGSIZE))
		return -E_INVAL;

	page_remove(task->env_pgdir, va);

	return 0;
//	panic("sys_page_unmap not implemented");
}




// Dispatches to the correct kernel function, passing the arguments.
int32_t
syscall(uint32_t syscallno, uint32_t a1, uint32_t a2, uint32_t a3, uint32_t a4, uint32_t a5)
{
	// Call the function corresponding to the 'syscallno' parameter.
	// Return any appropriate return value.
	// LAB 3: Your code here.
	int ret = 0;
	
	switch(syscallno) {
	case SYS_cputs:
		sys_cputs((const char *)a1, (size_t)a2);
		break;
	case SYS_cgetc:
		ret = sys_cgetc();
		break;
	case SYS_getenvid:
		ret = sys_getenvid();
//		cprintf("envid %08x",ret);
		break;
	case SYS_env_destroy:
		ret = sys_env_destroy((envid_t)a1);
		break;
	case SYS_page_alloc:
		ret = sys_page_alloc((envid_t)a1, (uintptr_t)a2, (int)a3);
		break;
	case SYS_page_map:
		ret = sys_page_map((envid_t)a1, (uintptr_t)a2, (envid_t)a3, (uintptr_t)a4, (int)a5);
		break;
	case SYS_page_unmap:
		ret = sys_page_unmap((envid_t)a1, (uintptr_t)a2);
		break;
	case SYS_exofork:
		ret = sys_exofork();
		break;
	case SYS_env_set_status:
		ret = sys_env_set_status((envid_t)a1, (int)a2);
		break;
	case SYS_yield:
		sys_yield();
		break;
	default:
		//NOT SYSCALLS
		ret = -E_INVAL;
		break;
	}
	
	return ret;
		
//	panic("syscall not implemented");
}

