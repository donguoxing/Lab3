#include <inc/mmu.h>
#include <inc/x86.h>
#include <inc/string.h>
#include <inc/assert.h>

#include <kern/pmap.h>
#include <kern/trap.h>
#include <kern/console.h>
#include <kern/monitor.h>
#include <kern/env.h>
#include <kern/syscall.h>
#include <kern/picirq.h>
#include <kern/sched.h>
#include <kern/kclock.h>

static struct Taskstate ts;

/* Interrupt descriptor table.  (Must be built at run time because
 * shifted function addresses can't be represented in relocation records.)
 */
struct Gatedesc idt[256] = { { 0 } };
struct Pseudodesc idt_pd = {
	sizeof(idt) - 1, (uint32_t) idt
};


static const char *trapname(int trapno)
{
	static const char * const excnames[] = {
		"Divide error",
		"Debug",
		"Non-Maskable Interrupt",
		"Breakpoint",
		"Overflow",
		"BOUND Range Exceeded",
		"Invalid Opcode",
		"Device Not Available",
		"Double Falt",
		"Coprocessor Segment Overrun",
		"Invalid TSS",
		"Segment Not Present",
		"Stack Fault",
		"General Protection",
		"Page Fault",
		"(unknown trap)",
		"x87 FPU Floating-Point Error",
		"Alignment Check",
		"Machine-Check",
		"SIMD Floating-Point Exception"
	};

	if ((size_t) trapno < sizeof(excnames) / sizeof(excnames[0]))
		return excnames[trapno];
	if (trapno == T_SYSCALL)
		return "System call";
	if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16)
		return "Hardware Interrupt";

	return "(unknown trap)";
}


void
idt_init(void)
{
	extern struct Segdesc gdt[];

	// LAB 2: Your code here.
	extern char t_divide_lbl[];	//0 divide fault
	extern char t_debug_lbl[];	//1
	extern char t_nmi_lbl[];	//2
	extern char t_brkpt_lbl[];	//3
	extern char t_oflow_lbl[];	//4
	extern char t_bound_lbl[];	//5
	extern char t_illop_lbl[];	//6
	extern char t_device_lbl[];	//7
	extern char t_dblflt_lbl[];	//8
	extern char t_tss_lbl[];	//10
	extern char t_segnp_lbl[];	//11
	extern char t_stack_lbl[];	//12
	extern char t_gpflt_lbl[];	//13
	extern char t_pgflt_lbl[];	//14
	extern char t_fperr_lbl[];	//16
	extern char t_align_lbl[];	//17
	extern char t_mchk_lbl[];	//18
	extern char t_simderr_lbl[];	//19
	extern char t_syscall_lbl[];	//48 system call
	
	extern char int_nr_0[];
	extern char int_nr_1[];
	extern char int_nr_2[];
	extern char int_nr_3[];
	extern char int_nr_4[];
	extern char int_nr_5[];
	extern char int_nr_6[];
	extern char int_nr_7[];
	extern char int_nr_8[];
	extern char int_nr_9[];
	extern char int_nr_10[];
	extern char int_nr_11[];
	extern char int_nr_12[];
	extern char int_nr_13[];
	extern char int_nr_14[];
	extern char int_nr_15[];

	SETGATE(idt[0], 0, GD_KT, t_divide_lbl, 0);
	SETGATE(idt[1], 0, GD_KT, t_debug_lbl, 0);
	SETGATE(idt[2], 0, GD_KT, t_nmi_lbl, 0);
	SETGATE(idt[3], 0, GD_KT, t_brkpt_lbl, 3);	
	SETGATE(idt[4], 0, GD_KT, t_oflow_lbl, 0);
	SETGATE(idt[5], 0, GD_KT, t_bound_lbl, 0);
	SETGATE(idt[6], 0, GD_KT, t_illop_lbl, 0);
	SETGATE(idt[7], 0, GD_KT, t_device_lbl, 0);
	SETGATE(idt[8], 0, GD_KT, t_dblflt_lbl, 0);
	SETGATE(idt[10], 0, GD_KT, t_tss_lbl, 0);
	SETGATE(idt[11], 0, GD_KT, t_segnp_lbl, 0);
	SETGATE(idt[12], 0, GD_KT, t_stack_lbl, 0);
	SETGATE(idt[13], 0, GD_KT, t_gpflt_lbl, 0);	
	SETGATE(idt[14], 0, GD_KT, t_pgflt_lbl, 0);	
	SETGATE(idt[16], 0, GD_KT, t_fperr_lbl, 0);	
	SETGATE(idt[17], 0, GD_KT, t_align_lbl, 0);	
	SETGATE(idt[18], 0, GD_KT, t_mchk_lbl, 0);	
	SETGATE(idt[19], 0, GD_KT, t_simderr_lbl, 0);	

	// Set a gate for the system call interrupt.
	// Hint: Must this gate be accessible from userlevel?
	// LAB 3: Your code here.
	SETGATE(idt[48], 0, GD_KT, t_syscall_lbl, 3);

	SETGATE(idt[IRQ_OFFSET], 0, GD_KT, int_nr_0, 0)
	SETGATE(idt[IRQ_OFFSET+1], 0, GD_KT, int_nr_1, 0)
	SETGATE(idt[IRQ_OFFSET+2], 0, GD_KT, int_nr_2, 0)
	SETGATE(idt[IRQ_OFFSET+3], 0, GD_KT, int_nr_3, 0)
	SETGATE(idt[IRQ_OFFSET+4], 0, GD_KT, int_nr_4, 0)
	SETGATE(idt[IRQ_OFFSET+5], 0, GD_KT, int_nr_5, 0)
	SETGATE(idt[IRQ_OFFSET+6], 0, GD_KT, int_nr_6, 0)
	SETGATE(idt[IRQ_OFFSET+7], 0, GD_KT, int_nr_7, 0)
	SETGATE(idt[IRQ_OFFSET+8], 0, GD_KT, int_nr_8, 0)
	SETGATE(idt[IRQ_OFFSET+9], 0, GD_KT, int_nr_9, 0)
	SETGATE(idt[IRQ_OFFSET+10], 0, GD_KT, int_nr_10, 0)
	SETGATE(idt[IRQ_OFFSET+11], 0, GD_KT, int_nr_11, 0)
	SETGATE(idt[IRQ_OFFSET+12], 0, GD_KT, int_nr_12, 0)
	SETGATE(idt[IRQ_OFFSET+13], 0, GD_KT, int_nr_13, 0)
	SETGATE(idt[IRQ_OFFSET+14], 0, GD_KT, int_nr_14, 0)
	SETGATE(idt[IRQ_OFFSET+15], 0, GD_KT, int_nr_15, 0)
	// Setup a TSS so that we get the right stack
	// when we trap to the kernel.
	ts.ts_esp0 = KSTACKTOP;
	ts.ts_ss0 = GD_KD;

	// Initialize the TSS field of the gdt.
	gdt[GD_TSS >> 3] = SEG16(STS_T32A, (uint32_t) (&ts),
					sizeof(struct Taskstate), 0);
	gdt[GD_TSS >> 3].sd_s = 0;

	// Load the TSS
	ltr(GD_TSS);

	// Load the IDT
	asm volatile("lidt idt_pd");
}

