// User-level page fault handler support.
// We use an assembly language wrapper around a C function.
// The assembly wrapper is in pfentry.S.

#include <inc/lib.h>


// Assembly language pgfault entrypoint defined in lib/pgfaultentry.S.
extern "C" {
void _pgfault_upcall();
}

// Pointer to currently installed C-language pgfault handler.
void (*_pgfault_handler)(struct UTrapframe *utf);

//
// Set the page fault handler function.
// If there isn't one yet, _pgfault_handler will be 0.
// The first time we register a handler, we need to 
// allocate an exception stack (one page of memory with its top
// at UXSTACKTOP), and tell the kernel to call the assembly-language
// _pgfault_upcall routine when a page fault occurs.
//
/*
void
set_pgfault_handler(void (*handler)(struct UTrapframe *utf))
{
	int r;

	if (_pgfault_handler == 0) {
		// First time through!
		// LAB 4: Your code here.
		r = sys_page_alloc(0, (void*) (UXSTACKTOP - PGSIZE),
				     PTE_P|PTE_U|PTE_W);
		if (r)
			return;
		sys_env_set_pgfault_upcall(0, (void *)_pgfault_upcall);
		//panic("set_pgfault_handler not implemented");
	}

	// Save handler pointer for assembly to call.
	_pgfault_handler = handler;
}
*/

void
set_pgfault_handler(void (*handler)(struct UTrapframe *utf))
{
        int r;


        if (_pgfault_handler == 0) {
                // First time through!
                // LAB 4: Your code here.
                //panic("set_pgfault_handler not implemented");
                int ret ;
                envid_t eid = sys_getenvid();
                if((ret = sys_page_alloc(eid,
                                        (void *)(UXSTACKTOP-PGSIZE),
                                        PTE_P|PTE_U|PTE_W)) < 0){
                        panic("set_pgfault_handler failed when calling sys_page_alloc:%d\n",ret);
                        return;
                }
                if((ret = sys_env_set_pgfault_upcall(eid,(void *)_pgfault_upcall))<0){
                        panic("set_pgfault_handler failed when calling sys_env_set...:%d\n",ret);
                        return;
                }
        }


        // Save handler pointer for assembly to call.
        _pgfault_handler = handler;
}
