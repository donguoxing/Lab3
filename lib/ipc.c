// User-level IPC library routines

#include <inc/lib.h>
// Receive a value via IPC and return it.
// If 'pg' is nonnull, then any page sent by the sender will be mapped at
//	that address.
// If 'from_env_store' is nonnull, then store the IPC sender's envid in
//	'*from_env_store'.
// If 'perm_store' is nonnull, then store the IPC sender's page permission in
//	'*perm_store'.  (This is nonzero iff a page was successfully
//	transferred to 'pg'.)
// If the system call fails, then store 0 in *from_env_store and *perm_store
//	(if they're nonnull) and return the error code.
// Note: ipc_recv's caller can distinguish sys_ipc_recv failures from
//	successfully received IPCs with negative values by checking whether
//	'*from_env_store != 0'.
//
// Hint:
//   Use 'env' to discover the value and who sent it.
//   If 'pg' is null, pass sys_ipc_recv a value that it will understand
//   as meaning "no page".  (Zero is not the right value.)
int32_t
ipc_recv(envid_t *from_env_store, void *pg, int *perm_store)
{
	// LAB 4: Your code here.
	panic("ipc_recv not implemented");
	return 0;
}

// Send 'val' (and 'pg' with 'perm', assuming 'pg' is nonnull) to 'toenv'.
// This function keeps trying until it succeeds.
// It should panic() on any error other than -E_IPC_NOT_RECV.
//
// Hint:
//   Use sys_yield() to be CPU-friendly.
//   If 'pg' is null, pass sys_ipc_recv a value that it will understand
//   as meaning "no page".  (Zero is not the right value.)
void
ipc_send(envid_t to_env, uint32_t val, void *pg, int perm)
{
	// LAB 4: Your code here.
	panic("ipc_send not implemented");
}