void
print_trapframe(struct Trapframe *tf)
{
	cprintf("TRAP frame at %p\n", tf);
	print_regs(&tf->tf_regs);
	cprintf("  es   0x----%04x\n", tf->tf_es);
	cprintf("  ds   0x----%04x\n", tf->tf_ds);
	cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
	cprintf("  err  0x%08x\n", tf->tf_err);
	cprintf("  eip  0x%08x\n", tf->tf_eip);
	cprintf("  cs   0x----%04x\n", tf->tf_cs);
	cprintf("  flag 0x%08x\n", tf->tf_eflags);
	cprintf("  esp  0x%08x\n", tf->tf_esp);
	cprintf("  ss   0x----%04x\n", tf->tf_ss);
}

void
print_regs(struct Registers *regs)
{
	cprintf("  edi  0x%08x\n", regs->reg_edi);
	cprintf("  esi  0x%08x\n", regs->reg_esi);
	cprintf("  ebp  0x%08x\n", regs->reg_ebp);
	cprintf("  oesp 0x%08x\n", regs->reg_oesp);
	cprintf("  ebx  0x%08x\n", regs->reg_ebx);
	cprintf("  edx  0x%08x\n", regs->reg_edx);
	cprintf("  ecx  0x%08x\n", regs->reg_ecx);
	cprintf("  eax  0x%08x\n", regs->reg_eax);
}

