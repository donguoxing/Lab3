// Simple command-line kernel monitor useful for
// controlling the kernel and exploring the system interactively.

#include <inc/stdio.h>
#include <inc/string.h>
#include <inc/memlayout.h>
#include <inc/assert.h>
#include <inc/x86.h>

#include <kern/console.h>
#include <kern/monitor.h>
#include <kern/kdebug.h>
#include <kern/trap.h>
#include <kern/pmap.h>
#include <kern/env.h>

#define CMDBUF_SIZE	80	// enough for one VGA text line

struct Command {
	const char *name;
	const char *desc;
	// return -1 to force monitor to exit
	int (*func)(int argc, char** argv, struct Trapframe* tf);
};

static struct Command commands[] = {
	{ "help", "Display this list of commands", mon_help },
	{ "kerninfo", "Display information about the kernel", mon_kerninfo },
	{ "backtrace", "Run a stack backtrace", mon_backtrace},
	{ "exit", "Returning from the interrupt", mon_exit},

};
#define NCOMMANDS (int) (sizeof(commands)/sizeof(commands[0]))



/***** Implementations of basic kernel monitor commands *****/

int
mon_help(int argc, char **argv, struct Trapframe *tf)
{
	int i;

	for (i = 0; i < NCOMMANDS; i++)
		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
	return 0;
}

int
mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
{
	extern char _start[], etext[], edata[], end[];

	cprintf("Special kernel symbols:\n");
	cprintf("  _start %08x (virt)  %08x (phys)\n", _start, _start - KERNBASE);
	cprintf("  etext  %08x (virt)  %08x (phys)\n", etext, etext - KERNBASE);
	cprintf("  edata  %08x (virt)  %08x (phys)\n", edata, edata - KERNBASE);
	cprintf("  end    %08x (virt)  %08x (phys)\n", end, end - KERNBASE);
	cprintf("Kernel executable memory footprint: %dKB\n",
		(end-_start+1023)/1024);
	return 0;
}

int
mon_backtrace(int argc, char **argv, struct Trapframe *tf)
{
	// Your code here.
        uint32_t *ebp;
	extern char bootstacktop[];
	int i = 0;
	Eipdebuginfo info;
	cprintf("Stack backtrace:\n");
	ebp = (uint32_t *)read_ebp();
	cprintf("bootstacktop: %08x\n", (uint32_t *)bootstacktop);
	while(ebp < (uint32_t *)bootstacktop )
	{
        cprintf("%d: ebp %08x eip %08x args %08x %08x %08x %08x\n", i, ebp, *(ebp+1), *(ebp+2), *(ebp+2+1),*(ebp+2+2), *(ebp+2+3));
	debuginfo_eip(*(ebp+1), &info);
	cprintf("   %s:%d: %s (%d arg)\n", info.eip_file, info.eip_line, info.eip_fn_name, info.eip_fn_narg);
	i++;
	if(*ebp == 0 )
	{
		cprintf("the final value of ebp: %08x\n", ebp);
		break;
	}
	ebp = (uint32_t *)*ebp;
	}
	if(tf != NULL)
	print_trapframe(tf);
	else
	cprintf("no breakpoint\n");
	//ebp = (uint32_t *)tf;
	//while(*ebp)
	//{
	//cprintf("0x%08x ", ebp);
	//ebp++;
	//}
	return 0;
}

int
mon_exit(int argc, char **argv, struct Trapframe *tf)
{
	 int ef;
	 ef = read_eflags();
	 if (tf->tf_eflags & 0x100)
	 tf->tf_eflags &= ~(ef | 1 << 8); /* Clear TF to disable single-step mode */
	 __asm __volatile("movl %0,%%esp\n"
	     		"\tpopal\n"
	         	"\tpopl %%es\n"
		     	"\tpopl %%ds\n"
		        "\taddl $0x8,%%esp\n" /* skip tf_trapno and tf_errcode */
			"\tiret"
			: : "g" (tf) : "memory");
	panic("iret failed"); /* mostly to placate the compiler */
	return 0;
}

/***** Kernel monitor command interpreter *****/

#define WHITESPACE "\t\r\n "
#define MAXARGS 16

static int
runcmd(char *buf, struct Trapframe *tf)
{
	int argc;
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
	while (1) {
		// gobble whitespace
		while (*buf && strchr(WHITESPACE, *buf))
			*buf++ = 0;
		if (*buf == 0)
			break;

		// save and scan past next arg
		if (argc == MAXARGS-1) {
			cprintf("Too many arguments (max %d)\n", MAXARGS);
			return 0;
		}
		argv[argc++] = buf;
		while (*buf && !strchr(WHITESPACE, *buf))
			buf++;
	}
	argv[argc] = 0;

	// Lookup and invoke the command
	if (argc == 0)
		return 0;
	for (i = 0; i < NCOMMANDS; i++) {
		if (strcmp(argv[0], commands[i].name) == 0)
			return commands[i].func(argc, argv, tf);
	}
	cprintf("Unknown command '%s'\n", argv[0]);
	return 0;
}

void
monitor(struct Trapframe *tf)
{
	char *buf;

	// The 'make grade' script depends on the following printout, so don't
	// remove it.
	cprintf("Welcome to the JOS kernel monitor!\n");
	cprintf("Type 'help' for a list of commands.\n");

	if (tf != NULL)
		print_trapframe(tf);

	while (1) {
		buf = readline("K> ");
		if (buf != NULL)
			if (runcmd(buf, tf) < 0)
				break;
	}
}
