// Called from entry.S to get us going.
// entry.S already took care of defining envs, pages, vpd, and vpt.

#include <inc/lib.h>

extern void umain(int argc, char **argv);

const volatile struct Env *env;
const char *binaryname = "(unknown program)";

extern "C" {
void
libmain(int argc, char **argv)
{
	extern uint32_t sctors[], ectors[];
	uint32_t *ctorva;

	// set env to point at our env structure in envs[].
	// LAB 3: Your code here.
	env = 0;

	// save the name of the program so that panic() can use it
	if (argc > 0)
		binaryname = argv[0];

	// Call any global constructors.
	// This relies on linker script magic to define the 'sctors' and
	// 'ectors' symbols; see user/user.ld.
	for (ctorva = ectors; ctorva > sctors; )
		((void(*)()) *--ctorva)();

	// call user main routine
	umain(argc, argv);

	// exit gracefully
	exit();
}
}