extern "C" {
void
trap(struct Trapframe *tf)
{
	if ((tf->tf_cs & 3) == 3) {
		// Trapped from user mode.
		// Copy trap frame (which is currently on the stack)
		// into 'curenv->env_tf', so that running the environment
		// will restart at the trap point.
		assert(curenv);
		curenv->env_tf = *tf;
		// The trapframe on the stack should be ignored from here on.
		// change the code position. 		
		//tf = &curenv->env_tf;  
	}

	// Dispatch based on what type of trap occurred
	switch (tf->tf_trapno) {

	// LAB 2: Your code here.
	case T_BRKPT:
		tf = &curenv->env_tf;
		monitor(tf);
		return;

	// Handle page faults (T_PGFLT).
	// LAB 3: Your code here.
	case T_PGFLT:
		tf = &curenv->env_tf;
		page_fault_handler(tf);
		return;
	// Handle system calls (T_SYSCALL).
	// LAB 3: Your code here.
	case T_SYSCALL:
		tf->tf_regs.reg_eax = syscall(
			tf->tf_regs.reg_eax, 
			tf->tf_regs.reg_edx, 
			tf->tf_regs.reg_ecx, 
			tf->tf_regs.reg_ebx, 
			tf->tf_regs.reg_edi,
			tf->tf_regs.reg_esi);
		return;
	// External interrupts section
		
	// Handle clock and serial interrupts.
	// LAB 4: Your code here.
	case IRQ_OFFSET:
		tf = &curenv->env_tf;
		sched_yield();
		break;

	case IRQ_OFFSET + IRQ_KBD: /* keyboard interrupt */
		// Ignore keyboard interrupts for now.
		break;

	case IRQ_OFFSET + 8:  case IRQ_OFFSET + 9:
	case IRQ_OFFSET + 10: case IRQ_OFFSET + 11:
	case IRQ_OFFSET + 12: case IRQ_OFFSET + 13:
	case IRQ_OFFSET + 14: case IRQ_OFFSET + 15:
		// The automatic-EOI mode doesn't work on the slave (IRQs
		// 8-15), so we must mark EOI explicitly.
		tf = &curenv->env_tf;
		outb(IO_PIC2, 0x60 + (tf->tf_trapno & 7));
		break;

	default:
		// Unexpected trap: The user process or the kernel has a bug.
		tf = &curenv->env_tf;
		print_trapframe(tf);
		panic("%x !", curenv->env_id);
		if (tf->tf_cs == GD_KT)
			panic("unhandled trap in kernel");
		else {
			env_destroy(curenv);
			return;
		}
	}

	// If we made it to this point, then no other environment was
	// scheduled, so we should return to the current environment
	// if doing so makes sense.
	assert(curenv && curenv->env_status == ENV_RUNNABLE);
	env_run(curenv);
}
}

void
page_fault_handler(struct Trapframe *tf)
{
	uint32_t fault_va;

	// Read processor's CR2 register to find the faulting address
	fault_va = rcr2();

	// Handle kernel-mode page faults.
	
	// LAB 3: Your code here.
	if((tf->tf_cs & 3) == 0) {
		cprintf("kernel fault va %08x ip %08x\n", fault_va, tf->tf_eip);
		panic("Page fault in kernel! \n");
		return;
	}

	// We've already handled kernel-mode exceptions, so if we get here,
	// the page fault happened in user mode.

	// Call the environment's page fault upcall, if one exists.  Set up a
	// page fault stack frame on the user exception stack (below
	// UXSTACKTOP), then branch to curenv->env_pgfault_upcall.
	//
	// The page fault upcall might cause another page fault, in which case
	// we branch to the page fault upcall recursively, pushing another
	// page fault stack frame on top of the user exception stack.
	//
	// The trap handler needs one word of scratch space at the top of the
	// trap-time stack in order to return.  In the non-recursive case, we
	// don't have to worry about this because the top of the regular user
	// stack is free.  In the recursive case, this means we have to leave
	// an extra word between the current top of the exception stack and
	// the new stack frame because the exception stack _is_ the trap-time
	// stack.
	//
	// If there's no page fault upcall, the environment didn't allocate a
	// page for its exception stack, or the exception stack overflows,
	// then destroy the environment that caused the fault.
	//
	// Hints:
	//   user_mem_assert() and env_run() are useful here.
	//   To change what the user environment runs, modify 'curenv->env_tf'
	//   (the 'tf' variable points at 'curenv->env_tf').
	
	// LAB 4: Your code here.

	//pde_t *cr3_bak = (pde_t *)rcr3();
	if (curenv->env_pgfault_upcall) {
		uintptr_t addr;
		struct UTrapframe utf;

		// fill utf
		memset(&utf, 0, sizeof(utf));
		utf.utf_fault_va = fault_va;
		utf.utf_err = tf->tf_err;
		utf.utf_regs = tf->tf_regs;
		utf.utf_eip = tf->tf_eip;
		utf.utf_eflags = tf->tf_eflags;
		utf.utf_esp = tf->tf_esp;

		pde_t *cr3_bak = (pde_t *)rcr3();
		// too slow?
		lcr3(PADDR(curenv->env_pgdir));
		if ((tf->tf_esp >= UXSTACKTOP - PGSIZE) &&
		    (tf->tf_esp < UXSTACKTOP)) {
			// pgfault handler faulted
			addr = tf->tf_esp - 4 - sizeof(utf);
		} else {
			// expected case
			addr = UXSTACKTOP - sizeof(utf);
		}

		user_mem_assert(curenv, (const void *) addr,
				sizeof(utf), PTE_W);

		memcpy((void *) addr, &utf, sizeof(utf));

		lcr3((uint32_t)cr3_bak);

		// go!
		curenv->env_tf.tf_eip =(uintptr_t) curenv->env_pgfault_upcall;
		curenv->env_tf.tf_esp = addr;
		env_run(curenv);
	}
	// Destroy the environment that caused the fault.
	cprintf("[%08x] user fault va %08x ip %08x\n",
		curenv->env_id, fault_va, tf->tf_eip);
	print_trapframe(tf);
	env_destroy(curenv);
}

