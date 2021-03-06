/* SPDX-License-Identifier: GPL-2.0 */
/* systbls.S: System call entry point tables for OS compatibility.
 *            The native Linux system call table lives here also.
 *
 * Copyright (C) 1995, 1996, 2007 David S. Miller (davem@davemloft.net)
 * Copyright (C) 1997 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
 *
 * Based upon preliminary work which is:
 *
 * Copyright (C) 1995 Adrian M. Rodriguez (adrian@remus.rutgers.edu)
 */

#define __SYSCALL(nr, entry, nargs) .word entry
	.text
	.align	4
#ifdef CONFIG_COMPAT
	.globl sys_call_table32
sys_call_table32:
#include <asm/syscall_table_c32.h>	/* Compat syscalls */
#endif /* CONFIG_COMPAT */

	.align	4
	.globl sys_call_table64, sys_call_table
sys_call_table64:
sys_call_table:
#include <asm/syscall_table_64.h>	/* 64-bit native syscalls */
#undef __SYSCALL
