// -*- Mode: C++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 2 -*-
// 
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <sys/asm_linkage.h>


// PRInt32 _MD_AtomicIncrement(PRInt32 *val)
//
// Atomically increment the integer pointed to by 'val' and return
// the result of the increment.
//
	ENTRY(_MD_AtomicIncrement)
1:	ldl_l	v0, 0(a0)
	addl	v0, 1, v0
	mov	v0, t2
	stl_c	t2, 0(a0)
	beq	t2, 2f
	ret
2:	br	1b
	SET_SIZE(_MD_AtomicIncrement)

// PRInt32 _MD_AtomicDecrement(PRInt32 *val)
//
// Atomically decrement the integer pointed to by 'val' and return
// the result of the decrement.
//
	ENTRY(_MD_AtomicDecrement)
1:	ldl_l	v0, 0(a0)
	subl	v0, 1, v0
	mov	v0, t2
	stl_c	t2, 0(a0)
	beq	t2, 2f
	ret
2:	br	1b
	SET_SIZE(_MD_AtomicDecrement)


// PRInt32 _MD_AtomicSet(PRInt32 *val, PRInt32 newval)
//
// Atomically set the integer pointed to by 'val' to the new
// value 'newval' and return the old value.
//
	ENTRY(_MD_AtomicSet)
1:	ldl_l	v0, 0(a0)
	mov	a1, t2
	stl_c	t2, 0(a0)
	beq	t2, 2f
	ret
2:	br	1b
	SET_SIZE(_MD_AtomicSet)


// PRInt32 _MD_AtomicAdd(PRInt32 *ptr, PRInt32 val)
//
// Atomically add 'val' to the integer pointed to by 'ptr'
// and return the result of the addition.
//
	ENTRY(_MD_AtomicAdd)
1:	ldl_l	v0, 0(a0)
	addl	v0, a1, v0
	mov	v0, t2
	stl_c	t2, 0(a0)
	beq	t2, 2f
	ret
2:	br	1b
	SET_SIZE(_MD_AtomicAdd)
