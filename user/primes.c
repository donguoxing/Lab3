// Concurrent version of prime sieve of Eratosthenes.
// Invented by Doug McIlroy, inventor of Unix pipes.
// See http://plan9.bell-labs.com/~rsc/thread.html.
// The picture halfway down the page and the text surrounding it
// explain what's going on here.
//
// Since NENVS is 1024, we can print 1023 primes before running out.
// The remaining environment is the integer generator at the bottom
// of main.

#include <inc/lib.h>

unsigned
primeproc()
{
	int i, id, p;
	envid_t envid;

	// fetch a prime from our left neighbor
top:
	p = ipc_recv(&envid, 0, 0);
	cprintf("%d ", p);

	// fork a right neighbor to continue the chain
	if ((id = fork()) < 0)
		panic("fork: %e", id);
	if (id == 0)
		goto top;
	
	// filter out multiples of our prime
	while (1) {
		i = ipc_recv(&envid, 0, 0);
		if (i % p)
			ipc_send(id, i, 0, 0);
	}
}

void
umain(int, char **)
{
	int i, id;

	// fork the first prime process in the chain
	if ((id = fork()) < 0)
		panic("fork: %e", id);
	if (id == 0)
		primeproc();

	// feed all the integers through
	for (i = 2; ; i++)
		ipc_send(id, i, 0, 0);
}

