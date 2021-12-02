
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	a0 05 01 08 74 06 01 08 74 06 01 08 74 06 01 08     ....t...t...t...
 8010410:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010420:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010430:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010440:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010450:	74 06 01 08 74 06 01 08 3c 05 01 08 74 06 01 08     t...t...<...t...
 8010460:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010470:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010480:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 8010490:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 80104a0:	74 06 01 08 74 06 01 08 74 06 01 08 94 26 01 08     t...t...t....&..
 80104b0:	74 06 01 08 74 06 01 08 74 06 01 08 24 26 01 08     t...t...t...$&..
 80104c0:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 80104d0:	74 06 01 08 74 06 01 08 74 06 01 08 74 06 01 08     t...t...t...t...
 80104e0:	74 06 01 08 e8 25 01 08 74 06 01 08 74 06 01 08     t....%..t...t...
 80104f0:	74 06 01 08 c8 26 01 08 58 26 01 08 fc 26 01 08     t....&..X&...&..

08010500 <cpu_yeild>:
 *
 ********************************************************************/
.global cpu_yeild
.type   cpu_yeild, %function
cpu_yeild:
    lrw    r0, VIC_TSPDR
 8010500:	1106      	lrw      	r0, 0xe000ec08	// 8010598 <tspend_handler+0x5c>
    bgeni  r1, 0
 8010502:	ea010001 	movi      	r1, 1
    stw    r1, (r0)
 8010506:	b020      	st.w      	r1, (r0, 0x0)
    rts
 8010508:	783c      	jmp      	r15

0801050a <vPortStartTask>:
 *
 ********************************************************************/
.global vPortStartTask
.type   vPortStartTask, %function
vPortStartTask:
    psrclr   ie
 801050a:	c0807020 	psrclr      	ie
    lrw      r4, pxCurrentTCB
 801050e:	1184      	lrw      	r4, 0x200063c8	// 801059c <tspend_handler+0x60>
    ld.w     r4, (r4)
 8010510:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 8010512:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 8010516:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010518:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 801051c:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 801051e:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 8010522:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010526:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 801052a:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 801052c:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 8010530:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 8010532:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010536:	1412      	addi      	r14, r14, 72

    rte
 8010538:	c0004020 	rte

0801053c <tspend_handler>:
 *
 ********************************************************************/
.global tspend_handler
.type   tspend_handler, %function
tspend_handler:
    subi     sp, 196
 801053c:	1531      	subi      	r14, r14, 196
    stm      r0-r13, (sp)
 801053e:	d40e1c2d 	stm      	r0-r13, (r14)
    stw      r15, (sp, 56)
 8010542:	ddee200e 	st.w      	r15, (r14, 0x38)
    addi     r0, sp, 60
 8010546:	180f      	addi      	r0, r14, 60
    stm      r16-r31, (r0)
 8010548:	d6001c2f 	stm      	r16-r31, (r0)
    addi     r0, 64
 801054c:	203f      	addi      	r0, 64
    fstms    vr0-vr15, (r0)
 801054e:	f5e03400 	fstms      	fr0-fr15, (r0)
    mfcr     r1, epsr
 8010552:	c0026021 	mfcr      	r1, cr<2, 0>
    stw      r1, (r0, 64)
 8010556:	b030      	st.w      	r1, (r0, 0x40)
    mfcr     r1, epc
 8010558:	c0046021 	mfcr      	r1, cr<4, 0>
    stw      r1, (r0, 68)
 801055c:	b031      	st.w      	r1, (r0, 0x44)

    lrw      r2, pxCurrentTCB
 801055e:	1050      	lrw      	r2, 0x200063c8	// 801059c <tspend_handler+0x60>
    ld.w     r3, (r2)
 8010560:	9260      	ld.w      	r3, (r2, 0x0)
    st.w     sp, (r3)
 8010562:	ddc32000 	st.w      	r14, (r3, 0x0)

    jbsr     vTaskSwitchContext
 8010566:	e00018d1 	bsr      	0x8013708	// 8013708 <vTaskSwitchContext>

    lrw      r4, pxCurrentTCB
 801056a:	108d      	lrw      	r4, 0x200063c8	// 801059c <tspend_handler+0x60>
    ld.w     r4, (r4)
 801056c:	9480      	ld.w      	r4, (r4, 0x0)
    ld.w     sp, (r4)
 801056e:	d9c42000 	ld.w      	r14, (r4, 0x0)

    ldw      r0, (sp, 192)
 8010572:	9910      	ld.w      	r0, (r14, 0xc0)
    mtcr     r0, epc
 8010574:	c0006424 	mtcr      	r0, cr<4, 0>
    ldw      r0, (sp, 188)
 8010578:	990f      	ld.w      	r0, (r14, 0xbc)
    mtcr     r0, epsr
 801057a:	c0006422 	mtcr      	r0, cr<2, 0>

    ldm      r0-r13, (sp)
 801057e:	d00e1c2d 	ldm      	r0-r13, (r14)
    ldw      r15, (sp, 56)
 8010582:	d9ee200e 	ld.w      	r15, (r14, 0x38)
    addi     sp, 60
 8010586:	140f      	addi      	r14, r14, 60
    ldm      r16-r31, (sp)
 8010588:	d20e1c2f 	ldm      	r16-r31, (r14)
    addi     sp, 64
 801058c:	1410      	addi      	r14, r14, 64
    fldms    vr0-vr15, (sp)
 801058e:	f5ee3000 	fldms      	fr0-fr15, (r14)
    addi     sp, 72
 8010592:	1412      	addi      	r14, r14, 72

    rte
 8010594:	c0004020 	rte
 8010598:	e000ec08 	.long	0xe000ec08
 801059c:	200063c8 	.long	0x200063c8

080105a0 <Reset_Handler>:
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
#else
    lrw     r0, 0x80000200
 80105a0:	101a      	lrw      	r0, 0x80000200	// 8010608 <__exit+0x4>
    mtcr    r0, psr
 80105a2:	c0006420 	mtcr      	r0, cr<0, 0>
#endif
    mtcr    r0, psr
 80105a6:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 80105aa:	1019      	lrw      	r0, 0x20001170	// 801060c <__exit+0x8>
    mov     sp, r0
 80105ac:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 80105ae:	1039      	lrw      	r1, 0x8010400	// 8010610 <__exit+0xc>
    lrw     r2, __vdata_start__
 80105b0:	1059      	lrw      	r2, 0x20000000	// 8010614 <__exit+0x10>
    lrw     r3, __vdata_end__
 80105b2:	107a      	lrw      	r3, 0x20000100	// 8010618 <__exit+0x14>

    subu    r3, r2
 80105b4:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 80105b6:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 80105b8:	0c08      	bf      	0x80105c8	// 80105c8 <Reset_Handler+0x28>

.L_loopv0:
    ldw     r0, (r1, 0)
 80105ba:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 80105bc:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 80105be:	2103      	addi      	r1, 4
    addi    r2, 4
 80105c0:	2203      	addi      	r2, 4
    subi    r3, 4
 80105c2:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 80105c4:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 80105c6:	0bfa      	bt      	0x80105ba	// 80105ba <Reset_Handler+0x1a>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 80105c8:	1035      	lrw      	r1, 0x80166d8	// 801061c <__exit+0x18>
    lrw     r2, __data_start__
 80105ca:	1056      	lrw      	r2, 0x20000100	// 8010620 <__exit+0x1c>
    lrw     r3, __data_end__
 80105cc:	1076      	lrw      	r3, 0x20000170	// 8010624 <__exit+0x20>

    subu    r3, r2
 80105ce:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 80105d0:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 80105d2:	0c08      	bf      	0x80105e2	// 80105e2 <Reset_Handler+0x42>

.L_loop0:
    ldw     r0, (r1, 0)
 80105d4:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 80105d6:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 80105d8:	2103      	addi      	r1, 4
    addi    r2, 4
 80105da:	2203      	addi      	r2, 4
    subi    r3, 4
 80105dc:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 80105de:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 80105e0:	0bfa      	bt      	0x80105d4	// 80105d4 <Reset_Handler+0x34>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 80105e2:	1032      	lrw      	r1, 0x20000170	// 8010628 <__exit+0x24>
    lrw     r2, __bss_end__
 80105e4:	1052      	lrw      	r2, 0x200069f0	// 801062c <__exit+0x28>

    movi    r0, 0
 80105e6:	3000      	movi      	r0, 0

    subu    r2, r1
 80105e8:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 80105ea:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 80105ec:	0c06      	bf      	0x80105f8	// 80105f8 <Reset_Handler+0x58>

.L_loop1:
    stw     r0, (r1, 0)
 80105ee:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 80105f0:	2103      	addi      	r1, 4
    subi    r2, 4
 80105f2:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 80105f4:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 80105f6:	0bfc      	bt      	0x80105ee	// 80105ee <Reset_Handler+0x4e>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 80105f8:	e0002000 	bsr      	0x80145f8	// 80145f8 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 80105fc:	e0002058 	bsr      	0x80146ac	// 80146ac <board_init>
#endif

    jbsr    main
 8010600:	e0000fe0 	bsr      	0x80125c0	// 80125c0 <main>

08010604 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010604:	0400      	br      	0x8010604	// 8010604 <__exit>
 8010606:	0000      	.short	0x0000
 8010608:	80000200 	.long	0x80000200
 801060c:	20001170 	.long	0x20001170
 8010610:	08010400 	.long	0x08010400
 8010614:	20000000 	.long	0x20000000
 8010618:	20000100 	.long	0x20000100
 801061c:	080166d8 	.long	0x080166d8
 8010620:	20000100 	.long	0x20000100
 8010624:	20000170 	.long	0x20000170
 8010628:	20000170 	.long	0x20000170
 801062c:	200069f0 	.long	0x200069f0

08010630 <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 8010630:	c1007420 	psrset      	ee

    subi    sp, 4
 8010634:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010636:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 801063a:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 801063c:	ea8d000f 	lrw      	r13, 0x20001370	// 8010678 <BLE_IRQHandler+0x4>
    stw     sp, (r13)
 8010640:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 8010644:	ea8e000e 	lrw      	r14, 0x20001370	// 801067c <BLE_IRQHandler+0x8>

    subi    sp, 72
 8010648:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 801064a:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 801064e:	100b      	lrw      	r0, 0x20001370	// 8010678 <BLE_IRQHandler+0x4>
    ldw     r0, (r0)
 8010650:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 8010652:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 8010654:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 8010656:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 801065a:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 801065e:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 8010662:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 8010666:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 8010668:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 801066c:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 801066e:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 8010670:	e0001fe8 	bsr      	0x8014640	// 8014640 <trap_c>

08010674 <BLE_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 8010674:	07de      	br      	0x8010630	// 8010630 <trap>
 8010676:	0000      	.short	0x0000
 8010678:	20001370 	.long	0x20001370
 801067c:	20001370 	.long	0x20001370

08010680 <__fixunsdfsi>:
 8010680:	14d2      	push      	r4-r5, r15
 8010682:	3200      	movi      	r2, 0
 8010684:	ea2341e0 	movih      	r3, 16864
 8010688:	6d03      	mov      	r4, r0
 801068a:	6d47      	mov      	r5, r1
 801068c:	e00006a2 	bsr      	0x80113d0	// 80113d0 <__gedf2>
 8010690:	e9a00007 	bhsz      	r0, 0x801069e	// 801069e <__fixunsdfsi+0x1e>
 8010694:	6c13      	mov      	r0, r4
 8010696:	6c57      	mov      	r1, r5
 8010698:	e0000728 	bsr      	0x80114e8	// 80114e8 <__fixdfsi>
 801069c:	1492      	pop      	r4-r5, r15
 801069e:	3200      	movi      	r2, 0
 80106a0:	ea2341e0 	movih      	r3, 16864
 80106a4:	6c13      	mov      	r0, r4
 80106a6:	6c57      	mov      	r1, r5
 80106a8:	e00004ae 	bsr      	0x8011004	// 8011004 <__subdf3>
 80106ac:	e000071e 	bsr      	0x80114e8	// 80114e8 <__fixdfsi>
 80106b0:	ea238000 	movih      	r3, 32768
 80106b4:	600c      	addu      	r0, r3
 80106b6:	1492      	pop      	r4-r5, r15

080106b8 <__udivdi3>:
 80106b8:	14c5      	push      	r4-r8
 80106ba:	6f4b      	mov      	r13, r2
 80106bc:	6d4f      	mov      	r5, r3
 80106be:	6d03      	mov      	r4, r0
 80106c0:	6f07      	mov      	r12, r1
 80106c2:	e9230054 	bnez      	r3, 0x801076a	// 801076a <__udivdi3+0xb2>
 80106c6:	6484      	cmphs      	r1, r2
 80106c8:	0870      	bt      	0x80107a8	// 80107a8 <__udivdi3+0xf0>
 80106ca:	eb02ffff 	cmphsi      	r2, 65536
 80106ce:	0cc4      	bf      	0x8010856	// 8010856 <__udivdi3+0x19e>
 80106d0:	c6e05023 	bmaski      	r3, 24
 80106d4:	648c      	cmphs      	r3, r2
 80106d6:	3518      	movi      	r5, 24
 80106d8:	3310      	movi      	r3, 16
 80106da:	c4a30c40 	inct      	r5, r3, 0
 80106de:	01dc      	lrw      	r6, 0x8015bb4	// 80109e8 <__udivdi3+0x330>
 80106e0:	c4a24043 	lsr      	r3, r2, r5
 80106e4:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 80106e8:	614c      	addu      	r5, r3
 80106ea:	3320      	movi      	r3, 32
 80106ec:	60d6      	subu      	r3, r5
 80106ee:	e903000c 	bez      	r3, 0x8010706	// 8010706 <__udivdi3+0x4e>
 80106f2:	c462402d 	lsl      	r13, r2, r3
 80106f6:	c4a04045 	lsr      	r5, r0, r5
 80106fa:	c4614022 	lsl      	r2, r1, r3
 80106fe:	c445242c 	or      	r12, r5, r2
 8010702:	c4604024 	lsl      	r4, r0, r3
 8010706:	c60d4841 	lsri      	r1, r13, 16
 801070a:	c42c8022 	divu      	r2, r12, r1
 801070e:	c4228423 	mult      	r3, r2, r1
 8010712:	630e      	subu      	r12, r3
 8010714:	c60c4823 	lsli      	r3, r12, 16
 8010718:	c40d55e5 	zext      	r5, r13, 15, 0
 801071c:	c604484c 	lsri      	r12, r4, 16
 8010720:	c4458420 	mult      	r0, r5, r2
 8010724:	6f0c      	or      	r12, r3
 8010726:	6430      	cmphs      	r12, r0
 8010728:	0808      	bt      	0x8010738	// 8010738 <__udivdi3+0x80>
 801072a:	6334      	addu      	r12, r13
 801072c:	6770      	cmphs      	r12, r13
 801072e:	5a63      	subi      	r3, r2, 1
 8010730:	0c03      	bf      	0x8010736	// 8010736 <__udivdi3+0x7e>
 8010732:	6430      	cmphs      	r12, r0
 8010734:	0d56      	bf      	0x80109e0	// 80109e0 <__udivdi3+0x328>
 8010736:	6c8f      	mov      	r2, r3
 8010738:	6302      	subu      	r12, r0
 801073a:	c42c8020 	divu      	r0, r12, r1
 801073e:	7c40      	mult      	r1, r0
 8010740:	6306      	subu      	r12, r1
 8010742:	c60c482c 	lsli      	r12, r12, 16
 8010746:	c40455e4 	zext      	r4, r4, 15, 0
 801074a:	7d40      	mult      	r5, r0
 801074c:	6d30      	or      	r4, r12
 801074e:	6550      	cmphs      	r4, r5
 8010750:	6c43      	mov      	r1, r0
 8010752:	0808      	bt      	0x8010762	// 8010762 <__udivdi3+0xaa>
 8010754:	6134      	addu      	r4, r13
 8010756:	6750      	cmphs      	r4, r13
 8010758:	5863      	subi      	r3, r0, 1
 801075a:	0d21      	bf      	0x801099c	// 801099c <__udivdi3+0x2e4>
 801075c:	6550      	cmphs      	r4, r5
 801075e:	091f      	bt      	0x801099c	// 801099c <__udivdi3+0x2e4>
 8010760:	2901      	subi      	r1, 2
 8010762:	4210      	lsli      	r0, r2, 16
 8010764:	6c04      	or      	r0, r1
 8010766:	3100      	movi      	r1, 0
 8010768:	1485      	pop      	r4-r8
 801076a:	64c4      	cmphs      	r1, r3
 801076c:	0c6b      	bf      	0x8010842	// 8010842 <__udivdi3+0x18a>
 801076e:	eb03ffff 	cmphsi      	r3, 65536
 8010772:	0c6b      	bf      	0x8010848	// 8010848 <__udivdi3+0x190>
 8010774:	c6e0502c 	bmaski      	r12, 24
 8010778:	64f0      	cmphs      	r12, r3
 801077a:	ea0d0018 	movi      	r13, 24
 801077e:	ea0c0010 	movi      	r12, 16
 8010782:	c58d0c20 	incf      	r12, r13, 0
 8010786:	0386      	lrw      	r4, 0x8015bb4	// 80109e8 <__udivdi3+0x330>
 8010788:	c583404d 	lsr      	r13, r3, r12
 801078c:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 8010790:	6370      	addu      	r13, r12
 8010792:	3520      	movi      	r5, 32
 8010794:	6176      	subu      	r5, r13
 8010796:	e925006c 	bnez      	r5, 0x801086e	// 801086e <__udivdi3+0x1b6>
 801079a:	644c      	cmphs      	r3, r1
 801079c:	0d0d      	bf      	0x80109b6	// 80109b6 <__udivdi3+0x2fe>
 801079e:	6480      	cmphs      	r0, r2
 80107a0:	c4000500 	mvc      	r0
 80107a4:	6c57      	mov      	r1, r5
 80107a6:	1485      	pop      	r4-r8
 80107a8:	e9220006 	bnez      	r2, 0x80107b4	// 80107b4 <__udivdi3+0xfc>
 80107ac:	ea0d0001 	movi      	r13, 1
 80107b0:	c44d802d 	divu      	r13, r13, r2
 80107b4:	eb0dffff 	cmphsi      	r13, 65536
 80107b8:	0c55      	bf      	0x8010862	// 8010862 <__udivdi3+0x1aa>
 80107ba:	c6e05023 	bmaski      	r3, 24
 80107be:	674c      	cmphs      	r3, r13
 80107c0:	3518      	movi      	r5, 24
 80107c2:	3310      	movi      	r3, 16
 80107c4:	c4a30c40 	inct      	r5, r3, 0
 80107c8:	0357      	lrw      	r2, 0x8015bb4	// 80109e8 <__udivdi3+0x330>
 80107ca:	c4ad4043 	lsr      	r3, r13, r5
 80107ce:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 80107d2:	614c      	addu      	r5, r3
 80107d4:	3620      	movi      	r6, 32
 80107d6:	6196      	subu      	r6, r5
 80107d8:	e926009f 	bnez      	r6, 0x8010916	// 8010916 <__udivdi3+0x25e>
 80107dc:	c5a10082 	subu      	r2, r1, r13
 80107e0:	c60d4846 	lsri      	r6, r13, 16
 80107e4:	c40d55e5 	zext      	r5, r13, 15, 0
 80107e8:	3101      	movi      	r1, 1
 80107ea:	c4c2802c 	divu      	r12, r2, r6
 80107ee:	c4cc8423 	mult      	r3, r12, r6
 80107f2:	608e      	subu      	r2, r3
 80107f4:	4250      	lsli      	r2, r2, 16
 80107f6:	4c70      	lsri      	r3, r4, 16
 80107f8:	c4ac8420 	mult      	r0, r12, r5
 80107fc:	6cc8      	or      	r3, r2
 80107fe:	640c      	cmphs      	r3, r0
 8010800:	0809      	bt      	0x8010812	// 8010812 <__udivdi3+0x15a>
 8010802:	60f4      	addu      	r3, r13
 8010804:	674c      	cmphs      	r3, r13
 8010806:	e44c1000 	subi      	r2, r12, 1
 801080a:	0c03      	bf      	0x8010810	// 8010810 <__udivdi3+0x158>
 801080c:	640c      	cmphs      	r3, r0
 801080e:	0ce5      	bf      	0x80109d8	// 80109d8 <__udivdi3+0x320>
 8010810:	6f0b      	mov      	r12, r2
 8010812:	60c2      	subu      	r3, r0
 8010814:	c4c38020 	divu      	r0, r3, r6
 8010818:	7d80      	mult      	r6, r0
 801081a:	60da      	subu      	r3, r6
 801081c:	4370      	lsli      	r3, r3, 16
 801081e:	c40455e4 	zext      	r4, r4, 15, 0
 8010822:	7d40      	mult      	r5, r0
 8010824:	6cd0      	or      	r3, r4
 8010826:	654c      	cmphs      	r3, r5
 8010828:	6c83      	mov      	r2, r0
 801082a:	0808      	bt      	0x801083a	// 801083a <__udivdi3+0x182>
 801082c:	60f4      	addu      	r3, r13
 801082e:	674c      	cmphs      	r3, r13
 8010830:	2800      	subi      	r0, 1
 8010832:	0cb3      	bf      	0x8010998	// 8010998 <__udivdi3+0x2e0>
 8010834:	654c      	cmphs      	r3, r5
 8010836:	08b1      	bt      	0x8010998	// 8010998 <__udivdi3+0x2e0>
 8010838:	2a01      	subi      	r2, 2
 801083a:	c60c4820 	lsli      	r0, r12, 16
 801083e:	6c08      	or      	r0, r2
 8010840:	1485      	pop      	r4-r8
 8010842:	3100      	movi      	r1, 0
 8010844:	6c07      	mov      	r0, r1
 8010846:	1485      	pop      	r4-r8
 8010848:	eb0300ff 	cmphsi      	r3, 256
 801084c:	c400050d 	mvc      	r13
 8010850:	c46d482c 	lsli      	r12, r13, 3
 8010854:	0799      	br      	0x8010786	// 8010786 <__udivdi3+0xce>
 8010856:	eb0200ff 	cmphsi      	r2, 256
 801085a:	3308      	movi      	r3, 8
 801085c:	c4a30c40 	inct      	r5, r3, 0
 8010860:	073f      	br      	0x80106de	// 80106de <__udivdi3+0x26>
 8010862:	eb0d00ff 	cmphsi      	r13, 256
 8010866:	3308      	movi      	r3, 8
 8010868:	c4a30c40 	inct      	r5, r3, 0
 801086c:	07ae      	br      	0x80107c8	// 80107c8 <__udivdi3+0x110>
 801086e:	c5a24046 	lsr      	r6, r2, r13
 8010872:	70d4      	lsl      	r3, r5
 8010874:	6d8c      	or      	r6, r3
 8010876:	c5a14044 	lsr      	r4, r1, r13
 801087a:	4ef0      	lsri      	r7, r6, 16
 801087c:	c4e48023 	divu      	r3, r4, r7
 8010880:	c4a1402c 	lsl      	r12, r1, r5
 8010884:	c5a04041 	lsr      	r1, r0, r13
 8010888:	c4e3842d 	mult      	r13, r3, r7
 801088c:	6c70      	or      	r1, r12
 801088e:	6136      	subu      	r4, r13
 8010890:	c40655ec 	zext      	r12, r6, 15, 0
 8010894:	4490      	lsli      	r4, r4, 16
 8010896:	c601484d 	lsri      	r13, r1, 16
 801089a:	c46c8428 	mult      	r8, r12, r3
 801089e:	6f50      	or      	r13, r4
 80108a0:	6634      	cmphs      	r13, r8
 80108a2:	7094      	lsl      	r2, r5
 80108a4:	0806      	bt      	0x80108b0	// 80108b0 <__udivdi3+0x1f8>
 80108a6:	6358      	addu      	r13, r6
 80108a8:	65b4      	cmphs      	r13, r6
 80108aa:	5b83      	subi      	r4, r3, 1
 80108ac:	088d      	bt      	0x80109c6	// 80109c6 <__udivdi3+0x30e>
 80108ae:	6cd3      	mov      	r3, r4
 80108b0:	6362      	subu      	r13, r8
 80108b2:	c4ed8024 	divu      	r4, r13, r7
 80108b6:	7dd0      	mult      	r7, r4
 80108b8:	635e      	subu      	r13, r7
 80108ba:	c60d482d 	lsli      	r13, r13, 16
 80108be:	c48c8427 	mult      	r7, r12, r4
 80108c2:	c40155ec 	zext      	r12, r1, 15, 0
 80108c6:	6f34      	or      	r12, r13
 80108c8:	65f0      	cmphs      	r12, r7
 80108ca:	0806      	bt      	0x80108d6	// 80108d6 <__udivdi3+0x21e>
 80108cc:	6318      	addu      	r12, r6
 80108ce:	65b0      	cmphs      	r12, r6
 80108d0:	5c23      	subi      	r1, r4, 1
 80108d2:	0875      	bt      	0x80109bc	// 80109bc <__udivdi3+0x304>
 80108d4:	6d07      	mov      	r4, r1
 80108d6:	4370      	lsli      	r3, r3, 16
 80108d8:	6cd0      	or      	r3, r4
 80108da:	c40355e1 	zext      	r1, r3, 15, 0
 80108de:	c40255e4 	zext      	r4, r2, 15, 0
 80108e2:	c603484d 	lsri      	r13, r3, 16
 80108e6:	4a50      	lsri      	r2, r2, 16
 80108e8:	c4818426 	mult      	r6, r1, r4
 80108ec:	7d34      	mult      	r4, r13
 80108ee:	7c48      	mult      	r1, r2
 80108f0:	7f48      	mult      	r13, r2
 80108f2:	6050      	addu      	r1, r4
 80108f4:	4e50      	lsri      	r2, r6, 16
 80108f6:	6084      	addu      	r2, r1
 80108f8:	6508      	cmphs      	r2, r4
 80108fa:	631e      	subu      	r12, r7
 80108fc:	0804      	bt      	0x8010904	// 8010904 <__udivdi3+0x24c>
 80108fe:	ea210001 	movih      	r1, 1
 8010902:	6344      	addu      	r13, r1
 8010904:	4a30      	lsri      	r1, r2, 16
 8010906:	6344      	addu      	r13, r1
 8010908:	6770      	cmphs      	r12, r13
 801090a:	0c53      	bf      	0x80109b0	// 80109b0 <__udivdi3+0x2f8>
 801090c:	6772      	cmpne      	r12, r13
 801090e:	0c49      	bf      	0x80109a0	// 80109a0 <__udivdi3+0x2e8>
 8010910:	6c0f      	mov      	r0, r3
 8010912:	3100      	movi      	r1, 0
 8010914:	1485      	pop      	r4-r8
 8010916:	7358      	lsl      	r13, r6
 8010918:	c4a1404c 	lsr      	r12, r1, r5
 801091c:	c4c14022 	lsl      	r2, r1, r6
 8010920:	c4c04024 	lsl      	r4, r0, r6
 8010924:	c60d4846 	lsri      	r6, r13, 16
 8010928:	c4a04045 	lsr      	r5, r0, r5
 801092c:	c4cc8020 	divu      	r0, r12, r6
 8010930:	c4c08421 	mult      	r1, r0, r6
 8010934:	c4452423 	or      	r3, r5, r2
 8010938:	6306      	subu      	r12, r1
 801093a:	c40d55e5 	zext      	r5, r13, 15, 0
 801093e:	c60c482c 	lsli      	r12, r12, 16
 8010942:	4b30      	lsri      	r1, r3, 16
 8010944:	c4058422 	mult      	r2, r5, r0
 8010948:	6c70      	or      	r1, r12
 801094a:	6484      	cmphs      	r1, r2
 801094c:	080a      	bt      	0x8010960	// 8010960 <__udivdi3+0x2a8>
 801094e:	6074      	addu      	r1, r13
 8010950:	6744      	cmphs      	r1, r13
 8010952:	e5801000 	subi      	r12, r0, 1
 8010956:	0c3f      	bf      	0x80109d4	// 80109d4 <__udivdi3+0x31c>
 8010958:	6484      	cmphs      	r1, r2
 801095a:	083d      	bt      	0x80109d4	// 80109d4 <__udivdi3+0x31c>
 801095c:	2801      	subi      	r0, 2
 801095e:	6074      	addu      	r1, r13
 8010960:	604a      	subu      	r1, r2
 8010962:	c4c1802c 	divu      	r12, r1, r6
 8010966:	c4cc8422 	mult      	r2, r12, r6
 801096a:	5949      	subu      	r2, r1, r2
 801096c:	4250      	lsli      	r2, r2, 16
 801096e:	c40355e3 	zext      	r3, r3, 15, 0
 8010972:	c5858421 	mult      	r1, r5, r12
 8010976:	6c8c      	or      	r2, r3
 8010978:	6448      	cmphs      	r2, r1
 801097a:	080b      	bt      	0x8010990	// 8010990 <__udivdi3+0x2d8>
 801097c:	60b4      	addu      	r2, r13
 801097e:	6748      	cmphs      	r2, r13
 8010980:	e46c1000 	subi      	r3, r12, 1
 8010984:	0c26      	bf      	0x80109d0	// 80109d0 <__udivdi3+0x318>
 8010986:	6448      	cmphs      	r2, r1
 8010988:	0824      	bt      	0x80109d0	// 80109d0 <__udivdi3+0x318>
 801098a:	e58c1001 	subi      	r12, r12, 2
 801098e:	60b4      	addu      	r2, r13
 8010990:	6086      	subu      	r2, r1
 8010992:	4030      	lsli      	r1, r0, 16
 8010994:	6c70      	or      	r1, r12
 8010996:	072a      	br      	0x80107ea	// 80107ea <__udivdi3+0x132>
 8010998:	6c83      	mov      	r2, r0
 801099a:	0750      	br      	0x801083a	// 801083a <__udivdi3+0x182>
 801099c:	6c4f      	mov      	r1, r3
 801099e:	06e2      	br      	0x8010762	// 8010762 <__udivdi3+0xaa>
 80109a0:	4250      	lsli      	r2, r2, 16
 80109a2:	c40655e6 	zext      	r6, r6, 15, 0
 80109a6:	c4a04021 	lsl      	r1, r0, r5
 80109aa:	6098      	addu      	r2, r6
 80109ac:	6484      	cmphs      	r1, r2
 80109ae:	0bb1      	bt      	0x8010910	// 8010910 <__udivdi3+0x258>
 80109b0:	5b03      	subi      	r0, r3, 1
 80109b2:	3100      	movi      	r1, 0
 80109b4:	1485      	pop      	r4-r8
 80109b6:	6c57      	mov      	r1, r5
 80109b8:	3001      	movi      	r0, 1
 80109ba:	1485      	pop      	r4-r8
 80109bc:	65f0      	cmphs      	r12, r7
 80109be:	0b8b      	bt      	0x80108d4	// 80108d4 <__udivdi3+0x21c>
 80109c0:	2c01      	subi      	r4, 2
 80109c2:	6318      	addu      	r12, r6
 80109c4:	0789      	br      	0x80108d6	// 80108d6 <__udivdi3+0x21e>
 80109c6:	6634      	cmphs      	r13, r8
 80109c8:	0b73      	bt      	0x80108ae	// 80108ae <__udivdi3+0x1f6>
 80109ca:	2b01      	subi      	r3, 2
 80109cc:	6358      	addu      	r13, r6
 80109ce:	0771      	br      	0x80108b0	// 80108b0 <__udivdi3+0x1f8>
 80109d0:	6f0f      	mov      	r12, r3
 80109d2:	07df      	br      	0x8010990	// 8010990 <__udivdi3+0x2d8>
 80109d4:	6c33      	mov      	r0, r12
 80109d6:	07c5      	br      	0x8010960	// 8010960 <__udivdi3+0x2a8>
 80109d8:	e58c1001 	subi      	r12, r12, 2
 80109dc:	60f4      	addu      	r3, r13
 80109de:	071a      	br      	0x8010812	// 8010812 <__udivdi3+0x15a>
 80109e0:	2a01      	subi      	r2, 2
 80109e2:	6334      	addu      	r12, r13
 80109e4:	06aa      	br      	0x8010738	// 8010738 <__udivdi3+0x80>
 80109e6:	0000      	.short	0x0000
 80109e8:	08015bb4 	.long	0x08015bb4

080109ec <__umoddi3>:
 80109ec:	14c6      	push      	r4-r9
 80109ee:	6d4b      	mov      	r5, r2
 80109f0:	6f4f      	mov      	r13, r3
 80109f2:	6d83      	mov      	r6, r0
 80109f4:	6f07      	mov      	r12, r1
 80109f6:	e923004a 	bnez      	r3, 0x8010a8a	// 8010a8a <__umoddi3+0x9e>
 80109fa:	6484      	cmphs      	r1, r2
 80109fc:	086b      	bt      	0x8010ad2	// 8010ad2 <__umoddi3+0xe6>
 80109fe:	eb02ffff 	cmphsi      	r2, 65536
 8010a02:	0cc0      	bf      	0x8010b82	// 8010b82 <__umoddi3+0x196>
 8010a04:	c6e05023 	bmaski      	r3, 24
 8010a08:	648c      	cmphs      	r3, r2
 8010a0a:	ea0d0018 	movi      	r13, 24
 8010a0e:	3310      	movi      	r3, 16
 8010a10:	c5a30c40 	inct      	r13, r3, 0
 8010a14:	0281      	lrw      	r4, 0x8015bb4	// 8010d0c <__umoddi3+0x320>
 8010a16:	c5a24043 	lsr      	r3, r2, r13
 8010a1a:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 8010a1e:	634c      	addu      	r13, r3
 8010a20:	3420      	movi      	r4, 32
 8010a22:	6136      	subu      	r4, r13
 8010a24:	e904000b 	bez      	r4, 0x8010a3a	// 8010a3a <__umoddi3+0x4e>
 8010a28:	7050      	lsl      	r1, r4
 8010a2a:	c5a0404d 	lsr      	r13, r0, r13
 8010a2e:	c4824025 	lsl      	r5, r2, r4
 8010a32:	c42d242c 	or      	r12, r13, r1
 8010a36:	c4804026 	lsl      	r6, r0, r4
 8010a3a:	c605484d 	lsri      	r13, r5, 16
 8010a3e:	c5ac8021 	divu      	r1, r12, r13
 8010a42:	c5a18422 	mult      	r2, r1, r13
 8010a46:	c40555e0 	zext      	r0, r5, 15, 0
 8010a4a:	c44c0082 	subu      	r2, r12, r2
 8010a4e:	c4208423 	mult      	r3, r0, r1
 8010a52:	4250      	lsli      	r2, r2, 16
 8010a54:	4e30      	lsri      	r1, r6, 16
 8010a56:	6c48      	or      	r1, r2
 8010a58:	64c4      	cmphs      	r1, r3
 8010a5a:	0808      	bt      	0x8010a6a	// 8010a6a <__umoddi3+0x7e>
 8010a5c:	6054      	addu      	r1, r5
 8010a5e:	6544      	cmphs      	r1, r5
 8010a60:	0c05      	bf      	0x8010a6a	// 8010a6a <__umoddi3+0x7e>
 8010a62:	5954      	addu      	r2, r1, r5
 8010a64:	64c4      	cmphs      	r1, r3
 8010a66:	c4220c20 	incf      	r1, r2, 0
 8010a6a:	604e      	subu      	r1, r3
 8010a6c:	c5a18023 	divu      	r3, r1, r13
 8010a70:	7f4c      	mult      	r13, r3
 8010a72:	6076      	subu      	r1, r13
 8010a74:	7c0c      	mult      	r0, r3
 8010a76:	4130      	lsli      	r1, r1, 16
 8010a78:	c40655e3 	zext      	r3, r6, 15, 0
 8010a7c:	6cc4      	or      	r3, r1
 8010a7e:	640c      	cmphs      	r3, r0
 8010a80:	0c69      	bf      	0x8010b52	// 8010b52 <__umoddi3+0x166>
 8010a82:	5b01      	subu      	r0, r3, r0
 8010a84:	7011      	lsr      	r0, r4
 8010a86:	3100      	movi      	r1, 0
 8010a88:	1486      	pop      	r4-r9
 8010a8a:	64c4      	cmphs      	r1, r3
 8010a8c:	0ffe      	bf      	0x8010a88	// 8010a88 <__umoddi3+0x9c>
 8010a8e:	eb03ffff 	cmphsi      	r3, 65536
 8010a92:	0c6b      	bf      	0x8010b68	// 8010b68 <__umoddi3+0x17c>
 8010a94:	c6e0502d 	bmaski      	r13, 24
 8010a98:	64f4      	cmphs      	r13, r3
 8010a9a:	3518      	movi      	r5, 24
 8010a9c:	ea0d0010 	movi      	r13, 16
 8010aa0:	c5a50c20 	incf      	r13, r5, 0
 8010aa4:	03a5      	lrw      	r5, 0x8015bb4	// 8010d0c <__umoddi3+0x320>
 8010aa6:	c5a34044 	lsr      	r4, r3, r13
 8010aaa:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010aae:	6174      	addu      	r5, r13
 8010ab0:	3420      	movi      	r4, 32
 8010ab2:	6116      	subu      	r4, r5
 8010ab4:	e924006d 	bnez      	r4, 0x8010b8e	// 8010b8e <__umoddi3+0x1a2>
 8010ab8:	644c      	cmphs      	r3, r1
 8010aba:	0c03      	bf      	0x8010ac0	// 8010ac0 <__umoddi3+0xd4>
 8010abc:	6480      	cmphs      	r0, r2
 8010abe:	0d20      	bf      	0x8010cfe	// 8010cfe <__umoddi3+0x312>
 8010ac0:	5889      	subu      	r4, r0, r2
 8010ac2:	6500      	cmphs      	r0, r4
 8010ac4:	c461008c 	subu      	r12, r1, r3
 8010ac8:	6443      	mvcv      	r1
 8010aca:	6306      	subu      	r12, r1
 8010acc:	6c13      	mov      	r0, r4
 8010ace:	6c73      	mov      	r1, r12
 8010ad0:	1486      	pop      	r4-r9
 8010ad2:	e9220005 	bnez      	r2, 0x8010adc	// 8010adc <__umoddi3+0xf0>
 8010ad6:	3501      	movi      	r5, 1
 8010ad8:	c4458025 	divu      	r5, r5, r2
 8010adc:	eb05ffff 	cmphsi      	r5, 65536
 8010ae0:	0c4b      	bf      	0x8010b76	// 8010b76 <__umoddi3+0x18a>
 8010ae2:	c6e05023 	bmaski      	r3, 24
 8010ae6:	654c      	cmphs      	r3, r5
 8010ae8:	ea0d0018 	movi      	r13, 24
 8010aec:	3310      	movi      	r3, 16
 8010aee:	c5a30c40 	inct      	r13, r3, 0
 8010af2:	0358      	lrw      	r2, 0x8015bb4	// 8010d0c <__umoddi3+0x320>
 8010af4:	c5a54043 	lsr      	r3, r5, r13
 8010af8:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010afc:	634c      	addu      	r13, r3
 8010afe:	3420      	movi      	r4, 32
 8010b00:	6136      	subu      	r4, r13
 8010b02:	e92400af 	bnez      	r4, 0x8010c60	// 8010c60 <__umoddi3+0x274>
 8010b06:	c4a1008c 	subu      	r12, r1, r5
 8010b0a:	4df0      	lsri      	r7, r5, 16
 8010b0c:	c40555e2 	zext      	r2, r5, 15, 0
 8010b10:	c4ec8021 	divu      	r1, r12, r7
 8010b14:	c4e18423 	mult      	r3, r1, r7
 8010b18:	630e      	subu      	r12, r3
 8010b1a:	c60c482c 	lsli      	r12, r12, 16
 8010b1e:	c4418423 	mult      	r3, r1, r2
 8010b22:	4e30      	lsri      	r1, r6, 16
 8010b24:	6c70      	or      	r1, r12
 8010b26:	64c4      	cmphs      	r1, r3
 8010b28:	0808      	bt      	0x8010b38	// 8010b38 <__umoddi3+0x14c>
 8010b2a:	6054      	addu      	r1, r5
 8010b2c:	6544      	cmphs      	r1, r5
 8010b2e:	0c05      	bf      	0x8010b38	// 8010b38 <__umoddi3+0x14c>
 8010b30:	5914      	addu      	r0, r1, r5
 8010b32:	64c4      	cmphs      	r1, r3
 8010b34:	c4200c20 	incf      	r1, r0, 0
 8010b38:	604e      	subu      	r1, r3
 8010b3a:	c4e18020 	divu      	r0, r1, r7
 8010b3e:	7dc0      	mult      	r7, r0
 8010b40:	605e      	subu      	r1, r7
 8010b42:	4130      	lsli      	r1, r1, 16
 8010b44:	c40655e6 	zext      	r6, r6, 15, 0
 8010b48:	7c08      	mult      	r0, r2
 8010b4a:	c4c12423 	or      	r3, r1, r6
 8010b4e:	640c      	cmphs      	r3, r0
 8010b50:	0808      	bt      	0x8010b60	// 8010b60 <__umoddi3+0x174>
 8010b52:	60d4      	addu      	r3, r5
 8010b54:	654c      	cmphs      	r3, r5
 8010b56:	0c05      	bf      	0x8010b60	// 8010b60 <__umoddi3+0x174>
 8010b58:	614c      	addu      	r5, r3
 8010b5a:	640c      	cmphs      	r3, r0
 8010b5c:	c4650c20 	incf      	r3, r5, 0
 8010b60:	5b01      	subu      	r0, r3, r0
 8010b62:	7011      	lsr      	r0, r4
 8010b64:	3100      	movi      	r1, 0
 8010b66:	1486      	pop      	r4-r9
 8010b68:	eb0300ff 	cmphsi      	r3, 256
 8010b6c:	c4000505 	mvc      	r5
 8010b70:	c465482d 	lsli      	r13, r5, 3
 8010b74:	0798      	br      	0x8010aa4	// 8010aa4 <__umoddi3+0xb8>
 8010b76:	eb0500ff 	cmphsi      	r5, 256
 8010b7a:	3308      	movi      	r3, 8
 8010b7c:	c5a30c40 	inct      	r13, r3, 0
 8010b80:	07b9      	br      	0x8010af2	// 8010af2 <__umoddi3+0x106>
 8010b82:	eb0200ff 	cmphsi      	r2, 256
 8010b86:	3308      	movi      	r3, 8
 8010b88:	c5a30c40 	inct      	r13, r3, 0
 8010b8c:	0744      	br      	0x8010a14	// 8010a14 <__umoddi3+0x28>
 8010b8e:	70d0      	lsl      	r3, r4
 8010b90:	c4a24047 	lsr      	r7, r2, r5
 8010b94:	6dcc      	or      	r7, r3
 8010b96:	c4a14046 	lsr      	r6, r1, r5
 8010b9a:	c481402c 	lsl      	r12, r1, r4
 8010b9e:	c4a04041 	lsr      	r1, r0, r5
 8010ba2:	6c70      	or      	r1, r12
 8010ba4:	c607484c 	lsri      	r12, r7, 16
 8010ba8:	c5868028 	divu      	r8, r6, r12
 8010bac:	c4824023 	lsl      	r3, r2, r4
 8010bb0:	c5888422 	mult      	r2, r8, r12
 8010bb4:	618a      	subu      	r6, r2
 8010bb6:	c40755ed 	zext      	r13, r7, 15, 0
 8010bba:	46d0      	lsli      	r6, r6, 16
 8010bbc:	4950      	lsri      	r2, r1, 16
 8010bbe:	c50d8429 	mult      	r9, r13, r8
 8010bc2:	6c98      	or      	r2, r6
 8010bc4:	6648      	cmphs      	r2, r9
 8010bc6:	7010      	lsl      	r0, r4
 8010bc8:	0807      	bt      	0x8010bd6	// 8010bd6 <__umoddi3+0x1ea>
 8010bca:	609c      	addu      	r2, r7
 8010bcc:	65c8      	cmphs      	r2, r7
 8010bce:	e4c81000 	subi      	r6, r8, 1
 8010bd2:	088a      	bt      	0x8010ce6	// 8010ce6 <__umoddi3+0x2fa>
 8010bd4:	6e1b      	mov      	r8, r6
 8010bd6:	60a6      	subu      	r2, r9
 8010bd8:	c5828026 	divu      	r6, r2, r12
 8010bdc:	7f18      	mult      	r12, r6
 8010bde:	60b2      	subu      	r2, r12
 8010be0:	4250      	lsli      	r2, r2, 16
 8010be2:	c40155e1 	zext      	r1, r1, 15, 0
 8010be6:	7f58      	mult      	r13, r6
 8010be8:	6c48      	or      	r1, r2
 8010bea:	6744      	cmphs      	r1, r13
 8010bec:	0806      	bt      	0x8010bf8	// 8010bf8 <__umoddi3+0x20c>
 8010bee:	605c      	addu      	r1, r7
 8010bf0:	65c4      	cmphs      	r1, r7
 8010bf2:	5e43      	subi      	r2, r6, 1
 8010bf4:	0874      	bt      	0x8010cdc	// 8010cdc <__umoddi3+0x2f0>
 8010bf6:	6d8b      	mov      	r6, r2
 8010bf8:	c6084822 	lsli      	r2, r8, 16
 8010bfc:	6c98      	or      	r2, r6
 8010bfe:	c40255e8 	zext      	r8, r2, 15, 0
 8010c02:	c603484c 	lsri      	r12, r3, 16
 8010c06:	4a50      	lsri      	r2, r2, 16
 8010c08:	c5a1008d 	subu      	r13, r1, r13
 8010c0c:	c40355e1 	zext      	r1, r3, 15, 0
 8010c10:	c4288426 	mult      	r6, r8, r1
 8010c14:	7c48      	mult      	r1, r2
 8010c16:	7e30      	mult      	r8, r12
 8010c18:	7cb0      	mult      	r2, r12
 8010c1a:	6204      	addu      	r8, r1
 8010c1c:	c606484c 	lsri      	r12, r6, 16
 8010c20:	6320      	addu      	r12, r8
 8010c22:	6470      	cmphs      	r12, r1
 8010c24:	0804      	bt      	0x8010c2c	// 8010c2c <__umoddi3+0x240>
 8010c26:	ea210001 	movih      	r1, 1
 8010c2a:	6084      	addu      	r2, r1
 8010c2c:	c60c4841 	lsri      	r1, r12, 16
 8010c30:	6048      	addu      	r1, r2
 8010c32:	6474      	cmphs      	r13, r1
 8010c34:	c60c482c 	lsli      	r12, r12, 16
 8010c38:	c40655e6 	zext      	r6, r6, 15, 0
 8010c3c:	6318      	addu      	r12, r6
 8010c3e:	0c46      	bf      	0x8010cca	// 8010cca <__umoddi3+0x2de>
 8010c40:	6476      	cmpne      	r13, r1
 8010c42:	0c60      	bf      	0x8010d02	// 8010d02 <__umoddi3+0x316>
 8010c44:	c42d0081 	subu      	r1, r13, r1
 8010c48:	6cf3      	mov      	r3, r12
 8010c4a:	586d      	subu      	r3, r0, r3
 8010c4c:	64c0      	cmphs      	r0, r3
 8010c4e:	6743      	mvcv      	r13
 8010c50:	6076      	subu      	r1, r13
 8010c52:	c4a14025 	lsl      	r5, r1, r5
 8010c56:	c4834040 	lsr      	r0, r3, r4
 8010c5a:	6c14      	or      	r0, r5
 8010c5c:	7051      	lsr      	r1, r4
 8010c5e:	1486      	pop      	r4-r9
 8010c60:	7150      	lsl      	r5, r4
 8010c62:	c5a14048 	lsr      	r8, r1, r13
 8010c66:	4df0      	lsri      	r7, r5, 16
 8010c68:	c5a0404d 	lsr      	r13, r0, r13
 8010c6c:	7050      	lsl      	r1, r4
 8010c6e:	6c74      	or      	r1, r13
 8010c70:	c4e8802d 	divu      	r13, r8, r7
 8010c74:	c4ed8423 	mult      	r3, r13, r7
 8010c78:	c40555e2 	zext      	r2, r5, 15, 0
 8010c7c:	620e      	subu      	r8, r3
 8010c7e:	c5a2842c 	mult      	r12, r2, r13
 8010c82:	c6084828 	lsli      	r8, r8, 16
 8010c86:	c601484d 	lsri      	r13, r1, 16
 8010c8a:	6f60      	or      	r13, r8
 8010c8c:	6734      	cmphs      	r13, r12
 8010c8e:	c4804026 	lsl      	r6, r0, r4
 8010c92:	0804      	bt      	0x8010c9a	// 8010c9a <__umoddi3+0x2ae>
 8010c94:	6354      	addu      	r13, r5
 8010c96:	6574      	cmphs      	r13, r5
 8010c98:	082d      	bt      	0x8010cf2	// 8010cf2 <__umoddi3+0x306>
 8010c9a:	6372      	subu      	r13, r12
 8010c9c:	c4ed8023 	divu      	r3, r13, r7
 8010ca0:	c4e3842c 	mult      	r12, r3, r7
 8010ca4:	6372      	subu      	r13, r12
 8010ca6:	c60d482c 	lsli      	r12, r13, 16
 8010caa:	c40155e1 	zext      	r1, r1, 15, 0
 8010cae:	7cc8      	mult      	r3, r2
 8010cb0:	6f04      	or      	r12, r1
 8010cb2:	64f0      	cmphs      	r12, r3
 8010cb4:	0809      	bt      	0x8010cc6	// 8010cc6 <__umoddi3+0x2da>
 8010cb6:	6314      	addu      	r12, r5
 8010cb8:	6570      	cmphs      	r12, r5
 8010cba:	0c06      	bf      	0x8010cc6	// 8010cc6 <__umoddi3+0x2da>
 8010cbc:	c4ac0021 	addu      	r1, r12, r5
 8010cc0:	64f0      	cmphs      	r12, r3
 8010cc2:	c5810c20 	incf      	r12, r1, 0
 8010cc6:	630e      	subu      	r12, r3
 8010cc8:	0724      	br      	0x8010b10	// 8010b10 <__umoddi3+0x124>
 8010cca:	c46c0083 	subu      	r3, r12, r3
 8010cce:	64f0      	cmphs      	r12, r3
 8010cd0:	605e      	subu      	r1, r7
 8010cd2:	65c3      	mvcv      	r7
 8010cd4:	605e      	subu      	r1, r7
 8010cd6:	c42d0081 	subu      	r1, r13, r1
 8010cda:	07b8      	br      	0x8010c4a	// 8010c4a <__umoddi3+0x25e>
 8010cdc:	6744      	cmphs      	r1, r13
 8010cde:	0b8c      	bt      	0x8010bf6	// 8010bf6 <__umoddi3+0x20a>
 8010ce0:	2e01      	subi      	r6, 2
 8010ce2:	605c      	addu      	r1, r7
 8010ce4:	078a      	br      	0x8010bf8	// 8010bf8 <__umoddi3+0x20c>
 8010ce6:	6648      	cmphs      	r2, r9
 8010ce8:	0b76      	bt      	0x8010bd4	// 8010bd4 <__umoddi3+0x1e8>
 8010cea:	e5081001 	subi      	r8, r8, 2
 8010cee:	609c      	addu      	r2, r7
 8010cf0:	0773      	br      	0x8010bd6	// 8010bd6 <__umoddi3+0x1ea>
 8010cf2:	c4ad0023 	addu      	r3, r13, r5
 8010cf6:	6734      	cmphs      	r13, r12
 8010cf8:	c5a30c20 	incf      	r13, r3, 0
 8010cfc:	07cf      	br      	0x8010c9a	// 8010c9a <__umoddi3+0x2ae>
 8010cfe:	6d03      	mov      	r4, r0
 8010d00:	06e6      	br      	0x8010acc	// 8010acc <__umoddi3+0xe0>
 8010d02:	6700      	cmphs      	r0, r12
 8010d04:	0fe3      	bf      	0x8010cca	// 8010cca <__umoddi3+0x2de>
 8010d06:	6cf3      	mov      	r3, r12
 8010d08:	3100      	movi      	r1, 0
 8010d0a:	07a0      	br      	0x8010c4a	// 8010c4a <__umoddi3+0x25e>
 8010d0c:	08015bb4 	.long	0x08015bb4

08010d10 <_fpadd_parts>:
 8010d10:	14c8      	push      	r4-r11
 8010d12:	1423      	subi      	r14, r14, 12
 8010d14:	9060      	ld.w      	r3, (r0, 0x0)
 8010d16:	3501      	movi      	r5, 1
 8010d18:	64d4      	cmphs      	r5, r3
 8010d1a:	0871      	bt      	0x8010dfc	// 8010dfc <_fpadd_parts+0xec>
 8010d1c:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010d20:	6714      	cmphs      	r5, r12
 8010d22:	086f      	bt      	0x8010e00	// 8010e00 <_fpadd_parts+0xf0>
 8010d24:	3b44      	cmpnei      	r3, 4
 8010d26:	0cef      	bf      	0x8010f04	// 8010f04 <_fpadd_parts+0x1f4>
 8010d28:	eb4c0004 	cmpnei      	r12, 4
 8010d2c:	0c6a      	bf      	0x8010e00	// 8010e00 <_fpadd_parts+0xf0>
 8010d2e:	eb4c0002 	cmpnei      	r12, 2
 8010d32:	0cc7      	bf      	0x8010ec0	// 8010ec0 <_fpadd_parts+0x1b0>
 8010d34:	3b42      	cmpnei      	r3, 2
 8010d36:	0c65      	bf      	0x8010e00	// 8010e00 <_fpadd_parts+0xf0>
 8010d38:	9062      	ld.w      	r3, (r0, 0x8)
 8010d3a:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010d3e:	c583008d 	subu      	r13, r3, r12
 8010d42:	c40d0208 	abs      	r8, r13
 8010d46:	eb28003f 	cmplti      	r8, 64
 8010d4a:	90c3      	ld.w      	r6, (r0, 0xc)
 8010d4c:	90e4      	ld.w      	r7, (r0, 0x10)
 8010d4e:	b8c0      	st.w      	r6, (r14, 0x0)
 8010d50:	b8e1      	st.w      	r7, (r14, 0x4)
 8010d52:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010d56:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010d5a:	0856      	bt      	0x8010e06	// 8010e06 <_fpadd_parts+0xf6>
 8010d5c:	64f1      	cmplt      	r12, r3
 8010d5e:	0cc9      	bf      	0x8010ef0	// 8010ef0 <_fpadd_parts+0x1e0>
 8010d60:	ea0a0000 	movi      	r10, 0
 8010d64:	ea0b0000 	movi      	r11, 0
 8010d68:	9001      	ld.w      	r0, (r0, 0x4)
 8010d6a:	9121      	ld.w      	r1, (r1, 0x4)
 8010d6c:	6442      	cmpne      	r0, r1
 8010d6e:	0c82      	bf      	0x8010e72	// 8010e72 <_fpadd_parts+0x162>
 8010d70:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010d74:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010d78:	e90000b8 	bez      	r0, 0x8010ee8	// 8010ee8 <_fpadd_parts+0x1d8>
 8010d7c:	6730      	cmphs      	r12, r12
 8010d7e:	c58a010c 	subc      	r12, r10, r12
 8010d82:	c5ab010d 	subc      	r13, r11, r13
 8010d86:	e98d00c9 	blz      	r13, 0x8010f18	// 8010f18 <_fpadd_parts+0x208>
 8010d8a:	3100      	movi      	r1, 0
 8010d8c:	b221      	st.w      	r1, (r2, 0x4)
 8010d8e:	b262      	st.w      	r3, (r2, 0x8)
 8010d90:	dd822003 	st.w      	r12, (r2, 0xc)
 8010d94:	dda22004 	st.w      	r13, (r2, 0x10)
 8010d98:	6c33      	mov      	r0, r12
 8010d9a:	6c77      	mov      	r1, r13
 8010d9c:	3840      	cmpnei      	r0, 0
 8010d9e:	c4210c81 	decf      	r1, r1, 1
 8010da2:	2800      	subi      	r0, 1
 8010da4:	c7605023 	bmaski      	r3, 28
 8010da8:	644c      	cmphs      	r3, r1
 8010daa:	0c71      	bf      	0x8010e8c	// 8010e8c <_fpadd_parts+0x17c>
 8010dac:	64c6      	cmpne      	r1, r3
 8010dae:	0d0d      	bf      	0x8010fc8	// 8010fc8 <_fpadd_parts+0x2b8>
 8010db0:	9262      	ld.w      	r3, (r2, 0x8)
 8010db2:	3600      	movi      	r6, 0
 8010db4:	3700      	movi      	r7, 0
 8010db6:	ea0a0000 	movi      	r10, 0
 8010dba:	2b00      	subi      	r3, 1
 8010dbc:	2e00      	subi      	r6, 1
 8010dbe:	2f00      	subi      	r7, 1
 8010dc0:	c7605028 	bmaski      	r8, 28
 8010dc4:	e54a1001 	subi      	r10, r10, 2
 8010dc8:	0403      	br      	0x8010dce	// 8010dce <_fpadd_parts+0xbe>
 8010dca:	6606      	cmpne      	r1, r8
 8010dcc:	0c8b      	bf      	0x8010ee2	// 8010ee2 <_fpadd_parts+0x1d2>
 8010dce:	6511      	cmplt      	r4, r4
 8010dd0:	c58c0044 	addc      	r4, r12, r12
 8010dd4:	c5ad0045 	addc      	r5, r13, r13
 8010dd8:	6401      	cmplt      	r0, r0
 8010dda:	c4c40040 	addc      	r0, r4, r6
 8010dde:	c4e50041 	addc      	r1, r5, r7
 8010de2:	6460      	cmphs      	r8, r1
 8010de4:	6e4f      	mov      	r9, r3
 8010de6:	6f13      	mov      	r12, r4
 8010de8:	6f57      	mov      	r13, r5
 8010dea:	2b00      	subi      	r3, 1
 8010dec:	0bef      	bt      	0x8010dca	// 8010dca <_fpadd_parts+0xba>
 8010dee:	3303      	movi      	r3, 3
 8010df0:	b283      	st.w      	r4, (r2, 0xc)
 8010df2:	b2a4      	st.w      	r5, (r2, 0x10)
 8010df4:	dd222002 	st.w      	r9, (r2, 0x8)
 8010df8:	b260      	st.w      	r3, (r2, 0x0)
 8010dfa:	6c0b      	mov      	r0, r2
 8010dfc:	1403      	addi      	r14, r14, 12
 8010dfe:	1488      	pop      	r4-r11
 8010e00:	6c07      	mov      	r0, r1
 8010e02:	1403      	addi      	r14, r14, 12
 8010e04:	1488      	pop      	r4-r11
 8010e06:	e96d009a 	blsz      	r13, 0x8010f3a	// 8010f3a <_fpadd_parts+0x22a>
 8010e0a:	ea0d001f 	movi      	r13, 31
 8010e0e:	c42b4826 	lsli      	r6, r11, 1
 8010e12:	6362      	subu      	r13, r8
 8010e14:	e588101f 	subi      	r12, r8, 32
 8010e18:	c5a6402d 	lsl      	r13, r6, r13
 8010e1c:	c50a4046 	lsr      	r6, r10, r8
 8010e20:	c7ec2880 	btsti      	r12, 31
 8010e24:	c58b4049 	lsr      	r9, r11, r12
 8010e28:	3400      	movi      	r4, 0
 8010e2a:	6db4      	or      	r6, r13
 8010e2c:	c4c90c20 	incf      	r6, r9, 0
 8010e30:	6f53      	mov      	r13, r4
 8010e32:	c5854029 	lsl      	r9, r5, r12
 8010e36:	c505402c 	lsl      	r12, r5, r8
 8010e3a:	c50b4047 	lsr      	r7, r11, r8
 8010e3e:	c5a90c20 	incf      	r13, r9, 0
 8010e42:	c5840c20 	incf      	r12, r4, 0
 8010e46:	c4e40c20 	incf      	r7, r4, 0
 8010e4a:	eb4c0000 	cmpnei      	r12, 0
 8010e4e:	c5ad0c81 	decf      	r13, r13, 1
 8010e52:	e58c1000 	subi      	r12, r12, 1
 8010e56:	6b28      	and      	r12, r10
 8010e58:	6b6c      	and      	r13, r11
 8010e5a:	6f34      	or      	r12, r13
 8010e5c:	eb4c0000 	cmpnei      	r12, 0
 8010e60:	9001      	ld.w      	r0, (r0, 0x4)
 8010e62:	9121      	ld.w      	r1, (r1, 0x4)
 8010e64:	c400050a 	mvc      	r10
 8010e68:	6442      	cmpne      	r0, r1
 8010e6a:	6ed3      	mov      	r11, r4
 8010e6c:	6e98      	or      	r10, r6
 8010e6e:	6edc      	or      	r11, r7
 8010e70:	0b80      	bt      	0x8010d70	// 8010d70 <_fpadd_parts+0x60>
 8010e72:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010e76:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010e7a:	6731      	cmplt      	r12, r12
 8010e7c:	6329      	addc      	r12, r10
 8010e7e:	636d      	addc      	r13, r11
 8010e80:	b201      	st.w      	r0, (r2, 0x4)
 8010e82:	b262      	st.w      	r3, (r2, 0x8)
 8010e84:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e88:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e8c:	3303      	movi      	r3, 3
 8010e8e:	b260      	st.w      	r3, (r2, 0x0)
 8010e90:	c7805023 	bmaski      	r3, 29
 8010e94:	674c      	cmphs      	r3, r13
 8010e96:	0812      	bt      	0x8010eba	// 8010eba <_fpadd_parts+0x1aa>
 8010e98:	c7ed4823 	lsli      	r3, r13, 31
 8010e9c:	c42c4840 	lsri      	r0, r12, 1
 8010ea0:	6c0c      	or      	r0, r3
 8010ea2:	c42d4841 	lsri      	r1, r13, 1
 8010ea6:	9262      	ld.w      	r3, (r2, 0x8)
 8010ea8:	e48c2001 	andi      	r4, r12, 1
 8010eac:	3500      	movi      	r5, 0
 8010eae:	6c10      	or      	r0, r4
 8010eb0:	6c54      	or      	r1, r5
 8010eb2:	2300      	addi      	r3, 1
 8010eb4:	b203      	st.w      	r0, (r2, 0xc)
 8010eb6:	b224      	st.w      	r1, (r2, 0x10)
 8010eb8:	b262      	st.w      	r3, (r2, 0x8)
 8010eba:	6c0b      	mov      	r0, r2
 8010ebc:	1403      	addi      	r14, r14, 12
 8010ebe:	1488      	pop      	r4-r11
 8010ec0:	3b42      	cmpnei      	r3, 2
 8010ec2:	0b9d      	bt      	0x8010dfc	// 8010dfc <_fpadd_parts+0xec>
 8010ec4:	b260      	st.w      	r3, (r2, 0x0)
 8010ec6:	9061      	ld.w      	r3, (r0, 0x4)
 8010ec8:	b261      	st.w      	r3, (r2, 0x4)
 8010eca:	9062      	ld.w      	r3, (r0, 0x8)
 8010ecc:	b262      	st.w      	r3, (r2, 0x8)
 8010ece:	9063      	ld.w      	r3, (r0, 0xc)
 8010ed0:	b263      	st.w      	r3, (r2, 0xc)
 8010ed2:	9064      	ld.w      	r3, (r0, 0x10)
 8010ed4:	9121      	ld.w      	r1, (r1, 0x4)
 8010ed6:	b264      	st.w      	r3, (r2, 0x10)
 8010ed8:	9061      	ld.w      	r3, (r0, 0x4)
 8010eda:	68c4      	and      	r3, r1
 8010edc:	b261      	st.w      	r3, (r2, 0x4)
 8010ede:	6c0b      	mov      	r0, r2
 8010ee0:	078e      	br      	0x8010dfc	// 8010dfc <_fpadd_parts+0xec>
 8010ee2:	6428      	cmphs      	r10, r0
 8010ee4:	0b75      	bt      	0x8010dce	// 8010dce <_fpadd_parts+0xbe>
 8010ee6:	0784      	br      	0x8010dee	// 8010dee <_fpadd_parts+0xde>
 8010ee8:	6730      	cmphs      	r12, r12
 8010eea:	632b      	subc      	r12, r10
 8010eec:	636f      	subc      	r13, r11
 8010eee:	074c      	br      	0x8010d86	// 8010d86 <_fpadd_parts+0x76>
 8010ef0:	6cf3      	mov      	r3, r12
 8010ef2:	ea0d0000 	movi      	r13, 0
 8010ef6:	ea0c0000 	movi      	r12, 0
 8010efa:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010efe:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010f02:	0733      	br      	0x8010d68	// 8010d68 <_fpadd_parts+0x58>
 8010f04:	eb4c0004 	cmpnei      	r12, 4
 8010f08:	0b7a      	bt      	0x8010dfc	// 8010dfc <_fpadd_parts+0xec>
 8010f0a:	9041      	ld.w      	r2, (r0, 0x4)
 8010f0c:	9161      	ld.w      	r3, (r1, 0x4)
 8010f0e:	64ca      	cmpne      	r2, r3
 8010f10:	124b      	lrw      	r2, 0x8015ba0	// 801103c <__subdf3+0x38>
 8010f12:	c4020c40 	inct      	r0, r2, 0
 8010f16:	0773      	br      	0x8010dfc	// 8010dfc <_fpadd_parts+0xec>
 8010f18:	ea0a0000 	movi      	r10, 0
 8010f1c:	ea0b0000 	movi      	r11, 0
 8010f20:	3101      	movi      	r1, 1
 8010f22:	6730      	cmphs      	r12, r12
 8010f24:	c58a010c 	subc      	r12, r10, r12
 8010f28:	c5ab010d 	subc      	r13, r11, r13
 8010f2c:	b221      	st.w      	r1, (r2, 0x4)
 8010f2e:	b262      	st.w      	r3, (r2, 0x8)
 8010f30:	dd822003 	st.w      	r12, (r2, 0xc)
 8010f34:	dda22004 	st.w      	r13, (r2, 0x10)
 8010f38:	0730      	br      	0x8010d98	// 8010d98 <_fpadd_parts+0x88>
 8010f3a:	e90dff17 	bez      	r13, 0x8010d68	// 8010d68 <_fpadd_parts+0x58>
 8010f3e:	98c0      	ld.w      	r6, (r14, 0x0)
 8010f40:	98e1      	ld.w      	r7, (r14, 0x4)
 8010f42:	ea0d001f 	movi      	r13, 31
 8010f46:	47c1      	lsli      	r6, r7, 1
 8010f48:	6362      	subu      	r13, r8
 8010f4a:	c5a6402d 	lsl      	r13, r6, r13
 8010f4e:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010f52:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010f56:	e588101f 	subi      	r12, r8, 32
 8010f5a:	c50d4046 	lsr      	r6, r13, r8
 8010f5e:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010f62:	c7ec2880 	btsti      	r12, 31
 8010f66:	3400      	movi      	r4, 0
 8010f68:	c5874049 	lsr      	r9, r7, r12
 8010f6c:	6db4      	or      	r6, r13
 8010f6e:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010f72:	c4c90c20 	incf      	r6, r9, 0
 8010f76:	c50d4047 	lsr      	r7, r13, r8
 8010f7a:	c5854029 	lsl      	r9, r5, r12
 8010f7e:	6f53      	mov      	r13, r4
 8010f80:	c505402c 	lsl      	r12, r5, r8
 8010f84:	c5a90c20 	incf      	r13, r9, 0
 8010f88:	c5840c20 	incf      	r12, r4, 0
 8010f8c:	c4e40c20 	incf      	r7, r4, 0
 8010f90:	60e0      	addu      	r3, r8
 8010f92:	eb4c0000 	cmpnei      	r12, 0
 8010f96:	c5ad0c81 	decf      	r13, r13, 1
 8010f9a:	e58c1000 	subi      	r12, r12, 1
 8010f9e:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010fa2:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010fa6:	6a30      	and      	r8, r12
 8010fa8:	6a74      	and      	r9, r13
 8010faa:	6f23      	mov      	r12, r8
 8010fac:	6f67      	mov      	r13, r9
 8010fae:	6f34      	or      	r12, r13
 8010fb0:	eb4c0000 	cmpnei      	r12, 0
 8010fb4:	c400050c 	mvc      	r12
 8010fb8:	6f53      	mov      	r13, r4
 8010fba:	c5862424 	or      	r4, r6, r12
 8010fbe:	c5a72425 	or      	r5, r7, r13
 8010fc2:	b880      	st.w      	r4, (r14, 0x0)
 8010fc4:	b8a1      	st.w      	r5, (r14, 0x4)
 8010fc6:	06d1      	br      	0x8010d68	// 8010d68 <_fpadd_parts+0x58>
 8010fc8:	3300      	movi      	r3, 0
 8010fca:	2b01      	subi      	r3, 2
 8010fcc:	640c      	cmphs      	r3, r0
 8010fce:	0af1      	bt      	0x8010db0	// 8010db0 <_fpadd_parts+0xa0>
 8010fd0:	075e      	br      	0x8010e8c	// 8010e8c <_fpadd_parts+0x17c>
	...

08010fd4 <__adddf3>:
 8010fd4:	14d2      	push      	r4-r5, r15
 8010fd6:	1433      	subi      	r14, r14, 76
 8010fd8:	b800      	st.w      	r0, (r14, 0x0)
 8010fda:	b821      	st.w      	r1, (r14, 0x4)
 8010fdc:	6c3b      	mov      	r0, r14
 8010fde:	6d47      	mov      	r5, r1
 8010fe0:	1904      	addi      	r1, r14, 16
 8010fe2:	b863      	st.w      	r3, (r14, 0xc)
 8010fe4:	b842      	st.w      	r2, (r14, 0x8)
 8010fe6:	e00003d3 	bsr      	0x801178c	// 801178c <__unpack_d>
 8010fea:	1909      	addi      	r1, r14, 36
 8010fec:	1802      	addi      	r0, r14, 8
 8010fee:	e00003cf 	bsr      	0x801178c	// 801178c <__unpack_d>
 8010ff2:	1a0e      	addi      	r2, r14, 56
 8010ff4:	1909      	addi      	r1, r14, 36
 8010ff6:	1804      	addi      	r0, r14, 16
 8010ff8:	e3fffe8c 	bsr      	0x8010d10	// 8010d10 <_fpadd_parts>
 8010ffc:	e0000300 	bsr      	0x80115fc	// 80115fc <__pack_d>
 8011000:	1413      	addi      	r14, r14, 76
 8011002:	1492      	pop      	r4-r5, r15

08011004 <__subdf3>:
 8011004:	14d2      	push      	r4-r5, r15
 8011006:	1433      	subi      	r14, r14, 76
 8011008:	b800      	st.w      	r0, (r14, 0x0)
 801100a:	b821      	st.w      	r1, (r14, 0x4)
 801100c:	6c3b      	mov      	r0, r14
 801100e:	6d47      	mov      	r5, r1
 8011010:	1904      	addi      	r1, r14, 16
 8011012:	b842      	st.w      	r2, (r14, 0x8)
 8011014:	b863      	st.w      	r3, (r14, 0xc)
 8011016:	e00003bb 	bsr      	0x801178c	// 801178c <__unpack_d>
 801101a:	1909      	addi      	r1, r14, 36
 801101c:	1802      	addi      	r0, r14, 8
 801101e:	e00003b7 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011022:	986a      	ld.w      	r3, (r14, 0x28)
 8011024:	e4634001 	xori      	r3, r3, 1
 8011028:	1a0e      	addi      	r2, r14, 56
 801102a:	1909      	addi      	r1, r14, 36
 801102c:	1804      	addi      	r0, r14, 16
 801102e:	b86a      	st.w      	r3, (r14, 0x28)
 8011030:	e3fffe70 	bsr      	0x8010d10	// 8010d10 <_fpadd_parts>
 8011034:	e00002e4 	bsr      	0x80115fc	// 80115fc <__pack_d>
 8011038:	1413      	addi      	r14, r14, 76
 801103a:	1492      	pop      	r4-r5, r15
 801103c:	08015ba0 	.long	0x08015ba0

08011040 <__muldf3>:
 8011040:	14d8      	push      	r4-r11, r15
 8011042:	1436      	subi      	r14, r14, 88
 8011044:	b803      	st.w      	r0, (r14, 0xc)
 8011046:	b824      	st.w      	r1, (r14, 0x10)
 8011048:	1803      	addi      	r0, r14, 12
 801104a:	1907      	addi      	r1, r14, 28
 801104c:	b866      	st.w      	r3, (r14, 0x18)
 801104e:	b845      	st.w      	r2, (r14, 0x14)
 8011050:	e000039e 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011054:	190c      	addi      	r1, r14, 48
 8011056:	1805      	addi      	r0, r14, 20
 8011058:	e000039a 	bsr      	0x801178c	// 801178c <__unpack_d>
 801105c:	9867      	ld.w      	r3, (r14, 0x1c)
 801105e:	3b01      	cmphsi      	r3, 2
 8011060:	0ca4      	bf      	0x80111a8	// 80111a8 <__muldf3+0x168>
 8011062:	984c      	ld.w      	r2, (r14, 0x30)
 8011064:	3a01      	cmphsi      	r2, 2
 8011066:	0c94      	bf      	0x801118e	// 801118e <__muldf3+0x14e>
 8011068:	3b44      	cmpnei      	r3, 4
 801106a:	0c9d      	bf      	0x80111a4	// 80111a4 <__muldf3+0x164>
 801106c:	3a44      	cmpnei      	r2, 4
 801106e:	0c8e      	bf      	0x801118a	// 801118a <__muldf3+0x14a>
 8011070:	3b42      	cmpnei      	r3, 2
 8011072:	0c9b      	bf      	0x80111a8	// 80111a8 <__muldf3+0x168>
 8011074:	3a42      	cmpnei      	r2, 2
 8011076:	0c8c      	bf      	0x801118e	// 801118e <__muldf3+0x14e>
 8011078:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 801107c:	d90e200a 	ld.w      	r8, (r14, 0x28)
 8011080:	3300      	movi      	r3, 0
 8011082:	6c33      	mov      	r0, r12
 8011084:	6ca3      	mov      	r2, r8
 8011086:	6c4f      	mov      	r1, r3
 8011088:	dd8e2002 	st.w      	r12, (r14, 0x8)
 801108c:	d96e2010 	ld.w      	r11, (r14, 0x40)
 8011090:	e0000290 	bsr      	0x80115b0	// 80115b0 <__muldi3>
 8011094:	3300      	movi      	r3, 0
 8011096:	6ca3      	mov      	r2, r8
 8011098:	6d83      	mov      	r6, r0
 801109a:	6dc7      	mov      	r7, r1
 801109c:	6c4f      	mov      	r1, r3
 801109e:	6c2f      	mov      	r0, r11
 80110a0:	e0000288 	bsr      	0x80115b0	// 80115b0 <__muldi3>
 80110a4:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 80110a8:	3300      	movi      	r3, 0
 80110aa:	6e03      	mov      	r8, r0
 80110ac:	6e47      	mov      	r9, r1
 80110ae:	6caf      	mov      	r2, r11
 80110b0:	6c4f      	mov      	r1, r3
 80110b2:	6c2b      	mov      	r0, r10
 80110b4:	e000027e 	bsr      	0x80115b0	// 80115b0 <__muldi3>
 80110b8:	d98e2002 	ld.w      	r12, (r14, 0x8)
 80110bc:	3300      	movi      	r3, 0
 80110be:	b800      	st.w      	r0, (r14, 0x0)
 80110c0:	b821      	st.w      	r1, (r14, 0x4)
 80110c2:	6cb3      	mov      	r2, r12
 80110c4:	6c2b      	mov      	r0, r10
 80110c6:	6c4f      	mov      	r1, r3
 80110c8:	e0000274 	bsr      	0x80115b0	// 80115b0 <__muldi3>
 80110cc:	6401      	cmplt      	r0, r0
 80110ce:	6021      	addc      	r0, r8
 80110d0:	6065      	addc      	r1, r9
 80110d2:	6644      	cmphs      	r1, r9
 80110d4:	0c80      	bf      	0x80111d4	// 80111d4 <__muldf3+0x194>
 80110d6:	6466      	cmpne      	r9, r1
 80110d8:	0c7c      	bf      	0x80111d0	// 80111d0 <__muldf3+0x190>
 80110da:	ea080000 	movi      	r8, 0
 80110de:	ea090000 	movi      	r9, 0
 80110e2:	3200      	movi      	r2, 0
 80110e4:	6cc3      	mov      	r3, r0
 80110e6:	6489      	cmplt      	r2, r2
 80110e8:	6099      	addc      	r2, r6
 80110ea:	60dd      	addc      	r3, r7
 80110ec:	65cc      	cmphs      	r3, r7
 80110ee:	0c6a      	bf      	0x80111c2	// 80111c2 <__muldf3+0x182>
 80110f0:	64de      	cmpne      	r7, r3
 80110f2:	0c66      	bf      	0x80111be	// 80111be <__muldf3+0x17e>
 80110f4:	6f07      	mov      	r12, r1
 80110f6:	ea0d0000 	movi      	r13, 0
 80110fa:	9800      	ld.w      	r0, (r14, 0x0)
 80110fc:	9821      	ld.w      	r1, (r14, 0x4)
 80110fe:	6401      	cmplt      	r0, r0
 8011100:	6031      	addc      	r0, r12
 8011102:	6075      	addc      	r1, r13
 8011104:	6621      	cmplt      	r8, r8
 8011106:	6201      	addc      	r8, r0
 8011108:	6245      	addc      	r9, r1
 801110a:	980e      	ld.w      	r0, (r14, 0x38)
 801110c:	9829      	ld.w      	r1, (r14, 0x24)
 801110e:	6040      	addu      	r1, r0
 8011110:	590e      	addi      	r0, r1, 4
 8011112:	b813      	st.w      	r0, (r14, 0x4c)
 8011114:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011118:	980d      	ld.w      	r0, (r14, 0x34)
 801111a:	6432      	cmpne      	r12, r0
 801111c:	c780502a 	bmaski      	r10, 29
 8011120:	c4000500 	mvc      	r0
 8011124:	6668      	cmphs      	r10, r9
 8011126:	b812      	st.w      	r0, (r14, 0x48)
 8011128:	086f      	bt      	0x8011206	// 8011206 <__muldf3+0x1c6>
 801112a:	2104      	addi      	r1, 5
 801112c:	ea0c0000 	movi      	r12, 0
 8011130:	ea2d8000 	movih      	r13, 32768
 8011134:	e4082001 	andi      	r0, r8, 1
 8011138:	6ec7      	mov      	r11, r1
 801113a:	e900000a 	bez      	r0, 0x801114e	// 801114e <__muldf3+0x10e>
 801113e:	431f      	lsli      	r0, r3, 31
 8011140:	4a81      	lsri      	r4, r2, 1
 8011142:	6d00      	or      	r4, r0
 8011144:	4ba1      	lsri      	r5, r3, 1
 8011146:	c5842422 	or      	r2, r4, r12
 801114a:	c5a52423 	or      	r3, r5, r13
 801114e:	c4294840 	lsri      	r0, r9, 1
 8011152:	6428      	cmphs      	r10, r0
 8011154:	c7e94827 	lsli      	r7, r9, 31
 8011158:	c4284846 	lsri      	r6, r8, 1
 801115c:	c4c72428 	or      	r8, r7, r6
 8011160:	6e43      	mov      	r9, r0
 8011162:	2100      	addi      	r1, 1
 8011164:	0fe8      	bf      	0x8011134	// 8011134 <__muldf3+0xf4>
 8011166:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 801116a:	e42820ff 	andi      	r1, r8, 255
 801116e:	eb410080 	cmpnei      	r1, 128
 8011172:	0c36      	bf      	0x80111de	// 80111de <__muldf3+0x19e>
 8011174:	3303      	movi      	r3, 3
 8011176:	dd0e2014 	st.w      	r8, (r14, 0x50)
 801117a:	dd2e2015 	st.w      	r9, (r14, 0x54)
 801117e:	b871      	st.w      	r3, (r14, 0x44)
 8011180:	1811      	addi      	r0, r14, 68
 8011182:	e000023d 	bsr      	0x80115fc	// 80115fc <__pack_d>
 8011186:	1416      	addi      	r14, r14, 88
 8011188:	1498      	pop      	r4-r11, r15
 801118a:	3b42      	cmpnei      	r3, 2
 801118c:	0c3b      	bf      	0x8011202	// 8011202 <__muldf3+0x1c2>
 801118e:	986d      	ld.w      	r3, (r14, 0x34)
 8011190:	9848      	ld.w      	r2, (r14, 0x20)
 8011192:	64ca      	cmpne      	r2, r3
 8011194:	c4000503 	mvc      	r3
 8011198:	180c      	addi      	r0, r14, 48
 801119a:	b86d      	st.w      	r3, (r14, 0x34)
 801119c:	e0000230 	bsr      	0x80115fc	// 80115fc <__pack_d>
 80111a0:	1416      	addi      	r14, r14, 88
 80111a2:	1498      	pop      	r4-r11, r15
 80111a4:	3a42      	cmpnei      	r2, 2
 80111a6:	0c2e      	bf      	0x8011202	// 8011202 <__muldf3+0x1c2>
 80111a8:	9848      	ld.w      	r2, (r14, 0x20)
 80111aa:	986d      	ld.w      	r3, (r14, 0x34)
 80111ac:	64ca      	cmpne      	r2, r3
 80111ae:	c4000503 	mvc      	r3
 80111b2:	1807      	addi      	r0, r14, 28
 80111b4:	b868      	st.w      	r3, (r14, 0x20)
 80111b6:	e0000223 	bsr      	0x80115fc	// 80115fc <__pack_d>
 80111ba:	1416      	addi      	r14, r14, 88
 80111bc:	1498      	pop      	r4-r11, r15
 80111be:	6588      	cmphs      	r2, r6
 80111c0:	0b9a      	bt      	0x80110f4	// 80110f4 <__muldf3+0xb4>
 80111c2:	e5080000 	addi      	r8, r8, 1
 80111c6:	eb480000 	cmpnei      	r8, 0
 80111ca:	c5290c21 	incf      	r9, r9, 1
 80111ce:	0793      	br      	0x80110f4	// 80110f4 <__muldf3+0xb4>
 80111d0:	6600      	cmphs      	r0, r8
 80111d2:	0b84      	bt      	0x80110da	// 80110da <__muldf3+0x9a>
 80111d4:	ea080000 	movi      	r8, 0
 80111d8:	ea090001 	movi      	r9, 1
 80111dc:	0783      	br      	0x80110e2	// 80110e2 <__muldf3+0xa2>
 80111de:	e4282100 	andi      	r1, r8, 256
 80111e2:	e921ffc9 	bnez      	r1, 0x8011174	// 8011174 <__muldf3+0x134>
 80111e6:	6c8c      	or      	r2, r3
 80111e8:	e902ffc6 	bez      	r2, 0x8011174	// 8011174 <__muldf3+0x134>
 80111ec:	3280      	movi      	r2, 128
 80111ee:	3300      	movi      	r3, 0
 80111f0:	3100      	movi      	r1, 0
 80111f2:	6489      	cmplt      	r2, r2
 80111f4:	60a1      	addc      	r2, r8
 80111f6:	60e5      	addc      	r3, r9
 80111f8:	29ff      	subi      	r1, 256
 80111fa:	c4222028 	and      	r8, r2, r1
 80111fe:	6e4f      	mov      	r9, r3
 8011200:	07ba      	br      	0x8011174	// 8011174 <__muldf3+0x134>
 8011202:	100f      	lrw      	r0, 0x8015ba0	// 801123c <__muldf3+0x1fc>
 8011204:	07bf      	br      	0x8011182	// 8011182 <__muldf3+0x142>
 8011206:	c760502c 	bmaski      	r12, 28
 801120a:	6670      	cmphs      	r12, r9
 801120c:	0faf      	bf      	0x801116a	// 801116a <__muldf3+0x12a>
 801120e:	2102      	addi      	r1, 3
 8011210:	3401      	movi      	r4, 1
 8011212:	3500      	movi      	r5, 0
 8011214:	6da3      	mov      	r6, r8
 8011216:	6de7      	mov      	r7, r9
 8011218:	6c07      	mov      	r0, r1
 801121a:	6621      	cmplt      	r8, r8
 801121c:	6219      	addc      	r8, r6
 801121e:	625d      	addc      	r9, r7
 8011220:	e9a30004 	bhsz      	r3, 0x8011228	// 8011228 <__muldf3+0x1e8>
 8011224:	6e10      	or      	r8, r4
 8011226:	6e54      	or      	r9, r5
 8011228:	6d8b      	mov      	r6, r2
 801122a:	6dcf      	mov      	r7, r3
 801122c:	6489      	cmplt      	r2, r2
 801122e:	6099      	addc      	r2, r6
 8011230:	60dd      	addc      	r3, r7
 8011232:	6670      	cmphs      	r12, r9
 8011234:	2900      	subi      	r1, 1
 8011236:	0bef      	bt      	0x8011214	// 8011214 <__muldf3+0x1d4>
 8011238:	b813      	st.w      	r0, (r14, 0x4c)
 801123a:	0798      	br      	0x801116a	// 801116a <__muldf3+0x12a>
 801123c:	08015ba0 	.long	0x08015ba0

08011240 <__divdf3>:
 8011240:	14d6      	push      	r4-r9, r15
 8011242:	142e      	subi      	r14, r14, 56
 8011244:	b800      	st.w      	r0, (r14, 0x0)
 8011246:	b821      	st.w      	r1, (r14, 0x4)
 8011248:	6c3b      	mov      	r0, r14
 801124a:	1904      	addi      	r1, r14, 16
 801124c:	b863      	st.w      	r3, (r14, 0xc)
 801124e:	b842      	st.w      	r2, (r14, 0x8)
 8011250:	e000029e 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011254:	1909      	addi      	r1, r14, 36
 8011256:	1802      	addi      	r0, r14, 8
 8011258:	e000029a 	bsr      	0x801178c	// 801178c <__unpack_d>
 801125c:	9864      	ld.w      	r3, (r14, 0x10)
 801125e:	3b01      	cmphsi      	r3, 2
 8011260:	0c51      	bf      	0x8011302	// 8011302 <__divdf3+0xc2>
 8011262:	9829      	ld.w      	r1, (r14, 0x24)
 8011264:	3201      	movi      	r2, 1
 8011266:	6448      	cmphs      	r2, r1
 8011268:	0873      	bt      	0x801134e	// 801134e <__divdf3+0x10e>
 801126a:	9845      	ld.w      	r2, (r14, 0x14)
 801126c:	980a      	ld.w      	r0, (r14, 0x28)
 801126e:	3b44      	cmpnei      	r3, 4
 8011270:	6c81      	xor      	r2, r0
 8011272:	b845      	st.w      	r2, (r14, 0x14)
 8011274:	0c4c      	bf      	0x801130c	// 801130c <__divdf3+0xcc>
 8011276:	3b42      	cmpnei      	r3, 2
 8011278:	0c4a      	bf      	0x801130c	// 801130c <__divdf3+0xcc>
 801127a:	3944      	cmpnei      	r1, 4
 801127c:	0c4c      	bf      	0x8011314	// 8011314 <__divdf3+0xd4>
 801127e:	3942      	cmpnei      	r1, 2
 8011280:	0c63      	bf      	0x8011346	// 8011346 <__divdf3+0x106>
 8011282:	9807      	ld.w      	r0, (r14, 0x1c)
 8011284:	9828      	ld.w      	r1, (r14, 0x20)
 8011286:	98cc      	ld.w      	r6, (r14, 0x30)
 8011288:	98ed      	ld.w      	r7, (r14, 0x34)
 801128a:	9866      	ld.w      	r3, (r14, 0x18)
 801128c:	984b      	ld.w      	r2, (r14, 0x2c)
 801128e:	65c4      	cmphs      	r1, r7
 8011290:	60ca      	subu      	r3, r2
 8011292:	b866      	st.w      	r3, (r14, 0x18)
 8011294:	0c05      	bf      	0x801129e	// 801129e <__divdf3+0x5e>
 8011296:	645e      	cmpne      	r7, r1
 8011298:	080a      	bt      	0x80112ac	// 80112ac <__divdf3+0x6c>
 801129a:	6580      	cmphs      	r0, r6
 801129c:	0808      	bt      	0x80112ac	// 80112ac <__divdf3+0x6c>
 801129e:	6f03      	mov      	r12, r0
 80112a0:	6f47      	mov      	r13, r1
 80112a2:	2b00      	subi      	r3, 1
 80112a4:	6401      	cmplt      	r0, r0
 80112a6:	6031      	addc      	r0, r12
 80112a8:	6075      	addc      	r1, r13
 80112aa:	b866      	st.w      	r3, (r14, 0x18)
 80112ac:	ea0c003d 	movi      	r12, 61
 80112b0:	3400      	movi      	r4, 0
 80112b2:	3500      	movi      	r5, 0
 80112b4:	3200      	movi      	r2, 0
 80112b6:	ea231000 	movih      	r3, 4096
 80112ba:	65c4      	cmphs      	r1, r7
 80112bc:	0c0a      	bf      	0x80112d0	// 80112d0 <__divdf3+0x90>
 80112be:	645e      	cmpne      	r7, r1
 80112c0:	0803      	bt      	0x80112c6	// 80112c6 <__divdf3+0x86>
 80112c2:	6580      	cmphs      	r0, r6
 80112c4:	0c06      	bf      	0x80112d0	// 80112d0 <__divdf3+0x90>
 80112c6:	6d08      	or      	r4, r2
 80112c8:	6d4c      	or      	r5, r3
 80112ca:	6400      	cmphs      	r0, r0
 80112cc:	601b      	subc      	r0, r6
 80112ce:	605f      	subc      	r1, r7
 80112d0:	c7e34829 	lsli      	r9, r3, 31
 80112d4:	c4224848 	lsri      	r8, r2, 1
 80112d8:	c423484d 	lsri      	r13, r3, 1
 80112dc:	c5092422 	or      	r2, r9, r8
 80112e0:	e58c1000 	subi      	r12, r12, 1
 80112e4:	6e03      	mov      	r8, r0
 80112e6:	6e47      	mov      	r9, r1
 80112e8:	6cf7      	mov      	r3, r13
 80112ea:	6401      	cmplt      	r0, r0
 80112ec:	6021      	addc      	r0, r8
 80112ee:	6065      	addc      	r1, r9
 80112f0:	e92cffe5 	bnez      	r12, 0x80112ba	// 80112ba <__divdf3+0x7a>
 80112f4:	e46420ff 	andi      	r3, r4, 255
 80112f8:	eb430080 	cmpnei      	r3, 128
 80112fc:	0c13      	bf      	0x8011322	// 8011322 <__divdf3+0xe2>
 80112fe:	b887      	st.w      	r4, (r14, 0x1c)
 8011300:	b8a8      	st.w      	r5, (r14, 0x20)
 8011302:	1804      	addi      	r0, r14, 16
 8011304:	e000017c 	bsr      	0x80115fc	// 80115fc <__pack_d>
 8011308:	140e      	addi      	r14, r14, 56
 801130a:	1496      	pop      	r4-r9, r15
 801130c:	644e      	cmpne      	r3, r1
 801130e:	0bfa      	bt      	0x8011302	// 8011302 <__divdf3+0xc2>
 8011310:	1011      	lrw      	r0, 0x8015ba0	// 8011354 <__divdf3+0x114>
 8011312:	07f9      	br      	0x8011304	// 8011304 <__divdf3+0xc4>
 8011314:	3300      	movi      	r3, 0
 8011316:	3400      	movi      	r4, 0
 8011318:	b867      	st.w      	r3, (r14, 0x1c)
 801131a:	b888      	st.w      	r4, (r14, 0x20)
 801131c:	b866      	st.w      	r3, (r14, 0x18)
 801131e:	1804      	addi      	r0, r14, 16
 8011320:	07f2      	br      	0x8011304	// 8011304 <__divdf3+0xc4>
 8011322:	e4642100 	andi      	r3, r4, 256
 8011326:	e923ffec 	bnez      	r3, 0x80112fe	// 80112fe <__divdf3+0xbe>
 801132a:	6c04      	or      	r0, r1
 801132c:	e900ffe9 	bez      	r0, 0x80112fe	// 80112fe <__divdf3+0xbe>
 8011330:	3280      	movi      	r2, 128
 8011332:	3300      	movi      	r3, 0
 8011334:	3100      	movi      	r1, 0
 8011336:	6489      	cmplt      	r2, r2
 8011338:	6091      	addc      	r2, r4
 801133a:	60d5      	addc      	r3, r5
 801133c:	29ff      	subi      	r1, 256
 801133e:	c4222024 	and      	r4, r2, r1
 8011342:	6d4f      	mov      	r5, r3
 8011344:	07dd      	br      	0x80112fe	// 80112fe <__divdf3+0xbe>
 8011346:	3304      	movi      	r3, 4
 8011348:	b864      	st.w      	r3, (r14, 0x10)
 801134a:	1804      	addi      	r0, r14, 16
 801134c:	07dc      	br      	0x8011304	// 8011304 <__divdf3+0xc4>
 801134e:	1809      	addi      	r0, r14, 36
 8011350:	07da      	br      	0x8011304	// 8011304 <__divdf3+0xc4>
 8011352:	0000      	.short	0x0000
 8011354:	08015ba0 	.long	0x08015ba0

08011358 <__nedf2>:
 8011358:	14d2      	push      	r4-r5, r15
 801135a:	142e      	subi      	r14, r14, 56
 801135c:	b800      	st.w      	r0, (r14, 0x0)
 801135e:	b821      	st.w      	r1, (r14, 0x4)
 8011360:	6c3b      	mov      	r0, r14
 8011362:	6d47      	mov      	r5, r1
 8011364:	1904      	addi      	r1, r14, 16
 8011366:	b863      	st.w      	r3, (r14, 0xc)
 8011368:	b842      	st.w      	r2, (r14, 0x8)
 801136a:	e0000211 	bsr      	0x801178c	// 801178c <__unpack_d>
 801136e:	1802      	addi      	r0, r14, 8
 8011370:	1909      	addi      	r1, r14, 36
 8011372:	e000020d 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011376:	9864      	ld.w      	r3, (r14, 0x10)
 8011378:	3001      	movi      	r0, 1
 801137a:	64c0      	cmphs      	r0, r3
 801137c:	0808      	bt      	0x801138c	// 801138c <__nedf2+0x34>
 801137e:	9869      	ld.w      	r3, (r14, 0x24)
 8011380:	64c0      	cmphs      	r0, r3
 8011382:	0805      	bt      	0x801138c	// 801138c <__nedf2+0x34>
 8011384:	1909      	addi      	r1, r14, 36
 8011386:	1804      	addi      	r0, r14, 16
 8011388:	e0000274 	bsr      	0x8011870	// 8011870 <__fpcmp_parts_d>
 801138c:	140e      	addi      	r14, r14, 56
 801138e:	1492      	pop      	r4-r5, r15

08011390 <__gtdf2>:
 8011390:	14d2      	push      	r4-r5, r15
 8011392:	142e      	subi      	r14, r14, 56
 8011394:	b800      	st.w      	r0, (r14, 0x0)
 8011396:	b821      	st.w      	r1, (r14, 0x4)
 8011398:	6c3b      	mov      	r0, r14
 801139a:	6d47      	mov      	r5, r1
 801139c:	1904      	addi      	r1, r14, 16
 801139e:	b842      	st.w      	r2, (r14, 0x8)
 80113a0:	b863      	st.w      	r3, (r14, 0xc)
 80113a2:	e00001f5 	bsr      	0x801178c	// 801178c <__unpack_d>
 80113a6:	1909      	addi      	r1, r14, 36
 80113a8:	1802      	addi      	r0, r14, 8
 80113aa:	e00001f1 	bsr      	0x801178c	// 801178c <__unpack_d>
 80113ae:	9844      	ld.w      	r2, (r14, 0x10)
 80113b0:	3301      	movi      	r3, 1
 80113b2:	648c      	cmphs      	r3, r2
 80113b4:	080a      	bt      	0x80113c8	// 80113c8 <__gtdf2+0x38>
 80113b6:	9849      	ld.w      	r2, (r14, 0x24)
 80113b8:	648c      	cmphs      	r3, r2
 80113ba:	0807      	bt      	0x80113c8	// 80113c8 <__gtdf2+0x38>
 80113bc:	1909      	addi      	r1, r14, 36
 80113be:	1804      	addi      	r0, r14, 16
 80113c0:	e0000258 	bsr      	0x8011870	// 8011870 <__fpcmp_parts_d>
 80113c4:	140e      	addi      	r14, r14, 56
 80113c6:	1492      	pop      	r4-r5, r15
 80113c8:	3000      	movi      	r0, 0
 80113ca:	2800      	subi      	r0, 1
 80113cc:	140e      	addi      	r14, r14, 56
 80113ce:	1492      	pop      	r4-r5, r15

080113d0 <__gedf2>:
 80113d0:	14d2      	push      	r4-r5, r15
 80113d2:	142e      	subi      	r14, r14, 56
 80113d4:	b800      	st.w      	r0, (r14, 0x0)
 80113d6:	b821      	st.w      	r1, (r14, 0x4)
 80113d8:	6c3b      	mov      	r0, r14
 80113da:	6d47      	mov      	r5, r1
 80113dc:	1904      	addi      	r1, r14, 16
 80113de:	b842      	st.w      	r2, (r14, 0x8)
 80113e0:	b863      	st.w      	r3, (r14, 0xc)
 80113e2:	e00001d5 	bsr      	0x801178c	// 801178c <__unpack_d>
 80113e6:	1909      	addi      	r1, r14, 36
 80113e8:	1802      	addi      	r0, r14, 8
 80113ea:	e00001d1 	bsr      	0x801178c	// 801178c <__unpack_d>
 80113ee:	9844      	ld.w      	r2, (r14, 0x10)
 80113f0:	3301      	movi      	r3, 1
 80113f2:	648c      	cmphs      	r3, r2
 80113f4:	080a      	bt      	0x8011408	// 8011408 <__gedf2+0x38>
 80113f6:	9849      	ld.w      	r2, (r14, 0x24)
 80113f8:	648c      	cmphs      	r3, r2
 80113fa:	0807      	bt      	0x8011408	// 8011408 <__gedf2+0x38>
 80113fc:	1909      	addi      	r1, r14, 36
 80113fe:	1804      	addi      	r0, r14, 16
 8011400:	e0000238 	bsr      	0x8011870	// 8011870 <__fpcmp_parts_d>
 8011404:	140e      	addi      	r14, r14, 56
 8011406:	1492      	pop      	r4-r5, r15
 8011408:	3000      	movi      	r0, 0
 801140a:	2800      	subi      	r0, 1
 801140c:	140e      	addi      	r14, r14, 56
 801140e:	1492      	pop      	r4-r5, r15

08011410 <__ltdf2>:
 8011410:	14d2      	push      	r4-r5, r15
 8011412:	142e      	subi      	r14, r14, 56
 8011414:	b800      	st.w      	r0, (r14, 0x0)
 8011416:	b821      	st.w      	r1, (r14, 0x4)
 8011418:	6c3b      	mov      	r0, r14
 801141a:	6d47      	mov      	r5, r1
 801141c:	1904      	addi      	r1, r14, 16
 801141e:	b863      	st.w      	r3, (r14, 0xc)
 8011420:	b842      	st.w      	r2, (r14, 0x8)
 8011422:	e00001b5 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011426:	1802      	addi      	r0, r14, 8
 8011428:	1909      	addi      	r1, r14, 36
 801142a:	e00001b1 	bsr      	0x801178c	// 801178c <__unpack_d>
 801142e:	9864      	ld.w      	r3, (r14, 0x10)
 8011430:	3001      	movi      	r0, 1
 8011432:	64c0      	cmphs      	r0, r3
 8011434:	0808      	bt      	0x8011444	// 8011444 <__ltdf2+0x34>
 8011436:	9869      	ld.w      	r3, (r14, 0x24)
 8011438:	64c0      	cmphs      	r0, r3
 801143a:	0805      	bt      	0x8011444	// 8011444 <__ltdf2+0x34>
 801143c:	1909      	addi      	r1, r14, 36
 801143e:	1804      	addi      	r0, r14, 16
 8011440:	e0000218 	bsr      	0x8011870	// 8011870 <__fpcmp_parts_d>
 8011444:	140e      	addi      	r14, r14, 56
 8011446:	1492      	pop      	r4-r5, r15

08011448 <__ledf2>:
 8011448:	14d2      	push      	r4-r5, r15
 801144a:	142e      	subi      	r14, r14, 56
 801144c:	b800      	st.w      	r0, (r14, 0x0)
 801144e:	b821      	st.w      	r1, (r14, 0x4)
 8011450:	6c3b      	mov      	r0, r14
 8011452:	6d47      	mov      	r5, r1
 8011454:	1904      	addi      	r1, r14, 16
 8011456:	b863      	st.w      	r3, (r14, 0xc)
 8011458:	b842      	st.w      	r2, (r14, 0x8)
 801145a:	e0000199 	bsr      	0x801178c	// 801178c <__unpack_d>
 801145e:	1802      	addi      	r0, r14, 8
 8011460:	1909      	addi      	r1, r14, 36
 8011462:	e0000195 	bsr      	0x801178c	// 801178c <__unpack_d>
 8011466:	9864      	ld.w      	r3, (r14, 0x10)
 8011468:	3001      	movi      	r0, 1
 801146a:	64c0      	cmphs      	r0, r3
 801146c:	0808      	bt      	0x801147c	// 801147c <__ledf2+0x34>
 801146e:	9869      	ld.w      	r3, (r14, 0x24)
 8011470:	64c0      	cmphs      	r0, r3
 8011472:	0805      	bt      	0x801147c	// 801147c <__ledf2+0x34>
 8011474:	1909      	addi      	r1, r14, 36
 8011476:	1804      	addi      	r0, r14, 16
 8011478:	e00001fc 	bsr      	0x8011870	// 8011870 <__fpcmp_parts_d>
 801147c:	140e      	addi      	r14, r14, 56
 801147e:	1492      	pop      	r4-r5, r15

08011480 <__floatsidf>:
 8011480:	14d0      	push      	r15
 8011482:	1425      	subi      	r14, r14, 20
 8011484:	3303      	movi      	r3, 3
 8011486:	b860      	st.w      	r3, (r14, 0x0)
 8011488:	487f      	lsri      	r3, r0, 31
 801148a:	b861      	st.w      	r3, (r14, 0x4)
 801148c:	e9200009 	bnez      	r0, 0x801149e	// 801149e <__floatsidf+0x1e>
 8011490:	3302      	movi      	r3, 2
 8011492:	b860      	st.w      	r3, (r14, 0x0)
 8011494:	6c3b      	mov      	r0, r14
 8011496:	e00000b3 	bsr      	0x80115fc	// 80115fc <__pack_d>
 801149a:	1405      	addi      	r14, r14, 20
 801149c:	1490      	pop      	r15
 801149e:	e9a00008 	bhsz      	r0, 0x80114ae	// 80114ae <__floatsidf+0x2e>
 80114a2:	ea238000 	movih      	r3, 32768
 80114a6:	64c2      	cmpne      	r0, r3
 80114a8:	0c1c      	bf      	0x80114e0	// 80114e0 <__floatsidf+0x60>
 80114aa:	3300      	movi      	r3, 0
 80114ac:	5b01      	subu      	r0, r3, r0
 80114ae:	c4007c42 	ff1      	r2, r0
 80114b2:	e422001c 	addi      	r1, r2, 29
 80114b6:	ea0c001f 	movi      	r12, 31
 80114ba:	2a02      	subi      	r2, 3
 80114bc:	4861      	lsri      	r3, r0, 1
 80114be:	6306      	subu      	r12, r1
 80114c0:	c440402d 	lsl      	r13, r0, r2
 80114c4:	3adf      	btsti      	r2, 31
 80114c6:	70f1      	lsr      	r3, r12
 80114c8:	c46d0c20 	incf      	r3, r13, 0
 80114cc:	7004      	lsl      	r0, r1
 80114ce:	b864      	st.w      	r3, (r14, 0x10)
 80114d0:	3300      	movi      	r3, 0
 80114d2:	c4030c20 	incf      	r0, r3, 0
 80114d6:	333c      	movi      	r3, 60
 80114d8:	60c6      	subu      	r3, r1
 80114da:	b803      	st.w      	r0, (r14, 0xc)
 80114dc:	b862      	st.w      	r3, (r14, 0x8)
 80114de:	07db      	br      	0x8011494	// 8011494 <__floatsidf+0x14>
 80114e0:	3000      	movi      	r0, 0
 80114e2:	ea21c1e0 	movih      	r1, 49632
 80114e6:	07da      	br      	0x801149a	// 801149a <__floatsidf+0x1a>

080114e8 <__fixdfsi>:
 80114e8:	14d0      	push      	r15
 80114ea:	1427      	subi      	r14, r14, 28
 80114ec:	b800      	st.w      	r0, (r14, 0x0)
 80114ee:	b821      	st.w      	r1, (r14, 0x4)
 80114f0:	6c3b      	mov      	r0, r14
 80114f2:	1902      	addi      	r1, r14, 8
 80114f4:	e000014c 	bsr      	0x801178c	// 801178c <__unpack_d>
 80114f8:	9862      	ld.w      	r3, (r14, 0x8)
 80114fa:	3202      	movi      	r2, 2
 80114fc:	64c8      	cmphs      	r2, r3
 80114fe:	082a      	bt      	0x8011552	// 8011552 <__fixdfsi+0x6a>
 8011500:	3b44      	cmpnei      	r3, 4
 8011502:	0c06      	bf      	0x801150e	// 801150e <__fixdfsi+0x26>
 8011504:	9804      	ld.w      	r0, (r14, 0x10)
 8011506:	e9800026 	blz      	r0, 0x8011552	// 8011552 <__fixdfsi+0x6a>
 801150a:	383e      	cmplti      	r0, 31
 801150c:	080a      	bt      	0x8011520	// 8011520 <__fixdfsi+0x38>
 801150e:	9863      	ld.w      	r3, (r14, 0xc)
 8011510:	3b40      	cmpnei      	r3, 0
 8011512:	c4000500 	mvc      	r0
 8011516:	c7c05023 	bmaski      	r3, 31
 801151a:	600c      	addu      	r0, r3
 801151c:	1407      	addi      	r14, r14, 28
 801151e:	1490      	pop      	r15
 8011520:	323c      	movi      	r2, 60
 8011522:	5a21      	subu      	r1, r2, r0
 8011524:	e581101f 	subi      	r12, r1, 32
 8011528:	9866      	ld.w      	r3, (r14, 0x18)
 801152a:	321f      	movi      	r2, 31
 801152c:	c5834040 	lsr      	r0, r3, r12
 8011530:	6086      	subu      	r2, r1
 8011532:	4361      	lsli      	r3, r3, 1
 8011534:	70c8      	lsl      	r3, r2
 8011536:	9845      	ld.w      	r2, (r14, 0x14)
 8011538:	7085      	lsr      	r2, r1
 801153a:	6c8c      	or      	r2, r3
 801153c:	9863      	ld.w      	r3, (r14, 0xc)
 801153e:	c7ec2880 	btsti      	r12, 31
 8011542:	c4020c40 	inct      	r0, r2, 0
 8011546:	e903ffeb 	bez      	r3, 0x801151c	// 801151c <__fixdfsi+0x34>
 801154a:	3300      	movi      	r3, 0
 801154c:	5b01      	subu      	r0, r3, r0
 801154e:	1407      	addi      	r14, r14, 28
 8011550:	1490      	pop      	r15
 8011552:	3000      	movi      	r0, 0
 8011554:	1407      	addi      	r14, r14, 28
 8011556:	1490      	pop      	r15

08011558 <__floatunsidf>:
 8011558:	14d1      	push      	r4, r15
 801155a:	1425      	subi      	r14, r14, 20
 801155c:	3100      	movi      	r1, 0
 801155e:	b821      	st.w      	r1, (r14, 0x4)
 8011560:	e9000020 	bez      	r0, 0x80115a0	// 80115a0 <__floatunsidf+0x48>
 8011564:	c4007c42 	ff1      	r2, r0
 8011568:	e582001c 	addi      	r12, r2, 29
 801156c:	3303      	movi      	r3, 3
 801156e:	ea0d001f 	movi      	r13, 31
 8011572:	2a02      	subi      	r2, 3
 8011574:	b860      	st.w      	r3, (r14, 0x0)
 8011576:	6372      	subu      	r13, r12
 8011578:	4861      	lsri      	r3, r0, 1
 801157a:	c4404024 	lsl      	r4, r0, r2
 801157e:	3adf      	btsti      	r2, 31
 8011580:	70f5      	lsr      	r3, r13
 8011582:	c4640c20 	incf      	r3, r4, 0
 8011586:	7030      	lsl      	r0, r12
 8011588:	c4010c20 	incf      	r0, r1, 0
 801158c:	b864      	st.w      	r3, (r14, 0x10)
 801158e:	333c      	movi      	r3, 60
 8011590:	b803      	st.w      	r0, (r14, 0xc)
 8011592:	60f2      	subu      	r3, r12
 8011594:	6c3b      	mov      	r0, r14
 8011596:	b862      	st.w      	r3, (r14, 0x8)
 8011598:	e0000032 	bsr      	0x80115fc	// 80115fc <__pack_d>
 801159c:	1405      	addi      	r14, r14, 20
 801159e:	1491      	pop      	r4, r15
 80115a0:	3302      	movi      	r3, 2
 80115a2:	6c3b      	mov      	r0, r14
 80115a4:	b860      	st.w      	r3, (r14, 0x0)
 80115a6:	e000002b 	bsr      	0x80115fc	// 80115fc <__pack_d>
 80115aa:	1405      	addi      	r14, r14, 20
 80115ac:	1491      	pop      	r4, r15
	...

080115b0 <__muldi3>:
 80115b0:	14c3      	push      	r4-r6
 80115b2:	c602484d 	lsri      	r13, r2, 16
 80115b6:	c40055ec 	zext      	r12, r0, 15, 0
 80115ba:	4890      	lsri      	r4, r0, 16
 80115bc:	c40255e5 	zext      	r5, r2, 15, 0
 80115c0:	c4ac8426 	mult      	r6, r12, r5
 80115c4:	7d50      	mult      	r5, r4
 80115c6:	7f34      	mult      	r12, r13
 80115c8:	7d34      	mult      	r4, r13
 80115ca:	c4ac002d 	addu      	r13, r12, r5
 80115ce:	c606484c 	lsri      	r12, r6, 16
 80115d2:	6334      	addu      	r12, r13
 80115d4:	6570      	cmphs      	r12, r5
 80115d6:	0804      	bt      	0x80115de	// 80115de <__muldi3+0x2e>
 80115d8:	ea2d0001 	movih      	r13, 1
 80115dc:	6134      	addu      	r4, r13
 80115de:	c60c484d 	lsri      	r13, r12, 16
 80115e2:	7cc0      	mult      	r3, r0
 80115e4:	7c48      	mult      	r1, r2
 80115e6:	6134      	addu      	r4, r13
 80115e8:	c60c482c 	lsli      	r12, r12, 16
 80115ec:	c40655e6 	zext      	r6, r6, 15, 0
 80115f0:	604c      	addu      	r1, r3
 80115f2:	c4cc0020 	addu      	r0, r12, r6
 80115f6:	6050      	addu      	r1, r4
 80115f8:	1483      	pop      	r4-r6
	...

080115fc <__pack_d>:
 80115fc:	14c5      	push      	r4-r8
 80115fe:	9020      	ld.w      	r1, (r0, 0x0)
 8011600:	3901      	cmphsi      	r1, 2
 8011602:	9043      	ld.w      	r2, (r0, 0xc)
 8011604:	9064      	ld.w      	r3, (r0, 0x10)
 8011606:	d9a02001 	ld.w      	r13, (r0, 0x4)
 801160a:	0c47      	bf      	0x8011698	// 8011698 <__pack_d+0x9c>
 801160c:	3944      	cmpnei      	r1, 4
 801160e:	0c40      	bf      	0x801168e	// 801168e <__pack_d+0x92>
 8011610:	3942      	cmpnei      	r1, 2
 8011612:	0c28      	bf      	0x8011662	// 8011662 <__pack_d+0x66>
 8011614:	c4622421 	or      	r1, r2, r3
 8011618:	e9010025 	bez      	r1, 0x8011662	// 8011662 <__pack_d+0x66>
 801161c:	9022      	ld.w      	r1, (r0, 0x8)
 801161e:	ea0003fd 	movi      	r0, 1021
 8011622:	6c02      	nor      	r0, r0
 8011624:	6405      	cmplt      	r1, r0
 8011626:	0855      	bt      	0x80116d0	// 80116d0 <__pack_d+0xd4>
 8011628:	eb2103ff 	cmplti      	r1, 1024
 801162c:	0c31      	bf      	0x801168e	// 801168e <__pack_d+0x92>
 801162e:	e40220ff 	andi      	r0, r2, 255
 8011632:	eb400080 	cmpnei      	r0, 128
 8011636:	0c43      	bf      	0x80116bc	// 80116bc <__pack_d+0xc0>
 8011638:	347f      	movi      	r4, 127
 801163a:	3500      	movi      	r5, 0
 801163c:	6489      	cmplt      	r2, r2
 801163e:	6091      	addc      	r2, r4
 8011640:	60d5      	addc      	r3, r5
 8011642:	c7805020 	bmaski      	r0, 29
 8011646:	64c0      	cmphs      	r0, r3
 8011648:	0c19      	bf      	0x801167a	// 801167a <__pack_d+0x7e>
 801164a:	e58103fe 	addi      	r12, r1, 1023
 801164e:	4b28      	lsri      	r1, r3, 8
 8011650:	4398      	lsli      	r4, r3, 24
 8011652:	4a08      	lsri      	r0, r2, 8
 8011654:	c4015663 	zext      	r3, r1, 19, 0
 8011658:	6c4f      	mov      	r1, r3
 801165a:	6c10      	or      	r0, r4
 801165c:	e46c27ff 	andi      	r3, r12, 2047
 8011660:	0404      	br      	0x8011668	// 8011668 <__pack_d+0x6c>
 8011662:	3300      	movi      	r3, 0
 8011664:	3000      	movi      	r0, 0
 8011666:	3100      	movi      	r1, 0
 8011668:	3200      	movi      	r2, 0
 801166a:	c4415e60 	ins      	r2, r1, 19, 0
 801166e:	c4435d54 	ins      	r2, r3, 30, 20
 8011672:	c44d5c1f 	ins      	r2, r13, 31, 31
 8011676:	6c4b      	mov      	r1, r2
 8011678:	1485      	pop      	r4-r8
 801167a:	439f      	lsli      	r4, r3, 31
 801167c:	c422484c 	lsri      	r12, r2, 1
 8011680:	4b01      	lsri      	r0, r3, 1
 8011682:	c5842422 	or      	r2, r4, r12
 8011686:	6cc3      	mov      	r3, r0
 8011688:	e58103ff 	addi      	r12, r1, 1024
 801168c:	07e1      	br      	0x801164e	// 801164e <__pack_d+0x52>
 801168e:	ea0307ff 	movi      	r3, 2047
 8011692:	3000      	movi      	r0, 0
 8011694:	3100      	movi      	r1, 0
 8011696:	07e9      	br      	0x8011668	// 8011668 <__pack_d+0x6c>
 8011698:	c703482c 	lsli      	r12, r3, 24
 801169c:	4a48      	lsri      	r2, r2, 8
 801169e:	c44c2420 	or      	r0, r12, r2
 80116a2:	c5035741 	zext      	r1, r3, 26, 8
 80116a6:	3200      	movi      	r2, 0
 80116a8:	ea230008 	movih      	r3, 8
 80116ac:	6c08      	or      	r0, r2
 80116ae:	6c4c      	or      	r1, r3
 80116b0:	c4015663 	zext      	r3, r1, 19, 0
 80116b4:	6c4f      	mov      	r1, r3
 80116b6:	ea0307ff 	movi      	r3, 2047
 80116ba:	07d7      	br      	0x8011668	// 8011668 <__pack_d+0x6c>
 80116bc:	e4022100 	andi      	r0, r2, 256
 80116c0:	e900ffc1 	bez      	r0, 0x8011642	// 8011642 <__pack_d+0x46>
 80116c4:	3480      	movi      	r4, 128
 80116c6:	3500      	movi      	r5, 0
 80116c8:	6489      	cmplt      	r2, r2
 80116ca:	6091      	addc      	r2, r4
 80116cc:	60d5      	addc      	r3, r5
 80116ce:	07ba      	br      	0x8011642	// 8011642 <__pack_d+0x46>
 80116d0:	5825      	subu      	r1, r0, r1
 80116d2:	eb210038 	cmplti      	r1, 57
 80116d6:	0fc6      	bf      	0x8011662	// 8011662 <__pack_d+0x66>
 80116d8:	341f      	movi      	r4, 31
 80116da:	c423482c 	lsli      	r12, r3, 1
 80116de:	6106      	subu      	r4, r1
 80116e0:	e401101f 	subi      	r0, r1, 32
 80116e4:	7310      	lsl      	r12, r4
 80116e6:	c4224046 	lsr      	r6, r2, r1
 80116ea:	38df      	btsti      	r0, 31
 80116ec:	c4034045 	lsr      	r5, r3, r0
 80116f0:	ea080000 	movi      	r8, 0
 80116f4:	6db0      	or      	r6, r12
 80116f6:	ea0c0001 	movi      	r12, 1
 80116fa:	c4c50c20 	incf      	r6, r5, 0
 80116fe:	c40c4020 	lsl      	r0, r12, r0
 8011702:	6d63      	mov      	r5, r8
 8011704:	c42c4024 	lsl      	r4, r12, r1
 8011708:	c4234047 	lsr      	r7, r3, r1
 801170c:	c4a00c20 	incf      	r5, r0, 0
 8011710:	c4880c20 	incf      	r4, r8, 0
 8011714:	c4e80c20 	incf      	r7, r8, 0
 8011718:	3c40      	cmpnei      	r4, 0
 801171a:	c4a50c81 	decf      	r5, r5, 1
 801171e:	2c00      	subi      	r4, 1
 8011720:	6890      	and      	r2, r4
 8011722:	68d4      	and      	r3, r5
 8011724:	6c8c      	or      	r2, r3
 8011726:	3a40      	cmpnei      	r2, 0
 8011728:	c4000502 	mvc      	r2
 801172c:	6ce3      	mov      	r3, r8
 801172e:	6d88      	or      	r6, r2
 8011730:	6dcc      	or      	r7, r3
 8011732:	e46620ff 	andi      	r3, r6, 255
 8011736:	eb430080 	cmpnei      	r3, 128
 801173a:	0814      	bt      	0x8011762	// 8011762 <__pack_d+0x166>
 801173c:	e4662100 	andi      	r3, r6, 256
 8011740:	e9230023 	bnez      	r3, 0x8011786	// 8011786 <__pack_d+0x18a>
 8011744:	4758      	lsli      	r2, r7, 24
 8011746:	4f28      	lsri      	r1, r7, 8
 8011748:	4e08      	lsri      	r0, r6, 8
 801174a:	6c08      	or      	r0, r2
 801174c:	c4015662 	zext      	r2, r1, 19, 0
 8011750:	6c4b      	mov      	r1, r2
 8011752:	c7605022 	bmaski      	r2, 28
 8011756:	65c8      	cmphs      	r2, r7
 8011758:	0c02      	bf      	0x801175c	// 801175c <__pack_d+0x160>
 801175a:	6f0f      	mov      	r12, r3
 801175c:	e46c2001 	andi      	r3, r12, 1
 8011760:	0784      	br      	0x8011668	// 8011668 <__pack_d+0x6c>
 8011762:	327f      	movi      	r2, 127
 8011764:	3300      	movi      	r3, 0
 8011766:	6599      	cmplt      	r6, r6
 8011768:	6189      	addc      	r6, r2
 801176a:	61cd      	addc      	r7, r3
 801176c:	4778      	lsli      	r3, r7, 24
 801176e:	4f28      	lsri      	r1, r7, 8
 8011770:	4e08      	lsri      	r0, r6, 8
 8011772:	6c0c      	or      	r0, r3
 8011774:	c4015663 	zext      	r3, r1, 19, 0
 8011778:	6c4f      	mov      	r1, r3
 801177a:	c7605023 	bmaski      	r3, 28
 801177e:	65cc      	cmphs      	r3, r7
 8011780:	0fee      	bf      	0x801175c	// 801175c <__pack_d+0x160>
 8011782:	6f23      	mov      	r12, r8
 8011784:	07ec      	br      	0x801175c	// 801175c <__pack_d+0x160>
 8011786:	3280      	movi      	r2, 128
 8011788:	07ee      	br      	0x8011764	// 8011764 <__pack_d+0x168>
	...

0801178c <__unpack_d>:
 801178c:	1421      	subi      	r14, r14, 4
 801178e:	dd6e2000 	st.w      	r11, (r14, 0x0)
 8011792:	8863      	ld.h      	r3, (r0, 0x6)
 8011794:	8047      	ld.b      	r2, (r0, 0x7)
 8011796:	c48355c3 	zext      	r3, r3, 14, 4
 801179a:	d9802001 	ld.w      	r12, (r0, 0x4)
 801179e:	4a47      	lsri      	r2, r2, 7
 80117a0:	d9a02000 	ld.w      	r13, (r0, 0x0)
 80117a4:	c40c566c 	zext      	r12, r12, 19, 0
 80117a8:	b141      	st.w      	r2, (r1, 0x4)
 80117aa:	e9230025 	bnez      	r3, 0x80117f4	// 80117f4 <__unpack_d+0x68>
 80117ae:	c58d2423 	or      	r3, r13, r12
 80117b2:	e903003c 	bez      	r3, 0x801182a	// 801182a <__unpack_d+0x9e>
 80117b6:	c70d4840 	lsri      	r0, r13, 24
 80117ba:	c50c4823 	lsli      	r3, r12, 8
 80117be:	6cc0      	or      	r3, r0
 80117c0:	3003      	movi      	r0, 3
 80117c2:	c50d4822 	lsli      	r2, r13, 8
 80117c6:	b100      	st.w      	r0, (r1, 0x0)
 80117c8:	c760502d 	bmaski      	r13, 28
 80117cc:	ea0003fe 	movi      	r0, 1022
 80117d0:	6c02      	nor      	r0, r0
 80117d2:	6ecb      	mov      	r11, r2
 80117d4:	6f0f      	mov      	r12, r3
 80117d6:	6489      	cmplt      	r2, r2
 80117d8:	60ad      	addc      	r2, r11
 80117da:	60f1      	addc      	r3, r12
 80117dc:	64f4      	cmphs      	r13, r3
 80117de:	6f03      	mov      	r12, r0
 80117e0:	2800      	subi      	r0, 1
 80117e2:	0bf8      	bt      	0x80117d2	// 80117d2 <__unpack_d+0x46>
 80117e4:	dd812002 	st.w      	r12, (r1, 0x8)
 80117e8:	b143      	st.w      	r2, (r1, 0xc)
 80117ea:	b164      	st.w      	r3, (r1, 0x10)
 80117ec:	d96e2000 	ld.w      	r11, (r14, 0x0)
 80117f0:	1401      	addi      	r14, r14, 4
 80117f2:	783c      	jmp      	r15
 80117f4:	eb4307ff 	cmpnei      	r3, 2047
 80117f8:	0c1f      	bf      	0x8011836	// 8011836 <__unpack_d+0xaa>
 80117fa:	e46313fe 	subi      	r3, r3, 1023
 80117fe:	b162      	st.w      	r3, (r1, 0x8)
 8011800:	3303      	movi      	r3, 3
 8011802:	c70d4840 	lsri      	r0, r13, 24
 8011806:	b160      	st.w      	r3, (r1, 0x0)
 8011808:	c50c4823 	lsli      	r3, r12, 8
 801180c:	c50d4822 	lsli      	r2, r13, 8
 8011810:	6cc0      	or      	r3, r0
 8011812:	ea0c0000 	movi      	r12, 0
 8011816:	ea2d1000 	movih      	r13, 4096
 801181a:	6cb0      	or      	r2, r12
 801181c:	6cf4      	or      	r3, r13
 801181e:	b143      	st.w      	r2, (r1, 0xc)
 8011820:	b164      	st.w      	r3, (r1, 0x10)
 8011822:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011826:	1401      	addi      	r14, r14, 4
 8011828:	783c      	jmp      	r15
 801182a:	3302      	movi      	r3, 2
 801182c:	b160      	st.w      	r3, (r1, 0x0)
 801182e:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011832:	1401      	addi      	r14, r14, 4
 8011834:	783c      	jmp      	r15
 8011836:	c58d2423 	or      	r3, r13, r12
 801183a:	e9030018 	bez      	r3, 0x801186a	// 801186a <__unpack_d+0xde>
 801183e:	ea230008 	movih      	r3, 8
 8011842:	68f0      	and      	r3, r12
 8011844:	3b40      	cmpnei      	r3, 0
 8011846:	3201      	movi      	r2, 1
 8011848:	c4620c40 	inct      	r3, r2, 0
 801184c:	b160      	st.w      	r3, (r1, 0x0)
 801184e:	c50c482c 	lsli      	r12, r12, 8
 8011852:	c70d4843 	lsri      	r3, r13, 24
 8011856:	6f0c      	or      	r12, r3
 8011858:	c50d482d 	lsli      	r13, r13, 8
 801185c:	c76c282c 	bclri      	r12, r12, 27
 8011860:	dda12003 	st.w      	r13, (r1, 0xc)
 8011864:	dd812004 	st.w      	r12, (r1, 0x10)
 8011868:	07dd      	br      	0x8011822	// 8011822 <__unpack_d+0x96>
 801186a:	3304      	movi      	r3, 4
 801186c:	b160      	st.w      	r3, (r1, 0x0)
 801186e:	07da      	br      	0x8011822	// 8011822 <__unpack_d+0x96>

08011870 <__fpcmp_parts_d>:
 8011870:	9040      	ld.w      	r2, (r0, 0x0)
 8011872:	3301      	movi      	r3, 1
 8011874:	648c      	cmphs      	r3, r2
 8011876:	0830      	bt      	0x80118d6	// 80118d6 <__fpcmp_parts_d+0x66>
 8011878:	d9812000 	ld.w      	r12, (r1, 0x0)
 801187c:	670c      	cmphs      	r3, r12
 801187e:	082c      	bt      	0x80118d6	// 80118d6 <__fpcmp_parts_d+0x66>
 8011880:	3a44      	cmpnei      	r2, 4
 8011882:	0c1f      	bf      	0x80118c0	// 80118c0 <__fpcmp_parts_d+0x50>
 8011884:	eb4c0004 	cmpnei      	r12, 4
 8011888:	0c14      	bf      	0x80118b0	// 80118b0 <__fpcmp_parts_d+0x40>
 801188a:	3a42      	cmpnei      	r2, 2
 801188c:	0c0f      	bf      	0x80118aa	// 80118aa <__fpcmp_parts_d+0x3a>
 801188e:	eb4c0002 	cmpnei      	r12, 2
 8011892:	0c1a      	bf      	0x80118c6	// 80118c6 <__fpcmp_parts_d+0x56>
 8011894:	9041      	ld.w      	r2, (r0, 0x4)
 8011896:	d9812001 	ld.w      	r12, (r1, 0x4)
 801189a:	670a      	cmpne      	r2, r12
 801189c:	0c1f      	bf      	0x80118da	// 80118da <__fpcmp_parts_d+0x6a>
 801189e:	3000      	movi      	r0, 0
 80118a0:	2800      	subi      	r0, 1
 80118a2:	3a40      	cmpnei      	r2, 0
 80118a4:	c4030c20 	incf      	r0, r3, 0
 80118a8:	783c      	jmp      	r15
 80118aa:	eb4c0002 	cmpnei      	r12, 2
 80118ae:	0c2a      	bf      	0x8011902	// 8011902 <__fpcmp_parts_d+0x92>
 80118b0:	9141      	ld.w      	r2, (r1, 0x4)
 80118b2:	3300      	movi      	r3, 0
 80118b4:	2b00      	subi      	r3, 1
 80118b6:	3a40      	cmpnei      	r2, 0
 80118b8:	3001      	movi      	r0, 1
 80118ba:	c4030c20 	incf      	r0, r3, 0
 80118be:	783c      	jmp      	r15
 80118c0:	eb4c0004 	cmpnei      	r12, 4
 80118c4:	0c21      	bf      	0x8011906	// 8011906 <__fpcmp_parts_d+0x96>
 80118c6:	9061      	ld.w      	r3, (r0, 0x4)
 80118c8:	3000      	movi      	r0, 0
 80118ca:	3b40      	cmpnei      	r3, 0
 80118cc:	2800      	subi      	r0, 1
 80118ce:	3301      	movi      	r3, 1
 80118d0:	c4030c20 	incf      	r0, r3, 0
 80118d4:	783c      	jmp      	r15
 80118d6:	6c0f      	mov      	r0, r3
 80118d8:	783c      	jmp      	r15
 80118da:	d9a02002 	ld.w      	r13, (r0, 0x8)
 80118de:	d9812002 	ld.w      	r12, (r1, 0x8)
 80118e2:	6771      	cmplt      	r12, r13
 80118e4:	0bdd      	bt      	0x801189e	// 801189e <__fpcmp_parts_d+0x2e>
 80118e6:	6735      	cmplt      	r13, r12
 80118e8:	0c13      	bf      	0x801190e	// 801190e <__fpcmp_parts_d+0x9e>
 80118ea:	3000      	movi      	r0, 0
 80118ec:	2800      	subi      	r0, 1
 80118ee:	3a40      	cmpnei      	r2, 0
 80118f0:	c4030c40 	inct      	r0, r3, 0
 80118f4:	07da      	br      	0x80118a8	// 80118a8 <__fpcmp_parts_d+0x38>
 80118f6:	644c      	cmphs      	r3, r1
 80118f8:	0fdd      	bf      	0x80118b2	// 80118b2 <__fpcmp_parts_d+0x42>
 80118fa:	64c6      	cmpne      	r1, r3
 80118fc:	0803      	bt      	0x8011902	// 8011902 <__fpcmp_parts_d+0x92>
 80118fe:	6430      	cmphs      	r12, r0
 8011900:	0fd9      	bf      	0x80118b2	// 80118b2 <__fpcmp_parts_d+0x42>
 8011902:	3000      	movi      	r0, 0
 8011904:	07d2      	br      	0x80118a8	// 80118a8 <__fpcmp_parts_d+0x38>
 8011906:	9161      	ld.w      	r3, (r1, 0x4)
 8011908:	9001      	ld.w      	r0, (r0, 0x4)
 801190a:	5b01      	subu      	r0, r3, r0
 801190c:	07ce      	br      	0x80118a8	// 80118a8 <__fpcmp_parts_d+0x38>
 801190e:	9064      	ld.w      	r3, (r0, 0x10)
 8011910:	d9802003 	ld.w      	r12, (r0, 0xc)
 8011914:	9103      	ld.w      	r0, (r1, 0xc)
 8011916:	9124      	ld.w      	r1, (r1, 0x10)
 8011918:	64c4      	cmphs      	r1, r3
 801191a:	0c05      	bf      	0x8011924	// 8011924 <__fpcmp_parts_d+0xb4>
 801191c:	644e      	cmpne      	r3, r1
 801191e:	0bec      	bt      	0x80118f6	// 80118f6 <__fpcmp_parts_d+0x86>
 8011920:	6700      	cmphs      	r0, r12
 8011922:	0bea      	bt      	0x80118f6	// 80118f6 <__fpcmp_parts_d+0x86>
 8011924:	3000      	movi      	r0, 0
 8011926:	2800      	subi      	r0, 1
 8011928:	3a40      	cmpnei      	r2, 0
 801192a:	3301      	movi      	r3, 1
 801192c:	c4030c20 	incf      	r0, r3, 0
 8011930:	07bc      	br      	0x80118a8	// 80118a8 <__fpcmp_parts_d+0x38>
	...

08011934 <__GI_putchar>:
 8011934:	14d0      	push      	r15
 8011936:	1063      	lrw      	r3, 0x20000120	// 8011940 <__GI_putchar+0xc>
 8011938:	9320      	ld.w      	r1, (r3, 0x0)
 801193a:	e000018b 	bsr      	0x8011c50	// 8011c50 <__GI_putc>
 801193e:	1490      	pop      	r15
 8011940:	20000120 	.long	0x20000120

08011944 <__GI_puts>:
 8011944:	14d1      	push      	r4, r15
 8011946:	1085      	lrw      	r4, 0x20000120	// 8011958 <__GI_puts+0x14>
 8011948:	9420      	ld.w      	r1, (r4, 0x0)
 801194a:	e0000009 	bsr      	0x801195c	// 801195c <__GI_fputs>
 801194e:	9420      	ld.w      	r1, (r4, 0x0)
 8011950:	300a      	movi      	r0, 10
 8011952:	e00020eb 	bsr      	0x8015b28	// 8015b28 <fputc>
 8011956:	1491      	pop      	r4, r15
 8011958:	20000120 	.long	0x20000120

0801195c <__GI_fputs>:
 801195c:	14d5      	push      	r4-r8, r15
 801195e:	6d03      	mov      	r4, r0
 8011960:	6d87      	mov      	r6, r1
 8011962:	e9010018 	bez      	r1, 0x8011992	// 8011992 <__GI_fputs+0x36>
 8011966:	e5010017 	addi      	r8, r1, 24
 801196a:	6c23      	mov      	r0, r8
 801196c:	e000016c 	bsr      	0x8011c44	// 8011c44 <__GI_os_critical_enter>
 8011970:	8400      	ld.b      	r0, (r4, 0x0)
 8011972:	e9000014 	bez      	r0, 0x801199a	// 801199a <__GI_fputs+0x3e>
 8011976:	3500      	movi      	r5, 0
 8011978:	6dd7      	mov      	r7, r5
 801197a:	2f00      	subi      	r7, 1
 801197c:	0406      	br      	0x8011988	// 8011988 <__GI_fputs+0x2c>
 801197e:	2400      	addi      	r4, 1
 8011980:	8400      	ld.b      	r0, (r4, 0x0)
 8011982:	2500      	addi      	r5, 1
 8011984:	e900000c 	bez      	r0, 0x801199c	// 801199c <__GI_fputs+0x40>
 8011988:	6c5b      	mov      	r1, r6
 801198a:	e00020cf 	bsr      	0x8015b28	// 8015b28 <fputc>
 801198e:	65c2      	cmpne      	r0, r7
 8011990:	0bf7      	bt      	0x801197e	// 801197e <__GI_fputs+0x22>
 8011992:	3500      	movi      	r5, 0
 8011994:	2d00      	subi      	r5, 1
 8011996:	6c17      	mov      	r0, r5
 8011998:	1495      	pop      	r4-r8, r15
 801199a:	6d43      	mov      	r5, r0
 801199c:	6c23      	mov      	r0, r8
 801199e:	e0000155 	bsr      	0x8011c48	// 8011c48 <__GI_os_critical_exit>
 80119a2:	6c17      	mov      	r0, r5
 80119a4:	1495      	pop      	r4-r8, r15
	...

080119a8 <__memset_fast>:
 80119a8:	7444      	zextb      	r1, r1
 80119aa:	e9020023 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 80119ae:	6f43      	mov      	r13, r0
 80119b0:	e5802003 	andi      	r12, r0, 3
 80119b4:	e90c001f 	bez      	r12, 0x80119f2	// 80119f2 <__memset_fast+0x4a>
 80119b8:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80119bc:	2a00      	subi      	r2, 1
 80119be:	e9020019 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 80119c2:	e5ad0000 	addi      	r13, r13, 1
 80119c6:	e58d2003 	andi      	r12, r13, 3
 80119ca:	e90c0014 	bez      	r12, 0x80119f2	// 80119f2 <__memset_fast+0x4a>
 80119ce:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80119d2:	2a00      	subi      	r2, 1
 80119d4:	e902000e 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 80119d8:	e5ad0000 	addi      	r13, r13, 1
 80119dc:	e58d2003 	andi      	r12, r13, 3
 80119e0:	e90c0009 	bez      	r12, 0x80119f2	// 80119f2 <__memset_fast+0x4a>
 80119e4:	dc2d0000 	st.b      	r1, (r13, 0x0)
 80119e8:	2a00      	subi      	r2, 1
 80119ea:	e5ad0000 	addi      	r13, r13, 1
 80119ee:	0402      	br      	0x80119f2	// 80119f2 <__memset_fast+0x4a>
 80119f0:	783c      	jmp      	r15
 80119f2:	4168      	lsli      	r3, r1, 8
 80119f4:	6c4c      	or      	r1, r3
 80119f6:	4170      	lsli      	r3, r1, 16
 80119f8:	6c4c      	or      	r1, r3
 80119fa:	3a2f      	cmplti      	r2, 16
 80119fc:	080e      	bt      	0x8011a18	// 8011a18 <__memset_fast+0x70>
 80119fe:	dc2d2000 	st.w      	r1, (r13, 0x0)
 8011a02:	dc2d2001 	st.w      	r1, (r13, 0x4)
 8011a06:	dc2d2002 	st.w      	r1, (r13, 0x8)
 8011a0a:	dc2d2003 	st.w      	r1, (r13, 0xc)
 8011a0e:	2a0f      	subi      	r2, 16
 8011a10:	e5ad000f 	addi      	r13, r13, 16
 8011a14:	3a2f      	cmplti      	r2, 16
 8011a16:	0ff4      	bf      	0x80119fe	// 80119fe <__memset_fast+0x56>
 8011a18:	3a23      	cmplti      	r2, 4
 8011a1a:	0808      	bt      	0x8011a2a	// 8011a2a <__memset_fast+0x82>
 8011a1c:	2a03      	subi      	r2, 4
 8011a1e:	dc2d2000 	st.w      	r1, (r13, 0x0)
 8011a22:	e5ad0003 	addi      	r13, r13, 4
 8011a26:	3a23      	cmplti      	r2, 4
 8011a28:	0ffa      	bf      	0x8011a1c	// 8011a1c <__memset_fast+0x74>
 8011a2a:	e902ffe3 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 8011a2e:	2a00      	subi      	r2, 1
 8011a30:	dc2d0000 	st.b      	r1, (r13, 0x0)
 8011a34:	e902ffde 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 8011a38:	2a00      	subi      	r2, 1
 8011a3a:	dc2d0001 	st.b      	r1, (r13, 0x1)
 8011a3e:	e902ffd9 	bez      	r2, 0x80119f0	// 80119f0 <__memset_fast+0x48>
 8011a42:	dc2d0002 	st.b      	r1, (r13, 0x2)
 8011a46:	783c      	jmp      	r15

08011a48 <__memcpy_fast>:
 8011a48:	14c1      	push      	r4
 8011a4a:	6f03      	mov      	r12, r0
 8011a4c:	c401242d 	or      	r13, r1, r0
 8011a50:	e48d2003 	andi      	r4, r13, 3
 8011a54:	e904000e 	bez      	r4, 0x8011a70	// 8011a70 <__memcpy_fast+0x28>
 8011a58:	e902000b 	bez      	r2, 0x8011a6e	// 8011a6e <__memcpy_fast+0x26>
 8011a5c:	8160      	ld.b      	r3, (r1, 0x0)
 8011a5e:	2100      	addi      	r1, 1
 8011a60:	2a00      	subi      	r2, 1
 8011a62:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011a66:	e58c0000 	addi      	r12, r12, 1
 8011a6a:	e922fff9 	bnez      	r2, 0x8011a5c	// 8011a5c <__memcpy_fast+0x14>
 8011a6e:	1481      	pop      	r4
 8011a70:	3a2f      	cmplti      	r2, 16
 8011a72:	0815      	bt      	0x8011a9c	// 8011a9c <__memcpy_fast+0x54>
 8011a74:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8011a78:	9161      	ld.w      	r3, (r1, 0x4)
 8011a7a:	9182      	ld.w      	r4, (r1, 0x8)
 8011a7c:	ddac2000 	st.w      	r13, (r12, 0x0)
 8011a80:	d9a12003 	ld.w      	r13, (r1, 0xc)
 8011a84:	dc6c2001 	st.w      	r3, (r12, 0x4)
 8011a88:	dc8c2002 	st.w      	r4, (r12, 0x8)
 8011a8c:	ddac2003 	st.w      	r13, (r12, 0xc)
 8011a90:	2a0f      	subi      	r2, 16
 8011a92:	210f      	addi      	r1, 16
 8011a94:	e58c000f 	addi      	r12, r12, 16
 8011a98:	3a2f      	cmplti      	r2, 16
 8011a9a:	0fed      	bf      	0x8011a74	// 8011a74 <__memcpy_fast+0x2c>
 8011a9c:	3a23      	cmplti      	r2, 4
 8011a9e:	080a      	bt      	0x8011ab2	// 8011ab2 <__memcpy_fast+0x6a>
 8011aa0:	9160      	ld.w      	r3, (r1, 0x0)
 8011aa2:	2a03      	subi      	r2, 4
 8011aa4:	2103      	addi      	r1, 4
 8011aa6:	dc6c2000 	st.w      	r3, (r12, 0x0)
 8011aaa:	e58c0003 	addi      	r12, r12, 4
 8011aae:	3a23      	cmplti      	r2, 4
 8011ab0:	0ff8      	bf      	0x8011aa0	// 8011aa0 <__memcpy_fast+0x58>
 8011ab2:	e902ffde 	bez      	r2, 0x8011a6e	// 8011a6e <__memcpy_fast+0x26>
 8011ab6:	8160      	ld.b      	r3, (r1, 0x0)
 8011ab8:	2100      	addi      	r1, 1
 8011aba:	2a00      	subi      	r2, 1
 8011abc:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011ac0:	e58c0000 	addi      	r12, r12, 1
 8011ac4:	07f7      	br      	0x8011ab2	// 8011ab2 <__memcpy_fast+0x6a>
	...

08011ac8 <__GI_strncpy>:
 8011ac8:	6f03      	mov      	r12, r0
 8011aca:	040a      	br      	0x8011ade	// 8011ade <__GI_strncpy+0x16>
 8011acc:	2a00      	subi      	r2, 1
 8011ace:	8160      	ld.b      	r3, (r1, 0x0)
 8011ad0:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011ad4:	e58c0000 	addi      	r12, r12, 1
 8011ad8:	3b40      	cmpnei      	r3, 0
 8011ada:	0c0a      	bf      	0x8011aee	// 8011aee <__GI_strncpy+0x26>
 8011adc:	2100      	addi      	r1, 1
 8011ade:	3a40      	cmpnei      	r2, 0
 8011ae0:	0bf6      	bt      	0x8011acc	// 8011acc <__GI_strncpy+0x4>
 8011ae2:	783c      	jmp      	r15
 8011ae4:	dc6c0000 	st.b      	r3, (r12, 0x0)
 8011ae8:	e58c0000 	addi      	r12, r12, 1
 8011aec:	2a00      	subi      	r2, 1
 8011aee:	3a40      	cmpnei      	r2, 0
 8011af0:	0bfa      	bt      	0x8011ae4	// 8011ae4 <__GI_strncpy+0x1c>
 8011af2:	783c      	jmp      	r15

08011af4 <__memcmp_fast>:
 8011af4:	14c1      	push      	r4
 8011af6:	e90200a2 	bez      	r2, 0x8011c3a	// 8011c3a <__memcmp_fast+0x146>
 8011afa:	6f03      	mov      	r12, r0
 8011afc:	6c04      	or      	r0, r1
 8011afe:	e4002003 	andi      	r0, r0, 3
 8011b02:	e9200073 	bnez      	r0, 0x8011be8	// 8011be8 <__memcmp_fast+0xf4>
 8011b06:	d80c2000 	ld.w      	r0, (r12, 0x0)
 8011b0a:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8011b0e:	6742      	cmpne      	r0, r13
 8011b10:	0847      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b12:	3a24      	cmplti      	r2, 5
 8011b14:	0868      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b16:	2a03      	subi      	r2, 4
 8011b18:	d80c2001 	ld.w      	r0, (r12, 0x4)
 8011b1c:	d9a12001 	ld.w      	r13, (r1, 0x4)
 8011b20:	6742      	cmpne      	r0, r13
 8011b22:	083e      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b24:	3a24      	cmplti      	r2, 5
 8011b26:	085f      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b28:	2a03      	subi      	r2, 4
 8011b2a:	d80c2002 	ld.w      	r0, (r12, 0x8)
 8011b2e:	d9a12002 	ld.w      	r13, (r1, 0x8)
 8011b32:	6742      	cmpne      	r0, r13
 8011b34:	0835      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b36:	3a24      	cmplti      	r2, 5
 8011b38:	0856      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b3a:	2a03      	subi      	r2, 4
 8011b3c:	d80c2003 	ld.w      	r0, (r12, 0xc)
 8011b40:	d9a12003 	ld.w      	r13, (r1, 0xc)
 8011b44:	6742      	cmpne      	r0, r13
 8011b46:	082c      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b48:	3a24      	cmplti      	r2, 5
 8011b4a:	084d      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b4c:	2a03      	subi      	r2, 4
 8011b4e:	d80c2004 	ld.w      	r0, (r12, 0x10)
 8011b52:	d9a12004 	ld.w      	r13, (r1, 0x10)
 8011b56:	6742      	cmpne      	r0, r13
 8011b58:	0823      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b5a:	3a24      	cmplti      	r2, 5
 8011b5c:	0844      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b5e:	2a03      	subi      	r2, 4
 8011b60:	d80c2005 	ld.w      	r0, (r12, 0x14)
 8011b64:	d9a12005 	ld.w      	r13, (r1, 0x14)
 8011b68:	6742      	cmpne      	r0, r13
 8011b6a:	081a      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b6c:	3a24      	cmplti      	r2, 5
 8011b6e:	083b      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b70:	2a03      	subi      	r2, 4
 8011b72:	d80c2006 	ld.w      	r0, (r12, 0x18)
 8011b76:	d9a12006 	ld.w      	r13, (r1, 0x18)
 8011b7a:	6742      	cmpne      	r0, r13
 8011b7c:	0811      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b7e:	3a24      	cmplti      	r2, 5
 8011b80:	0832      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b82:	2a03      	subi      	r2, 4
 8011b84:	d80c2007 	ld.w      	r0, (r12, 0x1c)
 8011b88:	d9a12007 	ld.w      	r13, (r1, 0x1c)
 8011b8c:	6742      	cmpne      	r0, r13
 8011b8e:	0808      	bt      	0x8011b9e	// 8011b9e <__memcmp_fast+0xaa>
 8011b90:	3a24      	cmplti      	r2, 5
 8011b92:	0829      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011b94:	2a03      	subi      	r2, 4
 8011b96:	e58c001f 	addi      	r12, r12, 32
 8011b9a:	211f      	addi      	r1, 32
 8011b9c:	07b5      	br      	0x8011b06	// 8011b06 <__memcmp_fast+0x12>
 8011b9e:	e902004d 	bez      	r2, 0x8011c38	// 8011c38 <__memcmp_fast+0x144>
 8011ba2:	c4007103 	xtrb3      	r3, r0
 8011ba6:	c40d7104 	xtrb3      	r4, r13
 8011baa:	650e      	cmpne      	r3, r4
 8011bac:	081a      	bt      	0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bae:	2a00      	subi      	r2, 1
 8011bb0:	e9020018 	bez      	r2, 0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bb4:	c4007083 	xtrb2      	r3, r0
 8011bb8:	c40d7084 	xtrb2      	r4, r13
 8011bbc:	650e      	cmpne      	r3, r4
 8011bbe:	0811      	bt      	0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bc0:	2a00      	subi      	r2, 1
 8011bc2:	e902000f 	bez      	r2, 0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bc6:	c4007043 	xtrb1      	r3, r0
 8011bca:	c40d7044 	xtrb1      	r4, r13
 8011bce:	650e      	cmpne      	r3, r4
 8011bd0:	0808      	bt      	0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bd2:	2a00      	subi      	r2, 1
 8011bd4:	e9020006 	bez      	r2, 0x8011be0	// 8011be0 <__memcmp_fast+0xec>
 8011bd8:	c4007023 	xtrb0      	r3, r0
 8011bdc:	c40d7024 	xtrb0      	r4, r13
 8011be0:	5b11      	subu      	r0, r3, r4
 8011be2:	1481      	pop      	r4
 8011be4:	6036      	subu      	r0, r13
 8011be6:	1481      	pop      	r4
 8011be8:	d80c0000 	ld.b      	r0, (r12, 0x0)
 8011bec:	d9a10000 	ld.b      	r13, (r1, 0x0)
 8011bf0:	6742      	cmpne      	r0, r13
 8011bf2:	0bf9      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011bf4:	2a00      	subi      	r2, 1
 8011bf6:	e902fff7 	bez      	r2, 0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011bfa:	d80c0001 	ld.b      	r0, (r12, 0x1)
 8011bfe:	d9a10001 	ld.b      	r13, (r1, 0x1)
 8011c02:	6742      	cmpne      	r0, r13
 8011c04:	0bf0      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c06:	2a00      	subi      	r2, 1
 8011c08:	e902ffee 	bez      	r2, 0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c0c:	d80c0002 	ld.b      	r0, (r12, 0x2)
 8011c10:	d9a10002 	ld.b      	r13, (r1, 0x2)
 8011c14:	6742      	cmpne      	r0, r13
 8011c16:	0be7      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c18:	2a00      	subi      	r2, 1
 8011c1a:	e902ffe5 	bez      	r2, 0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c1e:	d80c0003 	ld.b      	r0, (r12, 0x3)
 8011c22:	d9a10003 	ld.b      	r13, (r1, 0x3)
 8011c26:	6742      	cmpne      	r0, r13
 8011c28:	0bde      	bt      	0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c2a:	2a00      	subi      	r2, 1
 8011c2c:	e902ffdc 	bez      	r2, 0x8011be4	// 8011be4 <__memcmp_fast+0xf0>
 8011c30:	e58c0003 	addi      	r12, r12, 4
 8011c34:	2103      	addi      	r1, 4
 8011c36:	07d9      	br      	0x8011be8	// 8011be8 <__memcmp_fast+0xf4>
 8011c38:	3000      	movi      	r0, 0
 8011c3a:	3000      	movi      	r0, 0
 8011c3c:	1481      	pop      	r4
	...

08011c40 <__GI_os_critical_open>:
 8011c40:	3000      	movi      	r0, 0
 8011c42:	783c      	jmp      	r15

08011c44 <__GI_os_critical_enter>:
 8011c44:	3000      	movi      	r0, 0
 8011c46:	783c      	jmp      	r15

08011c48 <__GI_os_critical_exit>:
 8011c48:	3000      	movi      	r0, 0
 8011c4a:	783c      	jmp      	r15

08011c4c <__GI_os_critical_close>:
 8011c4c:	3000      	movi      	r0, 0
 8011c4e:	783c      	jmp      	r15

08011c50 <__GI_putc>:
 8011c50:	14d0      	push      	r15
 8011c52:	e0001f6b 	bsr      	0x8015b28	// 8015b28 <fputc>
 8011c56:	1490      	pop      	r15

08011c58 <tls_os_task_create>:
      void* param,
      uint8_t *stk_start,
      uint32_t stk_size,
      uint32_t prio,
      uint32_t flag)
{
 8011c58:	14d0      	push      	r15
 8011c5a:	1424      	subi      	r14, r14, 16
 8011c5c:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
//    	printf("\nCurrent Stack [0x%8x, 0x%8x) is NOT in VALID STACK range [0x20000000,0x20028000)\n", (uint32_t)stk_start, (uint32_t)(stk_start + stk_size));
//    	printf("Please refer to APIs' manul and modify task stack position!!!\n");
//    	return TLS_OS_ERROR;
//    }

	error = xTaskCreateExt(entry,
 8011c60:	b801      	st.w      	r0, (r14, 0x4)
 8011c62:	303f      	movi      	r0, 63
{
 8011c64:	6f0b      	mov      	r12, r2
	error = xTaskCreateExt(entry,
 8011c66:	6036      	subu      	r0, r13
{
 8011c68:	da4e2005 	ld.w      	r18, (r14, 0x14)
 8011c6c:	9846      	ld.w      	r2, (r14, 0x18)
	error = xTaskCreateExt(entry,
 8011c6e:	ea130000 	movi      	r19, 0
 8011c72:	b800      	st.w      	r0, (r14, 0x0)
 8011c74:	de6e2003 	st.w      	r19, (r14, 0xc)
 8011c78:	de4e2002 	st.w      	r18, (r14, 0x8)
 8011c7c:	c4425622 	zext      	r2, r2, 17, 2
 8011c80:	6c33      	mov      	r0, r12
 8011c82:	e0000aaf 	bsr      	0x80131e0	// 80131e0 <xTaskGenericCreate>
		stk_size/sizeof(uint32_t),
		param,
		configMAX_PRIORITIES - prio,	/*优先级颠倒一下，与ucos优先级顺序相反*/
		task	);
	//printf("configMAX_PRIORITIES - prio:%d\n", configMAX_PRIORITIES - prio);
    if (error == pdTRUE)
 8011c86:	7400      	zextb      	r0, r0
 8011c88:	3841      	cmpnei      	r0, 1
        os_status = TLS_OS_SUCCESS;
    else
        os_status = TLS_OS_ERROR;

    return os_status;
}
 8011c8a:	c4000500 	mvc      	r0
 8011c8e:	1404      	addi      	r14, r14, 16
 8011c90:	1490      	pop      	r15
	...

08011c94 <tls_os_time_delay>:
*
* Returns    : none
*********************************************************************************************************
*/
 void tls_os_time_delay(uint32_t ticks)
{
 8011c94:	14d0      	push      	r15
	vTaskDelay(ticks);
 8011c96:	e0000cd3 	bsr      	0x801363c	// 801363c <vTaskDelay>
}
 8011c9a:	1490      	pop      	r15

08011c9c <tls_os_init>:
 8011c9c:	783c      	jmp      	r15
	...

08011ca0 <tls_os_start_scheduler>:
* Returns    : None
*********************************************************************************************************
*/

void tls_os_start_scheduler(void)
{
 8011ca0:	14d0      	push      	r15
	vTaskStartScheduler();
 8011ca2:	e0000b89 	bsr      	0x80133b4	// 80133b4 <vTaskStartScheduler>
}
 8011ca6:	1490      	pop      	r15

08011ca8 <csi_kernel_intrpt_enter>:
}

int csi_kernel_intrpt_enter(void)
{
    return 0;
}
 8011ca8:	3000      	movi      	r0, 0
 8011caa:	783c      	jmp      	r15

08011cac <csi_kernel_intrpt_exit>:

int csi_kernel_intrpt_exit(void)
{
 8011cac:	14d0      	push      	r15
    portYIELD_FROM_ISR(pdTRUE);
 8011cae:	e3fff429 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8011cb2:	6c03      	mov      	r0, r0
 8011cb4:	6c03      	mov      	r0, r0
    return 0;
}
 8011cb6:	3000      	movi      	r0, 0
 8011cb8:	1490      	pop      	r15
	...

08011cbc <HAL_GPIO_Init>:
	
	assert_param(IS_GPIO_ALL_INSTANCE(GPIOx));
	assert_param(IS_GPIO_PIN(GPIO_Init->Pin));
	assert_param(IS_GPIO_MODE(GPIO_Init->Mode));

	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011cbc:	da612000 	ld.w      	r19, (r1, 0x0)
	uint32_t position = 0x00;
 8011cc0:	ea0d0000 	movi      	r13, 0
	{
		ioposition = (0x01 << position);
 8011cc4:	ea140001 	movi      	r20, 1
			{
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
			}
			
			switch (GPIO_Init->Mode)
 8011cc8:	ea950024 	lrw      	r21, 0x8015cb4	// 8011d58 <HAL_GPIO_Init+0x9c>
	while (((GPIO_Init->Pin) >>  position) != 0x00)
 8011ccc:	c5b34043 	lsr      	r3, r19, r13
 8011cd0:	e9230003 	bnez      	r3, 0x8011cd6	// 8011cd6 <HAL_GPIO_Init+0x1a>
			}
		}
		
		position++;
	}
}
 8011cd4:	783c      	jmp      	r15
		ioposition = (0x01 << position);
 8011cd6:	c5b44023 	lsl      	r3, r20, r13
		iocurrent = (uint32_t)(GPIO_Init->Pin) & ioposition;
 8011cda:	c4732022 	and      	r2, r19, r3
		if (iocurrent == ioposition)
 8011cde:	648e      	cmpne      	r3, r2
 8011ce0:	0883      	bt      	0x8011de6	// 8011de6 <HAL_GPIO_Init+0x12a>
			__AFIO_REMAP_SET_OPT5(GPIOx, ioposition);
 8011ce2:	d9802004 	ld.w      	r12, (r0, 0x10)
 8011ce6:	c4632482 	nor      	r2, r3, r3
 8011cea:	6b08      	and      	r12, r2
 8011cec:	dd802004 	st.w      	r12, (r0, 0x10)
			switch (GPIO_Init->Mode)
 8011cf0:	d9812001 	ld.w      	r12, (r1, 0x4)
 8011cf4:	eb4c0002 	cmpnei      	r12, 2
 8011cf8:	e64c1086 	subi      	r18, r12, 135
 8011cfc:	0c0f      	bf      	0x8011d1a	// 8011d1a <HAL_GPIO_Init+0x5e>
 8011cfe:	eb0c0002 	cmphsi      	r12, 3
 8011d02:	0809      	bt      	0x8011d14	// 8011d14 <HAL_GPIO_Init+0x58>
 8011d04:	eb4c0001 	cmpnei      	r12, 1
 8011d08:	080f      	bt      	0x8011d26	// 8011d26 <HAL_GPIO_Init+0x6a>
					CLEAR_BIT(GPIOx->DIR, ioposition);
 8011d0a:	dac02002 	ld.w      	r22, (r0, 0x8)
 8011d0e:	c6c22036 	and      	r22, r2, r22
 8011d12:	0408      	br      	0x8011d22	// 8011d22 <HAL_GPIO_Init+0x66>
			switch (GPIO_Init->Mode)
 8011d14:	eb120004 	cmphsi      	r18, 5
 8011d18:	07f8      	br      	0x8011d08	// 8011d08 <HAL_GPIO_Init+0x4c>
					SET_BIT(GPIOx->DIR, ioposition);
 8011d1a:	dac02002 	ld.w      	r22, (r0, 0x8)
 8011d1e:	c6c32436 	or      	r22, r3, r22
					CLEAR_BIT(GPIOx->DIR, ioposition);
 8011d22:	dec02002 	st.w      	r22, (r0, 0x8)
			if (GPIO_Init->Pull == GPIO_NOPULL)
 8011d26:	dac12002 	ld.w      	r22, (r1, 0x8)
 8011d2a:	eb560012 	cmpnei      	r22, 18
 8011d2e:	0817      	bt      	0x8011d5c	// 8011d5c <HAL_GPIO_Init+0xa0>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d30:	dac02003 	ld.w      	r22, (r0, 0xc)
 8011d34:	c6c32436 	or      	r22, r3, r22
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d38:	dec02003 	st.w      	r22, (r0, 0xc)
					CLEAR_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011d3c:	dac02007 	ld.w      	r22, (r0, 0x1c)
 8011d40:	c6c22036 	and      	r22, r2, r22
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011d44:	dec02007 	st.w      	r22, (r0, 0x1c)
			switch (GPIO_Init->Mode)
 8011d48:	eb120004 	cmphsi      	r18, 5
 8011d4c:	0846      	bt      	0x8011dd8	// 8011dd8 <HAL_GPIO_Init+0x11c>
 8011d4e:	d2550892 	ldr.w      	r18, (r21, r18 << 2)
 8011d52:	e8d20000 	jmp      	r18
 8011d56:	0000      	.short	0x0000
 8011d58:	08015cb4 	.long	0x08015cb4
			else if (GPIO_Init->Pull == GPIO_PULLUP)
 8011d5c:	eb560013 	cmpnei      	r22, 19
 8011d60:	0806      	bt      	0x8011d6c	// 8011d6c <HAL_GPIO_Init+0xb0>
					CLEAR_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d62:	dac02003 	ld.w      	r22, (r0, 0xc)
 8011d66:	c6c22036 	and      	r22, r2, r22
 8011d6a:	07e7      	br      	0x8011d38	// 8011d38 <HAL_GPIO_Init+0x7c>
			else if(GPIO_Init->Pull == GPIO_PULLDOWN)
 8011d6c:	eb560014 	cmpnei      	r22, 20
 8011d70:	0bec      	bt      	0x8011d48	// 8011d48 <HAL_GPIO_Init+0x8c>
					SET_BIT(GPIOx->PULLUP_EN, ioposition);
 8011d72:	dac02003 	ld.w      	r22, (r0, 0xc)
 8011d76:	c6c32436 	or      	r22, r3, r22
 8011d7a:	dec02003 	st.w      	r22, (r0, 0xc)
					SET_BIT(GPIOx->PULLDOWN_EN, ioposition);
 8011d7e:	dac02007 	ld.w      	r22, (r0, 0x1c)
 8011d82:	c6c32436 	or      	r22, r3, r22
 8011d86:	07df      	br      	0x8011d44	// 8011d44 <HAL_GPIO_Init+0x88>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011d88:	da402008 	ld.w      	r18, (r0, 0x20)
 8011d8c:	c6422032 	and      	r18, r2, r18
 8011d90:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011d94:	da402009 	ld.w      	r18, (r0, 0x24)
 8011d98:	c6422022 	and      	r2, r2, r18
 8011d9c:	b049      	st.w      	r2, (r0, 0x24)
					SET_BIT(GPIOx->IEV, ioposition);
 8011d9e:	904a      	ld.w      	r2, (r0, 0x28)
 8011da0:	6c8c      	or      	r2, r3
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011da2:	b04a      	st.w      	r2, (r0, 0x28)
					break;
 8011da4:	041a      	br      	0x8011dd8	// 8011dd8 <HAL_GPIO_Init+0x11c>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011da6:	da402008 	ld.w      	r18, (r0, 0x20)
 8011daa:	c6422032 	and      	r18, r2, r18
 8011dae:	de402008 	st.w      	r18, (r0, 0x20)
					CLEAR_BIT(GPIOx->IBE, ioposition);
 8011db2:	da402009 	ld.w      	r18, (r0, 0x24)
 8011db6:	c6422032 	and      	r18, r2, r18
 8011dba:	de402009 	st.w      	r18, (r0, 0x24)
					CLEAR_BIT(GPIOx->IEV, ioposition);
 8011dbe:	da40200a 	ld.w      	r18, (r0, 0x28)
 8011dc2:	c6422022 	and      	r2, r2, r18
 8011dc6:	07ee      	br      	0x8011da2	// 8011da2 <HAL_GPIO_Init+0xe6>
					CLEAR_BIT(GPIOx->IS, ioposition);
 8011dc8:	da402008 	ld.w      	r18, (r0, 0x20)
 8011dcc:	c6422022 	and      	r2, r2, r18
 8011dd0:	b048      	st.w      	r2, (r0, 0x20)
					SET_BIT(GPIOx->IBE, ioposition);
 8011dd2:	9049      	ld.w      	r2, (r0, 0x24)
 8011dd4:	6c8c      	or      	r2, r3
 8011dd6:	b049      	st.w      	r2, (r0, 0x24)
			if ((GPIO_Init->Mode & EXTI_MODE) == EXTI_MODE)
 8011dd8:	e58c2080 	andi      	r12, r12, 128
 8011ddc:	e90c0005 	bez      	r12, 0x8011de6	// 8011de6 <HAL_GPIO_Init+0x12a>
				SET_BIT(GPIOx->IE, ioposition);
 8011de0:	904b      	ld.w      	r2, (r0, 0x2c)
 8011de2:	6cc8      	or      	r3, r2
 8011de4:	b06b      	st.w      	r3, (r0, 0x2c)
		position++;
 8011de6:	e5ad0000 	addi      	r13, r13, 1
 8011dea:	0771      	br      	0x8011ccc	// 8011ccc <HAL_GPIO_Init+0x10>
					SET_BIT(GPIOx->IS, ioposition);
 8011dec:	9048      	ld.w      	r2, (r0, 0x20)
 8011dee:	6c8c      	or      	r2, r3
 8011df0:	b048      	st.w      	r2, (r0, 0x20)
 8011df2:	07d6      	br      	0x8011d9e	// 8011d9e <HAL_GPIO_Init+0xe2>
					SET_BIT(GPIOx->IS, ioposition);
 8011df4:	da402008 	ld.w      	r18, (r0, 0x20)
 8011df8:	c6432432 	or      	r18, r3, r18
 8011dfc:	de402008 	st.w      	r18, (r0, 0x20)
 8011e00:	07df      	br      	0x8011dbe	// 8011dbe <HAL_GPIO_Init+0x102>
	...

08011e04 <HAL_GPIO_WritePin>:
	uint32_t data_en;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	assert_param(IS_GPIO_PIN_ACTION(PinState));

	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011e04:	d9802001 	ld.w      	r12, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011e08:	9061      	ld.w      	r3, (r0, 0x4)
 8011e0a:	6cc4      	or      	r3, r1
 8011e0c:	b061      	st.w      	r3, (r0, 0x4)
	if (PinState != GPIO_PIN_RESET)
	{
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011e0e:	9060      	ld.w      	r3, (r0, 0x0)
	if (PinState != GPIO_PIN_RESET)
 8011e10:	e9020007 	bez      	r2, 0x8011e1e	// 8011e1e <HAL_GPIO_WritePin+0x1a>
		SET_BIT(GPIOx->DATA, GPIO_Pin);
 8011e14:	6c4c      	or      	r1, r3
	}
	else
	{
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011e16:	b020      	st.w      	r1, (r0, 0x0)
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011e18:	dd802001 	st.w      	r12, (r0, 0x4)
}
 8011e1c:	783c      	jmp      	r15
		CLEAR_BIT(GPIOx->DATA, GPIO_Pin);
 8011e1e:	c4232041 	andn      	r1, r3, r1
 8011e22:	07fa      	br      	0x8011e16	// 8011e16 <HAL_GPIO_WritePin+0x12>

08011e24 <HAL_GPIO_TogglePin>:
{
	uint32_t data_en, position = 0x00, iocurrent;
	
	assert_param(IS_GPIO_PIN(GPIO_Pin));
	
	data_en = READ_REG(GPIOx->DATA_B_EN);
 8011e24:	d9a02001 	ld.w      	r13, (r0, 0x4)
	SET_BIT(GPIOx->DATA_B_EN, GPIO_Pin);
 8011e28:	9061      	ld.w      	r3, (r0, 0x4)
 8011e2a:	6cc4      	or      	r3, r1
 8011e2c:	b061      	st.w      	r3, (r0, 0x4)
	uint32_t data_en, position = 0x00, iocurrent;
 8011e2e:	3200      	movi      	r2, 0
	while ((GPIO_Pin >> position) != 0)
	{
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011e30:	ea120001 	movi      	r18, 1
	while ((GPIO_Pin >> position) != 0)
 8011e34:	c4414043 	lsr      	r3, r1, r2
 8011e38:	e9230005 	bnez      	r3, 0x8011e42	// 8011e42 <HAL_GPIO_TogglePin+0x1e>
			}
		}
		
		position++;
	}
	WRITE_REG(GPIOx->DATA_B_EN, data_en);
 8011e3c:	dda02001 	st.w      	r13, (r0, 0x4)
}
 8011e40:	783c      	jmp      	r15
		iocurrent = (GPIO_Pin) & (1uL << position);
 8011e42:	c4524023 	lsl      	r3, r18, r2
 8011e46:	68c4      	and      	r3, r1
		if (iocurrent)
 8011e48:	e903000c 	bez      	r3, 0x8011e60	// 8011e60 <HAL_GPIO_TogglePin+0x3c>
			if ((GPIOx->DATA & iocurrent) != GPIO_PIN_RESET)
 8011e4c:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011e50:	6b0c      	and      	r12, r3
 8011e52:	e90c0009 	bez      	r12, 0x8011e64	// 8011e64 <HAL_GPIO_TogglePin+0x40>
				CLEAR_BIT(GPIOx->DATA, iocurrent);
 8011e56:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011e5a:	c46c2043 	andn      	r3, r12, r3
				SET_BIT(GPIOx->DATA, iocurrent);
 8011e5e:	b060      	st.w      	r3, (r0, 0x0)
		position++;
 8011e60:	2200      	addi      	r2, 1
 8011e62:	07e9      	br      	0x8011e34	// 8011e34 <HAL_GPIO_TogglePin+0x10>
				SET_BIT(GPIOx->DATA, iocurrent);
 8011e64:	d9802000 	ld.w      	r12, (r0, 0x0)
 8011e68:	6cf0      	or      	r3, r12
 8011e6a:	07fa      	br      	0x8011e5e	// 8011e5e <HAL_GPIO_TogglePin+0x3a>

08011e6c <HAL_GPIO_EXTI_IRQHandler>:

void HAL_GPIO_EXTI_IRQHandler(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
 8011e6c:	14d0      	push      	r15
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011e6e:	d980200d 	ld.w      	r12, (r0, 0x34)
 8011e72:	6b04      	and      	r12, r1
{
 8011e74:	6cc7      	mov      	r3, r1
	if ((GPIOx->MIS & GPIO_Pin) != 0)
 8011e76:	e90c0008 	bez      	r12, 0x8011e86	// 8011e86 <HAL_GPIO_EXTI_IRQHandler+0x1a>
	{
		SET_BIT(GPIOx->IC, GPIO_Pin);
 8011e7a:	d980200e 	ld.w      	r12, (r0, 0x38)
 8011e7e:	6cf0      	or      	r3, r12
 8011e80:	b06e      	st.w      	r3, (r0, 0x38)
		HAL_GPIO_EXTI_Callback(GPIOx, GPIO_Pin);
 8011e82:	e0000f3b 	bsr      	0x8013cf8	// 8013cf8 <HAL_GPIO_EXTI_Callback>
	}
}
 8011e86:	1490      	pop      	r15

08011e88 <SystemClock_Get>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e88:	ea234000 	movih      	r3, 16384
 8011e8c:	e4630dff 	addi      	r3, r3, 3584
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e90:	32f0      	movi      	r2, 240
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011e92:	9324      	ld.w      	r1, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011e94:	74c4      	zextb      	r3, r1
 8011e96:	4241      	lsli      	r2, r2, 1
 8011e98:	c4628043 	divs      	r3, r2, r3
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011e9c:	c50155ec 	zext      	r12, r1, 15, 8
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011ea0:	c60156e1 	zext      	r1, r1, 23, 16
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 8011ea4:	b061      	st.w      	r3, (r0, 0x4)
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011ea6:	c5828042 	divs      	r2, r2, r12
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011eaa:	c4238023 	divu      	r3, r3, r1
	sysclk->wlanclk = W805_PLL_CLK_MHZ/(clk_div.b.WLAN);
 8011eae:	b042      	st.w      	r2, (r0, 0x8)
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
 8011eb0:	b060      	st.w      	r3, (r0, 0x0)
}
 8011eb2:	783c      	jmp      	r15

08011eb4 <HAL_InitTick>:


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 8011eb4:	14d1      	push      	r4, r15
 8011eb6:	1423      	subi      	r14, r14, 12
 8011eb8:	6d03      	mov      	r4, r0
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
 8011eba:	6c3b      	mov      	r0, r14
 8011ebc:	e3ffffe6 	bsr      	0x8011e88	// 8011e88 <SystemClock_Get>
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 8011ec0:	ea02f424 	movi      	r2, 62500
 8011ec4:	c4824902 	rotli      	r2, r2, 4
 8011ec8:	9861      	ld.w      	r3, (r14, 0x4)
 8011eca:	7cc8      	mult      	r3, r2
 8011ecc:	32fa      	movi      	r2, 250
 8011ece:	4242      	lsli      	r2, r2, 2
 8011ed0:	c4438023 	divu      	r3, r3, r2
           function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
           must contain a vendor-specific implementation of this function.
 */
__STATIC_INLINE uint32_t csi_coret_config(uint32_t ticks, int32_t IRQn)
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 8011ed4:	2b00      	subi      	r3, 1
 8011ed6:	c6e05022 	bmaski      	r2, 24
 8011eda:	64c8      	cmphs      	r2, r3
 8011edc:	0c07      	bf      	0x8011eea	// 8011eea <HAL_InitTick+0x36>
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011ede:	104e      	lrw      	r2, 0xe000e010	// 8011f14 <HAL_InitTick+0x60>
 8011ee0:	b261      	st.w      	r3, (r2, 0x4)
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011ee2:	3300      	movi      	r3, 0
 8011ee4:	b262      	st.w      	r3, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011ee6:	3307      	movi      	r3, 7
 8011ee8:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011eea:	104c      	lrw      	r2, 0xe000e100	// 8011f18 <HAL_InitTick+0x64>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011eec:	446e      	lsli      	r3, r4, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011eee:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011ef2:	ea00ff00 	movi      	r0, 65280
 8011ef6:	6c02      	nor      	r0, r0
 8011ef8:	6840      	and      	r1, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011efa:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011efe:	6cc4      	or      	r3, r1
 8011f00:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011f04:	3380      	movi      	r3, 128
 8011f06:	4372      	lsli      	r3, r3, 18
 8011f08:	b260      	st.w      	r3, (r2, 0x0)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
	return HAL_OK;
}
 8011f0a:	3000      	movi      	r0, 0
	uwTickPrio = TickPriority;
 8011f0c:	1064      	lrw      	r3, 0x20006964	// 8011f1c <HAL_InitTick+0x68>
 8011f0e:	b380      	st.w      	r4, (r3, 0x0)
}
 8011f10:	1403      	addi      	r14, r14, 12
 8011f12:	1491      	pop      	r4, r15
 8011f14:	e000e010 	.long	0xe000e010
 8011f18:	e000e100 	.long	0xe000e100
 8011f1c:	20006964 	.long	0x20006964

08011f20 <SystemClock_Config>:
{
 8011f20:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011f22:	5867      	subi      	r3, r0, 2
 8011f24:	eb0300ee 	cmphsi      	r3, 239
 8011f28:	0824      	bt      	0x8011f70	// 8011f70 <SystemClock_Config+0x50>
    RegValue = READ_REG(RCC->CLK_EN);
 8011f2a:	ea224000 	movih      	r2, 16384
 8011f2e:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011f32:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 8011f36:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 8011f38:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 8011f3a:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011f3e:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011f40:	330f      	movi      	r3, 15
 8011f42:	b262      	st.w      	r3, (r2, 0x8)
	RegValue &= 0xFF000000;
 8011f44:	33ff      	movi      	r3, 255
	RegValue = READ_REG(RCC->CLK_DIV);
 8011f46:	9224      	ld.w      	r1, (r2, 0x10)
	RegValue &= 0xFF000000;
 8011f48:	4378      	lsli      	r3, r3, 24
	if(cpuDiv > 12)
 8011f4a:	380c      	cmphsi      	r0, 13
	RegValue &= 0xFF000000;
 8011f4c:	684c      	and      	r1, r3
	RegValue |= 0x80000000;
 8011f4e:	39bf      	bseti      	r1, 31
	if(cpuDiv > 12)
 8011f50:	0c11      	bf      	0x8011f72	// 8011f72 <SystemClock_Config+0x52>
		wlanDiv = cpuDiv/4;
 8011f52:	4842      	lsri      	r2, r0, 2
		bus2Fac = 1;
 8011f54:	3301      	movi      	r3, 1
 8011f56:	6c04      	or      	r0, r1
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 8011f58:	4370      	lsli      	r3, r3, 16
 8011f5a:	6cc0      	or      	r3, r0
 8011f5c:	4248      	lsli      	r2, r2, 8
 8011f5e:	6cc8      	or      	r3, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011f60:	ea224000 	movih      	r2, 16384
 8011f64:	e4420dff 	addi      	r2, r2, 3584
	HAL_InitTick(TICK_INT_PRIORITY);
 8011f68:	3007      	movi      	r0, 7
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011f6a:	b264      	st.w      	r3, (r2, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 8011f6c:	e3ffffa4 	bsr      	0x8011eb4	// 8011eb4 <HAL_InitTick>
}
 8011f70:	1490      	pop      	r15
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011f72:	330c      	movi      	r3, 12
 8011f74:	c4038023 	divu      	r3, r3, r0
		wlanDiv=3;
 8011f78:	3203      	movi      	r2, 3
 8011f7a:	07ee      	br      	0x8011f56	// 8011f56 <SystemClock_Config+0x36>

08011f7c <HAL_GetTick>:
	uwTick += 1;
}

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 8011f7c:	1062      	lrw      	r3, 0x20006960	// 8011f84 <HAL_GetTick+0x8>
 8011f7e:	9300      	ld.w      	r0, (r3, 0x0)
}
 8011f80:	783c      	jmp      	r15
 8011f82:	0000      	.short	0x0000
 8011f84:	20006960 	.long	0x20006960

08011f88 <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 8011f88:	14d2      	push      	r4-r5, r15
 8011f8a:	6d03      	mov      	r4, r0
	uint32_t tickstart = HAL_GetTick();
 8011f8c:	e3fffff8 	bsr      	0x8011f7c	// 8011f7c <HAL_GetTick>
 8011f90:	6d43      	mov      	r5, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 8011f92:	e3fffff5 	bsr      	0x8011f7c	// 8011f7c <HAL_GetTick>
 8011f96:	6016      	subu      	r0, r5
 8011f98:	6500      	cmphs      	r0, r4
 8011f9a:	0ffc      	bf      	0x8011f92	// 8011f92 <HAL_Delay+0xa>
	{
	}
}
 8011f9c:	1492      	pop      	r4-r5, r15
	...

08011fa0 <HAL_NVIC_SetPriority>:

/* Priority: a value between 0 and 15
 * A lower priority value indicates a higher priority */
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t Priority)
{   
 8011fa0:	c4002822 	bclri      	r2, r0, 0
 8011fa4:	3a81      	bclri      	r2, 1
 8011fa6:	106b      	lrw      	r3, 0xe000e100	// 8011fd0 <HAL_NVIC_SetPriority+0x30>
 8011fa8:	608c      	addu      	r2, r3
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011faa:	e4002003 	andi      	r0, r0, 3
 8011fae:	4003      	lsli      	r0, r0, 3
 8011fb0:	33ff      	movi      	r3, 255
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011fb2:	4126      	lsli      	r1, r1, 6
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011fb4:	d98220c0 	ld.w      	r12, (r2, 0x300)
 8011fb8:	70c0      	lsl      	r3, r0
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011fba:	e42120ff 	andi      	r1, r1, 255
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011fbe:	c46c2043 	andn      	r3, r12, r3
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 8011fc2:	c4014020 	lsl      	r0, r1, r0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011fc6:	6cc0      	or      	r3, r0
 8011fc8:	dc6220c0 	st.w      	r3, (r2, 0x300)
	NVIC_SetPriority(IRQn, Priority);
}
 8011fcc:	783c      	jmp      	r15
 8011fce:	0000      	.short	0x0000
 8011fd0:	e000e100 	.long	0xe000e100

08011fd4 <HAL_NVIC_EnableIRQ>:
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011fd4:	c4a054c2 	zext      	r2, r0, 6, 5
 8011fd8:	3301      	movi      	r3, 1
 8011fda:	e400201f 	andi      	r0, r0, 31
 8011fde:	c4034020 	lsl      	r0, r3, r0
 8011fe2:	1063      	lrw      	r3, 0xe000e100	// 8011fec <HAL_NVIC_EnableIRQ+0x18>
 8011fe4:	d4430880 	str.w      	r0, (r3, r2 << 2)
	/* Check the parameters */
	assert_param(IS_NVIC_DEVICE_IRQ(IRQn));

	/* Enable interrupt */
	NVIC_EnableIRQ(IRQn);
}
 8011fe8:	783c      	jmp      	r15
 8011fea:	0000      	.short	0x0000
 8011fec:	e000e100 	.long	0xe000e100

08011ff0 <HAL_Init>:
#include "wm_hal.h"

HAL_StatusTypeDef HAL_Init(void)
{
 8011ff0:	14d0      	push      	r15
	HAL_MspInit();
 8011ff2:	e00002f9 	bsr      	0x80125e4	// 80125e4 <HAL_MspInit>
	return HAL_OK;
}
 8011ff6:	3000      	movi      	r0, 0
 8011ff8:	1490      	pop      	r15
	...

08011ffc <HAL_WDG_IRQHandler>:
	UNUSED(hwdg);
}

void HAL_WDG_IRQHandler(WDG_HandleTypeDef *hwdg)
{
	__HAL_WDG_CLEAR_FLAG(hwdg, WDG_CLR);	// 如果不清除中断，不会立即复位，在下一个周期中断到来时才复位。
 8011ffc:	9060      	ld.w      	r3, (r0, 0x0)
 8011ffe:	3201      	movi      	r2, 1
 8012000:	b343      	st.w      	r2, (r3, 0xc)
											// 例如定时5s，第一次来中断时没清除，则5s后下一个中断到来才复位
 8012002:	783c      	jmp      	r15

08012004 <HAL_TIM_Base_Init>:
#include "wm_tim.h"

HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim)
{
 8012004:	14d1      	push      	r4, r15
 8012006:	1423      	subi      	r14, r14, 12
 8012008:	6d03      	mov      	r4, r0
	uint32_t offset = 0;
	wm_sys_clk sysclk;
	
	if (htim == NULL)
 801200a:	e9000039 	bez      	r0, 0x801207c	// 801207c <HAL_TIM_Base_Init+0x78>
	
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	assert_param(IS_TIM_UNIT(htim->Init.unit));
	assert_param(IS_TIM_AUTORELOAD(htim->Init.AutoReload));
	
	if (htim->State == HAL_TIM_STATE_RESET)
 801200e:	9065      	ld.w      	r3, (r0, 0x14)
 8012010:	e9230005 	bnez      	r3, 0x801201a	// 801201a <HAL_TIM_Base_Init+0x16>
	{
		htim->Lock = HAL_UNLOCKED;
 8012014:	b064      	st.w      	r3, (r0, 0x10)
		HAL_TIM_Base_MspInit(htim);
 8012016:	e0000eed 	bsr      	0x8013df0	// 8013df0 <HAL_TIM_Base_MspInit>
	}
	htim->State = HAL_TIM_STATE_BUSY;
 801201a:	3302      	movi      	r3, 2
 801201c:	b465      	st.w      	r3, (r4, 0x14)
	
	SystemClock_Get(&sysclk);
 801201e:	6c3b      	mov      	r0, r14
 8012020:	e3ffff34 	bsr      	0x8011e88	// 8011e88 <SystemClock_Get>
	WRITE_REG(TIM->TMR_CONFIG, sysclk.apbclk-1);
 8012024:	9860      	ld.w      	r3, (r14, 0x0)
 8012026:	ea8d0017 	lrw      	r13, 0x40011800	// 8012080 <HAL_TIM_Base_Init+0x7c>
 801202a:	2b00      	subi      	r3, 1
 801202c:	dc6d2000 	st.w      	r3, (r13, 0x0)
	offset = htim->Instance - TIM0;
 8012030:	9440      	ld.w      	r2, (r4, 0x0)
	MODIFY_REG(TIM->CR, (TIM_CR_TIM_MODE(offset) | TIM_CR_TIM_UNIT(offset)), 
 8012032:	3005      	movi      	r0, 5
 8012034:	7c08      	mult      	r0, r2
 8012036:	e6400000 	addi      	r18, r0, 1
 801203a:	ea0c0001 	movi      	r12, 1
 801203e:	c64c4023 	lsl      	r3, r12, r18
 8012042:	c40c4033 	lsl      	r19, r12, r0
 8012046:	d82d2001 	ld.w      	r1, (r13, 0x4)
 801204a:	c6632423 	or      	r3, r3, r19
 801204e:	c4612043 	andn      	r3, r1, r3
 8012052:	9422      	ld.w      	r1, (r4, 0x8)
 8012054:	c6414021 	lsl      	r1, r1, r18
 8012058:	da442001 	ld.w      	r18, (r4, 0x4)
 801205c:	c4124020 	lsl      	r0, r18, r0
 8012060:	6c40      	or      	r1, r0
 8012062:	6cc4      	or      	r3, r1
 8012064:	dc6d2001 	st.w      	r3, (r13, 0x4)
				((htim->Init.AutoReload << TIM_CR_TIM_MODE_Pos(offset)) | (htim->Init.Unit << TIM_CR_TIM_UNIT_Pos(offset))));
					
	WRITE_REG(*(uint32_t *)(&(TIM->TIM0_PRD) + offset), htim->Init.Period);
 8012068:	4242      	lsli      	r2, r2, 2
 801206a:	1067      	lrw      	r3, 0x40011808	// 8012084 <HAL_TIM_Base_Init+0x80>
 801206c:	608c      	addu      	r2, r3
 801206e:	9463      	ld.w      	r3, (r4, 0xc)
 8012070:	b260      	st.w      	r3, (r2, 0x0)
	htim->State = HAL_TIM_STATE_READY;
	
	return HAL_OK;
 8012072:	3000      	movi      	r0, 0
	htim->State = HAL_TIM_STATE_READY;
 8012074:	dd842005 	st.w      	r12, (r4, 0x14)
}
 8012078:	1403      	addi      	r14, r14, 12
 801207a:	1491      	pop      	r4, r15
		return HAL_ERROR;
 801207c:	3001      	movi      	r0, 1
 801207e:	07fd      	br      	0x8012078	// 8012078 <HAL_TIM_Base_Init+0x74>
 8012080:	40011800 	.long	0x40011800
 8012084:	40011808 	.long	0x40011808

08012088 <HAL_TIM_Base_Start_IT>:

HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim)
{
	assert_param(IS_TIM_INSTANCE(htim->Instance));
	
	if (htim->State != HAL_TIM_STATE_READY)
 8012088:	9065      	ld.w      	r3, (r0, 0x14)
 801208a:	3b41      	cmpnei      	r3, 1
 801208c:	0819      	bt      	0x80120be	// 80120be <HAL_TIM_Base_Start_IT+0x36>
	{
		return HAL_ERROR;
	}
	htim->State = HAL_TIM_STATE_BUSY;
 801208e:	3202      	movi      	r2, 2
 8012090:	b045      	st.w      	r2, (r0, 0x14)
	__HAL_TIM_ENABLE_IT(htim);
 8012092:	3105      	movi      	r1, 5
 8012094:	9040      	ld.w      	r2, (r0, 0x0)
 8012096:	ea8c000c 	lrw      	r12, 0x40011800	// 80120c4 <HAL_TIM_Base_Start_IT+0x3c>
 801209a:	7c84      	mult      	r2, r1
 801209c:	5a2a      	addi      	r1, r2, 3
 801209e:	d9ac2001 	ld.w      	r13, (r12, 0x4)
 80120a2:	c4234021 	lsl      	r1, r3, r1
 80120a6:	6c74      	or      	r1, r13
 80120a8:	dc2c2001 	st.w      	r1, (r12, 0x4)
	__HAL_TIM_ENABLE(htim);
 80120ac:	2201      	addi      	r2, 2
 80120ae:	d82c2001 	ld.w      	r1, (r12, 0x4)
 80120b2:	70c8      	lsl      	r3, r2
 80120b4:	6cc4      	or      	r3, r1
 80120b6:	dc6c2001 	st.w      	r3, (r12, 0x4)
	
	return HAL_OK;
 80120ba:	3000      	movi      	r0, 0
}
 80120bc:	783c      	jmp      	r15
		return HAL_ERROR;
 80120be:	3001      	movi      	r0, 1
 80120c0:	07fe      	br      	0x80120bc	// 80120bc <HAL_TIM_Base_Start_IT+0x34>
 80120c2:	0000      	.short	0x0000
 80120c4:	40011800 	.long	0x40011800

080120c8 <HAL_TIM_IRQHandler>:
{
	UNUSED(htim);
}

void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim)
{
 80120c8:	14d0      	push      	r15
	if (__HAL_TIM_GET_FLAG(htim) != RESET)
 80120ca:	9060      	ld.w      	r3, (r0, 0x0)
 80120cc:	3205      	movi      	r2, 5
 80120ce:	7cc8      	mult      	r3, r2
 80120d0:	1028      	lrw      	r1, 0x40011800	// 80120f0 <HAL_TIM_IRQHandler+0x28>
 80120d2:	5b4e      	addi      	r2, r3, 4
 80120d4:	3301      	movi      	r3, 1
 80120d6:	70c8      	lsl      	r3, r2
 80120d8:	d9812001 	ld.w      	r12, (r1, 0x4)
 80120dc:	c46c2022 	and      	r2, r12, r3
 80120e0:	648e      	cmpne      	r3, r2
 80120e2:	0806      	bt      	0x80120ee	// 80120ee <HAL_TIM_IRQHandler+0x26>
	{
		__HAL_TIM_CLEAR_IT(htim);
 80120e4:	9141      	ld.w      	r2, (r1, 0x4)
 80120e6:	6cc8      	or      	r3, r2
 80120e8:	b161      	st.w      	r3, (r1, 0x4)
		HAL_TIM_Callback(htim);
 80120ea:	e0000ea5 	bsr      	0x8013e34	// 8013e34 <HAL_TIM_Callback>
	}
}
 80120ee:	1490      	pop      	r15
 80120f0:	40011800 	.long	0x40011800

080120f4 <HAL_ADC_PollForConversion>:
	uint32_t count = 0;
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instansce));
	
	while (1)
	{
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 80120f4:	9040      	ld.w      	r2, (r0, 0x0)
		{
			count++;
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 80120f6:	3101      	movi      	r1, 1
		if (HAL_IS_BIT_SET(hadc->Instance->IF, ADC_IF_ADC))
 80120f8:	3004      	movi      	r0, 4
 80120fa:	9265      	ld.w      	r3, (r2, 0x14)
 80120fc:	e4632001 	andi      	r3, r3, 1
 8012100:	e903fffd 	bez      	r3, 0x80120fa	// 80120fa <HAL_ADC_PollForConversion+0x6>
 8012104:	2800      	subi      	r0, 1
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 8012106:	b225      	st.w      	r1, (r2, 0x14)
			if(count == 4)
 8012108:	e920fff9 	bnez      	r0, 0x80120fa	// 80120fa <HAL_ADC_PollForConversion+0x6>
			}
		}
	}
	
	return HAL_OK;
}
 801210c:	783c      	jmp      	r15
	...

08012110 <HAL_ADC_Init>:
{
 8012110:	14d1      	push      	r4, r15
 8012112:	1423      	subi      	r14, r14, 12
 8012114:	6d03      	mov      	r4, r0
	if (hadc == NULL)
 8012116:	e900005d 	bez      	r0, 0x80121d0	// 80121d0 <HAL_ADC_Init+0xc0>
	hadc->Lock = HAL_UNLOCKED;
 801211a:	3300      	movi      	r3, 0
 801211c:	b065      	st.w      	r3, (r0, 0x14)
	HAL_ADC_MspInit(hadc);
 801211e:	e0000d13 	bsr      	0x8013b44	// 8013b44 <HAL_ADC_MspInit>
	SystemClock_Get(&sysclk);
 8012122:	6c3b      	mov      	r0, r14
 8012124:	e3fffeb2 	bsr      	0x8011e88	// 8011e88 <SystemClock_Get>
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 8012128:	9860      	ld.w      	r3, (r14, 0x0)
 801212a:	ea00f424 	movi      	r0, 62500
 801212e:	c4804900 	rotli      	r0, r0, 4
 8012132:	7cc0      	mult      	r3, r0
 8012134:	9402      	ld.w      	r0, (r4, 0x8)
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8012136:	ea224000 	movih      	r2, 16384
 801213a:	e4420dff 	addi      	r2, r2, 3584
	div = sysclk.apbclk * 1000000 / (hadc->Init.freq) / 512;
 801213e:	c4038023 	divu      	r3, r3, r0
	MODIFY_REG(RCC->CLK_SEL, RCC_CLK_SEL_ADC_DIV, ((div & 0xFF) << RCC_CLK_SEL_ADC_DIV_Pos));
 8012142:	30ff      	movi      	r0, 255
 8012144:	4008      	lsli      	r0, r0, 8
 8012146:	4b61      	lsri      	r3, r3, 1
 8012148:	9225      	ld.w      	r1, (r2, 0x14)
 801214a:	68c0      	and      	r3, r0
 801214c:	ea00ff00 	movi      	r0, 65280
 8012150:	6c02      	nor      	r0, r0
 8012152:	6840      	and      	r1, r0
 8012154:	6cc4      	or      	r3, r1
 8012156:	b265      	st.w      	r3, (r2, 0x14)
	SET_BIT(RCC->CLK_DIV, RCC_CLK_DIV_FREQ_EN);
 8012158:	9264      	ld.w      	r3, (r2, 0x10)
 801215a:	3bbf      	bseti      	r3, 31
 801215c:	b264      	st.w      	r3, (r2, 0x10)
	MODIFY_REG(hadc->Instance->ADC_CR, ADC_ADC_CR_DMAEN | ADC_ADC_CR_SWITCHTIME | ADC_ADC_CR_INITTIME, 
 801215e:	9460      	ld.w      	r3, (r4, 0x0)
 8012160:	103d      	lrw      	r1, 0xc00c00fc	// 80121d4 <HAL_ADC_Init+0xc4>
 8012162:	9344      	ld.w      	r2, (r3, 0x10)
 8012164:	6884      	and      	r2, r1
 8012166:	103d      	lrw      	r1, 0x5005002	// 80121d8 <HAL_ADC_Init+0xc8>
 8012168:	6c84      	or      	r2, r1
 801216a:	b344      	st.w      	r2, (r3, 0x10)
	MODIFY_REG(hadc->Instance->PGA_CR, ADC_PGA_CR_BPREF | ADC_PGA_CR_GAIN | ADC_PGA_CR_BP, ADC_PGA_CR_CHOPEN | ADC_PGA_CR_PGAEN);
 801216c:	9342      	ld.w      	r2, (r3, 0x8)
 801216e:	ea0101ff 	movi      	r1, 511
 8012172:	6c46      	nor      	r1, r1
 8012174:	6884      	and      	r2, r1
 8012176:	ec420003 	ori      	r2, r2, 3
 801217a:	b342      	st.w      	r2, (r3, 0x8)
	MODIFY_REG(hadc->Instance->ANA_CR, ADC_ANA_CR_CH | ADC_ANA_CR_PD, ADC_ANA_CR_RST | ADC_ANA_CR_LDOEN | ADC_ANA_CR_CH_OFFSET);
 801217c:	9341      	ld.w      	r2, (r3, 0x4)
 801217e:	ea010f07 	movi      	r1, 3847
 8012182:	6c46      	nor      	r1, r1
 8012184:	6884      	and      	r2, r1
 8012186:	ec420e03 	ori      	r2, r2, 3587
 801218a:	b341      	st.w      	r2, (r3, 0x4)
	HAL_ADC_PollForConversion(hadc);
 801218c:	6c13      	mov      	r0, r4
 801218e:	e3ffffb3 	bsr      	0x80120f4	// 80120f4 <HAL_ADC_PollForConversion>
	value = ADC->DR;
 8012192:	ea234001 	movih      	r3, 16385
 8012196:	3ba9      	bseti      	r3, 9
	if (value & 0x20000)
 8012198:	3280      	movi      	r2, 128
	value = ADC->DR;
 801219a:	9360      	ld.w      	r3, (r3, 0x0)
	if (value & 0x20000)
 801219c:	424a      	lsli      	r2, r2, 10
 801219e:	688c      	and      	r2, r3
 80121a0:	e9020012 	bez      	r2, 0x80121c4	// 80121c4 <HAL_ADC_Init+0xb4>
		value &= 0x1FFFF;
 80121a4:	c6005022 	bmaski      	r2, 17
 80121a8:	2a02      	subi      	r2, 3
 80121aa:	68c8      	and      	r3, r2
	__HAL_ADC_DISABLE(hadc);
 80121ac:	9440      	ld.w      	r2, (r4, 0x0)
 80121ae:	3100      	movi      	r1, 0
	hadc->offset = _Get_Result();
 80121b0:	b466      	st.w      	r3, (r4, 0x18)
	__HAL_ADC_DISABLE(hadc);
 80121b2:	2907      	subi      	r1, 8
 80121b4:	9261      	ld.w      	r3, (r2, 0x4)
 80121b6:	68c4      	and      	r3, r1
 80121b8:	ec630004 	ori      	r3, r3, 4
 80121bc:	b261      	st.w      	r3, (r2, 0x4)
	return HAL_OK;
 80121be:	3000      	movi      	r0, 0
}
 80121c0:	1403      	addi      	r14, r14, 12
 80121c2:	1491      	pop      	r4, r15
	value = value & 0x3FFFC;
 80121c4:	c6205022 	bmaski      	r2, 18
 80121c8:	2a02      	subi      	r2, 3
 80121ca:	68c8      	and      	r3, r2
		value |= 0x20000;
 80121cc:	3bb1      	bseti      	r3, 17
 80121ce:	07ef      	br      	0x80121ac	// 80121ac <HAL_ADC_Init+0x9c>
		return HAL_ERROR;
 80121d0:	3001      	movi      	r0, 1
 80121d2:	07f7      	br      	0x80121c0	// 80121c0 <HAL_ADC_Init+0xb0>
 80121d4:	c00c00fc 	.long	0xc00c00fc
 80121d8:	05005002 	.long	0x05005002

080121dc <HAL_ADC_CompareCallback>:
}

__attribute__((weak)) void HAL_ADC_CompareCallback(ADC_HandleTypeDef* hadc)
{
	UNUSED(hadc);
}
 80121dc:	783c      	jmp      	r15
	...

080121e0 <HAL_ADC_IRQHandler>:

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc)
{
 80121e0:	14d1      	push      	r4, r15
	assert_param(IS_ADC_ALL_INSTANCE(hadc->Instance));
	
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 80121e2:	9060      	ld.w      	r3, (r0, 0x0)
{
 80121e4:	6d03      	mov      	r4, r0
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_ADCIE))
 80121e6:	9344      	ld.w      	r2, (r3, 0x10)
 80121e8:	e4422002 	andi      	r2, r2, 2
 80121ec:	e902000b 	bez      	r2, 0x8012202	// 8012202 <HAL_ADC_IRQHandler+0x22>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_ADC))
 80121f0:	9345      	ld.w      	r2, (r3, 0x14)
 80121f2:	e4422001 	andi      	r2, r2, 1
 80121f6:	e9020006 	bez      	r2, 0x8012202	// 8012202 <HAL_ADC_IRQHandler+0x22>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_ADC);
 80121fa:	3201      	movi      	r2, 1
 80121fc:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_ConvCpltCallback(hadc);
 80121fe:	e0000d29 	bsr      	0x8013c50	// 8013c50 <HAL_ADC_ConvCpltCallback>
		}
	}
	if (__HAL_ADC_GET_IT_SOURCE(hadc, ADC_ADC_CR_CMPIE))
 8012202:	9460      	ld.w      	r3, (r4, 0x0)
 8012204:	9344      	ld.w      	r2, (r3, 0x10)
 8012206:	e4422020 	andi      	r2, r2, 32
 801220a:	e902000c 	bez      	r2, 0x8012222	// 8012222 <HAL_ADC_IRQHandler+0x42>
	{
		if (__HAL_ADC_GET_FLAG(hadc, ADC_IF_CMP))
 801220e:	9345      	ld.w      	r2, (r3, 0x14)
 8012210:	e4422002 	andi      	r2, r2, 2
 8012214:	e9020007 	bez      	r2, 0x8012222	// 8012222 <HAL_ADC_IRQHandler+0x42>
		{
			__HAL_ADC_CLEAR_FLAG(hadc, ADC_IF_CMP);
 8012218:	3202      	movi      	r2, 2
 801221a:	b345      	st.w      	r2, (r3, 0x14)
			HAL_ADC_CompareCallback(hadc);
 801221c:	6c13      	mov      	r0, r4
 801221e:	e3ffffdf 	bsr      	0x80121dc	// 80121dc <HAL_ADC_CompareCallback>
		}
	}
}
 8012222:	1491      	pop      	r4, r15

08012224 <__PWM_OutMode_Config>:
 *                         Pulse = 0      ：PWM输出高电平宽度为(1)，低电平宽度为(2 * Period + 1)
 */

HAL_StatusTypeDef __PWM_OutMode_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t OutMode)
{
	if (PWM_OUT_MODE_BREAK == OutMode)
 8012224:	3a44      	cmpnei      	r2, 4
 8012226:	080b      	bt      	0x801223c	// 801223c <__PWM_OutMode_Config+0x18>
	{
		SET_BIT(hpwm->Instance->BKCR, (1 << (PWM_BKCR_EN_Pos + Channel)));
 8012228:	9060      	ld.w      	r3, (r0, 0x0)
 801222a:	e401000a 	addi      	r0, r1, 11
 801222e:	3101      	movi      	r1, 1
 8012230:	934a      	ld.w      	r2, (r3, 0x28)
 8012232:	7040      	lsl      	r1, r0
 8012234:	6c48      	or      	r1, r2
 8012236:	b32a      	st.w      	r1, (r3, 0x28)
			CLEAR_BIT(hpwm->Instance->CR, (1 << (PWM_CR_2COMPLEMENTARY_Pos + Channel / 2)));
		}
	}
	
	return HAL_OK;
}
 8012238:	3000      	movi      	r0, 0
 801223a:	783c      	jmp      	r15
	else if (PWM_OUT_MODE_5SYNC == OutMode)
 801223c:	3a43      	cmpnei      	r2, 3
 801223e:	080d      	bt      	0x8012258	// 8012258 <__PWM_OutMode_Config+0x34>
		CLEAR_BIT(hpwm->Instance->BKCR, (PWM_CHANNEL_ALL << PWM_BKCR_EN_Pos));
 8012240:	9060      	ld.w      	r3, (r0, 0x0)
 8012242:	ea01f800 	movi      	r1, 63488
 8012246:	6c46      	nor      	r1, r1
 8012248:	934a      	ld.w      	r2, (r3, 0x28)
 801224a:	6884      	and      	r2, r1
 801224c:	b34a      	st.w      	r2, (r3, 0x28)
		SET_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 801224e:	9342      	ld.w      	r2, (r3, 0x8)
 8012250:	ec420040 	ori      	r2, r2, 64
		SET_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 8012254:	b342      	st.w      	r2, (r3, 0x8)
 8012256:	07f1      	br      	0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
	else if (PWM_OUT_MODE_2SYNC == OutMode)
 8012258:	3a41      	cmpnei      	r2, 1
 801225a:	0811      	bt      	0x801227c	// 801227c <__PWM_OutMode_Config+0x58>
		CLEAR_BIT(hpwm->Instance->BKCR, (PWM_CHANNEL_ALL << PWM_BKCR_EN_Pos));
 801225c:	9060      	ld.w      	r3, (r0, 0x0)
 801225e:	ea0cf800 	movi      	r12, 63488
 8012262:	6f32      	nor      	r12, r12
 8012264:	930a      	ld.w      	r0, (r3, 0x28)
 8012266:	6830      	and      	r0, r12
 8012268:	b30a      	st.w      	r0, (r3, 0x28)
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 801226a:	9302      	ld.w      	r0, (r3, 0x8)
 801226c:	3886      	bclri      	r0, 6
		SET_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 801226e:	4921      	lsri      	r1, r1, 1
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 8012270:	b302      	st.w      	r0, (r3, 0x8)
		SET_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 8012272:	210d      	addi      	r1, 14
 8012274:	9302      	ld.w      	r0, (r3, 0x8)
 8012276:	7084      	lsl      	r2, r1
 8012278:	6c80      	or      	r2, r0
 801227a:	07ed      	br      	0x8012254	// 8012254 <__PWM_OutMode_Config+0x30>
	else if (PWM_OUT_MODE_2COMPLEMENTARY == OutMode)
 801227c:	3a42      	cmpnei      	r2, 2
 801227e:	0835      	bt      	0x80122e8	// 80122e8 <__PWM_OutMode_Config+0xc4>
		CLEAR_BIT(hpwm->Instance->BKCR, (PWM_CHANNEL_ALL << PWM_BKCR_EN_Pos));
 8012280:	9060      	ld.w      	r3, (r0, 0x0)
 8012282:	ea0cf800 	movi      	r12, 63488
 8012286:	6f32      	nor      	r12, r12
 8012288:	934a      	ld.w      	r2, (r3, 0x28)
 801228a:	68b0      	and      	r2, r12
 801228c:	b34a      	st.w      	r2, (r3, 0x28)
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 801228e:	9342      	ld.w      	r2, (r3, 0x8)
 8012290:	3a86      	bclri      	r2, 6
		CLEAR_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 8012292:	c421484d 	lsri      	r13, r1, 1
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 8012296:	b342      	st.w      	r2, (r3, 0x8)
		CLEAR_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 8012298:	e58d000d 	addi      	r12, r13, 14
 801229c:	3201      	movi      	r2, 1
 801229e:	da432002 	ld.w      	r18, (r3, 0x8)
 80122a2:	c582402c 	lsl      	r12, r2, r12
 80122a6:	c592204c 	andn      	r12, r18, r12
 80122aa:	dd832002 	st.w      	r12, (r3, 0x8)
		SET_BIT(hpwm->Instance->CR, (1 << (PWM_CR_2COMPLEMENTARY_Pos + Channel / 2)));
 80122ae:	d9832002 	ld.w      	r12, (r3, 0x8)
 80122b2:	70b4      	lsl      	r2, r13
 80122b4:	6cb0      	or      	r2, r12
 80122b6:	b342      	st.w      	r2, (r3, 0x8)
		if (Channel == PWM_CHANNEL_0)
 80122b8:	e921000c 	bnez      	r1, 0x80122d0	// 80122d0 <__PWM_OutMode_Config+0xac>
			MODIFY_REG(hpwm->Instance->DTCR, (PWM_DTCR_DTDIV | PWM_DTCR_DTCNT01), (PWM_DTCR_DTEN01 | hpwm->Init.Dtdiv |  hpwm->Init.Dtcnt));
 80122bc:	9048      	ld.w      	r2, (r0, 0x20)
 80122be:	9009      	ld.w      	r0, (r0, 0x24)
 80122c0:	6c80      	or      	r2, r0
 80122c2:	9326      	ld.w      	r1, (r3, 0x18)
 80122c4:	3ab4      	bseti      	r2, 20
 80122c6:	1019      	lrw      	r0, 0xfffcff00	// 8012328 <__PWM_OutMode_Config+0x104>
			MODIFY_REG(hpwm->Instance->DTCR, (PWM_DTCR_DTDIV | PWM_DTCR_DTCNT23), (PWM_DTCR_DTEN23 | hpwm->Init.Dtdiv |  hpwm->Init.Dtcnt));
 80122c8:	6840      	and      	r1, r0
 80122ca:	6c84      	or      	r2, r1
 80122cc:	b346      	st.w      	r2, (r3, 0x18)
 80122ce:	07b5      	br      	0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
		else if (Channel == PWM_CHANNEL_2)
 80122d0:	3942      	cmpnei      	r1, 2
 80122d2:	0bb3      	bt      	0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
			MODIFY_REG(hpwm->Instance->DTCR, (PWM_DTCR_DTDIV | PWM_DTCR_DTCNT23), (PWM_DTCR_DTEN23 | hpwm->Init.Dtdiv |  hpwm->Init.Dtcnt));
 80122d4:	9048      	ld.w      	r2, (r0, 0x20)
 80122d6:	9009      	ld.w      	r0, (r0, 0x24)
 80122d8:	6c80      	or      	r2, r0
 80122da:	9326      	ld.w      	r1, (r3, 0x18)
 80122dc:	3ab5      	bseti      	r2, 21
 80122de:	c6a05020 	bmaski      	r0, 22
 80122e2:	c6404900 	rotli      	r0, r0, 18
 80122e6:	07f1      	br      	0x80122c8	// 80122c8 <__PWM_OutMode_Config+0xa4>
	else if (PWM_OUT_MODE_INDEPENDENT == OutMode)
 80122e8:	e922ffa8 	bnez      	r2, 0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
		CLEAR_BIT(hpwm->Instance->BKCR, (PWM_CHANNEL_ALL << PWM_BKCR_EN_Pos));
 80122ec:	9060      	ld.w      	r3, (r0, 0x0)
 80122ee:	ea00f800 	movi      	r0, 63488
 80122f2:	6c02      	nor      	r0, r0
 80122f4:	934a      	ld.w      	r2, (r3, 0x28)
 80122f6:	6880      	and      	r2, r0
 80122f8:	b34a      	st.w      	r2, (r3, 0x28)
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 80122fa:	9342      	ld.w      	r2, (r3, 0x8)
		if (Channel != PWM_CHANNEL_4)
 80122fc:	3944      	cmpnei      	r1, 4
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_ALLSYNCEN);
 80122fe:	3a86      	bclri      	r2, 6
 8012300:	b342      	st.w      	r2, (r3, 0x8)
		if (Channel != PWM_CHANNEL_4)
 8012302:	0f9b      	bf      	0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
			CLEAR_BIT(hpwm->Instance->CR, (1 << (PWM_CR_TWOSYNCEN_Pos + Channel / 2)));
 8012304:	4921      	lsri      	r1, r1, 1
 8012306:	e401000d 	addi      	r0, r1, 14
 801230a:	3201      	movi      	r2, 1
 801230c:	d9832002 	ld.w      	r12, (r3, 0x8)
 8012310:	c4024020 	lsl      	r0, r2, r0
 8012314:	c40c2040 	andn      	r0, r12, r0
 8012318:	b302      	st.w      	r0, (r3, 0x8)
			CLEAR_BIT(hpwm->Instance->CR, (1 << (PWM_CR_2COMPLEMENTARY_Pos + Channel / 2)));
 801231a:	9302      	ld.w      	r0, (r3, 0x8)
 801231c:	c4224021 	lsl      	r1, r2, r1
 8012320:	c4202041 	andn      	r1, r0, r1
 8012324:	b322      	st.w      	r1, (r3, 0x8)
 8012326:	0789      	br      	0x8012238	// 8012238 <__PWM_OutMode_Config+0x14>
 8012328:	fffcff00 	.long	0xfffcff00

0801232c <__PWM_CountType_Config>:

HAL_StatusTypeDef __PWM_CountType_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t CounterMode)
{
	if (Channel == PWM_CHANNEL_4)
 801232c:	3944      	cmpnei      	r1, 4
 801232e:	9000      	ld.w      	r0, (r0, 0x0)
 8012330:	0809      	bt      	0x8012342	// 8012342 <__PWM_CountType_Config+0x16>
	{
		MODIFY_REG(hpwm->Instance->CH4CR2, PWM_CH4CR2_CNTTYPE, (CounterMode << PWM_CH4CR2_CNTTYPE_Pos));
 8012332:	902c      	ld.w      	r1, (r0, 0x30)
 8012334:	3983      	bclri      	r1, 3
 8012336:	3984      	bclri      	r1, 4
 8012338:	4243      	lsli      	r2, r2, 3
 801233a:	6c84      	or      	r2, r1
 801233c:	b04c      	st.w      	r2, (r0, 0x30)
		MODIFY_REG(hpwm->Instance->CR, (0x0FF << (PWM_CR_CNTTYPE0_Pos + Channel * 2)), 
					(CounterMode << (PWM_CR_CNTTYPE0_Pos + Channel * 2)));
	}
	
	return HAL_OK;
}
 801233e:	3000      	movi      	r0, 0
 8012340:	783c      	jmp      	r15
		MODIFY_REG(hpwm->Instance->CR, (0x0FF << (PWM_CR_CNTTYPE0_Pos + Channel * 2)), 
 8012342:	2107      	addi      	r1, 8
 8012344:	6044      	addu      	r1, r1
 8012346:	33ff      	movi      	r3, 255
 8012348:	d9802002 	ld.w      	r12, (r0, 0x8)
 801234c:	70c4      	lsl      	r3, r1
 801234e:	c46c2043 	andn      	r3, r12, r3
 8012352:	c4224021 	lsl      	r1, r2, r1
 8012356:	6c4c      	or      	r1, r3
 8012358:	b022      	st.w      	r1, (r0, 0x8)
 801235a:	07f2      	br      	0x801233e	// 801233e <__PWM_CountType_Config+0x12>

0801235c <__PWM_Freq_Config>:

HAL_StatusTypeDef __PWM_Freq_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t Prescaler, uint32_t Period)
{
	if (hpwm->Channel == PWM_CHANNEL_0)
 801235c:	906a      	ld.w      	r3, (r0, 0x28)
 801235e:	e9230013 	bnez      	r3, 0x8012384	// 8012384 <__PWM_Freq_Config+0x28>
	{
		MODIFY_REG(hpwm->Instance->CLKDIV01, PWM_CLKDIV01_CH0, hpwm->Init.Prescaler);
 8012362:	9040      	ld.w      	r2, (r0, 0x0)
 8012364:	ea21ffff 	movih      	r1, 65535
 8012368:	9260      	ld.w      	r3, (r2, 0x0)
 801236a:	68c4      	and      	r3, r1
 801236c:	9021      	ld.w      	r1, (r0, 0x4)
 801236e:	6cc4      	or      	r3, r1
 8012370:	b260      	st.w      	r3, (r2, 0x0)
		MODIFY_REG(hpwm->Instance->PERIOD, PWM_PERIOD_CH0, hpwm->Init.Period);
 8012372:	3100      	movi      	r1, 0
 8012374:	29ff      	subi      	r1, 256
 8012376:	9263      	ld.w      	r3, (r2, 0xc)
 8012378:	68c4      	and      	r3, r1
 801237a:	9023      	ld.w      	r1, (r0, 0xc)
	}
	else if (hpwm->Channel == PWM_CHANNEL_1)
	{
		MODIFY_REG(hpwm->Instance->CLKDIV01, PWM_CLKDIV01_CH1, (hpwm->Init.Prescaler << PWM_CLKDIV01_CH1_Pos));
		MODIFY_REG(hpwm->Instance->PERIOD, PWM_PERIOD_CH1, (hpwm->Init.Period << PWM_PERIOD_CH1_Pos));
 801237c:	6cc4      	or      	r3, r1
 801237e:	b263      	st.w      	r3, (r2, 0xc)
		MODIFY_REG(hpwm->Instance->CH4CR1, (PWM_CH4CR1_DIV | PWM_CH4CR1_PRD), 
					((hpwm->Init.Prescaler << PWM_CH4CR1_DIV_Pos) | (hpwm->Init.Period << PWM_CH4CR1_PRD_Pos)));
	}
	
	return HAL_OK; 
}
 8012380:	3000      	movi      	r0, 0
 8012382:	783c      	jmp      	r15
	else if (hpwm->Channel == PWM_CHANNEL_1)
 8012384:	3b41      	cmpnei      	r3, 1
 8012386:	0811      	bt      	0x80123a8	// 80123a8 <__PWM_Freq_Config+0x4c>
		MODIFY_REG(hpwm->Instance->CLKDIV01, PWM_CLKDIV01_CH1, (hpwm->Init.Prescaler << PWM_CLKDIV01_CH1_Pos));
 8012388:	9040      	ld.w      	r2, (r0, 0x0)
 801238a:	9061      	ld.w      	r3, (r0, 0x4)
 801238c:	9220      	ld.w      	r1, (r2, 0x0)
 801238e:	c40155e1 	zext      	r1, r1, 15, 0
 8012392:	4370      	lsli      	r3, r3, 16
 8012394:	6cc4      	or      	r3, r1
 8012396:	b260      	st.w      	r3, (r2, 0x0)
		MODIFY_REG(hpwm->Instance->PERIOD, PWM_PERIOD_CH1, (hpwm->Init.Period << PWM_PERIOD_CH1_Pos));
 8012398:	9063      	ld.w      	r3, (r0, 0xc)
 801239a:	9223      	ld.w      	r1, (r2, 0xc)
 801239c:	4368      	lsli      	r3, r3, 8
 801239e:	ea00ff00 	movi      	r0, 65280
 80123a2:	6c02      	nor      	r0, r0
 80123a4:	6840      	and      	r1, r0
 80123a6:	07eb      	br      	0x801237c	// 801237c <__PWM_Freq_Config+0x20>
	else if (hpwm->Channel == PWM_CHANNEL_2)
 80123a8:	3b42      	cmpnei      	r3, 2
 80123aa:	0810      	bt      	0x80123ca	// 80123ca <__PWM_Freq_Config+0x6e>
		MODIFY_REG(hpwm->Instance->CLKDIV23, PWM_CLKDIV23_CH2, hpwm->Init.Prescaler);
 80123ac:	9040      	ld.w      	r2, (r0, 0x0)
 80123ae:	ea21ffff 	movih      	r1, 65535
 80123b2:	9261      	ld.w      	r3, (r2, 0x4)
 80123b4:	68c4      	and      	r3, r1
 80123b6:	9021      	ld.w      	r1, (r0, 0x4)
 80123b8:	6cc4      	or      	r3, r1
 80123ba:	b261      	st.w      	r3, (r2, 0x4)
		MODIFY_REG(hpwm->Instance->PERIOD, PWM_PERIOD_CH2, (hpwm->Init.Period << PWM_PERIOD_CH2_Pos));
 80123bc:	9063      	ld.w      	r3, (r0, 0xc)
 80123be:	ea20ff01 	movih      	r0, 65281
 80123c2:	9223      	ld.w      	r1, (r2, 0xc)
 80123c4:	4370      	lsli      	r3, r3, 16
 80123c6:	2800      	subi      	r0, 1
 80123c8:	07ee      	br      	0x80123a4	// 80123a4 <__PWM_Freq_Config+0x48>
	else if (hpwm->Channel == PWM_CHANNEL_3)
 80123ca:	3b43      	cmpnei      	r3, 3
 80123cc:	080f      	bt      	0x80123ea	// 80123ea <__PWM_Freq_Config+0x8e>
		MODIFY_REG(hpwm->Instance->CLKDIV23, PWM_CLKDIV23_CH3, (hpwm->Init.Prescaler << PWM_CLKDIV23_CH3_Pos));
 80123ce:	9040      	ld.w      	r2, (r0, 0x0)
 80123d0:	9061      	ld.w      	r3, (r0, 0x4)
 80123d2:	9221      	ld.w      	r1, (r2, 0x4)
 80123d4:	c40155e1 	zext      	r1, r1, 15, 0
 80123d8:	4370      	lsli      	r3, r3, 16
 80123da:	6cc4      	or      	r3, r1
 80123dc:	b261      	st.w      	r3, (r2, 0x4)
		MODIFY_REG(hpwm->Instance->PERIOD, PWM_PERIOD_CH3, (hpwm->Init.Period << PWM_PERIOD_CH3_Pos));
 80123de:	9223      	ld.w      	r1, (r2, 0xc)
 80123e0:	9063      	ld.w      	r3, (r0, 0xc)
 80123e2:	4378      	lsli      	r3, r3, 24
 80123e4:	c40156e1 	zext      	r1, r1, 23, 0
 80123e8:	07ca      	br      	0x801237c	// 801237c <__PWM_Freq_Config+0x20>
	else if (hpwm->Channel == PWM_CHANNEL_4)
 80123ea:	3b44      	cmpnei      	r3, 4
 80123ec:	0bca      	bt      	0x8012380	// 8012380 <__PWM_Freq_Config+0x24>
		MODIFY_REG(hpwm->Instance->CH4CR1, (PWM_CH4CR1_DIV | PWM_CH4CR1_PRD), 
 80123ee:	d9802000 	ld.w      	r12, (r0, 0x0)
 80123f2:	9061      	ld.w      	r3, (r0, 0x4)
 80123f4:	9023      	ld.w      	r1, (r0, 0xc)
 80123f6:	d84c200b 	ld.w      	r2, (r12, 0x2c)
 80123fa:	4370      	lsli      	r3, r3, 16
 80123fc:	4128      	lsli      	r1, r1, 8
 80123fe:	6cc4      	or      	r3, r1
 8012400:	e44220ff 	andi      	r2, r2, 255
 8012404:	6cc8      	or      	r3, r2
 8012406:	dc6c200b 	st.w      	r3, (r12, 0x2c)
 801240a:	07bb      	br      	0x8012380	// 8012380 <__PWM_Freq_Config+0x24>

0801240c <__PWM_Duty_Config>:

HAL_StatusTypeDef __PWM_Duty_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t Pulse)
{
	if (Channel == PWM_CHANNEL_0)
 801240c:	e921000b 	bnez      	r1, 0x8012422	// 8012422 <__PWM_Duty_Config+0x16>
	{
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH0, Pulse);
 8012410:	9020      	ld.w      	r1, (r0, 0x0)
 8012412:	3000      	movi      	r0, 0
 8012414:	9165      	ld.w      	r3, (r1, 0x14)
 8012416:	28ff      	subi      	r0, 256
 8012418:	68c0      	and      	r3, r0
	{
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH2, (Pulse << PWM_CMPDAT_CH2_Pos));
	}
	else if (Channel == PWM_CHANNEL_3)
	{
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH3, (Pulse << PWM_CMPDAT_CH3_Pos));
 801241a:	6c8c      	or      	r2, r3
 801241c:	b145      	st.w      	r2, (r1, 0x14)
	{
		MODIFY_REG(hpwm->Instance->CH4CR2, PWM_CH4CR2_CMP, (Pulse << PWM_CH4CR2_CMP_Pos));
	}
	
	return HAL_OK;
}
 801241e:	3000      	movi      	r0, 0
 8012420:	783c      	jmp      	r15
	else if (Channel == PWM_CHANNEL_1)
 8012422:	3941      	cmpnei      	r1, 1
 8012424:	0809      	bt      	0x8012436	// 8012436 <__PWM_Duty_Config+0x2a>
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH1, (Pulse << PWM_CMPDAT_CH1_Pos));
 8012426:	9020      	ld.w      	r1, (r0, 0x0)
 8012428:	ea00ff00 	movi      	r0, 65280
 801242c:	6c02      	nor      	r0, r0
 801242e:	9165      	ld.w      	r3, (r1, 0x14)
 8012430:	68c0      	and      	r3, r0
 8012432:	4248      	lsli      	r2, r2, 8
 8012434:	07f3      	br      	0x801241a	// 801241a <__PWM_Duty_Config+0xe>
	else if (Channel == PWM_CHANNEL_2)
 8012436:	3942      	cmpnei      	r1, 2
 8012438:	0809      	bt      	0x801244a	// 801244a <__PWM_Duty_Config+0x3e>
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH2, (Pulse << PWM_CMPDAT_CH2_Pos));
 801243a:	9020      	ld.w      	r1, (r0, 0x0)
 801243c:	ea20ff01 	movih      	r0, 65281
 8012440:	9165      	ld.w      	r3, (r1, 0x14)
 8012442:	2800      	subi      	r0, 1
 8012444:	68c0      	and      	r3, r0
 8012446:	4250      	lsli      	r2, r2, 16
 8012448:	07e9      	br      	0x801241a	// 801241a <__PWM_Duty_Config+0xe>
	else if (Channel == PWM_CHANNEL_3)
 801244a:	3943      	cmpnei      	r1, 3
 801244c:	0807      	bt      	0x801245a	// 801245a <__PWM_Duty_Config+0x4e>
		MODIFY_REG(hpwm->Instance->CMPDAT, PWM_CMPDAT_CH3, (Pulse << PWM_CMPDAT_CH3_Pos));
 801244e:	9020      	ld.w      	r1, (r0, 0x0)
 8012450:	4258      	lsli      	r2, r2, 24
 8012452:	9165      	ld.w      	r3, (r1, 0x14)
 8012454:	c40356e3 	zext      	r3, r3, 23, 0
 8012458:	07e1      	br      	0x801241a	// 801241a <__PWM_Duty_Config+0xe>
	else if (Channel == PWM_CHANNEL_4)
 801245a:	3944      	cmpnei      	r1, 4
 801245c:	0be1      	bt      	0x801241e	// 801241e <__PWM_Duty_Config+0x12>
		MODIFY_REG(hpwm->Instance->CH4CR2, PWM_CH4CR2_CMP, (Pulse << PWM_CH4CR2_CMP_Pos));
 801245e:	9020      	ld.w      	r1, (r0, 0x0)
 8012460:	ea00ff00 	movi      	r0, 65280
 8012464:	6c02      	nor      	r0, r0
 8012466:	916c      	ld.w      	r3, (r1, 0x30)
 8012468:	68c0      	and      	r3, r0
 801246a:	4248      	lsli      	r2, r2, 8
 801246c:	6c8c      	or      	r2, r3
 801246e:	b14c      	st.w      	r2, (r1, 0x30)
 8012470:	07d7      	br      	0x801241e	// 801241e <__PWM_Duty_Config+0x12>
	...

08012474 <__PWM_AutoReload_Config>:

HAL_StatusTypeDef __PWM_AutoReload_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t AutoReloadPreload)
{
	if (Channel == PWM_CHANNEL_4)
 8012474:	3944      	cmpnei      	r1, 4
 8012476:	9000      	ld.w      	r0, (r0, 0x0)
 8012478:	0808      	bt      	0x8012488	// 8012488 <__PWM_AutoReload_Config+0x14>
	{
		MODIFY_REG(hpwm->Instance->CH4CR2, PWM_CH4CR2_CNTMODE, (AutoReloadPreload << PWM_CH4CR2_CNTMODE_Pos));
 801247a:	906c      	ld.w      	r3, (r0, 0x30)
 801247c:	3b81      	bclri      	r3, 1
 801247e:	6088      	addu      	r2, r2
 8012480:	6c8c      	or      	r2, r3
 8012482:	b04c      	st.w      	r2, (r0, 0x30)
		MODIFY_REG(hpwm->Instance->CR, (0x01 << (PWM_CR_CNTMODE_Pos + Channel)), 
					(AutoReloadPreload << (PWM_CR_CNTMODE_Pos + Channel)));
	}
	
	return HAL_OK;
}
 8012484:	3000      	movi      	r0, 0
 8012486:	783c      	jmp      	r15
		MODIFY_REG(hpwm->Instance->CR, (0x01 << (PWM_CR_CNTMODE_Pos + Channel)), 
 8012488:	3300      	movi      	r3, 0
 801248a:	2107      	addi      	r1, 8
 801248c:	2b01      	subi      	r3, 2
 801248e:	d9802002 	ld.w      	r12, (r0, 0x8)
 8012492:	70c7      	rotl      	r3, r1
 8012494:	68f0      	and      	r3, r12
 8012496:	7084      	lsl      	r2, r1
 8012498:	6cc8      	or      	r3, r2
 801249a:	b062      	st.w      	r3, (r0, 0x8)
 801249c:	07f4      	br      	0x8012484	// 8012484 <__PWM_AutoReload_Config+0x10>
	...

080124a0 <__PWM_OutInverse_Config>:

HAL_StatusTypeDef __PWM_OutInverse_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t OutInverse)
{
	if (Channel == PWM_CHANNEL_4)
 80124a0:	3944      	cmpnei      	r1, 4
 80124a2:	d9802000 	ld.w      	r12, (r0, 0x0)
 80124a6:	0809      	bt      	0x80124b8	// 80124b8 <__PWM_OutInverse_Config+0x18>
	{
		MODIFY_REG(hpwm->Instance->CH4CR2, PWM_CH4CR2_PINV, OutInverse);
 80124a8:	d80c200c 	ld.w      	r0, (r12, 0x30)
 80124ac:	3880      	bclri      	r0, 0
 80124ae:	6c80      	or      	r2, r0
 80124b0:	dc4c200c 	st.w      	r2, (r12, 0x30)
		MODIFY_REG(hpwm->Instance->CR, (0x01 << (PWM_CR_PINV_Pos + Channel)), 
					(OutInverse << (PWM_CR_PINV_Pos + Channel)));
	}
	
	return HAL_OK;
}
 80124b4:	3000      	movi      	r0, 0
 80124b6:	783c      	jmp      	r15
		MODIFY_REG(hpwm->Instance->CR, (0x01 << (PWM_CR_PINV_Pos + Channel)), 
 80124b8:	3300      	movi      	r3, 0
 80124ba:	2101      	addi      	r1, 2
 80124bc:	2b01      	subi      	r3, 2
 80124be:	d80c2002 	ld.w      	r0, (r12, 0x8)
 80124c2:	70c7      	rotl      	r3, r1
 80124c4:	68c0      	and      	r3, r0
 80124c6:	c4224021 	lsl      	r1, r2, r1
 80124ca:	6cc4      	or      	r3, r1
 80124cc:	dc6c2002 	st.w      	r3, (r12, 0x8)
 80124d0:	07f2      	br      	0x80124b4	// 80124b4 <__PWM_OutInverse_Config+0x14>
	...

080124d4 <__PWM_OutEn_Config>:

HAL_StatusTypeDef __PWM_OutEn_Config(PWM_HandleTypeDef *hpwm, uint32_t Channel)
{
	if (Channel == PWM_CHANNEL_0)
 80124d4:	e9210008 	bnez      	r1, 0x80124e4	// 80124e4 <__PWM_OutEn_Config+0x10>
	{
		CLEAR_BIT(hpwm->Instance->CR, PWM_CR_POEN);
 80124d8:	9040      	ld.w      	r2, (r0, 0x0)
 80124da:	9262      	ld.w      	r3, (r2, 0x8)
 80124dc:	3b8c      	bclri      	r3, 12
 80124de:	b262      	st.w      	r3, (r2, 0x8)
	{
		CLEAR_BIT(hpwm->Instance->CH4CR3, PWM_CH4CR3_POEN);
	}
	
	return HAL_OK;
}
 80124e0:	3000      	movi      	r0, 0
 80124e2:	783c      	jmp      	r15
	if (Channel == PWM_CHANNEL_4)
 80124e4:	3944      	cmpnei      	r1, 4
 80124e6:	0bfd      	bt      	0x80124e0	// 80124e0 <__PWM_OutEn_Config+0xc>
		CLEAR_BIT(hpwm->Instance->CH4CR3, PWM_CH4CR3_POEN);
 80124e8:	9040      	ld.w      	r2, (r0, 0x0)
 80124ea:	926e      	ld.w      	r3, (r2, 0x38)
 80124ec:	3b82      	bclri      	r3, 2
 80124ee:	b26e      	st.w      	r3, (r2, 0x38)
 80124f0:	07f8      	br      	0x80124e0	// 80124e0 <__PWM_OutEn_Config+0xc>
	...

080124f4 <HAL_PWM_Init>:

HAL_StatusTypeDef HAL_PWM_Init(PWM_HandleTypeDef *hpwm)
{
 80124f4:	14d1      	push      	r4, r15
 80124f6:	6d03      	mov      	r4, r0
	if (hpwm == NULL)
 80124f8:	e9000029 	bez      	r0, 0x801254a	// 801254a <HAL_PWM_Init+0x56>
	{
		assert_param(IS_PWM_DTDIV(hpwm->Init.Dtdiv));
		assert_param(IS_PWM_DTCNT(hpwm->Init.Dtcnt));
	}
	
	HAL_PWM_MspInit(hpwm);
 80124fc:	e0000cd0 	bsr      	0x8013e9c	// 8013e9c <HAL_PWM_MspInit>
	__PWM_OutMode_Config(hpwm, hpwm->Channel, hpwm->Init.OutMode);
 8012500:	9446      	ld.w      	r2, (r4, 0x18)
 8012502:	942a      	ld.w      	r1, (r4, 0x28)
 8012504:	6c13      	mov      	r0, r4
 8012506:	e3fffe8f 	bsr      	0x8012224	// 8012224 <__PWM_OutMode_Config>
	__PWM_CountType_Config(hpwm, hpwm->Channel, hpwm->Init.CounterMode);
 801250a:	9442      	ld.w      	r2, (r4, 0x8)
 801250c:	942a      	ld.w      	r1, (r4, 0x28)
 801250e:	6c13      	mov      	r0, r4
 8012510:	e3ffff0e 	bsr      	0x801232c	// 801232c <__PWM_CountType_Config>
	__PWM_Freq_Config(hpwm, hpwm->Channel, hpwm->Init.Prescaler, hpwm->Init.Period);
 8012514:	9463      	ld.w      	r3, (r4, 0xc)
 8012516:	9441      	ld.w      	r2, (r4, 0x4)
 8012518:	942a      	ld.w      	r1, (r4, 0x28)
 801251a:	6c13      	mov      	r0, r4
 801251c:	e3ffff20 	bsr      	0x801235c	// 801235c <__PWM_Freq_Config>
	__PWM_Duty_Config(hpwm, hpwm->Channel, hpwm->Init.Pulse);
 8012520:	9444      	ld.w      	r2, (r4, 0x10)
 8012522:	942a      	ld.w      	r1, (r4, 0x28)
 8012524:	6c13      	mov      	r0, r4
 8012526:	e3ffff73 	bsr      	0x801240c	// 801240c <__PWM_Duty_Config>
	__PWM_AutoReload_Config(hpwm, hpwm->Channel, hpwm->Init.AutoReloadPreload);
 801252a:	9445      	ld.w      	r2, (r4, 0x14)
 801252c:	942a      	ld.w      	r1, (r4, 0x28)
 801252e:	6c13      	mov      	r0, r4
 8012530:	e3ffffa2 	bsr      	0x8012474	// 8012474 <__PWM_AutoReload_Config>
	__PWM_OutInverse_Config(hpwm, hpwm->Channel, hpwm->Init.OutInverse);
 8012534:	9447      	ld.w      	r2, (r4, 0x1c)
 8012536:	942a      	ld.w      	r1, (r4, 0x28)
 8012538:	6c13      	mov      	r0, r4
 801253a:	e3ffffb3 	bsr      	0x80124a0	// 80124a0 <__PWM_OutInverse_Config>
	__PWM_OutEn_Config(hpwm, hpwm->Channel);
 801253e:	942a      	ld.w      	r1, (r4, 0x28)
 8012540:	6c13      	mov      	r0, r4
 8012542:	e3ffffc9 	bsr      	0x80124d4	// 80124d4 <__PWM_OutEn_Config>
	
	return HAL_OK;
 8012546:	3000      	movi      	r0, 0
}
 8012548:	1491      	pop      	r4, r15
		return HAL_ERROR;
 801254a:	3001      	movi      	r0, 1
 801254c:	07fe      	br      	0x8012548	// 8012548 <HAL_PWM_Init+0x54>
	...

08012550 <HAL_PWM_Start>:
{
	UNUSED(hpwm);
}

HAL_StatusTypeDef HAL_PWM_Start(PWM_HandleTypeDef *hpwm, uint32_t channel)
{
 8012550:	3301      	movi      	r3, 1
	if (hpwm == NULL)
 8012552:	e900000d 	bez      	r0, 0x801256c	// 801256c <HAL_PWM_Start+0x1c>
	}
	
	assert_param(IS_PWM_INSTANCE(hpwm->Instance));
	assert_param(IS_PWM_CHANNELS(Channel));
	
	SET_BIT(hpwm->Instance->CR, (0x01 << (PWM_CR_CNTEN_Pos + channel)));
 8012556:	9040      	ld.w      	r2, (r0, 0x0)
 8012558:	e401001a 	addi      	r0, r1, 27
 801255c:	d9822002 	ld.w      	r12, (r2, 0x8)
 8012560:	c4034020 	lsl      	r0, r3, r0
 8012564:	6c30      	or      	r0, r12
 8012566:	b202      	st.w      	r0, (r2, 0x8)
	
	return HAL_OK;
 8012568:	3000      	movi      	r0, 0
}
 801256a:	783c      	jmp      	r15
		return HAL_ERROR;
 801256c:	6c0f      	mov      	r0, r3
 801256e:	07fe      	br      	0x801256a	// 801256a <HAL_PWM_Start+0x1a>

08012570 <HAL_PWM_Duty_Set>:
	
	return HAL_OK;
}

HAL_StatusTypeDef HAL_PWM_Duty_Set(PWM_HandleTypeDef *hpwm, uint32_t Channel, uint32_t Duty)
{
 8012570:	14d0      	push      	r15
	if (hpwm == NULL)
 8012572:	e9000006 	bez      	r0, 0x801257e	// 801257e <HAL_PWM_Duty_Set+0xe>
	
	assert_param(IS_PWM_INSTANCE(hpwm->Instance));
	assert_param(IS_PWM_CHANNELS(Channel));
	assert_param(IS_PWM_PULSE(Duty));
	
	__PWM_Duty_Config(hpwm, Channel, Duty);
 8012576:	e3ffff4b 	bsr      	0x801240c	// 801240c <__PWM_Duty_Config>
	
	return HAL_OK;
 801257a:	3000      	movi      	r0, 0
}
 801257c:	1490      	pop      	r15
		return HAL_ERROR;
 801257e:	3001      	movi      	r0, 1
 8012580:	07fe      	br      	0x801257c	// 801257c <HAL_PWM_Duty_Set+0xc>
	...

08012584 <HAL_PMU_IRQHandler>:
{
	UNUSED(NULL);
}

void HAL_PMU_IRQHandler(PMU_HandleTypeDef *hpmu)
{
 8012584:	14d2      	push      	r4-r5, r15
	uint32_t flag = READ_REG(hpmu->Instance->IF);
 8012586:	9060      	ld.w      	r3, (r0, 0x0)
{
 8012588:	6d43      	mov      	r5, r0
	uint32_t flag = READ_REG(hpmu->Instance->IF);
 801258a:	9385      	ld.w      	r4, (r3, 0x14)
	
	SET_BIT(hpmu->Instance->IF, (PMU_IF_SLEEP | PMU_IF_STANDBY | PMU_IF_TIM0 | PMU_IF_IO_WAKE | PMU_IF_RTC));
 801258c:	9345      	ld.w      	r2, (r3, 0x14)
 801258e:	ec420195 	ori      	r2, r2, 405
 8012592:	b345      	st.w      	r2, (r3, 0x14)
	if ((flag & PMU_IF_TIM0) == PMU_IF_TIM0)
 8012594:	e4642001 	andi      	r3, r4, 1
 8012598:	e9030004 	bez      	r3, 0x80125a0	// 80125a0 <HAL_PMU_IRQHandler+0x1c>
	{
		HAL_PMU_Tim0_Callback(hpmu);
 801259c:	e0000bf0 	bsr      	0x8013d7c	// 8013d7c <HAL_PMU_Tim0_Callback>
	}
	if ((flag & PMU_IF_IO_WAKE) == PMU_IF_IO_WAKE)
 80125a0:	e4642004 	andi      	r3, r4, 4
 80125a4:	e9030005 	bez      	r3, 0x80125ae	// 80125ae <HAL_PMU_IRQHandler+0x2a>
	{
		HAL_PMU_IO_Callback(hpmu);
 80125a8:	6c17      	mov      	r0, r5
 80125aa:	e0000bf1 	bsr      	0x8013d8c	// 8013d8c <HAL_PMU_IO_Callback>
	}
	if ((flag & PMU_IF_RTC) == PMU_IF_RTC)
 80125ae:	e4842010 	andi      	r4, r4, 16
 80125b2:	e9040005 	bez      	r4, 0x80125bc	// 80125bc <HAL_PMU_IRQHandler+0x38>
	{
		HAL_PMU_RTC_Callback(hpmu);
 80125b6:	6c17      	mov      	r0, r5
 80125b8:	e0000ee2 	bsr      	0x801437c	// 801437c <HAL_PMU_RTC_Callback>
	}
}
 80125bc:	1492      	pop      	r4-r5, r15
	...

080125c0 <main>:
/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
 80125c0:	14d0      	push      	r15
	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();
 80125c2:	e3fffd17 	bsr      	0x8011ff0	// 8011ff0 <HAL_Init>
	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config(CPU_CLK_160M);
 80125c6:	3003      	movi      	r0, 3
 80125c8:	e3fffcac 	bsr      	0x8011f20	// 8011f20 <SystemClock_Config>
	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MY_BSP_Init();
 80125cc:	e0000b58 	bsr      	0x8013c7c	// 8013c7c <MY_BSP_Init>
	/* USER CODE BEGIN 2 */
	MY_APP_Test();	
 80125d0:	e0000b6a 	bsr      	0x8013ca4	// 8013ca4 <MY_APP_Test>
	/* USER CODE END 2 */

	/* Call init function for freertos objects (in freertos.c) */
	MX_FREERTOS_Init();
 80125d4:	e00000d6 	bsr      	0x8012780	// 8012780 <MX_FREERTOS_Init>
	/* Start scheduler */
	tls_os_start_scheduler();
 80125d8:	e3fffb64 	bsr      	0x8011ca0	// 8011ca0 <tls_os_start_scheduler>
	while (1)
	{
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
		HAL_Delay(10);
 80125dc:	300a      	movi      	r0, 10
 80125de:	e3fffcd5 	bsr      	0x8011f88	// 8011f88 <HAL_Delay>
 80125e2:	07fd      	br      	0x80125dc	// 80125dc <main+0x1c>

080125e4 <HAL_MspInit>:
#include "wm_hal.h"

void HAL_MspInit(void)
{

}
 80125e4:	783c      	jmp      	r15
	...

080125e8 <CORET_IRQHandler>:
        * Output
        * EVENT_OUT
        * EXTI
*/
__attribute__((isr)) void CORET_IRQHandler(void)
{
 80125e8:	1460      	nie
 80125ea:	1462      	ipush
 80125ec:	142e      	subi      	r14, r14, 56
 80125ee:	d64e1c2d 	stm      	r18-r31, (r14)
 80125f2:	1428      	subi      	r14, r14, 32
 80125f4:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80125f8:	14d0      	push      	r15
	CSI_INTRPT_ENTER();
 80125fa:	e3fffb57 	bsr      	0x8011ca8	// 8011ca8 <csi_kernel_intrpt_enter>
	readl(0xE000E010);
 80125fe:	1069      	lrw      	r3, 0xe000e000	// 8012620 <CORET_IRQHandler+0x38>
 8012600:	9364      	ld.w      	r3, (r3, 0x10)
	xPortSysTickHandler();
 8012602:	e0000fe5 	bsr      	0x80145cc	// 80145cc <xPortSysTickHandler>
	CSI_INTRPT_EXIT();
 8012606:	e3fffb53 	bsr      	0x8011cac	// 8011cac <csi_kernel_intrpt_exit>
}
 801260a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801260e:	1401      	addi      	r14, r14, 4
 8012610:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012614:	1408      	addi      	r14, r14, 32
 8012616:	d24e1c2d 	ldm      	r18-r31, (r14)
 801261a:	140e      	addi      	r14, r14, 56
 801261c:	1463      	ipop
 801261e:	1461      	nir
 8012620:	e000e000 	.long	0xe000e000

08012624 <GPIOB_IRQHandler>:

/* USER CODE BEGIN 3 */

/********************EXTI IRQ******************/
__attribute__((isr)) void GPIOB_IRQHandler(void)
{
 8012624:	1460      	nie
 8012626:	1462      	ipush
 8012628:	142e      	subi      	r14, r14, 56
 801262a:	d64e1c2d 	stm      	r18-r31, (r14)
 801262e:	1428      	subi      	r14, r14, 32
 8012630:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012634:	14d0      	push      	r15
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_5);
 8012636:	3120      	movi      	r1, 32
 8012638:	1007      	lrw      	r0, 0x40011400	// 8012654 <GPIOB_IRQHandler+0x30>
 801263a:	e3fffc19 	bsr      	0x8011e6c	// 8011e6c <HAL_GPIO_EXTI_IRQHandler>
}
 801263e:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8012642:	1401      	addi      	r14, r14, 4
 8012644:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012648:	1408      	addi      	r14, r14, 32
 801264a:	d24e1c2d 	ldm      	r18-r31, (r14)
 801264e:	140e      	addi      	r14, r14, 56
 8012650:	1463      	ipop
 8012652:	1461      	nir
 8012654:	40011400 	.long	0x40011400

08012658 <TIM0_5_IRQHandler>:

extern TIM_HandleTypeDef htim0;
extern TIM_HandleTypeDef htim1;
/********************TIM IRQ******************/
__attribute__((isr)) void TIM0_5_IRQHandler(void)
{
 8012658:	1460      	nie
 801265a:	1462      	ipush
 801265c:	142e      	subi      	r14, r14, 56
 801265e:	d64e1c2d 	stm      	r18-r31, (r14)
 8012662:	1428      	subi      	r14, r14, 32
 8012664:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8012668:	14d0      	push      	r15
	HAL_TIM_IRQHandler(&htim0);
 801266a:	1009      	lrw      	r0, 0x2000698c	// 801268c <TIM0_5_IRQHandler+0x34>
 801266c:	e3fffd2e 	bsr      	0x80120c8	// 80120c8 <HAL_TIM_IRQHandler>
	HAL_TIM_IRQHandler(&htim1);
 8012670:	1008      	lrw      	r0, 0x200069a4	// 8012690 <TIM0_5_IRQHandler+0x38>
 8012672:	e3fffd2b 	bsr      	0x80120c8	// 80120c8 <HAL_TIM_IRQHandler>
}
 8012676:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 801267a:	1401      	addi      	r14, r14, 4
 801267c:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8012680:	1408      	addi      	r14, r14, 32
 8012682:	d24e1c2d 	ldm      	r18-r31, (r14)
 8012686:	140e      	addi      	r14, r14, 56
 8012688:	1463      	ipop
 801268a:	1461      	nir
 801268c:	2000698c 	.long	0x2000698c
 8012690:	200069a4 	.long	0x200069a4

08012694 <ADC_IRQHandler>:
/*********************End**********************/

extern ADC_HandleTypeDef hadc;
/********************ADC IRQ******************/
__attribute__((isr)) void ADC_IRQHandler(void)
{
 8012694:	1460      	nie
 8012696:	1462      	ipush
 8012698:	142e      	subi      	r14, r14, 56
 801269a:	d64e1c2d 	stm      	r18-r31, (r14)
 801269e:	1428      	subi      	r14, r14, 32
 80126a0:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80126a4:	14d0      	push      	r15
 	HAL_ADC_IRQHandler(&hadc);
 80126a6:	1008      	lrw      	r0, 0x20006968	// 80126c4 <ADC_IRQHandler+0x30>
 80126a8:	e3fffd9c 	bsr      	0x80121e0	// 80121e0 <HAL_ADC_IRQHandler>
}
 80126ac:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80126b0:	1401      	addi      	r14, r14, 4
 80126b2:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80126b6:	1408      	addi      	r14, r14, 32
 80126b8:	d24e1c2d 	ldm      	r18-r31, (r14)
 80126bc:	140e      	addi      	r14, r14, 56
 80126be:	1463      	ipop
 80126c0:	1461      	nir
 80126c2:	0000      	.short	0x0000
 80126c4:	20006968 	.long	0x20006968

080126c8 <PMU_IRQHandler>:
/*********************End**********************/

extern PMU_HandleTypeDef hpmu;
/********************PMU IRQ******************/
__attribute__((isr)) void PMU_IRQHandler(void)
{
 80126c8:	1460      	nie
 80126ca:	1462      	ipush
 80126cc:	142e      	subi      	r14, r14, 56
 80126ce:	d64e1c2d 	stm      	r18-r31, (r14)
 80126d2:	1428      	subi      	r14, r14, 32
 80126d4:	f4ee3400 	fstms      	fr0-fr7, (r14)
 80126d8:	14d0      	push      	r15
	HAL_PMU_IRQHandler(&hpmu);
 80126da:	1008      	lrw      	r0, 0x20006984	// 80126f8 <PMU_IRQHandler+0x30>
 80126dc:	e3ffff54 	bsr      	0x8012584	// 8012584 <HAL_PMU_IRQHandler>
}
 80126e0:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 80126e4:	1401      	addi      	r14, r14, 4
 80126e6:	f4ee3000 	fldms      	fr0-fr7, (r14)
 80126ea:	1408      	addi      	r14, r14, 32
 80126ec:	d24e1c2d 	ldm      	r18-r31, (r14)
 80126f0:	140e      	addi      	r14, r14, 56
 80126f2:	1463      	ipop
 80126f4:	1461      	nir
 80126f6:	0000      	.short	0x0000
 80126f8:	20006984 	.long	0x20006984

080126fc <WDG_IRQHandler>:
/*********************End**********************/

/********************WDG IRQ******************/
extern WDG_HandleTypeDef hwdg;
__attribute__((isr)) void WDG_IRQHandler(void)
{
 80126fc:	1460      	nie
 80126fe:	1462      	ipush
 8012700:	142e      	subi      	r14, r14, 56
 8012702:	d64e1c2d 	stm      	r18-r31, (r14)
 8012706:	1428      	subi      	r14, r14, 32
 8012708:	f4ee3400 	fstms      	fr0-fr7, (r14)
 801270c:	14d0      	push      	r15
	HAL_WDG_IRQHandler(&hwdg);
 801270e:	100b      	lrw      	r0, 0x200069e8	// 8012738 <WDG_IRQHandler+0x3c>
 8012710:	e3fffc76 	bsr      	0x8011ffc	// 8011ffc <HAL_WDG_IRQHandler>
	printf("HAL_WDG_IRQHandler\r\n");
 8012714:	100a      	lrw      	r0, 0x8015cc8	// 801273c <WDG_IRQHandler+0x40>
 8012716:	e3fff917 	bsr      	0x8011944	// 8011944 <__GI_puts>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 801271a:	c01f6023 	mfcr      	r3, cr<31, 0>

    chr.w = __get_CHR();
#ifdef __RESET_CONST
    chr.b.SRST_VAL = __RESET_CONST;
#else
    chr.b.SRST_VAL = 0xABCD;
 801271e:	ea025432 	movi      	r2, 21554
 8012722:	6c8a      	nor      	r2, r2
 8012724:	c4625df0 	ins      	r3, r2, 31, 16
  \details Acts as a special kind of Data Memory Barrier.
           It completes when all explicit memory accesses before this instruction complete.
 */
__ALWAYS_STATIC_INLINE void __DSB(void)
{
    __ASM volatile("sync"::: "memory");
 8012728:	c0000420 	sync
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 801272c:	c003643f 	mtcr      	r3, cr<31, 0>
    __ASM volatile("sync"::: "memory");
 8012730:	c0000420 	sync
    __ASM volatile("nop");
 8012734:	6c03      	mov      	r0, r0
 8012736:	07ff      	br      	0x8012734	// 8012734 <WDG_IRQHandler+0x38>
 8012738:	200069e8 	.long	0x200069e8
 801273c:	08015cc8 	.long	0x08015cc8

08012740 <My_Task_01>:
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_My_Task_01 */
void My_Task_01(void *sdata)
{
 8012740:	14d2      	push      	r4-r5, r15
  /* USER CODE BEGIN My_Task_01 */
  uint8_t uctask1 = 0;
 8012742:	3400      	movi      	r4, 0
  /* Infinite loop */
  for(;;)
  {
	uctask1 ++;
	printf("My_Task_01:%d\r\n",uctask1);
 8012744:	10a6      	lrw      	r5, 0x8015cdc	// 801275c <My_Task_01+0x1c>
	uctask1 ++;
 8012746:	2400      	addi      	r4, 1
 8012748:	7510      	zextb      	r4, r4
	printf("My_Task_01:%d\r\n",uctask1);
 801274a:	6c53      	mov      	r1, r4
 801274c:	6c17      	mov      	r0, r5
 801274e:	e0001a0f 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
	//APP_TASK(MY_RTC);
	//APP_TASK(MY_RTC_Alarm);
	tls_os_time_delay(1000);
 8012752:	30fa      	movi      	r0, 250
 8012754:	4002      	lsli      	r0, r0, 2
 8012756:	e3fffa9f 	bsr      	0x8011c94	// 8011c94 <tls_os_time_delay>
 801275a:	07f6      	br      	0x8012746	// 8012746 <My_Task_01+0x6>
 801275c:	08015cdc 	.long	0x08015cdc

08012760 <My_Task_02>:
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_My_Task_02 */
void My_Task_02(void *sdata)
{
 8012760:	14d2      	push      	r4-r5, r15
  /* USER CODE BEGIN My_Task_02 */
  uint8_t uctask2 = 0;
 8012762:	3400      	movi      	r4, 0
  /* Infinite loop */
  for(;;)
  {
	uctask2 ++;
	printf("My_Task_02:%d\r\n",uctask2);
 8012764:	10a6      	lrw      	r5, 0x8015cec	// 801277c <My_Task_02+0x1c>
	uctask2 ++;
 8012766:	2400      	addi      	r4, 1
 8012768:	7510      	zextb      	r4, r4
	printf("My_Task_02:%d\r\n",uctask2);
 801276a:	6c53      	mov      	r1, r4
 801276c:	6c17      	mov      	r0, r5
 801276e:	e00019ff 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
	tls_os_time_delay(2000);
 8012772:	30fa      	movi      	r0, 250
 8012774:	4003      	lsli      	r0, r0, 3
 8012776:	e3fffa8f 	bsr      	0x8011c94	// 8011c94 <tls_os_time_delay>
 801277a:	07f6      	br      	0x8012766	// 8012766 <My_Task_02+0x6>
 801277c:	08015cec 	.long	0x08015cec

08012780 <MX_FREERTOS_Init>:
{
 8012780:	14d3      	push      	r4-r6, r15
 8012782:	1424      	subi      	r14, r14, 16
	tls_os_init(NULL);
 8012784:	3000      	movi      	r0, 0
	tls_os_task_create(NULL, NULL,
 8012786:	3580      	movi      	r5, 128
	tls_os_init(NULL);
 8012788:	e3fffa8a 	bsr      	0x8011c9c	// 8011c9c <tls_os_init>
	tls_os_task_create(NULL, NULL,
 801278c:	3400      	movi      	r4, 0
 801278e:	3605      	movi      	r6, 5
 8012790:	45a3      	lsli      	r5, r5, 3
 8012792:	106d      	lrw      	r3, 0x20001374	// 80127c4 <MX_FREERTOS_Init+0x44>
 8012794:	6c53      	mov      	r1, r4
 8012796:	b860      	st.w      	r3, (r14, 0x0)
 8012798:	b883      	st.w      	r4, (r14, 0xc)
 801279a:	6cd3      	mov      	r3, r4
 801279c:	b8c2      	st.w      	r6, (r14, 0x8)
 801279e:	b8a1      	st.w      	r5, (r14, 0x4)
 80127a0:	6c13      	mov      	r0, r4
 80127a2:	104a      	lrw      	r2, 0x8012740	// 80127c8 <MX_FREERTOS_Init+0x48>
 80127a4:	e3fffa5a 	bsr      	0x8011c58	// 8011c58 <tls_os_task_create>
	tls_os_task_create(NULL, NULL,
 80127a8:	1069      	lrw      	r3, 0x20002374	// 80127cc <MX_FREERTOS_Init+0x4c>
 80127aa:	104a      	lrw      	r2, 0x8012760	// 80127d0 <MX_FREERTOS_Init+0x50>
 80127ac:	6c53      	mov      	r1, r4
 80127ae:	b860      	st.w      	r3, (r14, 0x0)
 80127b0:	b883      	st.w      	r4, (r14, 0xc)
 80127b2:	b8c2      	st.w      	r6, (r14, 0x8)
 80127b4:	b8a1      	st.w      	r5, (r14, 0x4)
 80127b6:	6cd3      	mov      	r3, r4
 80127b8:	6c13      	mov      	r0, r4
 80127ba:	e3fffa4f 	bsr      	0x8011c58	// 8011c58 <tls_os_task_create>
}
 80127be:	1404      	addi      	r14, r14, 16
 80127c0:	1493      	pop      	r4-r6, r15
 80127c2:	0000      	.short	0x0000
 80127c4:	20001374 	.long	0x20001374
 80127c8:	08012740 	.long	0x08012740
 80127cc:	20002374 	.long	0x20002374
 80127d0:	08012760 	.long	0x08012760

080127d4 <vApplicationIdleHook>:
/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
void vApplicationIdleHook( void )
{

}
 80127d4:	783c      	jmp      	r15
	...

080127d8 <pvPortMalloc>:
	pxFirstFreeBlock->pxNextFreeBlock = &xEnd;										\
}
/*-----------------------------------------------------------*/

void *pvPortMalloc( size_t xWantedSize )
{
 80127d8:	14d2      	push      	r4-r5, r15
 80127da:	6d03      	mov      	r4, r0
xBlockLink *pxBlock, *pxPreviousBlock, *pxNewBlockLink;
static portBASE_TYPE xHeapHasBeenInitialised = pdFALSE;
void *pvReturn = NULL;

	vTaskSuspendAll();
 80127dc:	e0000622 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
	{
		/* If this is the first call to malloc then the heap will require
		initialisation to setup the list of free blocks. */
		if( xHeapHasBeenInitialised == pdFALSE )
 80127e0:	ea8c002a 	lrw      	r12, 0x2000637c	// 8012888 <pvPortMalloc+0xb0>
 80127e4:	d80c2000 	ld.w      	r0, (r12, 0x0)
 80127e8:	e9200010 	bnez      	r0, 0x8012808	// 8012808 <pvPortMalloc+0x30>
		{
			prvHeapInit();
 80127ec:	1168      	lrw      	r3, 0x20006380	// 801288c <pvPortMalloc+0xb4>
 80127ee:	1149      	lrw      	r2, 0x2000337c	// 8012890 <pvPortMalloc+0xb8>
 80127f0:	1129      	lrw      	r1, 0x20003374	// 8012894 <pvPortMalloc+0xbc>
 80127f2:	b340      	st.w      	r2, (r3, 0x0)
 80127f4:	b301      	st.w      	r0, (r3, 0x4)
 80127f6:	33c0      	movi      	r3, 192
 80127f8:	4366      	lsli      	r3, r3, 6
 80127fa:	b161      	st.w      	r3, (r1, 0x4)
 80127fc:	b261      	st.w      	r3, (r2, 0x4)
			xHeapHasBeenInitialised = pdTRUE;
 80127fe:	3301      	movi      	r3, 1
			prvHeapInit();
 8012800:	b100      	st.w      	r0, (r1, 0x0)
 8012802:	b220      	st.w      	r1, (r2, 0x0)
			xHeapHasBeenInitialised = pdTRUE;
 8012804:	dc6c2000 	st.w      	r3, (r12, 0x0)
		}

		/* The wanted size is increased so it can contain a xBlockLink
		structure in addition to the requested amount of bytes. */
		if( xWantedSize > 0 )
 8012808:	e904000b 	bez      	r4, 0x801281e	// 801281e <pvPortMalloc+0x46>
		{
			xWantedSize += heapSTRUCT_SIZE;
 801280c:	240f      	addi      	r4, 16

			/* Ensure that blocks are always aligned to the required number of bytes. */
			if( xWantedSize & portBYTE_ALIGNMENT_MASK )
 801280e:	e4642007 	andi      	r3, r4, 7
 8012812:	e9030006 	bez      	r3, 0x801281e	// 801281e <pvPortMalloc+0x46>
			{
				/* Byte alignment required. */
				xWantedSize += ( portBYTE_ALIGNMENT - ( xWantedSize & portBYTE_ALIGNMENT_MASK ) );
 8012816:	3300      	movi      	r3, 0
 8012818:	2b07      	subi      	r3, 8
 801281a:	690c      	and      	r4, r3
 801281c:	2407      	addi      	r4, 8
			}
		}

		if( ( xWantedSize > 0 ) && ( xWantedSize < configTOTAL_HEAP_SIZE ) )
 801281e:	5c63      	subi      	r3, r4, 1
 8012820:	eb032ffe 	cmphsi      	r3, 12287
 8012824:	0809      	bt      	0x8012836	// 8012836 <pvPortMalloc+0x5e>
		{
			/* Blocks are stored in byte order - traverse the list from the start
			(smallest) block until one of adequate size is found. */
			pxPreviousBlock = &xStart;
			pxBlock = xStart.pxNextFreeBlock;
 8012826:	105a      	lrw      	r2, 0x20006380	// 801288c <pvPortMalloc+0xb4>
 8012828:	9260      	ld.w      	r3, (r2, 0x0)
			while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock ) )
 801282a:	9321      	ld.w      	r1, (r3, 0x4)
 801282c:	6504      	cmphs      	r1, r4
 801282e:	0c06      	bf      	0x801283a	// 801283a <pvPortMalloc+0x62>
				pxPreviousBlock = pxBlock;
				pxBlock = pxBlock->pxNextFreeBlock;
			}

			/* If we found the end marker then a block of adequate size was not found. */
			if( pxBlock != &xEnd )
 8012830:	1019      	lrw      	r0, 0x20003374	// 8012894 <pvPortMalloc+0xbc>
 8012832:	640e      	cmpne      	r3, r0
 8012834:	0809      	bt      	0x8012846	// 8012846 <pvPortMalloc+0x6e>
void *pvReturn = NULL;
 8012836:	3500      	movi      	r5, 0
 8012838:	0421      	br      	0x801287a	// 801287a <pvPortMalloc+0xa2>
			while( ( pxBlock->xBlockSize < xWantedSize ) && ( pxBlock->pxNextFreeBlock ) )
 801283a:	9300      	ld.w      	r0, (r3, 0x0)
 801283c:	e900fffa 	bez      	r0, 0x8012830	// 8012830 <pvPortMalloc+0x58>
 8012840:	6c8f      	mov      	r2, r3
 8012842:	6cc3      	mov      	r3, r0
 8012844:	07f3      	br      	0x801282a	// 801282a <pvPortMalloc+0x52>
				at its start. */
				pvReturn = ( void * ) ( ( ( unsigned char * ) pxPreviousBlock->pxNextFreeBlock ) + heapSTRUCT_SIZE );

				/* This block is being returned for use so must be taken our of the
				list of free blocks. */
				pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
 8012846:	9300      	ld.w      	r0, (r3, 0x0)
				pvReturn = ( void * ) ( ( ( unsigned char * ) pxPreviousBlock->pxNextFreeBlock ) + heapSTRUCT_SIZE );
 8012848:	92a0      	ld.w      	r5, (r2, 0x0)
				pxPreviousBlock->pxNextFreeBlock = pxBlock->pxNextFreeBlock;
 801284a:	b200      	st.w      	r0, (r2, 0x0)

				/* If the block is larger than required it can be split into two. */
				if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
 801284c:	5951      	subu      	r2, r1, r4
 801284e:	eb020020 	cmphsi      	r2, 33
				pvReturn = ( void * ) ( ( ( unsigned char * ) pxPreviousBlock->pxNextFreeBlock ) + heapSTRUCT_SIZE );
 8012852:	250f      	addi      	r5, 16
				if( ( pxBlock->xBlockSize - xWantedSize ) > heapMINIMUM_BLOCK_SIZE )
 8012854:	0c0e      	bf      	0x8012870	// 8012870 <pvPortMalloc+0x98>
				{
					/* This block is to be split into two.  Create a new block
					following the number of bytes requested. The void cast is
					used to prevent byte alignment warnings from the compiler. */
					pxNewBlockLink = ( void * ) ( ( ( unsigned char * ) pxBlock ) + xWantedSize );
 8012856:	5b30      	addu      	r1, r3, r4

					/* Calculate the sizes of two blocks split from the single
					block. */
					pxNewBlockLink->xBlockSize = pxBlock->xBlockSize - xWantedSize;
 8012858:	b141      	st.w      	r2, (r1, 0x4)
					pxBlock->xBlockSize = xWantedSize;
 801285a:	b381      	st.w      	r4, (r3, 0x4)

					/* Insert the new block into the list of free blocks. */
					prvInsertBlockIntoFreeList( ( pxNewBlockLink ) );
 801285c:	d9a12001 	ld.w      	r13, (r1, 0x4)
 8012860:	104b      	lrw      	r2, 0x20006380	// 801288c <pvPortMalloc+0xb4>
 8012862:	9200      	ld.w      	r0, (r2, 0x0)
 8012864:	d9802001 	ld.w      	r12, (r0, 0x4)
 8012868:	6770      	cmphs      	r12, r13
 801286a:	0c0c      	bf      	0x8012882	// 8012882 <pvPortMalloc+0xaa>
 801286c:	b100      	st.w      	r0, (r1, 0x0)
 801286e:	b220      	st.w      	r1, (r2, 0x0)
				}
				
				xFreeBytesRemaining -= pxBlock->xBlockSize;
 8012870:	102a      	lrw      	r1, 0x20000160	// 8012898 <pvPortMalloc+0xc0>
 8012872:	9361      	ld.w      	r3, (r3, 0x4)
 8012874:	9140      	ld.w      	r2, (r1, 0x0)
 8012876:	5a6d      	subu      	r3, r2, r3
 8012878:	b160      	st.w      	r3, (r1, 0x0)
			}
		}
	}
	xTaskResumeAll();
 801287a:	e0000669 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
		}
	}
	#endif

	return pvReturn;
}
 801287e:	6c17      	mov      	r0, r5
 8012880:	1492      	pop      	r4-r5, r15
 8012882:	6c83      	mov      	r2, r0
 8012884:	07ef      	br      	0x8012862	// 8012862 <pvPortMalloc+0x8a>
 8012886:	0000      	.short	0x0000
 8012888:	2000637c 	.long	0x2000637c
 801288c:	20006380 	.long	0x20006380
 8012890:	2000337c 	.long	0x2000337c
 8012894:	20003374 	.long	0x20003374
 8012898:	20000160 	.long	0x20000160

0801289c <vPortFree>:
/*-----------------------------------------------------------*/

void vPortFree( void *pv )
{
 801289c:	14d1      	push      	r4, r15
unsigned char *puc = ( unsigned char * ) pv;
xBlockLink *pxLink;

	if( pv )
 801289e:	e9000014 	bez      	r0, 0x80128c6	// 80128c6 <vPortFree+0x2a>
	{
		/* The memory being freed will have an xBlockLink structure immediately
		before it. */
		puc -= heapSTRUCT_SIZE;
 80128a2:	e480100f 	subi      	r4, r0, 16

		/* This casting is to keep the compiler from issuing warnings. */
		pxLink = ( void * ) puc;

		vTaskSuspendAll();
 80128a6:	e00005bd 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
		{
			/* Add this block to the list of free blocks. */
			prvInsertBlockIntoFreeList( ( ( xBlockLink * ) pxLink ) );
 80128aa:	9401      	ld.w      	r0, (r4, 0x4)
 80128ac:	1048      	lrw      	r2, 0x20006380	// 80128cc <vPortFree+0x30>
 80128ae:	9220      	ld.w      	r1, (r2, 0x0)
 80128b0:	9161      	ld.w      	r3, (r1, 0x4)
 80128b2:	640c      	cmphs      	r3, r0
 80128b4:	0c0a      	bf      	0x80128c8	// 80128c8 <vPortFree+0x2c>
 80128b6:	b420      	st.w      	r1, (r4, 0x0)
 80128b8:	b280      	st.w      	r4, (r2, 0x0)
			xFreeBytesRemaining += pxLink->xBlockSize;
 80128ba:	1046      	lrw      	r2, 0x20000160	// 80128d0 <vPortFree+0x34>
 80128bc:	9260      	ld.w      	r3, (r2, 0x0)
 80128be:	60c0      	addu      	r3, r0
 80128c0:	b260      	st.w      	r3, (r2, 0x0)
		}
		xTaskResumeAll();
 80128c2:	e0000645 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
	}
}
 80128c6:	1491      	pop      	r4, r15
 80128c8:	6c87      	mov      	r2, r1
 80128ca:	07f2      	br      	0x80128ae	// 80128ae <vPortFree+0x12>
 80128cc:	20006380 	.long	0x20006380
 80128d0:	20000160 	.long	0x20000160

080128d4 <xPortMemIsKernel>:
	/* This just exists to keep the linker quiet. */
}

int xPortMemIsKernel(void *mem)
{
    return ((mem >= (void *)xHeap.ucHeap) && (mem <= (void *)(xHeap.ucHeap + configTOTAL_HEAP_SIZE))) ? 1 : 0;
 80128d4:	1067      	lrw      	r3, 0x2000337c	// 80128f0 <xPortMemIsKernel+0x1c>
 80128d6:	64c0      	cmphs      	r0, r3
 80128d8:	0c09      	bf      	0x80128ea	// 80128ea <xPortMemIsKernel+0x16>
 80128da:	32c0      	movi      	r2, 192
 80128dc:	4246      	lsli      	r2, r2, 6
 80128de:	60c8      	addu      	r3, r2
 80128e0:	640c      	cmphs      	r3, r0
 80128e2:	c4000500 	mvc      	r0
 80128e6:	7400      	zextb      	r0, r0
}
 80128e8:	783c      	jmp      	r15
 80128ea:	3000      	movi      	r0, 0
 80128ec:	07fe      	br      	0x80128e8	// 80128e8 <xPortMemIsKernel+0x14>
 80128ee:	0000      	.short	0x0000
 80128f0:	2000337c 	.long	0x2000337c

080128f4 <vListInitialise>:
	as the only list entry. */
	pxList->pxIndex = ( xListItem * ) &( pxList->xListEnd );

	/* The list end value is the highest possible value in the list to
	ensure it remains at the end of the list. */
	pxList->xListEnd.xItemValue = portMAX_DELAY;
 80128f4:	3200      	movi      	r2, 0
	pxList->pxIndex = ( xListItem * ) &( pxList->xListEnd );
 80128f6:	587e      	addi      	r3, r0, 8
	pxList->xListEnd.xItemValue = portMAX_DELAY;
 80128f8:	2a00      	subi      	r2, 1
 80128fa:	b042      	st.w      	r2, (r0, 0x8)
	pxList->pxIndex = ( xListItem * ) &( pxList->xListEnd );
 80128fc:	b061      	st.w      	r3, (r0, 0x4)

	/* The list end next and previous pointers point to itself so we know
	when the list is empty. */
	pxList->xListEnd.pxNext = ( xListItem * ) &( pxList->xListEnd );
 80128fe:	b063      	st.w      	r3, (r0, 0xc)
	pxList->xListEnd.pxPrevious = ( xListItem * ) &( pxList->xListEnd );
 8012900:	b064      	st.w      	r3, (r0, 0x10)

	pxList->uxNumberOfItems = ( unsigned portBASE_TYPE ) 0U;
 8012902:	3300      	movi      	r3, 0
 8012904:	b060      	st.w      	r3, (r0, 0x0)
}
 8012906:	783c      	jmp      	r15

08012908 <vListInitialiseItem>:
/*-----------------------------------------------------------*/

void vListInitialiseItem( xListItem *pxItem )
{
	/* Make sure the list item is not recorded as being on a list. */
	pxItem->pvContainer = NULL;
 8012908:	3300      	movi      	r3, 0
 801290a:	b064      	st.w      	r3, (r0, 0x10)
}
 801290c:	783c      	jmp      	r15
	...

08012910 <vListInsertEnd>:

	/* Insert a new list item into pxList, but rather than sort the list,
	makes the new list item the last item to be removed by a call to
	pvListGetOwnerOfNextEntry.  This means it has to be the item pointed to by
	the pxIndex member. */
	pxIndex = pxList->pxIndex;
 8012910:	9061      	ld.w      	r3, (r0, 0x4)

	pxNewListItem->pxNext = pxIndex->pxNext;
 8012912:	9341      	ld.w      	r2, (r3, 0x4)
 8012914:	b141      	st.w      	r2, (r1, 0x4)
	pxNewListItem->pxPrevious = pxList->pxIndex;
	pxIndex->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
 8012916:	9341      	ld.w      	r2, (r3, 0x4)
	pxNewListItem->pxPrevious = pxList->pxIndex;
 8012918:	b162      	st.w      	r3, (r1, 0x8)
	pxIndex->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
 801291a:	b222      	st.w      	r1, (r2, 0x8)
	pxIndex->pxNext = ( volatile xListItem * ) pxNewListItem;
 801291c:	b321      	st.w      	r1, (r3, 0x4)
	pxList->pxIndex = ( volatile xListItem * ) pxNewListItem;

	/* Remember which list the item is in. */
	pxNewListItem->pvContainer = ( void * ) pxList;

	( pxList->uxNumberOfItems )++;
 801291e:	9060      	ld.w      	r3, (r0, 0x0)
 8012920:	2300      	addi      	r3, 1
	pxList->pxIndex = ( volatile xListItem * ) pxNewListItem;
 8012922:	b021      	st.w      	r1, (r0, 0x4)
	pxNewListItem->pvContainer = ( void * ) pxList;
 8012924:	b104      	st.w      	r0, (r1, 0x10)
	( pxList->uxNumberOfItems )++;
 8012926:	b060      	st.w      	r3, (r0, 0x0)
}
 8012928:	783c      	jmp      	r15
	...

0801292c <vListInsert>:
	are stored in ready lists (all of which have the same ulListItem value)
	get an equal share of the CPU.  However, if the xItemValue is the same as
	the back marker the iteration loop below will not end.  This means we need
	to guard against this by checking the value first and modifying the
	algorithm slightly if necessary. */
	if( xValueOfInsertion == portMAX_DELAY )
 801292c:	3300      	movi      	r3, 0
	xValueOfInsertion = pxNewListItem->xItemValue;
 801292e:	9140      	ld.w      	r2, (r1, 0x0)
	if( xValueOfInsertion == portMAX_DELAY )
 8012930:	2b00      	subi      	r3, 1
 8012932:	64ca      	cmpne      	r2, r3
 8012934:	080c      	bt      	0x801294c	// 801294c <vListInsert+0x20>
	{
		pxIterator = pxList->xListEnd.pxPrevious;
 8012936:	9064      	ld.w      	r3, (r0, 0x10)
			/* There is nothing to do here, we are just iterating to the
			wanted insertion position. */
		}
	}

	pxNewListItem->pxNext = pxIterator->pxNext;
 8012938:	9341      	ld.w      	r2, (r3, 0x4)
 801293a:	b141      	st.w      	r2, (r1, 0x4)
	pxNewListItem->pxNext->pxPrevious = ( volatile xListItem * ) pxNewListItem;
 801293c:	b222      	st.w      	r1, (r2, 0x8)
	pxNewListItem->pxPrevious = pxIterator;
 801293e:	b162      	st.w      	r3, (r1, 0x8)
	pxIterator->pxNext = ( volatile xListItem * ) pxNewListItem;
 8012940:	b321      	st.w      	r1, (r3, 0x4)

	/* Remember which list the item is in.  This allows fast removal of the
	item later. */
	pxNewListItem->pvContainer = ( void * ) pxList;

	( pxList->uxNumberOfItems )++;
 8012942:	9060      	ld.w      	r3, (r0, 0x0)
 8012944:	2300      	addi      	r3, 1
	pxNewListItem->pvContainer = ( void * ) pxList;
 8012946:	b104      	st.w      	r0, (r1, 0x10)
	( pxList->uxNumberOfItems )++;
 8012948:	b060      	st.w      	r3, (r0, 0x0)
}
 801294a:	783c      	jmp      	r15
		for( pxIterator = ( xListItem * ) &( pxList->xListEnd ); pxIterator->pxNext->xItemValue <= xValueOfInsertion; pxIterator = pxIterator->pxNext )
 801294c:	587e      	addi      	r3, r0, 8
 801294e:	d9832001 	ld.w      	r12, (r3, 0x4)
 8012952:	d98c2000 	ld.w      	r12, (r12, 0x0)
 8012956:	6708      	cmphs      	r2, r12
 8012958:	0ff0      	bf      	0x8012938	// 8012938 <vListInsert+0xc>
 801295a:	9361      	ld.w      	r3, (r3, 0x4)
 801295c:	07f9      	br      	0x801294e	// 801294e <vListInsert+0x22>
	...

08012960 <vListRemove>:

void vListRemove( xListItem *pxItemToRemove )
{
xList * pxList;

	pxItemToRemove->pxNext->pxPrevious = pxItemToRemove->pxPrevious;
 8012960:	9061      	ld.w      	r3, (r0, 0x4)
 8012962:	9042      	ld.w      	r2, (r0, 0x8)
 8012964:	b342      	st.w      	r2, (r3, 0x8)
	pxItemToRemove->pxPrevious->pxNext = pxItemToRemove->pxNext;
 8012966:	9042      	ld.w      	r2, (r0, 0x8)
 8012968:	b261      	st.w      	r3, (r2, 0x4)
	
	/* The list item knows which list it is in.  Obtain the list from the list
	item. */
	pxList = ( xList * ) pxItemToRemove->pvContainer;
 801296a:	9064      	ld.w      	r3, (r0, 0x10)

	/* Make sure the index is left pointing to a valid item. */
	if( pxList->pxIndex == pxItemToRemove )
 801296c:	9321      	ld.w      	r1, (r3, 0x4)
 801296e:	6442      	cmpne      	r0, r1
 8012970:	0802      	bt      	0x8012974	// 8012974 <vListRemove+0x14>
	{
		pxList->pxIndex = pxItemToRemove->pxPrevious;
 8012972:	b341      	st.w      	r2, (r3, 0x4)
	}

	pxItemToRemove->pvContainer = NULL;
 8012974:	3200      	movi      	r2, 0
 8012976:	b044      	st.w      	r2, (r0, 0x10)
	( pxList->uxNumberOfItems )--;
 8012978:	9340      	ld.w      	r2, (r3, 0x0)
 801297a:	2a00      	subi      	r2, 1
 801297c:	b340      	st.w      	r2, (r3, 0x0)
}
 801297e:	783c      	jmp      	r15

08012980 <prvCopyDataToQueue>:
}

/*-----------------------------------------------------------*/

static void prvCopyDataToQueue( xQUEUE *pxQueue, const void *pvItemToQueue, portBASE_TYPE xPosition )
{
 8012980:	14d2      	push      	r4-r5, r15
 8012982:	6ccb      	mov      	r3, r2
	if( pxQueue->uxItemSize == ( unsigned portBASE_TYPE ) 0 )
 8012984:	9050      	ld.w      	r2, (r0, 0x40)
{
 8012986:	6d03      	mov      	r4, r0
	if( pxQueue->uxItemSize == ( unsigned portBASE_TYPE ) 0 )
 8012988:	e922000d 	bnez      	r2, 0x80129a2	// 80129a2 <prvCopyDataToQueue+0x22>
	{
		#if ( configUSE_MUTEXES == 1 )
		{
			if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
 801298c:	90a0      	ld.w      	r5, (r0, 0x0)
 801298e:	e9250006 	bnez      	r5, 0x801299a	// 801299a <prvCopyDataToQueue+0x1a>
			{
				/* The mutex is no longer being held. */
				vTaskPriorityDisinherit( ( void * ) pxQueue->pxMutexHolder );
 8012992:	9001      	ld.w      	r0, (r0, 0x4)
 8012994:	e00008a2 	bsr      	0x8013ad8	// 8013ad8 <vTaskPriorityDisinherit>
				pxQueue->pxMutexHolder = NULL;
 8012998:	b4a1      	st.w      	r5, (r4, 0x4)
		{
			pxQueue->pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
		}
	}

	++( pxQueue->uxMessagesWaiting );
 801299a:	946e      	ld.w      	r3, (r4, 0x38)
 801299c:	2300      	addi      	r3, 1
 801299e:	b46e      	st.w      	r3, (r4, 0x38)
}
 80129a0:	1492      	pop      	r4-r5, r15
	else if( xPosition == queueSEND_TO_BACK )
 80129a2:	e923000f 	bnez      	r3, 0x80129c0	// 80129c0 <prvCopyDataToQueue+0x40>
		memcpy( ( void * ) pxQueue->pcWriteTo, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
 80129a6:	9002      	ld.w      	r0, (r0, 0x8)
 80129a8:	e3fff850 	bsr      	0x8011a48	// 8011a48 <__memcpy_fast>
		pxQueue->pcWriteTo += pxQueue->uxItemSize;
 80129ac:	9462      	ld.w      	r3, (r4, 0x8)
 80129ae:	9450      	ld.w      	r2, (r4, 0x40)
 80129b0:	60c8      	addu      	r3, r2
		if( pxQueue->pcWriteTo >= pxQueue->pcTail )
 80129b2:	9441      	ld.w      	r2, (r4, 0x4)
 80129b4:	648c      	cmphs      	r3, r2
		pxQueue->pcWriteTo += pxQueue->uxItemSize;
 80129b6:	b462      	st.w      	r3, (r4, 0x8)
		if( pxQueue->pcWriteTo >= pxQueue->pcTail )
 80129b8:	0ff1      	bf      	0x801299a	// 801299a <prvCopyDataToQueue+0x1a>
			pxQueue->pcWriteTo = pxQueue->pcHead;
 80129ba:	9460      	ld.w      	r3, (r4, 0x0)
 80129bc:	b462      	st.w      	r3, (r4, 0x8)
 80129be:	07ee      	br      	0x801299a	// 801299a <prvCopyDataToQueue+0x1a>
		memcpy( ( void * ) pxQueue->pcReadFrom, pvItemToQueue, ( unsigned ) pxQueue->uxItemSize );
 80129c0:	9003      	ld.w      	r0, (r0, 0xc)
 80129c2:	e3fff843 	bsr      	0x8011a48	// 8011a48 <__memcpy_fast>
		pxQueue->pcReadFrom -= pxQueue->uxItemSize;
 80129c6:	9450      	ld.w      	r2, (r4, 0x40)
 80129c8:	3300      	movi      	r3, 0
 80129ca:	60ca      	subu      	r3, r2
 80129cc:	9443      	ld.w      	r2, (r4, 0xc)
 80129ce:	608c      	addu      	r2, r3
		if( pxQueue->pcReadFrom < pxQueue->pcHead )
 80129d0:	9420      	ld.w      	r1, (r4, 0x0)
 80129d2:	6448      	cmphs      	r2, r1
		pxQueue->pcReadFrom -= pxQueue->uxItemSize;
 80129d4:	b443      	st.w      	r2, (r4, 0xc)
		if( pxQueue->pcReadFrom < pxQueue->pcHead )
 80129d6:	0be2      	bt      	0x801299a	// 801299a <prvCopyDataToQueue+0x1a>
			pxQueue->pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
 80129d8:	9441      	ld.w      	r2, (r4, 0x4)
 80129da:	60c8      	addu      	r3, r2
 80129dc:	b463      	st.w      	r3, (r4, 0xc)
 80129de:	07de      	br      	0x801299a	// 801299a <prvCopyDataToQueue+0x1a>

080129e0 <prvCopyDataFromQueue>:
/*-----------------------------------------------------------*/

static void prvCopyDataFromQueue( xQUEUE * const pxQueue, const void *pvBuffer )
{
 80129e0:	14d0      	push      	r15
 80129e2:	6cc3      	mov      	r3, r0
 80129e4:	6c07      	mov      	r0, r1
	if( pxQueue->uxQueueType != queueQUEUE_IS_MUTEX )
 80129e6:	d9832000 	ld.w      	r12, (r3, 0x0)
 80129ea:	e90c000f 	bez      	r12, 0x8012a08	// 8012a08 <prvCopyDataFromQueue+0x28>
	{
		pxQueue->pcReadFrom += pxQueue->uxItemSize;
 80129ee:	9323      	ld.w      	r1, (r3, 0xc)
 80129f0:	9350      	ld.w      	r2, (r3, 0x40)
 80129f2:	6048      	addu      	r1, r2
		if( pxQueue->pcReadFrom >= pxQueue->pcTail )
 80129f4:	d9a32001 	ld.w      	r13, (r3, 0x4)
 80129f8:	6744      	cmphs      	r1, r13
		pxQueue->pcReadFrom += pxQueue->uxItemSize;
 80129fa:	b323      	st.w      	r1, (r3, 0xc)
		if( pxQueue->pcReadFrom >= pxQueue->pcTail )
 80129fc:	0c03      	bf      	0x8012a02	// 8012a02 <prvCopyDataFromQueue+0x22>
		{
			pxQueue->pcReadFrom = pxQueue->pcHead;
 80129fe:	dd832003 	st.w      	r12, (r3, 0xc)
		}
		memcpy( ( void * ) pvBuffer, ( void * ) pxQueue->pcReadFrom, ( unsigned ) pxQueue->uxItemSize );
 8012a02:	9323      	ld.w      	r1, (r3, 0xc)
 8012a04:	e3fff822 	bsr      	0x8011a48	// 8011a48 <__memcpy_fast>
	}
}
 8012a08:	1490      	pop      	r15
	...

08012a0c <prvUnlockQueue>:
/*-----------------------------------------------------------*/

static void prvUnlockQueue( xQueueHandle pxQueue )
{
 8012a0c:	14d2      	push      	r4-r5, r15
 8012a0e:	6d03      	mov      	r4, r0
			blocked waiting for data to become available? */
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
			{
				/* Tasks that are removed from the event list will get added to
				the pending ready list as the scheduler is still suspended. */
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
 8012a10:	e4a40023 	addi      	r5, r4, 36
	taskENTER_CRITICAL();
 8012a14:	e0000db8 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		while( pxQueue->xTxLock > queueLOCKED_UNMODIFIED )
 8012a18:	9472      	ld.w      	r3, (r4, 0x48)
 8012a1a:	e9430014 	bhz      	r3, 0x8012a42	// 8012a42 <prvUnlockQueue+0x36>
			{
				break;
			}
		}

		pxQueue->xTxLock = queueUNLOCKED;
 8012a1e:	3300      	movi      	r3, 0
 8012a20:	2b00      	subi      	r3, 1
 8012a22:	b472      	st.w      	r3, (r4, 0x48)
	}
	taskEXIT_CRITICAL();
 8012a24:	e0000dba 	bsr      	0x8014598	// 8014598 <vPortExitCritical>

	/* Do the same for the Rx lock. */
	taskENTER_CRITICAL();
 8012a28:	e0000dae 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
	{
		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
		{
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
			{
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
 8012a2c:	e4a4000f 	addi      	r5, r4, 16
		while( pxQueue->xRxLock > queueLOCKED_UNMODIFIED )
 8012a30:	9471      	ld.w      	r3, (r4, 0x44)
 8012a32:	e9430016 	bhz      	r3, 0x8012a5e	// 8012a5e <prvUnlockQueue+0x52>
			{
				break;
			}
		}

		pxQueue->xRxLock = queueUNLOCKED;
 8012a36:	3300      	movi      	r3, 0
 8012a38:	2b00      	subi      	r3, 1
 8012a3a:	b471      	st.w      	r3, (r4, 0x44)
	}
	taskEXIT_CRITICAL();
 8012a3c:	e0000dae 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
}
 8012a40:	1492      	pop      	r4-r5, r15
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
 8012a42:	9469      	ld.w      	r3, (r4, 0x24)
 8012a44:	e903ffed 	bez      	r3, 0x8012a1e	// 8012a1e <prvUnlockQueue+0x12>
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
 8012a48:	6c17      	mov      	r0, r5
 8012a4a:	e000074b 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012a4e:	e9000004 	bez      	r0, 0x8012a56	// 8012a56 <prvUnlockQueue+0x4a>
					vTaskMissedYield();
 8012a52:	e00007e5 	bsr      	0x8013a1c	// 8013a1c <vTaskMissedYield>
				--( pxQueue->xTxLock );
 8012a56:	9472      	ld.w      	r3, (r4, 0x48)
 8012a58:	2b00      	subi      	r3, 1
 8012a5a:	b472      	st.w      	r3, (r4, 0x48)
 8012a5c:	07de      	br      	0x8012a18	// 8012a18 <prvUnlockQueue+0xc>
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
 8012a5e:	9464      	ld.w      	r3, (r4, 0x10)
 8012a60:	e903ffeb 	bez      	r3, 0x8012a36	// 8012a36 <prvUnlockQueue+0x2a>
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
 8012a64:	6c17      	mov      	r0, r5
 8012a66:	e000073d 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012a6a:	e9000004 	bez      	r0, 0x8012a72	// 8012a72 <prvUnlockQueue+0x66>
					vTaskMissedYield();
 8012a6e:	e00007d7 	bsr      	0x8013a1c	// 8013a1c <vTaskMissedYield>
				--( pxQueue->xRxLock );
 8012a72:	9471      	ld.w      	r3, (r4, 0x44)
 8012a74:	2b00      	subi      	r3, 1
 8012a76:	b471      	st.w      	r3, (r4, 0x44)
 8012a78:	07dc      	br      	0x8012a30	// 8012a30 <prvUnlockQueue+0x24>
	...

08012a7c <xQueueCreate>:
{
 8012a7c:	14d4      	push      	r4-r7, r15
 8012a7e:	6dc3      	mov      	r7, r0
 8012a80:	6d87      	mov      	r6, r1
	if( uxQueueLength > ( unsigned portBASE_TYPE ) 0 )
 8012a82:	e9000013 	bez      	r0, 0x8012aa8	// 8012aa8 <xQueueCreate+0x2c>
		pxNewQueue = ( xQUEUE * ) pvPortMalloc( sizeof( xQUEUE ) );
 8012a86:	304c      	movi      	r0, 76
 8012a88:	e3fffea8 	bsr      	0x80127d8	// 80127d8 <pvPortMalloc>
 8012a8c:	6d03      	mov      	r4, r0
		if( pxNewQueue != NULL )
 8012a8e:	e900000d 	bez      	r0, 0x8012aa8	// 8012aa8 <xQueueCreate+0x2c>
			xQueueSizeInBytes = ( size_t ) ( uxQueueLength * uxItemSize ) + ( size_t ) 1;
 8012a92:	c4c78425 	mult      	r5, r7, r6
			pxNewQueue->pcHead = ( signed char * ) pvPortMalloc( xQueueSizeInBytes );
 8012a96:	5d02      	addi      	r0, r5, 1
 8012a98:	e3fffea0 	bsr      	0x80127d8	// 80127d8 <pvPortMalloc>
 8012a9c:	b400      	st.w      	r0, (r4, 0x0)
			if( pxNewQueue->pcHead != NULL )
 8012a9e:	e920000c 	bnez      	r0, 0x8012ab6	// 8012ab6 <xQueueCreate+0x3a>
				vPortFree( pxNewQueue );
 8012aa2:	6c13      	mov      	r0, r4
 8012aa4:	e3fffefc 	bsr      	0x801289c	// 801289c <vPortFree>
	configASSERT( xReturn );
 8012aa8:	ea02012b 	movi      	r2, 299
 8012aac:	102e      	lrw      	r1, 0x8015cfc	// 8012ae4 <xQueueCreate+0x68>
 8012aae:	100f      	lrw      	r0, 0x8015d25	// 8012ae8 <xQueueCreate+0x6c>
 8012ab0:	e000185e 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012ab4:	0400      	br      	0x8012ab4	// 8012ab4 <xQueueCreate+0x38>
				pxNewQueue->pcTail = pxNewQueue->pcHead + ( uxQueueLength * uxItemSize );
 8012ab6:	5874      	addu      	r3, r0, r5
 8012ab8:	b461      	st.w      	r3, (r4, 0x4)
				pxNewQueue->pcReadFrom = pxNewQueue->pcHead + ( ( uxQueueLength - ( unsigned portBASE_TYPE ) 1U ) * uxItemSize );
 8012aba:	615a      	subu      	r5, r6
				pxNewQueue->uxMessagesWaiting = ( unsigned portBASE_TYPE ) 0U;
 8012abc:	3300      	movi      	r3, 0
 8012abe:	b46e      	st.w      	r3, (r4, 0x38)
				pxNewQueue->pcWriteTo = pxNewQueue->pcHead;
 8012ac0:	b402      	st.w      	r0, (r4, 0x8)
				pxNewQueue->xRxLock = queueUNLOCKED;
 8012ac2:	2b00      	subi      	r3, 1
				pxNewQueue->pcReadFrom = pxNewQueue->pcHead + ( ( uxQueueLength - ( unsigned portBASE_TYPE ) 1U ) * uxItemSize );
 8012ac4:	6014      	addu      	r0, r5
 8012ac6:	b403      	st.w      	r0, (r4, 0xc)
				pxNewQueue->xRxLock = queueUNLOCKED;
 8012ac8:	b471      	st.w      	r3, (r4, 0x44)
				pxNewQueue->xTxLock = queueUNLOCKED;
 8012aca:	b472      	st.w      	r3, (r4, 0x48)
				vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
 8012acc:	e404000f 	addi      	r0, r4, 16
				pxNewQueue->uxLength = uxQueueLength;
 8012ad0:	b4ef      	st.w      	r7, (r4, 0x3c)
				pxNewQueue->uxItemSize = uxItemSize;
 8012ad2:	b4d0      	st.w      	r6, (r4, 0x40)
				vListInitialise( &( pxNewQueue->xTasksWaitingToSend ) );
 8012ad4:	e3ffff10 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
				vListInitialise( &( pxNewQueue->xTasksWaitingToReceive ) );
 8012ad8:	e4040023 	addi      	r0, r4, 36
 8012adc:	e3ffff0c 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
}
 8012ae0:	6c13      	mov      	r0, r4
 8012ae2:	1494      	pop      	r4-r7, r15
 8012ae4:	08015cfc 	.long	0x08015cfc
 8012ae8:	08015d25 	.long	0x08015d25

08012aec <xQueueGenericSend>:
{
 8012aec:	ebe00038 	push      	r4-r11, r15, r16
 8012af0:	1423      	subi      	r14, r14, 12
 8012af2:	6d03      	mov      	r4, r0
 8012af4:	6dc7      	mov      	r7, r1
 8012af6:	b840      	st.w      	r2, (r14, 0x0)
 8012af8:	6e8f      	mov      	r10, r3
	configASSERT( pxQueue );
 8012afa:	e9200009 	bnez      	r0, 0x8012b0c	// 8012b0c <xQueueGenericSend+0x20>
 8012afe:	3288      	movi      	r2, 136
 8012b00:	4242      	lsli      	r2, r2, 2
 8012b02:	1223      	lrw      	r1, 0x8015cfc	// 8012c0c <xQueueGenericSend+0x120>
 8012b04:	1203      	lrw      	r0, 0x8015d25	// 8012c10 <xQueueGenericSend+0x124>
 8012b06:	e0001833 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012b0a:	0400      	br      	0x8012b0a	// 8012b0a <xQueueGenericSend+0x1e>
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( unsigned portBASE_TYPE ) 0U ) ) );
 8012b0c:	e9210005 	bnez      	r1, 0x8012b16	// 8012b16 <xQueueGenericSend+0x2a>
 8012b10:	9070      	ld.w      	r3, (r0, 0x40)
 8012b12:	e9230075 	bnez      	r3, 0x8012bfc	// 8012bfc <xQueueGenericSend+0x110>
		prvLockQueue( pxQueue );
 8012b16:	3600      	movi      	r6, 0
 8012b18:	2e00      	subi      	r6, 1
 8012b1a:	ea080000 	movi      	r8, 0
 8012b1e:	6edb      	mov      	r11, r6
 8012b20:	ea090000 	movi      	r9, 0
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
 8012b24:	e604000f 	addi      	r16, r4, 16
		taskENTER_CRITICAL();
 8012b28:	e0000d2e 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
			if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
 8012b2c:	944e      	ld.w      	r2, (r4, 0x38)
 8012b2e:	946f      	ld.w      	r3, (r4, 0x3c)
 8012b30:	64c8      	cmphs      	r2, r3
 8012b32:	0819      	bt      	0x8012b64	// 8012b64 <xQueueGenericSend+0x78>
				prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
 8012b34:	6cab      	mov      	r2, r10
 8012b36:	6c5f      	mov      	r1, r7
 8012b38:	6c13      	mov      	r0, r4
 8012b3a:	e3ffff23 	bsr      	0x8012980	// 8012980 <prvCopyDataToQueue>
				if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
 8012b3e:	9469      	ld.w      	r3, (r4, 0x24)
 8012b40:	e903000c 	bez      	r3, 0x8012b58	// 8012b58 <xQueueGenericSend+0x6c>
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) == pdTRUE )
 8012b44:	e4040023 	addi      	r0, r4, 36
 8012b48:	e00006cc 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012b4c:	3841      	cmpnei      	r0, 1
 8012b4e:	0805      	bt      	0x8012b58	// 8012b58 <xQueueGenericSend+0x6c>
						portYIELD_WITHIN_API();
 8012b50:	e3ffecd8 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8012b54:	6c03      	mov      	r0, r0
 8012b56:	6c03      	mov      	r0, r0
				taskEXIT_CRITICAL();
 8012b58:	e0000d20 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
				return pdPASS;
 8012b5c:	3001      	movi      	r0, 1
}
 8012b5e:	1403      	addi      	r14, r14, 12
 8012b60:	ebc00038 	pop      	r4-r11, r15, r16
				if( xTicksToWait == ( portTickType ) 0 )
 8012b64:	98a0      	ld.w      	r5, (r14, 0x0)
 8012b66:	e9250006 	bnez      	r5, 0x8012b72	// 8012b72 <xQueueGenericSend+0x86>
					taskEXIT_CRITICAL();
 8012b6a:	e0000d17 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
			return errQUEUE_FULL;
 8012b6e:	3000      	movi      	r0, 0
 8012b70:	07f7      	br      	0x8012b5e	// 8012b5e <xQueueGenericSend+0x72>
				else if( xEntryTimeSet == pdFALSE )
 8012b72:	e9280005 	bnez      	r8, 0x8012b7c	// 8012b7c <xQueueGenericSend+0x90>
					vTaskSetTimeOutState( &xTimeOut );
 8012b76:	1801      	addi      	r0, r14, 4
 8012b78:	e00006f4 	bsr      	0x8013960	// 8013960 <vTaskSetTimeOutState>
		taskEXIT_CRITICAL();
 8012b7c:	e0000d0e 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		vTaskSuspendAll();
 8012b80:	e0000450 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
		prvLockQueue( pxQueue );
 8012b84:	e0000d00 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
 8012b88:	9471      	ld.w      	r3, (r4, 0x44)
 8012b8a:	658e      	cmpne      	r3, r6
 8012b8c:	0803      	bt      	0x8012b92	// 8012b92 <xQueueGenericSend+0xa6>
 8012b8e:	dd242011 	st.w      	r9, (r4, 0x44)
 8012b92:	9472      	ld.w      	r3, (r4, 0x48)
 8012b94:	66ce      	cmpne      	r3, r11
 8012b96:	0803      	bt      	0x8012b9c	// 8012b9c <xQueueGenericSend+0xb0>
 8012b98:	dd242012 	st.w      	r9, (r4, 0x48)
 8012b9c:	e0000cfe 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
 8012ba0:	6c7b      	mov      	r1, r14
 8012ba2:	1801      	addi      	r0, r14, 4
 8012ba4:	e00006f8 	bsr      	0x8013994	// 8013994 <xTaskCheckForTimeOut>
 8012ba8:	e9200024 	bnez      	r0, 0x8012bf0	// 8012bf0 <xQueueGenericSend+0x104>

static signed portBASE_TYPE prvIsQueueFull( const xQueueHandle pxQueue )
{
signed portBASE_TYPE xReturn;

	taskENTER_CRITICAL();
 8012bac:	e0000cec 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		xReturn = ( pxQueue->uxMessagesWaiting == pxQueue->uxLength );
 8012bb0:	d904200e 	ld.w      	r8, (r4, 0x38)
 8012bb4:	94af      	ld.w      	r5, (r4, 0x3c)
	taskEXIT_CRITICAL();
 8012bb6:	e0000cf1 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
			if( prvIsQueueFull( pxQueue ) != pdFALSE )
 8012bba:	6562      	cmpne      	r8, r5
 8012bbc:	0814      	bt      	0x8012be4	// 8012be4 <xQueueGenericSend+0xf8>
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
 8012bbe:	9820      	ld.w      	r1, (r14, 0x0)
 8012bc0:	c4104820 	lsli      	r0, r16, 0
 8012bc4:	e000063e 	bsr      	0x8013840	// 8013840 <vTaskPlaceOnEventList>
				prvUnlockQueue( pxQueue );
 8012bc8:	6c13      	mov      	r0, r4
 8012bca:	e3ffff21 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
				if( xTaskResumeAll() == pdFALSE )
 8012bce:	e00004bf 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012bd2:	e9200006 	bnez      	r0, 0x8012bde	// 8012bde <xQueueGenericSend+0xf2>
					portYIELD_WITHIN_API();
 8012bd6:	e3ffec95 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8012bda:	6c03      	mov      	r0, r0
 8012bdc:	6c03      	mov      	r0, r0
 8012bde:	ea080001 	movi      	r8, 1
 8012be2:	07a3      	br      	0x8012b28	// 8012b28 <xQueueGenericSend+0x3c>
				prvUnlockQueue( pxQueue );
 8012be4:	6c13      	mov      	r0, r4
 8012be6:	e3ffff13 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
				( void ) xTaskResumeAll();
 8012bea:	e00004b1 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012bee:	07f8      	br      	0x8012bde	// 8012bde <xQueueGenericSend+0xf2>
			prvUnlockQueue( pxQueue );
 8012bf0:	6c13      	mov      	r0, r4
 8012bf2:	e3ffff0d 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
			( void ) xTaskResumeAll();
 8012bf6:	e00004ab 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012bfa:	07ba      	br      	0x8012b6e	// 8012b6e <xQueueGenericSend+0x82>
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( unsigned portBASE_TYPE ) 0U ) ) );
 8012bfc:	ea020221 	movi      	r2, 545
 8012c00:	1023      	lrw      	r1, 0x8015cfc	// 8012c0c <xQueueGenericSend+0x120>
 8012c02:	1004      	lrw      	r0, 0x8015d25	// 8012c10 <xQueueGenericSend+0x124>
 8012c04:	e00017b4 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012c08:	0400      	br      	0x8012c08	// 8012c08 <xQueueGenericSend+0x11c>
 8012c0a:	0000      	.short	0x0000
 8012c0c:	08015cfc 	.long	0x08015cfc
 8012c10:	08015d25 	.long	0x08015d25

08012c14 <xQueueGenericSendFromISR>:
{
 8012c14:	14d3      	push      	r4-r6, r15
 8012c16:	6d03      	mov      	r4, r0
 8012c18:	6d4b      	mov      	r5, r2
	configASSERT( pxQueue );
 8012c1a:	e9200009 	bnez      	r0, 0x8012c2c	// 8012c2c <xQueueGenericSendFromISR+0x18>
 8012c1e:	ea020365 	movi      	r2, 869
 8012c22:	1121      	lrw      	r1, 0x8015cfc	// 8012ca4 <xQueueGenericSendFromISR+0x90>
 8012c24:	1101      	lrw      	r0, 0x8015d25	// 8012ca8 <xQueueGenericSendFromISR+0x94>
 8012c26:	e00017a3 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012c2a:	0400      	br      	0x8012c2a	// 8012c2a <xQueueGenericSendFromISR+0x16>
	configASSERT( pxHigherPriorityTaskWoken );
 8012c2c:	e9220009 	bnez      	r2, 0x8012c3e	// 8012c3e <xQueueGenericSendFromISR+0x2a>
 8012c30:	ea020366 	movi      	r2, 870
 8012c34:	103c      	lrw      	r1, 0x8015cfc	// 8012ca4 <xQueueGenericSendFromISR+0x90>
 8012c36:	101d      	lrw      	r0, 0x8015d25	// 8012ca8 <xQueueGenericSendFromISR+0x94>
 8012c38:	e000179a 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012c3c:	0400      	br      	0x8012c3c	// 8012c3c <xQueueGenericSendFromISR+0x28>
	configASSERT( !( ( pvItemToQueue == NULL ) && ( pxQueue->uxItemSize != ( unsigned portBASE_TYPE ) 0U ) ) );
 8012c3e:	e9210028 	bnez      	r1, 0x8012c8e	// 8012c8e <xQueueGenericSendFromISR+0x7a>
 8012c42:	9050      	ld.w      	r2, (r0, 0x40)
 8012c44:	e9020025 	bez      	r2, 0x8012c8e	// 8012c8e <xQueueGenericSendFromISR+0x7a>
 8012c48:	ea020367 	movi      	r2, 871
 8012c4c:	1036      	lrw      	r1, 0x8015cfc	// 8012ca4 <xQueueGenericSendFromISR+0x90>
 8012c4e:	1017      	lrw      	r0, 0x8015d25	// 8012ca8 <xQueueGenericSendFromISR+0x94>
 8012c50:	e000178e 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012c54:	0400      	br      	0x8012c54	// 8012c54 <xQueueGenericSendFromISR+0x40>
			prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
 8012c56:	6c8f      	mov      	r2, r3
 8012c58:	6c13      	mov      	r0, r4
 8012c5a:	e3fffe93 	bsr      	0x8012980	// 8012980 <prvCopyDataToQueue>
			if( pxQueue->xTxLock == queueUNLOCKED )
 8012c5e:	3200      	movi      	r2, 0
 8012c60:	9472      	ld.w      	r3, (r4, 0x48)
 8012c62:	2a00      	subi      	r2, 1
 8012c64:	648e      	cmpne      	r3, r2
 8012c66:	0811      	bt      	0x8012c88	// 8012c88 <xQueueGenericSendFromISR+0x74>
				if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
 8012c68:	9469      	ld.w      	r3, (r4, 0x24)
 8012c6a:	e9230004 	bnez      	r3, 0x8012c72	// 8012c72 <xQueueGenericSendFromISR+0x5e>
			xReturn = pdPASS;
 8012c6e:	3001      	movi      	r0, 1
 8012c70:	0409      	br      	0x8012c82	// 8012c82 <xQueueGenericSendFromISR+0x6e>
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
 8012c72:	e4040023 	addi      	r0, r4, 36
 8012c76:	e0000635 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012c7a:	e900fffa 	bez      	r0, 0x8012c6e	// 8012c6e <xQueueGenericSendFromISR+0x5a>
						*pxHigherPriorityTaskWoken = pdTRUE;
 8012c7e:	3001      	movi      	r0, 1
 8012c80:	b500      	st.w      	r0, (r5, 0x0)
    return flags;
}

static inline void RestoreLocalPSR (portLONG newMask)
{
    __asm__ __volatile__(
 8012c82:	c0066420 	mtcr      	r6, cr<0, 0>
}
 8012c86:	1493      	pop      	r4-r6, r15
				++( pxQueue->xTxLock );
 8012c88:	2300      	addi      	r3, 1
 8012c8a:	b472      	st.w      	r3, (r4, 0x48)
 8012c8c:	07f1      	br      	0x8012c6e	// 8012c6e <xQueueGenericSendFromISR+0x5a>
    __ASM volatile("mfcr %0, psr" : "=r"(result));
 8012c8e:	c0006026 	mfcr      	r6, cr<0, 0>
    __ASM volatile("psrclr ie");
 8012c92:	c0807020 	psrclr      	ie
		if( pxQueue->uxMessagesWaiting < pxQueue->uxLength )
 8012c96:	d984200e 	ld.w      	r12, (r4, 0x38)
 8012c9a:	940f      	ld.w      	r0, (r4, 0x3c)
 8012c9c:	6430      	cmphs      	r12, r0
 8012c9e:	0fdc      	bf      	0x8012c56	// 8012c56 <xQueueGenericSendFromISR+0x42>
			xReturn = errQUEUE_FULL;
 8012ca0:	3000      	movi      	r0, 0
 8012ca2:	07f0      	br      	0x8012c82	// 8012c82 <xQueueGenericSendFromISR+0x6e>
 8012ca4:	08015cfc 	.long	0x08015cfc
 8012ca8:	08015d25 	.long	0x08015d25

08012cac <xQueueGenericReceive>:
{
 8012cac:	ebe00038 	push      	r4-r11, r15, r16
 8012cb0:	1423      	subi      	r14, r14, 12
 8012cb2:	6d03      	mov      	r4, r0
 8012cb4:	6dc7      	mov      	r7, r1
 8012cb6:	b840      	st.w      	r2, (r14, 0x0)
 8012cb8:	6e8f      	mov      	r10, r3
	configASSERT( pxQueue );
 8012cba:	e9200009 	bnez      	r0, 0x8012ccc	// 8012ccc <xQueueGenericReceive+0x20>
 8012cbe:	ea02039f 	movi      	r2, 927
 8012cc2:	1231      	lrw      	r1, 0x8015cfc	// 8012e04 <xQueueGenericReceive+0x158>
 8012cc4:	1211      	lrw      	r0, 0x8015d25	// 8012e08 <xQueueGenericReceive+0x15c>
 8012cc6:	e0001753 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012cca:	0400      	br      	0x8012cca	// 8012cca <xQueueGenericReceive+0x1e>
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( unsigned portBASE_TYPE ) 0U ) ) );
 8012ccc:	e9210005 	bnez      	r1, 0x8012cd6	// 8012cd6 <xQueueGenericReceive+0x2a>
 8012cd0:	9070      	ld.w      	r3, (r0, 0x40)
 8012cd2:	e9230092 	bnez      	r3, 0x8012df6	// 8012df6 <xQueueGenericReceive+0x14a>
		prvLockQueue( pxQueue );
 8012cd6:	3600      	movi      	r6, 0
 8012cd8:	2e00      	subi      	r6, 1
 8012cda:	ea080000 	movi      	r8, 0
 8012cde:	6edb      	mov      	r11, r6
 8012ce0:	ea090000 	movi      	r9, 0
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
 8012ce4:	e6040023 	addi      	r16, r4, 36
		taskENTER_CRITICAL();
 8012ce8:	e0000c4e 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
			if( pxQueue->uxMessagesWaiting > ( unsigned portBASE_TYPE ) 0 )
 8012cec:	946e      	ld.w      	r3, (r4, 0x38)
 8012cee:	e9030030 	bez      	r3, 0x8012d4e	// 8012d4e <xQueueGenericReceive+0xa2>
				prvCopyDataFromQueue( pxQueue, pvBuffer );
 8012cf2:	6c5f      	mov      	r1, r7
 8012cf4:	6c13      	mov      	r0, r4
				pcOriginalReadPosition = pxQueue->pcReadFrom;
 8012cf6:	94a3      	ld.w      	r5, (r4, 0xc)
				prvCopyDataFromQueue( pxQueue, pvBuffer );
 8012cf8:	e3fffe74 	bsr      	0x80129e0	// 80129e0 <prvCopyDataFromQueue>
				if( xJustPeeking == pdFALSE )
 8012cfc:	e92a0019 	bnez      	r10, 0x8012d2e	// 8012d2e <xQueueGenericReceive+0x82>
					--( pxQueue->uxMessagesWaiting );
 8012d00:	946e      	ld.w      	r3, (r4, 0x38)
 8012d02:	2b00      	subi      	r3, 1
 8012d04:	b46e      	st.w      	r3, (r4, 0x38)
						if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
 8012d06:	9460      	ld.w      	r3, (r4, 0x0)
 8012d08:	e9230005 	bnez      	r3, 0x8012d12	// 8012d12 <xQueueGenericReceive+0x66>
							pxQueue->pxMutexHolder = xTaskGetCurrentTaskHandle();
 8012d0c:	e000068e 	bsr      	0x8013a28	// 8013a28 <xTaskGetCurrentTaskHandle>
 8012d10:	b401      	st.w      	r0, (r4, 0x4)
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
 8012d12:	9464      	ld.w      	r3, (r4, 0x10)
 8012d14:	e9030017 	bez      	r3, 0x8012d42	// 8012d42 <xQueueGenericReceive+0x96>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) == pdTRUE )
 8012d18:	e404000f 	addi      	r0, r4, 16
 8012d1c:	e00005e2 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012d20:	3841      	cmpnei      	r0, 1
 8012d22:	0810      	bt      	0x8012d42	// 8012d42 <xQueueGenericReceive+0x96>
							portYIELD_WITHIN_API();
 8012d24:	e3ffebee 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8012d28:	6c03      	mov      	r0, r0
 8012d2a:	6c03      	mov      	r0, r0
 8012d2c:	040b      	br      	0x8012d42	// 8012d42 <xQueueGenericReceive+0x96>
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
 8012d2e:	9469      	ld.w      	r3, (r4, 0x24)
					pxQueue->pcReadFrom = pcOriginalReadPosition;
 8012d30:	b4a3      	st.w      	r5, (r4, 0xc)
					if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
 8012d32:	e9030008 	bez      	r3, 0x8012d42	// 8012d42 <xQueueGenericReceive+0x96>
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
 8012d36:	e4040023 	addi      	r0, r4, 36
 8012d3a:	e00005d3 	bsr      	0x80138e0	// 80138e0 <xTaskRemoveFromEventList>
 8012d3e:	e920fff3 	bnez      	r0, 0x8012d24	// 8012d24 <xQueueGenericReceive+0x78>
				taskEXIT_CRITICAL();
 8012d42:	e0000c2b 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
				return pdPASS;
 8012d46:	3001      	movi      	r0, 1
}
 8012d48:	1403      	addi      	r14, r14, 12
 8012d4a:	ebc00038 	pop      	r4-r11, r15, r16
				if( xTicksToWait == ( portTickType ) 0 )
 8012d4e:	98a0      	ld.w      	r5, (r14, 0x0)
 8012d50:	e9250006 	bnez      	r5, 0x8012d5c	// 8012d5c <xQueueGenericReceive+0xb0>
					taskEXIT_CRITICAL();
 8012d54:	e0000c22 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
			return errQUEUE_EMPTY;
 8012d58:	3000      	movi      	r0, 0
 8012d5a:	07f7      	br      	0x8012d48	// 8012d48 <xQueueGenericReceive+0x9c>
				else if( xEntryTimeSet == pdFALSE )
 8012d5c:	e9280005 	bnez      	r8, 0x8012d66	// 8012d66 <xQueueGenericReceive+0xba>
					vTaskSetTimeOutState( &xTimeOut );
 8012d60:	1801      	addi      	r0, r14, 4
 8012d62:	e00005ff 	bsr      	0x8013960	// 8013960 <vTaskSetTimeOutState>
		taskEXIT_CRITICAL();
 8012d66:	e0000c19 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		vTaskSuspendAll();
 8012d6a:	e000035b 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
		prvLockQueue( pxQueue );
 8012d6e:	e0000c0b 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
 8012d72:	9471      	ld.w      	r3, (r4, 0x44)
 8012d74:	658e      	cmpne      	r3, r6
 8012d76:	0803      	bt      	0x8012d7c	// 8012d7c <xQueueGenericReceive+0xd0>
 8012d78:	dd242011 	st.w      	r9, (r4, 0x44)
 8012d7c:	9472      	ld.w      	r3, (r4, 0x48)
 8012d7e:	66ce      	cmpne      	r3, r11
 8012d80:	0803      	bt      	0x8012d86	// 8012d86 <xQueueGenericReceive+0xda>
 8012d82:	dd242012 	st.w      	r9, (r4, 0x48)
 8012d86:	e0000c09 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
 8012d8a:	6c7b      	mov      	r1, r14
 8012d8c:	1801      	addi      	r0, r14, 4
 8012d8e:	e0000603 	bsr      	0x8013994	// 8013994 <xTaskCheckForTimeOut>
 8012d92:	e920002c 	bnez      	r0, 0x8012dea	// 8012dea <xQueueGenericReceive+0x13e>
	taskENTER_CRITICAL();
 8012d96:	e0000bf7 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		xReturn = ( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0 );
 8012d9a:	94ae      	ld.w      	r5, (r4, 0x38)
	taskEXIT_CRITICAL();
 8012d9c:	e0000bfe 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
			if( prvIsQueueEmpty( pxQueue ) != pdFALSE )
 8012da0:	e925001f 	bnez      	r5, 0x8012dde	// 8012dde <xQueueGenericReceive+0x132>
					if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
 8012da4:	9460      	ld.w      	r3, (r4, 0x0)
 8012da6:	e9230009 	bnez      	r3, 0x8012db8	// 8012db8 <xQueueGenericReceive+0x10c>
						portENTER_CRITICAL();
 8012daa:	e0000bed 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
							vTaskPriorityInherit( ( void * ) pxQueue->pxMutexHolder );
 8012dae:	9401      	ld.w      	r0, (r4, 0x4)
 8012db0:	e0000652 	bsr      	0x8013a54	// 8013a54 <vTaskPriorityInherit>
						portEXIT_CRITICAL();
 8012db4:	e0000bf2 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
 8012db8:	9820      	ld.w      	r1, (r14, 0x0)
 8012dba:	c4104820 	lsli      	r0, r16, 0
 8012dbe:	e0000541 	bsr      	0x8013840	// 8013840 <vTaskPlaceOnEventList>
				prvUnlockQueue( pxQueue );
 8012dc2:	6c13      	mov      	r0, r4
 8012dc4:	e3fffe24 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
				if( xTaskResumeAll() == pdFALSE )
 8012dc8:	e00003c2 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012dcc:	e9200006 	bnez      	r0, 0x8012dd8	// 8012dd8 <xQueueGenericReceive+0x12c>
					portYIELD_WITHIN_API();
 8012dd0:	e3ffeb98 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8012dd4:	6c03      	mov      	r0, r0
 8012dd6:	6c03      	mov      	r0, r0
 8012dd8:	ea080001 	movi      	r8, 1
 8012ddc:	0786      	br      	0x8012ce8	// 8012ce8 <xQueueGenericReceive+0x3c>
				prvUnlockQueue( pxQueue );
 8012dde:	6c13      	mov      	r0, r4
 8012de0:	e3fffe16 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
				( void ) xTaskResumeAll();
 8012de4:	e00003b4 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012de8:	07f8      	br      	0x8012dd8	// 8012dd8 <xQueueGenericReceive+0x12c>
			prvUnlockQueue( pxQueue );
 8012dea:	6c13      	mov      	r0, r4
 8012dec:	e3fffe10 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
			( void ) xTaskResumeAll();
 8012df0:	e00003ae 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 8012df4:	07b2      	br      	0x8012d58	// 8012d58 <xQueueGenericReceive+0xac>
	configASSERT( !( ( pvBuffer == NULL ) && ( pxQueue->uxItemSize != ( unsigned portBASE_TYPE ) 0U ) ) );
 8012df6:	32e8      	movi      	r2, 232
 8012df8:	4242      	lsli      	r2, r2, 2
 8012dfa:	1023      	lrw      	r1, 0x8015cfc	// 8012e04 <xQueueGenericReceive+0x158>
 8012dfc:	1003      	lrw      	r0, 0x8015d25	// 8012e08 <xQueueGenericReceive+0x15c>
 8012dfe:	e00016b7 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012e02:	0400      	br      	0x8012e02	// 8012e02 <xQueueGenericReceive+0x156>
 8012e04:	08015cfc 	.long	0x08015cfc
 8012e08:	08015d25 	.long	0x08015d25

08012e0c <vQueueWaitForMessageRestricted>:
/*-----------------------------------------------------------*/

#if configUSE_TIMERS == 1

	void vQueueWaitForMessageRestricted( xQueueHandle pxQueue, portTickType xTicksToWait )
	{
 8012e0c:	14d2      	push      	r4-r5, r15
 8012e0e:	6d03      	mov      	r4, r0
 8012e10:	6d47      	mov      	r5, r1
		will not actually cause the task to block, just place it on a blocked
		list.  It will not block until the scheduler is unlocked - at which
		time a yield will be performed.  If an item is added to the queue while
		the queue is locked, and the calling task blocks on the queue, then the
		calling task will be immediately unblocked when the queue is unlocked. */
		prvLockQueue( pxQueue );
 8012e12:	e0000bb9 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
 8012e16:	3300      	movi      	r3, 0
 8012e18:	9451      	ld.w      	r2, (r4, 0x44)
 8012e1a:	2b00      	subi      	r3, 1
 8012e1c:	64ca      	cmpne      	r2, r3
 8012e1e:	0803      	bt      	0x8012e24	// 8012e24 <vQueueWaitForMessageRestricted+0x18>
 8012e20:	3200      	movi      	r2, 0
 8012e22:	b451      	st.w      	r2, (r4, 0x44)
 8012e24:	9452      	ld.w      	r2, (r4, 0x48)
 8012e26:	64ca      	cmpne      	r2, r3
 8012e28:	0803      	bt      	0x8012e2e	// 8012e2e <vQueueWaitForMessageRestricted+0x22>
 8012e2a:	3300      	movi      	r3, 0
 8012e2c:	b472      	st.w      	r3, (r4, 0x48)
 8012e2e:	e0000bb5 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		if( pxQueue->uxMessagesWaiting == ( unsigned portBASE_TYPE ) 0U )
 8012e32:	946e      	ld.w      	r3, (r4, 0x38)
 8012e34:	e9230007 	bnez      	r3, 0x8012e42	// 8012e42 <vQueueWaitForMessageRestricted+0x36>
		{
			/* There is nothing in the queue, block for the specified period. */
			vTaskPlaceOnEventListRestricted( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
 8012e38:	6c57      	mov      	r1, r5
 8012e3a:	e4040023 	addi      	r0, r4, 36
 8012e3e:	e000052f 	bsr      	0x801389c	// 801389c <vTaskPlaceOnEventListRestricted>
		}
		prvUnlockQueue( pxQueue );
 8012e42:	6c13      	mov      	r0, r4
 8012e44:	e3fffde4 	bsr      	0x8012a0c	// 8012a0c <prvUnlockQueue>
	}
 8012e48:	1492      	pop      	r4-r5, r15
	...

08012e4c <prvCheckForValidListAndQueue>:
	pxOverflowTimerList = pxTemp;
}
/*-----------------------------------------------------------*/

static void prvCheckForValidListAndQueue( void )
{
 8012e4c:	14d3      	push      	r4-r6, r15
	/* Check that the list from which active timers are referenced, and the
	queue used to communicate with the timer service, have been
	initialised. */
	taskENTER_CRITICAL();
	{
		if( xTimerQueue == NULL )
 8012e4e:	108e      	lrw      	r4, 0x200063bc	// 8012e84 <prvCheckForValidListAndQueue+0x38>
	taskENTER_CRITICAL();
 8012e50:	e0000b9a 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		if( xTimerQueue == NULL )
 8012e54:	9460      	ld.w      	r3, (r4, 0x0)
 8012e56:	e9230013 	bnez      	r3, 0x8012e7c	// 8012e7c <prvCheckForValidListAndQueue+0x30>
		{
			vListInitialise( &xActiveTimerList1 );
 8012e5a:	10cc      	lrw      	r6, 0x20006390	// 8012e88 <prvCheckForValidListAndQueue+0x3c>
 8012e5c:	6c1b      	mov      	r0, r6
			vListInitialise( &xActiveTimerList2 );
 8012e5e:	10ac      	lrw      	r5, 0x200063a4	// 8012e8c <prvCheckForValidListAndQueue+0x40>
			vListInitialise( &xActiveTimerList1 );
 8012e60:	e3fffd4a 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
			vListInitialise( &xActiveTimerList2 );
 8012e64:	6c17      	mov      	r0, r5
 8012e66:	e3fffd47 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
			pxCurrentTimerList = &xActiveTimerList1;
 8012e6a:	106a      	lrw      	r3, 0x20006388	// 8012e90 <prvCheckForValidListAndQueue+0x44>
			pxOverflowTimerList = &xActiveTimerList2;
			xTimerQueue = xQueueCreate( ( unsigned portBASE_TYPE ) configTIMER_QUEUE_LENGTH, sizeof( xTIMER_MESSAGE ) );
 8012e6c:	310c      	movi      	r1, 12
			pxCurrentTimerList = &xActiveTimerList1;
 8012e6e:	b3c0      	st.w      	r6, (r3, 0x0)
			xTimerQueue = xQueueCreate( ( unsigned portBASE_TYPE ) configTIMER_QUEUE_LENGTH, sizeof( xTIMER_MESSAGE ) );
 8012e70:	3080      	movi      	r0, 128
			pxOverflowTimerList = &xActiveTimerList2;
 8012e72:	1069      	lrw      	r3, 0x2000638c	// 8012e94 <prvCheckForValidListAndQueue+0x48>
 8012e74:	b3a0      	st.w      	r5, (r3, 0x0)
			xTimerQueue = xQueueCreate( ( unsigned portBASE_TYPE ) configTIMER_QUEUE_LENGTH, sizeof( xTIMER_MESSAGE ) );
 8012e76:	e3fffe03 	bsr      	0x8012a7c	// 8012a7c <xQueueCreate>
 8012e7a:	b400      	st.w      	r0, (r4, 0x0)
		}
	}
	taskEXIT_CRITICAL();
 8012e7c:	e0000b8e 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
}
 8012e80:	1493      	pop      	r4-r6, r15
 8012e82:	0000      	.short	0x0000
 8012e84:	200063bc 	.long	0x200063bc
 8012e88:	20006390 	.long	0x20006390
 8012e8c:	200063a4 	.long	0x200063a4
 8012e90:	20006388 	.long	0x20006388
 8012e94:	2000638c 	.long	0x2000638c

08012e98 <prvInsertTimerInActiveList>:
{
 8012e98:	14d0      	push      	r15
	if( xNextExpiryTime <= xTimeNow )
 8012e9a:	6448      	cmphs      	r2, r1
	listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xNextExpiryTime );
 8012e9c:	b021      	st.w      	r1, (r0, 0x4)
	listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
 8012e9e:	b004      	st.w      	r0, (r0, 0x10)
	if( xNextExpiryTime <= xTimeNow )
 8012ea0:	0c0c      	bf      	0x8012eb8	// 8012eb8 <prvInsertTimerInActiveList+0x20>
		if( ( ( portTickType ) ( xTimeNow - xCommandTime ) ) >= pxTimer->xTimerPeriodInTicks )
 8012ea2:	608e      	subu      	r2, r3
 8012ea4:	9066      	ld.w      	r3, (r0, 0x18)
 8012ea6:	64c8      	cmphs      	r2, r3
 8012ea8:	080f      	bt      	0x8012ec6	// 8012ec6 <prvInsertTimerInActiveList+0x2e>
			vListInsert( pxOverflowTimerList, &( pxTimer->xTimerListItem ) );
 8012eaa:	582e      	addi      	r1, r0, 4
 8012eac:	1068      	lrw      	r3, 0x2000638c	// 8012ecc <prvInsertTimerInActiveList+0x34>
			vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
 8012eae:	9300      	ld.w      	r0, (r3, 0x0)
 8012eb0:	e3fffd3e 	bsr      	0x801292c	// 801292c <vListInsert>
portBASE_TYPE xProcessTimerNow = pdFALSE;
 8012eb4:	3000      	movi      	r0, 0
}
 8012eb6:	1490      	pop      	r15
		if( ( xTimeNow < xCommandTime ) && ( xNextExpiryTime >= xCommandTime ) )
 8012eb8:	64c8      	cmphs      	r2, r3
 8012eba:	0803      	bt      	0x8012ec0	// 8012ec0 <prvInsertTimerInActiveList+0x28>
 8012ebc:	64c4      	cmphs      	r1, r3
 8012ebe:	0804      	bt      	0x8012ec6	// 8012ec6 <prvInsertTimerInActiveList+0x2e>
			vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
 8012ec0:	582e      	addi      	r1, r0, 4
 8012ec2:	1064      	lrw      	r3, 0x20006388	// 8012ed0 <prvInsertTimerInActiveList+0x38>
 8012ec4:	07f5      	br      	0x8012eae	// 8012eae <prvInsertTimerInActiveList+0x16>
			xProcessTimerNow = pdTRUE;
 8012ec6:	3001      	movi      	r0, 1
	return xProcessTimerNow;
 8012ec8:	07f7      	br      	0x8012eb6	// 8012eb6 <prvInsertTimerInActiveList+0x1e>
 8012eca:	0000      	.short	0x0000
 8012ecc:	2000638c 	.long	0x2000638c
 8012ed0:	20006388 	.long	0x20006388

08012ed4 <xTimerCreateTimerTask>:
{
 8012ed4:	14d0      	push      	r15
 8012ed6:	1424      	subi      	r14, r14, 16
	prvCheckForValidListAndQueue();
 8012ed8:	e3ffffba 	bsr      	0x8012e4c	// 8012e4c <prvCheckForValidListAndQueue>
	if( xTimerQueue != NULL )
 8012edc:	106d      	lrw      	r3, 0x200063bc	// 8012f10 <xTimerCreateTimerTask+0x3c>
 8012ede:	9360      	ld.w      	r3, (r3, 0x0)
 8012ee0:	e9230008 	bnez      	r3, 0x8012ef0	// 8012ef0 <xTimerCreateTimerTask+0x1c>
	configASSERT( xReturn );
 8012ee4:	32cc      	movi      	r2, 204
 8012ee6:	102c      	lrw      	r1, 0x8015d36	// 8012f14 <xTimerCreateTimerTask+0x40>
 8012ee8:	100c      	lrw      	r0, 0x8015d25	// 8012f18 <xTimerCreateTimerTask+0x44>
 8012eea:	e0001641 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012eee:	0400      	br      	0x8012eee	// 8012eee <xTimerCreateTimerTask+0x1a>
			xReturn = xTaskCreate( prvTimerTask, ( const signed char * ) "Tmr Svc", ( unsigned short ) configTIMER_TASK_STACK_DEPTH, NULL, ( unsigned portBASE_TYPE ) configTIMER_TASK_PRIORITY, NULL);
 8012ef0:	3201      	movi      	r2, 1
 8012ef2:	3300      	movi      	r3, 0
 8012ef4:	b840      	st.w      	r2, (r14, 0x0)
 8012ef6:	32c8      	movi      	r2, 200
 8012ef8:	b863      	st.w      	r3, (r14, 0xc)
 8012efa:	b862      	st.w      	r3, (r14, 0x8)
 8012efc:	b861      	st.w      	r3, (r14, 0x4)
 8012efe:	4241      	lsli      	r2, r2, 1
 8012f00:	1027      	lrw      	r1, 0x8015d64	// 8012f1c <xTimerCreateTimerTask+0x48>
 8012f02:	1008      	lrw      	r0, 0x8012ff4	// 8012f20 <xTimerCreateTimerTask+0x4c>
 8012f04:	e000016e 	bsr      	0x80131e0	// 80131e0 <xTaskGenericCreate>
	configASSERT( xReturn );
 8012f08:	e900ffee 	bez      	r0, 0x8012ee4	// 8012ee4 <xTimerCreateTimerTask+0x10>
}
 8012f0c:	1404      	addi      	r14, r14, 16
 8012f0e:	1490      	pop      	r15
 8012f10:	200063bc 	.long	0x200063bc
 8012f14:	08015d36 	.long	0x08015d36
 8012f18:	08015d25 	.long	0x08015d25
 8012f1c:	08015d64 	.long	0x08015d64
 8012f20:	08012ff4 	.long	0x08012ff4

08012f24 <xTimerGenericCommand>:
{
 8012f24:	14d2      	push      	r4-r5, r15
 8012f26:	1424      	subi      	r14, r14, 16
	if( xTimerQueue != NULL )
 8012f28:	10b1      	lrw      	r5, 0x200063bc	// 8012f6c <xTimerGenericCommand+0x48>
{
 8012f2a:	6f03      	mov      	r12, r0
	if( xTimerQueue != NULL )
 8012f2c:	9500      	ld.w      	r0, (r5, 0x0)
{
 8012f2e:	6d0f      	mov      	r4, r3
 8012f30:	9867      	ld.w      	r3, (r14, 0x1c)
 8012f32:	b860      	st.w      	r3, (r14, 0x0)
	if( xTimerQueue != NULL )
 8012f34:	e9000012 	bez      	r0, 0x8012f58	// 8012f58 <xTimerGenericCommand+0x34>
		xMessage.xMessageID = xCommandID;
 8012f38:	b821      	st.w      	r1, (r14, 0x4)
		xMessage.xMessageValue = xOptionalValue;
 8012f3a:	b842      	st.w      	r2, (r14, 0x8)
		xMessage.pxTimer = ( xTIMER * ) xTimer;
 8012f3c:	dd8e2003 	st.w      	r12, (r14, 0xc)
		if( pxHigherPriorityTaskWoken == NULL )
 8012f40:	e9240010 	bnez      	r4, 0x8012f60	// 8012f60 <xTimerGenericCommand+0x3c>
			if( xTaskGetSchedulerState() == taskSCHEDULER_RUNNING )
 8012f44:	e0000578 	bsr      	0x8013a34	// 8013a34 <xTaskGetSchedulerState>
 8012f48:	3841      	cmpnei      	r0, 1
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, xBlockTime );
 8012f4a:	6cd3      	mov      	r3, r4
			if( xTaskGetSchedulerState() == taskSCHEDULER_RUNNING )
 8012f4c:	0808      	bt      	0x8012f5c	// 8012f5c <xTimerGenericCommand+0x38>
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, xBlockTime );
 8012f4e:	9840      	ld.w      	r2, (r14, 0x0)
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, tmrNO_DELAY );
 8012f50:	1901      	addi      	r1, r14, 4
 8012f52:	9500      	ld.w      	r0, (r5, 0x0)
 8012f54:	e3fffdcc 	bsr      	0x8012aec	// 8012aec <xQueueGenericSend>
}
 8012f58:	1404      	addi      	r14, r14, 16
 8012f5a:	1492      	pop      	r4-r5, r15
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, tmrNO_DELAY );
 8012f5c:	6c93      	mov      	r2, r4
 8012f5e:	07f9      	br      	0x8012f50	// 8012f50 <xTimerGenericCommand+0x2c>
			xReturn = xQueueSendToBackFromISR( xTimerQueue, &xMessage, pxHigherPriorityTaskWoken );
 8012f60:	3300      	movi      	r3, 0
 8012f62:	6c93      	mov      	r2, r4
 8012f64:	1901      	addi      	r1, r14, 4
 8012f66:	e3fffe57 	bsr      	0x8012c14	// 8012c14 <xQueueGenericSendFromISR>
 8012f6a:	07f7      	br      	0x8012f58	// 8012f58 <xTimerGenericCommand+0x34>
 8012f6c:	200063bc 	.long	0x200063bc

08012f70 <prvSwitchTimerLists.isra.1>:
static void prvSwitchTimerLists( portTickType xLastTime )
 8012f70:	14d5      	push      	r4-r8, r15
 8012f72:	1421      	subi      	r14, r14, 4
	while( listLIST_IS_EMPTY( pxCurrentTimerList ) == pdFALSE )
 8012f74:	10bc      	lrw      	r5, 0x20006388	// 8012fe4 <prvSwitchTimerLists.isra.1+0x74>
				xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START, xNextExpireTime, NULL, tmrNO_DELAY );
 8012f76:	ea080000 	movi      	r8, 0
	while( listLIST_IS_EMPTY( pxCurrentTimerList ) == pdFALSE )
 8012f7a:	9560      	ld.w      	r3, (r5, 0x0)
 8012f7c:	9340      	ld.w      	r2, (r3, 0x0)
 8012f7e:	e9220008 	bnez      	r2, 0x8012f8e	// 8012f8e <prvSwitchTimerLists.isra.1+0x1e>
	pxCurrentTimerList = pxOverflowTimerList;
 8012f82:	105a      	lrw      	r2, 0x2000638c	// 8012fe8 <prvSwitchTimerLists.isra.1+0x78>
 8012f84:	9220      	ld.w      	r1, (r2, 0x0)
 8012f86:	b520      	st.w      	r1, (r5, 0x0)
	pxOverflowTimerList = pxTemp;
 8012f88:	b260      	st.w      	r3, (r2, 0x0)
}
 8012f8a:	1401      	addi      	r14, r14, 4
 8012f8c:	1495      	pop      	r4-r8, r15
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
 8012f8e:	9343      	ld.w      	r2, (r3, 0xc)
 8012f90:	92c0      	ld.w      	r6, (r2, 0x0)
		pxTimer = ( xTIMER * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
 8012f92:	9363      	ld.w      	r3, (r3, 0xc)
 8012f94:	9383      	ld.w      	r4, (r3, 0xc)
		vListRemove( &( pxTimer->xTimerListItem ) );
 8012f96:	5cee      	addi      	r7, r4, 4
 8012f98:	6c1f      	mov      	r0, r7
 8012f9a:	e3fffce3 	bsr      	0x8012960	// 8012960 <vListRemove>
		pxTimer->pxCallbackFunction( ( xTimerHandle ) pxTimer, pxTimer->callback_arg );	//modify by dave
 8012f9e:	9469      	ld.w      	r3, (r4, 0x24)
 8012fa0:	942a      	ld.w      	r1, (r4, 0x28)
 8012fa2:	6c13      	mov      	r0, r4
 8012fa4:	7bcd      	jsr      	r3
		if( pxTimer->uxAutoReload == ( unsigned portBASE_TYPE ) pdTRUE )
 8012fa6:	9467      	ld.w      	r3, (r4, 0x1c)
 8012fa8:	3b41      	cmpnei      	r3, 1
 8012faa:	0be8      	bt      	0x8012f7a	// 8012f7a <prvSwitchTimerLists.isra.1+0xa>
			xReloadTime = ( xNextExpireTime + pxTimer->xTimerPeriodInTicks );
 8012fac:	9466      	ld.w      	r3, (r4, 0x18)
 8012fae:	60d8      	addu      	r3, r6
			if( xReloadTime > xNextExpireTime )
 8012fb0:	64d8      	cmphs      	r6, r3
 8012fb2:	0808      	bt      	0x8012fc2	// 8012fc2 <prvSwitchTimerLists.isra.1+0x52>
				listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xReloadTime );
 8012fb4:	b461      	st.w      	r3, (r4, 0x4)
				listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
 8012fb6:	b484      	st.w      	r4, (r4, 0x10)
				vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
 8012fb8:	6c5f      	mov      	r1, r7
 8012fba:	9500      	ld.w      	r0, (r5, 0x0)
 8012fbc:	e3fffcb8 	bsr      	0x801292c	// 801292c <vListInsert>
 8012fc0:	07dd      	br      	0x8012f7a	// 8012f7a <prvSwitchTimerLists.isra.1+0xa>
				xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START, xNextExpireTime, NULL, tmrNO_DELAY );
 8012fc2:	3300      	movi      	r3, 0
 8012fc4:	dd0e2000 	st.w      	r8, (r14, 0x0)
 8012fc8:	6c9b      	mov      	r2, r6
 8012fca:	6c4f      	mov      	r1, r3
 8012fcc:	6c13      	mov      	r0, r4
 8012fce:	e3ffffab 	bsr      	0x8012f24	// 8012f24 <xTimerGenericCommand>
				configASSERT( xResult );
 8012fd2:	e920ffd4 	bnez      	r0, 0x8012f7a	// 8012f7a <prvSwitchTimerLists.isra.1+0xa>
 8012fd6:	32a8      	movi      	r2, 168
 8012fd8:	4242      	lsli      	r2, r2, 2
 8012fda:	1025      	lrw      	r1, 0x8015d36	// 8012fec <prvSwitchTimerLists.isra.1+0x7c>
 8012fdc:	1005      	lrw      	r0, 0x8015d25	// 8012ff0 <prvSwitchTimerLists.isra.1+0x80>
 8012fde:	e00015c7 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8012fe2:	0400      	br      	0x8012fe2	// 8012fe2 <prvSwitchTimerLists.isra.1+0x72>
 8012fe4:	20006388 	.long	0x20006388
 8012fe8:	2000638c 	.long	0x2000638c
 8012fec:	08015d36 	.long	0x08015d36
 8012ff0:	08015d25 	.long	0x08015d25

08012ff4 <prvTimerTask>:
{
 8012ff4:	ebe00038 	push      	r4-r11, r15, r16
 8012ff8:	1425      	subi      	r14, r14, 20
	*pxListWasEmpty = listLIST_IS_EMPTY( pxCurrentTimerList );
 8012ffa:	ea880061 	lrw      	r8, 0x20006388	// 801317c <prvTimerTask+0x188>
	if( xTimeNow < xLastTime )
 8012ffe:	ea890061 	lrw      	r9, 0x200063b8	// 8013180 <prvTimerTask+0x18c>
 8013002:	6ee3      	mov      	r11, r8
 8013004:	6de7      	mov      	r7, r9
				vQueueWaitForMessageRestricted( xTimerQueue, ( xNextExpireTime - xTimeNow ) );
 8013006:	ea8a0060 	lrw      	r10, 0x200063bc	// 8013184 <prvTimerTask+0x190>
	*pxListWasEmpty = listLIST_IS_EMPTY( pxCurrentTimerList );
 801300a:	d8682000 	ld.w      	r3, (r8, 0x0)
 801300e:	9380      	ld.w      	r4, (r3, 0x0)
	if( *pxListWasEmpty == pdFALSE )
 8013010:	e9040040 	bez      	r4, 0x8013090	// 8013090 <prvTimerTask+0x9c>
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
 8013014:	9363      	ld.w      	r3, (r3, 0xc)
 8013016:	93a0      	ld.w      	r5, (r3, 0x0)
	vTaskSuspendAll();
 8013018:	e0000204 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
	xTimeNow = xTaskGetTickCount();
 801301c:	e000020a 	bsr      	0x8013430	// 8013430 <xTaskGetTickCount>
	if( xTimeNow < xLastTime )
 8013020:	d8692000 	ld.w      	r3, (r9, 0x0)
 8013024:	64c0      	cmphs      	r0, r3
	xTimeNow = xTaskGetTickCount();
 8013026:	6d83      	mov      	r6, r0
	if( xTimeNow < xLastTime )
 8013028:	0836      	bt      	0x8013094	// 8013094 <prvTimerTask+0xa0>
		prvSwitchTimerLists( xLastTime );
 801302a:	e3ffffa3 	bsr      	0x8012f70	// 8012f70 <prvSwitchTimerLists.isra.1>
		*pxTimerListsWereSwitched = pdTRUE;
 801302e:	ea100001 	movi      	r16, 1
	xLastTime = xTimeNow;
 8013032:	b7c0      	st.w      	r6, (r7, 0x0)
		if( xTimerListsWereSwitched == pdFALSE )
 8013034:	e930008a 	bnez      	r16, 0x8013148	// 8013148 <prvTimerTask+0x154>
			if( ( xListWasEmpty == pdFALSE ) && ( xNextExpireTime <= xTimeNow ) )
 8013038:	e904007a 	bez      	r4, 0x801312c	// 801312c <prvTimerTask+0x138>
 801303c:	6558      	cmphs      	r6, r5
 801303e:	0c77      	bf      	0x801312c	// 801312c <prvTimerTask+0x138>
				xTaskResumeAll();
 8013040:	e0000286 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
	pxTimer = ( xTIMER * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
 8013044:	d86b2000 	ld.w      	r3, (r11, 0x0)
 8013048:	9363      	ld.w      	r3, (r3, 0xc)
 801304a:	9383      	ld.w      	r4, (r3, 0xc)
	vListRemove( &( pxTimer->xTimerListItem ) );
 801304c:	5c0e      	addi      	r0, r4, 4
 801304e:	e3fffc89 	bsr      	0x8012960	// 8012960 <vListRemove>
	if( pxTimer->uxAutoReload == ( unsigned portBASE_TYPE ) pdTRUE )
 8013052:	9467      	ld.w      	r3, (r4, 0x1c)
 8013054:	3b41      	cmpnei      	r3, 1
 8013056:	0822      	bt      	0x801309a	// 801309a <prvTimerTask+0xa6>
		if( prvInsertTimerInActiveList( pxTimer, ( xNextExpireTime + pxTimer->xTimerPeriodInTicks ), xTimeNow, xNextExpireTime ) == pdTRUE )
 8013058:	9426      	ld.w      	r1, (r4, 0x18)
 801305a:	6cd7      	mov      	r3, r5
 801305c:	6c9b      	mov      	r2, r6
 801305e:	6054      	addu      	r1, r5
 8013060:	6c13      	mov      	r0, r4
 8013062:	e3ffff1b 	bsr      	0x8012e98	// 8012e98 <prvInsertTimerInActiveList>
 8013066:	3841      	cmpnei      	r0, 1
 8013068:	0819      	bt      	0x801309a	// 801309a <prvTimerTask+0xa6>
			xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START, xNextExpireTime, NULL, tmrNO_DELAY );
 801306a:	de0e2000 	st.w      	r16, (r14, 0x0)
 801306e:	c4104823 	lsli      	r3, r16, 0
 8013072:	6c97      	mov      	r2, r5
 8013074:	c4104821 	lsli      	r1, r16, 0
 8013078:	6c13      	mov      	r0, r4
 801307a:	e3ffff55 	bsr      	0x8012f24	// 8012f24 <xTimerGenericCommand>
			configASSERT( xResult );
 801307e:	e920000e 	bnez      	r0, 0x801309a	// 801309a <prvTimerTask+0xa6>
 8013082:	32bd      	movi      	r2, 189
 8013084:	4241      	lsli      	r2, r2, 1
 8013086:	1221      	lrw      	r1, 0x8015d36	// 8013188 <prvTimerTask+0x194>
 8013088:	1201      	lrw      	r0, 0x8015d25	// 801318c <prvTimerTask+0x198>
 801308a:	e0001571 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 801308e:	0400      	br      	0x801308e	// 801308e <prvTimerTask+0x9a>
		xNextExpireTime = ( portTickType ) 0U;
 8013090:	6d53      	mov      	r5, r4
 8013092:	07c3      	br      	0x8013018	// 8013018 <prvTimerTask+0x24>
		*pxTimerListsWereSwitched = pdFALSE;
 8013094:	ea100000 	movi      	r16, 0
 8013098:	07cd      	br      	0x8013032	// 8013032 <prvTimerTask+0x3e>
	pxTimer->pxCallbackFunction( ( xTimerHandle ) pxTimer, pxTimer->callback_arg );	//modify by dave
 801309a:	9469      	ld.w      	r3, (r4, 0x24)
 801309c:	942a      	ld.w      	r1, (r4, 0x28)
 801309e:	6c13      	mov      	r0, r4
 80130a0:	7bcd      	jsr      	r3
	while( xQueueReceive( xTimerQueue, &xMessage, tmrNO_DELAY ) != pdFAIL )
 80130a2:	3300      	movi      	r3, 0
 80130a4:	6c8f      	mov      	r2, r3
 80130a6:	1902      	addi      	r1, r14, 8
 80130a8:	d80a2000 	ld.w      	r0, (r10, 0x0)
 80130ac:	e3fffe00 	bsr      	0x8012cac	// 8012cac <xQueueGenericReceive>
 80130b0:	e900ffad 	bez      	r0, 0x801300a	// 801300a <prvTimerTask+0x16>
	xTimeNow = xTaskGetTickCount();
 80130b4:	e00001be 	bsr      	0x8013430	// 8013430 <xTaskGetTickCount>
	if( xTimeNow < xLastTime )
 80130b8:	9760      	ld.w      	r3, (r7, 0x0)
 80130ba:	64c0      	cmphs      	r0, r3
	xTimeNow = xTaskGetTickCount();
 80130bc:	6d83      	mov      	r6, r0
	if( xTimeNow < xLastTime )
 80130be:	0803      	bt      	0x80130c4	// 80130c4 <prvTimerTask+0xd0>
		prvSwitchTimerLists( xLastTime );
 80130c0:	e3ffff58 	bsr      	0x8012f70	// 8012f70 <prvSwitchTimerLists.isra.1>
		pxTimer = xMessage.pxTimer;
 80130c4:	9884      	ld.w      	r4, (r14, 0x10)
	xLastTime = xTimeNow;
 80130c6:	b7c0      	st.w      	r6, (r7, 0x0)
		if( pxTimer != NULL )
 80130c8:	e9040008 	bez      	r4, 0x80130d8	// 80130d8 <prvTimerTask+0xe4>
			if( listIS_CONTAINED_WITHIN( NULL, &( pxTimer->xTimerListItem ) ) == pdFALSE )
 80130cc:	9465      	ld.w      	r3, (r4, 0x14)
 80130ce:	e9030005 	bez      	r3, 0x80130d8	// 80130d8 <prvTimerTask+0xe4>
				vListRemove( &( pxTimer->xTimerListItem ) );
 80130d2:	5c0e      	addi      	r0, r4, 4
 80130d4:	e3fffc46 	bsr      	0x8012960	// 8012960 <vListRemove>
		switch( xMessage.xMessageID )
 80130d8:	98a2      	ld.w      	r5, (r14, 0x8)
 80130da:	3d42      	cmpnei      	r5, 2
 80130dc:	0c39      	bf      	0x801314e	// 801314e <prvTimerTask+0x15a>
 80130de:	3d43      	cmpnei      	r5, 3
 80130e0:	0c49      	bf      	0x8013172	// 8013172 <prvTimerTask+0x17e>
 80130e2:	e925ffe0 	bnez      	r5, 0x80130a2	// 80130a2 <prvTimerTask+0xae>
				if( prvInsertTimerInActiveList( pxTimer,  xMessage.xMessageValue + pxTimer->xTimerPeriodInTicks, xTimeNow, xMessage.xMessageValue ) == pdTRUE )
 80130e6:	9863      	ld.w      	r3, (r14, 0xc)
 80130e8:	9426      	ld.w      	r1, (r4, 0x18)
 80130ea:	6c9b      	mov      	r2, r6
 80130ec:	604c      	addu      	r1, r3
 80130ee:	6c13      	mov      	r0, r4
 80130f0:	b861      	st.w      	r3, (r14, 0x4)
 80130f2:	e3fffed3 	bsr      	0x8012e98	// 8012e98 <prvInsertTimerInActiveList>
 80130f6:	3841      	cmpnei      	r0, 1
 80130f8:	0bd5      	bt      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
					pxTimer->pxCallbackFunction( ( xTimerHandle ) pxTimer, pxTimer->callback_arg );//modify by dave
 80130fa:	9469      	ld.w      	r3, (r4, 0x24)
 80130fc:	942a      	ld.w      	r1, (r4, 0x28)
 80130fe:	6c13      	mov      	r0, r4
 8013100:	7bcd      	jsr      	r3
					if( pxTimer->uxAutoReload == ( unsigned portBASE_TYPE ) pdTRUE )
 8013102:	9467      	ld.w      	r3, (r4, 0x1c)
 8013104:	3b41      	cmpnei      	r3, 1
 8013106:	0bce      	bt      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
						xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START, xMessage.xMessageValue + pxTimer->xTimerPeriodInTicks, NULL, tmrNO_DELAY );
 8013108:	9823      	ld.w      	r1, (r14, 0xc)
 801310a:	9446      	ld.w      	r2, (r4, 0x18)
 801310c:	6084      	addu      	r2, r1
 801310e:	b8a0      	st.w      	r5, (r14, 0x0)
 8013110:	6cd7      	mov      	r3, r5
 8013112:	6c57      	mov      	r1, r5
 8013114:	6c13      	mov      	r0, r4
 8013116:	e3ffff07 	bsr      	0x8012f24	// 8012f24 <xTimerGenericCommand>
						configASSERT( xResult );
 801311a:	e920ffc4 	bnez      	r0, 0x80130a2	// 80130a2 <prvTimerTask+0xae>
 801311e:	ea020253 	movi      	r2, 595
 8013122:	103a      	lrw      	r1, 0x8015d36	// 8013188 <prvTimerTask+0x194>
 8013124:	101a      	lrw      	r0, 0x8015d25	// 801318c <prvTimerTask+0x198>
 8013126:	e0001523 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 801312a:	0400      	br      	0x801312a	// 801312a <prvTimerTask+0x136>
				vQueueWaitForMessageRestricted( xTimerQueue, ( xNextExpireTime - xTimeNow ) );
 801312c:	5d39      	subu      	r1, r5, r6
 801312e:	d80a2000 	ld.w      	r0, (r10, 0x0)
 8013132:	e3fffe6d 	bsr      	0x8012e0c	// 8012e0c <vQueueWaitForMessageRestricted>
				if( xTaskResumeAll() == pdFALSE )
 8013136:	e000020b 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 801313a:	e920ffb4 	bnez      	r0, 0x80130a2	// 80130a2 <prvTimerTask+0xae>
					portYIELD_WITHIN_API();
 801313e:	e3ffe9e1 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8013142:	6c03      	mov      	r0, r0
 8013144:	6c03      	mov      	r0, r0
 8013146:	07ae      	br      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
			xTaskResumeAll();
 8013148:	e0000202 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
 801314c:	07ab      	br      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
				pxTimer->xTimerPeriodInTicks = xMessage.xMessageValue;
 801314e:	9823      	ld.w      	r1, (r14, 0xc)
 8013150:	b426      	st.w      	r1, (r4, 0x18)
				configASSERT( ( pxTimer->xTimerPeriodInTicks > 0 ) );
 8013152:	e9210009 	bnez      	r1, 0x8013164	// 8013164 <prvTimerTask+0x170>
 8013156:	3298      	movi      	r2, 152
 8013158:	4242      	lsli      	r2, r2, 2
 801315a:	102c      	lrw      	r1, 0x8015d36	// 8013188 <prvTimerTask+0x194>
 801315c:	100c      	lrw      	r0, 0x8015d25	// 801318c <prvTimerTask+0x198>
 801315e:	e0001507 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013162:	0400      	br      	0x8013162	// 8013162 <prvTimerTask+0x16e>
				prvInsertTimerInActiveList( pxTimer, ( xTimeNow + pxTimer->xTimerPeriodInTicks ), xTimeNow, xTimeNow );
 8013164:	6cdb      	mov      	r3, r6
 8013166:	6c9b      	mov      	r2, r6
 8013168:	6058      	addu      	r1, r6
 801316a:	6c13      	mov      	r0, r4
 801316c:	e3fffe96 	bsr      	0x8012e98	// 8012e98 <prvInsertTimerInActiveList>
 8013170:	0799      	br      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
				vPortFree( pxTimer );
 8013172:	6c13      	mov      	r0, r4
 8013174:	e3fffb94 	bsr      	0x801289c	// 801289c <vPortFree>
 8013178:	0795      	br      	0x80130a2	// 80130a2 <prvTimerTask+0xae>
 801317a:	0000      	.short	0x0000
 801317c:	20006388 	.long	0x20006388
 8013180:	200063b8 	.long	0x200063b8
 8013184:	200063bc 	.long	0x200063bc
 8013188:	08015d36 	.long	0x08015d36
 801318c:	08015d25 	.long	0x08015d25

08013190 <prvAddCurrentTaskToDelayedList>:
	#endif
}
/*-----------------------------------------------------------*/

static void prvAddCurrentTaskToDelayedList( portTickType xTimeToWake )
{
 8013190:	14d2      	push      	r4-r5, r15
	/* The list item will be inserted in wake time order. */
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
 8013192:	106f      	lrw      	r3, 0x200063c8	// 80131cc <prvAddCurrentTaskToDelayedList+0x3c>
{
 8013194:	6d03      	mov      	r4, r0
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xGenericListItem ), xTimeToWake );
 8013196:	9340      	ld.w      	r2, (r3, 0x0)
 8013198:	b201      	st.w      	r0, (r2, 0x4)

	if( xTimeToWake < xTickCount )
 801319a:	104e      	lrw      	r2, 0x20006950	// 80131d0 <prvAddCurrentTaskToDelayedList+0x40>
 801319c:	9240      	ld.w      	r2, (r2, 0x0)
 801319e:	6480      	cmphs      	r0, r2
 80131a0:	0808      	bt      	0x80131b0	// 80131b0 <prvAddCurrentTaskToDelayedList+0x20>
	{
		/* Wake time has overflowed.  Place this item in the overflow list. */
		vListInsert( ( xList * ) pxOverflowDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 80131a2:	104d      	lrw      	r2, 0x200063d0	// 80131d4 <prvAddCurrentTaskToDelayedList+0x44>
 80131a4:	9200      	ld.w      	r0, (r2, 0x0)
 80131a6:	9320      	ld.w      	r1, (r3, 0x0)
 80131a8:	2103      	addi      	r1, 4
 80131aa:	e3fffbc1 	bsr      	0x801292c	// 801292c <vListInsert>
		if( xTimeToWake < xNextTaskUnblockTime )
		{
			xNextTaskUnblockTime = xTimeToWake;
		}
	}
}
 80131ae:	1492      	pop      	r4-r5, r15
		vListInsert( ( xList * ) pxDelayedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 80131b0:	10aa      	lrw      	r5, 0x200063cc	// 80131d8 <prvAddCurrentTaskToDelayedList+0x48>
 80131b2:	9500      	ld.w      	r0, (r5, 0x0)
 80131b4:	9320      	ld.w      	r1, (r3, 0x0)
 80131b6:	2103      	addi      	r1, 4
 80131b8:	e3fffbba 	bsr      	0x801292c	// 801292c <vListInsert>
		if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
 80131bc:	9560      	ld.w      	r3, (r5, 0x0)
 80131be:	9360      	ld.w      	r3, (r3, 0x0)
		if( xTimeToWake < xNextTaskUnblockTime )
 80131c0:	1067      	lrw      	r3, 0x20000168	// 80131dc <prvAddCurrentTaskToDelayedList+0x4c>
 80131c2:	9340      	ld.w      	r2, (r3, 0x0)
 80131c4:	6490      	cmphs      	r4, r2
 80131c6:	0bf4      	bt      	0x80131ae	// 80131ae <prvAddCurrentTaskToDelayedList+0x1e>
			xNextTaskUnblockTime = xTimeToWake;
 80131c8:	b380      	st.w      	r4, (r3, 0x0)
}
 80131ca:	07f2      	br      	0x80131ae	// 80131ae <prvAddCurrentTaskToDelayedList+0x1e>
 80131cc:	200063c8 	.long	0x200063c8
 80131d0:	20006950 	.long	0x20006950
 80131d4:	200063d0 	.long	0x200063d0
 80131d8:	200063cc 	.long	0x200063cc
 80131dc:	20000168 	.long	0x20000168

080131e0 <xTaskGenericCreate>:
{
 80131e0:	14d8      	push      	r4-r11, r15
 80131e2:	6e43      	mov      	r9, r0
 80131e4:	6e07      	mov      	r8, r1
 80131e6:	6d4b      	mov      	r5, r2
 80131e8:	6e8f      	mov      	r10, r3
 80131ea:	98c9      	ld.w      	r6, (r14, 0x24)
 80131ec:	98ea      	ld.w      	r7, (r14, 0x28)
 80131ee:	d96e200b 	ld.w      	r11, (r14, 0x2c)
	configASSERT( pxTaskCode );
 80131f2:	e9200009 	bnez      	r0, 0x8013204	// 8013204 <xTaskGenericCreate+0x24>
 80131f6:	ea0201bf 	movi      	r2, 447
 80131fa:	123f      	lrw      	r1, 0x8015d85	// 8013374 <xTaskGenericCreate+0x194>
 80131fc:	121f      	lrw      	r0, 0x8015d25	// 8013378 <xTaskGenericCreate+0x198>
 80131fe:	e00014b7 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013202:	0400      	br      	0x8013202	// 8013202 <xTaskGenericCreate+0x22>
	configASSERT( ( uxPriority < configMAX_PRIORITIES ) );
 8013204:	eb06003e 	cmphsi      	r6, 63
 8013208:	0c08      	bf      	0x8013218	// 8013218 <xTaskGenericCreate+0x38>
 801320a:	32e0      	movi      	r2, 224
 801320c:	4241      	lsli      	r2, r2, 1
 801320e:	123a      	lrw      	r1, 0x8015d85	// 8013374 <xTaskGenericCreate+0x194>
 8013210:	121a      	lrw      	r0, 0x8015d25	// 8013378 <xTaskGenericCreate+0x198>
 8013212:	e00014ad 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013216:	0400      	br      	0x8013216	// 8013216 <xTaskGenericCreate+0x36>
{
tskTCB *pxNewTCB;

	/* Allocate space for the TCB.  Where the memory comes from depends on
	the implementation of the port malloc function. */
	pxNewTCB = ( tskTCB * ) pvPortMalloc( sizeof( tskTCB ) );
 8013218:	304c      	movi      	r0, 76
 801321a:	e3fffadf 	bsr      	0x80127d8	// 80127d8 <pvPortMalloc>
 801321e:	6d03      	mov      	r4, r0

	if( pxNewTCB != NULL )
 8013220:	e900000f 	bez      	r0, 0x801323e	// 801323e <xTaskGenericCreate+0x5e>
	{
		/* Allocate space for the stack used by the task being created.
		The base of the stack memory stored in the TCB so the task can
		be deleted later if required. */
		pxNewTCB->pxStack = ( portSTACK_TYPE * ) pvPortMallocAligned( ( ( ( size_t )usStackDepth ) * sizeof( portSTACK_TYPE ) ), puxStackBuffer );
 8013224:	e92b0006 	bnez      	r11, 0x8013230	// 8013230 <xTaskGenericCreate+0x50>
 8013228:	4502      	lsli      	r0, r5, 2
 801322a:	e3fffad7 	bsr      	0x80127d8	// 80127d8 <pvPortMalloc>
 801322e:	6ec3      	mov      	r11, r0
 8013230:	dd64200c 	st.w      	r11, (r4, 0x30)

		if( pxNewTCB->pxStack == NULL )
 8013234:	e92b0008 	bnez      	r11, 0x8013244	// 8013244 <xTaskGenericCreate+0x64>
		{
			/* Could not allocate the stack.  Delete the allocated TCB. */
			vPortFree( pxNewTCB );
 8013238:	6c13      	mov      	r0, r4
 801323a:	e3fffb31 	bsr      	0x801289c	// 801289c <vPortFree>
		xReturn = errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY;
 801323e:	3000      	movi      	r0, 0
 8013240:	2800      	subi      	r0, 1
}
 8013242:	1498      	pop      	r4-r11, r15
			pxNewTCB = NULL;
		}
		else
		{
			pxNewTCB->stacksize = ( size_t ) usStackDepth * sizeof( portSTACK_TYPE );
 8013244:	45a2      	lsli      	r5, r5, 2
			/* Just to help debugging. */
			memset( pxNewTCB->pxStack, ( int ) tskSTACK_FILL_BYTE, ( size_t ) usStackDepth * sizeof( portSTACK_TYPE ) );
 8013246:	6c97      	mov      	r2, r5
			pxNewTCB->stacksize = ( size_t ) usStackDepth * sizeof( portSTACK_TYPE );
 8013248:	b4ad      	st.w      	r5, (r4, 0x34)
			memset( pxNewTCB->pxStack, ( int ) tskSTACK_FILL_BYTE, ( size_t ) usStackDepth * sizeof( portSTACK_TYPE ) );
 801324a:	31a5      	movi      	r1, 165
 801324c:	6c2f      	mov      	r0, r11
 801324e:	e3fff3ad 	bsr      	0x80119a8	// 80119a8 <__memset_fast>

			pxNewTCB->freeStackfunc = NULL;
 8013252:	3300      	movi      	r3, 0
 8013254:	b472      	st.w      	r3, (r4, 0x48)
			pxTopOfStack = pxNewTCB->pxStack + ( usStackDepth - ( unsigned short ) 1 );
 8013256:	2d03      	subi      	r5, 4
 8013258:	944c      	ld.w      	r2, (r4, 0x30)
			pxTopOfStack = ( portSTACK_TYPE * ) ( ( ( portPOINTER_SIZE_TYPE ) pxTopOfStack ) & ( ( portPOINTER_SIZE_TYPE ) ~portBYTE_ALIGNMENT_MASK  ) );
 801325a:	3300      	movi      	r3, 0
			pxTopOfStack = pxNewTCB->pxStack + ( usStackDepth - ( unsigned short ) 1 );
 801325c:	6148      	addu      	r5, r2
			pxTopOfStack = ( portSTACK_TYPE * ) ( ( ( portPOINTER_SIZE_TYPE ) pxTopOfStack ) & ( ( portPOINTER_SIZE_TYPE ) ~portBYTE_ALIGNMENT_MASK  ) );
 801325e:	2b07      	subi      	r3, 8
 8013260:	694c      	and      	r5, r3
		if(NULL == pcName)
 8013262:	e9280078 	bnez      	r8, 0x8013352	// 8013352 <xTaskGenericCreate+0x172>
			*( char * ) pxTCB->pcTaskName = (char)(configMAX_PRIORITIES - uxPriority);
 8013266:	333f      	movi      	r3, 63
 8013268:	60da      	subu      	r3, r6
 801326a:	dc640038 	st.b      	r3, (r4, 0x38)
	pxTCB->pcTaskName[ ( unsigned short ) configMAX_TASK_NAME_LEN - ( unsigned short ) 1 ] = ( signed char ) '\0';
 801326e:	3300      	movi      	r3, 0
	vListInitialiseItem( &( pxTCB->xGenericListItem ) );
 8013270:	e5040003 	addi      	r8, r4, 4
	pxTCB->pcTaskName[ ( unsigned short ) configMAX_TASK_NAME_LEN - ( unsigned short ) 1 ] = ( signed char ) '\0';
 8013274:	dc64003f 	st.b      	r3, (r4, 0x3f)
	vListInitialiseItem( &( pxTCB->xGenericListItem ) );
 8013278:	6c23      	mov      	r0, r8
	pxTCB->uxPriority = uxPriority;
 801327a:	b4cb      	st.w      	r6, (r4, 0x2c)
		pxTCB->uxBasePriority = uxPriority;
 801327c:	b4d1      	st.w      	r6, (r4, 0x44)
	vListInitialiseItem( &( pxTCB->xGenericListItem ) );
 801327e:	e3fffb45 	bsr      	0x8012908	// 8012908 <vListInitialiseItem>
	vListInitialiseItem( &( pxTCB->xEventListItem ) );
 8013282:	e4040017 	addi      	r0, r4, 24
 8013286:	e3fffb41 	bsr      	0x8012908	// 8012908 <vListInitialiseItem>
	listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) uxPriority );
 801328a:	333f      	movi      	r3, 63
 801328c:	60da      	subu      	r3, r6
	listSET_LIST_ITEM_OWNER( &( pxTCB->xGenericListItem ), pxTCB );
 801328e:	b484      	st.w      	r4, (r4, 0x10)
	listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) uxPriority );
 8013290:	b466      	st.w      	r3, (r4, 0x18)
	listSET_LIST_ITEM_OWNER( &( pxTCB->xEventListItem ), pxTCB );
 8013292:	b489      	st.w      	r4, (r4, 0x24)
			pxNewTCB->pxTopOfStack = pxPortInitialiseStack( pxTopOfStack, pxTaskCode, pvParameters );
 8013294:	6cab      	mov      	r2, r10
 8013296:	6c67      	mov      	r1, r9
 8013298:	6c17      	mov      	r0, r5
 801329a:	e0000879 	bsr      	0x801438c	// 801438c <pxPortInitialiseStack>
 801329e:	b400      	st.w      	r0, (r4, 0x0)
		if( ( void * ) pxCreatedTask != NULL )
 80132a0:	e9070003 	bez      	r7, 0x80132a6	// 80132a6 <xTaskGenericCreate+0xc6>
			*pxCreatedTask = ( xTaskHandle ) pxNewTCB;
 80132a4:	b780      	st.w      	r4, (r7, 0x0)
		taskENTER_CRITICAL();
 80132a6:	e000096f 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
			uxCurrentNumberOfTasks++;
 80132aa:	1175      	lrw      	r3, 0x200068c0	// 801337c <xTaskGenericCreate+0x19c>
			if( pxCurrentTCB == NULL )
 80132ac:	11b5      	lrw      	r5, 0x200063c8	// 8013380 <xTaskGenericCreate+0x1a0>
 80132ae:	ea890036 	lrw      	r9, 0x200063d4	// 8013384 <xTaskGenericCreate+0x1a4>
			uxCurrentNumberOfTasks++;
 80132b2:	9340      	ld.w      	r2, (r3, 0x0)
 80132b4:	2200      	addi      	r2, 1
 80132b6:	b340      	st.w      	r2, (r3, 0x0)
			if( pxCurrentTCB == NULL )
 80132b8:	95e0      	ld.w      	r7, (r5, 0x0)
 80132ba:	e9270053 	bnez      	r7, 0x8013360	// 8013360 <xTaskGenericCreate+0x180>
				pxCurrentTCB =  pxNewTCB;
 80132be:	b580      	st.w      	r4, (r5, 0x0)
				if( uxCurrentNumberOfTasks == ( unsigned portBASE_TYPE ) 1 )
 80132c0:	9360      	ld.w      	r3, (r3, 0x0)
 80132c2:	3b41      	cmpnei      	r3, 1
 80132c4:	0820      	bt      	0x8013304	// 8013304 <xTaskGenericCreate+0x124>
		vListInitialise( ( xList * ) &( pxReadyTasksLists[ uxPriority ] ) );
 80132c6:	c4e90020 	addu      	r0, r9, r7
 80132ca:	2713      	addi      	r7, 20
 80132cc:	e3fffb14 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
	for( uxPriority = ( unsigned portBASE_TYPE ) 0U; uxPriority < configMAX_PRIORITIES; uxPriority++ )
 80132d0:	eb4704ec 	cmpnei      	r7, 1260
 80132d4:	0bf9      	bt      	0x80132c6	// 80132c6 <xTaskGenericCreate+0xe6>
	vListInitialise( ( xList * ) &xDelayedTaskList1 );
 80132d6:	ea8a002d 	lrw      	r10, 0x200068dc	// 8013388 <xTaskGenericCreate+0x1a8>
 80132da:	6c2b      	mov      	r0, r10
	vListInitialise( ( xList * ) &xDelayedTaskList2 );
 80132dc:	11ec      	lrw      	r7, 0x200068f0	// 801338c <xTaskGenericCreate+0x1ac>
	vListInitialise( ( xList * ) &xDelayedTaskList1 );
 80132de:	e3fffb0b 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
	vListInitialise( ( xList * ) &xDelayedTaskList2 );
 80132e2:	6c1f      	mov      	r0, r7
 80132e4:	e3fffb08 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
	vListInitialise( ( xList * ) &xPendingReadyList );
 80132e8:	110a      	lrw      	r0, 0x20006910	// 8013390 <xTaskGenericCreate+0x1b0>
 80132ea:	e3fffb05 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
		vListInitialise( ( xList * ) &xTasksWaitingTermination );
 80132ee:	110a      	lrw      	r0, 0x2000693c	// 8013394 <xTaskGenericCreate+0x1b4>
 80132f0:	e3fffb02 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
		vListInitialise( ( xList * ) &xSuspendedTaskList );
 80132f4:	1109      	lrw      	r0, 0x20006928	// 8013398 <xTaskGenericCreate+0x1b8>
 80132f6:	e3fffaff 	bsr      	0x80128f4	// 80128f4 <vListInitialise>
	pxDelayedTaskList = &xDelayedTaskList1;
 80132fa:	1169      	lrw      	r3, 0x200063cc	// 801339c <xTaskGenericCreate+0x1bc>
 80132fc:	dd432000 	st.w      	r10, (r3, 0x0)
	pxOverflowDelayedTaskList = &xDelayedTaskList2;
 8013300:	1168      	lrw      	r3, 0x200063d0	// 80133a0 <xTaskGenericCreate+0x1c0>
 8013302:	b3e0      	st.w      	r7, (r3, 0x0)
			if( pxNewTCB->uxPriority > uxTopUsedPriority )
 8013304:	1148      	lrw      	r2, 0x200068d8	// 80133a4 <xTaskGenericCreate+0x1c4>
 8013306:	946b      	ld.w      	r3, (r4, 0x2c)
 8013308:	9220      	ld.w      	r1, (r2, 0x0)
 801330a:	64c4      	cmphs      	r1, r3
 801330c:	0802      	bt      	0x8013310	// 8013310 <xTaskGenericCreate+0x130>
				uxTopUsedPriority = pxNewTCB->uxPriority;
 801330e:	b260      	st.w      	r3, (r2, 0x0)
				pxNewTCB->uxTCBNumber = uxTaskNumber;
 8013310:	1126      	lrw      	r1, 0x200068cc	// 80133a8 <xTaskGenericCreate+0x1c8>
 8013312:	9140      	ld.w      	r2, (r1, 0x0)
 8013314:	b450      	st.w      	r2, (r4, 0x40)
			uxTaskNumber++;
 8013316:	2200      	addi      	r2, 1
 8013318:	b140      	st.w      	r2, (r1, 0x0)
			prvAddTaskToReadyQueue( pxNewTCB );
 801331a:	1145      	lrw      	r2, 0x200068d4	// 80133ac <xTaskGenericCreate+0x1cc>
 801331c:	9220      	ld.w      	r1, (r2, 0x0)
 801331e:	64c4      	cmphs      	r1, r3
 8013320:	0802      	bt      	0x8013324	// 8013324 <xTaskGenericCreate+0x144>
 8013322:	b260      	st.w      	r3, (r2, 0x0)
 8013324:	3214      	movi      	r2, 20
 8013326:	6c27      	mov      	r0, r9
 8013328:	f8438440 	mula.32.l      	r0, r3, r2
 801332c:	6c63      	mov      	r1, r8
 801332e:	e3fffaf1 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
		taskEXIT_CRITICAL();
 8013332:	e0000933 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
		if( xSchedulerRunning != pdFALSE )
 8013336:	107f      	lrw      	r3, 0x20006924	// 80133b0 <xTaskGenericCreate+0x1d0>
 8013338:	9360      	ld.w      	r3, (r3, 0x0)
 801333a:	e903000a 	bez      	r3, 0x801334e	// 801334e <xTaskGenericCreate+0x16e>
			if( pxCurrentTCB->uxPriority < uxPriority )
 801333e:	9560      	ld.w      	r3, (r5, 0x0)
 8013340:	936b      	ld.w      	r3, (r3, 0x2c)
 8013342:	658c      	cmphs      	r3, r6
 8013344:	0805      	bt      	0x801334e	// 801334e <xTaskGenericCreate+0x16e>
				portYIELD_WITHIN_API();
 8013346:	e3ffe8dd 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 801334a:	6c03      	mov      	r0, r0
 801334c:	6c03      	mov      	r0, r0
 801334e:	3001      	movi      	r0, 1
	return xReturn;
 8013350:	0779      	br      	0x8013242	// 8013242 <xTaskGenericCreate+0x62>
			strncpy( ( char * ) pxTCB->pcTaskName, ( const char * ) pcName, ( unsigned short ) configMAX_TASK_NAME_LEN );
 8013352:	3208      	movi      	r2, 8
 8013354:	6c63      	mov      	r1, r8
 8013356:	e4040037 	addi      	r0, r4, 56
 801335a:	e3fff3b7 	bsr      	0x8011ac8	// 8011ac8 <__GI_strncpy>
 801335e:	0788      	br      	0x801326e	// 801326e <xTaskGenericCreate+0x8e>
				if( xSchedulerRunning == pdFALSE )
 8013360:	1074      	lrw      	r3, 0x20006924	// 80133b0 <xTaskGenericCreate+0x1d0>
 8013362:	9360      	ld.w      	r3, (r3, 0x0)
 8013364:	e923ffd0 	bnez      	r3, 0x8013304	// 8013304 <xTaskGenericCreate+0x124>
					if( pxCurrentTCB->uxPriority <= uxPriority )
 8013368:	9560      	ld.w      	r3, (r5, 0x0)
 801336a:	936b      	ld.w      	r3, (r3, 0x2c)
 801336c:	64d8      	cmphs      	r6, r3
 801336e:	0fcb      	bf      	0x8013304	// 8013304 <xTaskGenericCreate+0x124>
						pxCurrentTCB = pxNewTCB;
 8013370:	b580      	st.w      	r4, (r5, 0x0)
 8013372:	07c9      	br      	0x8013304	// 8013304 <xTaskGenericCreate+0x124>
 8013374:	08015d85 	.long	0x08015d85
 8013378:	08015d25 	.long	0x08015d25
 801337c:	200068c0 	.long	0x200068c0
 8013380:	200063c8 	.long	0x200063c8
 8013384:	200063d4 	.long	0x200063d4
 8013388:	200068dc 	.long	0x200068dc
 801338c:	200068f0 	.long	0x200068f0
 8013390:	20006910 	.long	0x20006910
 8013394:	2000693c 	.long	0x2000693c
 8013398:	20006928 	.long	0x20006928
 801339c:	200063cc 	.long	0x200063cc
 80133a0:	200063d0 	.long	0x200063d0
 80133a4:	200068d8 	.long	0x200068d8
 80133a8:	200068cc 	.long	0x200068cc
 80133ac:	200068d4 	.long	0x200068d4
 80133b0:	20006924 	.long	0x20006924

080133b4 <vTaskStartScheduler>:
{
 80133b4:	14d1      	push      	r4, r15
 80133b6:	1424      	subi      	r14, r14, 16
		xReturn = xTaskCreate( prvIdleTask, ( signed char * ) "IDLE", tskIDLE_STACK_SIZE, ( void * ) NULL, ( tskIDLE_PRIORITY | portPRIVILEGE_BIT ), &xIdleTaskHandle );
 80133b8:	3400      	movi      	r4, 0
 80133ba:	1073      	lrw      	r3, 0x20006904	// 8013404 <vTaskStartScheduler+0x50>
 80133bc:	325a      	movi      	r2, 90
 80133be:	b861      	st.w      	r3, (r14, 0x4)
 80133c0:	b883      	st.w      	r4, (r14, 0xc)
 80133c2:	b882      	st.w      	r4, (r14, 0x8)
 80133c4:	b880      	st.w      	r4, (r14, 0x0)
 80133c6:	6cd3      	mov      	r3, r4
 80133c8:	1030      	lrw      	r1, 0x8015d80	// 8013408 <vTaskStartScheduler+0x54>
 80133ca:	1011      	lrw      	r0, 0x801367c	// 801340c <vTaskStartScheduler+0x58>
 80133cc:	e3ffff0a 	bsr      	0x80131e0	// 80131e0 <xTaskGenericCreate>
		if( xReturn == pdPASS )
 80133d0:	3841      	cmpnei      	r0, 1
 80133d2:	080f      	bt      	0x80133f0	// 80133f0 <vTaskStartScheduler+0x3c>
			xReturn = xTimerCreateTimerTask();
 80133d4:	e3fffd80 	bsr      	0x8012ed4	// 8012ed4 <xTimerCreateTimerTask>
	if( xReturn == pdPASS )
 80133d8:	3841      	cmpnei      	r0, 1
 80133da:	080b      	bt      	0x80133f0	// 80133f0 <vTaskStartScheduler+0x3c>
 80133dc:	c0807020 	psrclr      	ie
		xSchedulerRunning = pdTRUE;
 80133e0:	106c      	lrw      	r3, 0x20006924	// 8013410 <vTaskStartScheduler+0x5c>
 80133e2:	b300      	st.w      	r0, (r3, 0x0)
		xTickCount = ( portTickType ) 0U;
 80133e4:	106c      	lrw      	r3, 0x20006950	// 8013414 <vTaskStartScheduler+0x60>
 80133e6:	b380      	st.w      	r4, (r3, 0x0)
		if( xPortStartScheduler() != pdFALSE )
 80133e8:	e00008c4 	bsr      	0x8014570	// 8014570 <xPortStartScheduler>
}
 80133ec:	1404      	addi      	r14, r14, 16
 80133ee:	1491      	pop      	r4, r15
	configASSERT( xReturn );
 80133f0:	e920fffe 	bnez      	r0, 0x80133ec	// 80133ec <vTaskStartScheduler+0x38>
 80133f4:	ea0204fc 	movi      	r2, 1276
 80133f8:	1028      	lrw      	r1, 0x8015d85	// 8013418 <vTaskStartScheduler+0x64>
 80133fa:	1009      	lrw      	r0, 0x8015d25	// 801341c <vTaskStartScheduler+0x68>
 80133fc:	e00013b8 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013400:	0400      	br      	0x8013400	// 8013400 <vTaskStartScheduler+0x4c>
 8013402:	0000      	.short	0x0000
 8013404:	20006904 	.long	0x20006904
 8013408:	08015d80 	.long	0x08015d80
 801340c:	0801367c 	.long	0x0801367c
 8013410:	20006924 	.long	0x20006924
 8013414:	20006950 	.long	0x20006950
 8013418:	08015d85 	.long	0x08015d85
 801341c:	08015d25 	.long	0x08015d25

08013420 <vTaskSuspendAll>:
	++uxSchedulerSuspended;
 8013420:	1043      	lrw      	r2, 0x200068c8	// 801342c <vTaskSuspendAll+0xc>
 8013422:	9260      	ld.w      	r3, (r2, 0x0)
 8013424:	2300      	addi      	r3, 1
 8013426:	b260      	st.w      	r3, (r2, 0x0)
}
 8013428:	783c      	jmp      	r15
 801342a:	0000      	.short	0x0000
 801342c:	200068c8 	.long	0x200068c8

08013430 <xTaskGetTickCount>:
{
 8013430:	14d1      	push      	r4, r15
	taskENTER_CRITICAL();
 8013432:	e00008a9 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		xTicks = xTickCount;
 8013436:	1064      	lrw      	r3, 0x20006950	// 8013444 <xTaskGetTickCount+0x14>
 8013438:	9380      	ld.w      	r4, (r3, 0x0)
	taskEXIT_CRITICAL();
 801343a:	e00008af 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
}
 801343e:	6c13      	mov      	r0, r4
 8013440:	1491      	pop      	r4, r15
 8013442:	0000      	.short	0x0000
 8013444:	20006950 	.long	0x20006950

08013448 <vTaskIncrementTick>:
{
 8013448:	14d8      	push      	r4-r11, r15
	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
 801344a:	1176      	lrw      	r3, 0x200068c8	// 8013520 <vTaskIncrementTick+0xd8>
 801344c:	9360      	ld.w      	r3, (r3, 0x0)
 801344e:	e9230063 	bnez      	r3, 0x8013514	// 8013514 <vTaskIncrementTick+0xcc>
			++xTickCount;
 8013452:	1175      	lrw      	r3, 0x20006950	// 8013524 <vTaskIncrementTick+0xdc>
 8013454:	6d8f      	mov      	r6, r3
 8013456:	9340      	ld.w      	r2, (r3, 0x0)
 8013458:	2200      	addi      	r2, 1
 801345a:	b340      	st.w      	r2, (r3, 0x0)
		if( xTickCount == ( portTickType ) 0U )
 801345c:	9340      	ld.w      	r2, (r3, 0x0)
 801345e:	e922001f 	bnez      	r2, 0x801349c	// 801349c <vTaskIncrementTick+0x54>
			configASSERT( ( listLIST_IS_EMPTY( pxDelayedTaskList ) ) );
 8013462:	1172      	lrw      	r3, 0x200063cc	// 8013528 <vTaskIncrementTick+0xe0>
 8013464:	9340      	ld.w      	r2, (r3, 0x0)
 8013466:	9240      	ld.w      	r2, (r2, 0x0)
 8013468:	e9020009 	bez      	r2, 0x801347a	// 801347a <vTaskIncrementTick+0x32>
 801346c:	32ce      	movi      	r2, 206
 801346e:	4243      	lsli      	r2, r2, 3
 8013470:	112f      	lrw      	r1, 0x8015d85	// 801352c <vTaskIncrementTick+0xe4>
 8013472:	1110      	lrw      	r0, 0x8015d25	// 8013530 <vTaskIncrementTick+0xe8>
 8013474:	e000137c 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013478:	0400      	br      	0x8013478	// 8013478 <vTaskIncrementTick+0x30>
			pxDelayedTaskList = pxOverflowDelayedTaskList;
 801347a:	114f      	lrw      	r2, 0x200063d0	// 8013534 <vTaskIncrementTick+0xec>
			pxTemp = pxDelayedTaskList;
 801347c:	9320      	ld.w      	r1, (r3, 0x0)
			pxDelayedTaskList = pxOverflowDelayedTaskList;
 801347e:	9200      	ld.w      	r0, (r2, 0x0)
 8013480:	b300      	st.w      	r0, (r3, 0x0)
			pxOverflowDelayedTaskList = pxTemp;
 8013482:	b220      	st.w      	r1, (r2, 0x0)
			xNumOfOverflows++;
 8013484:	112d      	lrw      	r1, 0x2000690c	// 8013538 <vTaskIncrementTick+0xf0>
 8013486:	9140      	ld.w      	r2, (r1, 0x0)
 8013488:	2200      	addi      	r2, 1
 801348a:	b140      	st.w      	r2, (r1, 0x0)
			if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
 801348c:	9340      	ld.w      	r2, (r3, 0x0)
 801348e:	9220      	ld.w      	r1, (r2, 0x0)
 8013490:	114b      	lrw      	r2, 0x20000168	// 801353c <vTaskIncrementTick+0xf4>
 8013492:	e921001b 	bnez      	r1, 0x80134c8	// 80134c8 <vTaskIncrementTick+0x80>
				xNextTaskUnblockTime = portMAX_DELAY;
 8013496:	3300      	movi      	r3, 0
 8013498:	2b00      	subi      	r3, 1
				xNextTaskUnblockTime = listGET_LIST_ITEM_VALUE( &( pxTCB->xGenericListItem ) );
 801349a:	b260      	st.w      	r3, (r2, 0x0)
		prvCheckDelayedTasks();
 801349c:	1188      	lrw      	r4, 0x20000168	// 801353c <vTaskIncrementTick+0xf4>
 801349e:	9640      	ld.w      	r2, (r6, 0x0)
 80134a0:	9460      	ld.w      	r3, (r4, 0x0)
 80134a2:	64c8      	cmphs      	r2, r3
 80134a4:	0c11      	bf      	0x80134c6	// 80134c6 <vTaskIncrementTick+0x7e>
 80134a6:	ea880021 	lrw      	r8, 0x200063cc	// 8013528 <vTaskIncrementTick+0xe0>
 80134aa:	ea890026 	lrw      	r9, 0x200068d4	// 8013540 <vTaskIncrementTick+0xf8>
 80134ae:	ea8a0026 	lrw      	r10, 0x200063d4	// 8013544 <vTaskIncrementTick+0xfc>
 80134b2:	ea0b0014 	movi      	r11, 20
 80134b6:	d8682000 	ld.w      	r3, (r8, 0x0)
 80134ba:	9360      	ld.w      	r3, (r3, 0x0)
 80134bc:	e923000b 	bnez      	r3, 0x80134d2	// 80134d2 <vTaskIncrementTick+0x8a>
 80134c0:	3300      	movi      	r3, 0
 80134c2:	2b00      	subi      	r3, 1
 80134c4:	b460      	st.w      	r3, (r4, 0x0)
}
 80134c6:	1498      	pop      	r4-r11, r15
				pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxDelayedTaskList );
 80134c8:	9360      	ld.w      	r3, (r3, 0x0)
 80134ca:	9363      	ld.w      	r3, (r3, 0xc)
 80134cc:	9363      	ld.w      	r3, (r3, 0xc)
				xNextTaskUnblockTime = listGET_LIST_ITEM_VALUE( &( pxTCB->xGenericListItem ) );
 80134ce:	9361      	ld.w      	r3, (r3, 0x4)
 80134d0:	07e5      	br      	0x801349a	// 801349a <vTaskIncrementTick+0x52>
		prvCheckDelayedTasks();
 80134d2:	d8682000 	ld.w      	r3, (r8, 0x0)
 80134d6:	9363      	ld.w      	r3, (r3, 0xc)
 80134d8:	93a3      	ld.w      	r5, (r3, 0xc)
 80134da:	9640      	ld.w      	r2, (r6, 0x0)
 80134dc:	9561      	ld.w      	r3, (r5, 0x4)
 80134de:	64c8      	cmphs      	r2, r3
 80134e0:	0ff2      	bf      	0x80134c4	// 80134c4 <vTaskIncrementTick+0x7c>
 80134e2:	5dee      	addi      	r7, r5, 4
 80134e4:	6c1f      	mov      	r0, r7
 80134e6:	e3fffa3d 	bsr      	0x8012960	// 8012960 <vListRemove>
 80134ea:	956a      	ld.w      	r3, (r5, 0x28)
 80134ec:	e9030006 	bez      	r3, 0x80134f8	// 80134f8 <vTaskIncrementTick+0xb0>
 80134f0:	e4050017 	addi      	r0, r5, 24
 80134f4:	e3fffa36 	bsr      	0x8012960	// 8012960 <vListRemove>
 80134f8:	956b      	ld.w      	r3, (r5, 0x2c)
 80134fa:	d8492000 	ld.w      	r2, (r9, 0x0)
 80134fe:	64c8      	cmphs      	r2, r3
 8013500:	0803      	bt      	0x8013506	// 8013506 <vTaskIncrementTick+0xbe>
 8013502:	dc692000 	st.w      	r3, (r9, 0x0)
 8013506:	6c2b      	mov      	r0, r10
 8013508:	6c5f      	mov      	r1, r7
 801350a:	f9638440 	mula.32.l      	r0, r3, r11
 801350e:	e3fffa01 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
 8013512:	07d2      	br      	0x80134b6	// 80134b6 <vTaskIncrementTick+0x6e>
		++uxMissedTicks;
 8013514:	104d      	lrw      	r2, 0x200068c4	// 8013548 <vTaskIncrementTick+0x100>
 8013516:	9260      	ld.w      	r3, (r2, 0x0)
 8013518:	2300      	addi      	r3, 1
 801351a:	b260      	st.w      	r3, (r2, 0x0)
}
 801351c:	07d5      	br      	0x80134c6	// 80134c6 <vTaskIncrementTick+0x7e>
 801351e:	0000      	.short	0x0000
 8013520:	200068c8 	.long	0x200068c8
 8013524:	20006950 	.long	0x20006950
 8013528:	200063cc 	.long	0x200063cc
 801352c:	08015d85 	.long	0x08015d85
 8013530:	08015d25 	.long	0x08015d25
 8013534:	200063d0 	.long	0x200063d0
 8013538:	2000690c 	.long	0x2000690c
 801353c:	20000168 	.long	0x20000168
 8013540:	200068d4 	.long	0x200068d4
 8013544:	200063d4 	.long	0x200063d4
 8013548:	200068c4 	.long	0x200068c4

0801354c <xTaskResumeAll>:
{
 801354c:	14d8      	push      	r4-r11, r15
	configASSERT( uxSchedulerSuspended );
 801354e:	1192      	lrw      	r4, 0x200068c8	// 8013614 <xTaskResumeAll+0xc8>
 8013550:	9460      	ld.w      	r3, (r4, 0x0)
 8013552:	e9230009 	bnez      	r3, 0x8013564	// 8013564 <xTaskResumeAll+0x18>
 8013556:	ea02051a 	movi      	r2, 1306
 801355a:	1130      	lrw      	r1, 0x8015d85	// 8013618 <xTaskResumeAll+0xcc>
 801355c:	1110      	lrw      	r0, 0x8015d25	// 801361c <xTaskResumeAll+0xd0>
 801355e:	e0001307 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013562:	0400      	br      	0x8013562	// 8013562 <xTaskResumeAll+0x16>
	taskENTER_CRITICAL();
 8013564:	e0000810 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
		--uxSchedulerSuspended;
 8013568:	9460      	ld.w      	r3, (r4, 0x0)
 801356a:	2b00      	subi      	r3, 1
 801356c:	b460      	st.w      	r3, (r4, 0x0)
		if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
 801356e:	9480      	ld.w      	r4, (r4, 0x0)
 8013570:	e9040007 	bez      	r4, 0x801357e	// 801357e <xTaskResumeAll+0x32>
signed portBASE_TYPE xAlreadyYielded = pdFALSE;
 8013574:	3400      	movi      	r4, 0
	taskEXIT_CRITICAL();
 8013576:	e0000811 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
}
 801357a:	6c13      	mov      	r0, r4
 801357c:	1498      	pop      	r4-r11, r15
			if( uxCurrentNumberOfTasks > ( unsigned portBASE_TYPE ) 0U )
 801357e:	1169      	lrw      	r3, 0x200068c0	// 8013620 <xTaskResumeAll+0xd4>
 8013580:	9360      	ld.w      	r3, (r3, 0x0)
 8013582:	e903fff9 	bez      	r3, 0x8013574	// 8013574 <xTaskResumeAll+0x28>
				while( listLIST_IS_EMPTY( ( xList * ) &xPendingReadyList ) == pdFALSE )
 8013586:	11c8      	lrw      	r6, 0x20006910	// 8013624 <xTaskResumeAll+0xd8>
					prvAddTaskToReadyQueue( pxTCB );
 8013588:	11e8      	lrw      	r7, 0x200068d4	// 8013628 <xTaskResumeAll+0xdc>
 801358a:	ea890029 	lrw      	r9, 0x200063d4	// 801362c <xTaskResumeAll+0xe0>
 801358e:	ea0a0014 	movi      	r10, 20
					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
 8013592:	ea8b0028 	lrw      	r11, 0x200063c8	// 8013630 <xTaskResumeAll+0xe4>
				while( listLIST_IS_EMPTY( ( xList * ) &xPendingReadyList ) == pdFALSE )
 8013596:	9660      	ld.w      	r3, (r6, 0x0)
 8013598:	e923000d 	bnez      	r3, 0x80135b2	// 80135b2 <xTaskResumeAll+0x66>
				if( uxMissedTicks > ( unsigned portBASE_TYPE ) 0U )
 801359c:	11a6      	lrw      	r5, 0x200068c4	// 8013634 <xTaskResumeAll+0xe8>
 801359e:	9560      	ld.w      	r3, (r5, 0x0)
 80135a0:	e923002d 	bnez      	r3, 0x80135fa	// 80135fa <xTaskResumeAll+0xae>
				if( ( xYieldRequired == pdTRUE ) || ( xMissedYield == pdTRUE ) )
 80135a4:	3c41      	cmpnei      	r4, 1
 80135a6:	0c2d      	bf      	0x8013600	// 8013600 <xTaskResumeAll+0xb4>
 80135a8:	1164      	lrw      	r3, 0x20006908	// 8013638 <xTaskResumeAll+0xec>
 80135aa:	9360      	ld.w      	r3, (r3, 0x0)
 80135ac:	3b41      	cmpnei      	r3, 1
 80135ae:	0be3      	bt      	0x8013574	// 8013574 <xTaskResumeAll+0x28>
 80135b0:	0428      	br      	0x8013600	// 8013600 <xTaskResumeAll+0xb4>
					pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY(  ( ( xList * ) &xPendingReadyList ) );
 80135b2:	9663      	ld.w      	r3, (r6, 0xc)
 80135b4:	93a3      	ld.w      	r5, (r3, 0xc)
					vListRemove( &( pxTCB->xEventListItem ) );
 80135b6:	e4050017 	addi      	r0, r5, 24
					vListRemove( &( pxTCB->xGenericListItem ) );
 80135ba:	e5050003 	addi      	r8, r5, 4
					vListRemove( &( pxTCB->xEventListItem ) );
 80135be:	e3fff9d1 	bsr      	0x8012960	// 8012960 <vListRemove>
					vListRemove( &( pxTCB->xGenericListItem ) );
 80135c2:	6c23      	mov      	r0, r8
 80135c4:	e3fff9ce 	bsr      	0x8012960	// 8012960 <vListRemove>
					prvAddTaskToReadyQueue( pxTCB );
 80135c8:	956b      	ld.w      	r3, (r5, 0x2c)
 80135ca:	9740      	ld.w      	r2, (r7, 0x0)
 80135cc:	64c8      	cmphs      	r2, r3
 80135ce:	0802      	bt      	0x80135d2	// 80135d2 <xTaskResumeAll+0x86>
 80135d0:	b760      	st.w      	r3, (r7, 0x0)
 80135d2:	6c27      	mov      	r0, r9
 80135d4:	f9438440 	mula.32.l      	r0, r3, r10
 80135d8:	6c63      	mov      	r1, r8
 80135da:	e3fff99b 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
					if( pxTCB->uxPriority >= pxCurrentTCB->uxPriority )
 80135de:	d86b2000 	ld.w      	r3, (r11, 0x0)
 80135e2:	954b      	ld.w      	r2, (r5, 0x2c)
 80135e4:	936b      	ld.w      	r3, (r3, 0x2c)
						xYieldRequired = pdTRUE;
 80135e6:	64c8      	cmphs      	r2, r3
 80135e8:	3301      	movi      	r3, 1
 80135ea:	c4830c40 	inct      	r4, r3, 0
 80135ee:	07d4      	br      	0x8013596	// 8013596 <xTaskResumeAll+0x4a>
						vTaskIncrementTick();
 80135f0:	e3ffff2c 	bsr      	0x8013448	// 8013448 <vTaskIncrementTick>
						--uxMissedTicks;
 80135f4:	9560      	ld.w      	r3, (r5, 0x0)
 80135f6:	2b00      	subi      	r3, 1
 80135f8:	b560      	st.w      	r3, (r5, 0x0)
					while( uxMissedTicks > ( unsigned portBASE_TYPE ) 0U )
 80135fa:	9560      	ld.w      	r3, (r5, 0x0)
 80135fc:	e923fffa 	bnez      	r3, 0x80135f0	// 80135f0 <xTaskResumeAll+0xa4>
					xMissedYield = pdFALSE;
 8013600:	106e      	lrw      	r3, 0x20006908	// 8013638 <xTaskResumeAll+0xec>
 8013602:	3200      	movi      	r2, 0
 8013604:	b340      	st.w      	r2, (r3, 0x0)
					portYIELD_WITHIN_API();
 8013606:	e3ffe77d 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 801360a:	6c03      	mov      	r0, r0
 801360c:	6c03      	mov      	r0, r0
					xAlreadyYielded = pdTRUE;
 801360e:	3401      	movi      	r4, 1
 8013610:	07b3      	br      	0x8013576	// 8013576 <xTaskResumeAll+0x2a>
 8013612:	0000      	.short	0x0000
 8013614:	200068c8 	.long	0x200068c8
 8013618:	08015d85 	.long	0x08015d85
 801361c:	08015d25 	.long	0x08015d25
 8013620:	200068c0 	.long	0x200068c0
 8013624:	20006910 	.long	0x20006910
 8013628:	200068d4 	.long	0x200068d4
 801362c:	200063d4 	.long	0x200063d4
 8013630:	200063c8 	.long	0x200063c8
 8013634:	200068c4 	.long	0x200068c4
 8013638:	20006908 	.long	0x20006908

0801363c <vTaskDelay>:
	{
 801363c:	14d1      	push      	r4, r15
 801363e:	6d03      	mov      	r4, r0
		if( xTicksToDelay > ( portTickType ) 0U )
 8013640:	e9200007 	bnez      	r0, 0x801364e	// 801364e <vTaskDelay+0x12>
			portYIELD_WITHIN_API();
 8013644:	e3ffe75e 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 8013648:	6c03      	mov      	r0, r0
 801364a:	6c03      	mov      	r0, r0
	}
 801364c:	1491      	pop      	r4, r15
			vTaskSuspendAll();
 801364e:	e3fffee9 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
				xTimeToWake = xTickCount + xTicksToDelay;
 8013652:	1069      	lrw      	r3, 0x20006950	// 8013674 <vTaskDelay+0x38>
 8013654:	9300      	ld.w      	r0, (r3, 0x0)
 8013656:	6100      	addu      	r4, r0
				vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 8013658:	1068      	lrw      	r3, 0x200063c8	// 8013678 <vTaskDelay+0x3c>
 801365a:	9300      	ld.w      	r0, (r3, 0x0)
 801365c:	2003      	addi      	r0, 4
 801365e:	e3fff981 	bsr      	0x8012960	// 8012960 <vListRemove>
				prvAddCurrentTaskToDelayedList( xTimeToWake );
 8013662:	6c13      	mov      	r0, r4
 8013664:	e3fffd96 	bsr      	0x8013190	// 8013190 <prvAddCurrentTaskToDelayedList>
			xAlreadyYielded = xTaskResumeAll();
 8013668:	e3ffff72 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
		if( xAlreadyYielded == pdFALSE )
 801366c:	e920fff0 	bnez      	r0, 0x801364c	// 801364c <vTaskDelay+0x10>
 8013670:	07ea      	br      	0x8013644	// 8013644 <vTaskDelay+0x8>
 8013672:	0000      	.short	0x0000
 8013674:	20006950 	.long	0x20006950
 8013678:	200063c8 	.long	0x200063c8

0801367c <prvIdleTask>:
{
 801367c:	14d6      	push      	r4-r9, r15
		if( uxTasksDeleted > ( unsigned portBASE_TYPE ) 0U )
 801367e:	10bf      	lrw      	r5, 0x200068d0	// 80136f8 <prvIdleTask+0x7c>
 8013680:	6d97      	mov      	r6, r5
				xListIsEmpty = listLIST_IS_EMPTY( &xTasksWaitingTermination );
 8013682:	10ff      	lrw      	r7, 0x2000693c	// 80136fc <prvIdleTask+0x80>
					--uxCurrentNumberOfTasks;
 8013684:	ea88001f 	lrw      	r8, 0x200068c0	// 8013700 <prvIdleTask+0x84>
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( unsigned portBASE_TYPE ) 1 )
 8013688:	ea89001f 	lrw      	r9, 0x200063d4	// 8013704 <prvIdleTask+0x88>
		if( uxTasksDeleted > ( unsigned portBASE_TYPE ) 0U )
 801368c:	9560      	ld.w      	r3, (r5, 0x0)
 801368e:	e9030029 	bez      	r3, 0x80136e0	// 80136e0 <prvIdleTask+0x64>
			vTaskSuspendAll();
 8013692:	e3fffec7 	bsr      	0x8013420	// 8013420 <vTaskSuspendAll>
				xListIsEmpty = listLIST_IS_EMPTY( &xTasksWaitingTermination );
 8013696:	9780      	ld.w      	r4, (r7, 0x0)
			xTaskResumeAll();
 8013698:	e3ffff5a 	bsr      	0x801354c	// 801354c <xTaskResumeAll>
			if( xListIsEmpty == pdFALSE )
 801369c:	e9040022 	bez      	r4, 0x80136e0	// 80136e0 <prvIdleTask+0x64>
				taskENTER_CRITICAL();
 80136a0:	e0000772 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
					pxTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( ( ( xList * ) &xTasksWaitingTermination ) );
 80136a4:	9763      	ld.w      	r3, (r7, 0xc)
 80136a6:	9383      	ld.w      	r4, (r3, 0xc)
					vListRemove( &( pxTCB->xGenericListItem ) );
 80136a8:	5c0e      	addi      	r0, r4, 4
 80136aa:	e3fff95b 	bsr      	0x8012960	// 8012960 <vListRemove>
					if(pxTCB->freeStackfunc)
 80136ae:	9472      	ld.w      	r3, (r4, 0x48)
 80136b0:	e9030003 	bez      	r3, 0x80136b6	// 80136b6 <prvIdleTask+0x3a>
						pxTCB->freeStackfunc();
 80136b4:	7bcd      	jsr      	r3
					--uxCurrentNumberOfTasks;
 80136b6:	d8682000 	ld.w      	r3, (r8, 0x0)
 80136ba:	2b00      	subi      	r3, 1
 80136bc:	dc682000 	st.w      	r3, (r8, 0x0)
					--uxTasksDeleted;
 80136c0:	9660      	ld.w      	r3, (r6, 0x0)
 80136c2:	2b00      	subi      	r3, 1
 80136c4:	b660      	st.w      	r3, (r6, 0x0)
				taskEXIT_CRITICAL();
 80136c6:	e0000769 	bsr      	0x8014598	// 8014598 <vPortExitCritical>

	static void prvDeleteTCB( tskTCB *pxTCB )
	{
		/* Free up the memory allocated by the scheduler for the task.  It is up to
		the task to free any memory allocated at the application level. */
		vPortFreeAligned( pxTCB->pxStack );
 80136ca:	940c      	ld.w      	r0, (r4, 0x30)
 80136cc:	e3fff904 	bsr      	0x80128d4	// 80128d4 <xPortMemIsKernel>
 80136d0:	e9000005 	bez      	r0, 0x80136da	// 80136da <prvIdleTask+0x5e>
 80136d4:	940c      	ld.w      	r0, (r4, 0x30)
 80136d6:	e3fff8e3 	bsr      	0x801289c	// 801289c <vPortFree>
		vPortFree( pxTCB );
 80136da:	6c13      	mov      	r0, r4
 80136dc:	e3fff8e0 	bsr      	0x801289c	// 801289c <vPortFree>
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ tskIDLE_PRIORITY ] ) ) > ( unsigned portBASE_TYPE ) 1 )
 80136e0:	d8692000 	ld.w      	r3, (r9, 0x0)
 80136e4:	3b01      	cmphsi      	r3, 2
 80136e6:	0c05      	bf      	0x80136f0	// 80136f0 <prvIdleTask+0x74>
				taskYIELD();
 80136e8:	e3ffe70c 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 80136ec:	6c03      	mov      	r0, r0
 80136ee:	6c03      	mov      	r0, r0
			vApplicationIdleHook();
 80136f0:	e3fff872 	bsr      	0x80127d4	// 80127d4 <vApplicationIdleHook>
		prvCheckTasksWaitingTermination();
 80136f4:	07cc      	br      	0x801368c	// 801368c <prvIdleTask+0x10>
 80136f6:	0000      	.short	0x0000
 80136f8:	200068d0 	.long	0x200068d0
 80136fc:	2000693c 	.long	0x2000693c
 8013700:	200068c0 	.long	0x200068c0
 8013704:	200063d4 	.long	0x200063d4

08013708 <vTaskSwitchContext>:
{
 8013708:	14d1      	push      	r4, r15
	if( uxSchedulerSuspended != ( unsigned portBASE_TYPE ) pdFALSE )
 801370a:	1261      	lrw      	r3, 0x200068c8	// 801380c <vTaskSwitchContext+0x104>
 801370c:	9360      	ld.w      	r3, (r3, 0x0)
 801370e:	e9030006 	bez      	r3, 0x801371a	// 801371a <vTaskSwitchContext+0x12>
		xMissedYield = pdTRUE;
 8013712:	1260      	lrw      	r3, 0x20006908	// 8013810 <vTaskSwitchContext+0x108>
 8013714:	3201      	movi      	r2, 1
		vWriteTraceToBuffer();
 8013716:	b340      	st.w      	r2, (r3, 0x0)
}
 8013718:	1491      	pop      	r4, r15
		taskFIRST_CHECK_FOR_STACK_OVERFLOW();
 801371a:	119f      	lrw      	r4, 0x200063c8	// 8013814 <vTaskSwitchContext+0x10c>
 801371c:	9440      	ld.w      	r2, (r4, 0x0)
 801371e:	9460      	ld.w      	r3, (r4, 0x0)
 8013720:	9240      	ld.w      	r2, (r2, 0x0)
 8013722:	936c      	ld.w      	r3, (r3, 0x30)
 8013724:	648c      	cmphs      	r3, r2
 8013726:	0c09      	bf      	0x8013738	// 8013738 <vTaskSwitchContext+0x30>
 8013728:	9400      	ld.w      	r0, (r4, 0x0)
 801372a:	9420      	ld.w      	r1, (r4, 0x0)
 801372c:	9460      	ld.w      	r3, (r4, 0x0)
 801372e:	2137      	addi      	r1, 56
 8013730:	d843402c 	ld.bs      	r2, (r3, 0x2c)
 8013734:	e000075a 	bsr      	0x80145e8	// 80145e8 <vApplicationStackOverflowHook>
		taskSECOND_CHECK_FOR_STACK_OVERFLOW();
 8013738:	9460      	ld.w      	r3, (r4, 0x0)
 801373a:	3214      	movi      	r2, 20
 801373c:	1137      	lrw      	r1, 0x8015d6c	// 8013818 <vTaskSwitchContext+0x110>
 801373e:	930c      	ld.w      	r0, (r3, 0x30)
 8013740:	e3fff1da 	bsr      	0x8011af4	// 8011af4 <__memcmp_fast>
 8013744:	e900000a 	bez      	r0, 0x8013758	// 8013758 <vTaskSwitchContext+0x50>
 8013748:	9400      	ld.w      	r0, (r4, 0x0)
 801374a:	9420      	ld.w      	r1, (r4, 0x0)
 801374c:	9460      	ld.w      	r3, (r4, 0x0)
 801374e:	2137      	addi      	r1, 56
 8013750:	d843402c 	ld.bs      	r2, (r3, 0x2c)
 8013754:	e000074a 	bsr      	0x80145e8	// 80145e8 <vApplicationStackOverflowHook>
		while( listLIST_IS_EMPTY( &( pxReadyTasksLists[ uxTopReadyPriority ] ) ) )
 8013758:	1151      	lrw      	r2, 0x200063d4	// 801381c <vTaskSwitchContext+0x114>
 801375a:	1132      	lrw      	r1, 0x200068d4	// 8013820 <vTaskSwitchContext+0x118>
 801375c:	3314      	movi      	r3, 20
 801375e:	6c0b      	mov      	r0, r2
 8013760:	d9812000 	ld.w      	r12, (r1, 0x0)
 8013764:	7f0c      	mult      	r12, r3
 8013766:	d04c082c 	ldr.w      	r12, (r12, r2 << 0)
 801376a:	e90c003b 	bez      	r12, 0x80137e0	// 80137e0 <vTaskSwitchContext+0xd8>
		listGET_OWNER_OF_NEXT_ENTRY( pxCurrentTCB, &( pxReadyTasksLists[ uxTopReadyPriority ] ) );
 801376e:	d9a12000 	ld.w      	r13, (r1, 0x0)
 8013772:	7cf4      	mult      	r3, r13
 8013774:	5a2c      	addu      	r1, r2, r3
 8013776:	2307      	addi      	r3, 8
 8013778:	d9812001 	ld.w      	r12, (r1, 0x4)
 801377c:	60c8      	addu      	r3, r2
 801377e:	d98c2001 	ld.w      	r12, (r12, 0x4)
 8013782:	64f2      	cmpne      	r12, r3
 8013784:	dd812001 	st.w      	r12, (r1, 0x4)
 8013788:	0804      	bt      	0x8013790	// 8013790 <vTaskSwitchContext+0x88>
 801378a:	d86c2001 	ld.w      	r3, (r12, 0x4)
 801378e:	b161      	st.w      	r3, (r1, 0x4)
 8013790:	3314      	movi      	r3, 20
 8013792:	f86d8440 	mula.32.l      	r0, r13, r3
		vWriteTraceToBuffer();
 8013796:	1124      	lrw      	r1, 0x20006954	// 8013824 <vTaskSwitchContext+0x11c>
		listGET_OWNER_OF_NEXT_ENTRY( pxCurrentTCB, &( pxReadyTasksLists[ uxTopReadyPriority ] ) );
 8013798:	9061      	ld.w      	r3, (r0, 0x4)
 801379a:	9363      	ld.w      	r3, (r3, 0xc)
 801379c:	b460      	st.w      	r3, (r4, 0x0)
		vWriteTraceToBuffer();
 801379e:	9160      	ld.w      	r3, (r1, 0x0)
 80137a0:	e903ffbc 	bez      	r3, 0x8013718	// 8013718 <vTaskSwitchContext+0x10>
 80137a4:	9460      	ld.w      	r3, (r4, 0x0)
 80137a6:	1101      	lrw      	r0, 0x20000164	// 8013828 <vTaskSwitchContext+0x120>
 80137a8:	9350      	ld.w      	r2, (r3, 0x40)
 80137aa:	9060      	ld.w      	r3, (r0, 0x0)
 80137ac:	64ca      	cmpne      	r2, r3
 80137ae:	0fb5      	bf      	0x8013718	// 8013718 <vTaskSwitchContext+0x10>
 80137b0:	107f      	lrw      	r3, 0x200063c0	// 801382c <vTaskSwitchContext+0x124>
 80137b2:	ea8c0020 	lrw      	r12, 0x200063c4	// 8013830 <vTaskSwitchContext+0x128>
 80137b6:	9340      	ld.w      	r2, (r3, 0x0)
 80137b8:	2207      	addi      	r2, 8
 80137ba:	d98c2000 	ld.w      	r12, (r12, 0x0)
 80137be:	6708      	cmphs      	r2, r12
 80137c0:	0822      	bt      	0x8013804	// 8013804 <vTaskSwitchContext+0xfc>
 80137c2:	9440      	ld.w      	r2, (r4, 0x0)
 80137c4:	9230      	ld.w      	r1, (r2, 0x40)
 80137c6:	b020      	st.w      	r1, (r0, 0x0)
 80137c8:	9340      	ld.w      	r2, (r3, 0x0)
 80137ca:	101b      	lrw      	r0, 0x20006950	// 8013834 <vTaskSwitchContext+0x12c>
 80137cc:	9000      	ld.w      	r0, (r0, 0x0)
 80137ce:	b200      	st.w      	r0, (r2, 0x0)
 80137d0:	9340      	ld.w      	r2, (r3, 0x0)
 80137d2:	2203      	addi      	r2, 4
 80137d4:	b340      	st.w      	r2, (r3, 0x0)
 80137d6:	9340      	ld.w      	r2, (r3, 0x0)
 80137d8:	b220      	st.w      	r1, (r2, 0x0)
 80137da:	9340      	ld.w      	r2, (r3, 0x0)
 80137dc:	2203      	addi      	r2, 4
 80137de:	079c      	br      	0x8013716	// 8013716 <vTaskSwitchContext+0xe>
			configASSERT( uxTopReadyPriority );
 80137e0:	d9812000 	ld.w      	r12, (r1, 0x0)
 80137e4:	e92c0009 	bnez      	r12, 0x80137f6	// 80137f6 <vTaskSwitchContext+0xee>
 80137e8:	ea020726 	movi      	r2, 1830
 80137ec:	1033      	lrw      	r1, 0x8015d85	// 8013838 <vTaskSwitchContext+0x130>
 80137ee:	1014      	lrw      	r0, 0x8015d25	// 801383c <vTaskSwitchContext+0x134>
 80137f0:	e00011be 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80137f4:	0400      	br      	0x80137f4	// 80137f4 <vTaskSwitchContext+0xec>
			--uxTopReadyPriority;
 80137f6:	d9812000 	ld.w      	r12, (r1, 0x0)
 80137fa:	e58c1000 	subi      	r12, r12, 1
 80137fe:	dd812000 	st.w      	r12, (r1, 0x0)
 8013802:	07af      	br      	0x8013760	// 8013760 <vTaskSwitchContext+0x58>
		vWriteTraceToBuffer();
 8013804:	3300      	movi      	r3, 0
 8013806:	b160      	st.w      	r3, (r1, 0x0)
}
 8013808:	0788      	br      	0x8013718	// 8013718 <vTaskSwitchContext+0x10>
 801380a:	0000      	.short	0x0000
 801380c:	200068c8 	.long	0x200068c8
 8013810:	20006908 	.long	0x20006908
 8013814:	200063c8 	.long	0x200063c8
 8013818:	08015d6c 	.long	0x08015d6c
 801381c:	200063d4 	.long	0x200063d4
 8013820:	200068d4 	.long	0x200068d4
 8013824:	20006954 	.long	0x20006954
 8013828:	20000164 	.long	0x20000164
 801382c:	200063c0 	.long	0x200063c0
 8013830:	200063c4 	.long	0x200063c4
 8013834:	20006950 	.long	0x20006950
 8013838:	08015d85 	.long	0x08015d85
 801383c:	08015d25 	.long	0x08015d25

08013840 <vTaskPlaceOnEventList>:
{
 8013840:	14d2      	push      	r4-r5, r15
 8013842:	6d47      	mov      	r5, r1
	configASSERT( pxEventList );
 8013844:	e9200009 	bnez      	r0, 0x8013856	// 8013856 <vTaskPlaceOnEventList+0x16>
 8013848:	ea020737 	movi      	r2, 1847
 801384c:	102f      	lrw      	r1, 0x8015d85	// 8013888 <vTaskPlaceOnEventList+0x48>
 801384e:	1010      	lrw      	r0, 0x8015d25	// 801388c <vTaskPlaceOnEventList+0x4c>
 8013850:	e000118e 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013854:	0400      	br      	0x8013854	// 8013854 <vTaskPlaceOnEventList+0x14>
	vListInsert( ( xList * ) pxEventList, ( xListItem * ) &( pxCurrentTCB->xEventListItem ) );
 8013856:	108f      	lrw      	r4, 0x200063c8	// 8013890 <vTaskPlaceOnEventList+0x50>
 8013858:	9420      	ld.w      	r1, (r4, 0x0)
 801385a:	2117      	addi      	r1, 24
 801385c:	e3fff868 	bsr      	0x801292c	// 801292c <vListInsert>
	vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 8013860:	9400      	ld.w      	r0, (r4, 0x0)
 8013862:	2003      	addi      	r0, 4
 8013864:	e3fff87e 	bsr      	0x8012960	// 8012960 <vListRemove>
		if( xTicksToWait == portMAX_DELAY )
 8013868:	3300      	movi      	r3, 0
 801386a:	2b00      	subi      	r3, 1
 801386c:	64d6      	cmpne      	r5, r3
 801386e:	0807      	bt      	0x801387c	// 801387c <vTaskPlaceOnEventList+0x3c>
			vListInsertEnd( ( xList * ) &xSuspendedTaskList, ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 8013870:	9420      	ld.w      	r1, (r4, 0x0)
 8013872:	2103      	addi      	r1, 4
 8013874:	1008      	lrw      	r0, 0x20006928	// 8013894 <vTaskPlaceOnEventList+0x54>
 8013876:	e3fff84d 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
}
 801387a:	1492      	pop      	r4-r5, r15
			xTimeToWake = xTickCount + xTicksToWait;
 801387c:	1067      	lrw      	r3, 0x20006950	// 8013898 <vTaskPlaceOnEventList+0x58>
 801387e:	9300      	ld.w      	r0, (r3, 0x0)
			prvAddCurrentTaskToDelayedList( xTimeToWake );
 8013880:	6014      	addu      	r0, r5
 8013882:	e3fffc87 	bsr      	0x8013190	// 8013190 <prvAddCurrentTaskToDelayedList>
}
 8013886:	07fa      	br      	0x801387a	// 801387a <vTaskPlaceOnEventList+0x3a>
 8013888:	08015d85 	.long	0x08015d85
 801388c:	08015d25 	.long	0x08015d25
 8013890:	200063c8 	.long	0x200063c8
 8013894:	20006928 	.long	0x20006928
 8013898:	20006950 	.long	0x20006950

0801389c <vTaskPlaceOnEventListRestricted>:
	{
 801389c:	14d2      	push      	r4-r5, r15
 801389e:	6d47      	mov      	r5, r1
		configASSERT( pxEventList );
 80138a0:	e9200009 	bnez      	r0, 0x80138b2	// 80138b2 <vTaskPlaceOnEventListRestricted+0x16>
 80138a4:	ea020769 	movi      	r2, 1897
 80138a8:	102a      	lrw      	r1, 0x8015d85	// 80138d0 <vTaskPlaceOnEventListRestricted+0x34>
 80138aa:	100b      	lrw      	r0, 0x8015d25	// 80138d4 <vTaskPlaceOnEventListRestricted+0x38>
 80138ac:	e0001160 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80138b0:	0400      	br      	0x80138b0	// 80138b0 <vTaskPlaceOnEventListRestricted+0x14>
		vListInsertEnd( ( xList * ) pxEventList, ( xListItem * ) &( pxCurrentTCB->xEventListItem ) );
 80138b2:	108a      	lrw      	r4, 0x200063c8	// 80138d8 <vTaskPlaceOnEventListRestricted+0x3c>
 80138b4:	9420      	ld.w      	r1, (r4, 0x0)
 80138b6:	2117      	addi      	r1, 24
 80138b8:	e3fff82c 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
		vListRemove( ( xListItem * ) &( pxCurrentTCB->xGenericListItem ) );
 80138bc:	9400      	ld.w      	r0, (r4, 0x0)
 80138be:	2003      	addi      	r0, 4
 80138c0:	e3fff850 	bsr      	0x8012960	// 8012960 <vListRemove>
		xTimeToWake = xTickCount + xTicksToWait;
 80138c4:	1066      	lrw      	r3, 0x20006950	// 80138dc <vTaskPlaceOnEventListRestricted+0x40>
 80138c6:	9300      	ld.w      	r0, (r3, 0x0)
		prvAddCurrentTaskToDelayedList( xTimeToWake );
 80138c8:	6014      	addu      	r0, r5
 80138ca:	e3fffc63 	bsr      	0x8013190	// 8013190 <prvAddCurrentTaskToDelayedList>
	}
 80138ce:	1492      	pop      	r4-r5, r15
 80138d0:	08015d85 	.long	0x08015d85
 80138d4:	08015d25 	.long	0x08015d25
 80138d8:	200063c8 	.long	0x200063c8
 80138dc:	20006950 	.long	0x20006950

080138e0 <xTaskRemoveFromEventList>:
{
 80138e0:	14d2      	push      	r4-r5, r15
	pxUnblockedTCB = ( tskTCB * ) listGET_OWNER_OF_HEAD_ENTRY( pxEventList );
 80138e2:	9063      	ld.w      	r3, (r0, 0xc)
 80138e4:	9383      	ld.w      	r4, (r3, 0xc)
	configASSERT( pxUnblockedTCB );
 80138e6:	e9240009 	bnez      	r4, 0x80138f8	// 80138f8 <xTaskRemoveFromEventList+0x18>
 80138ea:	32f3      	movi      	r2, 243
 80138ec:	4243      	lsli      	r2, r2, 3
 80138ee:	1036      	lrw      	r1, 0x8015d85	// 8013944 <xTaskRemoveFromEventList+0x64>
 80138f0:	1016      	lrw      	r0, 0x8015d25	// 8013948 <xTaskRemoveFromEventList+0x68>
 80138f2:	e000113d 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80138f6:	0400      	br      	0x80138f6	// 80138f6 <xTaskRemoveFromEventList+0x16>
	vListRemove( &( pxUnblockedTCB->xEventListItem ) );
 80138f8:	e4a40017 	addi      	r5, r4, 24
 80138fc:	6c17      	mov      	r0, r5
 80138fe:	e3fff831 	bsr      	0x8012960	// 8012960 <vListRemove>
	if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
 8013902:	1073      	lrw      	r3, 0x200068c8	// 801394c <xTaskRemoveFromEventList+0x6c>
 8013904:	9360      	ld.w      	r3, (r3, 0x0)
 8013906:	e923001b 	bnez      	r3, 0x801393c	// 801393c <xTaskRemoveFromEventList+0x5c>
		vListRemove( &( pxUnblockedTCB->xGenericListItem ) );
 801390a:	5cae      	addi      	r5, r4, 4
 801390c:	6c17      	mov      	r0, r5
 801390e:	e3fff829 	bsr      	0x8012960	// 8012960 <vListRemove>
		prvAddTaskToReadyQueue( pxUnblockedTCB );
 8013912:	1070      	lrw      	r3, 0x200068d4	// 8013950 <xTaskRemoveFromEventList+0x70>
 8013914:	940b      	ld.w      	r0, (r4, 0x2c)
 8013916:	9340      	ld.w      	r2, (r3, 0x0)
 8013918:	6408      	cmphs      	r2, r0
 801391a:	0802      	bt      	0x801391e	// 801391e <xTaskRemoveFromEventList+0x3e>
 801391c:	b300      	st.w      	r0, (r3, 0x0)
 801391e:	3314      	movi      	r3, 20
 8013920:	7c0c      	mult      	r0, r3
 8013922:	106d      	lrw      	r3, 0x200063d4	// 8013954 <xTaskRemoveFromEventList+0x74>
 8013924:	6c57      	mov      	r1, r5
 8013926:	600c      	addu      	r0, r3
		vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
 8013928:	e3fff7f4 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
	if( pxUnblockedTCB->uxPriority >= pxCurrentTCB->uxPriority )
 801392c:	106b      	lrw      	r3, 0x200063c8	// 8013958 <xTaskRemoveFromEventList+0x78>
 801392e:	944b      	ld.w      	r2, (r4, 0x2c)
 8013930:	9360      	ld.w      	r3, (r3, 0x0)
 8013932:	936b      	ld.w      	r3, (r3, 0x2c)
 8013934:	64c8      	cmphs      	r2, r3
}
 8013936:	c4000500 	mvc      	r0
 801393a:	1492      	pop      	r4-r5, r15
		vListInsertEnd( ( xList * ) &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
 801393c:	6c57      	mov      	r1, r5
 801393e:	1008      	lrw      	r0, 0x20006910	// 801395c <xTaskRemoveFromEventList+0x7c>
 8013940:	07f4      	br      	0x8013928	// 8013928 <xTaskRemoveFromEventList+0x48>
 8013942:	0000      	.short	0x0000
 8013944:	08015d85 	.long	0x08015d85
 8013948:	08015d25 	.long	0x08015d25
 801394c:	200068c8 	.long	0x200068c8
 8013950:	200068d4 	.long	0x200068d4
 8013954:	200063d4 	.long	0x200063d4
 8013958:	200063c8 	.long	0x200063c8
 801395c:	20006910 	.long	0x20006910

08013960 <vTaskSetTimeOutState>:
{
 8013960:	14d0      	push      	r15
	configASSERT( pxTimeOut );
 8013962:	e9200009 	bnez      	r0, 0x8013974	// 8013974 <vTaskSetTimeOutState+0x14>
 8013966:	ea0207ba 	movi      	r2, 1978
 801396a:	1027      	lrw      	r1, 0x8015d85	// 8013984 <vTaskSetTimeOutState+0x24>
 801396c:	1007      	lrw      	r0, 0x8015d25	// 8013988 <vTaskSetTimeOutState+0x28>
 801396e:	e00010ff 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013972:	0400      	br      	0x8013972	// 8013972 <vTaskSetTimeOutState+0x12>
	pxTimeOut->xOverflowCount = xNumOfOverflows;
 8013974:	1066      	lrw      	r3, 0x2000690c	// 801398c <vTaskSetTimeOutState+0x2c>
 8013976:	9360      	ld.w      	r3, (r3, 0x0)
 8013978:	b060      	st.w      	r3, (r0, 0x0)
	pxTimeOut->xTimeOnEntering = xTickCount;
 801397a:	1066      	lrw      	r3, 0x20006950	// 8013990 <vTaskSetTimeOutState+0x30>
 801397c:	9360      	ld.w      	r3, (r3, 0x0)
 801397e:	b061      	st.w      	r3, (r0, 0x4)
}
 8013980:	1490      	pop      	r15
 8013982:	0000      	.short	0x0000
 8013984:	08015d85 	.long	0x08015d85
 8013988:	08015d25 	.long	0x08015d25
 801398c:	2000690c 	.long	0x2000690c
 8013990:	20006950 	.long	0x20006950

08013994 <xTaskCheckForTimeOut>:
{
 8013994:	14d1      	push      	r4, r15
 8013996:	1421      	subi      	r14, r14, 4
 8013998:	6d07      	mov      	r4, r1
	configASSERT( pxTimeOut );
 801399a:	e9200009 	bnez      	r0, 0x80139ac	// 80139ac <xTaskCheckForTimeOut+0x18>
 801399e:	ea0207c4 	movi      	r2, 1988
 80139a2:	103b      	lrw      	r1, 0x8015d85	// 8013a0c <xTaskCheckForTimeOut+0x78>
 80139a4:	101b      	lrw      	r0, 0x8015d25	// 8013a10 <xTaskCheckForTimeOut+0x7c>
 80139a6:	e00010e3 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80139aa:	0400      	br      	0x80139aa	// 80139aa <xTaskCheckForTimeOut+0x16>
	configASSERT( pxTicksToWait );
 80139ac:	e9210009 	bnez      	r1, 0x80139be	// 80139be <xTaskCheckForTimeOut+0x2a>
 80139b0:	ea0207c5 	movi      	r2, 1989
 80139b4:	1036      	lrw      	r1, 0x8015d85	// 8013a0c <xTaskCheckForTimeOut+0x78>
 80139b6:	1017      	lrw      	r0, 0x8015d25	// 8013a10 <xTaskCheckForTimeOut+0x7c>
 80139b8:	e00010da 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80139bc:	0400      	br      	0x80139bc	// 80139bc <xTaskCheckForTimeOut+0x28>
 80139be:	b800      	st.w      	r0, (r14, 0x0)
	taskENTER_CRITICAL();
 80139c0:	e00005e2 	bsr      	0x8014584	// 8014584 <vPortEnterCritical>
			if( *pxTicksToWait == portMAX_DELAY )
 80139c4:	3200      	movi      	r2, 0
 80139c6:	9460      	ld.w      	r3, (r4, 0x0)
 80139c8:	2a00      	subi      	r2, 1
 80139ca:	648e      	cmpne      	r3, r2
 80139cc:	0c18      	bf      	0x80139fc	// 80139fc <xTaskCheckForTimeOut+0x68>
		if( ( xNumOfOverflows != pxTimeOut->xOverflowCount ) && ( ( portTickType ) xTickCount >= ( portTickType ) pxTimeOut->xTimeOnEntering ) )
 80139ce:	9800      	ld.w      	r0, (r14, 0x0)
 80139d0:	1051      	lrw      	r2, 0x2000690c	// 8013a14 <xTaskCheckForTimeOut+0x80>
 80139d2:	9020      	ld.w      	r1, (r0, 0x0)
 80139d4:	9240      	ld.w      	r2, (r2, 0x0)
 80139d6:	6486      	cmpne      	r1, r2
 80139d8:	1050      	lrw      	r2, 0x20006950	// 8013a18 <xTaskCheckForTimeOut+0x84>
 80139da:	9021      	ld.w      	r1, (r0, 0x4)
 80139dc:	0c05      	bf      	0x80139e6	// 80139e6 <xTaskCheckForTimeOut+0x52>
 80139de:	d9822000 	ld.w      	r12, (r2, 0x0)
 80139e2:	6470      	cmphs      	r12, r1
 80139e4:	0812      	bt      	0x8013a08	// 8013a08 <xTaskCheckForTimeOut+0x74>
		else if( ( ( portTickType ) ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering ) ) < ( portTickType ) *pxTicksToWait )
 80139e6:	d9822000 	ld.w      	r12, (r2, 0x0)
 80139ea:	6306      	subu      	r12, r1
 80139ec:	64f0      	cmphs      	r12, r3
 80139ee:	080d      	bt      	0x8013a08	// 8013a08 <xTaskCheckForTimeOut+0x74>
			*pxTicksToWait -= ( ( portTickType ) xTickCount - ( portTickType ) pxTimeOut->xTimeOnEntering );
 80139f0:	9240      	ld.w      	r2, (r2, 0x0)
 80139f2:	6086      	subu      	r2, r1
 80139f4:	60ca      	subu      	r3, r2
 80139f6:	b460      	st.w      	r3, (r4, 0x0)
			vTaskSetTimeOutState( pxTimeOut );
 80139f8:	e3ffffb4 	bsr      	0x8013960	// 8013960 <vTaskSetTimeOutState>
				xReturn = pdFALSE;
 80139fc:	3400      	movi      	r4, 0
	taskEXIT_CRITICAL();
 80139fe:	e00005cd 	bsr      	0x8014598	// 8014598 <vPortExitCritical>
}
 8013a02:	6c13      	mov      	r0, r4
 8013a04:	1401      	addi      	r14, r14, 4
 8013a06:	1491      	pop      	r4, r15
			xReturn = pdTRUE;
 8013a08:	3401      	movi      	r4, 1
 8013a0a:	07fa      	br      	0x80139fe	// 80139fe <xTaskCheckForTimeOut+0x6a>
 8013a0c:	08015d85 	.long	0x08015d85
 8013a10:	08015d25 	.long	0x08015d25
 8013a14:	2000690c 	.long	0x2000690c
 8013a18:	20006950 	.long	0x20006950

08013a1c <vTaskMissedYield>:
	xMissedYield = pdTRUE;
 8013a1c:	1062      	lrw      	r3, 0x20006908	// 8013a24 <vTaskMissedYield+0x8>
 8013a1e:	3201      	movi      	r2, 1
 8013a20:	b340      	st.w      	r2, (r3, 0x0)
}
 8013a22:	783c      	jmp      	r15
 8013a24:	20006908 	.long	0x20006908

08013a28 <xTaskGetCurrentTaskHandle>:
	xTaskHandle xReturn;

		/* A critical section is not required as this is not called from
		an interrupt and the current TCB will always be the same for any
		individual execution thread. */
		xReturn = pxCurrentTCB;
 8013a28:	1062      	lrw      	r3, 0x200063c8	// 8013a30 <xTaskGetCurrentTaskHandle+0x8>
 8013a2a:	9300      	ld.w      	r0, (r3, 0x0)

		return xReturn;
	}
 8013a2c:	783c      	jmp      	r15
 8013a2e:	0000      	.short	0x0000
 8013a30:	200063c8 	.long	0x200063c8

08013a34 <xTaskGetSchedulerState>:

	portBASE_TYPE xTaskGetSchedulerState( void )
	{
	portBASE_TYPE xReturn;

		if( xSchedulerRunning == pdFALSE )
 8013a34:	1066      	lrw      	r3, 0x20006924	// 8013a4c <xTaskGetSchedulerState+0x18>
 8013a36:	9300      	ld.w      	r0, (r3, 0x0)
 8013a38:	e9000008 	bez      	r0, 0x8013a48	// 8013a48 <xTaskGetSchedulerState+0x14>
		{
			xReturn = taskSCHEDULER_NOT_STARTED;
		}
		else
		{
			if( uxSchedulerSuspended == ( unsigned portBASE_TYPE ) pdFALSE )
 8013a3c:	1065      	lrw      	r3, 0x200068c8	// 8013a50 <xTaskGetSchedulerState+0x1c>
 8013a3e:	9360      	ld.w      	r3, (r3, 0x0)
			{
				xReturn = taskSCHEDULER_RUNNING;
			}
			else
			{
				xReturn = taskSCHEDULER_SUSPENDED;
 8013a40:	3b40      	cmpnei      	r3, 0
 8013a42:	c4000500 	mvc      	r0
 8013a46:	2000      	addi      	r0, 1
			}
		}

		return xReturn;
	}
 8013a48:	783c      	jmp      	r15
 8013a4a:	0000      	.short	0x0000
 8013a4c:	20006924 	.long	0x20006924
 8013a50:	200068c8 	.long	0x200068c8

08013a54 <vTaskPriorityInherit>:
/*-----------------------------------------------------------*/

#if ( configUSE_MUTEXES == 1 )

	void vTaskPriorityInherit( xTaskHandle * const pxMutexHolder )
	{
 8013a54:	14d4      	push      	r4-r7, r15
 8013a56:	6d03      	mov      	r4, r0
	tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;

		configASSERT( pxMutexHolder );
 8013a58:	e9200009 	bnez      	r0, 0x8013a6a	// 8013a6a <vTaskPriorityInherit+0x16>
 8013a5c:	ea020a63 	movi      	r2, 2659
 8013a60:	1039      	lrw      	r1, 0x8015d85	// 8013ac4 <vTaskPriorityInherit+0x70>
 8013a62:	101a      	lrw      	r0, 0x8015d25	// 8013ac8 <vTaskPriorityInherit+0x74>
 8013a64:	e0001084 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8013a68:	0400      	br      	0x8013a68	// 8013a68 <vTaskPriorityInherit+0x14>

		if( pxTCB->uxPriority < pxCurrentTCB->uxPriority )
 8013a6a:	10b9      	lrw      	r5, 0x200063c8	// 8013acc <vTaskPriorityInherit+0x78>
 8013a6c:	904b      	ld.w      	r2, (r0, 0x2c)
 8013a6e:	9560      	ld.w      	r3, (r5, 0x0)
 8013a70:	936b      	ld.w      	r3, (r3, 0x2c)
 8013a72:	64c8      	cmphs      	r2, r3
 8013a74:	0822      	bt      	0x8013ab8	// 8013ab8 <vTaskPriorityInherit+0x64>
		{
			/* Adjust the mutex holder state to account for its new priority. */
			listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxCurrentTCB->uxPriority );
 8013a76:	9560      	ld.w      	r3, (r5, 0x0)
 8013a78:	932b      	ld.w      	r1, (r3, 0x2c)
 8013a7a:	333f      	movi      	r3, 63
 8013a7c:	60c6      	subu      	r3, r1
 8013a7e:	b066      	st.w      	r3, (r0, 0x18)

			/* If the task being modified is in the ready state it will need to
			be moved in to a new list. */
			if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xGenericListItem ) ) != pdFALSE )
 8013a80:	3314      	movi      	r3, 20
 8013a82:	1014      	lrw      	r0, 0x200063d4	// 8013ad0 <vTaskPriorityInherit+0x7c>
 8013a84:	6c43      	mov      	r1, r0
 8013a86:	f8628441 	mula.32.l      	r1, r2, r3
 8013a8a:	9445      	ld.w      	r2, (r4, 0x14)
 8013a8c:	644a      	cmpne      	r2, r1
 8013a8e:	6d83      	mov      	r6, r0
 8013a90:	0815      	bt      	0x8013aba	// 8013aba <vTaskPriorityInherit+0x66>
			{
				vListRemove( &( pxTCB->xGenericListItem ) );
 8013a92:	5cee      	addi      	r7, r4, 4
 8013a94:	6c1f      	mov      	r0, r7
 8013a96:	e3fff765 	bsr      	0x8012960	// 8012960 <vListRemove>

				/* Inherit the priority before being moved into the new list. */
				pxTCB->uxPriority = pxCurrentTCB->uxPriority;
 8013a9a:	9560      	ld.w      	r3, (r5, 0x0)
				prvAddTaskToReadyQueue( pxTCB );
 8013a9c:	104e      	lrw      	r2, 0x200068d4	// 8013ad4 <vTaskPriorityInherit+0x80>
				pxTCB->uxPriority = pxCurrentTCB->uxPriority;
 8013a9e:	936b      	ld.w      	r3, (r3, 0x2c)
				prvAddTaskToReadyQueue( pxTCB );
 8013aa0:	9220      	ld.w      	r1, (r2, 0x0)
 8013aa2:	64c4      	cmphs      	r1, r3
				pxTCB->uxPriority = pxCurrentTCB->uxPriority;
 8013aa4:	b46b      	st.w      	r3, (r4, 0x2c)
				prvAddTaskToReadyQueue( pxTCB );
 8013aa6:	0802      	bt      	0x8013aaa	// 8013aaa <vTaskPriorityInherit+0x56>
 8013aa8:	b260      	st.w      	r3, (r2, 0x0)
 8013aaa:	3214      	movi      	r2, 20
 8013aac:	6c1b      	mov      	r0, r6
 8013aae:	6c5f      	mov      	r1, r7
 8013ab0:	f8438440 	mula.32.l      	r0, r3, r2
 8013ab4:	e3fff72e 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
			{
				/* Just inherit the priority. */
				pxTCB->uxPriority = pxCurrentTCB->uxPriority;
			}
		}
	}
 8013ab8:	1494      	pop      	r4-r7, r15
				pxTCB->uxPriority = pxCurrentTCB->uxPriority;
 8013aba:	9560      	ld.w      	r3, (r5, 0x0)
 8013abc:	936b      	ld.w      	r3, (r3, 0x2c)
 8013abe:	b46b      	st.w      	r3, (r4, 0x2c)
	}
 8013ac0:	07fc      	br      	0x8013ab8	// 8013ab8 <vTaskPriorityInherit+0x64>
 8013ac2:	0000      	.short	0x0000
 8013ac4:	08015d85 	.long	0x08015d85
 8013ac8:	08015d25 	.long	0x08015d25
 8013acc:	200063c8 	.long	0x200063c8
 8013ad0:	200063d4 	.long	0x200063d4
 8013ad4:	200068d4 	.long	0x200068d4

08013ad8 <vTaskPriorityDisinherit>:
/*-----------------------------------------------------------*/

#if ( configUSE_MUTEXES == 1 )

	void vTaskPriorityDisinherit( xTaskHandle * const pxMutexHolder )
	{
 8013ad8:	14d2      	push      	r4-r5, r15
 8013ada:	6d03      	mov      	r4, r0
	tskTCB * const pxTCB = ( tskTCB * ) pxMutexHolder;

		if( pxMutexHolder != NULL )
 8013adc:	e900001b 	bez      	r0, 0x8013b12	// 8013b12 <vTaskPriorityDisinherit+0x3a>
		{
			if( pxTCB->uxPriority != pxTCB->uxBasePriority )
 8013ae0:	904b      	ld.w      	r2, (r0, 0x2c)
 8013ae2:	9071      	ld.w      	r3, (r0, 0x44)
 8013ae4:	64ca      	cmpne      	r2, r3
 8013ae6:	0c16      	bf      	0x8013b12	// 8013b12 <vTaskPriorityDisinherit+0x3a>
			{
				/* We must be the running task to be able to give the mutex back.
				Remove ourselves from the ready list we currently appear in. */
				vListRemove( &( pxTCB->xGenericListItem ) );
 8013ae8:	58ae      	addi      	r5, r0, 4
 8013aea:	6c17      	mov      	r0, r5
 8013aec:	e3fff73a 	bsr      	0x8012960	// 8012960 <vListRemove>

				/* Disinherit the priority before adding ourselves into the new
				ready list. */
				pxTCB->uxPriority = pxTCB->uxBasePriority;
 8013af0:	9411      	ld.w      	r0, (r4, 0x44)
				listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), configMAX_PRIORITIES - ( portTickType ) pxTCB->uxPriority );
 8013af2:	333f      	movi      	r3, 63
 8013af4:	60c2      	subu      	r3, r0
 8013af6:	b466      	st.w      	r3, (r4, 0x18)
				pxTCB->uxPriority = pxTCB->uxBasePriority;
 8013af8:	b40b      	st.w      	r0, (r4, 0x2c)
				prvAddTaskToReadyQueue( pxTCB );
 8013afa:	1067      	lrw      	r3, 0x200068d4	// 8013b14 <vTaskPriorityDisinherit+0x3c>
 8013afc:	9340      	ld.w      	r2, (r3, 0x0)
 8013afe:	6408      	cmphs      	r2, r0
 8013b00:	0802      	bt      	0x8013b04	// 8013b04 <vTaskPriorityDisinherit+0x2c>
 8013b02:	b300      	st.w      	r0, (r3, 0x0)
 8013b04:	3314      	movi      	r3, 20
 8013b06:	7c0c      	mult      	r0, r3
 8013b08:	1064      	lrw      	r3, 0x200063d4	// 8013b18 <vTaskPriorityDisinherit+0x40>
 8013b0a:	6c57      	mov      	r1, r5
 8013b0c:	600c      	addu      	r0, r3
 8013b0e:	e3fff701 	bsr      	0x8012910	// 8012910 <vListInsertEnd>
			}
		}
	}
 8013b12:	1492      	pop      	r4-r5, r15
 8013b14:	200068d4 	.long	0x200068d4
 8013b18:	200063d4 	.long	0x200063d4

08013b1c <MY_ADC_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_ADC_Init(void)
{
 8013b1c:	14d0      	push      	r15
	hadc.Instance = ADC;
 8013b1e:	1009      	lrw      	r0, 0x20006968	// 8013b40 <MY_ADC_Init+0x24>
 8013b20:	ea234001 	movih      	r3, 16385
 8013b24:	3ba9      	bseti      	r3, 9
 8013b26:	b060      	st.w      	r3, (r0, 0x0)
	hadc.Init.channel = ADC_CHANNEL_0;
 8013b28:	3300      	movi      	r3, 0
 8013b2a:	b061      	st.w      	r3, (r0, 0x4)
	hadc.Init.freq = 1000;
 8013b2c:	33fa      	movi      	r3, 250
 8013b2e:	4362      	lsli      	r3, r3, 2
 8013b30:	b062      	st.w      	r3, (r0, 0x8)
	
	if (HAL_ADC_Init(&hadc) != HAL_OK)
 8013b32:	e3fff2ef 	bsr      	0x8012110	// 8012110 <HAL_ADC_Init>
 8013b36:	e9000004 	bez      	r0, 0x8013b3e	// 8013b3e <MY_ADC_Init+0x22>
	{
		Error_Handler();
 8013b3a:	e0000131 	bsr      	0x8013d9c	// 8013d9c <Error_Handler>
	}
}
 8013b3e:	1490      	pop      	r15
 8013b40:	20006968 	.long	0x20006968

08013b44 <HAL_ADC_MspInit>:

void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
 8013b44:	14d0      	push      	r15
	if (hadc->Instance == ADC)
 8013b46:	9040      	ld.w      	r2, (r0, 0x0)
 8013b48:	ea234001 	movih      	r3, 16385
 8013b4c:	3ba9      	bseti      	r3, 9
 8013b4e:	64ca      	cmpne      	r2, r3
 8013b50:	0825      	bt      	0x8013b9a	// 8013b9a <HAL_ADC_MspInit+0x56>
	{
		__HAL_RCC_ADC_CLK_ENABLE();
 8013b52:	ea234000 	movih      	r3, 16384
 8013b56:	e4630dff 	addi      	r3, r3, 3584
 8013b5a:	9340      	ld.w      	r2, (r3, 0x0)
 8013b5c:	ec421000 	ori      	r2, r2, 4096
 8013b60:	b340      	st.w      	r2, (r3, 0x0)
		__HAL_RCC_GPIO_CLK_ENABLE();
 8013b62:	9340      	ld.w      	r2, (r3, 0x0)
 8013b64:	ec420800 	ori      	r2, r2, 2048
 8013b68:	b340      	st.w      	r2, (r3, 0x0)
		//ADC_CHANNEL_1 : PA4
		//ADC_CHANNEL_2 : PA3
		//ADC_CHANNEL_3 : PA2
		//ADC_CHANNEL_0_1 : PA1 and PA4
		//ADC_CHANNEL_2_3 : PA3 and PA2
		if (hadc->Init.channel == ADC_CHANNEL_0)
 8013b6a:	9061      	ld.w      	r3, (r0, 0x4)
 8013b6c:	e9230018 	bnez      	r3, 0x8013b9c	// 8013b9c <HAL_ADC_MspInit+0x58>
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8013b70:	1177      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
 8013b72:	9344      	ld.w      	r2, (r3, 0x10)
 8013b74:	3a81      	bclri      	r2, 1
 8013b76:	b344      	st.w      	r2, (r3, 0x10)
 8013b78:	9342      	ld.w      	r2, (r3, 0x8)
 8013b7a:	3a81      	bclri      	r2, 1
 8013b7c:	b342      	st.w      	r2, (r3, 0x8)
 8013b7e:	9343      	ld.w      	r2, (r3, 0xc)
 8013b80:	ec420002 	ori      	r2, r2, 2
 8013b84:	b343      	st.w      	r2, (r3, 0xc)
 8013b86:	9347      	ld.w      	r2, (r3, 0x1c)
 8013b88:	3a81      	bclri      	r2, 1
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8013b8a:	b347      	st.w      	r2, (r3, 0x1c)
		}
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
 8013b8c:	300b      	movi      	r0, 11
 8013b8e:	3100      	movi      	r1, 0
 8013b90:	e3fff208 	bsr      	0x8011fa0	// 8011fa0 <HAL_NVIC_SetPriority>
		HAL_NVIC_EnableIRQ(ADC_IRQn);
 8013b94:	300b      	movi      	r0, 11
 8013b96:	e3fff21f 	bsr      	0x8011fd4	// 8011fd4 <HAL_NVIC_EnableIRQ>
	}
}
 8013b9a:	1490      	pop      	r15
		else if (hadc->Init.channel == ADC_CHANNEL_1)
 8013b9c:	eb430100 	cmpnei      	r3, 256
 8013ba0:	080f      	bt      	0x8013bbe	// 8013bbe <HAL_ADC_MspInit+0x7a>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8013ba2:	116b      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
 8013ba4:	9344      	ld.w      	r2, (r3, 0x10)
 8013ba6:	3a84      	bclri      	r2, 4
 8013ba8:	b344      	st.w      	r2, (r3, 0x10)
 8013baa:	9342      	ld.w      	r2, (r3, 0x8)
 8013bac:	3a84      	bclri      	r2, 4
 8013bae:	b342      	st.w      	r2, (r3, 0x8)
 8013bb0:	9343      	ld.w      	r2, (r3, 0xc)
 8013bb2:	ec420010 	ori      	r2, r2, 16
 8013bb6:	b343      	st.w      	r2, (r3, 0xc)
 8013bb8:	9347      	ld.w      	r2, (r3, 0x1c)
 8013bba:	3a84      	bclri      	r2, 4
 8013bbc:	07e7      	br      	0x8013b8a	// 8013b8a <HAL_ADC_MspInit+0x46>
		else if (hadc->Init.channel == ADC_CHANNEL_2)
 8013bbe:	eb430200 	cmpnei      	r3, 512
 8013bc2:	080f      	bt      	0x8013be0	// 8013be0 <HAL_ADC_MspInit+0x9c>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8013bc4:	1162      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
 8013bc6:	9344      	ld.w      	r2, (r3, 0x10)
 8013bc8:	3a83      	bclri      	r2, 3
 8013bca:	b344      	st.w      	r2, (r3, 0x10)
 8013bcc:	9342      	ld.w      	r2, (r3, 0x8)
 8013bce:	3a83      	bclri      	r2, 3
 8013bd0:	b342      	st.w      	r2, (r3, 0x8)
 8013bd2:	9343      	ld.w      	r2, (r3, 0xc)
 8013bd4:	ec420008 	ori      	r2, r2, 8
 8013bd8:	b343      	st.w      	r2, (r3, 0xc)
 8013bda:	9347      	ld.w      	r2, (r3, 0x1c)
 8013bdc:	3a83      	bclri      	r2, 3
 8013bde:	07d6      	br      	0x8013b8a	// 8013b8a <HAL_ADC_MspInit+0x46>
		else if (hadc->Init.channel == ADC_CHANNEL_3)
 8013be0:	eb430300 	cmpnei      	r3, 768
 8013be4:	080f      	bt      	0x8013c02	// 8013c02 <HAL_ADC_MspInit+0xbe>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8013be6:	107a      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
 8013be8:	9344      	ld.w      	r2, (r3, 0x10)
 8013bea:	3a82      	bclri      	r2, 2
 8013bec:	b344      	st.w      	r2, (r3, 0x10)
 8013bee:	9342      	ld.w      	r2, (r3, 0x8)
 8013bf0:	3a82      	bclri      	r2, 2
 8013bf2:	b342      	st.w      	r2, (r3, 0x8)
 8013bf4:	9343      	ld.w      	r2, (r3, 0xc)
 8013bf6:	ec420004 	ori      	r2, r2, 4
 8013bfa:	b343      	st.w      	r2, (r3, 0xc)
 8013bfc:	9347      	ld.w      	r2, (r3, 0x1c)
 8013bfe:	3a82      	bclri      	r2, 2
 8013c00:	07c5      	br      	0x8013b8a	// 8013b8a <HAL_ADC_MspInit+0x46>
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
 8013c02:	eb430800 	cmpnei      	r3, 2048
 8013c06:	0810      	bt      	0x8013c26	// 8013c26 <HAL_ADC_MspInit+0xe2>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
 8013c08:	1071      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
 8013c0a:	9344      	ld.w      	r2, (r3, 0x10)
 8013c0c:	3a81      	bclri      	r2, 1
 8013c0e:	b344      	st.w      	r2, (r3, 0x10)
 8013c10:	9342      	ld.w      	r2, (r3, 0x8)
 8013c12:	3a81      	bclri      	r2, 1
 8013c14:	b342      	st.w      	r2, (r3, 0x8)
 8013c16:	9343      	ld.w      	r2, (r3, 0xc)
 8013c18:	ec420002 	ori      	r2, r2, 2
 8013c1c:	b343      	st.w      	r2, (r3, 0xc)
 8013c1e:	9347      	ld.w      	r2, (r3, 0x1c)
 8013c20:	3a81      	bclri      	r2, 1
 8013c22:	b347      	st.w      	r2, (r3, 0x1c)
 8013c24:	07c0      	br      	0x8013ba4	// 8013ba4 <HAL_ADC_MspInit+0x60>
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
 8013c26:	eb430900 	cmpnei      	r3, 2304
 8013c2a:	0bb1      	bt      	0x8013b8c	// 8013b8c <HAL_ADC_MspInit+0x48>
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
 8013c2c:	1068      	lrw      	r3, 0x40011200	// 8013c4c <HAL_ADC_MspInit+0x108>
 8013c2e:	9344      	ld.w      	r2, (r3, 0x10)
 8013c30:	3a83      	bclri      	r2, 3
 8013c32:	b344      	st.w      	r2, (r3, 0x10)
 8013c34:	9342      	ld.w      	r2, (r3, 0x8)
 8013c36:	3a83      	bclri      	r2, 3
 8013c38:	b342      	st.w      	r2, (r3, 0x8)
 8013c3a:	9343      	ld.w      	r2, (r3, 0xc)
 8013c3c:	ec420008 	ori      	r2, r2, 8
 8013c40:	b343      	st.w      	r2, (r3, 0xc)
 8013c42:	9347      	ld.w      	r2, (r3, 0x1c)
 8013c44:	3a83      	bclri      	r2, 3
 8013c46:	b347      	st.w      	r2, (r3, 0x1c)
 8013c48:	07d0      	br      	0x8013be8	// 8013be8 <HAL_ADC_MspInit+0xa4>
 8013c4a:	0000      	.short	0x0000
 8013c4c:	40011200 	.long	0x40011200

08013c50 <HAL_ADC_ConvCpltCallback>:

/* USER CODE BEGIN 2 */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}
 8013c50:	783c      	jmp      	r15
	...

08013c54 <delay_ms>:
}

void delay_ms(uint16_t nms)
{
  uint16_t i,j,k; 
	for(i = 0; i < nms; i++)
 8013c54:	3200      	movi      	r2, 0
 8013c56:	640a      	cmpne      	r2, r0
 8013c58:	080e      	bt      	0x8013c74	// 8013c74 <delay_ms+0x20>
			{  
				__NOP();  // nop's may be added or removed for timing  
			} 
		}
	}	
}
 8013c5a:	783c      	jmp      	r15
    __ASM volatile("nop");
 8013c5c:	6c03      	mov      	r0, r0
 8013c5e:	2900      	subi      	r1, 1
 8013c60:	7445      	zexth      	r1, r1
			while(k--)
 8013c62:	e921fffd 	bnez      	r1, 0x8013c5c	// 8013c5c <delay_ms+0x8>
 8013c66:	2b00      	subi      	r3, 1
 8013c68:	74cd      	zexth      	r3, r3
		for(j = 0; j < 1000; j++)
 8013c6a:	e9230007 	bnez      	r3, 0x8013c78	// 8013c78 <delay_ms+0x24>
	for(i = 0; i < nms; i++)
 8013c6e:	2200      	addi      	r2, 1
 8013c70:	7489      	zexth      	r2, r2
 8013c72:	07f2      	br      	0x8013c56	// 8013c56 <delay_ms+0x2>
 8013c74:	33fa      	movi      	r3, 250
 8013c76:	4362      	lsli      	r3, r3, 2
{
 8013c78:	3134      	movi      	r1, 52
 8013c7a:	07f2      	br      	0x8013c5e	// 8013c5e <delay_ms+0xa>

08013c7c <MY_BSP_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_BSP_Init(void)
{
 8013c7c:	14d0      	push      	r15
	APP_INT(MY_KEY);
 8013c7e:	e0000019 	bsr      	0x8013cb0	// 8013cb0 <MY_KEY_Init>
	APP_INT(MY_LED);
 8013c82:	e000004b 	bsr      	0x8013d18	// 8013d18 <MY_LED_Init>
	APP_INT(MY_TIM);
 8013c86:	e00000c7 	bsr      	0x8013e14	// 8013e14 <MY_TIM_Init>
	APP_INT(MY_ADC);
 8013c8a:	e3ffff49 	bsr      	0x8013b1c	// 8013b1c <MY_ADC_Init>
	APP_INT(MY_I2C);
 8013c8e:	e0000215 	bsr      	0x80140b8	// 80140b8 <MY_I2C_Init>
	APP_INT(MY_OLED);
 8013c92:	e000011d 	bsr      	0x8013ecc	// 8013ecc <MY_OLED_Init>
	APP_INT(MY_PWM);
 8013c96:	e00000dd 	bsr      	0x8013e50	// 8013e50 <MY_PWM_Init>
	APP_INT(MY_MOTOR);
 8013c9a:	e00002e3 	bsr      	0x8014260	// 8014260 <MY_MOTOR_Init>
	APP_INT(MY_RGB);
 8013c9e:	e0000321 	bsr      	0x80142e0	// 80142e0 <MY_RGB_Init>
	//APP_INT(MY_RTC);
	//APP_INT(MY_IIC);
	//APP_INT(MY_WWDG);
	//APP_INT(MY_PMU);
}
 8013ca2:	1490      	pop      	r15

08013ca4 <MY_APP_Test>:

/* USER CODE BEGIN 2 */
void MY_APP_Test(void)
{
 8013ca4:	14d0      	push      	r15
	APP_TEST(MY_OLED);
 8013ca6:	e00001ed 	bsr      	0x8014080	// 8014080 <MY_OLED_Test>
	APP_TEST(MY_MOTOR);
 8013caa:	e0000317 	bsr      	0x80142d8	// 80142d8 <MY_MOTOR_Test>
	//APP_TEST(MY_ERROM);
}
 8013cae:	1490      	pop      	r15

08013cb0 <MY_KEY_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_KEY_Init(void)
{
 8013cb0:	14d0      	push      	r15
 8013cb2:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8013cb4:	6c3b      	mov      	r0, r14
 8013cb6:	320c      	movi      	r2, 12
 8013cb8:	3100      	movi      	r1, 0
 8013cba:	e3ffee77 	bsr      	0x80119a8	// 80119a8 <__memset_fast>
	__HAL_RCC_GPIO_CLK_ENABLE();
 8013cbe:	ea224000 	movih      	r2, 16384
 8013cc2:	e4420dff 	addi      	r2, r2, 3584
	
	GPIO_InitStruct.Pin = GPIO_PIN_5;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013cc6:	6c7b      	mov      	r1, r14
	__HAL_RCC_GPIO_CLK_ENABLE();
 8013cc8:	9260      	ld.w      	r3, (r2, 0x0)
 8013cca:	ec630800 	ori      	r3, r3, 2048
 8013cce:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Pin = GPIO_PIN_5;
 8013cd0:	3320      	movi      	r3, 32
 8013cd2:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
 8013cd4:	3388      	movi      	r3, 136
 8013cd6:	b861      	st.w      	r3, (r14, 0x4)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013cd8:	1007      	lrw      	r0, 0x40011400	// 8013cf4 <MY_KEY_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_PULLUP;
 8013cda:	3313      	movi      	r3, 19
 8013cdc:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013cde:	e3ffefef 	bsr      	0x8011cbc	// 8011cbc <HAL_GPIO_Init>
	
	HAL_NVIC_SetPriority(GPIOB_IRQn, 0);
 8013ce2:	3100      	movi      	r1, 0
 8013ce4:	300f      	movi      	r0, 15
 8013ce6:	e3fff15d 	bsr      	0x8011fa0	// 8011fa0 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(GPIOB_IRQn);
 8013cea:	300f      	movi      	r0, 15
 8013cec:	e3fff174 	bsr      	0x8011fd4	// 8011fd4 <HAL_NVIC_EnableIRQ>
}
 8013cf0:	1403      	addi      	r14, r14, 12
 8013cf2:	1490      	pop      	r15
 8013cf4:	40011400 	.long	0x40011400

08013cf8 <HAL_GPIO_EXTI_Callback>:

/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin)
{
 8013cf8:	14d0      	push      	r15
	if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_5))
 8013cfa:	1067      	lrw      	r3, 0x40011400	// 8013d14 <HAL_GPIO_EXTI_Callback+0x1c>
 8013cfc:	64c2      	cmpne      	r0, r3
 8013cfe:	0809      	bt      	0x8013d10	// 8013d10 <HAL_GPIO_EXTI_Callback+0x18>
 8013d00:	eb410020 	cmpnei      	r1, 32
 8013d04:	0806      	bt      	0x8013d10	// 8013d10 <HAL_GPIO_EXTI_Callback+0x18>
	{
		delay_ms(20);
 8013d06:	3014      	movi      	r0, 20
 8013d08:	e3ffffa6 	bsr      	0x8013c54	// 8013c54 <delay_ms>
		if ((GPIOx == GPIOB) && (GPIO_Pin == GPIO_PIN_5))
		{
			Led1_Toggle();
 8013d0c:	e0000028 	bsr      	0x8013d5c	// 8013d5c <Led1_Toggle>
		}
	}
}
 8013d10:	1490      	pop      	r15
 8013d12:	0000      	.short	0x0000
 8013d14:	40011400 	.long	0x40011400

08013d18 <MY_LED_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_LED_Init(void)
{
 8013d18:	14d1      	push      	r4, r15
 8013d1a:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8013d1c:	6c3b      	mov      	r0, r14
 8013d1e:	320c      	movi      	r2, 12
 8013d20:	3100      	movi      	r1, 0
 8013d22:	e3ffee43 	bsr      	0x80119a8	// 80119a8 <__memset_fast>
	__HAL_RCC_GPIO_CLK_ENABLE();
 8013d26:	ea224000 	movih      	r2, 16384
 8013d2a:	e4420dff 	addi      	r2, r2, 3584

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
 8013d2e:	3407      	movi      	r4, 7
	__HAL_RCC_GPIO_CLK_ENABLE();
 8013d30:	9260      	ld.w      	r3, (r2, 0x0)
 8013d32:	ec630800 	ori      	r3, r3, 2048
 8013d36:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8013d38:	3302      	movi      	r3, 2
 8013d3a:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013d3c:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 8013d3e:	3312      	movi      	r3, 18
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013d40:	1006      	lrw      	r0, 0x40011400	// 8013d58 <MY_LED_Init+0x40>
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 8013d42:	b862      	st.w      	r3, (r14, 0x8)
	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
 8013d44:	b880      	st.w      	r4, (r14, 0x0)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8013d46:	e3ffefbb 	bsr      	0x8011cbc	// 8011cbc <HAL_GPIO_Init>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2, GPIO_PIN_SET);
 8013d4a:	3201      	movi      	r2, 1
 8013d4c:	6c53      	mov      	r1, r4
 8013d4e:	1003      	lrw      	r0, 0x40011400	// 8013d58 <MY_LED_Init+0x40>
 8013d50:	e3fff05a 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8013d54:	1403      	addi      	r14, r14, 12
 8013d56:	1491      	pop      	r4, r15
 8013d58:	40011400 	.long	0x40011400

08013d5c <Led1_Toggle>:
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_SET);
	}
}

void Led1_Toggle(void)
{
 8013d5c:	14d0      	push      	r15
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0);
 8013d5e:	3101      	movi      	r1, 1
 8013d60:	1002      	lrw      	r0, 0x40011400	// 8013d68 <Led1_Toggle+0xc>
 8013d62:	e3fff061 	bsr      	0x8011e24	// 8011e24 <HAL_GPIO_TogglePin>
}
 8013d66:	1490      	pop      	r15
 8013d68:	40011400 	.long	0x40011400

08013d6c <Led3_Toggle>:
{
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_1);
}

void Led3_Toggle(void)
{
 8013d6c:	14d0      	push      	r15
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);
 8013d6e:	3104      	movi      	r1, 4
 8013d70:	1002      	lrw      	r0, 0x40011400	// 8013d78 <Led3_Toggle+0xc>
 8013d72:	e3fff059 	bsr      	0x8011e24	// 8011e24 <HAL_GPIO_TogglePin>
}
 8013d76:	1490      	pop      	r15
 8013d78:	40011400 	.long	0x40011400

08013d7c <HAL_PMU_Tim0_Callback>:

/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void HAL_PMU_Tim0_Callback(PMU_HandleTypeDef *hpmu)
{
 8013d7c:	14d0      	push      	r15
	printf("pmu tim0 callback\r\n");
 8013d7e:	1003      	lrw      	r0, 0x8015dbf	// 8013d88 <HAL_PMU_Tim0_Callback+0xc>
 8013d80:	e3ffede2 	bsr      	0x8011944	// 8011944 <__GI_puts>
}
 8013d84:	1490      	pop      	r15
 8013d86:	0000      	.short	0x0000
 8013d88:	08015dbf 	.long	0x08015dbf

08013d8c <HAL_PMU_IO_Callback>:

void HAL_PMU_IO_Callback(PMU_HandleTypeDef *hpmu)
{
 8013d8c:	14d0      	push      	r15
	printf("pmu io callback\r\n");
 8013d8e:	1003      	lrw      	r0, 0x8015dae	// 8013d98 <HAL_PMU_IO_Callback+0xc>
 8013d90:	e3ffedda 	bsr      	0x8011944	// 8011944 <__GI_puts>
}
 8013d94:	1490      	pop      	r15
 8013d96:	0000      	.short	0x0000
 8013d98:	08015dae 	.long	0x08015dae

08013d9c <Error_Handler>:

/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void Error_Handler(void)
{
 8013d9c:	0400      	br      	0x8013d9c	// 8013d9c <Error_Handler>
	...

08013da0 <TIM0_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void TIM0_Init(void)
{
 8013da0:	14d0      	push      	r15
	htim0.Instance = TIM0;
 8013da2:	1009      	lrw      	r0, 0x2000698c	// 8013dc4 <TIM0_Init+0x24>
 8013da4:	3300      	movi      	r3, 0
	htim0.Init.Unit = TIM_UNIT_US;
	htim0.Init.Period = 1000000;
 8013da6:	ea02f424 	movi      	r2, 62500
 8013daa:	c4824902 	rotli      	r2, r2, 4
	htim0.Instance = TIM0;
 8013dae:	b060      	st.w      	r3, (r0, 0x0)
	htim0.Init.Unit = TIM_UNIT_US;
 8013db0:	b061      	st.w      	r3, (r0, 0x4)
	htim0.Init.Period = 1000000;
 8013db2:	b043      	st.w      	r2, (r0, 0xc)
	htim0.Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
 8013db4:	b062      	st.w      	r3, (r0, 0x8)
	if (HAL_TIM_Base_Init(&htim0) != HAL_OK)
 8013db6:	e3fff127 	bsr      	0x8012004	// 8012004 <HAL_TIM_Base_Init>
 8013dba:	e9000004 	bez      	r0, 0x8013dc2	// 8013dc2 <TIM0_Init+0x22>
	{
		Error_Handler();
 8013dbe:	e3ffffef 	bsr      	0x8013d9c	// 8013d9c <Error_Handler>
	}
}
 8013dc2:	1490      	pop      	r15
 8013dc4:	2000698c 	.long	0x2000698c

08013dc8 <TIM1_Init>:

void TIM1_Init(void)
{
 8013dc8:	14d0      	push      	r15
	htim1.Instance = TIM1;
 8013dca:	1009      	lrw      	r0, 0x200069a4	// 8013dec <TIM1_Init+0x24>
 8013dcc:	3301      	movi      	r3, 1
 8013dce:	b060      	st.w      	r3, (r0, 0x0)
	htim1.Init.Unit = TIM_UNIT_US;
	htim1.Init.Period = 100000;
 8013dd0:	ea0286a0 	movi      	r2, 34464
 8013dd4:	3ab0      	bseti      	r2, 16
	htim1.Init.Unit = TIM_UNIT_US;
 8013dd6:	3300      	movi      	r3, 0
 8013dd8:	b061      	st.w      	r3, (r0, 0x4)
	htim1.Init.Period = 100000;
 8013dda:	b043      	st.w      	r2, (r0, 0xc)
	htim1.Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
 8013ddc:	b062      	st.w      	r3, (r0, 0x8)
	if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
 8013dde:	e3fff113 	bsr      	0x8012004	// 8012004 <HAL_TIM_Base_Init>
 8013de2:	e9000004 	bez      	r0, 0x8013dea	// 8013dea <TIM1_Init+0x22>
	{
		Error_Handler();
 8013de6:	e3ffffdb 	bsr      	0x8013d9c	// 8013d9c <Error_Handler>
	}
}
 8013dea:	1490      	pop      	r15
 8013dec:	200069a4 	.long	0x200069a4

08013df0 <HAL_TIM_Base_MspInit>:

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* htim_base)
{
 8013df0:	14d0      	push      	r15
	__HAL_RCC_TIM_CLK_ENABLE();
 8013df2:	ea224000 	movih      	r2, 16384
 8013df6:	e4420dff 	addi      	r2, r2, 3584
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 8013dfa:	3100      	movi      	r1, 0
	__HAL_RCC_TIM_CLK_ENABLE();
 8013dfc:	9260      	ld.w      	r3, (r2, 0x0)
 8013dfe:	ec630400 	ori      	r3, r3, 1024
 8013e02:	b260      	st.w      	r3, (r2, 0x0)
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
 8013e04:	301e      	movi      	r0, 30
 8013e06:	e3fff0cd 	bsr      	0x8011fa0	// 8011fa0 <HAL_NVIC_SetPriority>
	HAL_NVIC_EnableIRQ(TIM_IRQn);
 8013e0a:	301e      	movi      	r0, 30
 8013e0c:	e3fff0e4 	bsr      	0x8011fd4	// 8011fd4 <HAL_NVIC_EnableIRQ>
}
 8013e10:	1490      	pop      	r15
	...

08013e14 <MY_TIM_Init>:
	//	HAL_NVIC_DisableIRQ(TIM_IRQn);
}

/* USER CODE BEGIN 2 */
void MY_TIM_Init(void)
{
 8013e14:	14d0      	push      	r15
	TIM0_Init();
 8013e16:	e3ffffc5 	bsr      	0x8013da0	// 8013da0 <TIM0_Init>
	TIM1_Init();
 8013e1a:	e3ffffd7 	bsr      	0x8013dc8	// 8013dc8 <TIM1_Init>
	HAL_TIM_Base_Start_IT(&htim0);
 8013e1e:	1004      	lrw      	r0, 0x2000698c	// 8013e2c <MY_TIM_Init+0x18>
 8013e20:	e3fff134 	bsr      	0x8012088	// 8012088 <HAL_TIM_Base_Start_IT>
	HAL_TIM_Base_Start_IT(&htim1);
 8013e24:	1003      	lrw      	r0, 0x200069a4	// 8013e30 <MY_TIM_Init+0x1c>
 8013e26:	e3fff131 	bsr      	0x8012088	// 8012088 <HAL_TIM_Base_Start_IT>
}
 8013e2a:	1490      	pop      	r15
 8013e2c:	2000698c 	.long	0x2000698c
 8013e30:	200069a4 	.long	0x200069a4

08013e34 <HAL_TIM_Callback>:
/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void HAL_TIM_Callback(TIM_HandleTypeDef *htim)
{
 8013e34:	14d1      	push      	r4, r15
	//printf("%d ", htim->Instance);
	if (htim->Instance == TIM0)
 8013e36:	9060      	ld.w      	r3, (r0, 0x0)
{
 8013e38:	6d03      	mov      	r4, r0
	if (htim->Instance == TIM0)
 8013e3a:	e9230004 	bnez      	r3, 0x8013e42	// 8013e42 <HAL_TIM_Callback+0xe>
	{
		Led1_Toggle();
 8013e3e:	e3ffff8f 	bsr      	0x8013d5c	// 8013d5c <Led1_Toggle>
	}
	if (htim->Instance == TIM1)
 8013e42:	9460      	ld.w      	r3, (r4, 0x0)
 8013e44:	3b41      	cmpnei      	r3, 1
 8013e46:	0803      	bt      	0x8013e4c	// 8013e4c <HAL_TIM_Callback+0x18>
	{
		Led3_Toggle();
 8013e48:	e3ffff92 	bsr      	0x8013d6c	// 8013d6c <Led3_Toggle>
	}
}
 8013e4c:	1491      	pop      	r4, r15
	...

08013e50 <MY_PWM_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_PWM_Init(void)
{
 8013e50:	14d2      	push      	r4-r5, r15
	*                         Pulse > Period ：PWM输出一直为高电平
	*                         Pulse <= Period：PWM输出高电平宽度为(2 * Pulse + 1)，低电平宽度为(2 * (Period - Pulse) + 1)
	*                         Pulse = 0      ：PWM输出高电平宽度为(1)，低电平宽度为(2 * Period + 1)
	*/
	//输出200KHZ,占空比40%的波形
	hpwm.Instance = PWM;
 8013e52:	1090      	lrw      	r4, 0x200069bc	// 8013e90 <MY_PWM_Init+0x40>
 8013e54:	1070      	lrw      	r3, 0x40011e00	// 8013e94 <MY_PWM_Init+0x44>
 8013e56:	b460      	st.w      	r3, (r4, 0x0)
	hpwm.Init.AutoReloadPreload = PWM_AUTORELOAD_PRELOAD_ENABLE;
 8013e58:	3301      	movi      	r3, 1
 8013e5a:	b465      	st.w      	r3, (r4, 0x14)
	hpwm.Init.CounterMode = PWM_COUNTERMODE_EDGEALIGNED_DOWN;
 8013e5c:	b462      	st.w      	r3, (r4, 0x8)
	hpwm.Init.Prescaler = 4;
 8013e5e:	3304      	movi      	r3, 4
 8013e60:	b461      	st.w      	r3, (r4, 0x4)
	hpwm.Init.Period = 100 -1;	// 40M / 4 / 100 = 10KHZ
 8013e62:	3363      	movi      	r3, 99
	hpwm.Init.Pulse = 30 -1;	// 50% DUTY
	hpwm.Init.OutMode = PWM_OUT_MODE_5SYNC;
	hpwm.Channel = ch;
 8013e64:	10ad      	lrw      	r5, 0x20006958	// 8013e98 <MY_PWM_Init+0x48>
	
	HAL_PWM_Init(&hpwm);
 8013e66:	6c13      	mov      	r0, r4
	hpwm.Init.Period = 100 -1;	// 40M / 4 / 100 = 10KHZ
 8013e68:	b463      	st.w      	r3, (r4, 0xc)
	hpwm.Init.Pulse = 30 -1;	// 50% DUTY
 8013e6a:	331d      	movi      	r3, 29
 8013e6c:	b464      	st.w      	r3, (r4, 0x10)
	hpwm.Init.OutMode = PWM_OUT_MODE_5SYNC;
 8013e6e:	3303      	movi      	r3, 3
 8013e70:	b466      	st.w      	r3, (r4, 0x18)
	hpwm.Channel = ch;
 8013e72:	9560      	ld.w      	r3, (r5, 0x0)
 8013e74:	b46a      	st.w      	r3, (r4, 0x28)
	HAL_PWM_Init(&hpwm);
 8013e76:	e3fff33f 	bsr      	0x80124f4	// 80124f4 <HAL_PWM_Init>
	
	HAL_PWM_Start(&hpwm, ch);
 8013e7a:	9520      	ld.w      	r1, (r5, 0x0)
 8013e7c:	6c13      	mov      	r0, r4
 8013e7e:	e3fff369 	bsr      	0x8012550	// 8012550 <HAL_PWM_Start>
	HAL_PWM_Duty_Set(&hpwm, ch, 30);
 8013e82:	321e      	movi      	r2, 30
 8013e84:	9520      	ld.w      	r1, (r5, 0x0)
 8013e86:	6c13      	mov      	r0, r4
 8013e88:	e3fff374 	bsr      	0x8012570	// 8012570 <HAL_PWM_Duty_Set>
}
 8013e8c:	1492      	pop      	r4-r5, r15
 8013e8e:	0000      	.short	0x0000
 8013e90:	200069bc 	.long	0x200069bc
 8013e94:	40011e00 	.long	0x40011e00
 8013e98:	20006958 	.long	0x20006958

08013e9c <HAL_PWM_MspInit>:

/* USER CODE BEGIN 2 */
void HAL_PWM_MspInit(PWM_HandleTypeDef *hpwm)
{
	__HAL_RCC_PWM_CLK_ENABLE();
 8013e9c:	ea224000 	movih      	r2, 16384
 8013ea0:	e4420dff 	addi      	r2, r2, 3584
 8013ea4:	9260      	ld.w      	r3, (r2, 0x0)
 8013ea6:	ec632000 	ori      	r3, r3, 8192
 8013eaa:	b260      	st.w      	r3, (r2, 0x0)
	__HAL_AFIO_REMAP_PWM0(GPIOB, GPIO_PIN_12);
 8013eac:	1067      	lrw      	r3, 0x40011400	// 8013ec8 <HAL_PWM_MspInit+0x2c>
 8013eae:	9344      	ld.w      	r2, (r3, 0x10)
 8013eb0:	ec421000 	ori      	r2, r2, 4096
 8013eb4:	b344      	st.w      	r2, (r3, 0x10)
 8013eb6:	9345      	ld.w      	r2, (r3, 0x14)
 8013eb8:	3a8c      	bclri      	r2, 12
 8013eba:	b345      	st.w      	r2, (r3, 0x14)
 8013ebc:	9346      	ld.w      	r2, (r3, 0x18)
 8013ebe:	ec421000 	ori      	r2, r2, 4096
 8013ec2:	b346      	st.w      	r2, (r3, 0x18)
}
 8013ec4:	783c      	jmp      	r15
 8013ec6:	0000      	.short	0x0000
 8013ec8:	40011400 	.long	0x40011400

08013ecc <MY_OLED_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_OLED_Init(void)
{
 8013ecc:	14d0      	push      	r15
	{
		Write_I2C_Data(dat);
	}
	else
	{
		Write_I2C_Command(dat);
 8013ece:	30ae      	movi      	r0, 174
 8013ed0:	e000017e 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013ed4:	3000      	movi      	r0, 0
 8013ed6:	e000017b 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013eda:	3010      	movi      	r0, 16
 8013edc:	e0000178 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013ee0:	3040      	movi      	r0, 64
 8013ee2:	e0000175 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013ee6:	30b0      	movi      	r0, 176
 8013ee8:	e0000172 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013eec:	3081      	movi      	r0, 129
 8013eee:	e000016f 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013ef2:	30ff      	movi      	r0, 255
 8013ef4:	e000016c 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013ef8:	30a1      	movi      	r0, 161
 8013efa:	e0000169 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013efe:	30a6      	movi      	r0, 166
 8013f00:	e0000166 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f04:	30a8      	movi      	r0, 168
 8013f06:	e0000163 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f0a:	303f      	movi      	r0, 63
 8013f0c:	e0000160 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f10:	30c8      	movi      	r0, 200
 8013f12:	e000015d 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f16:	30d3      	movi      	r0, 211
 8013f18:	e000015a 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f1c:	3000      	movi      	r0, 0
 8013f1e:	e0000157 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f22:	30d5      	movi      	r0, 213
 8013f24:	e0000154 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f28:	3080      	movi      	r0, 128
 8013f2a:	e0000151 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f2e:	30d8      	movi      	r0, 216
 8013f30:	e000014e 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f34:	3005      	movi      	r0, 5
 8013f36:	e000014b 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f3a:	30d9      	movi      	r0, 217
 8013f3c:	e0000148 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f40:	30f1      	movi      	r0, 241
 8013f42:	e0000145 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f46:	30da      	movi      	r0, 218
 8013f48:	e0000142 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f4c:	3012      	movi      	r0, 18
 8013f4e:	e000013f 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f52:	30db      	movi      	r0, 219
 8013f54:	e000013c 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f58:	3030      	movi      	r0, 48
 8013f5a:	e0000139 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f5e:	308d      	movi      	r0, 141
 8013f60:	e0000136 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f64:	3014      	movi      	r0, 20
 8013f66:	e0000133 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f6a:	30af      	movi      	r0, 175
 8013f6c:	e0000130 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
}
 8013f70:	1490      	pop      	r15
	...

08013f74 <OLED_Set_Pos>:
}

//坐标设置

void OLED_Set_Pos(unsigned char x, unsigned char y)
{
 8013f74:	14d1      	push      	r4, r15
	OLED_WR_Byte(0xb0+y,OLED_CMD);
 8013f76:	21af      	addi      	r1, 176
{
 8013f78:	6d03      	mov      	r4, r0
		Write_I2C_Command(dat);
 8013f7a:	7404      	zextb      	r0, r1
 8013f7c:	e0000128 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
	OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
 8013f80:	4c04      	lsri      	r0, r4, 4
		Write_I2C_Command(dat);
 8013f82:	ec000010 	ori      	r0, r0, 16
 8013f86:	e0000123 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f8a:	e404200f 	andi      	r0, r4, 15
 8013f8e:	e000011f 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
	OLED_WR_Byte((x&0x0f),OLED_CMD);
}
 8013f92:	1491      	pop      	r4, r15

08013f94 <OLED_Clear>:
	OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
	OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
}
//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!
void OLED_Clear(void)
{
 8013f94:	14d2      	push      	r4-r5, r15
 8013f96:	34b0      	movi      	r4, 176
		Write_I2C_Command(dat);
 8013f98:	6c13      	mov      	r0, r4
 8013f9a:	e0000119 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013f9e:	3000      	movi      	r0, 0
 8013fa0:	e0000116 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
 8013fa4:	3010      	movi      	r0, 16
 8013fa6:	e0000113 	bsr      	0x80141cc	// 80141cc <Write_I2C_Command>
	for(i=0;i<8;i++)
	{
		OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
		OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
		OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址
		for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA);
 8013faa:	3581      	movi      	r5, 129
 8013fac:	2d00      	subi      	r5, 1
 8013fae:	e9250008 	bnez      	r5, 0x8013fbe	// 8013fbe <OLED_Clear+0x2a>
 8013fb2:	2400      	addi      	r4, 1
 8013fb4:	7510      	zextb      	r4, r4
	for(i=0;i<8;i++)
 8013fb6:	eb4400b8 	cmpnei      	r4, 184
 8013fba:	0bef      	bt      	0x8013f98	// 8013f98 <OLED_Clear+0x4>
	} //更新显示
}
 8013fbc:	1492      	pop      	r4-r5, r15
		Write_I2C_Data(dat);
 8013fbe:	3000      	movi      	r0, 0
 8013fc0:	e000011c 	bsr      	0x80141f8	// 80141f8 <Write_I2C_Data>
 8013fc4:	07f4      	br      	0x8013fac	// 8013fac <OLED_Clear+0x18>
	...

08013fc8 <OLED_ShowChar>:
//x:0~127
//y:0~63
//mode:0,反白显示;1,正常显示
//size:选择字体 16/12
void OLED_ShowChar(uint8_t x,uint8_t y,uint8_t chr,uint8_t Size)
{
 8013fc8:	14d4      	push      	r4-r7, r15
	unsigned char c=0,i=0;
	c=chr-' ';//得到偏移后的值
 8013fca:	e482101f 	subi      	r4, r2, 32
	if(x>Max_Column-1){x=0;y=y+2;}
 8013fce:	7482      	sextb      	r2, r0
{
 8013fd0:	6d83      	mov      	r6, r0
 8013fd2:	6d47      	mov      	r5, r1
	c=chr-' ';//得到偏移后的值
 8013fd4:	7510      	zextb      	r4, r4
	if(x>Max_Column-1){x=0;y=y+2;}
 8013fd6:	e9a20005 	bhsz      	r2, 0x8013fe0	// 8013fe0 <OLED_ShowChar+0x18>
 8013fda:	2501      	addi      	r5, 2
 8013fdc:	7554      	zextb      	r5, r5
 8013fde:	3600      	movi      	r6, 0
	if(Size ==16)
 8013fe0:	3b50      	cmpnei      	r3, 16
	{
		OLED_Set_Pos(x,y);
 8013fe2:	6c57      	mov      	r1, r5
 8013fe4:	6c1b      	mov      	r0, r6
 8013fe6:	7513      	sexth      	r4, r4
	if(Size ==16)
 8013fe8:	081c      	bt      	0x8014020	// 8014020 <OLED_ShowChar+0x58>
		OLED_Set_Pos(x,y);
 8013fea:	e3ffffc5 	bsr      	0x8013f74	// 8013f74 <OLED_Set_Pos>
		for(i=0;i<8;i++)
			OLED_WR_Byte(F8X16[c*16+i],OLED_DATA);
 8013fee:	4484      	lsli      	r4, r4, 4
 8013ff0:	1074      	lrw      	r3, 0x8016015	// 8014040 <OLED_ShowChar+0x78>
 8013ff2:	3700      	movi      	r7, 0
 8013ff4:	610c      	addu      	r4, r3
		Write_I2C_Data(dat);
 8013ff6:	d0e40020 	ldr.b      	r0, (r4, r7 << 0)
 8013ffa:	2700      	addi      	r7, 1
 8013ffc:	e00000fe 	bsr      	0x80141f8	// 80141f8 <Write_I2C_Data>
		for(i=0;i<8;i++)
 8014000:	3f48      	cmpnei      	r7, 8
 8014002:	0bfa      	bt      	0x8013ff6	// 8013ff6 <OLED_ShowChar+0x2e>
		OLED_Set_Pos(x,y+1);
 8014004:	5d22      	addi      	r1, r5, 1
 8014006:	7444      	zextb      	r1, r1
 8014008:	6c1b      	mov      	r0, r6
 801400a:	e3ffffb5 	bsr      	0x8013f74	// 8013f74 <OLED_Set_Pos>
 801400e:	3500      	movi      	r5, 0
		for(i=0;i<8;i++)
			OLED_WR_Byte(F8X16[c*16+i+8],OLED_DATA);
 8014010:	5c74      	addu      	r3, r4, r5
 8014012:	2500      	addi      	r5, 1
		Write_I2C_Data(dat);
 8014014:	8308      	ld.b      	r0, (r3, 0x8)
 8014016:	e00000f1 	bsr      	0x80141f8	// 80141f8 <Write_I2C_Data>
		for(i=0;i<8;i++)
 801401a:	3d48      	cmpnei      	r5, 8
 801401c:	0bfa      	bt      	0x8014010	// 8014010 <OLED_ShowChar+0x48>
	{
		OLED_Set_Pos(x,y);
		for(i=0;i<6;i++)
			OLED_WR_Byte(F6x8[c][i],OLED_DATA);
	}
}
 801401e:	1494      	pop      	r4-r7, r15
		OLED_Set_Pos(x,y);
 8014020:	e3ffffaa 	bsr      	0x8013f74	// 8013f74 <OLED_Set_Pos>
 8014024:	5c50      	addu      	r2, r4, r4
 8014026:	6108      	addu      	r4, r2
 8014028:	6110      	addu      	r4, r4
 801402a:	1067      	lrw      	r3, 0x8015ded	// 8014044 <OLED_ShowChar+0x7c>
 801402c:	610c      	addu      	r4, r3
 801402e:	3500      	movi      	r5, 0
		Write_I2C_Data(dat);
 8014030:	d0a40020 	ldr.b      	r0, (r4, r5 << 0)
 8014034:	2500      	addi      	r5, 1
 8014036:	e00000e1 	bsr      	0x80141f8	// 80141f8 <Write_I2C_Data>
		for(i=0;i<6;i++)
 801403a:	3d46      	cmpnei      	r5, 6
 801403c:	0bfa      	bt      	0x8014030	// 8014030 <OLED_ShowChar+0x68>
 801403e:	07f0      	br      	0x801401e	// 801401e <OLED_ShowChar+0x56>
 8014040:	08016015 	.long	0x08016015
 8014044:	08015ded 	.long	0x08015ded

08014048 <OLED_ShowString>:
	 	OLED_ShowChar(x+(size2/2)*t,y,temp+'0',size2);
	}
}
//显示一个字符号串
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Size)
{
 8014048:	14d5      	push      	r4-r8, r15
 801404a:	6d03      	mov      	r4, r0
 801404c:	6d87      	mov      	r6, r1
 801404e:	6dcb      	mov      	r7, r2
 8014050:	6e0f      	mov      	r8, r3
	unsigned char j=0;
 8014052:	3500      	movi      	r5, 0
	while (chr[j]!='\0')
 8014054:	d0a70022 	ldr.b      	r2, (r7, r5 << 0)
 8014058:	e9220003 	bnez      	r2, 0x801405e	// 801405e <OLED_ShowString+0x16>
		OLED_ShowChar(x,y,chr[j],Size);
			x+=8;
		if(x>120){x=0;y+=2;}
			j++;
	}
}
 801405c:	1495      	pop      	r4-r8, r15
		OLED_ShowChar(x,y,chr[j],Size);
 801405e:	6c13      	mov      	r0, r4
			x+=8;
 8014060:	2407      	addi      	r4, 8
		OLED_ShowChar(x,y,chr[j],Size);
 8014062:	6ce3      	mov      	r3, r8
 8014064:	6c5b      	mov      	r1, r6
			x+=8;
 8014066:	7510      	zextb      	r4, r4
		OLED_ShowChar(x,y,chr[j],Size);
 8014068:	e3ffffb0 	bsr      	0x8013fc8	// 8013fc8 <OLED_ShowChar>
		if(x>120){x=0;y+=2;}
 801406c:	eb040078 	cmphsi      	r4, 121
 8014070:	0c04      	bf      	0x8014078	// 8014078 <OLED_ShowString+0x30>
 8014072:	2601      	addi      	r6, 2
 8014074:	7598      	zextb      	r6, r6
 8014076:	3400      	movi      	r4, 0
			j++;
 8014078:	2500      	addi      	r5, 1
 801407a:	7554      	zextb      	r5, r5
 801407c:	07ec      	br      	0x8014054	// 8014054 <OLED_ShowString+0xc>
	...

08014080 <MY_OLED_Test>:
}
#endif

/* USER CODE END 2 */
void MY_OLED_Test(void)
{
 8014080:	14d0      	push      	r15
	OLED_Clear();
 8014082:	e3ffff89 	bsr      	0x8013f94	// 8013f94 <OLED_Clear>
	OLED_ShowString(0,0,(uint8_t *)"CDK:W806",12);
 8014086:	3100      	movi      	r1, 0
 8014088:	6c07      	mov      	r0, r1
 801408a:	330c      	movi      	r3, 12
 801408c:	1048      	lrw      	r2, 0x8015dd2	// 80140ac <MY_OLED_Test+0x2c>
 801408e:	e3ffffdd 	bsr      	0x8014048	// 8014048 <OLED_ShowString>
	OLED_ShowString(0,2,(uint8_t *)"Jaymie",12);
 8014092:	330c      	movi      	r3, 12
 8014094:	1047      	lrw      	r2, 0x8015ddb	// 80140b0 <MY_OLED_Test+0x30>
 8014096:	3102      	movi      	r1, 2
 8014098:	3000      	movi      	r0, 0
 801409a:	e3ffffd7 	bsr      	0x8014048	// 8014048 <OLED_ShowString>
	OLED_ShowString(0,3,(uint8_t *)"2021-10-31",12);
 801409e:	330c      	movi      	r3, 12
 80140a0:	1045      	lrw      	r2, 0x8015de2	// 80140b4 <MY_OLED_Test+0x34>
 80140a2:	3103      	movi      	r1, 3
 80140a4:	3000      	movi      	r0, 0
 80140a6:	e3ffffd1 	bsr      	0x8014048	// 8014048 <OLED_ShowString>
}
 80140aa:	1490      	pop      	r15
 80140ac:	08015dd2 	.long	0x08015dd2
 80140b0:	08015ddb 	.long	0x08015ddb
 80140b4:	08015de2 	.long	0x08015de2

080140b8 <MY_I2C_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_I2C_Init(void)
{
 80140b8:	14d0      	push      	r15
 80140ba:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 80140bc:	6c3b      	mov      	r0, r14
 80140be:	320c      	movi      	r2, 12
 80140c0:	3100      	movi      	r1, 0
 80140c2:	e3ffec73 	bsr      	0x80119a8	// 80119a8 <__memset_fast>
	__HAL_RCC_GPIO_CLK_ENABLE();
 80140c6:	ea224000 	movih      	r2, 16384
 80140ca:	e4420dff 	addi      	r2, r2, 3584

	GPIO_InitStruct.Pin = GPIO_PIN_7 | GPIO_PIN_8;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80140ce:	6c7b      	mov      	r1, r14
	__HAL_RCC_GPIO_CLK_ENABLE();
 80140d0:	9260      	ld.w      	r3, (r2, 0x0)
 80140d2:	ec630800 	ori      	r3, r3, 2048
 80140d6:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Pin = GPIO_PIN_7 | GPIO_PIN_8;
 80140d8:	33c0      	movi      	r3, 192
 80140da:	4361      	lsli      	r3, r3, 1
 80140dc:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 80140de:	3302      	movi      	r3, 2
 80140e0:	b861      	st.w      	r3, (r14, 0x4)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80140e2:	1007      	lrw      	r0, 0x40011400	// 80140fc <MY_I2C_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 80140e4:	3312      	movi      	r3, 18
 80140e6:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 80140e8:	e3ffedea 	bsr      	0x8011cbc	// 8011cbc <HAL_GPIO_Init>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2, GPIO_PIN_SET);
 80140ec:	3201      	movi      	r2, 1
 80140ee:	3107      	movi      	r1, 7
 80140f0:	1003      	lrw      	r0, 0x40011400	// 80140fc <MY_I2C_Init+0x44>
 80140f2:	e3ffee89 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 80140f6:	1403      	addi      	r14, r14, 12
 80140f8:	1490      	pop      	r15
 80140fa:	0000      	.short	0x0000
 80140fc:	40011400 	.long	0x40011400

08014100 <I2C_Start>:

/* USER CODE BEGIN 2 */
void I2C_Start(void)
{
 8014100:	14d0      	push      	r15

	OLED_SCLK_Set() ;
 8014102:	3201      	movi      	r2, 1
 8014104:	3180      	movi      	r1, 128
 8014106:	100b      	lrw      	r0, 0x40011400	// 8014130 <I2C_Start+0x30>
 8014108:	e3ffee7e 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	OLED_SDIN_Set();
 801410c:	3201      	movi      	r2, 1
 801410e:	3180      	movi      	r1, 128
 8014110:	7048      	lsl      	r1, r2
 8014112:	1008      	lrw      	r0, 0x40011400	// 8014130 <I2C_Start+0x30>
 8014114:	e3ffee78 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	OLED_SDIN_Clr();
 8014118:	3180      	movi      	r1, 128
 801411a:	3200      	movi      	r2, 0
 801411c:	4121      	lsli      	r1, r1, 1
 801411e:	1005      	lrw      	r0, 0x40011400	// 8014130 <I2C_Start+0x30>
 8014120:	e3ffee72 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	OLED_SCLK_Clr();
 8014124:	3200      	movi      	r2, 0
 8014126:	3180      	movi      	r1, 128
 8014128:	1002      	lrw      	r0, 0x40011400	// 8014130 <I2C_Start+0x30>
 801412a:	e3ffee6d 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 801412e:	1490      	pop      	r15
 8014130:	40011400 	.long	0x40011400

08014134 <I2C_Stop>:

void I2C_Stop(void)
{
 8014134:	14d0      	push      	r15
	OLED_SCLK_Set() ;
 8014136:	3201      	movi      	r2, 1
 8014138:	3180      	movi      	r1, 128
 801413a:	1009      	lrw      	r0, 0x40011400	// 801415c <I2C_Stop+0x28>
 801413c:	e3ffee64 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
//	OLED_SCLK_Clr();
	OLED_SDIN_Clr();
 8014140:	3180      	movi      	r1, 128
 8014142:	3200      	movi      	r2, 0
 8014144:	4121      	lsli      	r1, r1, 1
 8014146:	1006      	lrw      	r0, 0x40011400	// 801415c <I2C_Stop+0x28>
 8014148:	e3ffee5e 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	OLED_SDIN_Set();
 801414c:	3201      	movi      	r2, 1
 801414e:	3180      	movi      	r1, 128
 8014150:	7048      	lsl      	r1, r2
 8014152:	1003      	lrw      	r0, 0x40011400	// 801415c <I2C_Stop+0x28>
 8014154:	e3ffee58 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8014158:	1490      	pop      	r15
 801415a:	0000      	.short	0x0000
 801415c:	40011400 	.long	0x40011400

08014160 <I2C_Wait_Ack>:

void I2C_Wait_Ack()
{
 8014160:	14d0      	push      	r15
	OLED_SCLK_Set() ;
 8014162:	3201      	movi      	r2, 1
 8014164:	3180      	movi      	r1, 128
 8014166:	1005      	lrw      	r0, 0x40011400	// 8014178 <I2C_Wait_Ack+0x18>
 8014168:	e3ffee4e 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	OLED_SCLK_Clr();
 801416c:	3200      	movi      	r2, 0
 801416e:	3180      	movi      	r1, 128
 8014170:	1002      	lrw      	r0, 0x40011400	// 8014178 <I2C_Wait_Ack+0x18>
 8014172:	e3ffee49 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8014176:	1490      	pop      	r15
 8014178:	40011400 	.long	0x40011400

0801417c <Write_I2C_Byte>:

void Write_I2C_Byte(unsigned char I2C_Byte)
{
 801417c:	14d2      	push      	r4-r5, r15
 801417e:	6d03      	mov      	r4, r0
	unsigned char i;
	unsigned char m,da;
	da = I2C_Byte;
	OLED_SCLK_Clr();
 8014180:	3200      	movi      	r2, 0
 8014182:	3180      	movi      	r1, 128
 8014184:	1011      	lrw      	r0, 0x40011400	// 80141c8 <Write_I2C_Byte+0x4c>
 8014186:	e3ffee3f 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
 801418a:	3508      	movi      	r5, 8
	for(i=0;i<8;i++)
	{
		m=da;
		//	OLED_SCLK_Clr();
		m=m&0x80;
		if(m==0x80)
 801418c:	74d2      	sextb      	r3, r4
 801418e:	e9a30019 	bhsz      	r3, 0x80141c0	// 80141c0 <Write_I2C_Byte+0x44>
		{OLED_SDIN_Set();}
 8014192:	3201      	movi      	r2, 1
 8014194:	3180      	movi      	r1, 128
 8014196:	7048      	lsl      	r1, r2
		else OLED_SDIN_Clr();
 8014198:	100c      	lrw      	r0, 0x40011400	// 80141c8 <Write_I2C_Byte+0x4c>
 801419a:	2d00      	subi      	r5, 1
 801419c:	e3ffee34 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
 80141a0:	7554      	zextb      	r5, r5
		da=da<<1;
		OLED_SCLK_Set();
 80141a2:	3201      	movi      	r2, 1
 80141a4:	3180      	movi      	r1, 128
 80141a6:	1009      	lrw      	r0, 0x40011400	// 80141c8 <Write_I2C_Byte+0x4c>
 80141a8:	e3ffee2e 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
		da=da<<1;
 80141ac:	6110      	addu      	r4, r4
		OLED_SCLK_Clr();
 80141ae:	3200      	movi      	r2, 0
 80141b0:	3180      	movi      	r1, 128
 80141b2:	1006      	lrw      	r0, 0x40011400	// 80141c8 <Write_I2C_Byte+0x4c>
		da=da<<1;
 80141b4:	7510      	zextb      	r4, r4
		OLED_SCLK_Clr();
 80141b6:	e3ffee27 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	for(i=0;i<8;i++)
 80141ba:	e925ffe9 	bnez      	r5, 0x801418c	// 801418c <Write_I2C_Byte+0x10>
	}
}
 80141be:	1492      	pop      	r4-r5, r15
		else OLED_SDIN_Clr();
 80141c0:	3180      	movi      	r1, 128
 80141c2:	3200      	movi      	r2, 0
 80141c4:	4121      	lsli      	r1, r1, 1
 80141c6:	07e9      	br      	0x8014198	// 8014198 <Write_I2C_Byte+0x1c>
 80141c8:	40011400 	.long	0x40011400

080141cc <Write_I2C_Command>:

void Write_I2C_Command(unsigned char I2C_Command)
{
 80141cc:	14d1      	push      	r4, r15
 80141ce:	6d03      	mov      	r4, r0
	I2C_Start();
 80141d0:	e3ffff98 	bsr      	0x8014100	// 8014100 <I2C_Start>
	Write_I2C_Byte(0x78);            //Slave address,SA0=0
 80141d4:	3078      	movi      	r0, 120
 80141d6:	e3ffffd3 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 80141da:	e3ffffc3 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	Write_I2C_Byte(0x00);			//write command
 80141de:	3000      	movi      	r0, 0
 80141e0:	e3ffffce 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 80141e4:	e3ffffbe 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	Write_I2C_Byte(I2C_Command);
 80141e8:	6c13      	mov      	r0, r4
 80141ea:	e3ffffc9 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 80141ee:	e3ffffb9 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	I2C_Stop();
 80141f2:	e3ffffa1 	bsr      	0x8014134	// 8014134 <I2C_Stop>
}
 80141f6:	1491      	pop      	r4, r15

080141f8 <Write_I2C_Data>:

void Write_I2C_Data(unsigned char I2C_Data)
{
 80141f8:	14d1      	push      	r4, r15
 80141fa:	6d03      	mov      	r4, r0
	I2C_Start();
 80141fc:	e3ffff82 	bsr      	0x8014100	// 8014100 <I2C_Start>
	Write_I2C_Byte(0x78);			//D/C#=0; R/W#=0
 8014200:	3078      	movi      	r0, 120
 8014202:	e3ffffbd 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 8014206:	e3ffffad 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	Write_I2C_Byte(0x40);			//write data
 801420a:	3040      	movi      	r0, 64
 801420c:	e3ffffb8 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 8014210:	e3ffffa8 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	Write_I2C_Byte(I2C_Data);
 8014214:	6c13      	mov      	r0, r4
 8014216:	e3ffffb3 	bsr      	0x801417c	// 801417c <Write_I2C_Byte>
	I2C_Wait_Ack();
 801421a:	e3ffffa3 	bsr      	0x8014160	// 8014160 <I2C_Wait_Ack>
	I2C_Stop();
 801421e:	e3ffff8b 	bsr      	0x8014134	// 8014134 <I2C_Stop>
}
 8014222:	1491      	pop      	r4, r15

08014224 <Motor_Start>:
}

/* USER CODE BEGIN 2 */
//启动
void Motor_Start(void)
{
 8014224:	14d0      	push      	r15
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, GPIO_PIN_SET);    //1- ON
 8014226:	3180      	movi      	r1, 128
 8014228:	3201      	movi      	r2, 1
 801422a:	4122      	lsli      	r1, r1, 2
 801422c:	1002      	lrw      	r0, 0x40011400	// 8014234 <Motor_Start+0x10>
 801422e:	e3ffedeb 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8014232:	1490      	pop      	r15
 8014234:	40011400 	.long	0x40011400

08014238 <Motor_Stop>:

  //停止
void Motor_Stop(void)
{
 8014238:	14d0      	push      	r15
	R_LED(ON);
 801423a:	3001      	movi      	r0, 1
 801423c:	e0000076 	bsr      	0x8014328	// 8014328 <R_LED>
	G_LED(OFF);
 8014240:	3000      	movi      	r0, 0
 8014242:	e0000081 	bsr      	0x8014344	// 8014344 <G_LED>
	B_LED(OFF);
 8014246:	3000      	movi      	r0, 0
 8014248:	e000008c 	bsr      	0x8014360	// 8014360 <B_LED>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, GPIO_PIN_RESET);    //0- OFF
 801424c:	3180      	movi      	r1, 128
 801424e:	3200      	movi      	r2, 0
 8014250:	4122      	lsli      	r1, r1, 2
 8014252:	1003      	lrw      	r0, 0x40011400	// 801425c <Motor_Stop+0x24>
 8014254:	e3ffedd8 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8014258:	1490      	pop      	r15
 801425a:	0000      	.short	0x0000
 801425c:	40011400 	.long	0x40011400

08014260 <MY_MOTOR_Init>:
{
 8014260:	14d0      	push      	r15
 8014262:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 8014264:	6c3b      	mov      	r0, r14
 8014266:	320c      	movi      	r2, 12
 8014268:	3100      	movi      	r1, 0
 801426a:	e3ffeb9f 	bsr      	0x80119a8	// 80119a8 <__memset_fast>
	__HAL_RCC_GPIO_CLK_ENABLE();
 801426e:	ea224000 	movih      	r2, 16384
 8014272:	e4420dff 	addi      	r2, r2, 3584
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8014276:	6c7b      	mov      	r1, r14
	__HAL_RCC_GPIO_CLK_ENABLE();
 8014278:	9260      	ld.w      	r3, (r2, 0x0)
 801427a:	ec630800 	ori      	r3, r3, 2048
 801427e:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Pin = GPIO_PIN_9 | GPIO_PIN_13 | GPIO_PIN_14;
 8014280:	33c4      	movi      	r3, 196
 8014282:	4367      	lsli      	r3, r3, 7
 8014284:	b860      	st.w      	r3, (r14, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8014286:	3302      	movi      	r3, 2
 8014288:	b861      	st.w      	r3, (r14, 0x4)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 801428a:	1005      	lrw      	r0, 0x40011400	// 801429c <MY_MOTOR_Init+0x3c>
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 801428c:	3312      	movi      	r3, 18
 801428e:	b862      	st.w      	r3, (r14, 0x8)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8014290:	e3ffed16 	bsr      	0x8011cbc	// 8011cbc <HAL_GPIO_Init>
	Motor_Stop();
 8014294:	e3ffffd2 	bsr      	0x8014238	// 8014238 <Motor_Stop>
}
 8014298:	1403      	addi      	r14, r14, 12
 801429a:	1490      	pop      	r15
 801429c:	40011400 	.long	0x40011400

080142a0 <Motor_Right>:

}

//右转
void Motor_Right(void)
{
 80142a0:	14d0      	push      	r15
	Motor_Start();
 80142a2:	e3ffffc1 	bsr      	0x8014224	// 8014224 <Motor_Start>
	R_LED(OFF);
 80142a6:	3000      	movi      	r0, 0
 80142a8:	e0000040 	bsr      	0x8014328	// 8014328 <R_LED>
	G_LED(OFF);
 80142ac:	3000      	movi      	r0, 0
 80142ae:	e000004b 	bsr      	0x8014344	// 8014344 <G_LED>
	B_LED(ON);
 80142b2:	3001      	movi      	r0, 1
 80142b4:	e0000056 	bsr      	0x8014360	// 8014360 <B_LED>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_13, GPIO_PIN_SET);
 80142b8:	3180      	movi      	r1, 128
 80142ba:	3201      	movi      	r2, 1
 80142bc:	4126      	lsli      	r1, r1, 6
 80142be:	1006      	lrw      	r0, 0x40011400	// 80142d4 <Motor_Right+0x34>
 80142c0:	e3ffeda2 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, GPIO_PIN_RESET);
 80142c4:	3180      	movi      	r1, 128
 80142c6:	3200      	movi      	r2, 0
 80142c8:	4127      	lsli      	r1, r1, 7
 80142ca:	1003      	lrw      	r0, 0x40011400	// 80142d4 <Motor_Right+0x34>
 80142cc:	e3ffed9c 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>

}
 80142d0:	1490      	pop      	r15
 80142d2:	0000      	.short	0x0000
 80142d4:	40011400 	.long	0x40011400

080142d8 <MY_MOTOR_Test>:
/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void MY_MOTOR_Test(void)
{
 80142d8:	14d0      	push      	r15
	Motor_Right();
 80142da:	e3ffffe3 	bsr      	0x80142a0	// 80142a0 <Motor_Right>
}
 80142de:	1490      	pop      	r15

080142e0 <MY_RGB_Init>:
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_RGB_Init(void)
{
 80142e0:	14d1      	push      	r4, r15
 80142e2:	1423      	subi      	r14, r14, 12
	GPIO_InitTypeDef GPIO_InitStruct = {0};
 80142e4:	6c3b      	mov      	r0, r14
 80142e6:	320c      	movi      	r2, 12
 80142e8:	3100      	movi      	r1, 0
 80142ea:	e3ffeb5f 	bsr      	0x80119a8	// 80119a8 <__memset_fast>
	__HAL_RCC_GPIO_CLK_ENABLE();
 80142ee:	ea224000 	movih      	r2, 16384
 80142f2:	e4420dff 	addi      	r2, r2, 3584

	GPIO_InitStruct.Pin = GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_27;
 80142f6:	c7405024 	bmaski      	r4, 27
 80142fa:	2418      	addi      	r4, 25
	__HAL_RCC_GPIO_CLK_ENABLE();
 80142fc:	9260      	ld.w      	r3, (r2, 0x0)
 80142fe:	ec630800 	ori      	r3, r3, 2048
 8014302:	b260      	st.w      	r3, (r2, 0x0)
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
 8014304:	3302      	movi      	r3, 2
 8014306:	b861      	st.w      	r3, (r14, 0x4)
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8014308:	6c7b      	mov      	r1, r14
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 801430a:	3312      	movi      	r3, 18
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 801430c:	1006      	lrw      	r0, 0x40011400	// 8014324 <MY_RGB_Init+0x44>
	GPIO_InitStruct.Pull = GPIO_NOPULL;
 801430e:	b862      	st.w      	r3, (r14, 0x8)
	GPIO_InitStruct.Pin = GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_27;
 8014310:	b880      	st.w      	r4, (r14, 0x0)
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
 8014312:	e3ffecd5 	bsr      	0x8011cbc	// 8011cbc <HAL_GPIO_Init>
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_27, GPIO_PIN_RESET);
 8014316:	3200      	movi      	r2, 0
 8014318:	6c53      	mov      	r1, r4
 801431a:	1003      	lrw      	r0, 0x40011400	// 8014324 <MY_RGB_Init+0x44>
 801431c:	e3ffed74 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
}
 8014320:	1403      	addi      	r14, r14, 12
 8014322:	1491      	pop      	r4, r15
 8014324:	40011400 	.long	0x40011400

08014328 <R_LED>:

/* USER CODE BEGIN 2 */
void R_LED(uint8_t sw)
{
 8014328:	14d0      	push      	r15
	if(sw == ON)
 801432a:	3841      	cmpnei      	r0, 1
{
 801432c:	6c83      	mov      	r2, r0
	if(sw == ON)
 801432e:	0806      	bt      	0x801433a	// 801433a <R_LED+0x12>
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, GPIO_PIN_SET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, GPIO_PIN_RESET);
 8014330:	3108      	movi      	r1, 8
 8014332:	1004      	lrw      	r0, 0x40011400	// 8014340 <R_LED+0x18>
 8014334:	e3ffed68 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	}
}
 8014338:	1490      	pop      	r15
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_3, GPIO_PIN_RESET);
 801433a:	3200      	movi      	r2, 0
 801433c:	07fa      	br      	0x8014330	// 8014330 <R_LED+0x8>
 801433e:	0000      	.short	0x0000
 8014340:	40011400 	.long	0x40011400

08014344 <G_LED>:

void G_LED(uint8_t sw)
{
 8014344:	14d0      	push      	r15
	if(sw == ON)
 8014346:	3841      	cmpnei      	r0, 1
{
 8014348:	6c83      	mov      	r2, r0
	if(sw == ON)
 801434a:	0807      	bt      	0x8014358	// 8014358 <G_LED+0x14>
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_27, GPIO_PIN_SET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_27, GPIO_PIN_RESET);
 801434c:	3180      	movi      	r1, 128
 801434e:	4134      	lsli      	r1, r1, 20
 8014350:	1003      	lrw      	r0, 0x40011400	// 801435c <G_LED+0x18>
 8014352:	e3ffed59 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	}
}
 8014356:	1490      	pop      	r15
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_27, GPIO_PIN_RESET);
 8014358:	3200      	movi      	r2, 0
 801435a:	07f9      	br      	0x801434c	// 801434c <G_LED+0x8>
 801435c:	40011400 	.long	0x40011400

08014360 <B_LED>:

void B_LED(uint8_t sw)
{
 8014360:	14d0      	push      	r15
	if(sw == ON)
 8014362:	3841      	cmpnei      	r0, 1
{
 8014364:	6c83      	mov      	r2, r0
	if(sw == ON)
 8014366:	0806      	bt      	0x8014372	// 8014372 <B_LED+0x12>
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
 8014368:	3110      	movi      	r1, 16
 801436a:	1004      	lrw      	r0, 0x40011400	// 8014378 <B_LED+0x18>
 801436c:	e3ffed4c 	bsr      	0x8011e04	// 8011e04 <HAL_GPIO_WritePin>
	}
}
 8014370:	1490      	pop      	r15
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);
 8014372:	3200      	movi      	r2, 0
 8014374:	07fa      	br      	0x8014368	// 8014368 <B_LED+0x8>
 8014376:	0000      	.short	0x0000
 8014378:	40011400 	.long	0x40011400

0801437c <HAL_PMU_RTC_Callback>:
	printf("%d-%d-%d %d:%d:%d\r\n", (time.Year + 1900), time.Month, time.Date, time.Hours, time.Minutes, time.Seconds);
	tls_os_time_delay(1000);
}

void HAL_PMU_RTC_Callback(PMU_HandleTypeDef *hpmu)
{
 801437c:	14d0      	push      	r15
	printf("rtc irq callback\r\n");
 801437e:	1003      	lrw      	r0, 0x8016605	// 8014388 <HAL_PMU_RTC_Callback+0xc>
 8014380:	e3ffeae2 	bsr      	0x8011944	// 8011944 <__GI_puts>
}
 8014384:	1490      	pop      	r15
 8014386:	0000      	.short	0x0000
 8014388:	08016605 	.long	0x08016605

0801438c <pxPortInitialiseStack>:
{
    StackType_t *stk  = NULL;

    stk = pxTopOfStack;

    *(--stk)  = (uint32_t)pxCode;            /* Entry Point                                         */
 801438c:	586f      	subi      	r3, r0, 4
 801438e:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x80000340L;       /* PSR                                                 */
 8014390:	587f      	subi      	r3, r0, 8
 8014392:	ea218000 	movih      	r1, 32768
 8014396:	e421033f 	addi      	r1, r1, 832
 801439a:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR15                                                */
 801439c:	e420100b 	subi      	r1, r0, 12
 80143a0:	1276      	lrw      	r3, 0x12345678	// 80144f8 <pxPortInitialiseStack+0x16c>
 80143a2:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR14                                                */
 80143a4:	e420100f 	subi      	r1, r0, 16
 80143a8:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR13                                                */
 80143aa:	e4201013 	subi      	r1, r0, 20
 80143ae:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR12                                                */
 80143b0:	e4201017 	subi      	r1, r0, 24
 80143b4:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR11                                                */
 80143b6:	e420101b 	subi      	r1, r0, 28
 80143ba:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR10                                                */
 80143bc:	e420101f 	subi      	r1, r0, 32
 80143c0:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR9                                                 */
 80143c2:	e4201023 	subi      	r1, r0, 36
 80143c6:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR8                                                 */
 80143c8:	e4201027 	subi      	r1, r0, 40
 80143cc:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR7                                                 */
 80143ce:	e420102b 	subi      	r1, r0, 44
 80143d2:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR6                                                 */
 80143d4:	e420102f 	subi      	r1, r0, 48
 80143d8:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR5                                                 */
 80143da:	e4201033 	subi      	r1, r0, 52
 80143de:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR4                                                 */
 80143e0:	e4201037 	subi      	r1, r0, 56
 80143e4:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR3                                                 */
 80143e6:	e420103b 	subi      	r1, r0, 60
 80143ea:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR2                                                 */
 80143ec:	e420103f 	subi      	r1, r0, 64
 80143f0:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR1                                                 */
 80143f2:	e4201043 	subi      	r1, r0, 68
 80143f6:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x12345678L;       /* VR0                                                 */
 80143f8:	e4201047 	subi      	r1, r0, 72
 80143fc:	b160      	st.w      	r3, (r1, 0x0)
    *(--stk)  = (uint32_t)0x31313131L;       /* R31                                                 */
 80143fe:	e460104b 	subi      	r3, r0, 76
 8014402:	113f      	lrw      	r1, 0x31313131	// 80144fc <pxPortInitialiseStack+0x170>
 8014404:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x30303030L;       /* R30                                                 */
 8014406:	e460104f 	subi      	r3, r0, 80
 801440a:	113e      	lrw      	r1, 0x30303030	// 8014500 <pxPortInitialiseStack+0x174>
 801440c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x29292929L;       /* R29                                                 */
 801440e:	e4601053 	subi      	r3, r0, 84
 8014412:	113d      	lrw      	r1, 0x29292929	// 8014504 <pxPortInitialiseStack+0x178>
 8014414:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x28282828L;       /* R28                                                 */
 8014416:	e4601057 	subi      	r3, r0, 88
 801441a:	113c      	lrw      	r1, 0x28282828	// 8014508 <pxPortInitialiseStack+0x17c>
 801441c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x27272727L;       /* R27                                                 */
 801441e:	e460105b 	subi      	r3, r0, 92
 8014422:	113b      	lrw      	r1, 0x27272727	// 801450c <pxPortInitialiseStack+0x180>
 8014424:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x26262626L;       /* R26                                                 */
 8014426:	e460105f 	subi      	r3, r0, 96
 801442a:	113a      	lrw      	r1, 0x26262626	// 8014510 <pxPortInitialiseStack+0x184>
 801442c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x25252525L;       /* R25                                                 */
 801442e:	e4601063 	subi      	r3, r0, 100
 8014432:	1139      	lrw      	r1, 0x25252525	// 8014514 <pxPortInitialiseStack+0x188>
 8014434:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x24242424L;       /* R24                                                 */
 8014436:	e4601067 	subi      	r3, r0, 104
 801443a:	1138      	lrw      	r1, 0x24242424	// 8014518 <pxPortInitialiseStack+0x18c>
 801443c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x23232323L;       /* R23                                                 */
 801443e:	e460106b 	subi      	r3, r0, 108
 8014442:	1137      	lrw      	r1, 0x23232323	// 801451c <pxPortInitialiseStack+0x190>
 8014444:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x22222222L;       /* R22                                                 */
 8014446:	e460106f 	subi      	r3, r0, 112
 801444a:	1136      	lrw      	r1, 0x22222222	// 8014520 <pxPortInitialiseStack+0x194>
 801444c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x21212121L;       /* R21                                                 */
 801444e:	e4601073 	subi      	r3, r0, 116
 8014452:	1135      	lrw      	r1, 0x21212121	// 8014524 <pxPortInitialiseStack+0x198>
 8014454:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x20202020L;       /* R20                                                 */
 8014456:	e4601077 	subi      	r3, r0, 120
 801445a:	1134      	lrw      	r1, 0x20202020	// 8014528 <pxPortInitialiseStack+0x19c>
 801445c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x19191919L;       /* R19                                                 */
 801445e:	e460107b 	subi      	r3, r0, 124
 8014462:	1133      	lrw      	r1, 0x19191919	// 801452c <pxPortInitialiseStack+0x1a0>
 8014464:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x18181818L;       /* R18                                                 */
 8014466:	e460107f 	subi      	r3, r0, 128
 801446a:	1132      	lrw      	r1, 0x18181818	// 8014530 <pxPortInitialiseStack+0x1a4>
 801446c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x17171717L;       /* R17                                                 */
 801446e:	e4601083 	subi      	r3, r0, 132
 8014472:	1131      	lrw      	r1, 0x17171717	// 8014534 <pxPortInitialiseStack+0x1a8>
 8014474:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x16161616L;       /* R16                                                 */
 8014476:	e4601087 	subi      	r3, r0, 136
 801447a:	1130      	lrw      	r1, 0x16161616	// 8014538 <pxPortInitialiseStack+0x1ac>
 801447c:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0xfffffffeL;       /* R15 (LR) (init value will cause fault if ever used) */
 801447e:	e460108b 	subi      	r3, r0, 140
 8014482:	3100      	movi      	r1, 0
 8014484:	2901      	subi      	r1, 2
 8014486:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x13131313L;       /* R13                                                 */
 8014488:	e460108f 	subi      	r3, r0, 144
 801448c:	112c      	lrw      	r1, 0x13131313	// 801453c <pxPortInitialiseStack+0x1b0>
 801448e:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x12121212L;       /* R12                                                 */
 8014490:	e4601093 	subi      	r3, r0, 148
 8014494:	112b      	lrw      	r1, 0x12121212	// 8014540 <pxPortInitialiseStack+0x1b4>
 8014496:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x11111111L;       /* R11                                                 */
 8014498:	e4601097 	subi      	r3, r0, 152
 801449c:	112a      	lrw      	r1, 0x11111111	// 8014544 <pxPortInitialiseStack+0x1b8>
 801449e:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x10101010L;       /* R10                                                 */
 80144a0:	e460109b 	subi      	r3, r0, 156
 80144a4:	1129      	lrw      	r1, 0x10101010	// 8014548 <pxPortInitialiseStack+0x1bc>
 80144a6:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x09090909L;       /* R9                                                  */
 80144a8:	e460109f 	subi      	r3, r0, 160
 80144ac:	1128      	lrw      	r1, 0x9090909	// 801454c <pxPortInitialiseStack+0x1c0>
 80144ae:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x08080808L;       /* R8                                                  */
 80144b0:	e46010a3 	subi      	r3, r0, 164
 80144b4:	1127      	lrw      	r1, 0x8080808	// 8014550 <pxPortInitialiseStack+0x1c4>
 80144b6:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x07070707L;       /* R7                                                  */
 80144b8:	e46010a7 	subi      	r3, r0, 168
 80144bc:	1126      	lrw      	r1, 0x7070707	// 8014554 <pxPortInitialiseStack+0x1c8>
 80144be:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x06060606L;       /* R6                                                  */
 80144c0:	e46010ab 	subi      	r3, r0, 172
 80144c4:	1125      	lrw      	r1, 0x6060606	// 8014558 <pxPortInitialiseStack+0x1cc>
 80144c6:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x05050505L;       /* R5                                                  */
 80144c8:	e46010af 	subi      	r3, r0, 176
 80144cc:	1124      	lrw      	r1, 0x5050505	// 801455c <pxPortInitialiseStack+0x1d0>
 80144ce:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x04040404L;       /* R4                                                  */
 80144d0:	e46010b3 	subi      	r3, r0, 180
 80144d4:	1123      	lrw      	r1, 0x4040404	// 8014560 <pxPortInitialiseStack+0x1d4>
 80144d6:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x03030303L;       /* R3                                                  */
 80144d8:	e46010b7 	subi      	r3, r0, 184
 80144dc:	1122      	lrw      	r1, 0x3030303	// 8014564 <pxPortInitialiseStack+0x1d8>
 80144de:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x02020202L;       /* R2                                                  */
 80144e0:	e46010bb 	subi      	r3, r0, 188
 80144e4:	1121      	lrw      	r1, 0x2020202	// 8014568 <pxPortInitialiseStack+0x1dc>
 80144e6:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
 80144e8:	e46010bf 	subi      	r3, r0, 192
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : Argument                                       */
 80144ec:	28c3      	subi      	r0, 196
    *(--stk)  = (uint32_t)0x01010101L;       /* R1                                                  */
 80144ee:	1120      	lrw      	r1, 0x1010101	// 801456c <pxPortInitialiseStack+0x1e0>
 80144f0:	b320      	st.w      	r1, (r3, 0x0)
    *(--stk)  = (uint32_t)pvParameters;      /* R0 : Argument                                       */
 80144f2:	b040      	st.w      	r2, (r0, 0x0)

    return stk;
}
 80144f4:	783c      	jmp      	r15
 80144f6:	0000      	.short	0x0000
 80144f8:	12345678 	.long	0x12345678
 80144fc:	31313131 	.long	0x31313131
 8014500:	30303030 	.long	0x30303030
 8014504:	29292929 	.long	0x29292929
 8014508:	28282828 	.long	0x28282828
 801450c:	27272727 	.long	0x27272727
 8014510:	26262626 	.long	0x26262626
 8014514:	25252525 	.long	0x25252525
 8014518:	24242424 	.long	0x24242424
 801451c:	23232323 	.long	0x23232323
 8014520:	22222222 	.long	0x22222222
 8014524:	21212121 	.long	0x21212121
 8014528:	20202020 	.long	0x20202020
 801452c:	19191919 	.long	0x19191919
 8014530:	18181818 	.long	0x18181818
 8014534:	17171717 	.long	0x17171717
 8014538:	16161616 	.long	0x16161616
 801453c:	13131313 	.long	0x13131313
 8014540:	12121212 	.long	0x12121212
 8014544:	11111111 	.long	0x11111111
 8014548:	10101010 	.long	0x10101010
 801454c:	09090909 	.long	0x09090909
 8014550:	08080808 	.long	0x08080808
 8014554:	07070707 	.long	0x07070707
 8014558:	06060606 	.long	0x06060606
 801455c:	05050505 	.long	0x05050505
 8014560:	04040404 	.long	0x04040404
 8014564:	03030303 	.long	0x03030303
 8014568:	02020202 	.long	0x02020202
 801456c:	01010101 	.long	0x01010101

08014570 <xPortStartScheduler>:

BaseType_t xPortStartScheduler( void )
{
 8014570:	14d1      	push      	r4, r15
    ulCriticalNesting = 0UL;
 8014572:	1064      	lrw      	r3, 0x2000016c	// 8014580 <xPortStartScheduler+0x10>
 8014574:	3400      	movi      	r4, 0
 8014576:	b380      	st.w      	r4, (r3, 0x0)

    vPortStartTask();
 8014578:	e3ffdfc9 	bsr      	0x801050a	// 801050a <vPortStartTask>

    return pdFALSE;
}
 801457c:	6c13      	mov      	r0, r4
 801457e:	1491      	pop      	r4, r15
 8014580:	2000016c 	.long	0x2000016c

08014584 <vPortEnterCritical>:
    __ASM volatile("psrclr ie");
 8014584:	c0807020 	psrclr      	ie
}

void vPortEnterCritical( void )
{
    portDISABLE_INTERRUPTS();
    ulCriticalNesting ++;
 8014588:	1043      	lrw      	r2, 0x2000016c	// 8014594 <vPortEnterCritical+0x10>
 801458a:	9260      	ld.w      	r3, (r2, 0x0)
 801458c:	2300      	addi      	r3, 1
 801458e:	b260      	st.w      	r3, (r2, 0x0)
}
 8014590:	783c      	jmp      	r15
 8014592:	0000      	.short	0x0000
 8014594:	2000016c 	.long	0x2000016c

08014598 <vPortExitCritical>:

void vPortExitCritical( void )
{
 8014598:	14d0      	push      	r15
    if (ulCriticalNesting == 0) {
 801459a:	104b      	lrw      	r2, 0x2000016c	// 80145c4 <vPortExitCritical+0x2c>
 801459c:	9260      	ld.w      	r3, (r2, 0x0)
 801459e:	e9230003 	bnez      	r3, 0x80145a4	// 80145a4 <vPortExitCritical+0xc>
 80145a2:	0400      	br      	0x80145a2	// 80145a2 <vPortExitCritical+0xa>
        while(1);
    }

    ulCriticalNesting --;
 80145a4:	2b00      	subi      	r3, 1
 80145a6:	b260      	st.w      	r3, (r2, 0x0)
    if (ulCriticalNesting == 0)
 80145a8:	e923000d 	bnez      	r3, 0x80145c2	// 80145c2 <vPortExitCritical+0x2a>
    __ASM volatile("psrset ie");
 80145ac:	c0807420 	psrset      	ie
    {
        portENABLE_INTERRUPTS();

        if (pendsvflag)
 80145b0:	1046      	lrw      	r2, 0x2000695c	// 80145c8 <vPortExitCritical+0x30>
 80145b2:	9220      	ld.w      	r1, (r2, 0x0)
 80145b4:	e9010007 	bez      	r1, 0x80145c2	// 80145c2 <vPortExitCritical+0x2a>
        {
            pendsvflag = 0;
 80145b8:	b260      	st.w      	r3, (r2, 0x0)
            portYIELD();
 80145ba:	e3ffdfa3 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 80145be:	6c03      	mov      	r0, r0
 80145c0:	6c03      	mov      	r0, r0
        }
    }
}
 80145c2:	1490      	pop      	r15
 80145c4:	2000016c 	.long	0x2000016c
 80145c8:	2000695c 	.long	0x2000695c

080145cc <xPortSysTickHandler>:
    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );
}

#else
void xPortSysTickHandler( void )
{
 80145cc:	14d1      	push      	r4, r15
    __ASM volatile("mfcr %0, psr" : "=r"(result));
 80145ce:	c0006024 	mfcr      	r4, cr<0, 0>
    __ASM volatile("psrclr ie");
 80145d2:	c0807020 	psrclr      	ie
    portLONG ulDummy;

    ulDummy = portSET_INTERRUPT_MASK_FROM_ISR();
    {
    	vTaskIncrementTick();
 80145d6:	e3fff739 	bsr      	0x8013448	// 8013448 <vTaskIncrementTick>
    	portYIELD_FROM_ISR(pdTRUE);
 80145da:	e3ffdf93 	bsr      	0x8010500	// 8010500 <cpu_yeild>
 80145de:	6c03      	mov      	r0, r0
 80145e0:	6c03      	mov      	r0, r0
 80145e2:	c0046420 	mtcr      	r4, cr<0, 0>
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulDummy );
}
 80145e6:	1491      	pop      	r4, r15

080145e8 <vApplicationStackOverflowHook>:

    portCLEAR_INTERRUPT_MASK_FROM_ISR( ulSavedInterruptMask );
}

__attribute__((weak)) void vApplicationStackOverflowHook( xTaskHandle *pxTask, signed portCHAR *pcTaskName , signed char prio)
{
 80145e8:	14d0      	push      	r15
	printf("\ntask[%s] priority[%d] stack over flow\n",pcTaskName, prio);
 80145ea:	1003      	lrw      	r0, 0x8016617	// 80145f4 <vApplicationStackOverflowHook+0xc>
 80145ec:	e0000ac0 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 80145f0:	0400      	br      	0x80145f0	// 80145f0 <vApplicationStackOverflowHook+0x8>
 80145f2:	0000      	.short	0x0000
 80145f4:	08016617 	.long	0x08016617

080145f8 <SystemInit>:
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 80145f8:	106f      	lrw      	r3, 0x20000000	// 8014634 <SystemInit+0x3c>
 80145fa:	c0036421 	mtcr      	r3, cr<1, 0>
    __ASM volatile("mtcr %0, cr<15, 1>" : : "r"(sp));
 80145fe:	106f      	lrw      	r3, 0x20001170	// 8014638 <SystemInit+0x40>
 8014600:	c023642f 	mtcr      	r3, cr<15, 1>
    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8014604:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_VBR((uint32_t) & (irq_vectors));

#if defined(CONFIG_SEPARATE_IRQ_SP) && !defined(CONFIG_KERNEL_NONE)
    /* 801 not supported */
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
 8014608:	ec634000 	ori      	r3, r3, 16384
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 801460c:	c003643f 	mtcr      	r3, cr<31, 0>
    VIC->TSPR = 0xFF;
 8014610:	106b      	lrw      	r3, 0xe000e100	// 801463c <SystemInit+0x44>
 8014612:	32ff      	movi      	r2, 255
 8014614:	dc4322c4 	st.w      	r2, (r3, 0xb10)
    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8014618:	c01f6022 	mfcr      	r2, cr<31, 0>
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 801461c:	ec420010 	ori      	r2, r2, 16
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8014620:	c002643f 	mtcr      	r2, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8014624:	3200      	movi      	r2, 0
 8014626:	dc432080 	st.w      	r2, (r3, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 801462a:	2a00      	subi      	r2, 1
 801462c:	dc432060 	st.w      	r2, (r3, 0x180)

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8014630:	783c      	jmp      	r15
 8014632:	0000      	.short	0x0000
 8014634:	20000000 	.long	0x20000000
 8014638:	20001170 	.long	0x20001170
 801463c:	e000e100 	.long	0xe000e100

08014640 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8014640:	14d4      	push      	r4-r7, r15
 8014642:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8014644:	c0006021 	mfcr      	r1, cr<0, 0>
 8014648:	4930      	lsri      	r1, r1, 16
 801464a:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 801464c:	1014      	lrw      	r0, 0x801663f	// 801469c <trap_c+0x5c>
 801464e:	e0000a8f 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
    printf("\n");
 8014652:	300a      	movi      	r0, 10
 8014654:	e3ffe970 	bsr      	0x8011934	// 8011934 <__GI_putchar>

    for (i = 0; i < 16; i++) {
 8014658:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 801465a:	10f2      	lrw      	r7, 0x8016652	// 80146a0 <trap_c+0x60>

        if ((i % 5) == 4) {
 801465c:	3605      	movi      	r6, 5
        printf("r%d: %08x\t", i, regs[i]);
 801465e:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8014662:	6c53      	mov      	r1, r4
 8014664:	6c1f      	mov      	r0, r7
 8014666:	e0000a83 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
        if ((i % 5) == 4) {
 801466a:	c4c48043 	divs      	r3, r4, r6
 801466e:	7cd8      	mult      	r3, r6
 8014670:	5c6d      	subu      	r3, r4, r3
 8014672:	3b44      	cmpnei      	r3, 4
 8014674:	0804      	bt      	0x801467c	// 801467c <trap_c+0x3c>
            printf("\n");
 8014676:	300a      	movi      	r0, 10
 8014678:	e3ffe95e 	bsr      	0x8011934	// 8011934 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 801467c:	2400      	addi      	r4, 1
 801467e:	3c50      	cmpnei      	r4, 16
 8014680:	0bef      	bt      	0x801465e	// 801465e <trap_c+0x1e>
        }
    }

    printf("\n");
 8014682:	300a      	movi      	r0, 10
 8014684:	e3ffe958 	bsr      	0x8011934	// 8011934 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8014688:	9530      	ld.w      	r1, (r5, 0x40)
 801468a:	1007      	lrw      	r0, 0x801665d	// 80146a4 <trap_c+0x64>
 801468c:	e0000a70 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8014690:	9531      	ld.w      	r1, (r5, 0x44)
 8014692:	1006      	lrw      	r0, 0x8016668	// 80146a8 <trap_c+0x68>
 8014694:	e0000a6c 	bsr      	0x8015b6c	// 8015b6c <wm_printf>
 8014698:	0400      	br      	0x8014698	// 8014698 <trap_c+0x58>
 801469a:	0000      	.short	0x0000
 801469c:	0801663f 	.long	0x0801663f
 80146a0:	08016652 	.long	0x08016652
 80146a4:	0801665d 	.long	0x0801665d
 80146a8:	08016668 	.long	0x08016668

080146ac <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 80146ac:	102a      	lrw      	r1, 0xe000e100	// 80146d4 <board_init+0x28>
 80146ae:	3380      	movi      	r3, 128
 80146b0:	4369      	lsli      	r3, r3, 9
 80146b2:	dc612020 	st.w      	r3, (r1, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 80146b6:	dc612060 	st.w      	r3, (r1, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 80146ba:	1068      	lrw      	r3, 0x40010600	// 80146d8 <board_init+0x2c>
 80146bc:	ea21000b 	movih      	r1, 11
 80146c0:	2113      	addi      	r1, 20
 80146c2:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 80146c4:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 80146c6:	31c3      	movi      	r1, 195
 80146c8:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 80146ca:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 80146cc:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 80146ce:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 80146d0:	783c      	jmp      	r15
 80146d2:	0000      	.short	0x0000
 80146d4:	e000e100 	.long	0xe000e100
 80146d8:	40010600 	.long	0x40010600

080146dc <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 80146dc:	783c      	jmp      	r15
	...

080146e0 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 80146e0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80146e4:	98ee      	ld.w      	r7, (r14, 0x38)
 80146e6:	6e8f      	mov      	r10, r3
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80146e8:	e4672003 	andi      	r3, r7, 3
{
 80146ec:	6e03      	mov      	r8, r0
 80146ee:	6e47      	mov      	r9, r1
 80146f0:	6d8b      	mov      	r6, r2
 80146f2:	98ab      	ld.w      	r5, (r14, 0x2c)
 80146f4:	988c      	ld.w      	r4, (r14, 0x30)
 80146f6:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 80146fa:	e9230008 	bnez      	r3, 0x801470a	// 801470a <_out_rev+0x2a>
    for (size_t i = len; i < width; i++) {
 80146fe:	c4440090 	subu      	r16, r4, r2
 8014702:	c4500023 	addu      	r3, r16, r2
 8014706:	66cc      	cmphs      	r3, r11
 8014708:	0c0d      	bf      	0x8014722	// 8014722 <_out_rev+0x42>
 801470a:	6150      	addu      	r5, r4
 801470c:	6108      	addu      	r4, r2
      out(' ', buffer, idx++, maxlen);
    }
  }

  // reverse string
  while (len) {
 801470e:	650a      	cmpne      	r2, r4
 8014710:	2d00      	subi      	r5, 1
 8014712:	0811      	bt      	0x8014734	// 8014734 <_out_rev+0x54>
    out(buf[--len], buffer, idx++, maxlen);
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8014714:	e4e72002 	andi      	r7, r7, 2
 8014718:	e927001e 	bnez      	r7, 0x8014754	// 8014754 <_out_rev+0x74>
      out(' ', buffer, idx++, maxlen);
    }
  }

  return idx;
}
 801471c:	6c13      	mov      	r0, r4
 801471e:	ebc00058 	pop      	r4-r11, r15, r16-r17
      out(' ', buffer, idx++, maxlen);
 8014722:	e6220000 	addi      	r17, r2, 1
 8014726:	6ceb      	mov      	r3, r10
 8014728:	6c67      	mov      	r1, r9
 801472a:	3020      	movi      	r0, 32
 801472c:	7be1      	jsr      	r8
 801472e:	c4114822 	lsli      	r2, r17, 0
 8014732:	07e8      	br      	0x8014702	// 8014702 <_out_rev+0x22>
    out(buf[--len], buffer, idx++, maxlen);
 8014734:	e6020000 	addi      	r16, r2, 1
 8014738:	6ceb      	mov      	r3, r10
 801473a:	6c67      	mov      	r1, r9
 801473c:	8500      	ld.b      	r0, (r5, 0x0)
 801473e:	7be1      	jsr      	r8
 8014740:	c4104822 	lsli      	r2, r16, 0
 8014744:	07e5      	br      	0x801470e	// 801470e <_out_rev+0x2e>
      out(' ', buffer, idx++, maxlen);
 8014746:	6c93      	mov      	r2, r4
 8014748:	5ca2      	addi      	r5, r4, 1
 801474a:	6ceb      	mov      	r3, r10
 801474c:	6c67      	mov      	r1, r9
 801474e:	3020      	movi      	r0, 32
 8014750:	7be1      	jsr      	r8
 8014752:	6d17      	mov      	r4, r5
    while (idx - start_idx < width) {
 8014754:	5c79      	subu      	r3, r4, r6
 8014756:	66cc      	cmphs      	r3, r11
 8014758:	0ff7      	bf      	0x8014746	// 8014746 <_out_rev+0x66>
 801475a:	07e1      	br      	0x801471c	// 801471c <_out_rev+0x3c>

0801475c <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 801475c:	14d0      	push      	r15
 801475e:	1424      	subi      	r14, r14, 16
 8014760:	da4e200b 	ld.w      	r18, (r14, 0x2c)
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8014764:	e6f22002 	andi      	r23, r18, 2
{
 8014768:	d9ae2005 	ld.w      	r13, (r14, 0x14)
 801476c:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8014770:	da8e2008 	ld.w      	r20, (r14, 0x20)
 8014774:	daae2009 	ld.w      	r21, (r14, 0x24)
 8014778:	da6e200a 	ld.w      	r19, (r14, 0x28)
 801477c:	dace001c 	ld.b      	r22, (r14, 0x1c)
  if (!(flags & FLAGS_LEFT)) {
 8014780:	e9370025 	bnez      	r23, 0x80147ca	// 80147ca <_ntoa_format+0x6e>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8014784:	e913000e 	bez      	r19, 0x80147a0	// 80147a0 <_ntoa_format+0x44>
 8014788:	e6f22001 	andi      	r23, r18, 1
 801478c:	e917000a 	bez      	r23, 0x80147a0	// 80147a0 <_ntoa_format+0x44>
 8014790:	e9360006 	bnez      	r22, 0x801479c	// 801479c <_ntoa_format+0x40>
 8014794:	e6f2200c 	andi      	r23, r18, 12
 8014798:	e9170004 	bez      	r23, 0x80147a0	// 80147a0 <_ntoa_format+0x44>
      width--;
 801479c:	e6731000 	subi      	r19, r19, 1
 80147a0:	c58d0037 	addu      	r23, r13, r12
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = '0';
 80147a4:	ea180030 	movi      	r24, 48
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80147a8:	c6ac0420 	cmphs      	r12, r21
 80147ac:	0c55      	bf      	0x8014856	// 8014856 <_ntoa_format+0xfa>
 80147ae:	c58d0037 	addu      	r23, r13, r12
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80147b2:	e7122001 	andi      	r24, r18, 1
      buf[len++] = '0';
 80147b6:	ea190030 	movi      	r25, 48
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80147ba:	e9180008 	bez      	r24, 0x80147ca	// 80147ca <_ntoa_format+0x6e>
 80147be:	c66c0420 	cmphs      	r12, r19
 80147c2:	0804      	bt      	0x80147ca	// 80147ca <_ntoa_format+0x6e>
 80147c4:	eb0c001f 	cmphsi      	r12, 32
 80147c8:	0c4f      	bf      	0x8014866	// 8014866 <_ntoa_format+0x10a>
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 80147ca:	e6f22010 	andi      	r23, r18, 16
 80147ce:	e917002d 	bez      	r23, 0x8014828	// 8014828 <_ntoa_format+0xcc>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 80147d2:	e6f22400 	andi      	r23, r18, 1024
 80147d6:	e937004f 	bnez      	r23, 0x8014874	// 8014874 <_ntoa_format+0x118>
 80147da:	e90c004d 	bez      	r12, 0x8014874	// 8014874 <_ntoa_format+0x118>
 80147de:	c6ac0480 	cmpne      	r12, r21
 80147e2:	0c04      	bf      	0x80147ea	// 80147ea <_ntoa_format+0x8e>
 80147e4:	c66c0480 	cmpne      	r12, r19
 80147e8:	0846      	bt      	0x8014874	// 8014874 <_ntoa_format+0x118>
      len--;
 80147ea:	e6ac1000 	subi      	r21, r12, 1
      if (len && (base == 16U)) {
 80147ee:	e9150041 	bez      	r21, 0x8014870	// 8014870 <_ntoa_format+0x114>
 80147f2:	eb540010 	cmpnei      	r20, 16
 80147f6:	084f      	bt      	0x8014894	// 8014894 <_ntoa_format+0x138>
        len--;
 80147f8:	e58c1001 	subi      	r12, r12, 2
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 80147fc:	e6922020 	andi      	r20, r18, 32
 8014800:	eb0c001f 	cmphsi      	r12, 32
 8014804:	e9340044 	bnez      	r20, 0x801488c	// 801488c <_ntoa_format+0x130>
 8014808:	081b      	bt      	0x801483e	// 801483e <_ntoa_format+0xe2>
      buf[len++] = 'x';
 801480a:	ea140078 	movi      	r20, 120
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'b';
 801480e:	d58d0034 	str.b      	r20, (r13, r12 << 0)
 8014812:	e58c0000 	addi      	r12, r12, 1
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8014816:	eb0c001f 	cmphsi      	r12, 32
 801481a:	0812      	bt      	0x801483e	// 801483e <_ntoa_format+0xe2>
      buf[len++] = '0';
 801481c:	ea140030 	movi      	r20, 48
 8014820:	d58d0034 	str.b      	r20, (r13, r12 << 0)
 8014824:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8014828:	eb0c001f 	cmphsi      	r12, 32
 801482c:	0809      	bt      	0x801483e	// 801483e <_ntoa_format+0xe2>
    if (negative) {
 801482e:	e9160036 	bez      	r22, 0x801489a	// 801489a <_ntoa_format+0x13e>
      buf[len++] = '-';
 8014832:	ea14002d 	movi      	r20, 45
    }
    else if (flags & FLAGS_PLUS) {
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
 8014836:	d58d0034 	str.b      	r20, (r13, r12 << 0)
 801483a:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801483e:	de4e2003 	st.w      	r18, (r14, 0xc)
 8014842:	de6e2002 	st.w      	r19, (r14, 0x8)
 8014846:	dd8e2001 	st.w      	r12, (r14, 0x4)
 801484a:	ddae2000 	st.w      	r13, (r14, 0x0)
 801484e:	e3ffff49 	bsr      	0x80146e0	// 80146e0 <_out_rev>
}
 8014852:	1404      	addi      	r14, r14, 16
 8014854:	1490      	pop      	r15
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8014856:	eb0c001f 	cmphsi      	r12, 32
 801485a:	0baa      	bt      	0x80147ae	// 80147ae <_ntoa_format+0x52>
      buf[len++] = '0';
 801485c:	e58c0000 	addi      	r12, r12, 1
 8014860:	d4178018 	stbi.b      	r24, (r23)
 8014864:	07a2      	br      	0x80147a8	// 80147a8 <_ntoa_format+0x4c>
      buf[len++] = '0';
 8014866:	e58c0000 	addi      	r12, r12, 1
 801486a:	d4178019 	stbi.b      	r25, (r23)
 801486e:	07a6      	br      	0x80147ba	// 80147ba <_ntoa_format+0x5e>
 8014870:	c415482c 	lsli      	r12, r21, 0
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8014874:	eb540010 	cmpnei      	r20, 16
 8014878:	0fc2      	bf      	0x80147fc	// 80147fc <_ntoa_format+0xa0>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801487a:	eb540002 	cmpnei      	r20, 2
 801487e:	0bcc      	bt      	0x8014816	// 8014816 <_ntoa_format+0xba>
 8014880:	eb0c001f 	cmphsi      	r12, 32
 8014884:	0bdd      	bt      	0x801483e	// 801483e <_ntoa_format+0xe2>
      buf[len++] = 'b';
 8014886:	ea140062 	movi      	r20, 98
 801488a:	07c2      	br      	0x801480e	// 801480e <_ntoa_format+0xb2>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 801488c:	0bd9      	bt      	0x801483e	// 801483e <_ntoa_format+0xe2>
      buf[len++] = 'X';
 801488e:	ea140058 	movi      	r20, 88
 8014892:	07be      	br      	0x801480e	// 801480e <_ntoa_format+0xb2>
 8014894:	c415482c 	lsli      	r12, r21, 0
 8014898:	07f1      	br      	0x801487a	// 801487a <_ntoa_format+0x11e>
    else if (flags & FLAGS_PLUS) {
 801489a:	e6922004 	andi      	r20, r18, 4
 801489e:	e9140005 	bez      	r20, 0x80148a8	// 80148a8 <_ntoa_format+0x14c>
      buf[len++] = '+';  // ignore the space if the '+' exists
 80148a2:	ea14002b 	movi      	r20, 43
 80148a6:	07c8      	br      	0x8014836	// 8014836 <_ntoa_format+0xda>
    else if (flags & FLAGS_SPACE) {
 80148a8:	e6922008 	andi      	r20, r18, 8
 80148ac:	e914ffc9 	bez      	r20, 0x801483e	// 801483e <_ntoa_format+0xe2>
      buf[len++] = ' ';
 80148b0:	ea140020 	movi      	r20, 32
 80148b4:	07c1      	br      	0x8014836	// 8014836 <_ntoa_format+0xda>
	...

080148b8 <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 80148b8:	14d2      	push      	r4-r5, r15
 80148ba:	142f      	subi      	r14, r14, 60
 80148bc:	d98e2012 	ld.w      	r12, (r14, 0x48)
 80148c0:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 80148c4:	6d77      	mov      	r5, r13
 80148c6:	da8e2014 	ld.w      	r20, (r14, 0x50)
 80148ca:	db2e2015 	ld.w      	r25, (r14, 0x54)
 80148ce:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 80148d2:	db0e004c 	ld.b      	r24, (r14, 0x4c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 80148d6:	e92c0004 	bnez      	r12, 0x80148de	// 80148de <_ntoa_long+0x26>
    flags &= ~FLAGS_HASH;
 80148da:	c48d282d 	bclri      	r13, r13, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 80148de:	e64d2400 	andi      	r18, r13, 1024
 80148e2:	e6ee001b 	addi      	r23, r14, 28
 80148e6:	e9120004 	bez      	r18, 0x80148ee	// 80148ee <_ntoa_long+0x36>
 80148ea:	e90c003e 	bez      	r12, 0x8014966	// 8014966 <_ntoa_long+0xae>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80148ee:	e64d2020 	andi      	r18, r13, 32
 80148f2:	eb520000 	cmpnei      	r18, 0
 80148f6:	ea130061 	movi      	r19, 97
 80148fa:	ea120041 	movi      	r18, 65
 80148fe:	c6530c20 	incf      	r18, r19, 0
 8014902:	ea160000 	movi      	r22, 0
 8014906:	e6521009 	subi      	r18, r18, 10
 801490a:	ea150020 	movi      	r21, 32
      const char digit = (char)(value % base);
 801490e:	c68c8024 	divu      	r4, r12, r20
 8014912:	c6848433 	mult      	r19, r4, r20
 8014916:	c66c008c 	subu      	r12, r12, r19
 801491a:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 801491c:	eb0c0009 	cmphsi      	r12, 10
 8014920:	e6760000 	addi      	r19, r22, 1
 8014924:	081e      	bt      	0x8014960	// 8014960 <_ntoa_long+0xa8>
 8014926:	e58c002f 	addi      	r12, r12, 48
 801492a:	7730      	zextb      	r12, r12
 801492c:	d6d7002c 	str.b      	r12, (r23, r22 << 0)
      value /= base;
 8014930:	6f13      	mov      	r12, r4
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8014932:	e9040006 	bez      	r4, 0x801493e	// 801493e <_ntoa_long+0x86>
 8014936:	c4134836 	lsli      	r22, r19, 0
 801493a:	e835ffea 	bnezad      	r21, 0x801490e	// 801490e <_ntoa_long+0x56>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 801493e:	ddae2006 	st.w      	r13, (r14, 0x18)
 8014942:	b8a5      	st.w      	r5, (r14, 0x14)
 8014944:	df2e2004 	st.w      	r25, (r14, 0x10)
 8014948:	de8e2003 	st.w      	r20, (r14, 0xc)
 801494c:	df0e2002 	st.w      	r24, (r14, 0x8)
 8014950:	de6e2001 	st.w      	r19, (r14, 0x4)
 8014954:	deee2000 	st.w      	r23, (r14, 0x0)
 8014958:	e3ffff02 	bsr      	0x801475c	// 801475c <_ntoa_format>
}
 801495c:	140f      	addi      	r14, r14, 60
 801495e:	1492      	pop      	r4-r5, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8014960:	c64c002c 	addu      	r12, r12, r18
 8014964:	07e3      	br      	0x801492a	// 801492a <_ntoa_long+0x72>
  size_t len = 0U;
 8014966:	c40c4833 	lsli      	r19, r12, 0
 801496a:	07ea      	br      	0x801493e	// 801493e <_ntoa_long+0x86>

0801496c <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 801496c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014970:	1435      	subi      	r14, r14, 84
 8014972:	d98e2020 	ld.w      	r12, (r14, 0x80)
 8014976:	d9ae2021 	ld.w      	r13, (r14, 0x84)
 801497a:	6e8f      	mov      	r10, r3
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 801497c:	c5ac2430 	or      	r16, r12, r13
{
 8014980:	9965      	ld.w      	r3, (r14, 0x94)
 8014982:	b868      	st.w      	r3, (r14, 0x20)
 8014984:	9966      	ld.w      	r3, (r14, 0x98)
 8014986:	b807      	st.w      	r0, (r14, 0x1c)
 8014988:	6e07      	mov      	r8, r1
 801498a:	6e4b      	mov      	r9, r2
 801498c:	99e3      	ld.w      	r7, (r14, 0x8c)
 801498e:	99c4      	ld.w      	r6, (r14, 0x90)
 8014990:	b869      	st.w      	r3, (r14, 0x24)
 8014992:	da2e2027 	ld.w      	r17, (r14, 0x9c)
 8014996:	d96e0088 	ld.b      	r11, (r14, 0x88)
  if (!value) {
 801499a:	e9300004 	bnez      	r16, 0x80149a2	// 80149a2 <_ntoa_long_long+0x36>
    flags &= ~FLAGS_HASH;
 801499e:	c4912831 	bclri      	r17, r17, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 80149a2:	e4712400 	andi      	r3, r17, 1024
 80149a6:	1d0d      	addi      	r5, r14, 52
 80149a8:	e9030004 	bez      	r3, 0x80149b0	// 80149b0 <_ntoa_long_long+0x44>
 80149ac:	e9100037 	bez      	r16, 0x8014a1a	// 8014a1a <_ntoa_long_long+0xae>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80149b0:	e4712020 	andi      	r3, r17, 32
 80149b4:	3b40      	cmpnei      	r3, 0
 80149b6:	3441      	movi      	r4, 65
 80149b8:	3361      	movi      	r3, 97
 80149ba:	c4830c20 	incf      	r4, r3, 0
 80149be:	ea130000 	movi      	r19, 0
 80149c2:	2c09      	subi      	r4, 10
      const char digit = (char)(value % base);
 80149c4:	6c33      	mov      	r0, r12
 80149c6:	6c77      	mov      	r1, r13
 80149c8:	6c9f      	mov      	r2, r7
 80149ca:	6cdb      	mov      	r3, r6
 80149cc:	de6e200c 	st.w      	r19, (r14, 0x30)
 80149d0:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 80149d4:	ddae200a 	st.w      	r13, (r14, 0x28)
 80149d8:	e3ffe00a 	bsr      	0x80109ec	// 80109ec <__umoddi3>
 80149dc:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 80149de:	3809      	cmphsi      	r0, 10
 80149e0:	da6e200c 	ld.w      	r19, (r14, 0x30)
 80149e4:	e6130000 	addi      	r16, r19, 1
 80149e8:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 80149ec:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 80149f0:	082a      	bt      	0x8014a44	// 8014a44 <_ntoa_long_long+0xd8>
 80149f2:	202f      	addi      	r0, 48
 80149f4:	7400      	zextb      	r0, r0
 80149f6:	d6650020 	str.b      	r0, (r5, r19 << 0)
      value /= base;
 80149fa:	6c77      	mov      	r1, r13
 80149fc:	6c33      	mov      	r0, r12
 80149fe:	6c9f      	mov      	r2, r7
 8014a00:	6cdb      	mov      	r3, r6
 8014a02:	e3ffde5b 	bsr      	0x80106b8	// 80106b8 <__udivdi3>
 8014a06:	6f47      	mov      	r13, r1
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8014a08:	6c40      	or      	r1, r0
      value /= base;
 8014a0a:	6f03      	mov      	r12, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8014a0c:	e9010007 	bez      	r1, 0x8014a1a	// 8014a1a <_ntoa_long_long+0xae>
 8014a10:	eb500020 	cmpnei      	r16, 32
 8014a14:	c4104833 	lsli      	r19, r16, 0
 8014a18:	0bd6      	bt      	0x80149c4	// 80149c4 <_ntoa_long_long+0x58>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8014a1a:	9869      	ld.w      	r3, (r14, 0x24)
 8014a1c:	b865      	st.w      	r3, (r14, 0x14)
 8014a1e:	9868      	ld.w      	r3, (r14, 0x20)
 8014a20:	b864      	st.w      	r3, (r14, 0x10)
 8014a22:	de2e2006 	st.w      	r17, (r14, 0x18)
 8014a26:	b8e3      	st.w      	r7, (r14, 0xc)
 8014a28:	dd6e2002 	st.w      	r11, (r14, 0x8)
 8014a2c:	de0e2001 	st.w      	r16, (r14, 0x4)
 8014a30:	b8a0      	st.w      	r5, (r14, 0x0)
 8014a32:	6ceb      	mov      	r3, r10
 8014a34:	6ca7      	mov      	r2, r9
 8014a36:	6c63      	mov      	r1, r8
 8014a38:	9807      	ld.w      	r0, (r14, 0x1c)
 8014a3a:	e3fffe91 	bsr      	0x801475c	// 801475c <_ntoa_format>
}
 8014a3e:	1415      	addi      	r14, r14, 84
 8014a40:	ebc00058 	pop      	r4-r11, r15, r16-r17
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8014a44:	6010      	addu      	r0, r4
 8014a46:	07d7      	br      	0x80149f4	// 80149f4 <_ntoa_long_long+0x88>

08014a48 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8014a48:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014a4c:	1437      	subi      	r14, r14, 92
 8014a4e:	da0e2022 	ld.w      	r16, (r14, 0x88)
 8014a52:	da2e2023 	ld.w      	r17, (r14, 0x8c)
 8014a56:	b805      	st.w      	r0, (r14, 0x14)
 8014a58:	b826      	st.w      	r1, (r14, 0x18)
 8014a5a:	6ecb      	mov      	r11, r2
 8014a5c:	b867      	st.w      	r3, (r14, 0x1c)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8014a5e:	c4104822 	lsli      	r2, r16, 0
 8014a62:	c4114823 	lsli      	r3, r17, 0
 8014a66:	c4104820 	lsli      	r0, r16, 0
 8014a6a:	c4114821 	lsli      	r1, r17, 0
{
 8014a6e:	9984      	ld.w      	r4, (r14, 0x90)
 8014a70:	99e5      	ld.w      	r7, (r14, 0x94)
 8014a72:	99a6      	ld.w      	r5, (r14, 0x98)
  if (value != value)
 8014a74:	e3ffe472 	bsr      	0x8011358	// 8011358 <__nedf2>
 8014a78:	e900000f 	bez      	r0, 0x8014a96	// 8014a96 <_ftoa+0x4e>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8014a7c:	3303      	movi      	r3, 3
 8014a7e:	b861      	st.w      	r3, (r14, 0x4)
 8014a80:	b8a3      	st.w      	r5, (r14, 0xc)
 8014a82:	b8e2      	st.w      	r7, (r14, 0x8)
 8014a84:	0178      	lrw      	r3, 0x801667c	// 8014da0 <_ftoa+0x358>
  if (value < -DBL_MAX)
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8014a86:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8014a88:	9867      	ld.w      	r3, (r14, 0x1c)
 8014a8a:	6caf      	mov      	r2, r11
 8014a8c:	9826      	ld.w      	r1, (r14, 0x18)
 8014a8e:	9805      	ld.w      	r0, (r14, 0x14)
 8014a90:	e3fffe28 	bsr      	0x80146e0	// 80146e0 <_out_rev>
 8014a94:	044e      	br      	0x8014b30	// 8014b30 <_ftoa+0xe8>
  if (value < -DBL_MAX)
 8014a96:	3200      	movi      	r2, 0
 8014a98:	ea23fff0 	movih      	r3, 65520
 8014a9c:	2a00      	subi      	r2, 1
 8014a9e:	2b00      	subi      	r3, 1
 8014aa0:	c4104820 	lsli      	r0, r16, 0
 8014aa4:	9923      	ld.w      	r1, (r14, 0x8c)
 8014aa6:	e3ffe4b5 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014aaa:	e9a00008 	bhsz      	r0, 0x8014aba	// 8014aba <_ftoa+0x72>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 8014aae:	3304      	movi      	r3, 4
 8014ab0:	b861      	st.w      	r3, (r14, 0x4)
 8014ab2:	b8a3      	st.w      	r5, (r14, 0xc)
 8014ab4:	b8e2      	st.w      	r7, (r14, 0x8)
 8014ab6:	0263      	lrw      	r3, 0x8016680	// 8014da4 <_ftoa+0x35c>
 8014ab8:	07e7      	br      	0x8014a86	// 8014a86 <_ftoa+0x3e>
  if (value > DBL_MAX)
 8014aba:	3200      	movi      	r2, 0
 8014abc:	ea237ff0 	movih      	r3, 32752
 8014ac0:	2a00      	subi      	r2, 1
 8014ac2:	2b00      	subi      	r3, 1
 8014ac4:	c4104820 	lsli      	r0, r16, 0
 8014ac8:	9923      	ld.w      	r1, (r14, 0x8c)
 8014aca:	e3ffe463 	bsr      	0x8011390	// 8011390 <__gtdf2>
 8014ace:	e9600012 	blsz      	r0, 0x8014af2	// 8014af2 <_ftoa+0xaa>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8014ad2:	e4452004 	andi      	r2, r5, 4
 8014ad6:	3a40      	cmpnei      	r2, 0
 8014ad8:	022b      	lrw      	r1, 0x8016673	// 8014da8 <_ftoa+0x360>
 8014ada:	026a      	lrw      	r3, 0x8016678	// 8014dac <_ftoa+0x364>
 8014adc:	c4610c40 	inct      	r3, r1, 0
 8014ae0:	3a40      	cmpnei      	r2, 0
 8014ae2:	3104      	movi      	r1, 4
 8014ae4:	3203      	movi      	r2, 3
 8014ae6:	c4410c40 	inct      	r2, r1, 0
 8014aea:	b8a3      	st.w      	r5, (r14, 0xc)
 8014aec:	b8e2      	st.w      	r7, (r14, 0x8)
 8014aee:	b841      	st.w      	r2, (r14, 0x4)
 8014af0:	07cb      	br      	0x8014a86	// 8014a86 <_ftoa+0x3e>
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8014af2:	3200      	movi      	r2, 0
 8014af4:	0270      	lrw      	r3, 0x41cdcd65	// 8014db0 <_ftoa+0x368>
 8014af6:	c4104820 	lsli      	r0, r16, 0
 8014afa:	9923      	ld.w      	r1, (r14, 0x8c)
 8014afc:	e3ffe44a 	bsr      	0x8011390	// 8011390 <__gtdf2>
 8014b00:	e940000b 	bhz      	r0, 0x8014b16	// 8014b16 <_ftoa+0xce>
 8014b04:	3200      	movi      	r2, 0
 8014b06:	0273      	lrw      	r3, 0xc1cdcd65	// 8014db4 <_ftoa+0x36c>
 8014b08:	c4104820 	lsli      	r0, r16, 0
 8014b0c:	9923      	ld.w      	r1, (r14, 0x8c)
 8014b0e:	e3ffe481 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014b12:	e9a00012 	bhsz      	r0, 0x8014b36	// 8014b36 <_ftoa+0xee>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8014b16:	b8a4      	st.w      	r5, (r14, 0x10)
 8014b18:	b8e3      	st.w      	r7, (r14, 0xc)
 8014b1a:	b882      	st.w      	r4, (r14, 0x8)
 8014b1c:	de0e2000 	st.w      	r16, (r14, 0x0)
 8014b20:	de2e2001 	st.w      	r17, (r14, 0x4)
 8014b24:	9867      	ld.w      	r3, (r14, 0x1c)
 8014b26:	6caf      	mov      	r2, r11
 8014b28:	9826      	ld.w      	r1, (r14, 0x18)
 8014b2a:	9805      	ld.w      	r0, (r14, 0x14)
 8014b2c:	e0000166 	bsr      	0x8014df8	// 8014df8 <_etoa>
}
 8014b30:	1417      	addi      	r14, r14, 92
 8014b32:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if (value < 0) {
 8014b36:	3200      	movi      	r2, 0
 8014b38:	6ccb      	mov      	r3, r2
 8014b3a:	c4104820 	lsli      	r0, r16, 0
 8014b3e:	9923      	ld.w      	r1, (r14, 0x8c)
 8014b40:	e3ffe468 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014b44:	e9a000b5 	bhsz      	r0, 0x8014cae	// 8014cae <_ftoa+0x266>
    value = 0 - value;
 8014b48:	c4104822 	lsli      	r2, r16, 0
 8014b4c:	9963      	ld.w      	r3, (r14, 0x8c)
 8014b4e:	3000      	movi      	r0, 0
 8014b50:	3100      	movi      	r1, 0
 8014b52:	e3ffe259 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014b56:	c4004830 	lsli      	r16, r0, 0
 8014b5a:	c4014831 	lsli      	r17, r1, 0
    negative = true;
 8014b5e:	3301      	movi      	r3, 1
  bool negative = false;
 8014b60:	b86b      	st.w      	r3, (r14, 0x2c)
  if (!(flags & FLAGS_PRECISION)) {
 8014b62:	e4652400 	andi      	r3, r5, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014b66:	3b40      	cmpnei      	r3, 0
 8014b68:	3306      	movi      	r3, 6
 8014b6a:	c4830c20 	incf      	r4, r3, 0
 8014b6e:	ea120000 	movi      	r18, 0
 8014b72:	e52e003b 	addi      	r9, r14, 60
    buf[len++] = '0';
 8014b76:	3230      	movi      	r2, 48
 8014b78:	3320      	movi      	r3, 32
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014b7a:	3c09      	cmphsi      	r4, 10
 8014b7c:	c4124826 	lsli      	r6, r18, 0
 8014b80:	0c09      	bf      	0x8014b92	// 8014b92 <_ftoa+0x14a>
    buf[len++] = '0';
 8014b82:	d6490022 	str.b      	r2, (r9, r18 << 0)
    prec--;
 8014b86:	2c00      	subi      	r4, 1
 8014b88:	e6520000 	addi      	r18, r18, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 8014b8c:	e823fff7 	bnezad      	r3, 0x8014b7a	// 8014b7a <_ftoa+0x132>
 8014b90:	3620      	movi      	r6, 32
  int whole = (int)value;
 8014b92:	c4114821 	lsli      	r1, r17, 0
 8014b96:	c4104820 	lsli      	r0, r16, 0
 8014b9a:	de4e200e 	st.w      	r18, (r14, 0x38)
  double tmp = (value - whole) * pow10[prec];
 8014b9e:	c4644828 	lsli      	r8, r4, 3
  int whole = (int)value;
 8014ba2:	e3ffe4a3 	bsr      	0x80114e8	// 80114e8 <__fixdfsi>
  double tmp = (value - whole) * pow10[prec];
 8014ba6:	037a      	lrw      	r3, 0x8016688	// 8014db8 <_ftoa+0x370>
 8014ba8:	60e0      	addu      	r3, r8
 8014baa:	b86a      	st.w      	r3, (r14, 0x28)
 8014bac:	9360      	ld.w      	r3, (r3, 0x0)
 8014bae:	b868      	st.w      	r3, (r14, 0x20)
 8014bb0:	986a      	ld.w      	r3, (r14, 0x28)
  int whole = (int)value;
 8014bb2:	6e83      	mov      	r10, r0
  double tmp = (value - whole) * pow10[prec];
 8014bb4:	9361      	ld.w      	r3, (r3, 0x4)
 8014bb6:	b869      	st.w      	r3, (r14, 0x24)
 8014bb8:	e3ffe464 	bsr      	0x8011480	// 8011480 <__floatsidf>
 8014bbc:	6c83      	mov      	r2, r0
 8014bbe:	6cc7      	mov      	r3, r1
 8014bc0:	c4104820 	lsli      	r0, r16, 0
 8014bc4:	c4114821 	lsli      	r1, r17, 0
 8014bc8:	e3ffe21e 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014bcc:	986a      	ld.w      	r3, (r14, 0x28)
 8014bce:	9848      	ld.w      	r2, (r14, 0x20)
 8014bd0:	9361      	ld.w      	r3, (r3, 0x4)
 8014bd2:	e3ffe237 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014bd6:	6f03      	mov      	r12, r0
 8014bd8:	6f47      	mov      	r13, r1
  unsigned long frac = (unsigned long)tmp;
 8014bda:	dd8e200c 	st.w      	r12, (r14, 0x30)
 8014bde:	ddae200d 	st.w      	r13, (r14, 0x34)
 8014be2:	e3ffdd4f 	bsr      	0x8010680	// 8010680 <__fixunsdfsi>
 8014be6:	6e03      	mov      	r8, r0
  diff = tmp - frac;
 8014be8:	e3ffe4b8 	bsr      	0x8011558	// 8011558 <__floatunsidf>
 8014bec:	d98e200c 	ld.w      	r12, (r14, 0x30)
 8014bf0:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8014bf4:	6c83      	mov      	r2, r0
 8014bf6:	6cc7      	mov      	r3, r1
 8014bf8:	6c33      	mov      	r0, r12
 8014bfa:	6c77      	mov      	r1, r13
 8014bfc:	e3ffe204 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014c00:	6f03      	mov      	r12, r0
 8014c02:	6f47      	mov      	r13, r1
  if (diff > 0.5) {
 8014c04:	3200      	movi      	r2, 0
 8014c06:	ea233fe0 	movih      	r3, 16352
 8014c0a:	dd8e200c 	st.w      	r12, (r14, 0x30)
 8014c0e:	ddae200d 	st.w      	r13, (r14, 0x34)
 8014c12:	e3ffe3bf 	bsr      	0x8011390	// 8011390 <__gtdf2>
 8014c16:	d98e200c 	ld.w      	r12, (r14, 0x30)
 8014c1a:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 8014c1e:	da4e200e 	ld.w      	r18, (r14, 0x38)
 8014c22:	e9600048 	blsz      	r0, 0x8014cb2	// 8014cb2 <_ftoa+0x26a>
    ++frac;
 8014c26:	e5080000 	addi      	r8, r8, 1
    if (frac >= pow10[prec]) {
 8014c2a:	6c23      	mov      	r0, r8
 8014c2c:	de4e200c 	st.w      	r18, (r14, 0x30)
 8014c30:	e3ffe494 	bsr      	0x8011558	// 8011558 <__floatunsidf>
 8014c34:	6cc7      	mov      	r3, r1
 8014c36:	982a      	ld.w      	r1, (r14, 0x28)
 8014c38:	6c83      	mov      	r2, r0
 8014c3a:	9121      	ld.w      	r1, (r1, 0x4)
 8014c3c:	9808      	ld.w      	r0, (r14, 0x20)
 8014c3e:	e3ffe405 	bsr      	0x8011448	// 8011448 <__ledf2>
 8014c42:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8014c46:	e9400006 	bhz      	r0, 0x8014c52	// 8014c52 <_ftoa+0x20a>
      ++whole;
 8014c4a:	e54a0000 	addi      	r10, r10, 1
      frac = 0;
 8014c4e:	ea080000 	movi      	r8, 0
  if (prec == 0U) {
 8014c52:	e9240066 	bnez      	r4, 0x8014d1e	// 8014d1e <_ftoa+0x2d6>
    diff = value - (double)whole;
 8014c56:	6c2b      	mov      	r0, r10
 8014c58:	e3ffe414 	bsr      	0x8011480	// 8011480 <__floatsidf>
 8014c5c:	6c83      	mov      	r2, r0
 8014c5e:	6cc7      	mov      	r3, r1
 8014c60:	c4104820 	lsli      	r0, r16, 0
 8014c64:	c4114821 	lsli      	r1, r17, 0
 8014c68:	e3ffe1ce 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014c6c:	6f03      	mov      	r12, r0
 8014c6e:	6f47      	mov      	r13, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8014c70:	6c93      	mov      	r2, r4
 8014c72:	ea233fe0 	movih      	r3, 16352
 8014c76:	dd8e2008 	st.w      	r12, (r14, 0x20)
 8014c7a:	ddae2009 	st.w      	r13, (r14, 0x24)
 8014c7e:	e3ffe3c9 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014c82:	e9a0000f 	bhsz      	r0, 0x8014ca0	// 8014ca0 <_ftoa+0x258>
 8014c86:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8014c8a:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8014c8e:	6c93      	mov      	r2, r4
 8014c90:	ea233fe0 	movih      	r3, 16352
 8014c94:	6c33      	mov      	r0, r12
 8014c96:	6c77      	mov      	r1, r13
 8014c98:	e3ffe37c 	bsr      	0x8011390	// 8011390 <__gtdf2>
 8014c9c:	e9600007 	blsz      	r0, 0x8014caa	// 8014caa <_ftoa+0x262>
 8014ca0:	e46a2001 	andi      	r3, r10, 1
      ++whole;
 8014ca4:	3b40      	cmpnei      	r3, 0
 8014ca6:	c54a0c41 	inct      	r10, r10, 1
    buf[len++] = (char)(48 + (whole % 10));
 8014caa:	320a      	movi      	r2, 10
 8014cac:	0474      	br      	0x8014d94	// 8014d94 <_ftoa+0x34c>
  bool negative = false;
 8014cae:	3300      	movi      	r3, 0
 8014cb0:	0758      	br      	0x8014b60	// 8014b60 <_ftoa+0x118>
  else if (diff < 0.5) {
 8014cb2:	3200      	movi      	r2, 0
 8014cb4:	ea233fe0 	movih      	r3, 16352
 8014cb8:	6c33      	mov      	r0, r12
 8014cba:	6c77      	mov      	r1, r13
 8014cbc:	de4e2008 	st.w      	r18, (r14, 0x20)
 8014cc0:	e3ffe3a8 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014cc4:	da4e2008 	ld.w      	r18, (r14, 0x20)
 8014cc8:	e980ffc5 	blz      	r0, 0x8014c52	// 8014c52 <_ftoa+0x20a>
  else if ((frac == 0U) || (frac & 1U)) {
 8014ccc:	e9080006 	bez      	r8, 0x8014cd8	// 8014cd8 <_ftoa+0x290>
 8014cd0:	e4682001 	andi      	r3, r8, 1
 8014cd4:	e903ffbf 	bez      	r3, 0x8014c52	// 8014c52 <_ftoa+0x20a>
    ++frac;
 8014cd8:	e5080000 	addi      	r8, r8, 1
 8014cdc:	07bb      	br      	0x8014c52	// 8014c52 <_ftoa+0x20a>
      buf[len++] = (char)(48U + (frac % 10U));
 8014cde:	c4288020 	divu      	r0, r8, r1
 8014ce2:	c4208423 	mult      	r3, r0, r1
 8014ce6:	c4680092 	subu      	r18, r8, r3
 8014cea:	e652002f 	addi      	r18, r18, 48
      --count;
 8014cee:	2c00      	subi      	r4, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8014cf0:	e4510000 	addi      	r2, r17, 1
 8014cf4:	d6290032 	str.b      	r18, (r9, r17 << 0)
      if (!(frac /= 10U)) {
 8014cf8:	6e03      	mov      	r8, r0
 8014cfa:	e9200034 	bnez      	r0, 0x8014d62	// 8014d62 <_ftoa+0x31a>
 8014cfe:	6108      	addu      	r4, r2
      buf[len++] = (char)(48U + (frac % 10U));
 8014d00:	c4024831 	lsli      	r17, r2, 0
      buf[len++] = '0';
 8014d04:	3330      	movi      	r3, 48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8014d06:	eb510020 	cmpnei      	r17, 32
 8014d0a:	0c10      	bf      	0x8014d2a	// 8014d2a <_ftoa+0x2e2>
 8014d0c:	c4910480 	cmpne      	r17, r4
 8014d10:	e4d10000 	addi      	r6, r17, 1
 8014d14:	082a      	bt      	0x8014d68	// 8014d68 <_ftoa+0x320>
      buf[len++] = '.';
 8014d16:	332e      	movi      	r3, 46
 8014d18:	d6290023 	str.b      	r3, (r9, r17 << 0)
 8014d1c:	07c7      	br      	0x8014caa	// 8014caa <_ftoa+0x262>
  if (prec == 0U) {
 8014d1e:	c4124831 	lsli      	r17, r18, 0
      buf[len++] = (char)(48U + (frac % 10U));
 8014d22:	310a      	movi      	r1, 10
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014d24:	eb510020 	cmpnei      	r17, 32
 8014d28:	0bdb      	bt      	0x8014cde	// 8014cde <_ftoa+0x296>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8014d2a:	e4652003 	andi      	r3, r5, 3
 8014d2e:	3b41      	cmpnei      	r3, 1
 8014d30:	084b      	bt      	0x8014dc6	// 8014dc6 <_ftoa+0x37e>
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8014d32:	e907004a 	bez      	r7, 0x8014dc6	// 8014dc6 <_ftoa+0x37e>
 8014d36:	986b      	ld.w      	r3, (r14, 0x2c)
 8014d38:	e9230006 	bnez      	r3, 0x8014d44	// 8014d44 <_ftoa+0x2fc>
 8014d3c:	e465200c 	andi      	r3, r5, 12
 8014d40:	e9030003 	bez      	r3, 0x8014d46	// 8014d46 <_ftoa+0x2fe>
      width--;
 8014d44:	2f00      	subi      	r7, 1
      buf[len++] = '0';
 8014d46:	3330      	movi      	r3, 48
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8014d48:	c4f10420 	cmphs      	r17, r7
 8014d4c:	083d      	bt      	0x8014dc6	// 8014dc6 <_ftoa+0x37e>
 8014d4e:	eb11001f 	cmphsi      	r17, 32
 8014d52:	0c35      	bf      	0x8014dbc	// 8014dbc <_ftoa+0x374>
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8014d54:	b8a3      	st.w      	r5, (r14, 0xc)
 8014d56:	b8e2      	st.w      	r7, (r14, 0x8)
 8014d58:	de2e2001 	st.w      	r17, (r14, 0x4)
 8014d5c:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8014d60:	0694      	br      	0x8014a88	// 8014a88 <_ftoa+0x40>
      buf[len++] = (char)(48U + (frac % 10U));
 8014d62:	c4024831 	lsli      	r17, r2, 0
 8014d66:	07df      	br      	0x8014d24	// 8014d24 <_ftoa+0x2dc>
      buf[len++] = '0';
 8014d68:	d6290023 	str.b      	r3, (r9, r17 << 0)
 8014d6c:	c4064831 	lsli      	r17, r6, 0
 8014d70:	07cb      	br      	0x8014d06	// 8014d06 <_ftoa+0x2be>
    buf[len++] = (char)(48 + (whole % 10));
 8014d72:	c44a8041 	divs      	r1, r10, r2
 8014d76:	c4418423 	mult      	r3, r1, r2
 8014d7a:	c46a0093 	subu      	r19, r10, r3
 8014d7e:	e673002f 	addi      	r19, r19, 48
 8014d82:	e6260000 	addi      	r17, r6, 1
 8014d86:	d4c90033 	str.b      	r19, (r9, r6 << 0)
    if (!(whole /= 10)) {
 8014d8a:	6e87      	mov      	r10, r1
 8014d8c:	e901ffcf 	bez      	r1, 0x8014d2a	// 8014d2a <_ftoa+0x2e2>
    buf[len++] = (char)(48 + (whole % 10));
 8014d90:	c4114826 	lsli      	r6, r17, 0
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014d94:	3e1f      	cmphsi      	r6, 32
 8014d96:	0fee      	bf      	0x8014d72	// 8014d72 <_ftoa+0x32a>
 8014d98:	c4064831 	lsli      	r17, r6, 0
 8014d9c:	07c7      	br      	0x8014d2a	// 8014d2a <_ftoa+0x2e2>
 8014d9e:	0000      	.short	0x0000
 8014da0:	0801667c 	.long	0x0801667c
 8014da4:	08016680 	.long	0x08016680
 8014da8:	08016673 	.long	0x08016673
 8014dac:	08016678 	.long	0x08016678
 8014db0:	41cdcd65 	.long	0x41cdcd65
 8014db4:	c1cdcd65 	.long	0xc1cdcd65
 8014db8:	08016688 	.long	0x08016688
      buf[len++] = '0';
 8014dbc:	d6290023 	str.b      	r3, (r9, r17 << 0)
 8014dc0:	e6310000 	addi      	r17, r17, 1
 8014dc4:	07c2      	br      	0x8014d48	// 8014d48 <_ftoa+0x300>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8014dc6:	eb11001f 	cmphsi      	r17, 32
 8014dca:	0bc5      	bt      	0x8014d54	// 8014d54 <_ftoa+0x30c>
    if (negative) {
 8014dcc:	986b      	ld.w      	r3, (r14, 0x2c)
 8014dce:	e9030008 	bez      	r3, 0x8014dde	// 8014dde <_ftoa+0x396>
      buf[len++] = '-';
 8014dd2:	332d      	movi      	r3, 45
      buf[len++] = ' ';
 8014dd4:	d6290023 	str.b      	r3, (r9, r17 << 0)
 8014dd8:	e6310000 	addi      	r17, r17, 1
 8014ddc:	07bc      	br      	0x8014d54	// 8014d54 <_ftoa+0x30c>
    else if (flags & FLAGS_PLUS) {
 8014dde:	e4652004 	andi      	r3, r5, 4
 8014de2:	e9030004 	bez      	r3, 0x8014dea	// 8014dea <_ftoa+0x3a2>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8014de6:	332b      	movi      	r3, 43
 8014de8:	07f6      	br      	0x8014dd4	// 8014dd4 <_ftoa+0x38c>
    else if (flags & FLAGS_SPACE) {
 8014dea:	e4652008 	andi      	r3, r5, 8
 8014dee:	e903ffb3 	bez      	r3, 0x8014d54	// 8014d54 <_ftoa+0x30c>
      buf[len++] = ' ';
 8014df2:	3320      	movi      	r3, 32
 8014df4:	07f0      	br      	0x8014dd4	// 8014dd4 <_ftoa+0x38c>
	...

08014df8 <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8014df8:	ebe00058 	push      	r4-r11, r15, r16-r17
 8014dfc:	1433      	subi      	r14, r14, 76
 8014dfe:	b868      	st.w      	r3, (r14, 0x20)
 8014e00:	d90e201e 	ld.w      	r8, (r14, 0x78)
 8014e04:	98ff      	ld.w      	r7, (r14, 0x7c)
 8014e06:	9961      	ld.w      	r3, (r14, 0x84)
 8014e08:	b806      	st.w      	r0, (r14, 0x18)
 8014e0a:	b827      	st.w      	r1, (r14, 0x1c)
 8014e0c:	b84a      	st.w      	r2, (r14, 0x28)
 8014e0e:	b869      	st.w      	r3, (r14, 0x24)
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8014e10:	6ca3      	mov      	r2, r8
 8014e12:	6cdf      	mov      	r3, r7
 8014e14:	6c23      	mov      	r0, r8
 8014e16:	6c5f      	mov      	r1, r7
 8014e18:	e3ffe2a0 	bsr      	0x8011358	// 8011358 <__nedf2>
{
 8014e1c:	99a0      	ld.w      	r5, (r14, 0x80)
 8014e1e:	d92e2022 	ld.w      	r9, (r14, 0x88)
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 8014e22:	6d03      	mov      	r4, r0
 8014e24:	e9200018 	bnez      	r0, 0x8014e54	// 8014e54 <_etoa+0x5c>
 8014e28:	3200      	movi      	r2, 0
 8014e2a:	ea237ff0 	movih      	r3, 32752
 8014e2e:	2a00      	subi      	r2, 1
 8014e30:	2b00      	subi      	r3, 1
 8014e32:	6c23      	mov      	r0, r8
 8014e34:	6c5f      	mov      	r1, r7
 8014e36:	e3ffe2ad 	bsr      	0x8011390	// 8011390 <__gtdf2>
 8014e3a:	e940000d 	bhz      	r0, 0x8014e54	// 8014e54 <_etoa+0x5c>
 8014e3e:	3200      	movi      	r2, 0
 8014e40:	ea23fff0 	movih      	r3, 65520
 8014e44:	2a00      	subi      	r2, 1
 8014e46:	2b00      	subi      	r3, 1
 8014e48:	6c23      	mov      	r0, r8
 8014e4a:	6c5f      	mov      	r1, r7
 8014e4c:	e3ffe2e2 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8014e50:	e9a00013 	bhsz      	r0, 0x8014e76	// 8014e76 <_etoa+0x7e>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 8014e54:	9869      	ld.w      	r3, (r14, 0x24)
 8014e56:	b863      	st.w      	r3, (r14, 0xc)
 8014e58:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8014e5c:	b8a2      	st.w      	r5, (r14, 0x8)
 8014e5e:	dd0e2000 	st.w      	r8, (r14, 0x0)
 8014e62:	b8e1      	st.w      	r7, (r14, 0x4)
 8014e64:	9868      	ld.w      	r3, (r14, 0x20)
 8014e66:	984a      	ld.w      	r2, (r14, 0x28)
 8014e68:	9827      	ld.w      	r1, (r14, 0x1c)
 8014e6a:	9806      	ld.w      	r0, (r14, 0x18)
 8014e6c:	e3fffdee 	bsr      	0x8014a48	// 8014a48 <_ftoa>
    if (flags & FLAGS_LEFT) {
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
    }
  }
  return idx;
}
 8014e70:	1413      	addi      	r14, r14, 76
 8014e72:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if (negative) {
 8014e76:	6c93      	mov      	r2, r4
 8014e78:	6cd3      	mov      	r3, r4
 8014e7a:	6c23      	mov      	r0, r8
 8014e7c:	6c5f      	mov      	r1, r7
 8014e7e:	e3ffe2c9 	bsr      	0x8011410	// 8011410 <__ltdf2>
    value = -value;
 8014e82:	c4084831 	lsli      	r17, r8, 0
  if (negative) {
 8014e86:	e9a0018a 	bhsz      	r0, 0x801519a	// 801519a <_etoa+0x3a2>
    value = -value;
 8014e8a:	3380      	movi      	r3, 128
 8014e8c:	4378      	lsli      	r3, r3, 24
 8014e8e:	c467002a 	addu      	r10, r7, r3
  if (!(flags & FLAGS_PRECISION)) {
 8014e92:	e4692400 	andi      	r3, r9, 1024
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014e96:	c68a57c0 	zext      	r0, r10, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014e9a:	3b40      	cmpnei      	r3, 0
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014e9c:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8014ea0:	3306      	movi      	r3, 6
 8014ea2:	c4a30c20 	incf      	r5, r3, 0
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8014ea6:	dd4e200b 	st.w      	r10, (r14, 0x2c)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014eaa:	e3ffe2eb 	bsr      	0x8011480	// 8011480 <__floatsidf>
 8014eae:	015d      	lrw      	r2, 0x509f79fb	// 80151b4 <_etoa+0x3bc>
 8014eb0:	017d      	lrw      	r3, 0x3fd34413	// 80151b8 <_etoa+0x3c0>
 8014eb2:	e3ffe0c7 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014eb6:	015d      	lrw      	r2, 0x8b60c8b3	// 80151bc <_etoa+0x3c4>
 8014eb8:	017d      	lrw      	r3, 0x3fc68a28	// 80151c0 <_etoa+0x3c8>
 8014eba:	e3ffe08d 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014ebe:	daae200b 	ld.w      	r21, (r14, 0x2c)
 8014ec2:	c415566d 	zext      	r13, r21, 19, 0
 8014ec6:	c411482c 	lsli      	r12, r17, 0
 8014eca:	ea180000 	movi      	r24, 0
 8014ece:	ea393ff0 	movih      	r25, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014ed2:	6d83      	mov      	r6, r0
 8014ed4:	6d07      	mov      	r4, r1
 8014ed6:	3200      	movi      	r2, 0
 8014ed8:	c70c2420 	or      	r0, r12, r24
 8014edc:	c72d2421 	or      	r1, r13, r25
 8014ee0:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014ee4:	deae2011 	st.w      	r21, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014ee8:	df0e200f 	st.w      	r24, (r14, 0x3c)
 8014eec:	df2e2010 	st.w      	r25, (r14, 0x40)
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8014ef0:	de2e2012 	st.w      	r17, (r14, 0x48)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8014ef4:	e3ffe088 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014ef8:	024c      	lrw      	r2, 0x636f4361	// 80151c4 <_etoa+0x3cc>
 8014efa:	026b      	lrw      	r3, 0x3fd287a7	// 80151c8 <_etoa+0x3d0>
 8014efc:	e3ffe0a2 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014f00:	6c83      	mov      	r2, r0
 8014f02:	6cc7      	mov      	r3, r1
 8014f04:	6c1b      	mov      	r0, r6
 8014f06:	6c53      	mov      	r1, r4
 8014f08:	e3ffe066 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014f0c:	e3ffe2ee 	bsr      	0x80114e8	// 80114e8 <__fixdfsi>
 8014f10:	6d03      	mov      	r4, r0
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 8014f12:	e3ffe2b7 	bsr      	0x8011480	// 8011480 <__floatsidf>
 8014f16:	0251      	lrw      	r2, 0x979a371	// 80151cc <_etoa+0x3d4>
 8014f18:	0271      	lrw      	r3, 0x400a934f	// 80151d0 <_etoa+0x3d8>
 8014f1a:	6ec3      	mov      	r11, r0
 8014f1c:	6d87      	mov      	r6, r1
 8014f1e:	e3ffe091 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014f22:	3200      	movi      	r2, 0
 8014f24:	ea233fe0 	movih      	r3, 16352
 8014f28:	e3ffe056 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014f2c:	e3ffe2de 	bsr      	0x80114e8	// 80114e8 <__fixdfsi>
 8014f30:	b80b      	st.w      	r0, (r14, 0x2c)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8014f32:	0256      	lrw      	r2, 0xbbb55516	// 80151d4 <_etoa+0x3dc>
 8014f34:	0276      	lrw      	r3, 0x40026bb1	// 80151d8 <_etoa+0x3e0>
 8014f36:	6c2f      	mov      	r0, r11
 8014f38:	6c5b      	mov      	r1, r6
 8014f3a:	e3ffe083 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014f3e:	6ec3      	mov      	r11, r0
 8014f40:	980b      	ld.w      	r0, (r14, 0x2c)
 8014f42:	6d87      	mov      	r6, r1
 8014f44:	e3ffe29e 	bsr      	0x8011480	// 8011480 <__floatsidf>
 8014f48:	025a      	lrw      	r2, 0xfefa39ef	// 80151dc <_etoa+0x3e4>
 8014f4a:	0279      	lrw      	r3, 0x3fe62e42	// 80151e0 <_etoa+0x3e8>
 8014f4c:	e3ffe07a 	bsr      	0x8011040	// 8011040 <__muldf3>
 8014f50:	6c83      	mov      	r2, r0
 8014f52:	6cc7      	mov      	r3, r1
 8014f54:	6c2f      	mov      	r0, r11
 8014f56:	6c5b      	mov      	r1, r6
 8014f58:	e3ffe056 	bsr      	0x8011004	// 8011004 <__subdf3>
  const double z2 = z * z;
 8014f5c:	6c83      	mov      	r2, r0
 8014f5e:	6cc7      	mov      	r3, r1
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8014f60:	c4014830 	lsli      	r16, r1, 0
  const double z2 = z * z;
 8014f64:	b80c      	st.w      	r0, (r14, 0x30)
 8014f66:	e3ffe06d 	bsr      	0x8011040	// 8011040 <__muldf3>
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014f6a:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8014f6e:	c4144822 	lsli      	r2, r20, 0
  const double z2 = z * z;
 8014f72:	6ec3      	mov      	r11, r0
 8014f74:	6d87      	mov      	r6, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8014f76:	c4144820 	lsli      	r0, r20, 0
 8014f7a:	c4104823 	lsli      	r3, r16, 0
 8014f7e:	c4104821 	lsli      	r1, r16, 0
 8014f82:	de8e200e 	st.w      	r20, (r14, 0x38)
 8014f86:	e3ffe027 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014f8a:	b80d      	st.w      	r0, (r14, 0x34)
 8014f8c:	b82c      	st.w      	r1, (r14, 0x30)
 8014f8e:	3200      	movi      	r2, 0
 8014f90:	ea23402c 	movih      	r3, 16428
 8014f94:	6c2f      	mov      	r0, r11
 8014f96:	6c5b      	mov      	r1, r6
 8014f98:	e3ffe154 	bsr      	0x8011240	// 8011240 <__divdf3>
 8014f9c:	3200      	movi      	r2, 0
 8014f9e:	ea234024 	movih      	r3, 16420
 8014fa2:	e3ffe019 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014fa6:	6c83      	mov      	r2, r0
 8014fa8:	6cc7      	mov      	r3, r1
 8014faa:	6c2f      	mov      	r0, r11
 8014fac:	6c5b      	mov      	r1, r6
 8014fae:	e3ffe149 	bsr      	0x8011240	// 8011240 <__divdf3>
 8014fb2:	3200      	movi      	r2, 0
 8014fb4:	ea234018 	movih      	r3, 16408
 8014fb8:	e3ffe00e 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014fbc:	6c83      	mov      	r2, r0
 8014fbe:	6cc7      	mov      	r3, r1
 8014fc0:	6c2f      	mov      	r0, r11
 8014fc2:	6c5b      	mov      	r1, r6
 8014fc4:	e3ffe13e 	bsr      	0x8011240	// 8011240 <__divdf3>
 8014fc8:	6d87      	mov      	r6, r1
 8014fca:	da8e200e 	ld.w      	r20, (r14, 0x38)
 8014fce:	3180      	movi      	r1, 128
 8014fd0:	c4144822 	lsli      	r2, r20, 0
 8014fd4:	6ec3      	mov      	r11, r0
 8014fd6:	c4104823 	lsli      	r3, r16, 0
 8014fda:	3000      	movi      	r0, 0
 8014fdc:	4137      	lsli      	r1, r1, 23
 8014fde:	e3ffe013 	bsr      	0x8011004	// 8011004 <__subdf3>
 8014fe2:	6c83      	mov      	r2, r0
 8014fe4:	6cc7      	mov      	r3, r1
 8014fe6:	6c2f      	mov      	r0, r11
 8014fe8:	6c5b      	mov      	r1, r6
 8014fea:	e3ffdff5 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
 8014fee:	daee200d 	ld.w      	r23, (r14, 0x34)
 8014ff2:	dace200c 	ld.w      	r22, (r14, 0x30)
 8014ff6:	6c83      	mov      	r2, r0
 8014ff8:	6cc7      	mov      	r3, r1
 8014ffa:	c4174820 	lsli      	r0, r23, 0
 8014ffe:	c4164821 	lsli      	r1, r22, 0
 8015002:	e3ffe11f 	bsr      	0x8011240	// 8011240 <__divdf3>
 8015006:	db0e200f 	ld.w      	r24, (r14, 0x3c)
 801500a:	db2e2010 	ld.w      	r25, (r14, 0x40)
 801500e:	c4184822 	lsli      	r2, r24, 0
 8015012:	c4194823 	lsli      	r3, r25, 0
 8015016:	e3ffdfdf 	bsr      	0x8010fd4	// 8010fd4 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 801501a:	986b      	ld.w      	r3, (r14, 0x2c)
 801501c:	e46303fe 	addi      	r3, r3, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8015020:	3200      	movi      	r2, 0
 8015022:	4374      	lsli      	r3, r3, 20
 8015024:	e3ffe00e 	bsr      	0x8011040	// 8011040 <__muldf3>
  if (value < conv.F) {
 8015028:	da4e2012 	ld.w      	r18, (r14, 0x48)
 801502c:	daae2011 	ld.w      	r21, (r14, 0x44)
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8015030:	c4004830 	lsli      	r16, r0, 0
 8015034:	6ec7      	mov      	r11, r1
  if (value < conv.F) {
 8015036:	6c83      	mov      	r2, r0
 8015038:	6cc7      	mov      	r3, r1
 801503a:	c4124820 	lsli      	r0, r18, 0
 801503e:	c4154821 	lsli      	r1, r21, 0
 8015042:	e3ffe1e7 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8015046:	e9a0000e 	bhsz      	r0, 0x8015062	// 8015062 <_etoa+0x26a>
    conv.F /= 10;
 801504a:	c4104820 	lsli      	r0, r16, 0
 801504e:	6c6f      	mov      	r1, r11
 8015050:	3200      	movi      	r2, 0
 8015052:	ea234024 	movih      	r3, 16420
 8015056:	e3ffe0f5 	bsr      	0x8011240	// 8011240 <__divdf3>
    expval--;
 801505a:	2c00      	subi      	r4, 1
    conv.F /= 10;
 801505c:	c4004830 	lsli      	r16, r0, 0
 8015060:	6ec7      	mov      	r11, r1
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 8015062:	e4640062 	addi      	r3, r4, 99
 8015066:	eb0300c6 	cmphsi      	r3, 199
  if (flags & FLAGS_ADAPT_EXP) {
 801506a:	e4692800 	andi      	r3, r9, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801506e:	c4000506 	mvc      	r6
 8015072:	2603      	addi      	r6, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8015074:	e903001c 	bez      	r3, 0x80150ac	// 80150ac <_etoa+0x2b4>
    if ((value >= 1e-4) && (value < 1e6)) {
 8015078:	125b      	lrw      	r2, 0xeb1c432d	// 80151e4 <_etoa+0x3ec>
 801507a:	127c      	lrw      	r3, 0x3f1a36e2	// 80151e8 <_etoa+0x3f0>
 801507c:	c4114820 	lsli      	r0, r17, 0
 8015080:	6c6b      	mov      	r1, r10
 8015082:	e3ffe1a7 	bsr      	0x80113d0	// 80113d0 <__gedf2>
 8015086:	e980008e 	blz      	r0, 0x80151a2	// 80151a2 <_etoa+0x3aa>
 801508a:	3200      	movi      	r2, 0
 801508c:	1278      	lrw      	r3, 0x412e8480	// 80151ec <_etoa+0x3f4>
 801508e:	c4114820 	lsli      	r0, r17, 0
 8015092:	6c6b      	mov      	r1, r10
 8015094:	e3ffe1be 	bsr      	0x8011410	// 8011410 <__ltdf2>
 8015098:	e9a00085 	bhsz      	r0, 0x80151a2	// 80151a2 <_etoa+0x3aa>
      if ((int)prec > expval) {
 801509c:	6551      	cmplt      	r4, r5
 801509e:	0c80      	bf      	0x801519e	// 801519e <_etoa+0x3a6>
        prec = (unsigned)((int)prec - expval - 1);
 80150a0:	6152      	subu      	r5, r4
 80150a2:	2d00      	subi      	r5, 1
      minwidth = 0U;
 80150a4:	3600      	movi      	r6, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80150a6:	ed290400 	ori      	r9, r9, 1024
      expval   = 0;
 80150aa:	6d1b      	mov      	r4, r6
    fwidth -= minwidth;
 80150ac:	9849      	ld.w      	r2, (r14, 0x24)
 80150ae:	c4c20092 	subu      	r18, r2, r6
 80150b2:	6498      	cmphs      	r6, r2
  if ((flags & FLAGS_LEFT) && minwidth) {
 80150b4:	e4492002 	andi      	r2, r9, 2
    fwidth -= minwidth;
 80150b8:	3300      	movi      	r3, 0
 80150ba:	c6430c40 	inct      	r18, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 80150be:	b84b      	st.w      	r2, (r14, 0x2c)
 80150c0:	e9020005 	bez      	r2, 0x80150ca	// 80150ca <_etoa+0x2d2>
    fwidth = 0U;
 80150c4:	3e40      	cmpnei      	r6, 0
 80150c6:	c6430c40 	inct      	r18, r3, 0
  if (expval) {
 80150ca:	e9040011 	bez      	r4, 0x80150ec	// 80150ec <_etoa+0x2f4>
    value /= conv.F;
 80150ce:	c4114820 	lsli      	r0, r17, 0
 80150d2:	6c6b      	mov      	r1, r10
 80150d4:	c4104822 	lsli      	r2, r16, 0
 80150d8:	6cef      	mov      	r3, r11
 80150da:	de4e200c 	st.w      	r18, (r14, 0x30)
 80150de:	e3ffe0b1 	bsr      	0x8011240	// 8011240 <__divdf3>
 80150e2:	c4004831 	lsli      	r17, r0, 0
 80150e6:	6e87      	mov      	r10, r1
 80150e8:	da4e200c 	ld.w      	r18, (r14, 0x30)
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 80150ec:	3200      	movi      	r2, 0
 80150ee:	6ccb      	mov      	r3, r2
 80150f0:	6c23      	mov      	r0, r8
 80150f2:	6c5f      	mov      	r1, r7
 80150f4:	de4e200c 	st.w      	r18, (r14, 0x30)
 80150f8:	e3ffe18c 	bsr      	0x8011410	// 8011410 <__ltdf2>
 80150fc:	da4e200c 	ld.w      	r18, (r14, 0x30)
 8015100:	e9a00006 	bhsz      	r0, 0x801510c	// 801510c <_etoa+0x314>
 8015104:	3380      	movi      	r3, 128
 8015106:	4378      	lsli      	r3, r3, 24
 8015108:	60e8      	addu      	r3, r10
 801510a:	6e8f      	mov      	r10, r3
 801510c:	c5692823 	bclri      	r3, r9, 11
 8015110:	b864      	st.w      	r3, (r14, 0x10)
 8015112:	de4e2003 	st.w      	r18, (r14, 0xc)
 8015116:	b8a2      	st.w      	r5, (r14, 0x8)
 8015118:	de2e2000 	st.w      	r17, (r14, 0x0)
 801511c:	dd4e2001 	st.w      	r10, (r14, 0x4)
 8015120:	9868      	ld.w      	r3, (r14, 0x20)
 8015122:	984a      	ld.w      	r2, (r14, 0x28)
 8015124:	9827      	ld.w      	r1, (r14, 0x1c)
 8015126:	9806      	ld.w      	r0, (r14, 0x18)
 8015128:	e3fffc90 	bsr      	0x8014a48	// 8014a48 <_ftoa>
  if (!prec && minwidth) {
 801512c:	e925fea2 	bnez      	r5, 0x8014e70	// 8014e70 <_etoa+0x78>
 8015130:	e906fea0 	bez      	r6, 0x8014e70	// 8014e70 <_etoa+0x78>
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8015134:	e4692020 	andi      	r3, r9, 32
 8015138:	3b40      	cmpnei      	r3, 0
 801513a:	6c83      	mov      	r2, r0
 801513c:	58e2      	addi      	r7, r0, 1
 801513e:	ea0c0045 	movi      	r12, 69
 8015142:	3065      	movi      	r0, 101
 8015144:	c40c0c40 	inct      	r0, r12, 0
 8015148:	9868      	ld.w      	r3, (r14, 0x20)
 801514a:	9827      	ld.w      	r1, (r14, 0x1c)
 801514c:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8015150:	7bf1      	jsr      	r12
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8015152:	3305      	movi      	r3, 5
 8015154:	b865      	st.w      	r3, (r14, 0x14)
 8015156:	330a      	movi      	r3, 10
 8015158:	b862      	st.w      	r3, (r14, 0x8)
 801515a:	2e00      	subi      	r6, 1
 801515c:	4c7f      	lsri      	r3, r4, 31
 801515e:	c4040204 	abs      	r4, r4
 8015162:	b861      	st.w      	r3, (r14, 0x4)
 8015164:	b8c4      	st.w      	r6, (r14, 0x10)
 8015166:	9868      	ld.w      	r3, (r14, 0x20)
 8015168:	b8a3      	st.w      	r5, (r14, 0xc)
 801516a:	b880      	st.w      	r4, (r14, 0x0)
 801516c:	6c9f      	mov      	r2, r7
 801516e:	9827      	ld.w      	r1, (r14, 0x1c)
 8015170:	9806      	ld.w      	r0, (r14, 0x18)
 8015172:	e3fffba3 	bsr      	0x80148b8	// 80148b8 <_ntoa_long>
    if (flags & FLAGS_LEFT) {
 8015176:	986b      	ld.w      	r3, (r14, 0x2c)
 8015178:	e903fe7c 	bez      	r3, 0x8014e70	// 8014e70 <_etoa+0x78>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 801517c:	986a      	ld.w      	r3, (r14, 0x28)
 801517e:	586d      	subu      	r3, r0, r3
 8015180:	9849      	ld.w      	r2, (r14, 0x24)
 8015182:	648c      	cmphs      	r3, r2
 8015184:	0a76      	bt      	0x8014e70	// 8014e70 <_etoa+0x78>
 8015186:	5882      	addi      	r4, r0, 1
 8015188:	6c83      	mov      	r2, r0
 801518a:	9868      	ld.w      	r3, (r14, 0x20)
 801518c:	3020      	movi      	r0, 32
 801518e:	9827      	ld.w      	r1, (r14, 0x1c)
 8015190:	d98e2006 	ld.w      	r12, (r14, 0x18)
 8015194:	7bf1      	jsr      	r12
 8015196:	6c13      	mov      	r0, r4
 8015198:	07f2      	br      	0x801517c	// 801517c <_etoa+0x384>
  if (negative) {
 801519a:	6e9f      	mov      	r10, r7
 801519c:	067b      	br      	0x8014e92	// 8014e92 <_etoa+0x9a>
      if ((int)prec > expval) {
 801519e:	3500      	movi      	r5, 0
 80151a0:	0782      	br      	0x80150a4	// 80150a4 <_etoa+0x2ac>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 80151a2:	e905ff85 	bez      	r5, 0x80150ac	// 80150ac <_etoa+0x2b4>
        --prec;
 80151a6:	e4692400 	andi      	r3, r9, 1024
 80151aa:	3b40      	cmpnei      	r3, 0
 80151ac:	c4a50d01 	dect      	r5, r5, 1
 80151b0:	077e      	br      	0x80150ac	// 80150ac <_etoa+0x2b4>
 80151b2:	0000      	.short	0x0000
 80151b4:	509f79fb 	.long	0x509f79fb
 80151b8:	3fd34413 	.long	0x3fd34413
 80151bc:	8b60c8b3 	.long	0x8b60c8b3
 80151c0:	3fc68a28 	.long	0x3fc68a28
 80151c4:	636f4361 	.long	0x636f4361
 80151c8:	3fd287a7 	.long	0x3fd287a7
 80151cc:	0979a371 	.long	0x0979a371
 80151d0:	400a934f 	.long	0x400a934f
 80151d4:	bbb55516 	.long	0xbbb55516
 80151d8:	40026bb1 	.long	0x40026bb1
 80151dc:	fefa39ef 	.long	0xfefa39ef
 80151e0:	3fe62e42 	.long	0x3fe62e42
 80151e4:	eb1c432d 	.long	0xeb1c432d
 80151e8:	3f1a36e2 	.long	0x3f1a36e2
 80151ec:	412e8480 	.long	0x412e8480

080151f0 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 80151f0:	ebe00058 	push      	r4-r11, r15, r16-r17
 80151f4:	1435      	subi      	r14, r14, 84
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 80151f6:	3940      	cmpnei      	r1, 0
 80151f8:	00dc      	lrw      	r6, 0x80146dc	// 8015584 <_vsnprintf+0x394>
{
 80151fa:	6e07      	mov      	r8, r1
 80151fc:	6dcb      	mov      	r7, r2
 80151fe:	6d4f      	mov      	r5, r3
 8015200:	d9ae2020 	ld.w      	r13, (r14, 0x80)
    out = _out_null;
 8015204:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 8015208:	ea0b0000 	movi      	r11, 0
 801520c:	e54e002b 	addi      	r10, r14, 44
  while (*format)
 8015210:	8500      	ld.b      	r0, (r5, 0x0)
 8015212:	e920000e 	bnez      	r0, 0x801522e	// 801522e <_vsnprintf+0x3e>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8015216:	65ec      	cmphs      	r11, r7
 8015218:	e8400479 	bf      	0x8015b0a	// 8015b0a <_vsnprintf+0x91a>
 801521c:	5f43      	subi      	r2, r7, 1
 801521e:	6cdf      	mov      	r3, r7
 8015220:	6c63      	mov      	r1, r8
 8015222:	3000      	movi      	r0, 0
 8015224:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8015226:	6c2f      	mov      	r0, r11
 8015228:	1415      	addi      	r14, r14, 84
 801522a:	ebc00058 	pop      	r4-r11, r15, r16-r17
    if (*format != '%') {
 801522e:	eb400025 	cmpnei      	r0, 37
 8015232:	0c0e      	bf      	0x801524e	// 801524e <_vsnprintf+0x5e>
 8015234:	ddae2008 	st.w      	r13, (r14, 0x20)
        out(*format, buffer, idx++, maxlen);
 8015238:	6caf      	mov      	r2, r11
 801523a:	e48b0000 	addi      	r4, r11, 1
 801523e:	6cdf      	mov      	r3, r7
 8015240:	6c63      	mov      	r1, r8
 8015242:	7bd9      	jsr      	r6
        format++;
 8015244:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8015246:	6ed3      	mov      	r11, r4
 8015248:	d9ae2008 	ld.w      	r13, (r14, 0x20)
        break;
 801524c:	07e2      	br      	0x8015210	// 8015210 <_vsnprintf+0x20>
 801524e:	5d46      	addi      	r2, r5, 2
    flags = 0U;
 8015250:	3400      	movi      	r4, 0
 8015252:	5aa3      	subi      	r5, r2, 1
      switch (*format) {
 8015254:	8560      	ld.b      	r3, (r5, 0x0)
 8015256:	eb43002b 	cmpnei      	r3, 43
 801525a:	0c20      	bf      	0x801529a	// 801529a <_vsnprintf+0xaa>
 801525c:	eb03002b 	cmphsi      	r3, 44
 8015260:	0810      	bt      	0x8015280	// 8015280 <_vsnprintf+0x90>
 8015262:	eb430020 	cmpnei      	r3, 32
 8015266:	0c1d      	bf      	0x80152a0	// 80152a0 <_vsnprintf+0xb0>
 8015268:	eb430023 	cmpnei      	r3, 35
 801526c:	0c1d      	bf      	0x80152a6	// 80152a6 <_vsnprintf+0xb6>
  return (ch >= '0') && (ch <= '9');
 801526e:	e443102f 	subi      	r2, r3, 48
    if (_is_digit(*format)) {
 8015272:	7488      	zextb      	r2, r2
 8015274:	3a09      	cmphsi      	r2, 10
 8015276:	0888      	bt      	0x8015386	// 8015386 <_vsnprintf+0x196>
 8015278:	ea090000 	movi      	r9, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 801527c:	310a      	movi      	r1, 10
 801527e:	041c      	br      	0x80152b6	// 80152b6 <_vsnprintf+0xc6>
      switch (*format) {
 8015280:	eb43002d 	cmpnei      	r3, 45
 8015284:	0c08      	bf      	0x8015294	// 8015294 <_vsnprintf+0xa4>
 8015286:	eb430030 	cmpnei      	r3, 48
 801528a:	0bf2      	bt      	0x801526e	// 801526e <_vsnprintf+0x7e>
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 801528c:	ec840001 	ori      	r4, r4, 1
 8015290:	2200      	addi      	r2, 1
 8015292:	07e0      	br      	0x8015252	// 8015252 <_vsnprintf+0x62>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 8015294:	ec840002 	ori      	r4, r4, 2
 8015298:	07fc      	br      	0x8015290	// 8015290 <_vsnprintf+0xa0>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 801529a:	ec840004 	ori      	r4, r4, 4
 801529e:	07f9      	br      	0x8015290	// 8015290 <_vsnprintf+0xa0>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 80152a0:	ec840008 	ori      	r4, r4, 8
 80152a4:	07f6      	br      	0x8015290	// 8015290 <_vsnprintf+0xa0>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 80152a6:	ec840010 	ori      	r4, r4, 16
 80152aa:	07f3      	br      	0x8015290	// 8015290 <_vsnprintf+0xa0>
 80152ac:	f8298443 	mula.32.l      	r3, r9, r1
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80152b0:	2500      	addi      	r5, 1
 80152b2:	e523102f 	subi      	r9, r3, 48
  while (_is_digit(**str)) {
 80152b6:	8560      	ld.b      	r3, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80152b8:	e443102f 	subi      	r2, r3, 48
  while (_is_digit(**str)) {
 80152bc:	7488      	zextb      	r2, r2
 80152be:	3a09      	cmphsi      	r2, 10
 80152c0:	0ff6      	bf      	0x80152ac	// 80152ac <_vsnprintf+0xbc>
    if (*format == '.') {
 80152c2:	8560      	ld.b      	r3, (r5, 0x0)
 80152c4:	eb43002e 	cmpnei      	r3, 46
 80152c8:	0886      	bt      	0x80153d4	// 80153d4 <_vsnprintf+0x1e4>
      if (_is_digit(*format)) {
 80152ca:	8521      	ld.b      	r1, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 80152cc:	e461102f 	subi      	r3, r1, 48
      if (_is_digit(*format)) {
 80152d0:	74cc      	zextb      	r3, r3
 80152d2:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 80152d4:	ec840400 	ori      	r4, r4, 1024
      format++;
 80152d8:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 80152da:	0870      	bt      	0x80153ba	// 80153ba <_vsnprintf+0x1ca>
 80152dc:	ea110000 	movi      	r17, 0
 80152e0:	6d4b      	mov      	r5, r2
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80152e2:	310a      	movi      	r1, 10
  while (_is_digit(**str)) {
 80152e4:	8560      	ld.b      	r3, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80152e6:	e443102f 	subi      	r2, r3, 48
  while (_is_digit(**str)) {
 80152ea:	7488      	zextb      	r2, r2
 80152ec:	3a09      	cmphsi      	r2, 10
 80152ee:	0c60      	bf      	0x80153ae	// 80153ae <_vsnprintf+0x1be>
    switch (*format) {
 80152f0:	8560      	ld.b      	r3, (r5, 0x0)
 80152f2:	eb43006c 	cmpnei      	r3, 108
 80152f6:	0c7b      	bf      	0x80153ec	// 80153ec <_vsnprintf+0x1fc>
 80152f8:	eb03006c 	cmphsi      	r3, 109
 80152fc:	086f      	bt      	0x80153da	// 80153da <_vsnprintf+0x1ea>
 80152fe:	eb430068 	cmpnei      	r3, 104
 8015302:	0c7d      	bf      	0x80153fc	// 80153fc <_vsnprintf+0x20c>
 8015304:	eb43006a 	cmpnei      	r3, 106
 8015308:	0c85      	bf      	0x8015412	// 8015412 <_vsnprintf+0x222>
    switch (*format) {
 801530a:	8500      	ld.b      	r0, (r5, 0x0)
 801530c:	eb400064 	cmpnei      	r0, 100
 8015310:	0d50      	bf      	0x80155b0	// 80155b0 <_vsnprintf+0x3c0>
 8015312:	eb000064 	cmphsi      	r0, 101
 8015316:	0939      	bt      	0x8015588	// 8015588 <_vsnprintf+0x398>
 8015318:	eb40004d 	cmpnei      	r0, 77
 801531c:	e84002c6 	bf      	0x80158a8	// 80158a8 <_vsnprintf+0x6b8>
 8015320:	eb00004d 	cmphsi      	r0, 78
 8015324:	087a      	bt      	0x8015418	// 8015418 <_vsnprintf+0x228>
 8015326:	eb400045 	cmpnei      	r0, 69
 801532a:	0c0b      	bf      	0x8015340	// 8015340 <_vsnprintf+0x150>
 801532c:	eb000045 	cmphsi      	r0, 70
 8015330:	0f82      	bf      	0x8015234	// 8015234 <_vsnprintf+0x44>
 8015332:	eb400046 	cmpnei      	r0, 70
 8015336:	e8400248 	bf      	0x80157c6	// 80157c6 <_vsnprintf+0x5d6>
 801533a:	eb400047 	cmpnei      	r0, 71
 801533e:	0b7b      	bt      	0x8015234	// 8015234 <_vsnprintf+0x44>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8015340:	e46020df 	andi      	r3, r0, 223
 8015344:	eb430047 	cmpnei      	r3, 71
 8015348:	0805      	bt      	0x8015352	// 8015352 <_vsnprintf+0x162>
 801534a:	ec840800 	ori      	r4, r4, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 801534e:	e40020fd 	andi      	r0, r0, 253
 8015352:	eb400045 	cmpnei      	r0, 69
 8015356:	0803      	bt      	0x801535c	// 801535c <_vsnprintf+0x16c>
 8015358:	ec840020 	ori      	r4, r4, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801535c:	b884      	st.w      	r4, (r14, 0x10)
 801535e:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8015362:	de2e2002 	st.w      	r17, (r14, 0x8)
 8015366:	d86d2000 	ld.w      	r3, (r13, 0x0)
 801536a:	d88d2001 	ld.w      	r4, (r13, 0x4)
 801536e:	b860      	st.w      	r3, (r14, 0x0)
 8015370:	b881      	st.w      	r4, (r14, 0x4)
 8015372:	6caf      	mov      	r2, r11
 8015374:	6cdf      	mov      	r3, r7
 8015376:	6c63      	mov      	r1, r8
 8015378:	6c1b      	mov      	r0, r6
 801537a:	e60d0007 	addi      	r16, r13, 8
 801537e:	e3fffd3d 	bsr      	0x8014df8	// 8014df8 <_etoa>
 8015382:	e8000237 	br      	0x80157f0	// 80157f0 <_vsnprintf+0x600>
    else if (*format == '*') {
 8015386:	eb43002a 	cmpnei      	r3, 42
 801538a:	080f      	bt      	0x80153a8	// 80153a8 <_vsnprintf+0x1b8>
      const int w = va_arg(va, int);
 801538c:	d92d2000 	ld.w      	r9, (r13, 0x0)
 8015390:	e46d0003 	addi      	r3, r13, 4
      if (w < 0) {
 8015394:	e9a90007 	bhsz      	r9, 0x80153a2	// 80153a2 <_vsnprintf+0x1b2>
        width = (unsigned int)-w;
 8015398:	3200      	movi      	r2, 0
        flags |= FLAGS_LEFT;    // reverse padding
 801539a:	ec840002 	ori      	r4, r4, 2
        width = (unsigned int)-w;
 801539e:	c5220089 	subu      	r9, r2, r9
      format++;
 80153a2:	2500      	addi      	r5, 1
      const int w = va_arg(va, int);
 80153a4:	6f4f      	mov      	r13, r3
 80153a6:	078e      	br      	0x80152c2	// 80152c2 <_vsnprintf+0xd2>
    width = 0U;
 80153a8:	ea090000 	movi      	r9, 0
 80153ac:	078b      	br      	0x80152c2	// 80152c2 <_vsnprintf+0xd2>
 80153ae:	f8318443 	mula.32.l      	r3, r17, r1
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80153b2:	2500      	addi      	r5, 1
 80153b4:	e623102f 	subi      	r17, r3, 48
 80153b8:	0796      	br      	0x80152e4	// 80152e4 <_vsnprintf+0xf4>
      else if (*format == '*') {
 80153ba:	eb41002a 	cmpnei      	r1, 42
 80153be:	080a      	bt      	0x80153d2	// 80153d2 <_vsnprintf+0x1e2>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 80153c0:	da4d2000 	ld.w      	r18, (r13, 0x0)
 80153c4:	3300      	movi      	r3, 0
 80153c6:	f872ccb1 	max.s32      	r17, r18, r3
        format++;
 80153ca:	2501      	addi      	r5, 2
        const int prec = (int)va_arg(va, int);
 80153cc:	e5ad0003 	addi      	r13, r13, 4
 80153d0:	0790      	br      	0x80152f0	// 80152f0 <_vsnprintf+0x100>
      format++;
 80153d2:	6d4b      	mov      	r5, r2
    precision = 0U;
 80153d4:	ea110000 	movi      	r17, 0
 80153d8:	078c      	br      	0x80152f0	// 80152f0 <_vsnprintf+0x100>
    switch (*format) {
 80153da:	eb430074 	cmpnei      	r3, 116
 80153de:	0c04      	bf      	0x80153e6	// 80153e6 <_vsnprintf+0x1f6>
 80153e0:	eb43007a 	cmpnei      	r3, 122
 80153e4:	0b93      	bt      	0x801530a	// 801530a <_vsnprintf+0x11a>
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80153e6:	ec840100 	ori      	r4, r4, 256
 80153ea:	040f      	br      	0x8015408	// 8015408 <_vsnprintf+0x218>
        if (*format == 'l') {
 80153ec:	8561      	ld.b      	r3, (r5, 0x1)
 80153ee:	eb43006c 	cmpnei      	r3, 108
 80153f2:	0bfa      	bt      	0x80153e6	// 80153e6 <_vsnprintf+0x1f6>
          flags |= FLAGS_LONG_LONG;
 80153f4:	ec840300 	ori      	r4, r4, 768
          format++;
 80153f8:	2501      	addi      	r5, 2
 80153fa:	0788      	br      	0x801530a	// 801530a <_vsnprintf+0x11a>
        if (*format == 'h') {
 80153fc:	8561      	ld.b      	r3, (r5, 0x1)
 80153fe:	eb430068 	cmpnei      	r3, 104
 8015402:	0c05      	bf      	0x801540c	// 801540c <_vsnprintf+0x21c>
        flags |= FLAGS_SHORT;
 8015404:	ec840080 	ori      	r4, r4, 128
        format++;
 8015408:	2500      	addi      	r5, 1
        break;
 801540a:	0780      	br      	0x801530a	// 801530a <_vsnprintf+0x11a>
          flags |= FLAGS_CHAR;
 801540c:	ec8400c0 	ori      	r4, r4, 192
 8015410:	07f4      	br      	0x80153f8	// 80153f8 <_vsnprintf+0x208>
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8015412:	ec840200 	ori      	r4, r4, 512
 8015416:	07f9      	br      	0x8015408	// 8015408 <_vsnprintf+0x218>
    switch (*format) {
 8015418:	eb400058 	cmpnei      	r0, 88
 801541c:	0805      	bt      	0x8015426	// 8015426 <_vsnprintf+0x236>
          flags |= FLAGS_UPPERCASE;
 801541e:	ec840020 	ori      	r4, r4, 32
          base = 16U;
 8015422:	3210      	movi      	r2, 16
 8015424:	047a      	br      	0x8015518	// 8015518 <_vsnprintf+0x328>
    switch (*format) {
 8015426:	eb000058 	cmphsi      	r0, 89
 801542a:	0873      	bt      	0x8015510	// 8015510 <_vsnprintf+0x320>
 801542c:	eb400056 	cmpnei      	r0, 86
 8015430:	0b02      	bt      	0x8015234	// 8015234 <_vsnprintf+0x44>
        char *ipv6 = va_arg(va, char*);
 8015432:	e46d0003 	addi      	r3, r13, 4
 8015436:	d80d2000 	ld.w      	r0, (r13, 0x0)
 801543a:	b869      	st.w      	r3, (r14, 0x24)
 801543c:	e6c0000f 	addi      	r22, r0, 16
 8015440:	3300      	movi      	r3, 0
                m = (*inuint >> (8 * i)) & 0xff;
 8015442:	daa02000 	ld.w      	r21, (r0, 0x0)
 8015446:	ea0d0000 	movi      	r13, 0
 801544a:	ea130004 	movi      	r19, 4
 801544e:	c46d4821 	lsli      	r1, r13, 3
 8015452:	c4354041 	lsr      	r1, r21, r1
 8015456:	7444      	zextb      	r1, r1
                h = m >> 4;
 8015458:	4944      	lsri      	r2, r1, 4
                if (h > 9)
 801545a:	3a09      	cmphsi      	r2, 10
 801545c:	e6e30000 	addi      	r23, r3, 1
 8015460:	c40d54f4 	zext      	r20, r13, 7, 0
                l = m & 0xf;
 8015464:	e421200f 	andi      	r1, r1, 15
                    outtxt[j++] = 'A' + h - 10;
 8015468:	c41754f7 	zext      	r23, r23, 7, 0
                if (h > 9)
 801546c:	e8400329 	bf      	0x8015abe	// 8015abe <_vsnprintf+0x8ce>
                    outtxt[j++] = 'A' + h - 10;
 8015470:	2236      	addi      	r2, 55
                if (l > 9)
 8015472:	3909      	cmphsi      	r1, 10
                    outtxt[j++]= '0' + h;
 8015474:	d46a0022 	str.b      	r2, (r10, r3 << 0)
 8015478:	e4770000 	addi      	r3, r23, 1
                    outtxt[j++] = 'A' + l - 10;
 801547c:	74cc      	zextb      	r3, r3
                if (l > 9)
 801547e:	e8400323 	bf      	0x8015ac4	// 8015ac4 <_vsnprintf+0x8d4>
                    outtxt[j++] = 'A' + l - 10;
 8015482:	2136      	addi      	r1, 55
                if (0 != (i % 2))
 8015484:	e6942001 	andi      	r20, r20, 1
                    outtxt[j++] = '0' + l;
 8015488:	d6ea0021 	str.b      	r1, (r10, r23 << 0)
                if (0 != (i % 2))
 801548c:	e9140007 	bez      	r20, 0x801549a	// 801549a <_vsnprintf+0x2aa>
                    outtxt[j++] = ':';
 8015490:	5b42      	addi      	r2, r3, 1
 8015492:	313a      	movi      	r1, 58
 8015494:	d46a0021 	str.b      	r1, (r10, r3 << 0)
 8015498:	74c8      	zextb      	r3, r2
 801549a:	e5ad0000 	addi      	r13, r13, 1
            for(i = 0; i < 4; i++)
 801549e:	e833ffd8 	bnezad      	r19, 0x801544e	// 801544e <_vsnprintf+0x25e>
            inuint++;
 80154a2:	2003      	addi      	r0, 4
        for (k = 0; k < 4; k++)
 80154a4:	c4160480 	cmpne      	r22, r0
 80154a8:	0bcd      	bt      	0x8015442	// 8015442 <_vsnprintf+0x252>
    outtxt[j - 1] = 0;
 80154aa:	e44e002a 	addi      	r2, r14, 43
 80154ae:	3100      	movi      	r1, 0
 80154b0:	d4620021 	str.b      	r1, (r2, r3 << 0)
        if (flags & FLAGS_PRECISION) {
 80154b4:	e6042400 	andi      	r16, r4, 1024
    return j - 1;
 80154b8:	2b00      	subi      	r3, 1
          l = (l < precision ? l : precision);
 80154ba:	fa23cd22 	min.u32      	r2, r3, r17
 80154be:	eb500000 	cmpnei      	r16, 0
 80154c2:	c4620c40 	inct      	r3, r2, 0
        if (!(flags & FLAGS_LEFT)) {
 80154c6:	e4442002 	andi      	r2, r4, 2
 80154ca:	b848      	st.w      	r2, (r14, 0x20)
 80154cc:	e9220306 	bnez      	r2, 0x8015ad8	// 8015ad8 <_vsnprintf+0x8e8>
 80154d0:	62ce      	subu      	r11, r3
          while (l++ < width) {
 80154d2:	664c      	cmphs      	r3, r9
 80154d4:	c46b0022 	addu      	r2, r11, r3
 80154d8:	5b82      	addi      	r4, r3, 1
 80154da:	e84002f8 	bf      	0x8015aca	// 8015aca <_vsnprintf+0x8da>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80154de:	c44a008b 	subu      	r11, r10, r2
 80154e2:	d04b0020 	ldr.b      	r0, (r11, r2 << 0)
 80154e6:	e92002fd 	bnez      	r0, 0x8015ae0	// 8015ae0 <_vsnprintf+0x8f0>
        if (flags & FLAGS_LEFT) {
 80154ea:	9868      	ld.w      	r3, (r14, 0x20)
 80154ec:	6ecb      	mov      	r11, r2
 80154ee:	e90300e2 	bez      	r3, 0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
 80154f2:	610a      	subu      	r4, r2
          while (l++ < width) {
 80154f4:	c48b0023 	addu      	r3, r11, r4
 80154f8:	664c      	cmphs      	r3, r9
 80154fa:	08dc      	bt      	0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
            out(' ', buffer, idx++, maxlen);
 80154fc:	6caf      	mov      	r2, r11
 80154fe:	e60b0000 	addi      	r16, r11, 1
 8015502:	6cdf      	mov      	r3, r7
 8015504:	6c63      	mov      	r1, r8
 8015506:	3020      	movi      	r0, 32
 8015508:	7bd9      	jsr      	r6
 801550a:	c410482b 	lsli      	r11, r16, 0
 801550e:	07f3      	br      	0x80154f4	// 80154f4 <_vsnprintf+0x304>
    switch (*format) {
 8015510:	eb400062 	cmpnei      	r0, 98
 8015514:	0805      	bt      	0x801551e	// 801551e <_vsnprintf+0x32e>
          base =  2U;
 8015516:	3202      	movi      	r2, 2
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8015518:	3c82      	bclri      	r4, 2
 801551a:	3c83      	bclri      	r4, 3
 801551c:	0452      	br      	0x80155c0	// 80155c0 <_vsnprintf+0x3d0>
    switch (*format) {
 801551e:	eb400063 	cmpnei      	r0, 99
 8015522:	0a89      	bt      	0x8015234	// 8015234 <_vsnprintf+0x44>
        if (!(flags & FLAGS_LEFT)) {
 8015524:	e6242002 	andi      	r17, r4, 2
 8015528:	e9310174 	bnez      	r17, 0x8015810	// 8015810 <_vsnprintf+0x620>
 801552c:	c4114830 	lsli      	r16, r17, 0
 8015530:	c60b0024 	addu      	r4, r11, r16
 8015534:	e5900001 	addi      	r12, r16, 2
 8015538:	e6100000 	addi      	r16, r16, 1
          while (l++ < width) {
 801553c:	c5300420 	cmphs      	r16, r9
 8015540:	0d5e      	bf      	0x80157fc	// 80157fc <_vsnprintf+0x60c>
 8015542:	dd8e2008 	st.w      	r12, (r14, 0x20)
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8015546:	6cdf      	mov      	r3, r7
 8015548:	6c93      	mov      	r2, r4
 801554a:	6c63      	mov      	r1, r8
 801554c:	d80d0000 	ld.b      	r0, (r13, 0x0)
 8015550:	e60d0003 	addi      	r16, r13, 4
 8015554:	e5640000 	addi      	r11, r4, 1
 8015558:	7bd9      	jsr      	r6
        if (flags & FLAGS_LEFT) {
 801555a:	e911014c 	bez      	r17, 0x80157f2	// 80157f2 <_vsnprintf+0x602>
 801555e:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8015562:	e62c1000 	subi      	r17, r12, 1
 8015566:	c4910091 	subu      	r17, r17, r4
          while (l++ < width) {
 801556a:	c62b0023 	addu      	r3, r11, r17
 801556e:	664c      	cmphs      	r3, r9
 8015570:	0941      	bt      	0x80157f2	// 80157f2 <_vsnprintf+0x602>
            out(' ', buffer, idx++, maxlen);
 8015572:	6caf      	mov      	r2, r11
 8015574:	e48b0000 	addi      	r4, r11, 1
 8015578:	6cdf      	mov      	r3, r7
 801557a:	6c63      	mov      	r1, r8
 801557c:	3020      	movi      	r0, 32
 801557e:	7bd9      	jsr      	r6
 8015580:	6ed3      	mov      	r11, r4
 8015582:	07f4      	br      	0x801556a	// 801556a <_vsnprintf+0x37a>
 8015584:	080146dc 	.long	0x080146dc
    switch (*format) {
 8015588:	eb40006f 	cmpnei      	r0, 111
 801558c:	0803      	bt      	0x8015592	// 8015592 <_vsnprintf+0x3a2>
          base =  8U;
 801558e:	3208      	movi      	r2, 8
 8015590:	07c4      	br      	0x8015518	// 8015518 <_vsnprintf+0x328>
    switch (*format) {
 8015592:	eb00006f 	cmphsi      	r0, 112
 8015596:	084a      	bt      	0x801562a	// 801562a <_vsnprintf+0x43a>
 8015598:	eb400066 	cmpnei      	r0, 102
 801559c:	0d17      	bf      	0x80157ca	// 80157ca <_vsnprintf+0x5da>
 801559e:	eb000065 	cmphsi      	r0, 102
 80155a2:	0ecf      	bf      	0x8015340	// 8015340 <_vsnprintf+0x150>
 80155a4:	eb400067 	cmpnei      	r0, 103
 80155a8:	0ecc      	bf      	0x8015340	// 8015340 <_vsnprintf+0x150>
 80155aa:	eb400069 	cmpnei      	r0, 105
 80155ae:	0a43      	bt      	0x8015234	// 8015234 <_vsnprintf+0x44>
        if ((*format != 'i') && (*format != 'd')) {
 80155b0:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 80155b4:	3c84      	bclri      	r4, 4
          base = 10U;
 80155b6:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 80155b8:	0c04      	bf      	0x80155c0	// 80155c0 <_vsnprintf+0x3d0>
 80155ba:	eb400064 	cmpnei      	r0, 100
 80155be:	0bad      	bt      	0x8015518	// 8015518 <_vsnprintf+0x328>
        if (flags & FLAGS_PRECISION) {
 80155c0:	e4642400 	andi      	r3, r4, 1024
 80155c4:	e9030003 	bez      	r3, 0x80155ca	// 80155ca <_vsnprintf+0x3da>
          flags &= ~FLAGS_ZEROPAD;
 80155c8:	3c80      	bclri      	r4, 0
        if ((*format == 'i') || (*format == 'd')) {
 80155ca:	eb400069 	cmpnei      	r0, 105
 80155ce:	e4642200 	andi      	r3, r4, 512
 80155d2:	0c04      	bf      	0x80155da	// 80155da <_vsnprintf+0x3ea>
 80155d4:	eb400064 	cmpnei      	r0, 100
 80155d8:	08b9      	bt      	0x801574a	// 801574a <_vsnprintf+0x55a>
          if (flags & FLAGS_LONG_LONG) {
 80155da:	e9030079 	bez      	r3, 0x80156cc	// 80156cc <_vsnprintf+0x4dc>
            const long long value = va_arg(va, long long);
 80155de:	d82d2001 	ld.w      	r1, (r13, 0x4)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80155e2:	3300      	movi      	r3, 0
            const long long value = va_arg(va, long long);
 80155e4:	d80d2000 	ld.w      	r0, (r13, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80155e8:	b864      	st.w      	r3, (r14, 0x10)
 80155ea:	497f      	lsri      	r3, r1, 31
 80155ec:	b843      	st.w      	r2, (r14, 0xc)
 80155ee:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 80155f0:	e60d0007 	addi      	r16, r13, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80155f4:	b887      	st.w      	r4, (r14, 0x1c)
 80155f6:	dd2e2006 	st.w      	r9, (r14, 0x18)
 80155fa:	de2e2005 	st.w      	r17, (r14, 0x14)
 80155fe:	6c83      	mov      	r2, r0
 8015600:	6cc7      	mov      	r3, r1
 8015602:	e9a10006 	bhsz      	r1, 0x801560e	// 801560e <_vsnprintf+0x41e>
 8015606:	3000      	movi      	r0, 0
 8015608:	3100      	movi      	r1, 0
 801560a:	f840c462 	sub.64      	r2, r0, r2
 801560e:	b840      	st.w      	r2, (r14, 0x0)
 8015610:	b861      	st.w      	r3, (r14, 0x4)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 8015612:	6cdf      	mov      	r3, r7
 8015614:	6caf      	mov      	r2, r11
 8015616:	6c63      	mov      	r1, r8
 8015618:	6c1b      	mov      	r0, r6
 801561a:	e3fff9a9 	bsr      	0x801496c	// 801496c <_ntoa_long_long>
 801561e:	6ec3      	mov      	r11, r0
 8015620:	c410482d 	lsli      	r13, r16, 0
        format++;
 8015624:	2500      	addi      	r5, 1
        break;
 8015626:	e800fdf5 	br      	0x8015210	// 8015210 <_vsnprintf+0x20>
    switch (*format) {
 801562a:	eb400075 	cmpnei      	r0, 117
 801562e:	0fc1      	bf      	0x80155b0	// 80155b0 <_vsnprintf+0x3c0>
 8015630:	eb000075 	cmphsi      	r0, 118
 8015634:	0844      	bt      	0x80156bc	// 80156bc <_vsnprintf+0x4cc>
 8015636:	eb400070 	cmpnei      	r0, 112
 801563a:	0d1c      	bf      	0x8015872	// 8015872 <_vsnprintf+0x682>
 801563c:	eb400073 	cmpnei      	r0, 115
 8015640:	e860fdfa 	bt      	0x8015234	// 8015234 <_vsnprintf+0x44>
        const char* p = va_arg(va, char*);
 8015644:	e46d0003 	addi      	r3, r13, 4
 8015648:	b869      	st.w      	r3, (r14, 0x24)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 801564a:	3300      	movi      	r3, 0
 801564c:	2b00      	subi      	r3, 1
 801564e:	eb510000 	cmpnei      	r17, 0
        const char* p = va_arg(va, char*);
 8015652:	d9ad2000 	ld.w      	r13, (r13, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8015656:	c4710c40 	inct      	r3, r17, 0
 801565a:	c46d0022 	addu      	r2, r13, r3
 801565e:	6cf7      	mov      	r3, r13
  for (s = str; *s && maxsize--; ++s);
 8015660:	8320      	ld.b      	r1, (r3, 0x0)
 8015662:	e92100db 	bnez      	r1, 0x8015818	// 8015818 <_vsnprintf+0x628>
  return (unsigned int)(s - str);
 8015666:	60f6      	subu      	r3, r13
        if (flags & FLAGS_PRECISION) {
 8015668:	e6042400 	andi      	r16, r4, 1024
          l = (l < precision ? l : precision);
 801566c:	fa23cd22 	min.u32      	r2, r3, r17
 8015670:	eb500000 	cmpnei      	r16, 0
 8015674:	c4620c40 	inct      	r3, r2, 0
        if (!(flags & FLAGS_LEFT)) {
 8015678:	e4442002 	andi      	r2, r4, 2
 801567c:	b848      	st.w      	r2, (r14, 0x20)
 801567e:	e92200db 	bnez      	r2, 0x8015834	// 8015834 <_vsnprintf+0x644>
 8015682:	62ce      	subu      	r11, r3
          while (l++ < width) {
 8015684:	664c      	cmphs      	r3, r9
 8015686:	c46b0022 	addu      	r2, r11, r3
 801568a:	5b82      	addi      	r4, r3, 1
 801568c:	0cca      	bf      	0x8015820	// 8015820 <_vsnprintf+0x630>
 801568e:	6ef7      	mov      	r11, r13
 8015690:	c5a20093 	subu      	r19, r2, r13
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015694:	d80b0000 	ld.b      	r0, (r11, 0x0)
 8015698:	c66b0022 	addu      	r2, r11, r19
 801569c:	e92000cf 	bnez      	r0, 0x801583a	// 801583a <_vsnprintf+0x64a>
        if (flags & FLAGS_LEFT) {
 80156a0:	9868      	ld.w      	r3, (r14, 0x20)
 80156a2:	6ecb      	mov      	r11, r2
 80156a4:	e9030007 	bez      	r3, 0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
 80156a8:	610a      	subu      	r4, r2
          while (l++ < width) {
 80156aa:	c48b0023 	addu      	r3, r11, r4
 80156ae:	664c      	cmphs      	r3, r9
 80156b0:	0cd7      	bf      	0x801585e	// 801585e <_vsnprintf+0x66e>
        format++;
 80156b2:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 80156b4:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 80156b8:	e800fdac 	br      	0x8015210	// 8015210 <_vsnprintf+0x20>
    switch (*format) {
 80156bc:	eb400076 	cmpnei      	r0, 118
 80156c0:	0d66      	bf      	0x801598c	// 801598c <_vsnprintf+0x79c>
 80156c2:	eb400078 	cmpnei      	r0, 120
 80156c6:	0eae      	bf      	0x8015422	// 8015422 <_vsnprintf+0x232>
 80156c8:	e800fdb6 	br      	0x8015234	// 8015234 <_vsnprintf+0x44>
          else if (flags & FLAGS_LONG) {
 80156cc:	e4642100 	andi      	r3, r4, 256
 80156d0:	e60d0003 	addi      	r16, r13, 4
 80156d4:	e9030016 	bez      	r3, 0x8015700	// 8015700 <_vsnprintf+0x510>
            const long value = va_arg(va, long);
 80156d8:	d86d2000 	ld.w      	r3, (r13, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80156dc:	b842      	st.w      	r2, (r14, 0x8)
 80156de:	4b5f      	lsri      	r2, r3, 31
 80156e0:	b885      	st.w      	r4, (r14, 0x14)
 80156e2:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80156e6:	de2e2003 	st.w      	r17, (r14, 0xc)
 80156ea:	b841      	st.w      	r2, (r14, 0x4)
 80156ec:	c4030203 	abs      	r3, r3
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 80156f0:	b860      	st.w      	r3, (r14, 0x0)
 80156f2:	6caf      	mov      	r2, r11
 80156f4:	6cdf      	mov      	r3, r7
 80156f6:	6c63      	mov      	r1, r8
 80156f8:	6c1b      	mov      	r0, r6
 80156fa:	e3fff8df 	bsr      	0x80148b8	// 80148b8 <_ntoa_long>
 80156fe:	0790      	br      	0x801561e	// 801561e <_vsnprintf+0x42e>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8015700:	e4242040 	andi      	r1, r4, 64
 8015704:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8015708:	e901001b 	bez      	r1, 0x801573e	// 801573e <_vsnprintf+0x54e>
 801570c:	e46320ff 	andi      	r3, r3, 255
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8015710:	b842      	st.w      	r2, (r14, 0x8)
 8015712:	4b5f      	lsri      	r2, r3, 31
 8015714:	de0e2008 	st.w      	r16, (r14, 0x20)
 8015718:	b885      	st.w      	r4, (r14, 0x14)
 801571a:	dd2e2004 	st.w      	r9, (r14, 0x10)
 801571e:	de2e2003 	st.w      	r17, (r14, 0xc)
 8015722:	b841      	st.w      	r2, (r14, 0x4)
 8015724:	c4030203 	abs      	r3, r3
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 8015728:	b860      	st.w      	r3, (r14, 0x0)
 801572a:	6caf      	mov      	r2, r11
 801572c:	6cdf      	mov      	r3, r7
 801572e:	6c63      	mov      	r1, r8
 8015730:	6c1b      	mov      	r0, r6
 8015732:	e3fff8c3 	bsr      	0x80148b8	// 80148b8 <_ntoa_long>
 8015736:	6ec3      	mov      	r11, r0
 8015738:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801573c:	0774      	br      	0x8015624	// 8015624 <_vsnprintf+0x434>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801573e:	e4242080 	andi      	r1, r4, 128
 8015742:	e901ffe7 	bez      	r1, 0x8015710	// 8015710 <_vsnprintf+0x520>
 8015746:	74cf      	sexth      	r3, r3
 8015748:	07e4      	br      	0x8015710	// 8015710 <_vsnprintf+0x520>
          if (flags & FLAGS_LONG_LONG) {
 801574a:	e9030014 	bez      	r3, 0x8015772	// 8015772 <_vsnprintf+0x582>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 801574e:	3300      	movi      	r3, 0
 8015750:	b887      	st.w      	r4, (r14, 0x1c)
 8015752:	dd2e2006 	st.w      	r9, (r14, 0x18)
 8015756:	de2e2005 	st.w      	r17, (r14, 0x14)
 801575a:	b843      	st.w      	r2, (r14, 0xc)
 801575c:	b864      	st.w      	r3, (r14, 0x10)
 801575e:	b862      	st.w      	r3, (r14, 0x8)
 8015760:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8015764:	d88d2001 	ld.w      	r4, (r13, 0x4)
 8015768:	e60d0007 	addi      	r16, r13, 8
 801576c:	b860      	st.w      	r3, (r14, 0x0)
 801576e:	b881      	st.w      	r4, (r14, 0x4)
 8015770:	0751      	br      	0x8015612	// 8015612 <_vsnprintf+0x422>
          else if (flags & FLAGS_LONG) {
 8015772:	e4242100 	andi      	r1, r4, 256
 8015776:	e60d0003 	addi      	r16, r13, 4
 801577a:	e901000c 	bez      	r1, 0x8015792	// 8015792 <_vsnprintf+0x5a2>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 801577e:	b885      	st.w      	r4, (r14, 0x14)
 8015780:	dd2e2004 	st.w      	r9, (r14, 0x10)
 8015784:	de2e2003 	st.w      	r17, (r14, 0xc)
 8015788:	b842      	st.w      	r2, (r14, 0x8)
 801578a:	b861      	st.w      	r3, (r14, 0x4)
 801578c:	d86d2000 	ld.w      	r3, (r13, 0x0)
 8015790:	07b0      	br      	0x80156f0	// 80156f0 <_vsnprintf+0x500>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8015792:	e4242040 	andi      	r1, r4, 64
 8015796:	d86d2000 	ld.w      	r3, (r13, 0x0)
 801579a:	e901000f 	bez      	r1, 0x80157b8	// 80157b8 <_vsnprintf+0x5c8>
 801579e:	e46320ff 	andi      	r3, r3, 255
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 80157a2:	b842      	st.w      	r2, (r14, 0x8)
 80157a4:	3200      	movi      	r2, 0
 80157a6:	de0e2008 	st.w      	r16, (r14, 0x20)
 80157aa:	b885      	st.w      	r4, (r14, 0x14)
 80157ac:	dd2e2004 	st.w      	r9, (r14, 0x10)
 80157b0:	de2e2003 	st.w      	r17, (r14, 0xc)
 80157b4:	b841      	st.w      	r2, (r14, 0x4)
 80157b6:	07b9      	br      	0x8015728	// 8015728 <_vsnprintf+0x538>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80157b8:	e4242080 	andi      	r1, r4, 128
 80157bc:	e901fff3 	bez      	r1, 0x80157a2	// 80157a2 <_vsnprintf+0x5b2>
 80157c0:	c40355e3 	zext      	r3, r3, 15, 0
 80157c4:	07ef      	br      	0x80157a2	// 80157a2 <_vsnprintf+0x5b2>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80157c6:	ec840020 	ori      	r4, r4, 32
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80157ca:	b884      	st.w      	r4, (r14, 0x10)
 80157cc:	dd2e2003 	st.w      	r9, (r14, 0xc)
 80157d0:	de2e2002 	st.w      	r17, (r14, 0x8)
 80157d4:	d86d2000 	ld.w      	r3, (r13, 0x0)
 80157d8:	d88d2001 	ld.w      	r4, (r13, 0x4)
 80157dc:	b860      	st.w      	r3, (r14, 0x0)
 80157de:	b881      	st.w      	r4, (r14, 0x4)
 80157e0:	6caf      	mov      	r2, r11
 80157e2:	6cdf      	mov      	r3, r7
 80157e4:	6c63      	mov      	r1, r8
 80157e6:	6c1b      	mov      	r0, r6
 80157e8:	e60d0007 	addi      	r16, r13, 8
 80157ec:	e3fff92e 	bsr      	0x8014a48	// 8014a48 <_ftoa>
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80157f0:	6ec3      	mov      	r11, r0
        format++;
 80157f2:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 80157f4:	c410482d 	lsli      	r13, r16, 0
        break;
 80157f8:	e800fd0c 	br      	0x8015210	// 8015210 <_vsnprintf+0x20>
 80157fc:	ddae2008 	st.w      	r13, (r14, 0x20)
            out(' ', buffer, idx++, maxlen);
 8015800:	6cdf      	mov      	r3, r7
 8015802:	6c93      	mov      	r2, r4
 8015804:	6c63      	mov      	r1, r8
 8015806:	3020      	movi      	r0, 32
 8015808:	7bd9      	jsr      	r6
 801580a:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801580e:	0691      	br      	0x8015530	// 8015530 <_vsnprintf+0x340>
 8015810:	6d2f      	mov      	r4, r11
        unsigned int l = 1U;
 8015812:	ea0c0001 	movi      	r12, 1
 8015816:	0696      	br      	0x8015542	// 8015542 <_vsnprintf+0x352>
  for (s = str; *s && maxsize--; ++s);
 8015818:	648e      	cmpne      	r3, r2
 801581a:	0f26      	bf      	0x8015666	// 8015666 <_vsnprintf+0x476>
 801581c:	2300      	addi      	r3, 1
 801581e:	0721      	br      	0x8015660	// 8015660 <_vsnprintf+0x470>
 8015820:	ddae200a 	st.w      	r13, (r14, 0x28)
            out(' ', buffer, idx++, maxlen);
 8015824:	6cdf      	mov      	r3, r7
 8015826:	6c63      	mov      	r1, r8
 8015828:	3020      	movi      	r0, 32
 801582a:	7bd9      	jsr      	r6
          while (l++ < width) {
 801582c:	6cd3      	mov      	r3, r4
 801582e:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 8015832:	0729      	br      	0x8015684	// 8015684 <_vsnprintf+0x494>
 8015834:	6d0f      	mov      	r4, r3
 8015836:	6caf      	mov      	r2, r11
 8015838:	072b      	br      	0x801568e	// 801568e <_vsnprintf+0x49e>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 801583a:	e9100008 	bez      	r16, 0x801584a	// 801584a <_vsnprintf+0x65a>
 801583e:	e4711000 	subi      	r3, r17, 1
 8015842:	e911ff2f 	bez      	r17, 0x80156a0	// 80156a0 <_vsnprintf+0x4b0>
 8015846:	c4034831 	lsli      	r17, r3, 0
 801584a:	de6e200a 	st.w      	r19, (r14, 0x28)
          out(*(p++), buffer, idx++, maxlen);
 801584e:	6cdf      	mov      	r3, r7
 8015850:	6c63      	mov      	r1, r8
 8015852:	7bd9      	jsr      	r6
 8015854:	e56b0000 	addi      	r11, r11, 1
 8015858:	da6e200a 	ld.w      	r19, (r14, 0x28)
 801585c:	071c      	br      	0x8015694	// 8015694 <_vsnprintf+0x4a4>
            out(' ', buffer, idx++, maxlen);
 801585e:	6caf      	mov      	r2, r11
 8015860:	e60b0000 	addi      	r16, r11, 1
 8015864:	6cdf      	mov      	r3, r7
 8015866:	6c63      	mov      	r1, r8
 8015868:	3020      	movi      	r0, 32
 801586a:	7bd9      	jsr      	r6
 801586c:	c410482b 	lsli      	r11, r16, 0
 8015870:	071d      	br      	0x80156aa	// 80156aa <_vsnprintf+0x4ba>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8015872:	3308      	movi      	r3, 8
 8015874:	b864      	st.w      	r3, (r14, 0x10)
 8015876:	3310      	movi      	r3, 16
 8015878:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 801587a:	ec840021 	ori      	r4, r4, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 801587e:	3300      	movi      	r3, 0
 8015880:	b885      	st.w      	r4, (r14, 0x14)
 8015882:	de2e2003 	st.w      	r17, (r14, 0xc)
 8015886:	b861      	st.w      	r3, (r14, 0x4)
 8015888:	d86d2000 	ld.w      	r3, (r13, 0x0)
 801588c:	b860      	st.w      	r3, (r14, 0x0)
 801588e:	6caf      	mov      	r2, r11
 8015890:	6cdf      	mov      	r3, r7
 8015892:	6c63      	mov      	r1, r8
 8015894:	6c1b      	mov      	r0, r6
 8015896:	e52d0003 	addi      	r9, r13, 4
 801589a:	e3fff80f 	bsr      	0x80148b8	// 80148b8 <_ntoa_long>
 801589e:	6ec3      	mov      	r11, r0
        format++;
 80158a0:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 80158a2:	6f67      	mov      	r13, r9
        break;
 80158a4:	e800fcb6 	br      	0x8015210	// 8015210 <_vsnprintf+0x20>
        const char* p = va_arg(va, char*);
 80158a8:	e46d0003 	addi      	r3, r13, 4
 80158ac:	1a0b      	addi      	r2, r14, 44
 80158ae:	da6d2000 	ld.w      	r19, (r13, 0x0)
 80158b2:	b869      	st.w      	r3, (r14, 0x24)
 80158b4:	6f4b      	mov      	r13, r2
        outtxt[3 * i + 2] = '-';
 80158b6:	ea14002d 	movi      	r20, 45
 80158ba:	3006      	movi      	r0, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 80158bc:	d8730000 	ld.b      	r3, (r19, 0x0)
 80158c0:	4b24      	lsri      	r1, r3, 4
        if (hbit > 9)
 80158c2:	3909      	cmphsi      	r1, 10
        lbit = *(inchar + i ) & 0x0f;
 80158c4:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 80158c8:	0c3e      	bf      	0x8015944	// 8015944 <_vsnprintf+0x754>
            outtxt[3 * i] = 'A' + hbit - 10;
 80158ca:	2136      	addi      	r1, 55
        if (lbit > 9)
 80158cc:	3b09      	cmphsi      	r3, 10
            outtxt[3 * i]= '0' + hbit;
 80158ce:	a220      	st.b      	r1, (r2, 0x0)
        if (lbit > 9)
 80158d0:	0c3c      	bf      	0x8015948	// 8015948 <_vsnprintf+0x758>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 80158d2:	2336      	addi      	r3, 55
            outtxt[3 * i + 1] = '0' + lbit;
 80158d4:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 80158d6:	de820002 	st.b      	r20, (r2, 0x2)
 80158da:	e6730000 	addi      	r19, r19, 1
 80158de:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 80158e0:	e820ffee 	bnezad      	r0, 0x80158bc	// 80158bc <_vsnprintf+0x6cc>
 80158e4:	3211      	movi      	r2, 17
    outtxt[3 * (i - 1) + 2] = 0;
 80158e6:	3300      	movi      	r3, 0
        if (flags & FLAGS_PRECISION) {
 80158e8:	e6042400 	andi      	r16, r4, 1024
    outtxt[3 * (i - 1) + 2] = 0;
 80158ec:	dc6d0011 	st.b      	r3, (r13, 0x11)
          l = (l < precision ? l : precision);
 80158f0:	eb500000 	cmpnei      	r16, 0
 80158f4:	f851cd23 	min.u32      	r3, r17, r2
 80158f8:	c4620c20 	incf      	r3, r2, 0
        if (!(flags & FLAGS_LEFT)) {
 80158fc:	e4442002 	andi      	r2, r4, 2
 8015900:	b848      	st.w      	r2, (r14, 0x20)
 8015902:	e922002f 	bnez      	r2, 0x8015960	// 8015960 <_vsnprintf+0x770>
 8015906:	62ce      	subu      	r11, r3
          while (l++ < width) {
 8015908:	664c      	cmphs      	r3, r9
 801590a:	c46b0022 	addu      	r2, r11, r3
 801590e:	5b82      	addi      	r4, r3, 1
 8015910:	0c1e      	bf      	0x801594c	// 801594c <_vsnprintf+0x75c>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015912:	c44d008b 	subu      	r11, r13, r2
 8015916:	d04b0020 	ldr.b      	r0, (r11, r2 << 0)
 801591a:	e9200026 	bnez      	r0, 0x8015966	// 8015966 <_vsnprintf+0x776>
        if (flags & FLAGS_LEFT) {
 801591e:	9868      	ld.w      	r3, (r14, 0x20)
 8015920:	6ecb      	mov      	r11, r2
 8015922:	e903fec8 	bez      	r3, 0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
 8015926:	610a      	subu      	r4, r2
          while (l++ < width) {
 8015928:	c48b0023 	addu      	r3, r11, r4
 801592c:	664c      	cmphs      	r3, r9
 801592e:	0ac2      	bt      	0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
            out(' ', buffer, idx++, maxlen);
 8015930:	6caf      	mov      	r2, r11
 8015932:	e60b0000 	addi      	r16, r11, 1
 8015936:	6cdf      	mov      	r3, r7
 8015938:	6c63      	mov      	r1, r8
 801593a:	3020      	movi      	r0, 32
 801593c:	7bd9      	jsr      	r6
 801593e:	c410482b 	lsli      	r11, r16, 0
 8015942:	07f3      	br      	0x8015928	// 8015928 <_vsnprintf+0x738>
            outtxt[3 * i]= '0' + hbit;
 8015944:	212f      	addi      	r1, 48
 8015946:	07c3      	br      	0x80158cc	// 80158cc <_vsnprintf+0x6dc>
            outtxt[3 * i + 1] = '0' + lbit;
 8015948:	232f      	addi      	r3, 48
 801594a:	07c5      	br      	0x80158d4	// 80158d4 <_vsnprintf+0x6e4>
 801594c:	ddae200a 	st.w      	r13, (r14, 0x28)
            out(' ', buffer, idx++, maxlen);
 8015950:	6cdf      	mov      	r3, r7
 8015952:	6c63      	mov      	r1, r8
 8015954:	3020      	movi      	r0, 32
 8015956:	7bd9      	jsr      	r6
          while (l++ < width) {
 8015958:	6cd3      	mov      	r3, r4
 801595a:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 801595e:	07d5      	br      	0x8015908	// 8015908 <_vsnprintf+0x718>
 8015960:	6d0f      	mov      	r4, r3
 8015962:	6caf      	mov      	r2, r11
 8015964:	07d7      	br      	0x8015912	// 8015912 <_vsnprintf+0x722>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015966:	e9100008 	bez      	r16, 0x8015976	// 8015976 <_vsnprintf+0x786>
 801596a:	e4711000 	subi      	r3, r17, 1
 801596e:	e911ffd8 	bez      	r17, 0x801591e	// 801591e <_vsnprintf+0x72e>
 8015972:	c4034831 	lsli      	r17, r3, 0
          out(*(pstr++), buffer, idx++, maxlen);
 8015976:	e5820000 	addi      	r12, r2, 1
 801597a:	dd8e200a 	st.w      	r12, (r14, 0x28)
 801597e:	6cdf      	mov      	r3, r7
 8015980:	6c63      	mov      	r1, r8
 8015982:	7bd9      	jsr      	r6
 8015984:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8015988:	6cb3      	mov      	r2, r12
 801598a:	07c6      	br      	0x8015916	// 8015916 <_vsnprintf+0x726>
        uint32_t ipv4 = va_arg(va, uint32_t);
 801598c:	e46d0003 	addi      	r3, r13, 4
 8015990:	3100      	movi      	r1, 0
 8015992:	b869      	st.w      	r3, (r14, 0x24)
 8015994:	daad2000 	ld.w      	r21, (r13, 0x0)
 8015998:	6cc7      	mov      	r3, r1
            h = bit / 100;
 801599a:	ea130064 	movi      	r19, 100
            m = (bit % 100) / 10;
 801599e:	ea0d000a 	movi      	r13, 10
                    outtxt[j++] = '0';
 80159a2:	ea160030 	movi      	r22, 48
            outtxt[j++] = '.';
 80159a6:	ea14002e 	movi      	r20, 46
 80159aa:	3004      	movi      	r0, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 80159ac:	c4354042 	lsr      	r2, r21, r1
 80159b0:	c40254f7 	zext      	r23, r2, 7, 0
            h = bit / 100;
 80159b4:	c6778038 	divu      	r24, r23, r19
            if (h)
 80159b8:	e9180008 	bez      	r24, 0x80159c8	// 80159c8 <_vsnprintf+0x7d8>
                outtxt[j++] = '0' + h;
 80159bc:	5b42      	addi      	r2, r3, 1
 80159be:	e738002f 	addi      	r25, r24, 48
 80159c2:	d46a0039 	str.b      	r25, (r10, r3 << 0)
 80159c6:	74c8      	zextb      	r3, r2
            m = (bit % 100) / 10;
 80159c8:	c6778022 	divu      	r2, r23, r19
 80159cc:	c6628422 	mult      	r2, r2, r19
 80159d0:	c4570082 	subu      	r2, r23, r2
 80159d4:	7488      	zextb      	r2, r2
 80159d6:	c5a28037 	divu      	r23, r2, r13
 80159da:	e7230000 	addi      	r25, r3, 1
            if (m)
 80159de:	e917004e 	bez      	r23, 0x8015a7a	// 8015a7a <_vsnprintf+0x88a>
                outtxt[j++] = '0' + m;
 80159e2:	e6f7002f 	addi      	r23, r23, 48
 80159e6:	d46a0037 	str.b      	r23, (r10, r3 << 0)
                    outtxt[j++] = '0';
 80159ea:	c41954e3 	zext      	r3, r25, 7, 0
            l = (bit % 100) % 10;
 80159ee:	c5a28038 	divu      	r24, r2, r13
 80159f2:	c5b88438 	mult      	r24, r24, r13
 80159f6:	c7020082 	subu      	r2, r2, r24
            outtxt[j++] = '0' + l;
 80159fa:	e6e30000 	addi      	r23, r3, 1
 80159fe:	222f      	addi      	r2, 48
 8015a00:	d46a0022 	str.b      	r2, (r10, r3 << 0)
 8015a04:	c41754f7 	zext      	r23, r23, 7, 0
            outtxt[j++] = '.';
 8015a08:	2301      	addi      	r3, 2
 8015a0a:	74cc      	zextb      	r3, r3
 8015a0c:	d6ea0034 	str.b      	r20, (r10, r23 << 0)
 8015a10:	2107      	addi      	r1, 8
        for(i = 0; i < 4; i++)
 8015a12:	e820ffcd 	bnezad      	r0, 0x80159ac	// 80159ac <_vsnprintf+0x7bc>
    outtxt[j - 1] = 0;
 8015a16:	e44e002a 	addi      	r2, r14, 43
 8015a1a:	3100      	movi      	r1, 0
 8015a1c:	d4620021 	str.b      	r1, (r2, r3 << 0)
        if (flags & FLAGS_PRECISION) {
 8015a20:	e6042400 	andi      	r16, r4, 1024
    return j - 1;
 8015a24:	2b00      	subi      	r3, 1
          l = (l < precision ? l : precision);
 8015a26:	fa23cd22 	min.u32      	r2, r3, r17
 8015a2a:	eb500000 	cmpnei      	r16, 0
 8015a2e:	c4620c40 	inct      	r3, r2, 0
        if (!(flags & FLAGS_LEFT)) {
 8015a32:	e4442002 	andi      	r2, r4, 2
 8015a36:	b848      	st.w      	r2, (r14, 0x20)
 8015a38:	e922002c 	bnez      	r2, 0x8015a90	// 8015a90 <_vsnprintf+0x8a0>
 8015a3c:	62ce      	subu      	r11, r3
          while (l++ < width) {
 8015a3e:	664c      	cmphs      	r3, r9
 8015a40:	c46b0022 	addu      	r2, r11, r3
 8015a44:	5b82      	addi      	r4, r3, 1
 8015a46:	0c1f      	bf      	0x8015a84	// 8015a84 <_vsnprintf+0x894>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015a48:	c44a008b 	subu      	r11, r10, r2
 8015a4c:	d04b0020 	ldr.b      	r0, (r11, r2 << 0)
 8015a50:	e9200023 	bnez      	r0, 0x8015a96	// 8015a96 <_vsnprintf+0x8a6>
        if (flags & FLAGS_LEFT) {
 8015a54:	9868      	ld.w      	r3, (r14, 0x20)
 8015a56:	6ecb      	mov      	r11, r2
 8015a58:	e903fe2d 	bez      	r3, 0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
 8015a5c:	610a      	subu      	r4, r2
          while (l++ < width) {
 8015a5e:	c48b0023 	addu      	r3, r11, r4
 8015a62:	664c      	cmphs      	r3, r9
 8015a64:	0a27      	bt      	0x80156b2	// 80156b2 <_vsnprintf+0x4c2>
            out(' ', buffer, idx++, maxlen);
 8015a66:	6caf      	mov      	r2, r11
 8015a68:	e60b0000 	addi      	r16, r11, 1
 8015a6c:	6cdf      	mov      	r3, r7
 8015a6e:	6c63      	mov      	r1, r8
 8015a70:	3020      	movi      	r0, 32
 8015a72:	7bd9      	jsr      	r6
 8015a74:	c410482b 	lsli      	r11, r16, 0
 8015a78:	07f3      	br      	0x8015a5e	// 8015a5e <_vsnprintf+0x86e>
                if (h)
 8015a7a:	e918ffba 	bez      	r24, 0x80159ee	// 80159ee <_vsnprintf+0x7fe>
                    outtxt[j++] = '0';
 8015a7e:	d46a0036 	str.b      	r22, (r10, r3 << 0)
 8015a82:	07b4      	br      	0x80159ea	// 80159ea <_vsnprintf+0x7fa>
            out(' ', buffer, idx++, maxlen);
 8015a84:	6cdf      	mov      	r3, r7
 8015a86:	6c63      	mov      	r1, r8
 8015a88:	3020      	movi      	r0, 32
 8015a8a:	7bd9      	jsr      	r6
          while (l++ < width) {
 8015a8c:	6cd3      	mov      	r3, r4
 8015a8e:	07d8      	br      	0x8015a3e	// 8015a3e <_vsnprintf+0x84e>
 8015a90:	6d0f      	mov      	r4, r3
 8015a92:	6caf      	mov      	r2, r11
 8015a94:	07da      	br      	0x8015a48	// 8015a48 <_vsnprintf+0x858>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015a96:	e9100008 	bez      	r16, 0x8015aa6	// 8015aa6 <_vsnprintf+0x8b6>
 8015a9a:	e4711000 	subi      	r3, r17, 1
 8015a9e:	e911ffdb 	bez      	r17, 0x8015a54	// 8015a54 <_vsnprintf+0x864>
 8015aa2:	c4034831 	lsli      	r17, r3, 0
          out(*(pstr++), buffer, idx++, maxlen);
 8015aa6:	e6620000 	addi      	r19, r2, 1
 8015aaa:	de6e200a 	st.w      	r19, (r14, 0x28)
 8015aae:	6cdf      	mov      	r3, r7
 8015ab0:	6c63      	mov      	r1, r8
 8015ab2:	7bd9      	jsr      	r6
 8015ab4:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8015ab8:	c4134822 	lsli      	r2, r19, 0
 8015abc:	07c8      	br      	0x8015a4c	// 8015a4c <_vsnprintf+0x85c>
                    outtxt[j++]= '0' + h;
 8015abe:	222f      	addi      	r2, 48
 8015ac0:	e800fcd9 	br      	0x8015472	// 8015472 <_vsnprintf+0x282>
                    outtxt[j++] = '0' + l;
 8015ac4:	212f      	addi      	r1, 48
 8015ac6:	e800fcdf 	br      	0x8015484	// 8015484 <_vsnprintf+0x294>
            out(' ', buffer, idx++, maxlen);
 8015aca:	6cdf      	mov      	r3, r7
 8015acc:	6c63      	mov      	r1, r8
 8015ace:	3020      	movi      	r0, 32
 8015ad0:	7bd9      	jsr      	r6
          while (l++ < width) {
 8015ad2:	6cd3      	mov      	r3, r4
 8015ad4:	e800fcff 	br      	0x80154d2	// 80154d2 <_vsnprintf+0x2e2>
 8015ad8:	6d0f      	mov      	r4, r3
 8015ada:	6caf      	mov      	r2, r11
 8015adc:	e800fd01 	br      	0x80154de	// 80154de <_vsnprintf+0x2ee>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8015ae0:	e9100008 	bez      	r16, 0x8015af0	// 8015af0 <_vsnprintf+0x900>
 8015ae4:	e4711000 	subi      	r3, r17, 1
 8015ae8:	e911fd01 	bez      	r17, 0x80154ea	// 80154ea <_vsnprintf+0x2fa>
 8015aec:	c4034831 	lsli      	r17, r3, 0
          out(*(pstr++), buffer, idx++, maxlen);
 8015af0:	e6620000 	addi      	r19, r2, 1
 8015af4:	de6e200a 	st.w      	r19, (r14, 0x28)
 8015af8:	6cdf      	mov      	r3, r7
 8015afa:	6c63      	mov      	r1, r8
 8015afc:	7bd9      	jsr      	r6
 8015afe:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8015b02:	c4134822 	lsli      	r2, r19, 0
 8015b06:	e800fcee 	br      	0x80154e2	// 80154e2 <_vsnprintf+0x2f2>
 8015b0a:	6caf      	mov      	r2, r11
 8015b0c:	e800fb89 	br      	0x801521e	// 801521e <_vsnprintf+0x2e>

08015b10 <sendchar>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8015b10:	1045      	lrw      	r2, 0x40010600	// 8015b24 <sendchar+0x14>
 8015b12:	9267      	ld.w      	r3, (r2, 0x1c)
 8015b14:	e463203f 	andi      	r3, r3, 63
 8015b18:	3b1f      	cmphsi      	r3, 32
 8015b1a:	0bfc      	bt      	0x8015b12	// 8015b12 <sendchar+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8015b1c:	e46020ff 	andi      	r3, r0, 255
 8015b20:	b268      	st.w      	r3, (r2, 0x20)
}
 8015b22:	783c      	jmp      	r15
 8015b24:	40010600 	.long	0x40010600

08015b28 <fputc>:
{
 8015b28:	14d0      	push      	r15
    sendchar(ch);
 8015b2a:	e3fffff3 	bsr      	0x8015b10	// 8015b10 <sendchar>
}
 8015b2e:	3000      	movi      	r0, 0
 8015b30:	1490      	pop      	r15
	...

08015b34 <_write_r>:
{
 8015b34:	14d3      	push      	r4-r6, r15
 8015b36:	6d4f      	mov      	r5, r3
 8015b38:	6d0b      	mov      	r4, r2
 8015b3a:	5acc      	addu      	r6, r2, r3
	for (i = 0; i < len; i++) 
 8015b3c:	6592      	cmpne      	r4, r6
 8015b3e:	0803      	bt      	0x8015b44	// 8015b44 <_write_r+0x10>
}
 8015b40:	6c17      	mov      	r0, r5
 8015b42:	1493      	pop      	r4-r6, r15
    sendchar(ch);
 8015b44:	d0048000 	ldbi.b      	r0, (r4)
 8015b48:	e3ffffe4 	bsr      	0x8015b10	// 8015b10 <sendchar>
 8015b4c:	07f8      	br      	0x8015b3c	// 8015b3c <_write_r+0x8>
	...

08015b50 <_out_uart>:
{
 8015b50:	14d0      	push      	r15
 8015b52:	1421      	subi      	r14, r14, 4
  _write_r(NULL, 0, &character, 1);
 8015b54:	3100      	movi      	r1, 0
{
 8015b56:	dc0e0003 	st.b      	r0, (r14, 0x3)
  _write_r(NULL, 0, &character, 1);
 8015b5a:	3301      	movi      	r3, 1
 8015b5c:	e44e0002 	addi      	r2, r14, 3
 8015b60:	6c07      	mov      	r0, r1
 8015b62:	e3ffffe9 	bsr      	0x8015b34	// 8015b34 <_write_r>
}
 8015b66:	1401      	addi      	r14, r14, 4
 8015b68:	1490      	pop      	r15
	...

08015b6c <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 8015b6c:	1424      	subi      	r14, r14, 16
 8015b6e:	b863      	st.w      	r3, (r14, 0xc)
 8015b70:	b842      	st.w      	r2, (r14, 0x8)
 8015b72:	b821      	st.w      	r1, (r14, 0x4)
 8015b74:	b800      	st.w      	r0, (r14, 0x0)
 8015b76:	14d0      	push      	r15
 8015b78:	1422      	subi      	r14, r14, 8
 8015b7a:	9863      	ld.w      	r3, (r14, 0xc)
 8015b7c:	b861      	st.w      	r3, (r14, 0x4)
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 8015b7e:	1b04      	addi      	r3, r14, 16
 8015b80:	b860      	st.w      	r3, (r14, 0x0)
 8015b82:	3200      	movi      	r2, 0
 8015b84:	9861      	ld.w      	r3, (r14, 0x4)
 8015b86:	2a00      	subi      	r2, 1
 8015b88:	6c4f      	mov      	r1, r3
 8015b8a:	1005      	lrw      	r0, 0x8015b50	// 8015b9c <wm_printf+0x30>
 8015b8c:	e3fffb32 	bsr      	0x80151f0	// 80151f0 <_vsnprintf>
	va_end(args);

	return length;
}
 8015b90:	1402      	addi      	r14, r14, 8
 8015b92:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8015b96:	1405      	addi      	r14, r14, 20
 8015b98:	783c      	jmp      	r15
 8015b9a:	0000      	.short	0x0000
 8015b9c:	08015b50 	.long	0x08015b50
