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
    .text
    .globl _MD_AtomicIncrement
    .align 4
_MD_AtomicIncrement:
1:	ldaxr	w1, [x0]
	add	w1, w1, #1
	stxr	w2, w1, [x0]
	cbnz	w2, 1b
	mov	w0, w1
	ret

// PRInt32 _MD_AtomicDecrement(PRInt32 *val)
//
// Atomically decrement the integer pointed to by 'val' and return
// the result of the decrement.
//
    .text
    .globl _MD_AtomicDecrement
    .align 4 
_MD_AtomicDecrement:
1:	ldaxr	w1, [x0]
	sub	w1, w1, #1
	stxr	w2, w1, [x0]
	cbnz	w2, 1b
	mov	w0, w1
	ret


// PRInt32 _MD_AtomicSet(PRInt32 *val, PRInt32 newval)
//
// Atomically set the integer pointed to by 'val' to the new
// value 'newval' and return the old value.
//
    .text
    .globl _MD_AtomicSet
    .align 4
_MD_AtomicSet:
1:	ldaxr	w2, [x0]
	stxr	w3, w1, [x0]
	cbnz	w3, 1b
	mov	w0, w2
	ret


// PRInt32 _MD_AtomicAdd(PRInt32 *ptr, PRInt32 val)
//
// Atomically add 'val' to the integer pointed to by 'ptr'
// and return the result of the addition.
//
    .text
    .globl _MD_AtomicAdd
    .align 4 
_MD_AtomicAdd:
1:	ldaxr	w2, [x0]
	add	w2, w2, w1
	stxr	w4, w2, [x0]
	cbnz	w4, 1b
	mov	w0, w2
	ret
