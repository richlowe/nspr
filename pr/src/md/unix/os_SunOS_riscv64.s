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
	li	t0, 1
	amoadd.w a0, t0, (a0)
	addi	a0, a0, 1
	ret
	SET_SIZE(_MD_AtomicIncrement)

// PRInt32 _MD_AtomicDecrement(PRInt32 *val)
//
// Atomically decrement the integer pointed to by 'val' and return
// the result of the decrement.
//
	ENTRY(_MD_AtomicDecrement)
	li	t0, -1
	amoadd.w a0, t0, (a0)
	addi	a0, a0, 1
	ret
	SET_SIZE(_MD_AtomicDecrement)


// PRInt32 _MD_AtomicSet(PRInt32 *val, PRInt32 newval)
//
// Atomically set the integer pointed to by 'val' to the new
// value 'newval' and return the old value.
//
	ENTRY(_MD_AtomicSet)
	amoswap.w a0, a1, (a0)
	ret
	SET_SIZE(_MD_AtomicSet)


// PRInt32 _MD_AtomicAdd(PRInt32 *ptr, PRInt32 val)
//
// Atomically add 'val' to the integer pointed to by 'ptr'
// and return the result of the addition.
//
	ENTRY(_MD_AtomicAdd)
	amoadd.w a0, a1, (a0)
	add	a0, a1, a0
	ret
	SET_SIZE(_MD_AtomicAdd)
