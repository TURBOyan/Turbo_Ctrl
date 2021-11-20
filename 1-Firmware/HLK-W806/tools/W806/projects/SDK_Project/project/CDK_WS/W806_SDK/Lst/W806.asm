
.//Obj/W806.elf:     file format elf32-csky-little


Disassembly of section .text:

08010400 <__Vectors>:
 8010400:	00 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010410:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010420:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010430:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010440:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010450:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010460:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010470:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010480:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 8010490:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104a0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104b0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104c0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104d0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................
 80104e0:	d0 05 01 08 10 1a 01 08 d0 05 01 08 d0 05 01 08     ................
 80104f0:	d0 05 01 08 d0 05 01 08 d0 05 01 08 d0 05 01 08     ................

08010500 <Reset_Handler>:
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
#ifdef CONFIG_KERNEL_NONE
    lrw     r0, 0xe0000200
 8010500:	1019      	lrw      	r0, 0xe0000200	// 8010564 <__exit+0x4>
#else
    lrw     r0, 0x80000200
    mtcr    r0, psr
#endif
    mtcr    r0, psr
 8010502:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
 8010506:	1019      	lrw      	r0, 0x20001160	// 8010568 <__exit+0x8>
    mov     sp, r0
 8010508:	6f83      	mov      	r14, r0

/*
 *	move __Vectors to irq_vectors
 */
    lrw     r1, __Vectors
 801050a:	1039      	lrw      	r1, 0x8010400	// 801056c <__exit+0xc>
    lrw     r2, __vdata_start__
 801050c:	1059      	lrw      	r2, 0x20000000	// 8010570 <__exit+0x10>
    lrw     r3, __vdata_end__
 801050e:	107a      	lrw      	r3, 0x20000100	// 8010574 <__exit+0x14>

    subu    r3, r2
 8010510:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 8010512:	3b40      	cmpnei      	r3, 0
    bf      .L_loopv0_done
 8010514:	0c08      	bf      	0x8010524	// 8010524 <Reset_Handler+0x24>

.L_loopv0:
    ldw     r0, (r1, 0)
 8010516:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010518:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 801051a:	2103      	addi      	r1, 4
    addi    r2, 4
 801051c:	2203      	addi      	r2, 4
    subi    r3, 4
 801051e:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 8010520:	3b40      	cmpnei      	r3, 0
    bt      .L_loopv0
 8010522:	0bfa      	bt      	0x8010516	// 8010516 <Reset_Handler+0x16>
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
 8010524:	1035      	lrw      	r1, 0x80136fc	// 8010578 <__exit+0x18>
    lrw     r2, __data_start__
 8010526:	1056      	lrw      	r2, 0x20000100	// 801057c <__exit+0x1c>
    lrw     r3, __data_end__
 8010528:	1076      	lrw      	r3, 0x20000160	// 8010580 <__exit+0x20>

    subu    r3, r2
 801052a:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
 801052c:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
 801052e:	0c08      	bf      	0x801053e	// 801053e <Reset_Handler+0x3e>

.L_loop0:
    ldw     r0, (r1, 0)
 8010530:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
 8010532:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
 8010534:	2103      	addi      	r1, 4
    addi    r2, 4
 8010536:	2203      	addi      	r2, 4
    subi    r3, 4
 8010538:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
 801053a:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
 801053c:	0bfa      	bt      	0x8010530	// 8010530 <Reset_Handler+0x30>
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
 #if 1
    lrw     r1, __bss_start__
 801053e:	1032      	lrw      	r1, 0x20000160	// 8010584 <__exit+0x24>
    lrw     r2, __bss_end__
 8010540:	1052      	lrw      	r2, 0x2000136c	// 8010588 <__exit+0x28>

    movi    r0, 0
 8010542:	3000      	movi      	r0, 0

    subu    r2, r1
 8010544:	6086      	subu      	r2, r1
    cmpnei  r2, 0
 8010546:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
 8010548:	0c06      	bf      	0x8010554	// 8010554 <Reset_Handler+0x54>

.L_loop1:
    stw     r0, (r1, 0)
 801054a:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
 801054c:	2103      	addi      	r1, 4
    subi    r2, 4
 801054e:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
 8010550:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
 8010552:	0bfc      	bt      	0x801054a	// 801054a <Reset_Handler+0x4a>
.L_loop1_done:
#endif

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
 8010554:	e0000a78 	bsr      	0x8011a44	// 8011a44 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
 8010558:	e0000acc 	bsr      	0x8011af0	// 8011af0 <board_init>
#endif

    jbsr    main
 801055c:	e0000a46 	bsr      	0x80119e8	// 80119e8 <main>

08010560 <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
 8010560:	0400      	br      	0x8010560	// 8010560 <__exit>
 8010562:	0000      	.short	0x0000
 8010564:	e0000200 	.long	0xe0000200
 8010568:	20001160 	.long	0x20001160
 801056c:	08010400 	.long	0x08010400
 8010570:	20000000 	.long	0x20000000
 8010574:	20000100 	.long	0x20000100
 8010578:	080136fc 	.long	0x080136fc
 801057c:	20000100 	.long	0x20000100
 8010580:	20000160 	.long	0x20000160
 8010584:	20000160 	.long	0x20000160
 8010588:	2000136c 	.long	0x2000136c

0801058c <trap>:
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
    psrset  ee
 801058c:	c1007420 	psrset      	ee

    subi    sp, 4
 8010590:	1421      	subi      	r14, r14, 4
    stw     r13, (sp)
 8010592:	ddae2000 	st.w      	r13, (r14, 0x0)
    addi    sp, 4
 8010596:	1401      	addi      	r14, r14, 4

    lrw     r13, g_trap_sp
 8010598:	ea8d000f 	lrw      	r13, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    stw     sp, (r13)
 801059c:	ddcd2000 	st.w      	r14, (r13, 0x0)

    lrw     sp, g_top_trapstack
 80105a0:	ea8e000e 	lrw      	r14, 0x20001360	// 80105d8 <ADC_IRQHandler+0x8>

    subi    sp, 72
 80105a4:	1432      	subi      	r14, r14, 72
    stm     r0-r12, (sp)
 80105a6:	d40e1c2c 	stm      	r0-r12, (r14)

    lrw     r0, g_trap_sp
 80105aa:	100b      	lrw      	r0, 0x20001360	// 80105d4 <ADC_IRQHandler+0x4>
    ldw     r0, (r0)
 80105ac:	9000      	ld.w      	r0, (r0, 0x0)

    stw     r0, (sp, 56) /* save r14 */
 80105ae:	b80e      	st.w      	r0, (r14, 0x38)

    subi    r0, 4
 80105b0:	2803      	subi      	r0, 4
    ldw     r13, (r0)
 80105b2:	d9a02000 	ld.w      	r13, (r0, 0x0)
    stw     r13, (sp, 52)
 80105b6:	ddae200d 	st.w      	r13, (r14, 0x34)

    stw     r15, (sp, 60)
 80105ba:	ddee200f 	st.w      	r15, (r14, 0x3c)
    mfcr    r0, epsr
 80105be:	c0026020 	mfcr      	r0, cr<2, 0>
    stw     r0, (sp, 64)
 80105c2:	b810      	st.w      	r0, (r14, 0x40)
    mfcr    r0, epc
 80105c4:	c0046020 	mfcr      	r0, cr<4, 0>
    stw     r0, (sp, 68)
 80105c8:	b811      	st.w      	r0, (r14, 0x44)

    mov     r0, sp
 80105ca:	6c3b      	mov      	r0, r14

    jbsr    trap_c
 80105cc:	e0000a54 	bsr      	0x8011a74	// 8011a74 <trap_c>

080105d0 <ADC_IRQHandler>:

    .align  2
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    br      trap
 80105d0:	07de      	br      	0x801058c	// 801058c <trap>
 80105d2:	0000      	.short	0x0000
 80105d4:	20001360 	.long	0x20001360
 80105d8:	20001360 	.long	0x20001360

080105dc <__fixunsdfsi>:
 80105dc:	14d2      	push      	r4-r5, r15
 80105de:	3200      	movi      	r2, 0
 80105e0:	ea2341e0 	movih      	r3, 16864
 80105e4:	6d03      	mov      	r4, r0
 80105e6:	6d47      	mov      	r5, r1
 80105e8:	e00006a2 	bsr      	0x801132c	// 801132c <__gedf2>
 80105ec:	e9a00007 	bhsz      	r0, 0x80105fa	// 80105fa <__fixunsdfsi+0x1e>
 80105f0:	6c13      	mov      	r0, r4
 80105f2:	6c57      	mov      	r1, r5
 80105f4:	e000070c 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80105f8:	1492      	pop      	r4-r5, r15
 80105fa:	3200      	movi      	r2, 0
 80105fc:	ea2341e0 	movih      	r3, 16864
 8010600:	6c13      	mov      	r0, r4
 8010602:	6c57      	mov      	r1, r5
 8010604:	e00004ae 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8010608:	e0000702 	bsr      	0x801140c	// 801140c <__fixdfsi>
 801060c:	ea238000 	movih      	r3, 32768
 8010610:	600c      	addu      	r0, r3
 8010612:	1492      	pop      	r4-r5, r15

08010614 <__udivdi3>:
 8010614:	14c5      	push      	r4-r8
 8010616:	6f4b      	mov      	r13, r2
 8010618:	6d4f      	mov      	r5, r3
 801061a:	6d03      	mov      	r4, r0
 801061c:	6f07      	mov      	r12, r1
 801061e:	e9230054 	bnez      	r3, 0x80106c6	// 80106c6 <__udivdi3+0xb2>
 8010622:	6484      	cmphs      	r1, r2
 8010624:	0870      	bt      	0x8010704	// 8010704 <__udivdi3+0xf0>
 8010626:	eb02ffff 	cmphsi      	r2, 65536
 801062a:	0cc4      	bf      	0x80107b2	// 80107b2 <__udivdi3+0x19e>
 801062c:	c6e05023 	bmaski      	r3, 24
 8010630:	648c      	cmphs      	r3, r2
 8010632:	3518      	movi      	r5, 24
 8010634:	3310      	movi      	r3, 16
 8010636:	c4a30c40 	inct      	r5, r3, 0
 801063a:	01dc      	lrw      	r6, 0x8013364	// 8010944 <__udivdi3+0x330>
 801063c:	c4a24043 	lsr      	r3, r2, r5
 8010640:	d0660023 	ldr.b      	r3, (r6, r3 << 0)
 8010644:	614c      	addu      	r5, r3
 8010646:	3320      	movi      	r3, 32
 8010648:	60d6      	subu      	r3, r5
 801064a:	e903000c 	bez      	r3, 0x8010662	// 8010662 <__udivdi3+0x4e>
 801064e:	c462402d 	lsl      	r13, r2, r3
 8010652:	c4a04045 	lsr      	r5, r0, r5
 8010656:	c4614022 	lsl      	r2, r1, r3
 801065a:	c445242c 	or      	r12, r5, r2
 801065e:	c4604024 	lsl      	r4, r0, r3
 8010662:	c60d4841 	lsri      	r1, r13, 16
 8010666:	c42c8022 	divu      	r2, r12, r1
 801066a:	c4228423 	mult      	r3, r2, r1
 801066e:	630e      	subu      	r12, r3
 8010670:	c60c4823 	lsli      	r3, r12, 16
 8010674:	c40d55e5 	zext      	r5, r13, 15, 0
 8010678:	c604484c 	lsri      	r12, r4, 16
 801067c:	c4458420 	mult      	r0, r5, r2
 8010680:	6f0c      	or      	r12, r3
 8010682:	6430      	cmphs      	r12, r0
 8010684:	0808      	bt      	0x8010694	// 8010694 <__udivdi3+0x80>
 8010686:	6334      	addu      	r12, r13
 8010688:	6770      	cmphs      	r12, r13
 801068a:	5a63      	subi      	r3, r2, 1
 801068c:	0c03      	bf      	0x8010692	// 8010692 <__udivdi3+0x7e>
 801068e:	6430      	cmphs      	r12, r0
 8010690:	0d56      	bf      	0x801093c	// 801093c <__udivdi3+0x328>
 8010692:	6c8f      	mov      	r2, r3
 8010694:	6302      	subu      	r12, r0
 8010696:	c42c8020 	divu      	r0, r12, r1
 801069a:	7c40      	mult      	r1, r0
 801069c:	6306      	subu      	r12, r1
 801069e:	c60c482c 	lsli      	r12, r12, 16
 80106a2:	c40455e4 	zext      	r4, r4, 15, 0
 80106a6:	7d40      	mult      	r5, r0
 80106a8:	6d30      	or      	r4, r12
 80106aa:	6550      	cmphs      	r4, r5
 80106ac:	6c43      	mov      	r1, r0
 80106ae:	0808      	bt      	0x80106be	// 80106be <__udivdi3+0xaa>
 80106b0:	6134      	addu      	r4, r13
 80106b2:	6750      	cmphs      	r4, r13
 80106b4:	5863      	subi      	r3, r0, 1
 80106b6:	0d21      	bf      	0x80108f8	// 80108f8 <__udivdi3+0x2e4>
 80106b8:	6550      	cmphs      	r4, r5
 80106ba:	091f      	bt      	0x80108f8	// 80108f8 <__udivdi3+0x2e4>
 80106bc:	2901      	subi      	r1, 2
 80106be:	4210      	lsli      	r0, r2, 16
 80106c0:	6c04      	or      	r0, r1
 80106c2:	3100      	movi      	r1, 0
 80106c4:	1485      	pop      	r4-r8
 80106c6:	64c4      	cmphs      	r1, r3
 80106c8:	0c6b      	bf      	0x801079e	// 801079e <__udivdi3+0x18a>
 80106ca:	eb03ffff 	cmphsi      	r3, 65536
 80106ce:	0c6b      	bf      	0x80107a4	// 80107a4 <__udivdi3+0x190>
 80106d0:	c6e0502c 	bmaski      	r12, 24
 80106d4:	64f0      	cmphs      	r12, r3
 80106d6:	ea0d0018 	movi      	r13, 24
 80106da:	ea0c0010 	movi      	r12, 16
 80106de:	c58d0c20 	incf      	r12, r13, 0
 80106e2:	0386      	lrw      	r4, 0x8013364	// 8010944 <__udivdi3+0x330>
 80106e4:	c583404d 	lsr      	r13, r3, r12
 80106e8:	d1a4002d 	ldr.b      	r13, (r4, r13 << 0)
 80106ec:	6370      	addu      	r13, r12
 80106ee:	3520      	movi      	r5, 32
 80106f0:	6176      	subu      	r5, r13
 80106f2:	e925006c 	bnez      	r5, 0x80107ca	// 80107ca <__udivdi3+0x1b6>
 80106f6:	644c      	cmphs      	r3, r1
 80106f8:	0d0d      	bf      	0x8010912	// 8010912 <__udivdi3+0x2fe>
 80106fa:	6480      	cmphs      	r0, r2
 80106fc:	c4000500 	mvc      	r0
 8010700:	6c57      	mov      	r1, r5
 8010702:	1485      	pop      	r4-r8
 8010704:	e9220006 	bnez      	r2, 0x8010710	// 8010710 <__udivdi3+0xfc>
 8010708:	ea0d0001 	movi      	r13, 1
 801070c:	c44d802d 	divu      	r13, r13, r2
 8010710:	eb0dffff 	cmphsi      	r13, 65536
 8010714:	0c55      	bf      	0x80107be	// 80107be <__udivdi3+0x1aa>
 8010716:	c6e05023 	bmaski      	r3, 24
 801071a:	674c      	cmphs      	r3, r13
 801071c:	3518      	movi      	r5, 24
 801071e:	3310      	movi      	r3, 16
 8010720:	c4a30c40 	inct      	r5, r3, 0
 8010724:	0357      	lrw      	r2, 0x8013364	// 8010944 <__udivdi3+0x330>
 8010726:	c4ad4043 	lsr      	r3, r13, r5
 801072a:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 801072e:	614c      	addu      	r5, r3
 8010730:	3620      	movi      	r6, 32
 8010732:	6196      	subu      	r6, r5
 8010734:	e926009f 	bnez      	r6, 0x8010872	// 8010872 <__udivdi3+0x25e>
 8010738:	c5a10082 	subu      	r2, r1, r13
 801073c:	c60d4846 	lsri      	r6, r13, 16
 8010740:	c40d55e5 	zext      	r5, r13, 15, 0
 8010744:	3101      	movi      	r1, 1
 8010746:	c4c2802c 	divu      	r12, r2, r6
 801074a:	c4cc8423 	mult      	r3, r12, r6
 801074e:	608e      	subu      	r2, r3
 8010750:	4250      	lsli      	r2, r2, 16
 8010752:	4c70      	lsri      	r3, r4, 16
 8010754:	c4ac8420 	mult      	r0, r12, r5
 8010758:	6cc8      	or      	r3, r2
 801075a:	640c      	cmphs      	r3, r0
 801075c:	0809      	bt      	0x801076e	// 801076e <__udivdi3+0x15a>
 801075e:	60f4      	addu      	r3, r13
 8010760:	674c      	cmphs      	r3, r13
 8010762:	e44c1000 	subi      	r2, r12, 1
 8010766:	0c03      	bf      	0x801076c	// 801076c <__udivdi3+0x158>
 8010768:	640c      	cmphs      	r3, r0
 801076a:	0ce5      	bf      	0x8010934	// 8010934 <__udivdi3+0x320>
 801076c:	6f0b      	mov      	r12, r2
 801076e:	60c2      	subu      	r3, r0
 8010770:	c4c38020 	divu      	r0, r3, r6
 8010774:	7d80      	mult      	r6, r0
 8010776:	60da      	subu      	r3, r6
 8010778:	4370      	lsli      	r3, r3, 16
 801077a:	c40455e4 	zext      	r4, r4, 15, 0
 801077e:	7d40      	mult      	r5, r0
 8010780:	6cd0      	or      	r3, r4
 8010782:	654c      	cmphs      	r3, r5
 8010784:	6c83      	mov      	r2, r0
 8010786:	0808      	bt      	0x8010796	// 8010796 <__udivdi3+0x182>
 8010788:	60f4      	addu      	r3, r13
 801078a:	674c      	cmphs      	r3, r13
 801078c:	2800      	subi      	r0, 1
 801078e:	0cb3      	bf      	0x80108f4	// 80108f4 <__udivdi3+0x2e0>
 8010790:	654c      	cmphs      	r3, r5
 8010792:	08b1      	bt      	0x80108f4	// 80108f4 <__udivdi3+0x2e0>
 8010794:	2a01      	subi      	r2, 2
 8010796:	c60c4820 	lsli      	r0, r12, 16
 801079a:	6c08      	or      	r0, r2
 801079c:	1485      	pop      	r4-r8
 801079e:	3100      	movi      	r1, 0
 80107a0:	6c07      	mov      	r0, r1
 80107a2:	1485      	pop      	r4-r8
 80107a4:	eb0300ff 	cmphsi      	r3, 256
 80107a8:	c400050d 	mvc      	r13
 80107ac:	c46d482c 	lsli      	r12, r13, 3
 80107b0:	0799      	br      	0x80106e2	// 80106e2 <__udivdi3+0xce>
 80107b2:	eb0200ff 	cmphsi      	r2, 256
 80107b6:	3308      	movi      	r3, 8
 80107b8:	c4a30c40 	inct      	r5, r3, 0
 80107bc:	073f      	br      	0x801063a	// 801063a <__udivdi3+0x26>
 80107be:	eb0d00ff 	cmphsi      	r13, 256
 80107c2:	3308      	movi      	r3, 8
 80107c4:	c4a30c40 	inct      	r5, r3, 0
 80107c8:	07ae      	br      	0x8010724	// 8010724 <__udivdi3+0x110>
 80107ca:	c5a24046 	lsr      	r6, r2, r13
 80107ce:	70d4      	lsl      	r3, r5
 80107d0:	6d8c      	or      	r6, r3
 80107d2:	c5a14044 	lsr      	r4, r1, r13
 80107d6:	4ef0      	lsri      	r7, r6, 16
 80107d8:	c4e48023 	divu      	r3, r4, r7
 80107dc:	c4a1402c 	lsl      	r12, r1, r5
 80107e0:	c5a04041 	lsr      	r1, r0, r13
 80107e4:	c4e3842d 	mult      	r13, r3, r7
 80107e8:	6c70      	or      	r1, r12
 80107ea:	6136      	subu      	r4, r13
 80107ec:	c40655ec 	zext      	r12, r6, 15, 0
 80107f0:	4490      	lsli      	r4, r4, 16
 80107f2:	c601484d 	lsri      	r13, r1, 16
 80107f6:	c46c8428 	mult      	r8, r12, r3
 80107fa:	6f50      	or      	r13, r4
 80107fc:	6634      	cmphs      	r13, r8
 80107fe:	7094      	lsl      	r2, r5
 8010800:	0806      	bt      	0x801080c	// 801080c <__udivdi3+0x1f8>
 8010802:	6358      	addu      	r13, r6
 8010804:	65b4      	cmphs      	r13, r6
 8010806:	5b83      	subi      	r4, r3, 1
 8010808:	088d      	bt      	0x8010922	// 8010922 <__udivdi3+0x30e>
 801080a:	6cd3      	mov      	r3, r4
 801080c:	6362      	subu      	r13, r8
 801080e:	c4ed8024 	divu      	r4, r13, r7
 8010812:	7dd0      	mult      	r7, r4
 8010814:	635e      	subu      	r13, r7
 8010816:	c60d482d 	lsli      	r13, r13, 16
 801081a:	c48c8427 	mult      	r7, r12, r4
 801081e:	c40155ec 	zext      	r12, r1, 15, 0
 8010822:	6f34      	or      	r12, r13
 8010824:	65f0      	cmphs      	r12, r7
 8010826:	0806      	bt      	0x8010832	// 8010832 <__udivdi3+0x21e>
 8010828:	6318      	addu      	r12, r6
 801082a:	65b0      	cmphs      	r12, r6
 801082c:	5c23      	subi      	r1, r4, 1
 801082e:	0875      	bt      	0x8010918	// 8010918 <__udivdi3+0x304>
 8010830:	6d07      	mov      	r4, r1
 8010832:	4370      	lsli      	r3, r3, 16
 8010834:	6cd0      	or      	r3, r4
 8010836:	c40355e1 	zext      	r1, r3, 15, 0
 801083a:	c40255e4 	zext      	r4, r2, 15, 0
 801083e:	c603484d 	lsri      	r13, r3, 16
 8010842:	4a50      	lsri      	r2, r2, 16
 8010844:	c4818426 	mult      	r6, r1, r4
 8010848:	7d34      	mult      	r4, r13
 801084a:	7c48      	mult      	r1, r2
 801084c:	7f48      	mult      	r13, r2
 801084e:	6050      	addu      	r1, r4
 8010850:	4e50      	lsri      	r2, r6, 16
 8010852:	6084      	addu      	r2, r1
 8010854:	6508      	cmphs      	r2, r4
 8010856:	631e      	subu      	r12, r7
 8010858:	0804      	bt      	0x8010860	// 8010860 <__udivdi3+0x24c>
 801085a:	ea210001 	movih      	r1, 1
 801085e:	6344      	addu      	r13, r1
 8010860:	4a30      	lsri      	r1, r2, 16
 8010862:	6344      	addu      	r13, r1
 8010864:	6770      	cmphs      	r12, r13
 8010866:	0c53      	bf      	0x801090c	// 801090c <__udivdi3+0x2f8>
 8010868:	6772      	cmpne      	r12, r13
 801086a:	0c49      	bf      	0x80108fc	// 80108fc <__udivdi3+0x2e8>
 801086c:	6c0f      	mov      	r0, r3
 801086e:	3100      	movi      	r1, 0
 8010870:	1485      	pop      	r4-r8
 8010872:	7358      	lsl      	r13, r6
 8010874:	c4a1404c 	lsr      	r12, r1, r5
 8010878:	c4c14022 	lsl      	r2, r1, r6
 801087c:	c4c04024 	lsl      	r4, r0, r6
 8010880:	c60d4846 	lsri      	r6, r13, 16
 8010884:	c4a04045 	lsr      	r5, r0, r5
 8010888:	c4cc8020 	divu      	r0, r12, r6
 801088c:	c4c08421 	mult      	r1, r0, r6
 8010890:	c4452423 	or      	r3, r5, r2
 8010894:	6306      	subu      	r12, r1
 8010896:	c40d55e5 	zext      	r5, r13, 15, 0
 801089a:	c60c482c 	lsli      	r12, r12, 16
 801089e:	4b30      	lsri      	r1, r3, 16
 80108a0:	c4058422 	mult      	r2, r5, r0
 80108a4:	6c70      	or      	r1, r12
 80108a6:	6484      	cmphs      	r1, r2
 80108a8:	080a      	bt      	0x80108bc	// 80108bc <__udivdi3+0x2a8>
 80108aa:	6074      	addu      	r1, r13
 80108ac:	6744      	cmphs      	r1, r13
 80108ae:	e5801000 	subi      	r12, r0, 1
 80108b2:	0c3f      	bf      	0x8010930	// 8010930 <__udivdi3+0x31c>
 80108b4:	6484      	cmphs      	r1, r2
 80108b6:	083d      	bt      	0x8010930	// 8010930 <__udivdi3+0x31c>
 80108b8:	2801      	subi      	r0, 2
 80108ba:	6074      	addu      	r1, r13
 80108bc:	604a      	subu      	r1, r2
 80108be:	c4c1802c 	divu      	r12, r1, r6
 80108c2:	c4cc8422 	mult      	r2, r12, r6
 80108c6:	5949      	subu      	r2, r1, r2
 80108c8:	4250      	lsli      	r2, r2, 16
 80108ca:	c40355e3 	zext      	r3, r3, 15, 0
 80108ce:	c5858421 	mult      	r1, r5, r12
 80108d2:	6c8c      	or      	r2, r3
 80108d4:	6448      	cmphs      	r2, r1
 80108d6:	080b      	bt      	0x80108ec	// 80108ec <__udivdi3+0x2d8>
 80108d8:	60b4      	addu      	r2, r13
 80108da:	6748      	cmphs      	r2, r13
 80108dc:	e46c1000 	subi      	r3, r12, 1
 80108e0:	0c26      	bf      	0x801092c	// 801092c <__udivdi3+0x318>
 80108e2:	6448      	cmphs      	r2, r1
 80108e4:	0824      	bt      	0x801092c	// 801092c <__udivdi3+0x318>
 80108e6:	e58c1001 	subi      	r12, r12, 2
 80108ea:	60b4      	addu      	r2, r13
 80108ec:	6086      	subu      	r2, r1
 80108ee:	4030      	lsli      	r1, r0, 16
 80108f0:	6c70      	or      	r1, r12
 80108f2:	072a      	br      	0x8010746	// 8010746 <__udivdi3+0x132>
 80108f4:	6c83      	mov      	r2, r0
 80108f6:	0750      	br      	0x8010796	// 8010796 <__udivdi3+0x182>
 80108f8:	6c4f      	mov      	r1, r3
 80108fa:	06e2      	br      	0x80106be	// 80106be <__udivdi3+0xaa>
 80108fc:	4250      	lsli      	r2, r2, 16
 80108fe:	c40655e6 	zext      	r6, r6, 15, 0
 8010902:	c4a04021 	lsl      	r1, r0, r5
 8010906:	6098      	addu      	r2, r6
 8010908:	6484      	cmphs      	r1, r2
 801090a:	0bb1      	bt      	0x801086c	// 801086c <__udivdi3+0x258>
 801090c:	5b03      	subi      	r0, r3, 1
 801090e:	3100      	movi      	r1, 0
 8010910:	1485      	pop      	r4-r8
 8010912:	6c57      	mov      	r1, r5
 8010914:	3001      	movi      	r0, 1
 8010916:	1485      	pop      	r4-r8
 8010918:	65f0      	cmphs      	r12, r7
 801091a:	0b8b      	bt      	0x8010830	// 8010830 <__udivdi3+0x21c>
 801091c:	2c01      	subi      	r4, 2
 801091e:	6318      	addu      	r12, r6
 8010920:	0789      	br      	0x8010832	// 8010832 <__udivdi3+0x21e>
 8010922:	6634      	cmphs      	r13, r8
 8010924:	0b73      	bt      	0x801080a	// 801080a <__udivdi3+0x1f6>
 8010926:	2b01      	subi      	r3, 2
 8010928:	6358      	addu      	r13, r6
 801092a:	0771      	br      	0x801080c	// 801080c <__udivdi3+0x1f8>
 801092c:	6f0f      	mov      	r12, r3
 801092e:	07df      	br      	0x80108ec	// 80108ec <__udivdi3+0x2d8>
 8010930:	6c33      	mov      	r0, r12
 8010932:	07c5      	br      	0x80108bc	// 80108bc <__udivdi3+0x2a8>
 8010934:	e58c1001 	subi      	r12, r12, 2
 8010938:	60f4      	addu      	r3, r13
 801093a:	071a      	br      	0x801076e	// 801076e <__udivdi3+0x15a>
 801093c:	2a01      	subi      	r2, 2
 801093e:	6334      	addu      	r12, r13
 8010940:	06aa      	br      	0x8010694	// 8010694 <__udivdi3+0x80>
 8010942:	0000      	.short	0x0000
 8010944:	08013364 	.long	0x08013364

08010948 <__umoddi3>:
 8010948:	14c6      	push      	r4-r9
 801094a:	6d4b      	mov      	r5, r2
 801094c:	6f4f      	mov      	r13, r3
 801094e:	6d83      	mov      	r6, r0
 8010950:	6f07      	mov      	r12, r1
 8010952:	e923004a 	bnez      	r3, 0x80109e6	// 80109e6 <__umoddi3+0x9e>
 8010956:	6484      	cmphs      	r1, r2
 8010958:	086b      	bt      	0x8010a2e	// 8010a2e <__umoddi3+0xe6>
 801095a:	eb02ffff 	cmphsi      	r2, 65536
 801095e:	0cc0      	bf      	0x8010ade	// 8010ade <__umoddi3+0x196>
 8010960:	c6e05023 	bmaski      	r3, 24
 8010964:	648c      	cmphs      	r3, r2
 8010966:	ea0d0018 	movi      	r13, 24
 801096a:	3310      	movi      	r3, 16
 801096c:	c5a30c40 	inct      	r13, r3, 0
 8010970:	0281      	lrw      	r4, 0x8013364	// 8010c68 <__umoddi3+0x320>
 8010972:	c5a24043 	lsr      	r3, r2, r13
 8010976:	d0640023 	ldr.b      	r3, (r4, r3 << 0)
 801097a:	634c      	addu      	r13, r3
 801097c:	3420      	movi      	r4, 32
 801097e:	6136      	subu      	r4, r13
 8010980:	e904000b 	bez      	r4, 0x8010996	// 8010996 <__umoddi3+0x4e>
 8010984:	7050      	lsl      	r1, r4
 8010986:	c5a0404d 	lsr      	r13, r0, r13
 801098a:	c4824025 	lsl      	r5, r2, r4
 801098e:	c42d242c 	or      	r12, r13, r1
 8010992:	c4804026 	lsl      	r6, r0, r4
 8010996:	c605484d 	lsri      	r13, r5, 16
 801099a:	c5ac8021 	divu      	r1, r12, r13
 801099e:	c5a18422 	mult      	r2, r1, r13
 80109a2:	c40555e0 	zext      	r0, r5, 15, 0
 80109a6:	c44c0082 	subu      	r2, r12, r2
 80109aa:	c4208423 	mult      	r3, r0, r1
 80109ae:	4250      	lsli      	r2, r2, 16
 80109b0:	4e30      	lsri      	r1, r6, 16
 80109b2:	6c48      	or      	r1, r2
 80109b4:	64c4      	cmphs      	r1, r3
 80109b6:	0808      	bt      	0x80109c6	// 80109c6 <__umoddi3+0x7e>
 80109b8:	6054      	addu      	r1, r5
 80109ba:	6544      	cmphs      	r1, r5
 80109bc:	0c05      	bf      	0x80109c6	// 80109c6 <__umoddi3+0x7e>
 80109be:	5954      	addu      	r2, r1, r5
 80109c0:	64c4      	cmphs      	r1, r3
 80109c2:	c4220c20 	incf      	r1, r2, 0
 80109c6:	604e      	subu      	r1, r3
 80109c8:	c5a18023 	divu      	r3, r1, r13
 80109cc:	7f4c      	mult      	r13, r3
 80109ce:	6076      	subu      	r1, r13
 80109d0:	7c0c      	mult      	r0, r3
 80109d2:	4130      	lsli      	r1, r1, 16
 80109d4:	c40655e3 	zext      	r3, r6, 15, 0
 80109d8:	6cc4      	or      	r3, r1
 80109da:	640c      	cmphs      	r3, r0
 80109dc:	0c69      	bf      	0x8010aae	// 8010aae <__umoddi3+0x166>
 80109de:	5b01      	subu      	r0, r3, r0
 80109e0:	7011      	lsr      	r0, r4
 80109e2:	3100      	movi      	r1, 0
 80109e4:	1486      	pop      	r4-r9
 80109e6:	64c4      	cmphs      	r1, r3
 80109e8:	0ffe      	bf      	0x80109e4	// 80109e4 <__umoddi3+0x9c>
 80109ea:	eb03ffff 	cmphsi      	r3, 65536
 80109ee:	0c6b      	bf      	0x8010ac4	// 8010ac4 <__umoddi3+0x17c>
 80109f0:	c6e0502d 	bmaski      	r13, 24
 80109f4:	64f4      	cmphs      	r13, r3
 80109f6:	3518      	movi      	r5, 24
 80109f8:	ea0d0010 	movi      	r13, 16
 80109fc:	c5a50c20 	incf      	r13, r5, 0
 8010a00:	03a5      	lrw      	r5, 0x8013364	// 8010c68 <__umoddi3+0x320>
 8010a02:	c5a34044 	lsr      	r4, r3, r13
 8010a06:	d0850025 	ldr.b      	r5, (r5, r4 << 0)
 8010a0a:	6174      	addu      	r5, r13
 8010a0c:	3420      	movi      	r4, 32
 8010a0e:	6116      	subu      	r4, r5
 8010a10:	e924006d 	bnez      	r4, 0x8010aea	// 8010aea <__umoddi3+0x1a2>
 8010a14:	644c      	cmphs      	r3, r1
 8010a16:	0c03      	bf      	0x8010a1c	// 8010a1c <__umoddi3+0xd4>
 8010a18:	6480      	cmphs      	r0, r2
 8010a1a:	0d20      	bf      	0x8010c5a	// 8010c5a <__umoddi3+0x312>
 8010a1c:	5889      	subu      	r4, r0, r2
 8010a1e:	6500      	cmphs      	r0, r4
 8010a20:	c461008c 	subu      	r12, r1, r3
 8010a24:	6443      	mvcv      	r1
 8010a26:	6306      	subu      	r12, r1
 8010a28:	6c13      	mov      	r0, r4
 8010a2a:	6c73      	mov      	r1, r12
 8010a2c:	1486      	pop      	r4-r9
 8010a2e:	e9220005 	bnez      	r2, 0x8010a38	// 8010a38 <__umoddi3+0xf0>
 8010a32:	3501      	movi      	r5, 1
 8010a34:	c4458025 	divu      	r5, r5, r2
 8010a38:	eb05ffff 	cmphsi      	r5, 65536
 8010a3c:	0c4b      	bf      	0x8010ad2	// 8010ad2 <__umoddi3+0x18a>
 8010a3e:	c6e05023 	bmaski      	r3, 24
 8010a42:	654c      	cmphs      	r3, r5
 8010a44:	ea0d0018 	movi      	r13, 24
 8010a48:	3310      	movi      	r3, 16
 8010a4a:	c5a30c40 	inct      	r13, r3, 0
 8010a4e:	0358      	lrw      	r2, 0x8013364	// 8010c68 <__umoddi3+0x320>
 8010a50:	c5a54043 	lsr      	r3, r5, r13
 8010a54:	d0620023 	ldr.b      	r3, (r2, r3 << 0)
 8010a58:	634c      	addu      	r13, r3
 8010a5a:	3420      	movi      	r4, 32
 8010a5c:	6136      	subu      	r4, r13
 8010a5e:	e92400af 	bnez      	r4, 0x8010bbc	// 8010bbc <__umoddi3+0x274>
 8010a62:	c4a1008c 	subu      	r12, r1, r5
 8010a66:	4df0      	lsri      	r7, r5, 16
 8010a68:	c40555e2 	zext      	r2, r5, 15, 0
 8010a6c:	c4ec8021 	divu      	r1, r12, r7
 8010a70:	c4e18423 	mult      	r3, r1, r7
 8010a74:	630e      	subu      	r12, r3
 8010a76:	c60c482c 	lsli      	r12, r12, 16
 8010a7a:	c4418423 	mult      	r3, r1, r2
 8010a7e:	4e30      	lsri      	r1, r6, 16
 8010a80:	6c70      	or      	r1, r12
 8010a82:	64c4      	cmphs      	r1, r3
 8010a84:	0808      	bt      	0x8010a94	// 8010a94 <__umoddi3+0x14c>
 8010a86:	6054      	addu      	r1, r5
 8010a88:	6544      	cmphs      	r1, r5
 8010a8a:	0c05      	bf      	0x8010a94	// 8010a94 <__umoddi3+0x14c>
 8010a8c:	5914      	addu      	r0, r1, r5
 8010a8e:	64c4      	cmphs      	r1, r3
 8010a90:	c4200c20 	incf      	r1, r0, 0
 8010a94:	604e      	subu      	r1, r3
 8010a96:	c4e18020 	divu      	r0, r1, r7
 8010a9a:	7dc0      	mult      	r7, r0
 8010a9c:	605e      	subu      	r1, r7
 8010a9e:	4130      	lsli      	r1, r1, 16
 8010aa0:	c40655e6 	zext      	r6, r6, 15, 0
 8010aa4:	7c08      	mult      	r0, r2
 8010aa6:	c4c12423 	or      	r3, r1, r6
 8010aaa:	640c      	cmphs      	r3, r0
 8010aac:	0808      	bt      	0x8010abc	// 8010abc <__umoddi3+0x174>
 8010aae:	60d4      	addu      	r3, r5
 8010ab0:	654c      	cmphs      	r3, r5
 8010ab2:	0c05      	bf      	0x8010abc	// 8010abc <__umoddi3+0x174>
 8010ab4:	614c      	addu      	r5, r3
 8010ab6:	640c      	cmphs      	r3, r0
 8010ab8:	c4650c20 	incf      	r3, r5, 0
 8010abc:	5b01      	subu      	r0, r3, r0
 8010abe:	7011      	lsr      	r0, r4
 8010ac0:	3100      	movi      	r1, 0
 8010ac2:	1486      	pop      	r4-r9
 8010ac4:	eb0300ff 	cmphsi      	r3, 256
 8010ac8:	c4000505 	mvc      	r5
 8010acc:	c465482d 	lsli      	r13, r5, 3
 8010ad0:	0798      	br      	0x8010a00	// 8010a00 <__umoddi3+0xb8>
 8010ad2:	eb0500ff 	cmphsi      	r5, 256
 8010ad6:	3308      	movi      	r3, 8
 8010ad8:	c5a30c40 	inct      	r13, r3, 0
 8010adc:	07b9      	br      	0x8010a4e	// 8010a4e <__umoddi3+0x106>
 8010ade:	eb0200ff 	cmphsi      	r2, 256
 8010ae2:	3308      	movi      	r3, 8
 8010ae4:	c5a30c40 	inct      	r13, r3, 0
 8010ae8:	0744      	br      	0x8010970	// 8010970 <__umoddi3+0x28>
 8010aea:	70d0      	lsl      	r3, r4
 8010aec:	c4a24047 	lsr      	r7, r2, r5
 8010af0:	6dcc      	or      	r7, r3
 8010af2:	c4a14046 	lsr      	r6, r1, r5
 8010af6:	c481402c 	lsl      	r12, r1, r4
 8010afa:	c4a04041 	lsr      	r1, r0, r5
 8010afe:	6c70      	or      	r1, r12
 8010b00:	c607484c 	lsri      	r12, r7, 16
 8010b04:	c5868028 	divu      	r8, r6, r12
 8010b08:	c4824023 	lsl      	r3, r2, r4
 8010b0c:	c5888422 	mult      	r2, r8, r12
 8010b10:	618a      	subu      	r6, r2
 8010b12:	c40755ed 	zext      	r13, r7, 15, 0
 8010b16:	46d0      	lsli      	r6, r6, 16
 8010b18:	4950      	lsri      	r2, r1, 16
 8010b1a:	c50d8429 	mult      	r9, r13, r8
 8010b1e:	6c98      	or      	r2, r6
 8010b20:	6648      	cmphs      	r2, r9
 8010b22:	7010      	lsl      	r0, r4
 8010b24:	0807      	bt      	0x8010b32	// 8010b32 <__umoddi3+0x1ea>
 8010b26:	609c      	addu      	r2, r7
 8010b28:	65c8      	cmphs      	r2, r7
 8010b2a:	e4c81000 	subi      	r6, r8, 1
 8010b2e:	088a      	bt      	0x8010c42	// 8010c42 <__umoddi3+0x2fa>
 8010b30:	6e1b      	mov      	r8, r6
 8010b32:	60a6      	subu      	r2, r9
 8010b34:	c5828026 	divu      	r6, r2, r12
 8010b38:	7f18      	mult      	r12, r6
 8010b3a:	60b2      	subu      	r2, r12
 8010b3c:	4250      	lsli      	r2, r2, 16
 8010b3e:	c40155e1 	zext      	r1, r1, 15, 0
 8010b42:	7f58      	mult      	r13, r6
 8010b44:	6c48      	or      	r1, r2
 8010b46:	6744      	cmphs      	r1, r13
 8010b48:	0806      	bt      	0x8010b54	// 8010b54 <__umoddi3+0x20c>
 8010b4a:	605c      	addu      	r1, r7
 8010b4c:	65c4      	cmphs      	r1, r7
 8010b4e:	5e43      	subi      	r2, r6, 1
 8010b50:	0874      	bt      	0x8010c38	// 8010c38 <__umoddi3+0x2f0>
 8010b52:	6d8b      	mov      	r6, r2
 8010b54:	c6084822 	lsli      	r2, r8, 16
 8010b58:	6c98      	or      	r2, r6
 8010b5a:	c40255e8 	zext      	r8, r2, 15, 0
 8010b5e:	c603484c 	lsri      	r12, r3, 16
 8010b62:	4a50      	lsri      	r2, r2, 16
 8010b64:	c5a1008d 	subu      	r13, r1, r13
 8010b68:	c40355e1 	zext      	r1, r3, 15, 0
 8010b6c:	c4288426 	mult      	r6, r8, r1
 8010b70:	7c48      	mult      	r1, r2
 8010b72:	7e30      	mult      	r8, r12
 8010b74:	7cb0      	mult      	r2, r12
 8010b76:	6204      	addu      	r8, r1
 8010b78:	c606484c 	lsri      	r12, r6, 16
 8010b7c:	6320      	addu      	r12, r8
 8010b7e:	6470      	cmphs      	r12, r1
 8010b80:	0804      	bt      	0x8010b88	// 8010b88 <__umoddi3+0x240>
 8010b82:	ea210001 	movih      	r1, 1
 8010b86:	6084      	addu      	r2, r1
 8010b88:	c60c4841 	lsri      	r1, r12, 16
 8010b8c:	6048      	addu      	r1, r2
 8010b8e:	6474      	cmphs      	r13, r1
 8010b90:	c60c482c 	lsli      	r12, r12, 16
 8010b94:	c40655e6 	zext      	r6, r6, 15, 0
 8010b98:	6318      	addu      	r12, r6
 8010b9a:	0c46      	bf      	0x8010c26	// 8010c26 <__umoddi3+0x2de>
 8010b9c:	6476      	cmpne      	r13, r1
 8010b9e:	0c60      	bf      	0x8010c5e	// 8010c5e <__umoddi3+0x316>
 8010ba0:	c42d0081 	subu      	r1, r13, r1
 8010ba4:	6cf3      	mov      	r3, r12
 8010ba6:	586d      	subu      	r3, r0, r3
 8010ba8:	64c0      	cmphs      	r0, r3
 8010baa:	6743      	mvcv      	r13
 8010bac:	6076      	subu      	r1, r13
 8010bae:	c4a14025 	lsl      	r5, r1, r5
 8010bb2:	c4834040 	lsr      	r0, r3, r4
 8010bb6:	6c14      	or      	r0, r5
 8010bb8:	7051      	lsr      	r1, r4
 8010bba:	1486      	pop      	r4-r9
 8010bbc:	7150      	lsl      	r5, r4
 8010bbe:	c5a14048 	lsr      	r8, r1, r13
 8010bc2:	4df0      	lsri      	r7, r5, 16
 8010bc4:	c5a0404d 	lsr      	r13, r0, r13
 8010bc8:	7050      	lsl      	r1, r4
 8010bca:	6c74      	or      	r1, r13
 8010bcc:	c4e8802d 	divu      	r13, r8, r7
 8010bd0:	c4ed8423 	mult      	r3, r13, r7
 8010bd4:	c40555e2 	zext      	r2, r5, 15, 0
 8010bd8:	620e      	subu      	r8, r3
 8010bda:	c5a2842c 	mult      	r12, r2, r13
 8010bde:	c6084828 	lsli      	r8, r8, 16
 8010be2:	c601484d 	lsri      	r13, r1, 16
 8010be6:	6f60      	or      	r13, r8
 8010be8:	6734      	cmphs      	r13, r12
 8010bea:	c4804026 	lsl      	r6, r0, r4
 8010bee:	0804      	bt      	0x8010bf6	// 8010bf6 <__umoddi3+0x2ae>
 8010bf0:	6354      	addu      	r13, r5
 8010bf2:	6574      	cmphs      	r13, r5
 8010bf4:	082d      	bt      	0x8010c4e	// 8010c4e <__umoddi3+0x306>
 8010bf6:	6372      	subu      	r13, r12
 8010bf8:	c4ed8023 	divu      	r3, r13, r7
 8010bfc:	c4e3842c 	mult      	r12, r3, r7
 8010c00:	6372      	subu      	r13, r12
 8010c02:	c60d482c 	lsli      	r12, r13, 16
 8010c06:	c40155e1 	zext      	r1, r1, 15, 0
 8010c0a:	7cc8      	mult      	r3, r2
 8010c0c:	6f04      	or      	r12, r1
 8010c0e:	64f0      	cmphs      	r12, r3
 8010c10:	0809      	bt      	0x8010c22	// 8010c22 <__umoddi3+0x2da>
 8010c12:	6314      	addu      	r12, r5
 8010c14:	6570      	cmphs      	r12, r5
 8010c16:	0c06      	bf      	0x8010c22	// 8010c22 <__umoddi3+0x2da>
 8010c18:	c4ac0021 	addu      	r1, r12, r5
 8010c1c:	64f0      	cmphs      	r12, r3
 8010c1e:	c5810c20 	incf      	r12, r1, 0
 8010c22:	630e      	subu      	r12, r3
 8010c24:	0724      	br      	0x8010a6c	// 8010a6c <__umoddi3+0x124>
 8010c26:	c46c0083 	subu      	r3, r12, r3
 8010c2a:	64f0      	cmphs      	r12, r3
 8010c2c:	605e      	subu      	r1, r7
 8010c2e:	65c3      	mvcv      	r7
 8010c30:	605e      	subu      	r1, r7
 8010c32:	c42d0081 	subu      	r1, r13, r1
 8010c36:	07b8      	br      	0x8010ba6	// 8010ba6 <__umoddi3+0x25e>
 8010c38:	6744      	cmphs      	r1, r13
 8010c3a:	0b8c      	bt      	0x8010b52	// 8010b52 <__umoddi3+0x20a>
 8010c3c:	2e01      	subi      	r6, 2
 8010c3e:	605c      	addu      	r1, r7
 8010c40:	078a      	br      	0x8010b54	// 8010b54 <__umoddi3+0x20c>
 8010c42:	6648      	cmphs      	r2, r9
 8010c44:	0b76      	bt      	0x8010b30	// 8010b30 <__umoddi3+0x1e8>
 8010c46:	e5081001 	subi      	r8, r8, 2
 8010c4a:	609c      	addu      	r2, r7
 8010c4c:	0773      	br      	0x8010b32	// 8010b32 <__umoddi3+0x1ea>
 8010c4e:	c4ad0023 	addu      	r3, r13, r5
 8010c52:	6734      	cmphs      	r13, r12
 8010c54:	c5a30c20 	incf      	r13, r3, 0
 8010c58:	07cf      	br      	0x8010bf6	// 8010bf6 <__umoddi3+0x2ae>
 8010c5a:	6d03      	mov      	r4, r0
 8010c5c:	06e6      	br      	0x8010a28	// 8010a28 <__umoddi3+0xe0>
 8010c5e:	6700      	cmphs      	r0, r12
 8010c60:	0fe3      	bf      	0x8010c26	// 8010c26 <__umoddi3+0x2de>
 8010c62:	6cf3      	mov      	r3, r12
 8010c64:	3100      	movi      	r1, 0
 8010c66:	07a0      	br      	0x8010ba6	// 8010ba6 <__umoddi3+0x25e>
 8010c68:	08013364 	.long	0x08013364

08010c6c <_fpadd_parts>:
 8010c6c:	14c8      	push      	r4-r11
 8010c6e:	1423      	subi      	r14, r14, 12
 8010c70:	9060      	ld.w      	r3, (r0, 0x0)
 8010c72:	3501      	movi      	r5, 1
 8010c74:	64d4      	cmphs      	r5, r3
 8010c76:	0871      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010c78:	d9812000 	ld.w      	r12, (r1, 0x0)
 8010c7c:	6714      	cmphs      	r5, r12
 8010c7e:	086f      	bt      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c80:	3b44      	cmpnei      	r3, 4
 8010c82:	0cef      	bf      	0x8010e60	// 8010e60 <_fpadd_parts+0x1f4>
 8010c84:	eb4c0004 	cmpnei      	r12, 4
 8010c88:	0c6a      	bf      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c8a:	eb4c0002 	cmpnei      	r12, 2
 8010c8e:	0cc7      	bf      	0x8010e1c	// 8010e1c <_fpadd_parts+0x1b0>
 8010c90:	3b42      	cmpnei      	r3, 2
 8010c92:	0c65      	bf      	0x8010d5c	// 8010d5c <_fpadd_parts+0xf0>
 8010c94:	9062      	ld.w      	r3, (r0, 0x8)
 8010c96:	d9812002 	ld.w      	r12, (r1, 0x8)
 8010c9a:	c583008d 	subu      	r13, r3, r12
 8010c9e:	c40d0208 	abs      	r8, r13
 8010ca2:	eb28003f 	cmplti      	r8, 64
 8010ca6:	90c3      	ld.w      	r6, (r0, 0xc)
 8010ca8:	90e4      	ld.w      	r7, (r0, 0x10)
 8010caa:	b8c0      	st.w      	r6, (r14, 0x0)
 8010cac:	b8e1      	st.w      	r7, (r14, 0x4)
 8010cae:	d9412003 	ld.w      	r10, (r1, 0xc)
 8010cb2:	d9612004 	ld.w      	r11, (r1, 0x10)
 8010cb6:	0856      	bt      	0x8010d62	// 8010d62 <_fpadd_parts+0xf6>
 8010cb8:	64f1      	cmplt      	r12, r3
 8010cba:	0cc9      	bf      	0x8010e4c	// 8010e4c <_fpadd_parts+0x1e0>
 8010cbc:	ea0a0000 	movi      	r10, 0
 8010cc0:	ea0b0000 	movi      	r11, 0
 8010cc4:	9001      	ld.w      	r0, (r0, 0x4)
 8010cc6:	9121      	ld.w      	r1, (r1, 0x4)
 8010cc8:	6442      	cmpne      	r0, r1
 8010cca:	0c82      	bf      	0x8010dce	// 8010dce <_fpadd_parts+0x162>
 8010ccc:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010cd0:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010cd4:	e90000b8 	bez      	r0, 0x8010e44	// 8010e44 <_fpadd_parts+0x1d8>
 8010cd8:	6730      	cmphs      	r12, r12
 8010cda:	c58a010c 	subc      	r12, r10, r12
 8010cde:	c5ab010d 	subc      	r13, r11, r13
 8010ce2:	e98d00c9 	blz      	r13, 0x8010e74	// 8010e74 <_fpadd_parts+0x208>
 8010ce6:	3100      	movi      	r1, 0
 8010ce8:	b221      	st.w      	r1, (r2, 0x4)
 8010cea:	b262      	st.w      	r3, (r2, 0x8)
 8010cec:	dd822003 	st.w      	r12, (r2, 0xc)
 8010cf0:	dda22004 	st.w      	r13, (r2, 0x10)
 8010cf4:	6c33      	mov      	r0, r12
 8010cf6:	6c77      	mov      	r1, r13
 8010cf8:	3840      	cmpnei      	r0, 0
 8010cfa:	c4210c81 	decf      	r1, r1, 1
 8010cfe:	2800      	subi      	r0, 1
 8010d00:	c7605023 	bmaski      	r3, 28
 8010d04:	644c      	cmphs      	r3, r1
 8010d06:	0c71      	bf      	0x8010de8	// 8010de8 <_fpadd_parts+0x17c>
 8010d08:	64c6      	cmpne      	r1, r3
 8010d0a:	0d0d      	bf      	0x8010f24	// 8010f24 <_fpadd_parts+0x2b8>
 8010d0c:	9262      	ld.w      	r3, (r2, 0x8)
 8010d0e:	3600      	movi      	r6, 0
 8010d10:	3700      	movi      	r7, 0
 8010d12:	ea0a0000 	movi      	r10, 0
 8010d16:	2b00      	subi      	r3, 1
 8010d18:	2e00      	subi      	r6, 1
 8010d1a:	2f00      	subi      	r7, 1
 8010d1c:	c7605028 	bmaski      	r8, 28
 8010d20:	e54a1001 	subi      	r10, r10, 2
 8010d24:	0403      	br      	0x8010d2a	// 8010d2a <_fpadd_parts+0xbe>
 8010d26:	6606      	cmpne      	r1, r8
 8010d28:	0c8b      	bf      	0x8010e3e	// 8010e3e <_fpadd_parts+0x1d2>
 8010d2a:	6511      	cmplt      	r4, r4
 8010d2c:	c58c0044 	addc      	r4, r12, r12
 8010d30:	c5ad0045 	addc      	r5, r13, r13
 8010d34:	6401      	cmplt      	r0, r0
 8010d36:	c4c40040 	addc      	r0, r4, r6
 8010d3a:	c4e50041 	addc      	r1, r5, r7
 8010d3e:	6460      	cmphs      	r8, r1
 8010d40:	6e4f      	mov      	r9, r3
 8010d42:	6f13      	mov      	r12, r4
 8010d44:	6f57      	mov      	r13, r5
 8010d46:	2b00      	subi      	r3, 1
 8010d48:	0bef      	bt      	0x8010d26	// 8010d26 <_fpadd_parts+0xba>
 8010d4a:	3303      	movi      	r3, 3
 8010d4c:	b283      	st.w      	r4, (r2, 0xc)
 8010d4e:	b2a4      	st.w      	r5, (r2, 0x10)
 8010d50:	dd222002 	st.w      	r9, (r2, 0x8)
 8010d54:	b260      	st.w      	r3, (r2, 0x0)
 8010d56:	6c0b      	mov      	r0, r2
 8010d58:	1403      	addi      	r14, r14, 12
 8010d5a:	1488      	pop      	r4-r11
 8010d5c:	6c07      	mov      	r0, r1
 8010d5e:	1403      	addi      	r14, r14, 12
 8010d60:	1488      	pop      	r4-r11
 8010d62:	e96d009a 	blsz      	r13, 0x8010e96	// 8010e96 <_fpadd_parts+0x22a>
 8010d66:	ea0d001f 	movi      	r13, 31
 8010d6a:	c42b4826 	lsli      	r6, r11, 1
 8010d6e:	6362      	subu      	r13, r8
 8010d70:	e588101f 	subi      	r12, r8, 32
 8010d74:	c5a6402d 	lsl      	r13, r6, r13
 8010d78:	c50a4046 	lsr      	r6, r10, r8
 8010d7c:	c7ec2880 	btsti      	r12, 31
 8010d80:	c58b4049 	lsr      	r9, r11, r12
 8010d84:	3400      	movi      	r4, 0
 8010d86:	6db4      	or      	r6, r13
 8010d88:	c4c90c20 	incf      	r6, r9, 0
 8010d8c:	6f53      	mov      	r13, r4
 8010d8e:	c5854029 	lsl      	r9, r5, r12
 8010d92:	c505402c 	lsl      	r12, r5, r8
 8010d96:	c50b4047 	lsr      	r7, r11, r8
 8010d9a:	c5a90c20 	incf      	r13, r9, 0
 8010d9e:	c5840c20 	incf      	r12, r4, 0
 8010da2:	c4e40c20 	incf      	r7, r4, 0
 8010da6:	eb4c0000 	cmpnei      	r12, 0
 8010daa:	c5ad0c81 	decf      	r13, r13, 1
 8010dae:	e58c1000 	subi      	r12, r12, 1
 8010db2:	6b28      	and      	r12, r10
 8010db4:	6b6c      	and      	r13, r11
 8010db6:	6f34      	or      	r12, r13
 8010db8:	eb4c0000 	cmpnei      	r12, 0
 8010dbc:	9001      	ld.w      	r0, (r0, 0x4)
 8010dbe:	9121      	ld.w      	r1, (r1, 0x4)
 8010dc0:	c400050a 	mvc      	r10
 8010dc4:	6442      	cmpne      	r0, r1
 8010dc6:	6ed3      	mov      	r11, r4
 8010dc8:	6e98      	or      	r10, r6
 8010dca:	6edc      	or      	r11, r7
 8010dcc:	0b80      	bt      	0x8010ccc	// 8010ccc <_fpadd_parts+0x60>
 8010dce:	d98e2000 	ld.w      	r12, (r14, 0x0)
 8010dd2:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010dd6:	6731      	cmplt      	r12, r12
 8010dd8:	6329      	addc      	r12, r10
 8010dda:	636d      	addc      	r13, r11
 8010ddc:	b201      	st.w      	r0, (r2, 0x4)
 8010dde:	b262      	st.w      	r3, (r2, 0x8)
 8010de0:	dd822003 	st.w      	r12, (r2, 0xc)
 8010de4:	dda22004 	st.w      	r13, (r2, 0x10)
 8010de8:	3303      	movi      	r3, 3
 8010dea:	b260      	st.w      	r3, (r2, 0x0)
 8010dec:	c7805023 	bmaski      	r3, 29
 8010df0:	674c      	cmphs      	r3, r13
 8010df2:	0812      	bt      	0x8010e16	// 8010e16 <_fpadd_parts+0x1aa>
 8010df4:	c7ed4823 	lsli      	r3, r13, 31
 8010df8:	c42c4840 	lsri      	r0, r12, 1
 8010dfc:	6c0c      	or      	r0, r3
 8010dfe:	c42d4841 	lsri      	r1, r13, 1
 8010e02:	9262      	ld.w      	r3, (r2, 0x8)
 8010e04:	e48c2001 	andi      	r4, r12, 1
 8010e08:	3500      	movi      	r5, 0
 8010e0a:	6c10      	or      	r0, r4
 8010e0c:	6c54      	or      	r1, r5
 8010e0e:	2300      	addi      	r3, 1
 8010e10:	b203      	st.w      	r0, (r2, 0xc)
 8010e12:	b224      	st.w      	r1, (r2, 0x10)
 8010e14:	b262      	st.w      	r3, (r2, 0x8)
 8010e16:	6c0b      	mov      	r0, r2
 8010e18:	1403      	addi      	r14, r14, 12
 8010e1a:	1488      	pop      	r4-r11
 8010e1c:	3b42      	cmpnei      	r3, 2
 8010e1e:	0b9d      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e20:	b260      	st.w      	r3, (r2, 0x0)
 8010e22:	9061      	ld.w      	r3, (r0, 0x4)
 8010e24:	b261      	st.w      	r3, (r2, 0x4)
 8010e26:	9062      	ld.w      	r3, (r0, 0x8)
 8010e28:	b262      	st.w      	r3, (r2, 0x8)
 8010e2a:	9063      	ld.w      	r3, (r0, 0xc)
 8010e2c:	b263      	st.w      	r3, (r2, 0xc)
 8010e2e:	9064      	ld.w      	r3, (r0, 0x10)
 8010e30:	9121      	ld.w      	r1, (r1, 0x4)
 8010e32:	b264      	st.w      	r3, (r2, 0x10)
 8010e34:	9061      	ld.w      	r3, (r0, 0x4)
 8010e36:	68c4      	and      	r3, r1
 8010e38:	b261      	st.w      	r3, (r2, 0x4)
 8010e3a:	6c0b      	mov      	r0, r2
 8010e3c:	078e      	br      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e3e:	6428      	cmphs      	r10, r0
 8010e40:	0b75      	bt      	0x8010d2a	// 8010d2a <_fpadd_parts+0xbe>
 8010e42:	0784      	br      	0x8010d4a	// 8010d4a <_fpadd_parts+0xde>
 8010e44:	6730      	cmphs      	r12, r12
 8010e46:	632b      	subc      	r12, r10
 8010e48:	636f      	subc      	r13, r11
 8010e4a:	074c      	br      	0x8010ce2	// 8010ce2 <_fpadd_parts+0x76>
 8010e4c:	6cf3      	mov      	r3, r12
 8010e4e:	ea0d0000 	movi      	r13, 0
 8010e52:	ea0c0000 	movi      	r12, 0
 8010e56:	dd8e2000 	st.w      	r12, (r14, 0x0)
 8010e5a:	ddae2001 	st.w      	r13, (r14, 0x4)
 8010e5e:	0733      	br      	0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010e60:	eb4c0004 	cmpnei      	r12, 4
 8010e64:	0b7a      	bt      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e66:	9041      	ld.w      	r2, (r0, 0x4)
 8010e68:	9161      	ld.w      	r3, (r1, 0x4)
 8010e6a:	64ca      	cmpne      	r2, r3
 8010e6c:	124b      	lrw      	r2, 0x8013350	// 8010f98 <__subdf3+0x38>
 8010e6e:	c4020c40 	inct      	r0, r2, 0
 8010e72:	0773      	br      	0x8010d58	// 8010d58 <_fpadd_parts+0xec>
 8010e74:	ea0a0000 	movi      	r10, 0
 8010e78:	ea0b0000 	movi      	r11, 0
 8010e7c:	3101      	movi      	r1, 1
 8010e7e:	6730      	cmphs      	r12, r12
 8010e80:	c58a010c 	subc      	r12, r10, r12
 8010e84:	c5ab010d 	subc      	r13, r11, r13
 8010e88:	b221      	st.w      	r1, (r2, 0x4)
 8010e8a:	b262      	st.w      	r3, (r2, 0x8)
 8010e8c:	dd822003 	st.w      	r12, (r2, 0xc)
 8010e90:	dda22004 	st.w      	r13, (r2, 0x10)
 8010e94:	0730      	br      	0x8010cf4	// 8010cf4 <_fpadd_parts+0x88>
 8010e96:	e90dff17 	bez      	r13, 0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010e9a:	98c0      	ld.w      	r6, (r14, 0x0)
 8010e9c:	98e1      	ld.w      	r7, (r14, 0x4)
 8010e9e:	ea0d001f 	movi      	r13, 31
 8010ea2:	47c1      	lsli      	r6, r7, 1
 8010ea4:	6362      	subu      	r13, r8
 8010ea6:	c5a6402d 	lsl      	r13, r6, r13
 8010eaa:	ddae2002 	st.w      	r13, (r14, 0x8)
 8010eae:	d9ae2000 	ld.w      	r13, (r14, 0x0)
 8010eb2:	e588101f 	subi      	r12, r8, 32
 8010eb6:	c50d4046 	lsr      	r6, r13, r8
 8010eba:	d9ae2002 	ld.w      	r13, (r14, 0x8)
 8010ebe:	c7ec2880 	btsti      	r12, 31
 8010ec2:	3400      	movi      	r4, 0
 8010ec4:	c5874049 	lsr      	r9, r7, r12
 8010ec8:	6db4      	or      	r6, r13
 8010eca:	d9ae2001 	ld.w      	r13, (r14, 0x4)
 8010ece:	c4c90c20 	incf      	r6, r9, 0
 8010ed2:	c50d4047 	lsr      	r7, r13, r8
 8010ed6:	c5854029 	lsl      	r9, r5, r12
 8010eda:	6f53      	mov      	r13, r4
 8010edc:	c505402c 	lsl      	r12, r5, r8
 8010ee0:	c5a90c20 	incf      	r13, r9, 0
 8010ee4:	c5840c20 	incf      	r12, r4, 0
 8010ee8:	c4e40c20 	incf      	r7, r4, 0
 8010eec:	60e0      	addu      	r3, r8
 8010eee:	eb4c0000 	cmpnei      	r12, 0
 8010ef2:	c5ad0c81 	decf      	r13, r13, 1
 8010ef6:	e58c1000 	subi      	r12, r12, 1
 8010efa:	d90e2000 	ld.w      	r8, (r14, 0x0)
 8010efe:	d92e2001 	ld.w      	r9, (r14, 0x4)
 8010f02:	6a30      	and      	r8, r12
 8010f04:	6a74      	and      	r9, r13
 8010f06:	6f23      	mov      	r12, r8
 8010f08:	6f67      	mov      	r13, r9
 8010f0a:	6f34      	or      	r12, r13
 8010f0c:	eb4c0000 	cmpnei      	r12, 0
 8010f10:	c400050c 	mvc      	r12
 8010f14:	6f53      	mov      	r13, r4
 8010f16:	c5862424 	or      	r4, r6, r12
 8010f1a:	c5a72425 	or      	r5, r7, r13
 8010f1e:	b880      	st.w      	r4, (r14, 0x0)
 8010f20:	b8a1      	st.w      	r5, (r14, 0x4)
 8010f22:	06d1      	br      	0x8010cc4	// 8010cc4 <_fpadd_parts+0x58>
 8010f24:	3300      	movi      	r3, 0
 8010f26:	2b01      	subi      	r3, 2
 8010f28:	640c      	cmphs      	r3, r0
 8010f2a:	0af1      	bt      	0x8010d0c	// 8010d0c <_fpadd_parts+0xa0>
 8010f2c:	075e      	br      	0x8010de8	// 8010de8 <_fpadd_parts+0x17c>
	...

08010f30 <__adddf3>:
 8010f30:	14d2      	push      	r4-r5, r15
 8010f32:	1433      	subi      	r14, r14, 76
 8010f34:	b800      	st.w      	r0, (r14, 0x0)
 8010f36:	b821      	st.w      	r1, (r14, 0x4)
 8010f38:	6c3b      	mov      	r0, r14
 8010f3a:	6d47      	mov      	r5, r1
 8010f3c:	1904      	addi      	r1, r14, 16
 8010f3e:	b863      	st.w      	r3, (r14, 0xc)
 8010f40:	b842      	st.w      	r2, (r14, 0x8)
 8010f42:	e00003b7 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f46:	1909      	addi      	r1, r14, 36
 8010f48:	1802      	addi      	r0, r14, 8
 8010f4a:	e00003b3 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f4e:	1a0e      	addi      	r2, r14, 56
 8010f50:	1909      	addi      	r1, r14, 36
 8010f52:	1804      	addi      	r0, r14, 16
 8010f54:	e3fffe8c 	bsr      	0x8010c6c	// 8010c6c <_fpadd_parts>
 8010f58:	e00002e4 	bsr      	0x8011520	// 8011520 <__pack_d>
 8010f5c:	1413      	addi      	r14, r14, 76
 8010f5e:	1492      	pop      	r4-r5, r15

08010f60 <__subdf3>:
 8010f60:	14d2      	push      	r4-r5, r15
 8010f62:	1433      	subi      	r14, r14, 76
 8010f64:	b800      	st.w      	r0, (r14, 0x0)
 8010f66:	b821      	st.w      	r1, (r14, 0x4)
 8010f68:	6c3b      	mov      	r0, r14
 8010f6a:	6d47      	mov      	r5, r1
 8010f6c:	1904      	addi      	r1, r14, 16
 8010f6e:	b842      	st.w      	r2, (r14, 0x8)
 8010f70:	b863      	st.w      	r3, (r14, 0xc)
 8010f72:	e000039f 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f76:	1909      	addi      	r1, r14, 36
 8010f78:	1802      	addi      	r0, r14, 8
 8010f7a:	e000039b 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010f7e:	986a      	ld.w      	r3, (r14, 0x28)
 8010f80:	e4634001 	xori      	r3, r3, 1
 8010f84:	1a0e      	addi      	r2, r14, 56
 8010f86:	1909      	addi      	r1, r14, 36
 8010f88:	1804      	addi      	r0, r14, 16
 8010f8a:	b86a      	st.w      	r3, (r14, 0x28)
 8010f8c:	e3fffe70 	bsr      	0x8010c6c	// 8010c6c <_fpadd_parts>
 8010f90:	e00002c8 	bsr      	0x8011520	// 8011520 <__pack_d>
 8010f94:	1413      	addi      	r14, r14, 76
 8010f96:	1492      	pop      	r4-r5, r15
 8010f98:	08013350 	.long	0x08013350

08010f9c <__muldf3>:
 8010f9c:	14d8      	push      	r4-r11, r15
 8010f9e:	1436      	subi      	r14, r14, 88
 8010fa0:	b803      	st.w      	r0, (r14, 0xc)
 8010fa2:	b824      	st.w      	r1, (r14, 0x10)
 8010fa4:	1803      	addi      	r0, r14, 12
 8010fa6:	1907      	addi      	r1, r14, 28
 8010fa8:	b866      	st.w      	r3, (r14, 0x18)
 8010faa:	b845      	st.w      	r2, (r14, 0x14)
 8010fac:	e0000382 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010fb0:	190c      	addi      	r1, r14, 48
 8010fb2:	1805      	addi      	r0, r14, 20
 8010fb4:	e000037e 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8010fb8:	9867      	ld.w      	r3, (r14, 0x1c)
 8010fba:	3b01      	cmphsi      	r3, 2
 8010fbc:	0ca4      	bf      	0x8011104	// 8011104 <__muldf3+0x168>
 8010fbe:	984c      	ld.w      	r2, (r14, 0x30)
 8010fc0:	3a01      	cmphsi      	r2, 2
 8010fc2:	0c94      	bf      	0x80110ea	// 80110ea <__muldf3+0x14e>
 8010fc4:	3b44      	cmpnei      	r3, 4
 8010fc6:	0c9d      	bf      	0x8011100	// 8011100 <__muldf3+0x164>
 8010fc8:	3a44      	cmpnei      	r2, 4
 8010fca:	0c8e      	bf      	0x80110e6	// 80110e6 <__muldf3+0x14a>
 8010fcc:	3b42      	cmpnei      	r3, 2
 8010fce:	0c9b      	bf      	0x8011104	// 8011104 <__muldf3+0x168>
 8010fd0:	3a42      	cmpnei      	r2, 2
 8010fd2:	0c8c      	bf      	0x80110ea	// 80110ea <__muldf3+0x14e>
 8010fd4:	d98e200f 	ld.w      	r12, (r14, 0x3c)
 8010fd8:	d90e200a 	ld.w      	r8, (r14, 0x28)
 8010fdc:	3300      	movi      	r3, 0
 8010fde:	6c33      	mov      	r0, r12
 8010fe0:	6ca3      	mov      	r2, r8
 8010fe2:	6c4f      	mov      	r1, r3
 8010fe4:	dd8e2002 	st.w      	r12, (r14, 0x8)
 8010fe8:	d96e2010 	ld.w      	r11, (r14, 0x40)
 8010fec:	e0000274 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8010ff0:	3300      	movi      	r3, 0
 8010ff2:	6ca3      	mov      	r2, r8
 8010ff4:	6d83      	mov      	r6, r0
 8010ff6:	6dc7      	mov      	r7, r1
 8010ff8:	6c4f      	mov      	r1, r3
 8010ffa:	6c2f      	mov      	r0, r11
 8010ffc:	e000026c 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011000:	d94e200b 	ld.w      	r10, (r14, 0x2c)
 8011004:	3300      	movi      	r3, 0
 8011006:	6e03      	mov      	r8, r0
 8011008:	6e47      	mov      	r9, r1
 801100a:	6caf      	mov      	r2, r11
 801100c:	6c4f      	mov      	r1, r3
 801100e:	6c2b      	mov      	r0, r10
 8011010:	e0000262 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011014:	d98e2002 	ld.w      	r12, (r14, 0x8)
 8011018:	3300      	movi      	r3, 0
 801101a:	b800      	st.w      	r0, (r14, 0x0)
 801101c:	b821      	st.w      	r1, (r14, 0x4)
 801101e:	6cb3      	mov      	r2, r12
 8011020:	6c2b      	mov      	r0, r10
 8011022:	6c4f      	mov      	r1, r3
 8011024:	e0000258 	bsr      	0x80114d4	// 80114d4 <__muldi3>
 8011028:	6401      	cmplt      	r0, r0
 801102a:	6021      	addc      	r0, r8
 801102c:	6065      	addc      	r1, r9
 801102e:	6644      	cmphs      	r1, r9
 8011030:	0c80      	bf      	0x8011130	// 8011130 <__muldf3+0x194>
 8011032:	6466      	cmpne      	r9, r1
 8011034:	0c7c      	bf      	0x801112c	// 801112c <__muldf3+0x190>
 8011036:	ea080000 	movi      	r8, 0
 801103a:	ea090000 	movi      	r9, 0
 801103e:	3200      	movi      	r2, 0
 8011040:	6cc3      	mov      	r3, r0
 8011042:	6489      	cmplt      	r2, r2
 8011044:	6099      	addc      	r2, r6
 8011046:	60dd      	addc      	r3, r7
 8011048:	65cc      	cmphs      	r3, r7
 801104a:	0c6a      	bf      	0x801111e	// 801111e <__muldf3+0x182>
 801104c:	64de      	cmpne      	r7, r3
 801104e:	0c66      	bf      	0x801111a	// 801111a <__muldf3+0x17e>
 8011050:	6f07      	mov      	r12, r1
 8011052:	ea0d0000 	movi      	r13, 0
 8011056:	9800      	ld.w      	r0, (r14, 0x0)
 8011058:	9821      	ld.w      	r1, (r14, 0x4)
 801105a:	6401      	cmplt      	r0, r0
 801105c:	6031      	addc      	r0, r12
 801105e:	6075      	addc      	r1, r13
 8011060:	6621      	cmplt      	r8, r8
 8011062:	6201      	addc      	r8, r0
 8011064:	6245      	addc      	r9, r1
 8011066:	980e      	ld.w      	r0, (r14, 0x38)
 8011068:	9829      	ld.w      	r1, (r14, 0x24)
 801106a:	6040      	addu      	r1, r0
 801106c:	590e      	addi      	r0, r1, 4
 801106e:	b813      	st.w      	r0, (r14, 0x4c)
 8011070:	d98e2008 	ld.w      	r12, (r14, 0x20)
 8011074:	980d      	ld.w      	r0, (r14, 0x34)
 8011076:	6432      	cmpne      	r12, r0
 8011078:	c780502a 	bmaski      	r10, 29
 801107c:	c4000500 	mvc      	r0
 8011080:	6668      	cmphs      	r10, r9
 8011082:	b812      	st.w      	r0, (r14, 0x48)
 8011084:	086f      	bt      	0x8011162	// 8011162 <__muldf3+0x1c6>
 8011086:	2104      	addi      	r1, 5
 8011088:	ea0c0000 	movi      	r12, 0
 801108c:	ea2d8000 	movih      	r13, 32768
 8011090:	e4082001 	andi      	r0, r8, 1
 8011094:	6ec7      	mov      	r11, r1
 8011096:	e900000a 	bez      	r0, 0x80110aa	// 80110aa <__muldf3+0x10e>
 801109a:	431f      	lsli      	r0, r3, 31
 801109c:	4a81      	lsri      	r4, r2, 1
 801109e:	6d00      	or      	r4, r0
 80110a0:	4ba1      	lsri      	r5, r3, 1
 80110a2:	c5842422 	or      	r2, r4, r12
 80110a6:	c5a52423 	or      	r3, r5, r13
 80110aa:	c4294840 	lsri      	r0, r9, 1
 80110ae:	6428      	cmphs      	r10, r0
 80110b0:	c7e94827 	lsli      	r7, r9, 31
 80110b4:	c4284846 	lsri      	r6, r8, 1
 80110b8:	c4c72428 	or      	r8, r7, r6
 80110bc:	6e43      	mov      	r9, r0
 80110be:	2100      	addi      	r1, 1
 80110c0:	0fe8      	bf      	0x8011090	// 8011090 <__muldf3+0xf4>
 80110c2:	dd6e2013 	st.w      	r11, (r14, 0x4c)
 80110c6:	e42820ff 	andi      	r1, r8, 255
 80110ca:	eb410080 	cmpnei      	r1, 128
 80110ce:	0c36      	bf      	0x801113a	// 801113a <__muldf3+0x19e>
 80110d0:	3303      	movi      	r3, 3
 80110d2:	dd0e2014 	st.w      	r8, (r14, 0x50)
 80110d6:	dd2e2015 	st.w      	r9, (r14, 0x54)
 80110da:	b871      	st.w      	r3, (r14, 0x44)
 80110dc:	1811      	addi      	r0, r14, 68
 80110de:	e0000221 	bsr      	0x8011520	// 8011520 <__pack_d>
 80110e2:	1416      	addi      	r14, r14, 88
 80110e4:	1498      	pop      	r4-r11, r15
 80110e6:	3b42      	cmpnei      	r3, 2
 80110e8:	0c3b      	bf      	0x801115e	// 801115e <__muldf3+0x1c2>
 80110ea:	986d      	ld.w      	r3, (r14, 0x34)
 80110ec:	9848      	ld.w      	r2, (r14, 0x20)
 80110ee:	64ca      	cmpne      	r2, r3
 80110f0:	c4000503 	mvc      	r3
 80110f4:	180c      	addi      	r0, r14, 48
 80110f6:	b86d      	st.w      	r3, (r14, 0x34)
 80110f8:	e0000214 	bsr      	0x8011520	// 8011520 <__pack_d>
 80110fc:	1416      	addi      	r14, r14, 88
 80110fe:	1498      	pop      	r4-r11, r15
 8011100:	3a42      	cmpnei      	r2, 2
 8011102:	0c2e      	bf      	0x801115e	// 801115e <__muldf3+0x1c2>
 8011104:	9848      	ld.w      	r2, (r14, 0x20)
 8011106:	986d      	ld.w      	r3, (r14, 0x34)
 8011108:	64ca      	cmpne      	r2, r3
 801110a:	c4000503 	mvc      	r3
 801110e:	1807      	addi      	r0, r14, 28
 8011110:	b868      	st.w      	r3, (r14, 0x20)
 8011112:	e0000207 	bsr      	0x8011520	// 8011520 <__pack_d>
 8011116:	1416      	addi      	r14, r14, 88
 8011118:	1498      	pop      	r4-r11, r15
 801111a:	6588      	cmphs      	r2, r6
 801111c:	0b9a      	bt      	0x8011050	// 8011050 <__muldf3+0xb4>
 801111e:	e5080000 	addi      	r8, r8, 1
 8011122:	eb480000 	cmpnei      	r8, 0
 8011126:	c5290c21 	incf      	r9, r9, 1
 801112a:	0793      	br      	0x8011050	// 8011050 <__muldf3+0xb4>
 801112c:	6600      	cmphs      	r0, r8
 801112e:	0b84      	bt      	0x8011036	// 8011036 <__muldf3+0x9a>
 8011130:	ea080000 	movi      	r8, 0
 8011134:	ea090001 	movi      	r9, 1
 8011138:	0783      	br      	0x801103e	// 801103e <__muldf3+0xa2>
 801113a:	e4282100 	andi      	r1, r8, 256
 801113e:	e921ffc9 	bnez      	r1, 0x80110d0	// 80110d0 <__muldf3+0x134>
 8011142:	6c8c      	or      	r2, r3
 8011144:	e902ffc6 	bez      	r2, 0x80110d0	// 80110d0 <__muldf3+0x134>
 8011148:	3280      	movi      	r2, 128
 801114a:	3300      	movi      	r3, 0
 801114c:	3100      	movi      	r1, 0
 801114e:	6489      	cmplt      	r2, r2
 8011150:	60a1      	addc      	r2, r8
 8011152:	60e5      	addc      	r3, r9
 8011154:	29ff      	subi      	r1, 256
 8011156:	c4222028 	and      	r8, r2, r1
 801115a:	6e4f      	mov      	r9, r3
 801115c:	07ba      	br      	0x80110d0	// 80110d0 <__muldf3+0x134>
 801115e:	100f      	lrw      	r0, 0x8013350	// 8011198 <__muldf3+0x1fc>
 8011160:	07bf      	br      	0x80110de	// 80110de <__muldf3+0x142>
 8011162:	c760502c 	bmaski      	r12, 28
 8011166:	6670      	cmphs      	r12, r9
 8011168:	0faf      	bf      	0x80110c6	// 80110c6 <__muldf3+0x12a>
 801116a:	2102      	addi      	r1, 3
 801116c:	3401      	movi      	r4, 1
 801116e:	3500      	movi      	r5, 0
 8011170:	6da3      	mov      	r6, r8
 8011172:	6de7      	mov      	r7, r9
 8011174:	6c07      	mov      	r0, r1
 8011176:	6621      	cmplt      	r8, r8
 8011178:	6219      	addc      	r8, r6
 801117a:	625d      	addc      	r9, r7
 801117c:	e9a30004 	bhsz      	r3, 0x8011184	// 8011184 <__muldf3+0x1e8>
 8011180:	6e10      	or      	r8, r4
 8011182:	6e54      	or      	r9, r5
 8011184:	6d8b      	mov      	r6, r2
 8011186:	6dcf      	mov      	r7, r3
 8011188:	6489      	cmplt      	r2, r2
 801118a:	6099      	addc      	r2, r6
 801118c:	60dd      	addc      	r3, r7
 801118e:	6670      	cmphs      	r12, r9
 8011190:	2900      	subi      	r1, 1
 8011192:	0bef      	bt      	0x8011170	// 8011170 <__muldf3+0x1d4>
 8011194:	b813      	st.w      	r0, (r14, 0x4c)
 8011196:	0798      	br      	0x80110c6	// 80110c6 <__muldf3+0x12a>
 8011198:	08013350 	.long	0x08013350

0801119c <__divdf3>:
 801119c:	14d6      	push      	r4-r9, r15
 801119e:	142e      	subi      	r14, r14, 56
 80111a0:	b800      	st.w      	r0, (r14, 0x0)
 80111a2:	b821      	st.w      	r1, (r14, 0x4)
 80111a4:	6c3b      	mov      	r0, r14
 80111a6:	1904      	addi      	r1, r14, 16
 80111a8:	b863      	st.w      	r3, (r14, 0xc)
 80111aa:	b842      	st.w      	r2, (r14, 0x8)
 80111ac:	e0000282 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80111b0:	1909      	addi      	r1, r14, 36
 80111b2:	1802      	addi      	r0, r14, 8
 80111b4:	e000027e 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80111b8:	9864      	ld.w      	r3, (r14, 0x10)
 80111ba:	3b01      	cmphsi      	r3, 2
 80111bc:	0c51      	bf      	0x801125e	// 801125e <__divdf3+0xc2>
 80111be:	9829      	ld.w      	r1, (r14, 0x24)
 80111c0:	3201      	movi      	r2, 1
 80111c2:	6448      	cmphs      	r2, r1
 80111c4:	0873      	bt      	0x80112aa	// 80112aa <__divdf3+0x10e>
 80111c6:	9845      	ld.w      	r2, (r14, 0x14)
 80111c8:	980a      	ld.w      	r0, (r14, 0x28)
 80111ca:	3b44      	cmpnei      	r3, 4
 80111cc:	6c81      	xor      	r2, r0
 80111ce:	b845      	st.w      	r2, (r14, 0x14)
 80111d0:	0c4c      	bf      	0x8011268	// 8011268 <__divdf3+0xcc>
 80111d2:	3b42      	cmpnei      	r3, 2
 80111d4:	0c4a      	bf      	0x8011268	// 8011268 <__divdf3+0xcc>
 80111d6:	3944      	cmpnei      	r1, 4
 80111d8:	0c4c      	bf      	0x8011270	// 8011270 <__divdf3+0xd4>
 80111da:	3942      	cmpnei      	r1, 2
 80111dc:	0c63      	bf      	0x80112a2	// 80112a2 <__divdf3+0x106>
 80111de:	9807      	ld.w      	r0, (r14, 0x1c)
 80111e0:	9828      	ld.w      	r1, (r14, 0x20)
 80111e2:	98cc      	ld.w      	r6, (r14, 0x30)
 80111e4:	98ed      	ld.w      	r7, (r14, 0x34)
 80111e6:	9866      	ld.w      	r3, (r14, 0x18)
 80111e8:	984b      	ld.w      	r2, (r14, 0x2c)
 80111ea:	65c4      	cmphs      	r1, r7
 80111ec:	60ca      	subu      	r3, r2
 80111ee:	b866      	st.w      	r3, (r14, 0x18)
 80111f0:	0c05      	bf      	0x80111fa	// 80111fa <__divdf3+0x5e>
 80111f2:	645e      	cmpne      	r7, r1
 80111f4:	080a      	bt      	0x8011208	// 8011208 <__divdf3+0x6c>
 80111f6:	6580      	cmphs      	r0, r6
 80111f8:	0808      	bt      	0x8011208	// 8011208 <__divdf3+0x6c>
 80111fa:	6f03      	mov      	r12, r0
 80111fc:	6f47      	mov      	r13, r1
 80111fe:	2b00      	subi      	r3, 1
 8011200:	6401      	cmplt      	r0, r0
 8011202:	6031      	addc      	r0, r12
 8011204:	6075      	addc      	r1, r13
 8011206:	b866      	st.w      	r3, (r14, 0x18)
 8011208:	ea0c003d 	movi      	r12, 61
 801120c:	3400      	movi      	r4, 0
 801120e:	3500      	movi      	r5, 0
 8011210:	3200      	movi      	r2, 0
 8011212:	ea231000 	movih      	r3, 4096
 8011216:	65c4      	cmphs      	r1, r7
 8011218:	0c0a      	bf      	0x801122c	// 801122c <__divdf3+0x90>
 801121a:	645e      	cmpne      	r7, r1
 801121c:	0803      	bt      	0x8011222	// 8011222 <__divdf3+0x86>
 801121e:	6580      	cmphs      	r0, r6
 8011220:	0c06      	bf      	0x801122c	// 801122c <__divdf3+0x90>
 8011222:	6d08      	or      	r4, r2
 8011224:	6d4c      	or      	r5, r3
 8011226:	6400      	cmphs      	r0, r0
 8011228:	601b      	subc      	r0, r6
 801122a:	605f      	subc      	r1, r7
 801122c:	c7e34829 	lsli      	r9, r3, 31
 8011230:	c4224848 	lsri      	r8, r2, 1
 8011234:	c423484d 	lsri      	r13, r3, 1
 8011238:	c5092422 	or      	r2, r9, r8
 801123c:	e58c1000 	subi      	r12, r12, 1
 8011240:	6e03      	mov      	r8, r0
 8011242:	6e47      	mov      	r9, r1
 8011244:	6cf7      	mov      	r3, r13
 8011246:	6401      	cmplt      	r0, r0
 8011248:	6021      	addc      	r0, r8
 801124a:	6065      	addc      	r1, r9
 801124c:	e92cffe5 	bnez      	r12, 0x8011216	// 8011216 <__divdf3+0x7a>
 8011250:	e46420ff 	andi      	r3, r4, 255
 8011254:	eb430080 	cmpnei      	r3, 128
 8011258:	0c13      	bf      	0x801127e	// 801127e <__divdf3+0xe2>
 801125a:	b887      	st.w      	r4, (r14, 0x1c)
 801125c:	b8a8      	st.w      	r5, (r14, 0x20)
 801125e:	1804      	addi      	r0, r14, 16
 8011260:	e0000160 	bsr      	0x8011520	// 8011520 <__pack_d>
 8011264:	140e      	addi      	r14, r14, 56
 8011266:	1496      	pop      	r4-r9, r15
 8011268:	644e      	cmpne      	r3, r1
 801126a:	0bfa      	bt      	0x801125e	// 801125e <__divdf3+0xc2>
 801126c:	1011      	lrw      	r0, 0x8013350	// 80112b0 <__divdf3+0x114>
 801126e:	07f9      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 8011270:	3300      	movi      	r3, 0
 8011272:	3400      	movi      	r4, 0
 8011274:	b867      	st.w      	r3, (r14, 0x1c)
 8011276:	b888      	st.w      	r4, (r14, 0x20)
 8011278:	b866      	st.w      	r3, (r14, 0x18)
 801127a:	1804      	addi      	r0, r14, 16
 801127c:	07f2      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 801127e:	e4642100 	andi      	r3, r4, 256
 8011282:	e923ffec 	bnez      	r3, 0x801125a	// 801125a <__divdf3+0xbe>
 8011286:	6c04      	or      	r0, r1
 8011288:	e900ffe9 	bez      	r0, 0x801125a	// 801125a <__divdf3+0xbe>
 801128c:	3280      	movi      	r2, 128
 801128e:	3300      	movi      	r3, 0
 8011290:	3100      	movi      	r1, 0
 8011292:	6489      	cmplt      	r2, r2
 8011294:	6091      	addc      	r2, r4
 8011296:	60d5      	addc      	r3, r5
 8011298:	29ff      	subi      	r1, 256
 801129a:	c4222024 	and      	r4, r2, r1
 801129e:	6d4f      	mov      	r5, r3
 80112a0:	07dd      	br      	0x801125a	// 801125a <__divdf3+0xbe>
 80112a2:	3304      	movi      	r3, 4
 80112a4:	b864      	st.w      	r3, (r14, 0x10)
 80112a6:	1804      	addi      	r0, r14, 16
 80112a8:	07dc      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 80112aa:	1809      	addi      	r0, r14, 36
 80112ac:	07da      	br      	0x8011260	// 8011260 <__divdf3+0xc4>
 80112ae:	0000      	.short	0x0000
 80112b0:	08013350 	.long	0x08013350

080112b4 <__nedf2>:
 80112b4:	14d2      	push      	r4-r5, r15
 80112b6:	142e      	subi      	r14, r14, 56
 80112b8:	b800      	st.w      	r0, (r14, 0x0)
 80112ba:	b821      	st.w      	r1, (r14, 0x4)
 80112bc:	6c3b      	mov      	r0, r14
 80112be:	6d47      	mov      	r5, r1
 80112c0:	1904      	addi      	r1, r14, 16
 80112c2:	b863      	st.w      	r3, (r14, 0xc)
 80112c4:	b842      	st.w      	r2, (r14, 0x8)
 80112c6:	e00001f5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80112ca:	1802      	addi      	r0, r14, 8
 80112cc:	1909      	addi      	r1, r14, 36
 80112ce:	e00001f1 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 80112d2:	9864      	ld.w      	r3, (r14, 0x10)
 80112d4:	3001      	movi      	r0, 1
 80112d6:	64c0      	cmphs      	r0, r3
 80112d8:	0808      	bt      	0x80112e8	// 80112e8 <__nedf2+0x34>
 80112da:	9869      	ld.w      	r3, (r14, 0x24)
 80112dc:	64c0      	cmphs      	r0, r3
 80112de:	0805      	bt      	0x80112e8	// 80112e8 <__nedf2+0x34>
 80112e0:	1909      	addi      	r1, r14, 36
 80112e2:	1804      	addi      	r0, r14, 16
 80112e4:	e0000258 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 80112e8:	140e      	addi      	r14, r14, 56
 80112ea:	1492      	pop      	r4-r5, r15

080112ec <__gtdf2>:
 80112ec:	14d2      	push      	r4-r5, r15
 80112ee:	142e      	subi      	r14, r14, 56
 80112f0:	b800      	st.w      	r0, (r14, 0x0)
 80112f2:	b821      	st.w      	r1, (r14, 0x4)
 80112f4:	6c3b      	mov      	r0, r14
 80112f6:	6d47      	mov      	r5, r1
 80112f8:	1904      	addi      	r1, r14, 16
 80112fa:	b842      	st.w      	r2, (r14, 0x8)
 80112fc:	b863      	st.w      	r3, (r14, 0xc)
 80112fe:	e00001d9 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011302:	1909      	addi      	r1, r14, 36
 8011304:	1802      	addi      	r0, r14, 8
 8011306:	e00001d5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801130a:	9844      	ld.w      	r2, (r14, 0x10)
 801130c:	3301      	movi      	r3, 1
 801130e:	648c      	cmphs      	r3, r2
 8011310:	080a      	bt      	0x8011324	// 8011324 <__gtdf2+0x38>
 8011312:	9849      	ld.w      	r2, (r14, 0x24)
 8011314:	648c      	cmphs      	r3, r2
 8011316:	0807      	bt      	0x8011324	// 8011324 <__gtdf2+0x38>
 8011318:	1909      	addi      	r1, r14, 36
 801131a:	1804      	addi      	r0, r14, 16
 801131c:	e000023c 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 8011320:	140e      	addi      	r14, r14, 56
 8011322:	1492      	pop      	r4-r5, r15
 8011324:	3000      	movi      	r0, 0
 8011326:	2800      	subi      	r0, 1
 8011328:	140e      	addi      	r14, r14, 56
 801132a:	1492      	pop      	r4-r5, r15

0801132c <__gedf2>:
 801132c:	14d2      	push      	r4-r5, r15
 801132e:	142e      	subi      	r14, r14, 56
 8011330:	b800      	st.w      	r0, (r14, 0x0)
 8011332:	b821      	st.w      	r1, (r14, 0x4)
 8011334:	6c3b      	mov      	r0, r14
 8011336:	6d47      	mov      	r5, r1
 8011338:	1904      	addi      	r1, r14, 16
 801133a:	b842      	st.w      	r2, (r14, 0x8)
 801133c:	b863      	st.w      	r3, (r14, 0xc)
 801133e:	e00001b9 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011342:	1909      	addi      	r1, r14, 36
 8011344:	1802      	addi      	r0, r14, 8
 8011346:	e00001b5 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801134a:	9844      	ld.w      	r2, (r14, 0x10)
 801134c:	3301      	movi      	r3, 1
 801134e:	648c      	cmphs      	r3, r2
 8011350:	080a      	bt      	0x8011364	// 8011364 <__gedf2+0x38>
 8011352:	9849      	ld.w      	r2, (r14, 0x24)
 8011354:	648c      	cmphs      	r3, r2
 8011356:	0807      	bt      	0x8011364	// 8011364 <__gedf2+0x38>
 8011358:	1909      	addi      	r1, r14, 36
 801135a:	1804      	addi      	r0, r14, 16
 801135c:	e000021c 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 8011360:	140e      	addi      	r14, r14, 56
 8011362:	1492      	pop      	r4-r5, r15
 8011364:	3000      	movi      	r0, 0
 8011366:	2800      	subi      	r0, 1
 8011368:	140e      	addi      	r14, r14, 56
 801136a:	1492      	pop      	r4-r5, r15

0801136c <__ltdf2>:
 801136c:	14d2      	push      	r4-r5, r15
 801136e:	142e      	subi      	r14, r14, 56
 8011370:	b800      	st.w      	r0, (r14, 0x0)
 8011372:	b821      	st.w      	r1, (r14, 0x4)
 8011374:	6c3b      	mov      	r0, r14
 8011376:	6d47      	mov      	r5, r1
 8011378:	1904      	addi      	r1, r14, 16
 801137a:	b863      	st.w      	r3, (r14, 0xc)
 801137c:	b842      	st.w      	r2, (r14, 0x8)
 801137e:	e0000199 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 8011382:	1802      	addi      	r0, r14, 8
 8011384:	1909      	addi      	r1, r14, 36
 8011386:	e0000195 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801138a:	9864      	ld.w      	r3, (r14, 0x10)
 801138c:	3001      	movi      	r0, 1
 801138e:	64c0      	cmphs      	r0, r3
 8011390:	0808      	bt      	0x80113a0	// 80113a0 <__ltdf2+0x34>
 8011392:	9869      	ld.w      	r3, (r14, 0x24)
 8011394:	64c0      	cmphs      	r0, r3
 8011396:	0805      	bt      	0x80113a0	// 80113a0 <__ltdf2+0x34>
 8011398:	1909      	addi      	r1, r14, 36
 801139a:	1804      	addi      	r0, r14, 16
 801139c:	e00001fc 	bsr      	0x8011794	// 8011794 <__fpcmp_parts_d>
 80113a0:	140e      	addi      	r14, r14, 56
 80113a2:	1492      	pop      	r4-r5, r15

080113a4 <__floatsidf>:
 80113a4:	14d0      	push      	r15
 80113a6:	1425      	subi      	r14, r14, 20
 80113a8:	3303      	movi      	r3, 3
 80113aa:	b860      	st.w      	r3, (r14, 0x0)
 80113ac:	487f      	lsri      	r3, r0, 31
 80113ae:	b861      	st.w      	r3, (r14, 0x4)
 80113b0:	e9200009 	bnez      	r0, 0x80113c2	// 80113c2 <__floatsidf+0x1e>
 80113b4:	3302      	movi      	r3, 2
 80113b6:	b860      	st.w      	r3, (r14, 0x0)
 80113b8:	6c3b      	mov      	r0, r14
 80113ba:	e00000b3 	bsr      	0x8011520	// 8011520 <__pack_d>
 80113be:	1405      	addi      	r14, r14, 20
 80113c0:	1490      	pop      	r15
 80113c2:	e9a00008 	bhsz      	r0, 0x80113d2	// 80113d2 <__floatsidf+0x2e>
 80113c6:	ea238000 	movih      	r3, 32768
 80113ca:	64c2      	cmpne      	r0, r3
 80113cc:	0c1c      	bf      	0x8011404	// 8011404 <__floatsidf+0x60>
 80113ce:	3300      	movi      	r3, 0
 80113d0:	5b01      	subu      	r0, r3, r0
 80113d2:	c4007c42 	ff1      	r2, r0
 80113d6:	e422001c 	addi      	r1, r2, 29
 80113da:	ea0c001f 	movi      	r12, 31
 80113de:	2a02      	subi      	r2, 3
 80113e0:	4861      	lsri      	r3, r0, 1
 80113e2:	6306      	subu      	r12, r1
 80113e4:	c440402d 	lsl      	r13, r0, r2
 80113e8:	3adf      	btsti      	r2, 31
 80113ea:	70f1      	lsr      	r3, r12
 80113ec:	c46d0c20 	incf      	r3, r13, 0
 80113f0:	7004      	lsl      	r0, r1
 80113f2:	b864      	st.w      	r3, (r14, 0x10)
 80113f4:	3300      	movi      	r3, 0
 80113f6:	c4030c20 	incf      	r0, r3, 0
 80113fa:	333c      	movi      	r3, 60
 80113fc:	60c6      	subu      	r3, r1
 80113fe:	b803      	st.w      	r0, (r14, 0xc)
 8011400:	b862      	st.w      	r3, (r14, 0x8)
 8011402:	07db      	br      	0x80113b8	// 80113b8 <__floatsidf+0x14>
 8011404:	3000      	movi      	r0, 0
 8011406:	ea21c1e0 	movih      	r1, 49632
 801140a:	07da      	br      	0x80113be	// 80113be <__floatsidf+0x1a>

0801140c <__fixdfsi>:
 801140c:	14d0      	push      	r15
 801140e:	1427      	subi      	r14, r14, 28
 8011410:	b800      	st.w      	r0, (r14, 0x0)
 8011412:	b821      	st.w      	r1, (r14, 0x4)
 8011414:	6c3b      	mov      	r0, r14
 8011416:	1902      	addi      	r1, r14, 8
 8011418:	e000014c 	bsr      	0x80116b0	// 80116b0 <__unpack_d>
 801141c:	9862      	ld.w      	r3, (r14, 0x8)
 801141e:	3202      	movi      	r2, 2
 8011420:	64c8      	cmphs      	r2, r3
 8011422:	082a      	bt      	0x8011476	// 8011476 <__fixdfsi+0x6a>
 8011424:	3b44      	cmpnei      	r3, 4
 8011426:	0c06      	bf      	0x8011432	// 8011432 <__fixdfsi+0x26>
 8011428:	9804      	ld.w      	r0, (r14, 0x10)
 801142a:	e9800026 	blz      	r0, 0x8011476	// 8011476 <__fixdfsi+0x6a>
 801142e:	383e      	cmplti      	r0, 31
 8011430:	080a      	bt      	0x8011444	// 8011444 <__fixdfsi+0x38>
 8011432:	9863      	ld.w      	r3, (r14, 0xc)
 8011434:	3b40      	cmpnei      	r3, 0
 8011436:	c4000500 	mvc      	r0
 801143a:	c7c05023 	bmaski      	r3, 31
 801143e:	600c      	addu      	r0, r3
 8011440:	1407      	addi      	r14, r14, 28
 8011442:	1490      	pop      	r15
 8011444:	323c      	movi      	r2, 60
 8011446:	5a21      	subu      	r1, r2, r0
 8011448:	e581101f 	subi      	r12, r1, 32
 801144c:	9866      	ld.w      	r3, (r14, 0x18)
 801144e:	321f      	movi      	r2, 31
 8011450:	c5834040 	lsr      	r0, r3, r12
 8011454:	6086      	subu      	r2, r1
 8011456:	4361      	lsli      	r3, r3, 1
 8011458:	70c8      	lsl      	r3, r2
 801145a:	9845      	ld.w      	r2, (r14, 0x14)
 801145c:	7085      	lsr      	r2, r1
 801145e:	6c8c      	or      	r2, r3
 8011460:	9863      	ld.w      	r3, (r14, 0xc)
 8011462:	c7ec2880 	btsti      	r12, 31
 8011466:	c4020c40 	inct      	r0, r2, 0
 801146a:	e903ffeb 	bez      	r3, 0x8011440	// 8011440 <__fixdfsi+0x34>
 801146e:	3300      	movi      	r3, 0
 8011470:	5b01      	subu      	r0, r3, r0
 8011472:	1407      	addi      	r14, r14, 28
 8011474:	1490      	pop      	r15
 8011476:	3000      	movi      	r0, 0
 8011478:	1407      	addi      	r14, r14, 28
 801147a:	1490      	pop      	r15

0801147c <__floatunsidf>:
 801147c:	14d1      	push      	r4, r15
 801147e:	1425      	subi      	r14, r14, 20
 8011480:	3100      	movi      	r1, 0
 8011482:	b821      	st.w      	r1, (r14, 0x4)
 8011484:	e9000020 	bez      	r0, 0x80114c4	// 80114c4 <__floatunsidf+0x48>
 8011488:	c4007c42 	ff1      	r2, r0
 801148c:	e582001c 	addi      	r12, r2, 29
 8011490:	3303      	movi      	r3, 3
 8011492:	ea0d001f 	movi      	r13, 31
 8011496:	2a02      	subi      	r2, 3
 8011498:	b860      	st.w      	r3, (r14, 0x0)
 801149a:	6372      	subu      	r13, r12
 801149c:	4861      	lsri      	r3, r0, 1
 801149e:	c4404024 	lsl      	r4, r0, r2
 80114a2:	3adf      	btsti      	r2, 31
 80114a4:	70f5      	lsr      	r3, r13
 80114a6:	c4640c20 	incf      	r3, r4, 0
 80114aa:	7030      	lsl      	r0, r12
 80114ac:	c4010c20 	incf      	r0, r1, 0
 80114b0:	b864      	st.w      	r3, (r14, 0x10)
 80114b2:	333c      	movi      	r3, 60
 80114b4:	b803      	st.w      	r0, (r14, 0xc)
 80114b6:	60f2      	subu      	r3, r12
 80114b8:	6c3b      	mov      	r0, r14
 80114ba:	b862      	st.w      	r3, (r14, 0x8)
 80114bc:	e0000032 	bsr      	0x8011520	// 8011520 <__pack_d>
 80114c0:	1405      	addi      	r14, r14, 20
 80114c2:	1491      	pop      	r4, r15
 80114c4:	3302      	movi      	r3, 2
 80114c6:	6c3b      	mov      	r0, r14
 80114c8:	b860      	st.w      	r3, (r14, 0x0)
 80114ca:	e000002b 	bsr      	0x8011520	// 8011520 <__pack_d>
 80114ce:	1405      	addi      	r14, r14, 20
 80114d0:	1491      	pop      	r4, r15
	...

080114d4 <__muldi3>:
 80114d4:	14c3      	push      	r4-r6
 80114d6:	c602484d 	lsri      	r13, r2, 16
 80114da:	c40055ec 	zext      	r12, r0, 15, 0
 80114de:	4890      	lsri      	r4, r0, 16
 80114e0:	c40255e5 	zext      	r5, r2, 15, 0
 80114e4:	c4ac8426 	mult      	r6, r12, r5
 80114e8:	7d50      	mult      	r5, r4
 80114ea:	7f34      	mult      	r12, r13
 80114ec:	7d34      	mult      	r4, r13
 80114ee:	c4ac002d 	addu      	r13, r12, r5
 80114f2:	c606484c 	lsri      	r12, r6, 16
 80114f6:	6334      	addu      	r12, r13
 80114f8:	6570      	cmphs      	r12, r5
 80114fa:	0804      	bt      	0x8011502	// 8011502 <__muldi3+0x2e>
 80114fc:	ea2d0001 	movih      	r13, 1
 8011500:	6134      	addu      	r4, r13
 8011502:	c60c484d 	lsri      	r13, r12, 16
 8011506:	7cc0      	mult      	r3, r0
 8011508:	7c48      	mult      	r1, r2
 801150a:	6134      	addu      	r4, r13
 801150c:	c60c482c 	lsli      	r12, r12, 16
 8011510:	c40655e6 	zext      	r6, r6, 15, 0
 8011514:	604c      	addu      	r1, r3
 8011516:	c4cc0020 	addu      	r0, r12, r6
 801151a:	6050      	addu      	r1, r4
 801151c:	1483      	pop      	r4-r6
	...

08011520 <__pack_d>:
 8011520:	14c5      	push      	r4-r8
 8011522:	9020      	ld.w      	r1, (r0, 0x0)
 8011524:	3901      	cmphsi      	r1, 2
 8011526:	9043      	ld.w      	r2, (r0, 0xc)
 8011528:	9064      	ld.w      	r3, (r0, 0x10)
 801152a:	d9a02001 	ld.w      	r13, (r0, 0x4)
 801152e:	0c47      	bf      	0x80115bc	// 80115bc <__pack_d+0x9c>
 8011530:	3944      	cmpnei      	r1, 4
 8011532:	0c40      	bf      	0x80115b2	// 80115b2 <__pack_d+0x92>
 8011534:	3942      	cmpnei      	r1, 2
 8011536:	0c28      	bf      	0x8011586	// 8011586 <__pack_d+0x66>
 8011538:	c4622421 	or      	r1, r2, r3
 801153c:	e9010025 	bez      	r1, 0x8011586	// 8011586 <__pack_d+0x66>
 8011540:	9022      	ld.w      	r1, (r0, 0x8)
 8011542:	ea0003fd 	movi      	r0, 1021
 8011546:	6c02      	nor      	r0, r0
 8011548:	6405      	cmplt      	r1, r0
 801154a:	0855      	bt      	0x80115f4	// 80115f4 <__pack_d+0xd4>
 801154c:	eb2103ff 	cmplti      	r1, 1024
 8011550:	0c31      	bf      	0x80115b2	// 80115b2 <__pack_d+0x92>
 8011552:	e40220ff 	andi      	r0, r2, 255
 8011556:	eb400080 	cmpnei      	r0, 128
 801155a:	0c43      	bf      	0x80115e0	// 80115e0 <__pack_d+0xc0>
 801155c:	347f      	movi      	r4, 127
 801155e:	3500      	movi      	r5, 0
 8011560:	6489      	cmplt      	r2, r2
 8011562:	6091      	addc      	r2, r4
 8011564:	60d5      	addc      	r3, r5
 8011566:	c7805020 	bmaski      	r0, 29
 801156a:	64c0      	cmphs      	r0, r3
 801156c:	0c19      	bf      	0x801159e	// 801159e <__pack_d+0x7e>
 801156e:	e58103fe 	addi      	r12, r1, 1023
 8011572:	4b28      	lsri      	r1, r3, 8
 8011574:	4398      	lsli      	r4, r3, 24
 8011576:	4a08      	lsri      	r0, r2, 8
 8011578:	c4015663 	zext      	r3, r1, 19, 0
 801157c:	6c4f      	mov      	r1, r3
 801157e:	6c10      	or      	r0, r4
 8011580:	e46c27ff 	andi      	r3, r12, 2047
 8011584:	0404      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 8011586:	3300      	movi      	r3, 0
 8011588:	3000      	movi      	r0, 0
 801158a:	3100      	movi      	r1, 0
 801158c:	3200      	movi      	r2, 0
 801158e:	c4415e60 	ins      	r2, r1, 19, 0
 8011592:	c4435d54 	ins      	r2, r3, 30, 20
 8011596:	c44d5c1f 	ins      	r2, r13, 31, 31
 801159a:	6c4b      	mov      	r1, r2
 801159c:	1485      	pop      	r4-r8
 801159e:	439f      	lsli      	r4, r3, 31
 80115a0:	c422484c 	lsri      	r12, r2, 1
 80115a4:	4b01      	lsri      	r0, r3, 1
 80115a6:	c5842422 	or      	r2, r4, r12
 80115aa:	6cc3      	mov      	r3, r0
 80115ac:	e58103ff 	addi      	r12, r1, 1024
 80115b0:	07e1      	br      	0x8011572	// 8011572 <__pack_d+0x52>
 80115b2:	ea0307ff 	movi      	r3, 2047
 80115b6:	3000      	movi      	r0, 0
 80115b8:	3100      	movi      	r1, 0
 80115ba:	07e9      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 80115bc:	c703482c 	lsli      	r12, r3, 24
 80115c0:	4a48      	lsri      	r2, r2, 8
 80115c2:	c44c2420 	or      	r0, r12, r2
 80115c6:	c5035741 	zext      	r1, r3, 26, 8
 80115ca:	3200      	movi      	r2, 0
 80115cc:	ea230008 	movih      	r3, 8
 80115d0:	6c08      	or      	r0, r2
 80115d2:	6c4c      	or      	r1, r3
 80115d4:	c4015663 	zext      	r3, r1, 19, 0
 80115d8:	6c4f      	mov      	r1, r3
 80115da:	ea0307ff 	movi      	r3, 2047
 80115de:	07d7      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 80115e0:	e4022100 	andi      	r0, r2, 256
 80115e4:	e900ffc1 	bez      	r0, 0x8011566	// 8011566 <__pack_d+0x46>
 80115e8:	3480      	movi      	r4, 128
 80115ea:	3500      	movi      	r5, 0
 80115ec:	6489      	cmplt      	r2, r2
 80115ee:	6091      	addc      	r2, r4
 80115f0:	60d5      	addc      	r3, r5
 80115f2:	07ba      	br      	0x8011566	// 8011566 <__pack_d+0x46>
 80115f4:	5825      	subu      	r1, r0, r1
 80115f6:	eb210038 	cmplti      	r1, 57
 80115fa:	0fc6      	bf      	0x8011586	// 8011586 <__pack_d+0x66>
 80115fc:	341f      	movi      	r4, 31
 80115fe:	c423482c 	lsli      	r12, r3, 1
 8011602:	6106      	subu      	r4, r1
 8011604:	e401101f 	subi      	r0, r1, 32
 8011608:	7310      	lsl      	r12, r4
 801160a:	c4224046 	lsr      	r6, r2, r1
 801160e:	38df      	btsti      	r0, 31
 8011610:	c4034045 	lsr      	r5, r3, r0
 8011614:	ea080000 	movi      	r8, 0
 8011618:	6db0      	or      	r6, r12
 801161a:	ea0c0001 	movi      	r12, 1
 801161e:	c4c50c20 	incf      	r6, r5, 0
 8011622:	c40c4020 	lsl      	r0, r12, r0
 8011626:	6d63      	mov      	r5, r8
 8011628:	c42c4024 	lsl      	r4, r12, r1
 801162c:	c4234047 	lsr      	r7, r3, r1
 8011630:	c4a00c20 	incf      	r5, r0, 0
 8011634:	c4880c20 	incf      	r4, r8, 0
 8011638:	c4e80c20 	incf      	r7, r8, 0
 801163c:	3c40      	cmpnei      	r4, 0
 801163e:	c4a50c81 	decf      	r5, r5, 1
 8011642:	2c00      	subi      	r4, 1
 8011644:	6890      	and      	r2, r4
 8011646:	68d4      	and      	r3, r5
 8011648:	6c8c      	or      	r2, r3
 801164a:	3a40      	cmpnei      	r2, 0
 801164c:	c4000502 	mvc      	r2
 8011650:	6ce3      	mov      	r3, r8
 8011652:	6d88      	or      	r6, r2
 8011654:	6dcc      	or      	r7, r3
 8011656:	e46620ff 	andi      	r3, r6, 255
 801165a:	eb430080 	cmpnei      	r3, 128
 801165e:	0814      	bt      	0x8011686	// 8011686 <__pack_d+0x166>
 8011660:	e4662100 	andi      	r3, r6, 256
 8011664:	e9230023 	bnez      	r3, 0x80116aa	// 80116aa <__pack_d+0x18a>
 8011668:	4758      	lsli      	r2, r7, 24
 801166a:	4f28      	lsri      	r1, r7, 8
 801166c:	4e08      	lsri      	r0, r6, 8
 801166e:	6c08      	or      	r0, r2
 8011670:	c4015662 	zext      	r2, r1, 19, 0
 8011674:	6c4b      	mov      	r1, r2
 8011676:	c7605022 	bmaski      	r2, 28
 801167a:	65c8      	cmphs      	r2, r7
 801167c:	0c02      	bf      	0x8011680	// 8011680 <__pack_d+0x160>
 801167e:	6f0f      	mov      	r12, r3
 8011680:	e46c2001 	andi      	r3, r12, 1
 8011684:	0784      	br      	0x801158c	// 801158c <__pack_d+0x6c>
 8011686:	327f      	movi      	r2, 127
 8011688:	3300      	movi      	r3, 0
 801168a:	6599      	cmplt      	r6, r6
 801168c:	6189      	addc      	r6, r2
 801168e:	61cd      	addc      	r7, r3
 8011690:	4778      	lsli      	r3, r7, 24
 8011692:	4f28      	lsri      	r1, r7, 8
 8011694:	4e08      	lsri      	r0, r6, 8
 8011696:	6c0c      	or      	r0, r3
 8011698:	c4015663 	zext      	r3, r1, 19, 0
 801169c:	6c4f      	mov      	r1, r3
 801169e:	c7605023 	bmaski      	r3, 28
 80116a2:	65cc      	cmphs      	r3, r7
 80116a4:	0fee      	bf      	0x8011680	// 8011680 <__pack_d+0x160>
 80116a6:	6f23      	mov      	r12, r8
 80116a8:	07ec      	br      	0x8011680	// 8011680 <__pack_d+0x160>
 80116aa:	3280      	movi      	r2, 128
 80116ac:	07ee      	br      	0x8011688	// 8011688 <__pack_d+0x168>
	...

080116b0 <__unpack_d>:
 80116b0:	1421      	subi      	r14, r14, 4
 80116b2:	dd6e2000 	st.w      	r11, (r14, 0x0)
 80116b6:	8863      	ld.h      	r3, (r0, 0x6)
 80116b8:	8047      	ld.b      	r2, (r0, 0x7)
 80116ba:	c48355c3 	zext      	r3, r3, 14, 4
 80116be:	d9802001 	ld.w      	r12, (r0, 0x4)
 80116c2:	4a47      	lsri      	r2, r2, 7
 80116c4:	d9a02000 	ld.w      	r13, (r0, 0x0)
 80116c8:	c40c566c 	zext      	r12, r12, 19, 0
 80116cc:	b141      	st.w      	r2, (r1, 0x4)
 80116ce:	e9230025 	bnez      	r3, 0x8011718	// 8011718 <__unpack_d+0x68>
 80116d2:	c58d2423 	or      	r3, r13, r12
 80116d6:	e903003c 	bez      	r3, 0x801174e	// 801174e <__unpack_d+0x9e>
 80116da:	c70d4840 	lsri      	r0, r13, 24
 80116de:	c50c4823 	lsli      	r3, r12, 8
 80116e2:	6cc0      	or      	r3, r0
 80116e4:	3003      	movi      	r0, 3
 80116e6:	c50d4822 	lsli      	r2, r13, 8
 80116ea:	b100      	st.w      	r0, (r1, 0x0)
 80116ec:	c760502d 	bmaski      	r13, 28
 80116f0:	ea0003fe 	movi      	r0, 1022
 80116f4:	6c02      	nor      	r0, r0
 80116f6:	6ecb      	mov      	r11, r2
 80116f8:	6f0f      	mov      	r12, r3
 80116fa:	6489      	cmplt      	r2, r2
 80116fc:	60ad      	addc      	r2, r11
 80116fe:	60f1      	addc      	r3, r12
 8011700:	64f4      	cmphs      	r13, r3
 8011702:	6f03      	mov      	r12, r0
 8011704:	2800      	subi      	r0, 1
 8011706:	0bf8      	bt      	0x80116f6	// 80116f6 <__unpack_d+0x46>
 8011708:	dd812002 	st.w      	r12, (r1, 0x8)
 801170c:	b143      	st.w      	r2, (r1, 0xc)
 801170e:	b164      	st.w      	r3, (r1, 0x10)
 8011710:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011714:	1401      	addi      	r14, r14, 4
 8011716:	783c      	jmp      	r15
 8011718:	eb4307ff 	cmpnei      	r3, 2047
 801171c:	0c1f      	bf      	0x801175a	// 801175a <__unpack_d+0xaa>
 801171e:	e46313fe 	subi      	r3, r3, 1023
 8011722:	b162      	st.w      	r3, (r1, 0x8)
 8011724:	3303      	movi      	r3, 3
 8011726:	c70d4840 	lsri      	r0, r13, 24
 801172a:	b160      	st.w      	r3, (r1, 0x0)
 801172c:	c50c4823 	lsli      	r3, r12, 8
 8011730:	c50d4822 	lsli      	r2, r13, 8
 8011734:	6cc0      	or      	r3, r0
 8011736:	ea0c0000 	movi      	r12, 0
 801173a:	ea2d1000 	movih      	r13, 4096
 801173e:	6cb0      	or      	r2, r12
 8011740:	6cf4      	or      	r3, r13
 8011742:	b143      	st.w      	r2, (r1, 0xc)
 8011744:	b164      	st.w      	r3, (r1, 0x10)
 8011746:	d96e2000 	ld.w      	r11, (r14, 0x0)
 801174a:	1401      	addi      	r14, r14, 4
 801174c:	783c      	jmp      	r15
 801174e:	3302      	movi      	r3, 2
 8011750:	b160      	st.w      	r3, (r1, 0x0)
 8011752:	d96e2000 	ld.w      	r11, (r14, 0x0)
 8011756:	1401      	addi      	r14, r14, 4
 8011758:	783c      	jmp      	r15
 801175a:	c58d2423 	or      	r3, r13, r12
 801175e:	e9030018 	bez      	r3, 0x801178e	// 801178e <__unpack_d+0xde>
 8011762:	ea230008 	movih      	r3, 8
 8011766:	68f0      	and      	r3, r12
 8011768:	3b40      	cmpnei      	r3, 0
 801176a:	3201      	movi      	r2, 1
 801176c:	c4620c40 	inct      	r3, r2, 0
 8011770:	b160      	st.w      	r3, (r1, 0x0)
 8011772:	c50c482c 	lsli      	r12, r12, 8
 8011776:	c70d4843 	lsri      	r3, r13, 24
 801177a:	6f0c      	or      	r12, r3
 801177c:	c50d482d 	lsli      	r13, r13, 8
 8011780:	c76c282c 	bclri      	r12, r12, 27
 8011784:	dda12003 	st.w      	r13, (r1, 0xc)
 8011788:	dd812004 	st.w      	r12, (r1, 0x10)
 801178c:	07dd      	br      	0x8011746	// 8011746 <__unpack_d+0x96>
 801178e:	3304      	movi      	r3, 4
 8011790:	b160      	st.w      	r3, (r1, 0x0)
 8011792:	07da      	br      	0x8011746	// 8011746 <__unpack_d+0x96>

08011794 <__fpcmp_parts_d>:
 8011794:	9040      	ld.w      	r2, (r0, 0x0)
 8011796:	3301      	movi      	r3, 1
 8011798:	648c      	cmphs      	r3, r2
 801179a:	0830      	bt      	0x80117fa	// 80117fa <__fpcmp_parts_d+0x66>
 801179c:	d9812000 	ld.w      	r12, (r1, 0x0)
 80117a0:	670c      	cmphs      	r3, r12
 80117a2:	082c      	bt      	0x80117fa	// 80117fa <__fpcmp_parts_d+0x66>
 80117a4:	3a44      	cmpnei      	r2, 4
 80117a6:	0c1f      	bf      	0x80117e4	// 80117e4 <__fpcmp_parts_d+0x50>
 80117a8:	eb4c0004 	cmpnei      	r12, 4
 80117ac:	0c14      	bf      	0x80117d4	// 80117d4 <__fpcmp_parts_d+0x40>
 80117ae:	3a42      	cmpnei      	r2, 2
 80117b0:	0c0f      	bf      	0x80117ce	// 80117ce <__fpcmp_parts_d+0x3a>
 80117b2:	eb4c0002 	cmpnei      	r12, 2
 80117b6:	0c1a      	bf      	0x80117ea	// 80117ea <__fpcmp_parts_d+0x56>
 80117b8:	9041      	ld.w      	r2, (r0, 0x4)
 80117ba:	d9812001 	ld.w      	r12, (r1, 0x4)
 80117be:	670a      	cmpne      	r2, r12
 80117c0:	0c1f      	bf      	0x80117fe	// 80117fe <__fpcmp_parts_d+0x6a>
 80117c2:	3000      	movi      	r0, 0
 80117c4:	2800      	subi      	r0, 1
 80117c6:	3a40      	cmpnei      	r2, 0
 80117c8:	c4030c20 	incf      	r0, r3, 0
 80117cc:	783c      	jmp      	r15
 80117ce:	eb4c0002 	cmpnei      	r12, 2
 80117d2:	0c2a      	bf      	0x8011826	// 8011826 <__fpcmp_parts_d+0x92>
 80117d4:	9141      	ld.w      	r2, (r1, 0x4)
 80117d6:	3300      	movi      	r3, 0
 80117d8:	2b00      	subi      	r3, 1
 80117da:	3a40      	cmpnei      	r2, 0
 80117dc:	3001      	movi      	r0, 1
 80117de:	c4030c20 	incf      	r0, r3, 0
 80117e2:	783c      	jmp      	r15
 80117e4:	eb4c0004 	cmpnei      	r12, 4
 80117e8:	0c21      	bf      	0x801182a	// 801182a <__fpcmp_parts_d+0x96>
 80117ea:	9061      	ld.w      	r3, (r0, 0x4)
 80117ec:	3000      	movi      	r0, 0
 80117ee:	3b40      	cmpnei      	r3, 0
 80117f0:	2800      	subi      	r0, 1
 80117f2:	3301      	movi      	r3, 1
 80117f4:	c4030c20 	incf      	r0, r3, 0
 80117f8:	783c      	jmp      	r15
 80117fa:	6c0f      	mov      	r0, r3
 80117fc:	783c      	jmp      	r15
 80117fe:	d9a02002 	ld.w      	r13, (r0, 0x8)
 8011802:	d9812002 	ld.w      	r12, (r1, 0x8)
 8011806:	6771      	cmplt      	r12, r13
 8011808:	0bdd      	bt      	0x80117c2	// 80117c2 <__fpcmp_parts_d+0x2e>
 801180a:	6735      	cmplt      	r13, r12
 801180c:	0c13      	bf      	0x8011832	// 8011832 <__fpcmp_parts_d+0x9e>
 801180e:	3000      	movi      	r0, 0
 8011810:	2800      	subi      	r0, 1
 8011812:	3a40      	cmpnei      	r2, 0
 8011814:	c4030c40 	inct      	r0, r3, 0
 8011818:	07da      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 801181a:	644c      	cmphs      	r3, r1
 801181c:	0fdd      	bf      	0x80117d6	// 80117d6 <__fpcmp_parts_d+0x42>
 801181e:	64c6      	cmpne      	r1, r3
 8011820:	0803      	bt      	0x8011826	// 8011826 <__fpcmp_parts_d+0x92>
 8011822:	6430      	cmphs      	r12, r0
 8011824:	0fd9      	bf      	0x80117d6	// 80117d6 <__fpcmp_parts_d+0x42>
 8011826:	3000      	movi      	r0, 0
 8011828:	07d2      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 801182a:	9161      	ld.w      	r3, (r1, 0x4)
 801182c:	9001      	ld.w      	r0, (r0, 0x4)
 801182e:	5b01      	subu      	r0, r3, r0
 8011830:	07ce      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
 8011832:	9064      	ld.w      	r3, (r0, 0x10)
 8011834:	d9802003 	ld.w      	r12, (r0, 0xc)
 8011838:	9103      	ld.w      	r0, (r1, 0xc)
 801183a:	9124      	ld.w      	r1, (r1, 0x10)
 801183c:	64c4      	cmphs      	r1, r3
 801183e:	0c05      	bf      	0x8011848	// 8011848 <__fpcmp_parts_d+0xb4>
 8011840:	644e      	cmpne      	r3, r1
 8011842:	0bec      	bt      	0x801181a	// 801181a <__fpcmp_parts_d+0x86>
 8011844:	6700      	cmphs      	r0, r12
 8011846:	0bea      	bt      	0x801181a	// 801181a <__fpcmp_parts_d+0x86>
 8011848:	3000      	movi      	r0, 0
 801184a:	2800      	subi      	r0, 1
 801184c:	3a40      	cmpnei      	r2, 0
 801184e:	3301      	movi      	r3, 1
 8011850:	c4030c20 	incf      	r0, r3, 0
 8011854:	07bc      	br      	0x80117cc	// 80117cc <__fpcmp_parts_d+0x38>
	...

08011858 <__GI_putchar>:
 8011858:	14d0      	push      	r15
 801185a:	1063      	lrw      	r3, 0x20000120	// 8011864 <__GI_putchar+0xc>
 801185c:	9320      	ld.w      	r1, (r3, 0x0)
 801185e:	e000003f 	bsr      	0x80118dc	// 80118dc <__GI_putc>
 8011862:	1490      	pop      	r15
 8011864:	20000120 	.long	0x20000120

08011868 <__GI_puts>:
 8011868:	14d1      	push      	r4, r15
 801186a:	1085      	lrw      	r4, 0x20000120	// 801187c <__GI_puts+0x14>
 801186c:	9420      	ld.w      	r1, (r4, 0x0)
 801186e:	e0000009 	bsr      	0x8011880	// 8011880 <__GI_fputs>
 8011872:	9420      	ld.w      	r1, (r4, 0x0)
 8011874:	300a      	movi      	r0, 10
 8011876:	e0000d45 	bsr      	0x8013300	// 8013300 <fputc>
 801187a:	1491      	pop      	r4, r15
 801187c:	20000120 	.long	0x20000120

08011880 <__GI_fputs>:
 8011880:	14d5      	push      	r4-r8, r15
 8011882:	6d03      	mov      	r4, r0
 8011884:	6d87      	mov      	r6, r1
 8011886:	e9010018 	bez      	r1, 0x80118b6	// 80118b6 <__GI_fputs+0x36>
 801188a:	e5010017 	addi      	r8, r1, 24
 801188e:	6c23      	mov      	r0, r8
 8011890:	e0000020 	bsr      	0x80118d0	// 80118d0 <__GI_os_critical_enter>
 8011894:	8400      	ld.b      	r0, (r4, 0x0)
 8011896:	e9000014 	bez      	r0, 0x80118be	// 80118be <__GI_fputs+0x3e>
 801189a:	3500      	movi      	r5, 0
 801189c:	6dd7      	mov      	r7, r5
 801189e:	2f00      	subi      	r7, 1
 80118a0:	0406      	br      	0x80118ac	// 80118ac <__GI_fputs+0x2c>
 80118a2:	2400      	addi      	r4, 1
 80118a4:	8400      	ld.b      	r0, (r4, 0x0)
 80118a6:	2500      	addi      	r5, 1
 80118a8:	e900000c 	bez      	r0, 0x80118c0	// 80118c0 <__GI_fputs+0x40>
 80118ac:	6c5b      	mov      	r1, r6
 80118ae:	e0000d29 	bsr      	0x8013300	// 8013300 <fputc>
 80118b2:	65c2      	cmpne      	r0, r7
 80118b4:	0bf7      	bt      	0x80118a2	// 80118a2 <__GI_fputs+0x22>
 80118b6:	3500      	movi      	r5, 0
 80118b8:	2d00      	subi      	r5, 1
 80118ba:	6c17      	mov      	r0, r5
 80118bc:	1495      	pop      	r4-r8, r15
 80118be:	6d43      	mov      	r5, r0
 80118c0:	6c23      	mov      	r0, r8
 80118c2:	e0000009 	bsr      	0x80118d4	// 80118d4 <__GI_os_critical_exit>
 80118c6:	6c17      	mov      	r0, r5
 80118c8:	1495      	pop      	r4-r8, r15
	...

080118cc <__GI_os_critical_open>:
 80118cc:	3000      	movi      	r0, 0
 80118ce:	783c      	jmp      	r15

080118d0 <__GI_os_critical_enter>:
 80118d0:	3000      	movi      	r0, 0
 80118d2:	783c      	jmp      	r15

080118d4 <__GI_os_critical_exit>:
 80118d4:	3000      	movi      	r0, 0
 80118d6:	783c      	jmp      	r15

080118d8 <__GI_os_critical_close>:
 80118d8:	3000      	movi      	r0, 0
 80118da:	783c      	jmp      	r15

080118dc <__GI_putc>:
 80118dc:	14d0      	push      	r15
 80118de:	e0000d11 	bsr      	0x8013300	// 8013300 <fputc>
 80118e2:	1490      	pop      	r15

080118e4 <HAL_InitTick>:
 */
void SystemClock_Get(wm_sys_clk *sysclk)
{
	clk_div_reg clk_div;

	clk_div.w = READ_REG(RCC->CLK_DIV);
 80118e4:	ea234000 	movih      	r3, 16384
 80118e8:	e4630dff 	addi      	r3, r3, 3584
	sysclk->apbclk = sysclk->cpuclk / clk_div.b.BUS2;
}


__attribute__((weak)) HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
 80118ec:	6f03      	mov      	r12, r0
	clk_div.w = READ_REG(RCC->CLK_DIV);
 80118ee:	9364      	ld.w      	r3, (r3, 0x10)
	sysclk->cpuclk = W805_PLL_CLK_MHZ/(clk_div.b.CPU);
 80118f0:	748c      	zextb      	r2, r3
 80118f2:	ea0301e0 	movi      	r3, 480
 80118f6:	c4438043 	divs      	r3, r3, r2
	wm_sys_clk sysclk;
	
	SystemClock_Get(&sysclk);
	SysTick_Config(sysclk.cpuclk * UNIT_MHZ / uwTickFreq);
 80118fa:	ea02f424 	movi      	r2, 62500
 80118fe:	c4824902 	rotli      	r2, r2, 4
 8011902:	7cc8      	mult      	r3, r2
 8011904:	ea0203e8 	movi      	r2, 1000
 8011908:	c4438023 	divu      	r3, r3, r2
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 801190c:	104f      	lrw      	r2, 0xe000e010	// 8011948 <HAL_InitTick+0x64>
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
 801190e:	2b00      	subi      	r3, 1
    CORET->LOAD = (uint32_t)(ticks - 1UL);                              /* set reload register */
 8011910:	b261      	st.w      	r3, (r2, 0x4)
	clk_div.w = READ_REG(RCC->CLK_DIV);
 8011912:	3000      	movi      	r0, 0
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011914:	3307      	movi      	r3, 7
    CORET->VAL  = 0UL;                                                  /* Load the CORET Counter Value */
 8011916:	b202      	st.w      	r0, (r2, 0x8)
    CORET->CTRL = CORET_CTRL_CLKSOURCE_Msk |
 8011918:	b260      	st.w      	r3, (r2, 0x0)
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 801191a:	104d      	lrw      	r2, 0xe000e100	// 801194c <HAL_InitTick+0x68>
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 801191c:	c5cc4823 	lsli      	r3, r12, 14
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011920:	d82220c6 	ld.w      	r1, (r2, 0x318)
 8011924:	ea0dff00 	movi      	r13, 65280
 8011928:	6f76      	nor      	r13, r13
 801192a:	6874      	and      	r1, r13
                                 (((priority << (8U - __VIC_PRIO_BITS)) & (uint32_t)0xFFUL) << _BIT_SHIFT(IRQn)));
 801192c:	c40355e3 	zext      	r3, r3, 15, 0
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
 8011930:	6cc4      	or      	r3, r1
 8011932:	dc6220c6 	st.w      	r3, (r2, 0x318)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011936:	ea230200 	movih      	r3, 512
 801193a:	b260      	st.w      	r3, (r2, 0x0)
    VIC->ISSR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 801193c:	dc622050 	st.w      	r3, (r2, 0x140)
	HAL_NVIC_SetPriority(SYS_TICK_IRQn, TickPriority);
	HAL_NVIC_EnableIRQ(SYS_TICK_IRQn);
	uwTickPrio = TickPriority;
 8011940:	1064      	lrw      	r3, 0x20001368	// 8011950 <HAL_InitTick+0x6c>
 8011942:	dd832000 	st.w      	r12, (r3, 0x0)
	return HAL_OK;
}
 8011946:	783c      	jmp      	r15
 8011948:	e000e010 	.long	0xe000e010
 801194c:	e000e100 	.long	0xe000e100
 8011950:	20001368 	.long	0x20001368

08011954 <SystemClock_Config>:
{
 8011954:	14d0      	push      	r15
	if ((clk < 2) || (clk > 240))
 8011956:	5867      	subi      	r3, r0, 2
 8011958:	eb0300ee 	cmphsi      	r3, 239
 801195c:	0826      	bt      	0x80119a8	// 80119a8 <SystemClock_Config+0x54>
    RegValue = READ_REG(RCC->CLK_EN);
 801195e:	ea224000 	movih      	r2, 16384
 8011962:	e4420dff 	addi      	r2, r2, 3584
    RegValue &= ~0x3FFFFF;
 8011966:	ea21ffc0 	movih      	r1, 65472
    RegValue = READ_REG(RCC->CLK_EN);
 801196a:	9260      	ld.w      	r3, (r2, 0x0)
    RegValue &= ~0x3FFFFF;
 801196c:	68c4      	and      	r3, r1
    RegValue |= 0x802;
 801196e:	ec630802 	ori      	r3, r3, 2050
    WRITE_REG(RCC->CLK_EN, RegValue);
 8011972:	b260      	st.w      	r3, (r2, 0x0)
	WRITE_REG(RCC->BBP_CLK, 0x0F);
 8011974:	330f      	movi      	r3, 15
 8011976:	b262      	st.w      	r3, (r2, 0x8)
	RegValue = READ_REG(RCC->CLK_DIV);
 8011978:	9264      	ld.w      	r3, (r2, 0x10)
	RegValue &= 0xFF000000;
 801197a:	ea22ff00 	movih      	r2, 65280
 801197e:	68c8      	and      	r3, r2
	if(cpuDiv > 12)
 8011980:	320c      	movi      	r2, 12
 8011982:	6408      	cmphs      	r2, r0
	RegValue |= 0x80000000;
 8011984:	3bbf      	bseti      	r3, 31
	if(cpuDiv > 12)
 8011986:	0c12      	bf      	0x80119aa	// 80119aa <SystemClock_Config+0x56>
		bus2Fac = (wlanDiv*4/cpuDiv)&0xFF;
 8011988:	c4028022 	divu      	r2, r2, r0
 801198c:	4250      	lsli      	r2, r2, 16
 801198e:	ea010300 	movi      	r1, 768
 8011992:	6c0c      	or      	r0, r3
 8011994:	6c08      	or      	r0, r2
	WRITE_REG(RCC->CLK_DIV, RegValue);
 8011996:	ea234000 	movih      	r3, 16384
 801199a:	e4630dff 	addi      	r3, r3, 3584
	RegValue |= (bus2Fac<<16) | (wlanDiv<<8) | cpuDiv;
 801199e:	6c04      	or      	r0, r1
	WRITE_REG(RCC->CLK_DIV, RegValue);
 80119a0:	b304      	st.w      	r0, (r3, 0x10)
	HAL_InitTick(TICK_INT_PRIORITY);
 80119a2:	3007      	movi      	r0, 7
 80119a4:	e3ffffa0 	bsr      	0x80118e4	// 80118e4 <HAL_InitTick>
}
 80119a8:	1490      	pop      	r15
		wlanDiv = cpuDiv/4;
 80119aa:	4822      	lsri      	r1, r0, 2
 80119ac:	4128      	lsli      	r1, r1, 8
 80119ae:	ea220001 	movih      	r2, 1
 80119b2:	07f0      	br      	0x8011992	// 8011992 <SystemClock_Config+0x3e>

080119b4 <HAL_IncTick>:

__attribute__((weak)) void HAL_IncTick(void)
{
	uwTick += 1;
 80119b4:	1043      	lrw      	r2, 0x20001364	// 80119c0 <HAL_IncTick+0xc>
 80119b6:	9260      	ld.w      	r3, (r2, 0x0)
 80119b8:	2300      	addi      	r3, 1
 80119ba:	b260      	st.w      	r3, (r2, 0x0)
}
 80119bc:	783c      	jmp      	r15
 80119be:	0000      	.short	0x0000
 80119c0:	20001364 	.long	0x20001364

080119c4 <HAL_GetTick>:

__attribute__((weak)) uint32_t HAL_GetTick(void)
{
	return uwTick;
 80119c4:	1062      	lrw      	r3, 0x20001364	// 80119cc <HAL_GetTick+0x8>
 80119c6:	9300      	ld.w      	r0, (r3, 0x0)
}
 80119c8:	783c      	jmp      	r15
 80119ca:	0000      	.short	0x0000
 80119cc:	20001364 	.long	0x20001364

080119d0 <HAL_Delay>:

__attribute__((weak)) void HAL_Delay(uint32_t Delay)
{
 80119d0:	14d2      	push      	r4-r5, r15
 80119d2:	6d43      	mov      	r5, r0
	uint32_t tickstart = HAL_GetTick();
 80119d4:	e3fffff8 	bsr      	0x80119c4	// 80119c4 <HAL_GetTick>
 80119d8:	6d03      	mov      	r4, r0
	uint32_t wait = Delay;

	while ((HAL_GetTick() - tickstart) < wait)
 80119da:	e3fffff5 	bsr      	0x80119c4	// 80119c4 <HAL_GetTick>
 80119de:	6012      	subu      	r0, r4
 80119e0:	6540      	cmphs      	r0, r5
 80119e2:	0ffc      	bf      	0x80119da	// 80119da <HAL_Delay+0xa>
	{
	}
}
 80119e4:	1492      	pop      	r4-r5, r15
	...

080119e8 <main>:
#include "wm_hal.h"

void Error_Handler(void);

int main(void)
{
 80119e8:	14d1      	push      	r4, r15
	SystemClock_Config(CPU_CLK_160M);
 80119ea:	3003      	movi      	r0, 3
 80119ec:	e3ffffb4 	bsr      	0x8011954	// 8011954 <SystemClock_Config>
	printf("enter main\r\n");
 80119f0:	1006      	lrw      	r0, 0x8013464	// 8011a08 <main+0x20>
 80119f2:	e3ffff3b 	bsr      	0x8011868	// 8011868 <__GI_puts>
	
	while (1)
	{
		printf("asdfasdfad\n");
 80119f6:	1086      	lrw      	r4, 0x8013470	// 8011a0c <main+0x24>
 80119f8:	6c13      	mov      	r0, r4
 80119fa:	e3ffff37 	bsr      	0x8011868	// 8011868 <__GI_puts>
		HAL_Delay(10);
 80119fe:	300a      	movi      	r0, 10
 8011a00:	e3ffffe8 	bsr      	0x80119d0	// 80119d0 <HAL_Delay>
 8011a04:	07fa      	br      	0x80119f8	// 80119f8 <main+0x10>
 8011a06:	0000      	.short	0x0000
 8011a08:	08013464 	.long	0x08013464
 8011a0c:	08013470 	.long	0x08013470

08011a10 <CORET_IRQHandler>:

#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
 8011a10:	1460      	nie
 8011a12:	1462      	ipush
 8011a14:	142e      	subi      	r14, r14, 56
 8011a16:	d64e1c2d 	stm      	r18-r31, (r14)
 8011a1a:	1428      	subi      	r14, r14, 32
 8011a1c:	f4ee3400 	fstms      	fr0-fr7, (r14)
 8011a20:	14d0      	push      	r15
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
 8011a22:	1068      	lrw      	r3, 0xe000e000	// 8011a40 <CORET_IRQHandler+0x30>
 8011a24:	9364      	ld.w      	r3, (r3, 0x10)
	HAL_IncTick();
 8011a26:	e3ffffc7 	bsr      	0x80119b4	// 80119b4 <HAL_IncTick>
}
 8011a2a:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8011a2e:	1401      	addi      	r14, r14, 4
 8011a30:	f4ee3000 	fldms      	fr0-fr7, (r14)
 8011a34:	1408      	addi      	r14, r14, 32
 8011a36:	d24e1c2d 	ldm      	r18-r31, (r14)
 8011a3a:	140e      	addi      	r14, r14, 56
 8011a3c:	1463      	ipop
 8011a3e:	1461      	nir
 8011a40:	e000e000 	.long	0xe000e000

08011a44 <SystemInit>:
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
 8011a44:	106a      	lrw      	r3, 0x20000000	// 8011a6c <SystemInit+0x28>
 8011a46:	c0036421 	mtcr      	r3, cr<1, 0>
 */
__ALWAYS_STATIC_INLINE uint32_t __get_CHR(void)
{
    uint32_t result;

    __ASM volatile("mfcr %0, cr<31, 0>\n" :"=r"(result));
 8011a4a:	c01f6023 	mfcr      	r3, cr<31, 0>
    __set_Int_SP((uint32_t)&g_top_irqstack);
    __set_CHR(__get_CHR() | CHR_ISE_Msk);
    VIC->TSPR = 0xFF;
#endif

    __set_CHR(__get_CHR() | CHR_IAE_Msk);
 8011a4e:	ec630010 	ori      	r3, r3, 16
  \details Assigns the given value to the CHR.
  \param [in]    chr  CHR value to set
 */
__ALWAYS_STATIC_INLINE void __set_CHR(uint32_t chr)
{
    __ASM volatile("mtcr %0, cr<31, 0>\n" : : "r"(chr));
 8011a52:	c003643f 	mtcr      	r3, cr<31, 0>

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
 8011a56:	1047      	lrw      	r2, 0xe000e100	// 8011a70 <SystemInit+0x2c>
 8011a58:	3300      	movi      	r3, 0
 8011a5a:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
 8011a5e:	2b00      	subi      	r3, 1
 8011a60:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
 8011a64:	c1807420 	psrset      	ee, ie

#ifdef CONFIG_KERNEL_NONE
    __enable_excp_irq();
#endif
}
 8011a68:	783c      	jmp      	r15
 8011a6a:	0000      	.short	0x0000
 8011a6c:	20000000 	.long	0x20000000
 8011a70:	e000e100 	.long	0xe000e100

08011a74 <trap_c>:
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
 8011a74:	14d4      	push      	r4-r7, r15
 8011a76:	6d43      	mov      	r5, r0
    int i;
    uint32_t vec = 0;
    asm volatile(
 8011a78:	c0006021 	mfcr      	r1, cr<0, 0>
 8011a7c:	4930      	lsri      	r1, r1, 16
 8011a7e:	7446      	sextb      	r1, r1
        "mfcr    %0, psr \n"
        "lsri    %0, 16 \n"
        "sextb   %0 \n"
        :"=r"(vec):);
    //while (1);
    printf("CPU Exception : %u", vec);
 8011a80:	1018      	lrw      	r0, 0x801347c	// 8011ae0 <trap_c+0x6c>
 8011a82:	e0000c4d 	bsr      	0x801331c	// 801331c <wm_printf>
    printf("\n");
 8011a86:	300a      	movi      	r0, 10
 8011a88:	e3fffee8 	bsr      	0x8011858	// 8011858 <__GI_putchar>

    for (i = 0; i < 16; i++) {
        printf("r%d: %08x\t", i, regs[i]);
 8011a8c:	9540      	ld.w      	r2, (r5, 0x0)
 8011a8e:	3100      	movi      	r1, 0
 8011a90:	1015      	lrw      	r0, 0x8013490	// 8011ae4 <trap_c+0x70>
 8011a92:	e0000c45 	bsr      	0x801331c	// 801331c <wm_printf>
    for (i = 0; i < 16; i++) {
 8011a96:	3400      	movi      	r4, 0
        printf("r%d: %08x\t", i, regs[i]);
 8011a98:	10f3      	lrw      	r7, 0x8013490	// 8011ae4 <trap_c+0x70>

        if ((i % 5) == 4) {
 8011a9a:	3605      	movi      	r6, 5
    for (i = 0; i < 16; i++) {
 8011a9c:	2400      	addi      	r4, 1
 8011a9e:	3c50      	cmpnei      	r4, 16
 8011aa0:	0c13      	bf      	0x8011ac6	// 8011ac6 <trap_c+0x52>
        printf("r%d: %08x\t", i, regs[i]);
 8011aa2:	d0850882 	ldr.w      	r2, (r5, r4 << 2)
 8011aa6:	6c53      	mov      	r1, r4
 8011aa8:	6c1f      	mov      	r0, r7
 8011aaa:	e0000c39 	bsr      	0x801331c	// 801331c <wm_printf>
        if ((i % 5) == 4) {
 8011aae:	c4c48043 	divs      	r3, r4, r6
 8011ab2:	7cd8      	mult      	r3, r6
 8011ab4:	5c6d      	subu      	r3, r4, r3
 8011ab6:	3b44      	cmpnei      	r3, 4
 8011ab8:	0bf2      	bt      	0x8011a9c	// 8011a9c <trap_c+0x28>
            printf("\n");
 8011aba:	300a      	movi      	r0, 10
    for (i = 0; i < 16; i++) {
 8011abc:	2400      	addi      	r4, 1
            printf("\n");
 8011abe:	e3fffecd 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    for (i = 0; i < 16; i++) {
 8011ac2:	3c50      	cmpnei      	r4, 16
 8011ac4:	0bef      	bt      	0x8011aa2	// 8011aa2 <trap_c+0x2e>
        }
    }

    printf("\n");
 8011ac6:	300a      	movi      	r0, 10
 8011ac8:	e3fffec8 	bsr      	0x8011858	// 8011858 <__GI_putchar>
    printf("epsr: %8x\n", regs[16]);
 8011acc:	9530      	ld.w      	r1, (r5, 0x40)
 8011ace:	1007      	lrw      	r0, 0x801349c	// 8011ae8 <trap_c+0x74>
 8011ad0:	e0000c26 	bsr      	0x801331c	// 801331c <wm_printf>
    printf("epc : %8x\n", regs[17]);
 8011ad4:	9531      	ld.w      	r1, (r5, 0x44)
 8011ad6:	1006      	lrw      	r0, 0x80134a8	// 8011aec <trap_c+0x78>
 8011ad8:	e0000c22 	bsr      	0x801331c	// 801331c <wm_printf>
 8011adc:	0400      	br      	0x8011adc	// 8011adc <trap_c+0x68>
 8011ade:	0000      	.short	0x0000
 8011ae0:	0801347c 	.long	0x0801347c
 8011ae4:	08013490 	.long	0x08013490
 8011ae8:	0801349c 	.long	0x0801349c
 8011aec:	080134a8 	.long	0x080134a8

08011af0 <board_init>:
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011af0:	106a      	lrw      	r3, 0xe000e100	// 8011b18 <board_init+0x28>
 8011af2:	ea210001 	movih      	r1, 1
 8011af6:	dc232020 	st.w      	r1, (r3, 0x80)
    VIC->ICPR[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011afa:	dc232060 	st.w      	r1, (r3, 0x180)

	NVIC_DisableIRQ(UART0_IRQn);
	NVIC_ClearPendingIRQ(UART0_IRQn);

	bd = (APB_CLK/(16*bandrate) - 1)|(((APB_CLK%(bandrate*16))*16/(bandrate*16))<<16);
	WRITE_REG(UART0->BAUDR, bd);
 8011afe:	1068      	lrw      	r3, 0x40010600	// 8011b1c <board_init+0x2c>
 8011b00:	ea21000b 	movih      	r1, 11
 8011b04:	2113      	addi      	r1, 20
 8011b06:	b324      	st.w      	r1, (r3, 0x10)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
 8011b08:	3200      	movi      	r2, 0

	WRITE_REG(UART0->LC, UART_BITSTOP_VAL | UART_TXEN_BIT | UART_RXEN_BIT);
 8011b0a:	31c3      	movi      	r1, 195
 8011b0c:	b320      	st.w      	r1, (r3, 0x0)
	WRITE_REG(UART0->FC, 0x00);   			/* Disable afc */
 8011b0e:	b341      	st.w      	r2, (r3, 0x4)
	WRITE_REG(UART0->DMAC, 0x00);             		/* Disable DMA */
 8011b10:	b342      	st.w      	r2, (r3, 0x8)
	WRITE_REG(UART0->FIFOC, 0x00);             		/* one byte TX/RX */
 8011b12:	b343      	st.w      	r2, (r3, 0xc)
#else
    uart1_io_init();
    /* use uart1 as log output io */
	uart1Init(115200);
#endif
}
 8011b14:	783c      	jmp      	r15
 8011b16:	0000      	.short	0x0000
 8011b18:	e000e100 	.long	0xe000e100
 8011b1c:	40010600 	.long	0x40010600

08011b20 <_out_uart>:
#include "wm_regs.h"
#include "wm_hal.h"

int sendchar(int ch)
{
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8011b20:	1044      	lrw      	r2, 0x40010600	// 8011b30 <_out_uart+0x10>
 8011b22:	9267      	ld.w      	r3, (r2, 0x1c)
 8011b24:	e463203f 	andi      	r3, r3, 63
 8011b28:	3b1f      	cmphsi      	r3, 32
 8011b2a:	0bfc      	bt      	0x8011b22	// 8011b22 <_out_uart+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 8011b2c:	b208      	st.w      	r0, (r2, 0x20)
}

static inline void _out_uart(char character, void* buffer, size_t idx, size_t maxlen)
{
  _write_r(NULL, 0, &character, 1);
}
 8011b2e:	783c      	jmp      	r15
 8011b30:	40010600 	.long	0x40010600

08011b34 <_out_null>:

// internal null output
static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
{
  (void)character; (void)buffer; (void)idx; (void)maxlen;
}
 8011b34:	783c      	jmp      	r15
	...

08011b38 <_out_rev>:
  return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
 8011b38:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011b3c:	6e4f      	mov      	r9, r3
 8011b3e:	da0e200e 	ld.w      	r16, (r14, 0x38)
 8011b42:	986b      	ld.w      	r3, (r14, 0x2c)
 8011b44:	c4034831 	lsli      	r17, r3, 0
  const size_t start_idx = idx;

  // pad spaces up to given width
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8011b48:	e4702003 	andi      	r3, r16, 3
{
 8011b4c:	6dc3      	mov      	r7, r0
 8011b4e:	6e07      	mov      	r8, r1
 8011b50:	6e8b      	mov      	r10, r2
 8011b52:	98ac      	ld.w      	r5, (r14, 0x30)
 8011b54:	d96e200d 	ld.w      	r11, (r14, 0x34)
  if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
 8011b58:	e9230010 	bnez      	r3, 0x8011b78	// 8011b78 <_out_rev+0x40>
    for (size_t i = len; i < width; i++) {
 8011b5c:	66d4      	cmphs      	r5, r11
 8011b5e:	080d      	bt      	0x8011b78	// 8011b78 <_out_rev+0x40>
 8011b60:	c4ab0086 	subu      	r6, r11, r5
 8011b64:	6188      	addu      	r6, r2
      out(' ', buffer, idx++, maxlen);
 8011b66:	5a82      	addi      	r4, r2, 1
 8011b68:	6ce7      	mov      	r3, r9
 8011b6a:	6c63      	mov      	r1, r8
 8011b6c:	3020      	movi      	r0, 32
 8011b6e:	7bdd      	jsr      	r7
    for (size_t i = len; i < width; i++) {
 8011b70:	6592      	cmpne      	r4, r6
 8011b72:	6c93      	mov      	r2, r4
 8011b74:	0bf9      	bt      	0x8011b66	// 8011b66 <_out_rev+0x2e>
 8011b76:	0402      	br      	0x8011b7a	// 8011b7a <_out_rev+0x42>
 8011b78:	6d2b      	mov      	r4, r10
    }
  }

  // reverse string
  while (len) {
 8011b7a:	e905002a 	bez      	r5, 0x8011bce	// 8011bce <_out_rev+0x96>
 8011b7e:	5dc3      	subi      	r6, r5, 1
 8011b80:	c4114823 	lsli      	r3, r17, 0
 8011b84:	60d8      	addu      	r3, r6
 8011b86:	6d8f      	mov      	r6, r3
 8011b88:	6150      	addu      	r5, r4
    out(buf[--len], buffer, idx++, maxlen);
 8011b8a:	e6240000 	addi      	r17, r4, 1
 8011b8e:	6c93      	mov      	r2, r4
 8011b90:	8600      	ld.b      	r0, (r6, 0x0)
 8011b92:	6ce7      	mov      	r3, r9
 8011b94:	6c63      	mov      	r1, r8
 8011b96:	c4114824 	lsli      	r4, r17, 0
 8011b9a:	7bdd      	jsr      	r7
  while (len) {
 8011b9c:	6552      	cmpne      	r4, r5
 8011b9e:	2e00      	subi      	r6, 1
 8011ba0:	0bf5      	bt      	0x8011b8a	// 8011b8a <_out_rev+0x52>
  }

  // append pad spaces up to given width
  if (flags & FLAGS_LEFT) {
 8011ba2:	e6102002 	andi      	r16, r16, 2
 8011ba6:	e9100011 	bez      	r16, 0x8011bc8	// 8011bc8 <_out_rev+0x90>
    while (idx - start_idx < width) {
 8011baa:	c5450083 	subu      	r3, r5, r10
 8011bae:	66cc      	cmphs      	r3, r11
 8011bb0:	080c      	bt      	0x8011bc8	// 8011bc8 <_out_rev+0x90>
 8011bb2:	6c97      	mov      	r2, r5
      out(' ', buffer, idx++, maxlen);
 8011bb4:	2500      	addi      	r5, 1
 8011bb6:	6ce7      	mov      	r3, r9
 8011bb8:	6c63      	mov      	r1, r8
 8011bba:	3020      	movi      	r0, 32
 8011bbc:	7bdd      	jsr      	r7
    while (idx - start_idx < width) {
 8011bbe:	c5450083 	subu      	r3, r5, r10
 8011bc2:	66cc      	cmphs      	r3, r11
      out(' ', buffer, idx++, maxlen);
 8011bc4:	6c97      	mov      	r2, r5
    while (idx - start_idx < width) {
 8011bc6:	0ff7      	bf      	0x8011bb4	// 8011bb4 <_out_rev+0x7c>
    }
  }

  return idx;
}
 8011bc8:	6c17      	mov      	r0, r5
 8011bca:	ebc00058 	pop      	r4-r11, r15, r16-r17
  while (len) {
 8011bce:	6d53      	mov      	r5, r4
 8011bd0:	07e9      	br      	0x8011ba2	// 8011ba2 <_out_rev+0x6a>
	...

08011bd4 <_ntoa_format>:

// internal itoa format
static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8011bd4:	14d1      	push      	r4, r15
 8011bd6:	1424      	subi      	r14, r14, 16
 8011bd8:	d9ae2009 	ld.w      	r13, (r14, 0x24)
 8011bdc:	da8e200c 	ld.w      	r20, (r14, 0x30)
 8011be0:	c40d4839 	lsli      	r25, r13, 0
  // pad leading zeros
  if (!(flags & FLAGS_LEFT)) {
 8011be4:	e5b42002 	andi      	r13, r20, 2
{
 8011be8:	dace2006 	ld.w      	r22, (r14, 0x18)
 8011bec:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8011bf0:	da6e200a 	ld.w      	r19, (r14, 0x28)
 8011bf4:	da4e200b 	ld.w      	r18, (r14, 0x2c)
 8011bf8:	daee0020 	ld.b      	r23, (r14, 0x20)
  if (!(flags & FLAGS_LEFT)) {
 8011bfc:	e92d0039 	bnez      	r13, 0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8011c00:	e9320071 	bnez      	r18, 0x8011ce2	// 8011ce2 <_ntoa_format+0x10e>
      width--;
    }
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c04:	c66c0420 	cmphs      	r12, r19
 8011c08:	0833      	bt      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
 8011c0a:	eb0c001f 	cmphsi      	r12, 32
 8011c0e:	e7142001 	andi      	r24, r20, 1
 8011c12:	082e      	bt      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
 8011c14:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8011c18:	ea150030 	movi      	r21, 48
 8011c1c:	0406      	br      	0x8011c28	// 8011c28 <_ntoa_format+0x54>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c1e:	eb4c0020 	cmpnei      	r12, 32
 8011c22:	e5ad0000 	addi      	r13, r13, 1
 8011c26:	0c08      	bf      	0x8011c36	// 8011c36 <_ntoa_format+0x62>
      buf[len++] = '0';
 8011c28:	e58c0000 	addi      	r12, r12, 1
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c2c:	c66c0420 	cmphs      	r12, r19
      buf[len++] = '0';
 8011c30:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c34:	0ff5      	bf      	0x8011c1e	// 8011c1e <_ntoa_format+0x4a>
    }
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c36:	e918001c 	bez      	r24, 0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
 8011c3a:	c64c0420 	cmphs      	r12, r18
 8011c3e:	0818      	bt      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
 8011c40:	ea0d001f 	movi      	r13, 31
 8011c44:	6734      	cmphs      	r13, r12
 8011c46:	0c62      	bf      	0x8011d0a	// 8011d0a <_ntoa_format+0x136>
 8011c48:	c596002d 	addu      	r13, r22, r12
      buf[len++] = '0';
 8011c4c:	ea150030 	movi      	r21, 48
 8011c50:	0406      	br      	0x8011c5c	// 8011c5c <_ntoa_format+0x88>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c52:	eb4c0020 	cmpnei      	r12, 32
 8011c56:	e5ad0000 	addi      	r13, r13, 1
 8011c5a:	0c58      	bf      	0x8011d0a	// 8011d0a <_ntoa_format+0x136>
      buf[len++] = '0';
 8011c5c:	e58c0000 	addi      	r12, r12, 1
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c60:	c64c0480 	cmpne      	r12, r18
      buf[len++] = '0';
 8011c64:	dead0000 	st.b      	r21, (r13, 0x0)
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c68:	0bf5      	bt      	0x8011c52	// 8011c52 <_ntoa_format+0x7e>
      buf[len++] = '0';
 8011c6a:	c40c4832 	lsli      	r18, r12, 0
    }
  }

  // handle hash
  if (flags & FLAGS_HASH) {
 8011c6e:	e5b42010 	andi      	r13, r20, 16
 8011c72:	e90d0019 	bez      	r13, 0x8011ca4	// 8011ca4 <_ntoa_format+0xd0>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8011c76:	e5b42400 	andi      	r13, r20, 1024
 8011c7a:	e92d0004 	bnez      	r13, 0x8011c82	// 8011c82 <_ntoa_format+0xae>
 8011c7e:	e92c004e 	bnez      	r12, 0x8011d1a	// 8011d1a <_ntoa_format+0x146>
      len--;
      if (len && (base == 16U)) {
        len--;
      }
    }
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c82:	c4194824 	lsli      	r4, r25, 0
 8011c86:	3c50      	cmpnei      	r4, 16
 8011c88:	0c74      	bf      	0x8011d70	// 8011d70 <_ntoa_format+0x19c>
      buf[len++] = 'x';
    }
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
      buf[len++] = 'X';
    }
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011c8a:	c4194824 	lsli      	r4, r25, 0
 8011c8e:	3c42      	cmpnei      	r4, 2
 8011c90:	0c7e      	bf      	0x8011d8c	// 8011d8c <_ntoa_format+0x1b8>
      buf[len++] = 'b';
    }
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8011c92:	eb0c001f 	cmphsi      	r12, 32
 8011c96:	081a      	bt      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
      buf[len++] = '0';
 8011c98:	ea0d0030 	movi      	r13, 48
 8011c9c:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011ca0:	e58c0000 	addi      	r12, r12, 1
    }
  }

  if (len < PRINTF_NTOA_BUFFER_SIZE) {
 8011ca4:	eb0c001f 	cmphsi      	r12, 32
 8011ca8:	0811      	bt      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
    if (negative) {
 8011caa:	e9370048 	bnez      	r23, 0x8011d3a	// 8011d3a <_ntoa_format+0x166>
      buf[len++] = '-';
    }
    else if (flags & FLAGS_PLUS) {
 8011cae:	e5b42004 	andi      	r13, r20, 4
 8011cb2:	e92d0056 	bnez      	r13, 0x8011d5e	// 8011d5e <_ntoa_format+0x18a>
      buf[len++] = '+';  // ignore the space if the '+' exists
    }
    else if (flags & FLAGS_SPACE) {
 8011cb6:	e5b42008 	andi      	r13, r20, 8
 8011cba:	e90d0008 	bez      	r13, 0x8011cca	// 8011cca <_ntoa_format+0xf6>
      buf[len++] = ' ';
 8011cbe:	ea0d0020 	movi      	r13, 32
 8011cc2:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011cc6:	e58c0000 	addi      	r12, r12, 1
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8011cca:	de8e2003 	st.w      	r20, (r14, 0xc)
 8011cce:	de4e2002 	st.w      	r18, (r14, 0x8)
 8011cd2:	dd8e2001 	st.w      	r12, (r14, 0x4)
 8011cd6:	dece2000 	st.w      	r22, (r14, 0x0)
 8011cda:	e3ffff2f 	bsr      	0x8011b38	// 8011b38 <_out_rev>
}
 8011cde:	1404      	addi      	r14, r14, 16
 8011ce0:	1491      	pop      	r4, r15
    if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8011ce2:	e7142001 	andi      	r24, r20, 1
 8011ce6:	e9180031 	bez      	r24, 0x8011d48	// 8011d48 <_ntoa_format+0x174>
 8011cea:	e9370037 	bnez      	r23, 0x8011d58	// 8011d58 <_ntoa_format+0x184>
 8011cee:	e5b4200c 	andi      	r13, r20, 12
 8011cf2:	e92d0033 	bnez      	r13, 0x8011d58	// 8011d58 <_ntoa_format+0x184>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011cf6:	c66c0420 	cmphs      	r12, r19
 8011cfa:	0ba0      	bt      	0x8011c3a	// 8011c3a <_ntoa_format+0x66>
 8011cfc:	ea0d001f 	movi      	r13, 31
 8011d00:	6734      	cmphs      	r13, r12
 8011d02:	0b89      	bt      	0x8011c14	// 8011c14 <_ntoa_format+0x40>
    while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011d04:	c64c0420 	cmphs      	r12, r18
 8011d08:	0bb3      	bt      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
  if (flags & FLAGS_HASH) {
 8011d0a:	e5b42010 	andi      	r13, r20, 16
 8011d0e:	e90dffde 	bez      	r13, 0x8011cca	// 8011cca <_ntoa_format+0xf6>
    if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
 8011d12:	e5b42400 	andi      	r13, r20, 1024
 8011d16:	e92dffb6 	bnez      	r13, 0x8011c82	// 8011c82 <_ntoa_format+0xae>
 8011d1a:	c5930480 	cmpne      	r19, r12
 8011d1e:	0c04      	bf      	0x8011d26	// 8011d26 <_ntoa_format+0x152>
 8011d20:	c64c0480 	cmpne      	r12, r18
 8011d24:	0baf      	bt      	0x8011c82	// 8011c82 <_ntoa_format+0xae>
      len--;
 8011d26:	e5ac1000 	subi      	r13, r12, 1
      if (len && (base == 16U)) {
 8011d2a:	e90d0046 	bez      	r13, 0x8011db6	// 8011db6 <_ntoa_format+0x1e2>
 8011d2e:	c4194824 	lsli      	r4, r25, 0
 8011d32:	3c50      	cmpnei      	r4, 16
 8011d34:	0c1c      	bf      	0x8011d6c	// 8011d6c <_ntoa_format+0x198>
 8011d36:	6f37      	mov      	r12, r13
 8011d38:	07a9      	br      	0x8011c8a	// 8011c8a <_ntoa_format+0xb6>
      buf[len++] = '-';
 8011d3a:	ea0d002d 	movi      	r13, 45
 8011d3e:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011d42:	e58c0000 	addi      	r12, r12, 1
 8011d46:	07c2      	br      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
    while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011d48:	c66c0420 	cmphs      	r12, r19
 8011d4c:	0b91      	bt      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
 8011d4e:	ea0d001f 	movi      	r13, 31
 8011d52:	6734      	cmphs      	r13, r12
 8011d54:	0b60      	bt      	0x8011c14	// 8011c14 <_ntoa_format+0x40>
 8011d56:	078c      	br      	0x8011c6e	// 8011c6e <_ntoa_format+0x9a>
      width--;
 8011d58:	e6521000 	subi      	r18, r18, 1
 8011d5c:	07cd      	br      	0x8011cf6	// 8011cf6 <_ntoa_format+0x122>
      buf[len++] = '+';  // ignore the space if the '+' exists
 8011d5e:	ea0d002b 	movi      	r13, 43
 8011d62:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011d66:	e58c0000 	addi      	r12, r12, 1
 8011d6a:	07b0      	br      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
        len--;
 8011d6c:	e58c1001 	subi      	r12, r12, 2
    if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011d70:	e5b42020 	andi      	r13, r20, 32
 8011d74:	e92d0016 	bnez      	r13, 0x8011da0	// 8011da0 <_ntoa_format+0x1cc>
 8011d78:	eb0c001f 	cmphsi      	r12, 32
 8011d7c:	0ba7      	bt      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
      buf[len++] = 'x';
 8011d7e:	ea0d0078 	movi      	r13, 120
 8011d82:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011d86:	e58c0000 	addi      	r12, r12, 1
 8011d8a:	0784      	br      	0x8011c92	// 8011c92 <_ntoa_format+0xbe>
    else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011d8c:	eb0c001f 	cmphsi      	r12, 32
 8011d90:	0b9d      	bt      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
      buf[len++] = 'b';
 8011d92:	ea0d0062 	movi      	r13, 98
 8011d96:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011d9a:	e58c0000 	addi      	r12, r12, 1
 8011d9e:	077a      	br      	0x8011c92	// 8011c92 <_ntoa_format+0xbe>
    else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
 8011da0:	ea0d001f 	movi      	r13, 31
 8011da4:	6734      	cmphs      	r13, r12
 8011da6:	0f92      	bf      	0x8011cca	// 8011cca <_ntoa_format+0xf6>
      buf[len++] = 'X';
 8011da8:	ea0d0058 	movi      	r13, 88
 8011dac:	d596002d 	str.b      	r13, (r22, r12 << 0)
 8011db0:	e58c0000 	addi      	r12, r12, 1
 8011db4:	076f      	br      	0x8011c92	// 8011c92 <_ntoa_format+0xbe>
 8011db6:	6f37      	mov      	r12, r13
 8011db8:	0765      	br      	0x8011c82	// 8011c82 <_ntoa_format+0xae>
	...

08011dbc <_ntoa_long>:


// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8011dbc:	14d3      	push      	r4-r6, r15
 8011dbe:	142f      	subi      	r14, r14, 60
 8011dc0:	d9ae2016 	ld.w      	r13, (r14, 0x58)
 8011dc4:	d98e2013 	ld.w      	r12, (r14, 0x4c)
 8011dc8:	6d77      	mov      	r5, r13
 8011dca:	d9ae2017 	ld.w      	r13, (r14, 0x5c)
 8011dce:	da8e2015 	ld.w      	r20, (r14, 0x54)
 8011dd2:	6db7      	mov      	r6, r13
 8011dd4:	db0e2018 	ld.w      	r24, (r14, 0x60)
 8011dd8:	d88e0050 	ld.b      	r4, (r14, 0x50)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8011ddc:	e92c000a 	bnez      	r12, 0x8011df0	// 8011df0 <_ntoa_long+0x34>
    flags &= ~FLAGS_HASH;
 8011de0:	c498282d 	bclri      	r13, r24, 4
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8011de4:	e7182400 	andi      	r24, r24, 1024
 8011de8:	e9380043 	bnez      	r24, 0x8011e6e	// 8011e6e <_ntoa_long+0xb2>
    flags &= ~FLAGS_HASH;
 8011dec:	c40d4838 	lsli      	r24, r13, 0
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8011df0:	e5b82020 	andi      	r13, r24, 32
 8011df4:	eb4d0000 	cmpnei      	r13, 0
 8011df8:	ea170041 	movi      	r23, 65
 8011dfc:	ea0d0061 	movi      	r13, 97
 8011e00:	c6ed0c20 	incf      	r23, r13, 0
 8011e04:	e72e001b 	addi      	r25, r14, 28
 8011e08:	c4194832 	lsli      	r18, r25, 0
 8011e0c:	ea150000 	movi      	r21, 0
 8011e10:	e6f71009 	subi      	r23, r23, 10
 8011e14:	ea130020 	movi      	r19, 32
      const char digit = (char)(value % base);
 8011e18:	c68c802d 	divu      	r13, r12, r20
 8011e1c:	c68d8436 	mult      	r22, r13, r20
 8011e20:	c6cc008c 	subu      	r12, r12, r22
 8011e24:	7730      	zextb      	r12, r12
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8011e26:	eb0c0009 	cmphsi      	r12, 10
 8011e2a:	e6b50000 	addi      	r21, r21, 1
 8011e2e:	081c      	bt      	0x8011e66	// 8011e66 <_ntoa_long+0xaa>
 8011e30:	e58c002f 	addi      	r12, r12, 48
 8011e34:	7730      	zextb      	r12, r12
 8011e36:	dd920000 	st.b      	r12, (r18, 0x0)
      value /= base;
 8011e3a:	6f37      	mov      	r12, r13
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8011e3c:	e90d0006 	bez      	r13, 0x8011e48	// 8011e48 <_ntoa_long+0x8c>
 8011e40:	e6520000 	addi      	r18, r18, 1
 8011e44:	e833ffea 	bnezad      	r19, 0x8011e18	// 8011e18 <_ntoa_long+0x5c>
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8011e48:	df0e2006 	st.w      	r24, (r14, 0x18)
 8011e4c:	b8c5      	st.w      	r6, (r14, 0x14)
 8011e4e:	b8a4      	st.w      	r5, (r14, 0x10)
 8011e50:	de8e2003 	st.w      	r20, (r14, 0xc)
 8011e54:	b882      	st.w      	r4, (r14, 0x8)
 8011e56:	deae2001 	st.w      	r21, (r14, 0x4)
 8011e5a:	df2e2000 	st.w      	r25, (r14, 0x0)
 8011e5e:	e3fffebb 	bsr      	0x8011bd4	// 8011bd4 <_ntoa_format>
}
 8011e62:	140f      	addi      	r14, r14, 60
 8011e64:	1493      	pop      	r4-r6, r15
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8011e66:	c6ec002c 	addu      	r12, r12, r23
 8011e6a:	7730      	zextb      	r12, r12
 8011e6c:	07e5      	br      	0x8011e36	// 8011e36 <_ntoa_long+0x7a>
    flags &= ~FLAGS_HASH;
 8011e6e:	c40d4838 	lsli      	r24, r13, 0
  size_t len = 0U;
 8011e72:	c40c4835 	lsli      	r21, r12, 0
 8011e76:	e72e001b 	addi      	r25, r14, 28
 8011e7a:	07e7      	br      	0x8011e48	// 8011e48 <_ntoa_long+0x8c>

08011e7c <_ntoa_long_long>:


// internal itoa for 'long long' type
#if defined(PRINTF_SUPPORT_LONG_LONG)
static size_t _ntoa_long_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long long value, bool negative, unsigned long long base, unsigned int prec, unsigned int width, unsigned int flags)
{
 8011e7c:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011e80:	1435      	subi      	r14, r14, 84
 8011e82:	c4034831 	lsli      	r17, r3, 0
 8011e86:	d96e2020 	ld.w      	r11, (r14, 0x80)
 8011e8a:	9965      	ld.w      	r3, (r14, 0x94)
 8011e8c:	da0e2021 	ld.w      	r16, (r14, 0x84)
 8011e90:	b86b      	st.w      	r3, (r14, 0x2c)
  char buf[PRINTF_NTOA_BUFFER_SIZE];
  size_t len = 0U;

  // no hash for 0 values
  if (!value) {
 8011e92:	c60b2424 	or      	r4, r11, r16
{
 8011e96:	9966      	ld.w      	r3, (r14, 0x98)
 8011e98:	b86c      	st.w      	r3, (r14, 0x30)
 8011e9a:	d86e0088 	ld.b      	r3, (r14, 0x88)
 8011e9e:	b807      	st.w      	r0, (r14, 0x1c)
 8011ea0:	b828      	st.w      	r1, (r14, 0x20)
 8011ea2:	b849      	st.w      	r2, (r14, 0x24)
 8011ea4:	99c3      	ld.w      	r6, (r14, 0x8c)
 8011ea6:	99e4      	ld.w      	r7, (r14, 0x90)
 8011ea8:	d94e2027 	ld.w      	r10, (r14, 0x9c)
 8011eac:	b86a      	st.w      	r3, (r14, 0x28)
  if (!value) {
 8011eae:	e9240009 	bnez      	r4, 0x8011ec0	// 8011ec0 <_ntoa_long_long+0x44>
    flags &= ~FLAGS_HASH;
  }

  // write if precision != 0 and value is != 0
  if (!(flags & FLAGS_PRECISION) || value) {
 8011eb2:	e44a2400 	andi      	r2, r10, 1024
    flags &= ~FLAGS_HASH;
 8011eb6:	c48a2823 	bclri      	r3, r10, 4
 8011eba:	6e8f      	mov      	r10, r3
  if (!(flags & FLAGS_PRECISION) || value) {
 8011ebc:	e9220033 	bnez      	r2, 0x8011f22	// 8011f22 <_ntoa_long_long+0xa6>
    do {
      const char digit = (char)(value % base);
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8011ec0:	e46a2020 	andi      	r3, r10, 32
 8011ec4:	3b40      	cmpnei      	r3, 0
 8011ec6:	ea080041 	movi      	r8, 65
 8011eca:	3361      	movi      	r3, 97
 8011ecc:	c5030c20 	incf      	r8, r3, 0
 8011ed0:	e52e0033 	addi      	r9, r14, 52
 8011ed4:	6d67      	mov      	r5, r9
 8011ed6:	3400      	movi      	r4, 0
 8011ed8:	e5081009 	subi      	r8, r8, 10
 8011edc:	0415      	br      	0x8011f06	// 8011f06 <_ntoa_long_long+0x8a>
 8011ede:	202f      	addi      	r0, 48
 8011ee0:	7400      	zextb      	r0, r0
 8011ee2:	a500      	st.b      	r0, (r5, 0x0)
      value /= base;
 8011ee4:	c4104821 	lsli      	r1, r16, 0
 8011ee8:	6c2f      	mov      	r0, r11
 8011eea:	6c9b      	mov      	r2, r6
 8011eec:	6cdf      	mov      	r3, r7
 8011eee:	e3fff393 	bsr      	0x8010614	// 8010614 <__udivdi3>
 8011ef2:	c4014830 	lsli      	r16, r1, 0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8011ef6:	6c40      	or      	r1, r0
      value /= base;
 8011ef8:	6ec3      	mov      	r11, r0
    } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
 8011efa:	e9010016 	bez      	r1, 0x8011f26	// 8011f26 <_ntoa_long_long+0xaa>
 8011efe:	eb440020 	cmpnei      	r4, 32
 8011f02:	2500      	addi      	r5, 1
 8011f04:	0c11      	bf      	0x8011f26	// 8011f26 <_ntoa_long_long+0xaa>
      const char digit = (char)(value % base);
 8011f06:	6c9b      	mov      	r2, r6
 8011f08:	6cdf      	mov      	r3, r7
 8011f0a:	6c2f      	mov      	r0, r11
 8011f0c:	c4104821 	lsli      	r1, r16, 0
 8011f10:	e3fff51c 	bsr      	0x8010948	// 8010948 <__umoddi3>
 8011f14:	7400      	zextb      	r0, r0
      buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
 8011f16:	3809      	cmphsi      	r0, 10
 8011f18:	2400      	addi      	r4, 1
 8011f1a:	0fe2      	bf      	0x8011ede	// 8011ede <_ntoa_long_long+0x62>
 8011f1c:	6020      	addu      	r0, r8
 8011f1e:	7400      	zextb      	r0, r0
 8011f20:	07e1      	br      	0x8011ee2	// 8011ee2 <_ntoa_long_long+0x66>
 8011f22:	e52e0033 	addi      	r9, r14, 52
  }

  return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
 8011f26:	986c      	ld.w      	r3, (r14, 0x30)
 8011f28:	b865      	st.w      	r3, (r14, 0x14)
 8011f2a:	986b      	ld.w      	r3, (r14, 0x2c)
 8011f2c:	b864      	st.w      	r3, (r14, 0x10)
 8011f2e:	986a      	ld.w      	r3, (r14, 0x28)
 8011f30:	b862      	st.w      	r3, (r14, 0x8)
 8011f32:	dd4e2006 	st.w      	r10, (r14, 0x18)
 8011f36:	b8c3      	st.w      	r6, (r14, 0xc)
 8011f38:	b881      	st.w      	r4, (r14, 0x4)
 8011f3a:	dd2e2000 	st.w      	r9, (r14, 0x0)
 8011f3e:	c4114823 	lsli      	r3, r17, 0
 8011f42:	9849      	ld.w      	r2, (r14, 0x24)
 8011f44:	9828      	ld.w      	r1, (r14, 0x20)
 8011f46:	9807      	ld.w      	r0, (r14, 0x1c)
 8011f48:	e3fffe46 	bsr      	0x8011bd4	// 8011bd4 <_ntoa_format>
}
 8011f4c:	1415      	addi      	r14, r14, 84
 8011f4e:	ebc00058 	pop      	r4-r11, r15, r16-r17
	...

08011f54 <_ftoa>:
#endif


// internal ftoa for fixed decimal floating point
static size_t _ftoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 8011f54:	ebe00058 	push      	r4-r11, r15, r16-r17
 8011f58:	1435      	subi      	r14, r14, 84
 8011f5a:	6ecf      	mov      	r11, r3
 8011f5c:	9962      	ld.w      	r3, (r14, 0x88)
 8011f5e:	6e4f      	mov      	r9, r3
 8011f60:	9963      	ld.w      	r3, (r14, 0x8c)
 8011f62:	9980      	ld.w      	r4, (r14, 0x80)
 8011f64:	99a1      	ld.w      	r5, (r14, 0x84)
 8011f66:	b865      	st.w      	r3, (r14, 0x14)
 8011f68:	9964      	ld.w      	r3, (r14, 0x90)
 8011f6a:	6d83      	mov      	r6, r0
 8011f6c:	6dc7      	mov      	r7, r1
 8011f6e:	6e8b      	mov      	r10, r2
 8011f70:	b866      	st.w      	r3, (r14, 0x18)

  // powers of 10
  static const double pow10[] = { 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000 };

  // test for special values
  if (value != value)
 8011f72:	6c93      	mov      	r2, r4
 8011f74:	6cd7      	mov      	r3, r5
 8011f76:	6c13      	mov      	r0, r4
 8011f78:	6c57      	mov      	r1, r5
 8011f7a:	e3fff99d 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 8011f7e:	e920010c 	bnez      	r0, 0x8012196	// 8012196 <_ftoa+0x242>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
  if (value < -DBL_MAX)
 8011f82:	3200      	movi      	r2, 0
 8011f84:	ea23fff0 	movih      	r3, 65520
 8011f88:	2a00      	subi      	r2, 1
 8011f8a:	2b00      	subi      	r3, 1
 8011f8c:	6c13      	mov      	r0, r4
 8011f8e:	9921      	ld.w      	r1, (r14, 0x84)
 8011f90:	e3fff9ee 	bsr      	0x801136c	// 801136c <__ltdf2>
 8011f94:	e980011b 	blz      	r0, 0x80121ca	// 80121ca <_ftoa+0x276>
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
  if (value > DBL_MAX)
 8011f98:	3200      	movi      	r2, 0
 8011f9a:	ea237ff0 	movih      	r3, 32752
 8011f9e:	2a00      	subi      	r2, 1
 8011fa0:	2b00      	subi      	r3, 1
 8011fa2:	6c13      	mov      	r0, r4
 8011fa4:	9921      	ld.w      	r1, (r14, 0x84)
 8011fa6:	e3fff9a3 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8011faa:	e960001d 	blsz      	r0, 0x8011fe4	// 8011fe4 <_ftoa+0x90>
    return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
 8011fae:	9806      	ld.w      	r0, (r14, 0x18)
 8011fb0:	e4402004 	andi      	r2, r0, 4
 8011fb4:	3a40      	cmpnei      	r2, 0
 8011fb6:	0137      	lrw      	r1, 0x801369c	// 80122d4 <_ftoa+0x380>
 8011fb8:	0177      	lrw      	r3, 0x8013694	// 80122d8 <_ftoa+0x384>
 8011fba:	c4610c20 	incf      	r3, r1, 0
 8011fbe:	3a40      	cmpnei      	r2, 0
 8011fc0:	3103      	movi      	r1, 3
 8011fc2:	3204      	movi      	r2, 4
 8011fc4:	c4410c20 	incf      	r2, r1, 0
 8011fc8:	9825      	ld.w      	r1, (r14, 0x14)
 8011fca:	b803      	st.w      	r0, (r14, 0xc)
 8011fcc:	b822      	st.w      	r1, (r14, 0x8)
 8011fce:	b841      	st.w      	r2, (r14, 0x4)
 8011fd0:	b860      	st.w      	r3, (r14, 0x0)
    else if (flags & FLAGS_SPACE) {
      buf[len++] = ' ';
    }
  }

  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 8011fd2:	6cef      	mov      	r3, r11
 8011fd4:	6cab      	mov      	r2, r10
 8011fd6:	6c5f      	mov      	r1, r7
 8011fd8:	6c1b      	mov      	r0, r6
 8011fda:	e3fffdaf 	bsr      	0x8011b38	// 8011b38 <_out_rev>
}
 8011fde:	1415      	addi      	r14, r14, 84
 8011fe0:	ebc00058 	pop      	r4-r11, r15, r16-r17
  if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
 8011fe4:	3200      	movi      	r2, 0
 8011fe6:	0261      	lrw      	r3, 0x41cdcd65	// 80122dc <_ftoa+0x388>
 8011fe8:	6c13      	mov      	r0, r4
 8011fea:	9921      	ld.w      	r1, (r14, 0x84)
 8011fec:	e3fff980 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8011ff0:	e94000dc 	bhz      	r0, 0x80121a8	// 80121a8 <_ftoa+0x254>
 8011ff4:	3200      	movi      	r2, 0
 8011ff6:	0264      	lrw      	r3, 0xc1cdcd65	// 80122e0 <_ftoa+0x38c>
 8011ff8:	6c13      	mov      	r0, r4
 8011ffa:	9921      	ld.w      	r1, (r14, 0x84)
 8011ffc:	e3fff9b8 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012000:	e98000d4 	blz      	r0, 0x80121a8	// 80121a8 <_ftoa+0x254>
  if (value < 0) {
 8012004:	3200      	movi      	r2, 0
 8012006:	6ccb      	mov      	r3, r2
 8012008:	6c13      	mov      	r0, r4
 801200a:	9921      	ld.w      	r1, (r14, 0x84)
 801200c:	e3fff9b0 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012010:	e98001b0 	blz      	r0, 0x8012370	// 8012370 <_ftoa+0x41c>
  bool negative = false;
 8012014:	3300      	movi      	r3, 0
 8012016:	b86c      	st.w      	r3, (r14, 0x30)
  if (!(flags & FLAGS_PRECISION)) {
 8012018:	9866      	ld.w      	r3, (r14, 0x18)
 801201a:	e5a32400 	andi      	r13, r3, 1024
 801201e:	e92d0136 	bnez      	r13, 0x801228a	// 801228a <_ftoa+0x336>
 8012022:	026e      	lrw      	r3, 0x412e8480	// 80122e4 <_ftoa+0x390>
 8012024:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8012028:	b868      	st.w      	r3, (r14, 0x20)
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801202a:	ea080006 	movi      	r8, 6
 801202e:	e68e0033 	addi      	r20, r14, 52
  int whole = (int)value;
 8012032:	6c57      	mov      	r1, r5
 8012034:	6c13      	mov      	r0, r4
 8012036:	de8e200b 	st.w      	r20, (r14, 0x2c)
 801203a:	ddae200a 	st.w      	r13, (r14, 0x28)
 801203e:	e3fff9e7 	bsr      	0x801140c	// 801140c <__fixdfsi>
 8012042:	6e43      	mov      	r9, r0
  double tmp = (value - whole) * pow10[prec];
 8012044:	e3fff9b0 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012048:	6c83      	mov      	r2, r0
 801204a:	6cc7      	mov      	r3, r1
 801204c:	6c13      	mov      	r0, r4
 801204e:	6c57      	mov      	r1, r5
 8012050:	e3fff788 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 8012054:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 8012058:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 801205c:	6cb3      	mov      	r2, r12
 801205e:	9868      	ld.w      	r3, (r14, 0x20)
 8012060:	e3fff79e 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012064:	c4014831 	lsli      	r17, r1, 0
 8012068:	c4004830 	lsli      	r16, r0, 0
  unsigned long frac = (unsigned long)tmp;
 801206c:	e3fff2b8 	bsr      	0x80105dc	// 80105dc <__fixunsdfsi>
 8012070:	b809      	st.w      	r0, (r14, 0x24)
  diff = tmp - frac;
 8012072:	e3fffa05 	bsr      	0x801147c	// 801147c <__floatunsidf>
 8012076:	6c83      	mov      	r2, r0
 8012078:	6cc7      	mov      	r3, r1
 801207a:	c4104820 	lsli      	r0, r16, 0
 801207e:	c4114821 	lsli      	r1, r17, 0
 8012082:	e3fff76f 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  if (diff > 0.5) {
 8012086:	3200      	movi      	r2, 0
 8012088:	ea233fe0 	movih      	r3, 16352
  diff = tmp - frac;
 801208c:	c4004830 	lsli      	r16, r0, 0
 8012090:	c4014831 	lsli      	r17, r1, 0
  if (diff > 0.5) {
 8012094:	e3fff92c 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 8012098:	da4e2009 	ld.w      	r18, (r14, 0x24)
 801209c:	d9ae200a 	ld.w      	r13, (r14, 0x28)
 80120a0:	da8e200b 	ld.w      	r20, (r14, 0x2c)
 80120a4:	e96000d3 	blsz      	r0, 0x801224a	// 801224a <_ftoa+0x2f6>
    ++frac;
 80120a8:	e6520000 	addi      	r18, r18, 1
    if (frac >= pow10[prec]) {
 80120ac:	c4124820 	lsli      	r0, r18, 0
 80120b0:	de8e2009 	st.w      	r20, (r14, 0x24)
 80120b4:	c40d4831 	lsli      	r17, r13, 0
 80120b8:	c4124830 	lsli      	r16, r18, 0
 80120bc:	e3fff9e0 	bsr      	0x801147c	// 801147c <__floatunsidf>
 80120c0:	d98e2007 	ld.w      	r12, (r14, 0x1c)
 80120c4:	d9ae2008 	ld.w      	r13, (r14, 0x20)
 80120c8:	6cf7      	mov      	r3, r13
 80120ca:	6cb3      	mov      	r2, r12
 80120cc:	e3fff930 	bsr      	0x801132c	// 801132c <__gedf2>
 80120d0:	c4104832 	lsli      	r18, r16, 0
 80120d4:	c411482d 	lsli      	r13, r17, 0
 80120d8:	da8e2009 	ld.w      	r20, (r14, 0x24)
 80120dc:	e9a0011f 	bhsz      	r0, 0x801231a	// 801231a <_ftoa+0x3c6>
  if (prec == 0U) {
 80120e0:	e928007e 	bnez      	r8, 0x80121dc	// 80121dc <_ftoa+0x288>
    diff = value - (double)whole;
 80120e4:	6c27      	mov      	r0, r9
 80120e6:	c4144831 	lsli      	r17, r20, 0
 80120ea:	c40d4830 	lsli      	r16, r13, 0
 80120ee:	e3fff95b 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 80120f2:	6c83      	mov      	r2, r0
 80120f4:	6cc7      	mov      	r3, r1
 80120f6:	6c13      	mov      	r0, r4
 80120f8:	6c57      	mov      	r1, r5
 80120fa:	e3fff733 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80120fe:	6ca3      	mov      	r2, r8
 8012100:	ea233fe0 	movih      	r3, 16352
    diff = value - (double)whole;
 8012104:	6d03      	mov      	r4, r0
 8012106:	6d47      	mov      	r5, r1
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 8012108:	e3fff932 	bsr      	0x801136c	// 801136c <__ltdf2>
 801210c:	c410482d 	lsli      	r13, r16, 0
 8012110:	c4114834 	lsli      	r20, r17, 0
 8012114:	e98000f5 	blz      	r0, 0x80122fe	// 80122fe <_ftoa+0x3aa>
 8012118:	e4692001 	andi      	r3, r9, 1
      ++whole;
 801211c:	3b40      	cmpnei      	r3, 0
 801211e:	c4690c20 	incf      	r3, r9, 0
 8012122:	c4690c41 	inct      	r3, r9, 1
 8012126:	6e4f      	mov      	r9, r3
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012128:	eb4d0020 	cmpnei      	r13, 32
 801212c:	0c81      	bf      	0x801222e	// 801222e <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 801212e:	300a      	movi      	r0, 10
 8012130:	c4098043 	divs      	r3, r9, r0
 8012134:	6d27      	mov      	r4, r9
 8012136:	c4038421 	mult      	r1, r3, r0
 801213a:	5c25      	subu      	r1, r4, r1
 801213c:	212f      	addi      	r1, 48
 801213e:	e44d0000 	addi      	r2, r13, 1
 8012142:	d5b40021 	str.b      	r1, (r20, r13 << 0)
    if (!(whole /= 10)) {
 8012146:	e9030013 	bez      	r3, 0x801216c	// 801216c <_ftoa+0x218>
 801214a:	c454002c 	addu      	r12, r20, r2
  while (len < PRINTF_FTOA_BUFFER_SIZE) {
 801214e:	eb420020 	cmpnei      	r2, 32
 8012152:	0c6e      	bf      	0x801222e	// 801222e <_ftoa+0x2da>
    buf[len++] = (char)(48 + (whole % 10));
 8012154:	c4038041 	divs      	r1, r3, r0
 8012158:	c401842d 	mult      	r13, r1, r0
 801215c:	60f6      	subu      	r3, r13
 801215e:	232f      	addi      	r3, 48
 8012160:	d40c8003 	stbi.b      	r3, (r12)
 8012164:	2200      	addi      	r2, 1
    if (!(whole /= 10)) {
 8012166:	6cc7      	mov      	r3, r1
 8012168:	e921fff3 	bnez      	r1, 0x801214e	// 801214e <_ftoa+0x1fa>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801216c:	9866      	ld.w      	r3, (r14, 0x18)
 801216e:	e4632003 	andi      	r3, r3, 3
 8012172:	3b41      	cmpnei      	r3, 1
 8012174:	0cda      	bf      	0x8012328	// 8012328 <_ftoa+0x3d4>
  if (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012176:	eb420020 	cmpnei      	r2, 32
 801217a:	0d27      	bf      	0x80123c8	// 80123c8 <_ftoa+0x474>
    if (negative) {
 801217c:	986c      	ld.w      	r3, (r14, 0x30)
 801217e:	e92300bb 	bnez      	r3, 0x80122f4	// 80122f4 <_ftoa+0x3a0>
    else if (flags & FLAGS_PLUS) {
 8012182:	9866      	ld.w      	r3, (r14, 0x18)
 8012184:	e4632004 	andi      	r3, r3, 4
 8012188:	e9030116 	bez      	r3, 0x80123b4	// 80123b4 <_ftoa+0x460>
      buf[len++] = '+';  // ignore the space if the '+' exists
 801218c:	312b      	movi      	r1, 43
 801218e:	5a62      	addi      	r3, r2, 1
 8012190:	d4540021 	str.b      	r1, (r20, r2 << 0)
 8012194:	0453      	br      	0x801223a	// 801223a <_ftoa+0x2e6>
    return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
 8012196:	9866      	ld.w      	r3, (r14, 0x18)
 8012198:	b863      	st.w      	r3, (r14, 0xc)
 801219a:	9865      	ld.w      	r3, (r14, 0x14)
 801219c:	b862      	st.w      	r3, (r14, 0x8)
 801219e:	3303      	movi      	r3, 3
 80121a0:	b861      	st.w      	r3, (r14, 0x4)
 80121a2:	1272      	lrw      	r3, 0x80136a0	// 80122e8 <_ftoa+0x394>
 80121a4:	b860      	st.w      	r3, (r14, 0x0)
 80121a6:	0716      	br      	0x8011fd2	// 8011fd2 <_ftoa+0x7e>
    return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
 80121a8:	9866      	ld.w      	r3, (r14, 0x18)
 80121aa:	b864      	st.w      	r3, (r14, 0x10)
 80121ac:	9865      	ld.w      	r3, (r14, 0x14)
 80121ae:	b863      	st.w      	r3, (r14, 0xc)
 80121b0:	dd2e2002 	st.w      	r9, (r14, 0x8)
 80121b4:	b880      	st.w      	r4, (r14, 0x0)
 80121b6:	b8a1      	st.w      	r5, (r14, 0x4)
 80121b8:	6cef      	mov      	r3, r11
 80121ba:	6cab      	mov      	r2, r10
 80121bc:	6c5f      	mov      	r1, r7
 80121be:	6c1b      	mov      	r0, r6
 80121c0:	e0000116 	bsr      	0x80123ec	// 80123ec <_etoa>
}
 80121c4:	1415      	addi      	r14, r14, 84
 80121c6:	ebc00058 	pop      	r4-r11, r15, r16-r17
    return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
 80121ca:	9866      	ld.w      	r3, (r14, 0x18)
 80121cc:	b863      	st.w      	r3, (r14, 0xc)
 80121ce:	9865      	ld.w      	r3, (r14, 0x14)
 80121d0:	b862      	st.w      	r3, (r14, 0x8)
 80121d2:	3304      	movi      	r3, 4
 80121d4:	b861      	st.w      	r3, (r14, 0x4)
 80121d6:	1266      	lrw      	r3, 0x80136a4	// 80122ec <_ftoa+0x398>
 80121d8:	b860      	st.w      	r3, (r14, 0x0)
 80121da:	06fc      	br      	0x8011fd2	// 8011fd2 <_ftoa+0x7e>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 80121dc:	eb4d0020 	cmpnei      	r13, 32
 80121e0:	0c27      	bf      	0x801222e	// 801222e <_ftoa+0x2da>
      buf[len++] = (char)(48U + (frac % 10U));
 80121e2:	300a      	movi      	r0, 10
 80121e4:	c4128023 	divu      	r3, r18, r0
 80121e8:	c4038421 	mult      	r1, r3, r0
 80121ec:	c4320092 	subu      	r18, r18, r1
 80121f0:	e652002f 	addi      	r18, r18, 48
      --count;
 80121f4:	e5881000 	subi      	r12, r8, 1
      buf[len++] = (char)(48U + (frac % 10U));
 80121f8:	e44d0000 	addi      	r2, r13, 1
 80121fc:	d5b40032 	str.b      	r18, (r20, r13 << 0)
      if (!(frac /= 10U)) {
 8012200:	e90300c3 	bez      	r3, 0x8012386	// 8012386 <_ftoa+0x432>
 8012204:	c454002d 	addu      	r13, r20, r2
 8012208:	0410      	br      	0x8012228	// 8012228 <_ftoa+0x2d4>
      buf[len++] = (char)(48U + (frac % 10U));
 801220a:	c4038021 	divu      	r1, r3, r0
 801220e:	c4018432 	mult      	r18, r1, r0
 8012212:	c6430083 	subu      	r3, r3, r18
 8012216:	232f      	addi      	r3, 48
 8012218:	d40d8003 	stbi.b      	r3, (r13)
      --count;
 801221c:	e58c1000 	subi      	r12, r12, 1
      buf[len++] = (char)(48U + (frac % 10U));
 8012220:	2200      	addi      	r2, 1
      if (!(frac /= 10U)) {
 8012222:	6cc7      	mov      	r3, r1
 8012224:	e90100b1 	bez      	r1, 0x8012386	// 8012386 <_ftoa+0x432>
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
 8012228:	eb420020 	cmpnei      	r2, 32
 801222c:	0bef      	bt      	0x801220a	// 801220a <_ftoa+0x2b6>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 801222e:	9866      	ld.w      	r3, (r14, 0x18)
 8012230:	e4632003 	andi      	r3, r3, 3
 8012234:	3b41      	cmpnei      	r3, 1
 8012236:	0c78      	bf      	0x8012326	// 8012326 <_ftoa+0x3d2>
 8012238:	3320      	movi      	r3, 32
  return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
 801223a:	9846      	ld.w      	r2, (r14, 0x18)
 801223c:	b843      	st.w      	r2, (r14, 0xc)
 801223e:	9845      	ld.w      	r2, (r14, 0x14)
 8012240:	b842      	st.w      	r2, (r14, 0x8)
 8012242:	b861      	st.w      	r3, (r14, 0x4)
 8012244:	de8e2000 	st.w      	r20, (r14, 0x0)
 8012248:	06c5      	br      	0x8011fd2	// 8011fd2 <_ftoa+0x7e>
  else if (diff < 0.5) {
 801224a:	3200      	movi      	r2, 0
 801224c:	ea233fe0 	movih      	r3, 16352
 8012250:	c4104820 	lsli      	r0, r16, 0
 8012254:	c4114821 	lsli      	r1, r17, 0
 8012258:	de8e200a 	st.w      	r20, (r14, 0x28)
 801225c:	de4e2009 	st.w      	r18, (r14, 0x24)
 8012260:	ddae2007 	st.w      	r13, (r14, 0x1c)
 8012264:	e3fff884 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012268:	d9ae2007 	ld.w      	r13, (r14, 0x1c)
 801226c:	da4e2009 	ld.w      	r18, (r14, 0x24)
 8012270:	da8e200a 	ld.w      	r20, (r14, 0x28)
 8012274:	e980ff36 	blz      	r0, 0x80120e0	// 80120e0 <_ftoa+0x18c>
  else if ((frac == 0U) || (frac & 1U)) {
 8012278:	e9120006 	bez      	r18, 0x8012284	// 8012284 <_ftoa+0x330>
 801227c:	e4722001 	andi      	r3, r18, 1
 8012280:	e903ff30 	bez      	r3, 0x80120e0	// 80120e0 <_ftoa+0x18c>
    ++frac;
 8012284:	e6520000 	addi      	r18, r18, 1
 8012288:	072c      	br      	0x80120e0	// 80120e0 <_ftoa+0x18c>
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 801228a:	6ce7      	mov      	r3, r9
 801228c:	3b09      	cmphsi      	r3, 10
 801228e:	0c9f      	bf      	0x80123cc	// 80123cc <_ftoa+0x478>
    buf[len++] = '0';
 8012290:	e68e0033 	addi      	r20, r14, 52
 8012294:	3030      	movi      	r0, 48
 8012296:	dc140000 	st.b      	r0, (r20, 0x0)
    prec--;
 801229a:	e5091000 	subi      	r8, r9, 1
 801229e:	e44e0034 	addi      	r2, r14, 53
 80122a2:	e4291008 	subi      	r1, r9, 9
 80122a6:	ea0d0001 	movi      	r13, 1
    buf[len++] = '0';
 80122aa:	331f      	movi      	r3, 31
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80122ac:	6476      	cmpne      	r13, r1
 80122ae:	0c09      	bf      	0x80122c0	// 80122c0 <_ftoa+0x36c>
    buf[len++] = '0';
 80122b0:	e5ad0000 	addi      	r13, r13, 1
 80122b4:	d4028000 	stbi.b      	r0, (r2)
    prec--;
 80122b8:	e5081000 	subi      	r8, r8, 1
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80122bc:	e823fff8 	bnezad      	r3, 0x80122ac	// 80122ac <_ftoa+0x358>
 80122c0:	104c      	lrw      	r2, 0x80136ac	// 80122f0 <_ftoa+0x39c>
 80122c2:	c4684823 	lsli      	r3, r8, 3
 80122c6:	60c8      	addu      	r3, r2
 80122c8:	9340      	ld.w      	r2, (r3, 0x0)
 80122ca:	9361      	ld.w      	r3, (r3, 0x4)
 80122cc:	b847      	st.w      	r2, (r14, 0x1c)
 80122ce:	b868      	st.w      	r3, (r14, 0x20)
 80122d0:	06b1      	br      	0x8012032	// 8012032 <_ftoa+0xde>
 80122d2:	0000      	.short	0x0000
 80122d4:	0801369c 	.long	0x0801369c
 80122d8:	08013694 	.long	0x08013694
 80122dc:	41cdcd65 	.long	0x41cdcd65
 80122e0:	c1cdcd65 	.long	0xc1cdcd65
 80122e4:	412e8480 	.long	0x412e8480
 80122e8:	080136a0 	.long	0x080136a0
 80122ec:	080136a4 	.long	0x080136a4
 80122f0:	080136ac 	.long	0x080136ac
      buf[len++] = '-';
 80122f4:	312d      	movi      	r1, 45
 80122f6:	5a62      	addi      	r3, r2, 1
 80122f8:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80122fc:	079f      	br      	0x801223a	// 801223a <_ftoa+0x2e6>
    if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
 80122fe:	6ca3      	mov      	r2, r8
 8012300:	ea233fe0 	movih      	r3, 16352
 8012304:	6c13      	mov      	r0, r4
 8012306:	6c57      	mov      	r1, r5
 8012308:	e3fff7f2 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 801230c:	c410482d 	lsli      	r13, r16, 0
 8012310:	c4114834 	lsli      	r20, r17, 0
 8012314:	e960ff0a 	blsz      	r0, 0x8012128	// 8012128 <_ftoa+0x1d4>
 8012318:	0700      	br      	0x8012118	// 8012118 <_ftoa+0x1c4>
      ++whole;
 801231a:	6ce7      	mov      	r3, r9
 801231c:	2300      	addi      	r3, 1
 801231e:	6e4f      	mov      	r9, r3
      frac = 0;
 8012320:	ea120000 	movi      	r18, 0
 8012324:	06de      	br      	0x80120e0	// 80120e0 <_ftoa+0x18c>
  if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
 8012326:	3220      	movi      	r2, 32
    if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
 8012328:	9865      	ld.w      	r3, (r14, 0x14)
 801232a:	e903ff26 	bez      	r3, 0x8012176	// 8012176 <_ftoa+0x222>
 801232e:	986c      	ld.w      	r3, (r14, 0x30)
 8012330:	e9230007 	bnez      	r3, 0x801233e	// 801233e <_ftoa+0x3ea>
 8012334:	9866      	ld.w      	r3, (r14, 0x18)
 8012336:	e463200c 	andi      	r3, r3, 12
 801233a:	e9030005 	bez      	r3, 0x8012344	// 8012344 <_ftoa+0x3f0>
      width--;
 801233e:	9865      	ld.w      	r3, (r14, 0x14)
 8012340:	2b00      	subi      	r3, 1
 8012342:	b865      	st.w      	r3, (r14, 0x14)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012344:	9865      	ld.w      	r3, (r14, 0x14)
 8012346:	64c8      	cmphs      	r2, r3
 8012348:	0b17      	bt      	0x8012176	// 8012176 <_ftoa+0x222>
 801234a:	eb420020 	cmpnei      	r2, 32
 801234e:	0c3d      	bf      	0x80123c8	// 80123c8 <_ftoa+0x474>
 8012350:	c4540021 	addu      	r1, r20, r2
 8012354:	6ccb      	mov      	r3, r2
      buf[len++] = '0';
 8012356:	3230      	movi      	r2, 48
 8012358:	0405      	br      	0x8012362	// 8012362 <_ftoa+0x40e>
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801235a:	eb430020 	cmpnei      	r3, 32
 801235e:	2100      	addi      	r1, 1
 8012360:	0f6d      	bf      	0x801223a	// 801223a <_ftoa+0x2e6>
      buf[len++] = '0';
 8012362:	2300      	addi      	r3, 1
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 8012364:	9805      	ld.w      	r0, (r14, 0x14)
 8012366:	640e      	cmpne      	r3, r0
      buf[len++] = '0';
 8012368:	a140      	st.b      	r2, (r1, 0x0)
    while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
 801236a:	0bf8      	bt      	0x801235a	// 801235a <_ftoa+0x406>
      buf[len++] = '0';
 801236c:	9845      	ld.w      	r2, (r14, 0x14)
 801236e:	0704      	br      	0x8012176	// 8012176 <_ftoa+0x222>
    value = 0 - value;
 8012370:	6c93      	mov      	r2, r4
 8012372:	9961      	ld.w      	r3, (r14, 0x84)
 8012374:	3000      	movi      	r0, 0
 8012376:	3100      	movi      	r1, 0
 8012378:	e3fff5f4 	bsr      	0x8010f60	// 8010f60 <__subdf3>
    negative = true;
 801237c:	3301      	movi      	r3, 1
    value = 0 - value;
 801237e:	6d03      	mov      	r4, r0
 8012380:	6d47      	mov      	r5, r1
    negative = true;
 8012382:	b86c      	st.w      	r3, (r14, 0x30)
 8012384:	064a      	br      	0x8012018	// 8012018 <_ftoa+0xc4>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 8012386:	eb420020 	cmpnei      	r2, 32
 801238a:	0f52      	bf      	0x801222e	// 801222e <_ftoa+0x2da>
 801238c:	e90c000e 	bez      	r12, 0x80123a8	// 80123a8 <_ftoa+0x454>
 8012390:	c4540023 	addu      	r3, r20, r2
 8012394:	6308      	addu      	r12, r2
      buf[len++] = '0';
 8012396:	3130      	movi      	r1, 48
 8012398:	2200      	addi      	r2, 1
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 801239a:	eb420020 	cmpnei      	r2, 32
      buf[len++] = '0';
 801239e:	a320      	st.b      	r1, (r3, 0x0)
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
 80123a0:	0f47      	bf      	0x801222e	// 801222e <_ftoa+0x2da>
 80123a2:	670a      	cmpne      	r2, r12
 80123a4:	2300      	addi      	r3, 1
 80123a6:	0bf9      	bt      	0x8012398	// 8012398 <_ftoa+0x444>
      buf[len++] = '.';
 80123a8:	332e      	movi      	r3, 46
 80123aa:	e5a20000 	addi      	r13, r2, 1
 80123ae:	d4540023 	str.b      	r3, (r20, r2 << 0)
 80123b2:	06bb      	br      	0x8012128	// 8012128 <_ftoa+0x1d4>
    else if (flags & FLAGS_SPACE) {
 80123b4:	9866      	ld.w      	r3, (r14, 0x18)
 80123b6:	e4632008 	andi      	r3, r3, 8
 80123ba:	e9030007 	bez      	r3, 0x80123c8	// 80123c8 <_ftoa+0x474>
      buf[len++] = ' ';
 80123be:	3120      	movi      	r1, 32
 80123c0:	5a62      	addi      	r3, r2, 1
 80123c2:	d4540021 	str.b      	r1, (r20, r2 << 0)
 80123c6:	073a      	br      	0x801223a	// 801223a <_ftoa+0x2e6>
    else if (flags & FLAGS_SPACE) {
 80123c8:	6ccb      	mov      	r3, r2
 80123ca:	0738      	br      	0x801223a	// 801223a <_ftoa+0x2e6>
 80123cc:	1047      	lrw      	r2, 0x80136ac	// 80123e8 <_ftoa+0x494>
 80123ce:	4363      	lsli      	r3, r3, 3
 80123d0:	60c8      	addu      	r3, r2
  while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
 80123d2:	6e27      	mov      	r8, r9
 80123d4:	9340      	ld.w      	r2, (r3, 0x0)
 80123d6:	9361      	ld.w      	r3, (r3, 0x4)
 80123d8:	b847      	st.w      	r2, (r14, 0x1c)
 80123da:	b868      	st.w      	r3, (r14, 0x20)
 80123dc:	ea0d0000 	movi      	r13, 0
 80123e0:	e68e0033 	addi      	r20, r14, 52
 80123e4:	0627      	br      	0x8012032	// 8012032 <_ftoa+0xde>
 80123e6:	0000      	.short	0x0000
 80123e8:	080136ac 	.long	0x080136ac

080123ec <_etoa>:


#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
 80123ec:	ebe00058 	push      	r4-r11, r15, r16-r17
 80123f0:	1434      	subi      	r14, r14, 80
 80123f2:	6e0f      	mov      	r8, r3
 80123f4:	9961      	ld.w      	r3, (r14, 0x84)
 80123f6:	b867      	st.w      	r3, (r14, 0x1c)
 80123f8:	9962      	ld.w      	r3, (r14, 0x88)
 80123fa:	98bf      	ld.w      	r5, (r14, 0x7c)
 80123fc:	9980      	ld.w      	r4, (r14, 0x80)
 80123fe:	b868      	st.w      	r3, (r14, 0x20)
 8012400:	9963      	ld.w      	r3, (r14, 0x8c)
 8012402:	b866      	st.w      	r3, (r14, 0x18)
 8012404:	6d83      	mov      	r6, r0
 8012406:	6dc7      	mov      	r7, r1
 8012408:	6ecb      	mov      	r11, r2
  // check for NaN and special values
  if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
 801240a:	6cd3      	mov      	r3, r4
 801240c:	6c97      	mov      	r2, r5
 801240e:	6c17      	mov      	r0, r5
 8012410:	6c53      	mov      	r1, r4
 8012412:	e3fff751 	bsr      	0x80112b4	// 80112b4 <__nedf2>
 8012416:	6e43      	mov      	r9, r0
 8012418:	e92001d7 	bnez      	r0, 0x80127c6	// 80127c6 <_etoa+0x3da>
 801241c:	3200      	movi      	r2, 0
 801241e:	ea237ff0 	movih      	r3, 32752
 8012422:	2a00      	subi      	r2, 1
 8012424:	2b00      	subi      	r3, 1
 8012426:	6c17      	mov      	r0, r5
 8012428:	6c53      	mov      	r1, r4
 801242a:	e3fff761 	bsr      	0x80112ec	// 80112ec <__gtdf2>
 801242e:	e94001cc 	bhz      	r0, 0x80127c6	// 80127c6 <_etoa+0x3da>
 8012432:	3200      	movi      	r2, 0
 8012434:	ea23fff0 	movih      	r3, 65520
 8012438:	2a00      	subi      	r2, 1
 801243a:	2b00      	subi      	r3, 1
 801243c:	6c17      	mov      	r0, r5
 801243e:	6c53      	mov      	r1, r4
 8012440:	e3fff796 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012444:	e98001c1 	blz      	r0, 0x80127c6	// 80127c6 <_etoa+0x3da>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
  }

  // determine the sign
  const bool negative = value < 0;
  if (negative) {
 8012448:	6ca7      	mov      	r2, r9
 801244a:	6ce7      	mov      	r3, r9
 801244c:	6c17      	mov      	r0, r5
 801244e:	6c53      	mov      	r1, r4
 8012450:	e3fff78e 	bsr      	0x801136c	// 801136c <__ltdf2>
    value = -value;
 8012454:	6e97      	mov      	r10, r5
  if (negative) {
 8012456:	e9800208 	blz      	r0, 0x8012866	// 8012866 <_etoa+0x47a>
 801245a:	6e53      	mov      	r9, r4
  }

  // default precision
  if (!(flags & FLAGS_PRECISION)) {
 801245c:	9866      	ld.w      	r3, (r14, 0x18)
 801245e:	e4632400 	andi      	r3, r3, 1024
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012462:	3b40      	cmpnei      	r3, 0
 8012464:	9847      	ld.w      	r2, (r14, 0x1c)
  if (!(flags & FLAGS_PRECISION)) {
 8012466:	b873      	st.w      	r3, (r14, 0x4c)
    uint64_t U;
    double   F;
  } conv;

  conv.F = value;
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8012468:	c68957c0 	zext      	r0, r9, 30, 20
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 801246c:	3306      	movi      	r3, 6
 801246e:	c4430c20 	incf      	r2, r3, 0
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
  // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012472:	e40013fe 	subi      	r0, r0, 1023
    prec = PRINTF_DEFAULT_FLOAT_PRECISION;
 8012476:	b847      	st.w      	r2, (r14, 0x1c)
  int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023;           // effectively log2
 8012478:	dd4e200a 	st.w      	r10, (r14, 0x28)
 801247c:	dd2e2009 	st.w      	r9, (r14, 0x24)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 8012480:	e3fff792 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012484:	0145      	lrw      	r2, 0x509f79fb	// 80127ec <_etoa+0x400>
 8012486:	0164      	lrw      	r3, 0x3fd34413	// 80127f0 <_etoa+0x404>
 8012488:	e3fff58a 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 801248c:	0145      	lrw      	r2, 0x8b60c8b3	// 80127f4 <_etoa+0x408>
 801248e:	0164      	lrw      	r3, 0x3fc68a28	// 80127f8 <_etoa+0x40c>
 8012490:	e3fff550 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 8012494:	d98e200a 	ld.w      	r12, (r14, 0x28)
 8012498:	da6e2009 	ld.w      	r19, (r14, 0x24)
 801249c:	c40c4836 	lsli      	r22, r12, 0
 80124a0:	c4135677 	zext      	r23, r19, 19, 0
 80124a4:	ea140000 	movi      	r20, 0
 80124a8:	ea353ff0 	movih      	r21, 16368
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80124ac:	c4004831 	lsli      	r17, r0, 0
 80124b0:	c4014830 	lsli      	r16, r1, 0
 80124b4:	3200      	movi      	r2, 0
 80124b6:	c6962420 	or      	r0, r22, r20
 80124ba:	c6b72421 	or      	r1, r23, r21
 80124be:	ea233ff8 	movih      	r3, 16376
  conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U);  // drop the exponent so conv.F is now in [1,2)
 80124c2:	dd8e2012 	st.w      	r12, (r14, 0x48)
 80124c6:	de6e2011 	st.w      	r19, (r14, 0x44)
  int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
 80124ca:	de8e200f 	st.w      	r20, (r14, 0x3c)
 80124ce:	deae2010 	st.w      	r21, (r14, 0x40)
 80124d2:	e3fff547 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 80124d6:	0155      	lrw      	r2, 0x636f4361	// 80127fc <_etoa+0x410>
 80124d8:	0175      	lrw      	r3, 0x3fd287a7	// 8012800 <_etoa+0x414>
 80124da:	e3fff561 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 80124de:	6c83      	mov      	r2, r0
 80124e0:	6cc7      	mov      	r3, r1
 80124e2:	c4114820 	lsli      	r0, r17, 0
 80124e6:	c4104821 	lsli      	r1, r16, 0
 80124ea:	e3fff523 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80124ee:	e3fff78f 	bsr      	0x801140c	// 801140c <__fixdfsi>
 80124f2:	b809      	st.w      	r0, (r14, 0x24)
  // now we want to compute 10^expval but we want to be sure it won't overflow
  exp2 = (int)(expval * 3.321928094887362 + 0.5);
 80124f4:	e3fff758 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 80124f8:	015c      	lrw      	r2, 0x979a371	// 8012804 <_etoa+0x418>
 80124fa:	017b      	lrw      	r3, 0x400a934f	// 8012808 <_etoa+0x41c>
 80124fc:	c4004831 	lsli      	r17, r0, 0
 8012500:	c4014830 	lsli      	r16, r1, 0
 8012504:	e3fff54c 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012508:	3200      	movi      	r2, 0
 801250a:	ea233fe0 	movih      	r3, 16352
 801250e:	e3fff511 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012512:	e3fff77d 	bsr      	0x801140c	// 801140c <__fixdfsi>
 8012516:	b80a      	st.w      	r0, (r14, 0x28)
  const double z  = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
 8012518:	0242      	lrw      	r2, 0xbbb55516	// 801280c <_etoa+0x420>
 801251a:	0261      	lrw      	r3, 0x40026bb1	// 8012810 <_etoa+0x424>
 801251c:	c4114820 	lsli      	r0, r17, 0
 8012520:	c4104821 	lsli      	r1, r16, 0
 8012524:	e3fff53c 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 8012528:	c4004831 	lsli      	r17, r0, 0
 801252c:	980a      	ld.w      	r0, (r14, 0x28)
 801252e:	c4014830 	lsli      	r16, r1, 0
 8012532:	e3fff739 	bsr      	0x80113a4	// 80113a4 <__floatsidf>
 8012536:	0247      	lrw      	r2, 0xfefa39ef	// 8012814 <_etoa+0x428>
 8012538:	0267      	lrw      	r3, 0x3fe62e42	// 8012818 <_etoa+0x42c>
 801253a:	e3fff531 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
 801253e:	6c83      	mov      	r2, r0
 8012540:	6cc7      	mov      	r3, r1
 8012542:	c4114820 	lsli      	r0, r17, 0
 8012546:	c4104821 	lsli      	r1, r16, 0
 801254a:	e3fff50b 	bsr      	0x8010f60	// 8010f60 <__subdf3>
  const double z2 = z * z;
 801254e:	6c83      	mov      	r2, r0
 8012550:	6cc7      	mov      	r3, r1
 8012552:	b80c      	st.w      	r0, (r14, 0x30)
 8012554:	b82b      	st.w      	r1, (r14, 0x2c)
 8012556:	e3fff523 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
  // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 801255a:	da4e200c 	ld.w      	r18, (r14, 0x30)
 801255e:	d9ae200b 	ld.w      	r13, (r14, 0x2c)
 8012562:	c4124822 	lsli      	r2, r18, 0
 8012566:	6cf7      	mov      	r3, r13
  const double z2 = z * z;
 8012568:	c4004831 	lsli      	r17, r0, 0
 801256c:	c4014830 	lsli      	r16, r1, 0
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012570:	c4124820 	lsli      	r0, r18, 0
 8012574:	6c77      	mov      	r1, r13
 8012576:	de4e200e 	st.w      	r18, (r14, 0x38)
 801257a:	ddae200d 	st.w      	r13, (r14, 0x34)
 801257e:	e3fff4d9 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 8012582:	b80c      	st.w      	r0, (r14, 0x30)
 8012584:	b82b      	st.w      	r1, (r14, 0x2c)
 8012586:	3200      	movi      	r2, 0
 8012588:	ea23402c 	movih      	r3, 16428
 801258c:	c4114820 	lsli      	r0, r17, 0
 8012590:	c4104821 	lsli      	r1, r16, 0
 8012594:	e3fff604 	bsr      	0x801119c	// 801119c <__divdf3>
 8012598:	3200      	movi      	r2, 0
 801259a:	ea234024 	movih      	r3, 16420
 801259e:	e3fff4c9 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80125a2:	6c83      	mov      	r2, r0
 80125a4:	6cc7      	mov      	r3, r1
 80125a6:	c4114820 	lsli      	r0, r17, 0
 80125aa:	c4104821 	lsli      	r1, r16, 0
 80125ae:	e3fff5f7 	bsr      	0x801119c	// 801119c <__divdf3>
 80125b2:	3200      	movi      	r2, 0
 80125b4:	ea234018 	movih      	r3, 16408
 80125b8:	e3fff4bc 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80125bc:	6c83      	mov      	r2, r0
 80125be:	6cc7      	mov      	r3, r1
 80125c0:	c4114820 	lsli      	r0, r17, 0
 80125c4:	c4104821 	lsli      	r1, r16, 0
 80125c8:	e3fff5ea 	bsr      	0x801119c	// 801119c <__divdf3>
 80125cc:	da4e200e 	ld.w      	r18, (r14, 0x38)
 80125d0:	d9ae200d 	ld.w      	r13, (r14, 0x34)
 80125d4:	c4124822 	lsli      	r2, r18, 0
 80125d8:	6cf7      	mov      	r3, r13
 80125da:	c4004831 	lsli      	r17, r0, 0
 80125de:	c4014830 	lsli      	r16, r1, 0
 80125e2:	3000      	movi      	r0, 0
 80125e4:	ea214000 	movih      	r1, 16384
 80125e8:	e3fff4bc 	bsr      	0x8010f60	// 8010f60 <__subdf3>
 80125ec:	6c83      	mov      	r2, r0
 80125ee:	6cc7      	mov      	r3, r1
 80125f0:	c4114820 	lsli      	r0, r17, 0
 80125f4:	c4104821 	lsli      	r1, r16, 0
 80125f8:	e3fff49c 	bsr      	0x8010f30	// 8010f30 <__adddf3>
 80125fc:	daee200c 	ld.w      	r23, (r14, 0x30)
 8012600:	dace200b 	ld.w      	r22, (r14, 0x2c)
 8012604:	6c83      	mov      	r2, r0
 8012606:	6cc7      	mov      	r3, r1
 8012608:	c4174820 	lsli      	r0, r23, 0
 801260c:	c4164821 	lsli      	r1, r22, 0
 8012610:	e3fff5c6 	bsr      	0x801119c	// 801119c <__divdf3>
 8012614:	da8e200f 	ld.w      	r20, (r14, 0x3c)
 8012618:	daae2010 	ld.w      	r21, (r14, 0x40)
 801261c:	c4144822 	lsli      	r2, r20, 0
 8012620:	c4154823 	lsli      	r3, r21, 0
 8012624:	e3fff486 	bsr      	0x8010f30	// 8010f30 <__adddf3>
  conv.U = (uint64_t)(exp2 + 1023) << 52U;
 8012628:	984a      	ld.w      	r2, (r14, 0x28)
 801262a:	e46203fe 	addi      	r3, r2, 1023
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 801262e:	4374      	lsli      	r3, r3, 20
 8012630:	3200      	movi      	r2, 0
 8012632:	e3fff4b5 	bsr      	0x8010f9c	// 8010f9c <__muldf3>
  // correct for rounding errors
  if (value < conv.F) {
 8012636:	d98e2012 	ld.w      	r12, (r14, 0x48)
 801263a:	da6e2011 	ld.w      	r19, (r14, 0x44)
 801263e:	6c83      	mov      	r2, r0
 8012640:	c4004830 	lsli      	r16, r0, 0
 8012644:	6cc7      	mov      	r3, r1
  conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
 8012646:	c4014831 	lsli      	r17, r1, 0
  if (value < conv.F) {
 801264a:	6c33      	mov      	r0, r12
 801264c:	c4134821 	lsli      	r1, r19, 0
 8012650:	e3fff68e 	bsr      	0x801136c	// 801136c <__ltdf2>
 8012654:	c4104832 	lsli      	r18, r16, 0
 8012658:	e9a00012 	bhsz      	r0, 0x801267c	// 801267c <_etoa+0x290>
    expval--;
 801265c:	9869      	ld.w      	r3, (r14, 0x24)
 801265e:	2b00      	subi      	r3, 1
 8012660:	b869      	st.w      	r3, (r14, 0x24)
    conv.F /= 10;
 8012662:	c4114821 	lsli      	r1, r17, 0
 8012666:	3200      	movi      	r2, 0
 8012668:	ea234024 	movih      	r3, 16420
 801266c:	c4104820 	lsli      	r0, r16, 0
 8012670:	e3fff596 	bsr      	0x801119c	// 801119c <__divdf3>
 8012674:	c4004832 	lsli      	r18, r0, 0
 8012678:	c4014831 	lsli      	r17, r1, 0
  }

  // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801267c:	9849      	ld.w      	r2, (r14, 0x24)
 801267e:	e4620062 	addi      	r3, r2, 99
 8012682:	eb0300c6 	cmphsi      	r3, 199

  // in "%g" mode, "prec" is the number of *significant figures* not decimals
  if (flags & FLAGS_ADAPT_EXP) {
 8012686:	9866      	ld.w      	r3, (r14, 0x18)
 8012688:	e4632800 	andi      	r3, r3, 2048
  unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
 801268c:	c4000510 	mvc      	r16
 8012690:	e6100003 	addi      	r16, r16, 4
  if (flags & FLAGS_ADAPT_EXP) {
 8012694:	e9030027 	bez      	r3, 0x80126e2	// 80126e2 <_etoa+0x2f6>
    // do we want to fall-back to "%f" mode?
    if ((value >= 1e-4) && (value < 1e6)) {
 8012698:	1341      	lrw      	r2, 0xeb1c432d	// 801281c <_etoa+0x430>
 801269a:	1362      	lrw      	r3, 0x3f1a36e2	// 8012820 <_etoa+0x434>
 801269c:	6c2b      	mov      	r0, r10
 801269e:	6c67      	mov      	r1, r9
 80126a0:	de4e200a 	st.w      	r18, (r14, 0x28)
 80126a4:	e3fff644 	bsr      	0x801132c	// 801132c <__gedf2>
 80126a8:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80126ac:	e98000cd 	blz      	r0, 0x8012846	// 8012846 <_etoa+0x45a>
 80126b0:	3200      	movi      	r2, 0
 80126b2:	127d      	lrw      	r3, 0x412e8480	// 8012824 <_etoa+0x438>
 80126b4:	6c2b      	mov      	r0, r10
 80126b6:	6c67      	mov      	r1, r9
 80126b8:	e3fff65a 	bsr      	0x801136c	// 801136c <__ltdf2>
 80126bc:	da4e200a 	ld.w      	r18, (r14, 0x28)
 80126c0:	e9a000c3 	bhsz      	r0, 0x8012846	// 8012846 <_etoa+0x45a>
      if ((int)prec > expval) {
 80126c4:	9849      	ld.w      	r2, (r14, 0x24)
 80126c6:	9867      	ld.w      	r3, (r14, 0x1c)
 80126c8:	64c9      	cmplt      	r2, r3
 80126ca:	0cd4      	bf      	0x8012872	// 8012872 <_etoa+0x486>
        prec = (unsigned)((int)prec - expval - 1);
 80126cc:	60ca      	subu      	r3, r2
 80126ce:	2b00      	subi      	r3, 1
 80126d0:	b867      	st.w      	r3, (r14, 0x1c)
      }
      else {
        prec = 0;
      }
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80126d2:	9866      	ld.w      	r3, (r14, 0x18)
 80126d4:	ec630400 	ori      	r3, r3, 1024
      // no characters in exponent
      minwidth = 0U;
 80126d8:	ea100000 	movi      	r16, 0
      flags |= FLAGS_PRECISION;   // make sure _ftoa respects precision
 80126dc:	b866      	st.w      	r3, (r14, 0x18)
      expval   = 0;
 80126de:	de0e2009 	st.w      	r16, (r14, 0x24)

  // will everything fit?
  unsigned int fwidth = width;
  if (width > minwidth) {
    // we didn't fall-back so subtract the characters required for the exponent
    fwidth -= minwidth;
 80126e2:	9848      	ld.w      	r2, (r14, 0x20)
 80126e4:	c602008c 	subu      	r12, r2, r16
 80126e8:	c4500420 	cmphs      	r16, r2
  } else {
    // not enough characters, so go back to default sizing
    fwidth = 0U;
  }
  if ((flags & FLAGS_LEFT) && minwidth) {
 80126ec:	9846      	ld.w      	r2, (r14, 0x18)
 80126ee:	e4422002 	andi      	r2, r2, 2
    fwidth -= minwidth;
 80126f2:	3300      	movi      	r3, 0
 80126f4:	c5830c40 	inct      	r12, r3, 0
  if ((flags & FLAGS_LEFT) && minwidth) {
 80126f8:	b84a      	st.w      	r2, (r14, 0x28)
 80126fa:	e9020006 	bez      	r2, 0x8012706	// 8012706 <_etoa+0x31a>
    // if we're padding on the right, DON'T pad the floating part
    fwidth = 0U;
 80126fe:	eb500000 	cmpnei      	r16, 0
 8012702:	c5830c40 	inct      	r12, r3, 0
  }

  // rescale the float value
  if (expval) {
 8012706:	9869      	ld.w      	r3, (r14, 0x24)
 8012708:	e9230090 	bnez      	r3, 0x8012828	// 8012828 <_etoa+0x43c>
    value /= conv.F;
  }

  // output the floating part
  const size_t start_idx = idx;
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 801270c:	3200      	movi      	r2, 0
 801270e:	6ccb      	mov      	r3, r2
 8012710:	6c17      	mov      	r0, r5
 8012712:	6c53      	mov      	r1, r4
 8012714:	c40c4831 	lsli      	r17, r12, 0
 8012718:	e3fff62a 	bsr      	0x801136c	// 801136c <__ltdf2>
 801271c:	c411482c 	lsli      	r12, r17, 0
 8012720:	e980009e 	blz      	r0, 0x801285c	// 801285c <_etoa+0x470>
 8012724:	da2e2006 	ld.w      	r17, (r14, 0x18)
 8012728:	98a7      	ld.w      	r5, (r14, 0x1c)
 801272a:	c5712823 	bclri      	r3, r17, 11
 801272e:	b864      	st.w      	r3, (r14, 0x10)
 8012730:	dd2e2001 	st.w      	r9, (r14, 0x4)
 8012734:	dd8e2003 	st.w      	r12, (r14, 0xc)
 8012738:	b8a2      	st.w      	r5, (r14, 0x8)
 801273a:	dd4e2000 	st.w      	r10, (r14, 0x0)
 801273e:	6ce3      	mov      	r3, r8
 8012740:	6caf      	mov      	r2, r11
 8012742:	6c5f      	mov      	r1, r7
 8012744:	6c1b      	mov      	r0, r6
 8012746:	e3fffc07 	bsr      	0x8011f54	// 8011f54 <_ftoa>
 801274a:	6d03      	mov      	r4, r0

  // output the exponent part
  if (!prec && minwidth) {
 801274c:	6e57      	mov      	r9, r5
 801274e:	e925004b 	bnez      	r5, 0x80127e4	// 80127e4 <_etoa+0x3f8>
 8012752:	e9100049 	bez      	r16, 0x80127e4	// 80127e4 <_etoa+0x3f8>
    // output the exponential symbol
    out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
 8012756:	e4712020 	andi      	r3, r17, 32
 801275a:	3b40      	cmpnei      	r3, 0
 801275c:	6c83      	mov      	r2, r0
 801275e:	ea0c0065 	movi      	r12, 101
 8012762:	58a2      	addi      	r5, r0, 1
 8012764:	3045      	movi      	r0, 69
 8012766:	c40c0c20 	incf      	r0, r12, 0
 801276a:	6ce3      	mov      	r3, r8
 801276c:	6c5f      	mov      	r1, r7
 801276e:	7bd9      	jsr      	r6
    // output the exponent value
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 8012770:	3305      	movi      	r3, 5
 8012772:	9849      	ld.w      	r2, (r14, 0x24)
 8012774:	b865      	st.w      	r3, (r14, 0x14)
 8012776:	330a      	movi      	r3, 10
 8012778:	b862      	st.w      	r3, (r14, 0x8)
 801277a:	4a7f      	lsri      	r3, r2, 31
 801277c:	b861      	st.w      	r3, (r14, 0x4)
 801277e:	e6101000 	subi      	r16, r16, 1
 8012782:	c4020203 	abs      	r3, r2
 8012786:	b860      	st.w      	r3, (r14, 0x0)
 8012788:	de0e2004 	st.w      	r16, (r14, 0x10)
 801278c:	6ce3      	mov      	r3, r8
 801278e:	dd2e2003 	st.w      	r9, (r14, 0xc)
 8012792:	6c97      	mov      	r2, r5
 8012794:	6c5f      	mov      	r1, r7
 8012796:	6c1b      	mov      	r0, r6
 8012798:	e3fffb12 	bsr      	0x8011dbc	// 8011dbc <_ntoa_long>
    // might need to right-pad spaces
    if (flags & FLAGS_LEFT) {
 801279c:	986a      	ld.w      	r3, (r14, 0x28)
    idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth-1, FLAGS_ZEROPAD | FLAGS_PLUS);
 801279e:	6d03      	mov      	r4, r0
    if (flags & FLAGS_LEFT) {
 80127a0:	e9030022 	bez      	r3, 0x80127e4	// 80127e4 <_etoa+0x3f8>
      while (idx - start_idx < width) out(' ', buffer, idx++, maxlen);
 80127a4:	c5600083 	subu      	r3, r0, r11
 80127a8:	98a8      	ld.w      	r5, (r14, 0x20)
 80127aa:	654c      	cmphs      	r3, r5
 80127ac:	081c      	bt      	0x80127e4	// 80127e4 <_etoa+0x3f8>
 80127ae:	6c83      	mov      	r2, r0
 80127b0:	2400      	addi      	r4, 1
 80127b2:	6ce3      	mov      	r3, r8
 80127b4:	6c5f      	mov      	r1, r7
 80127b6:	3020      	movi      	r0, 32
 80127b8:	7bd9      	jsr      	r6
 80127ba:	c5640083 	subu      	r3, r4, r11
 80127be:	654c      	cmphs      	r3, r5
 80127c0:	6c93      	mov      	r2, r4
 80127c2:	0ff7      	bf      	0x80127b0	// 80127b0 <_etoa+0x3c4>
 80127c4:	0410      	br      	0x80127e4	// 80127e4 <_etoa+0x3f8>
    return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
 80127c6:	9866      	ld.w      	r3, (r14, 0x18)
 80127c8:	b864      	st.w      	r3, (r14, 0x10)
 80127ca:	9868      	ld.w      	r3, (r14, 0x20)
 80127cc:	b863      	st.w      	r3, (r14, 0xc)
 80127ce:	9867      	ld.w      	r3, (r14, 0x1c)
 80127d0:	b862      	st.w      	r3, (r14, 0x8)
 80127d2:	b881      	st.w      	r4, (r14, 0x4)
 80127d4:	b8a0      	st.w      	r5, (r14, 0x0)
 80127d6:	6ce3      	mov      	r3, r8
 80127d8:	6caf      	mov      	r2, r11
 80127da:	6c5f      	mov      	r1, r7
 80127dc:	6c1b      	mov      	r0, r6
 80127de:	e3fffbbb 	bsr      	0x8011f54	// 8011f54 <_ftoa>
 80127e2:	6d03      	mov      	r4, r0
    }
  }
  return idx;
}
 80127e4:	6c13      	mov      	r0, r4
 80127e6:	1414      	addi      	r14, r14, 80
 80127e8:	ebc00058 	pop      	r4-r11, r15, r16-r17
 80127ec:	509f79fb 	.long	0x509f79fb
 80127f0:	3fd34413 	.long	0x3fd34413
 80127f4:	8b60c8b3 	.long	0x8b60c8b3
 80127f8:	3fc68a28 	.long	0x3fc68a28
 80127fc:	636f4361 	.long	0x636f4361
 8012800:	3fd287a7 	.long	0x3fd287a7
 8012804:	0979a371 	.long	0x0979a371
 8012808:	400a934f 	.long	0x400a934f
 801280c:	bbb55516 	.long	0xbbb55516
 8012810:	40026bb1 	.long	0x40026bb1
 8012814:	fefa39ef 	.long	0xfefa39ef
 8012818:	3fe62e42 	.long	0x3fe62e42
 801281c:	eb1c432d 	.long	0xeb1c432d
 8012820:	3f1a36e2 	.long	0x3f1a36e2
 8012824:	412e8480 	.long	0x412e8480
    value /= conv.F;
 8012828:	6c2b      	mov      	r0, r10
 801282a:	6c67      	mov      	r1, r9
 801282c:	c4124822 	lsli      	r2, r18, 0
 8012830:	c4114823 	lsli      	r3, r17, 0
 8012834:	dd8e200b 	st.w      	r12, (r14, 0x2c)
 8012838:	e3fff4b2 	bsr      	0x801119c	// 801119c <__divdf3>
 801283c:	6e83      	mov      	r10, r0
 801283e:	6e47      	mov      	r9, r1
 8012840:	d98e200b 	ld.w      	r12, (r14, 0x2c)
 8012844:	0764      	br      	0x801270c	// 801270c <_etoa+0x320>
      if ((prec > 0) && (flags & FLAGS_PRECISION)) {
 8012846:	9847      	ld.w      	r2, (r14, 0x1c)
 8012848:	e902ff4d 	bez      	r2, 0x80126e2	// 80126e2 <_etoa+0x2f6>
        --prec;
 801284c:	9873      	ld.w      	r3, (r14, 0x4c)
 801284e:	3b40      	cmpnei      	r3, 0
 8012850:	c4620c20 	incf      	r3, r2, 0
 8012854:	c4620d01 	dect      	r3, r2, 1
 8012858:	b867      	st.w      	r3, (r14, 0x1c)
 801285a:	0744      	br      	0x80126e2	// 80126e2 <_etoa+0x2f6>
  idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
 801285c:	ea238000 	movih      	r3, 32768
 8012860:	60e4      	addu      	r3, r9
 8012862:	6e4f      	mov      	r9, r3
 8012864:	0760      	br      	0x8012724	// 8012724 <_etoa+0x338>
    value = -value;
 8012866:	ea238000 	movih      	r3, 32768
 801286a:	c4640029 	addu      	r9, r4, r3
 801286e:	e800fdf7 	br      	0x801245c	// 801245c <_etoa+0x70>
      if ((int)prec > expval) {
 8012872:	3300      	movi      	r3, 0
 8012874:	072e      	br      	0x80126d0	// 80126d0 <_etoa+0x2e4>
	...

08012878 <_vsnprintf>:
#endif  // PRINTF_SUPPORT_FLOAT


// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
 8012878:	ebe00058 	push      	r4-r11, r15, r16-r17
 801287c:	1436      	subi      	r14, r14, 88
  unsigned int flags, width, precision, n;
  size_t idx = 0U;

  if (!buffer) {
    // use null output function
    out = _out_null;
 801287e:	3940      	cmpnei      	r1, 0
 8012880:	10cf      	lrw      	r6, 0x8011b34	// 80128bc <_vsnprintf+0x44>
{
 8012882:	6e07      	mov      	r8, r1
 8012884:	6dcb      	mov      	r7, r2
 8012886:	6d4f      	mov      	r5, r3
 8012888:	9981      	ld.w      	r4, (r14, 0x84)
    out = _out_null;
 801288a:	c4c00c40 	inct      	r6, r0, 0
        format++;
        break;
      }

      case '%' :
        out('%', buffer, idx++, maxlen);
 801288e:	ea0b0000 	movi      	r11, 0
      switch (*format) {
 8012892:	ea89000c 	lrw      	r9, 0x80134b4	// 80128c0 <_vsnprintf+0x48>
  while (*format)
 8012896:	8500      	ld.b      	r0, (r5, 0x0)
 8012898:	e900006f 	bez      	r0, 0x8012976	// 8012976 <_vsnprintf+0xfe>
    if (*format != '%') {
 801289c:	eb400025 	cmpnei      	r0, 37
 80128a0:	0860      	bt      	0x8012960	// 8012960 <_vsnprintf+0xe8>
      format++;
 80128a2:	5d42      	addi      	r2, r5, 1
    flags = 0U;
 80128a4:	3100      	movi      	r1, 0
      switch (*format) {
 80128a6:	8200      	ld.b      	r0, (r2, 0x0)
 80128a8:	e460101f 	subi      	r3, r0, 32
 80128ac:	74cc      	zextb      	r3, r3
 80128ae:	3b10      	cmphsi      	r3, 17
 80128b0:	6d4b      	mov      	r5, r2
 80128b2:	081d      	bt      	0x80128ec	// 80128ec <_vsnprintf+0x74>
 80128b4:	d0690883 	ldr.w      	r3, (r9, r3 << 2)
 80128b8:	780c      	jmp      	r3
 80128ba:	0000      	.short	0x0000
 80128bc:	08011b34 	.long	0x08011b34
 80128c0:	080134b4 	.long	0x080134b4
        case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
 80128c4:	ec210001 	ori      	r1, r1, 1
 80128c8:	2200      	addi      	r2, 1
 80128ca:	07ee      	br      	0x80128a6	// 80128a6 <_vsnprintf+0x2e>
        case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
 80128cc:	ec210008 	ori      	r1, r1, 8
 80128d0:	2200      	addi      	r2, 1
 80128d2:	07ea      	br      	0x80128a6	// 80128a6 <_vsnprintf+0x2e>
        case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
 80128d4:	ec210010 	ori      	r1, r1, 16
 80128d8:	2200      	addi      	r2, 1
 80128da:	07e6      	br      	0x80128a6	// 80128a6 <_vsnprintf+0x2e>
        case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
 80128dc:	ec210004 	ori      	r1, r1, 4
 80128e0:	2200      	addi      	r2, 1
 80128e2:	07e2      	br      	0x80128a6	// 80128a6 <_vsnprintf+0x2e>
        case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
 80128e4:	ec210002 	ori      	r1, r1, 2
 80128e8:	2200      	addi      	r2, 1
 80128ea:	07de      	br      	0x80128a6	// 80128a6 <_vsnprintf+0x2e>
  return (ch >= '0') && (ch <= '9');
 80128ec:	e460102f 	subi      	r3, r0, 48
    if (_is_digit(*format)) {
 80128f0:	74cc      	zextb      	r3, r3
 80128f2:	3b09      	cmphsi      	r3, 10
 80128f4:	0c5b      	bf      	0x80129aa	// 80129aa <_vsnprintf+0x132>
    else if (*format == '*') {
 80128f6:	eb40002a 	cmpnei      	r0, 42
 80128fa:	e84003c3 	bf      	0x8013080	// 8013080 <_vsnprintf+0x808>
    width = 0U;
 80128fe:	ea110000 	movi      	r17, 0
    if (*format == '.') {
 8012902:	eb40002e 	cmpnei      	r0, 46
 8012906:	0c65      	bf      	0x80129d0	// 80129d0 <_vsnprintf+0x158>
    precision = 0U;
 8012908:	ea0a0000 	movi      	r10, 0
    switch (*format) {
 801290c:	e4601067 	subi      	r3, r0, 104
 8012910:	74cc      	zextb      	r3, r3
 8012912:	3b12      	cmphsi      	r3, 19
 8012914:	080c      	bt      	0x801292c	// 801292c <_vsnprintf+0xb4>
 8012916:	1043      	lrw      	r2, 0x80134f8	// 8012920 <_vsnprintf+0xa8>
 8012918:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 801291c:	780c      	jmp      	r3
 801291e:	0000      	.short	0x0000
 8012920:	080134f8 	.long	0x080134f8
 8012924:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 8012926:	ec210100 	ori      	r1, r1, 256
        format++;
 801292a:	2500      	addi      	r5, 1
    switch (*format) {
 801292c:	e4601024 	subi      	r3, r0, 37
 8012930:	74cc      	zextb      	r3, r3
 8012932:	eb030053 	cmphsi      	r3, 84
 8012936:	0815      	bt      	0x8012960	// 8012960 <_vsnprintf+0xe8>
 8012938:	1042      	lrw      	r2, 0x8013544	// 8012940 <_vsnprintf+0xc8>
 801293a:	d0620883 	ldr.w      	r3, (r2, r3 << 2)
 801293e:	780c      	jmp      	r3
 8012940:	08013544 	.long	0x08013544
        if (*format == 'l') {
 8012944:	8501      	ld.b      	r0, (r5, 0x1)
 8012946:	eb40006c 	cmpnei      	r0, 108
 801294a:	e84003ac 	bf      	0x80130a2	// 80130a2 <_vsnprintf+0x82a>
    switch (*format) {
 801294e:	e4601024 	subi      	r3, r0, 37
 8012952:	74cc      	zextb      	r3, r3
 8012954:	eb030053 	cmphsi      	r3, 84
        flags |= FLAGS_LONG;
 8012958:	ec210100 	ori      	r1, r1, 256
        format++;
 801295c:	2500      	addi      	r5, 1
    switch (*format) {
 801295e:	0fed      	bf      	0x8012938	// 8012938 <_vsnprintf+0xc0>
        format++;
        break;

      default :
        out(*format, buffer, idx++, maxlen);
        format++;
 8012960:	2500      	addi      	r5, 1
        out(*format, buffer, idx++, maxlen);
 8012962:	6caf      	mov      	r2, r11
 8012964:	6cdf      	mov      	r3, r7
 8012966:	6c63      	mov      	r1, r8
 8012968:	7bd9      	jsr      	r6
  while (*format)
 801296a:	8500      	ld.b      	r0, (r5, 0x0)
        out(*format, buffer, idx++, maxlen);
 801296c:	e54b0000 	addi      	r10, r11, 1
 8012970:	6eeb      	mov      	r11, r10
  while (*format)
 8012972:	e920ff95 	bnez      	r0, 0x801289c	// 801289c <_vsnprintf+0x24>
        break;
    }
  }

  // termination
  out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
 8012976:	65ec      	cmphs      	r11, r7
 8012978:	e8400381 	bf      	0x801307a	// 801307a <_vsnprintf+0x802>
 801297c:	5f43      	subi      	r2, r7, 1
 801297e:	6cdf      	mov      	r3, r7
 8012980:	6c63      	mov      	r1, r8
 8012982:	3000      	movi      	r0, 0
 8012984:	7bd9      	jsr      	r6

  // return written chars without terminating \0
  return (int)idx;
}
 8012986:	6c2f      	mov      	r0, r11
 8012988:	1416      	addi      	r14, r14, 88
 801298a:	ebc00058 	pop      	r4-r11, r15, r16-r17
        if (*format == 'h') {
 801298e:	8501      	ld.b      	r0, (r5, 0x1)
 8012990:	eb400068 	cmpnei      	r0, 104
 8012994:	e8400381 	bf      	0x8013096	// 8013096 <_vsnprintf+0x81e>
        flags |= FLAGS_SHORT;
 8012998:	ec210080 	ori      	r1, r1, 128
        format++;
 801299c:	2500      	addi      	r5, 1
 801299e:	07c7      	br      	0x801292c	// 801292c <_vsnprintf+0xb4>
 80129a0:	8501      	ld.b      	r0, (r5, 0x1)
        flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
 80129a2:	ec210200 	ori      	r1, r1, 512
        format++;
 80129a6:	2500      	addi      	r5, 1
        break;
 80129a8:	07c2      	br      	0x801292c	// 801292c <_vsnprintf+0xb4>
 80129aa:	ea110000 	movi      	r17, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80129ae:	ea0d000a 	movi      	r13, 10
  while (_is_digit(**str)) {
 80129b2:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80129b4:	2500      	addi      	r5, 1
 80129b6:	f9b18440 	mula.32.l      	r0, r17, r13
 80129ba:	e620102f 	subi      	r17, r0, 48
  while (_is_digit(**str)) {
 80129be:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80129c0:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 80129c4:	74cc      	zextb      	r3, r3
 80129c6:	64c8      	cmphs      	r2, r3
 80129c8:	0bf6      	bt      	0x80129b4	// 80129b4 <_vsnprintf+0x13c>
    if (*format == '.') {
 80129ca:	eb40002e 	cmpnei      	r0, 46
 80129ce:	0b9d      	bt      	0x8012908	// 8012908 <_vsnprintf+0x90>
      if (_is_digit(*format)) {
 80129d0:	8501      	ld.b      	r0, (r5, 0x1)
  return (ch >= '0') && (ch <= '9');
 80129d2:	e460102f 	subi      	r3, r0, 48
      if (_is_digit(*format)) {
 80129d6:	74cc      	zextb      	r3, r3
 80129d8:	3b09      	cmphsi      	r3, 10
      flags |= FLAGS_PRECISION;
 80129da:	ec210400 	ori      	r1, r1, 1024
      format++;
 80129de:	5d42      	addi      	r2, r5, 1
      if (_is_digit(*format)) {
 80129e0:	0813      	bt      	0x8012a06	// 8012a06 <_vsnprintf+0x18e>
 80129e2:	6d4b      	mov      	r5, r2
 80129e4:	ea0a0000 	movi      	r10, 0
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80129e8:	ea12000a 	movi      	r18, 10
  while (_is_digit(**str)) {
 80129ec:	3209      	movi      	r2, 9
    i = i * 10U + (unsigned int)(*((*str)++) - '0');
 80129ee:	2500      	addi      	r5, 1
 80129f0:	fa4a8440 	mula.32.l      	r0, r10, r18
 80129f4:	e540102f 	subi      	r10, r0, 48
  while (_is_digit(**str)) {
 80129f8:	8500      	ld.b      	r0, (r5, 0x0)
  return (ch >= '0') && (ch <= '9');
 80129fa:	e460102f 	subi      	r3, r0, 48
  while (_is_digit(**str)) {
 80129fe:	74cc      	zextb      	r3, r3
 8012a00:	64c8      	cmphs      	r2, r3
 8012a02:	0bf6      	bt      	0x80129ee	// 80129ee <_vsnprintf+0x176>
 8012a04:	0784      	br      	0x801290c	// 801290c <_vsnprintf+0x94>
      else if (*format == '*') {
 8012a06:	eb40002a 	cmpnei      	r0, 42
 8012a0a:	e84003e2 	bf      	0x80131ce	// 80131ce <_vsnprintf+0x956>
      format++;
 8012a0e:	6d4b      	mov      	r5, r2
 8012a10:	077c      	br      	0x8012908	// 8012908 <_vsnprintf+0x90>
        uint32_t ipv4 = va_arg(va, uint32_t);
 8012a12:	5c6e      	addi      	r3, r4, 4
 8012a14:	3000      	movi      	r0, 0
 8012a16:	dac42000 	ld.w      	r22, (r4, 0x0)
 8012a1a:	b869      	st.w      	r3, (r14, 0x24)
 8012a1c:	6d03      	mov      	r4, r0
            h = bit / 100;
 8012a1e:	ea140064 	movi      	r20, 100
            m = (bit % 100) / 10;
 8012a22:	ea13000a 	movi      	r19, 10
                    outtxt[j++] = '0';
 8012a26:	ea170030 	movi      	r23, 48
            outtxt[j++] = '.';
 8012a2a:	ea15002e 	movi      	r21, 46
 8012a2e:	ea120004 	movi      	r18, 4
            bit = (*inuint >> (8 * i)) & 0xff;
 8012a32:	c4164043 	lsr      	r3, r22, r0
 8012a36:	74cc      	zextb      	r3, r3
            h = bit / 100;
 8012a38:	c6838022 	divu      	r2, r3, r20
 8012a3c:	7748      	zextb      	r13, r2
            if (h)
 8012a3e:	e90d0306 	bez      	r13, 0x801304a	// 801304a <_vsnprintf+0x7d2>
            m = (bit % 100) / 10;
 8012a42:	c6828422 	mult      	r2, r2, r20
 8012a46:	60ca      	subu      	r3, r2
 8012a48:	74cc      	zextb      	r3, r3
                outtxt[j++] = '0' + h;
 8012a4a:	e70e002f 	addi      	r24, r14, 48
            m = (bit % 100) / 10;
 8012a4e:	c6638022 	divu      	r2, r3, r19
                outtxt[j++] = '0' + h;
 8012a52:	e5840000 	addi      	r12, r4, 1
 8012a56:	e5ad002f 	addi      	r13, r13, 48
 8012a5a:	7730      	zextb      	r12, r12
 8012a5c:	d498002d 	str.b      	r13, (r24, r4 << 0)
            if (m)
 8012a60:	e92202fe 	bnez      	r2, 0x801305c	// 801305c <_vsnprintf+0x7e4>
                    outtxt[j++] = '0';
 8012a64:	1a0c      	addi      	r2, r14, 48
 8012a66:	2401      	addi      	r4, 2
 8012a68:	7510      	zextb      	r4, r4
 8012a6a:	d5820037 	str.b      	r23, (r2, r12 << 0)
            l = (bit % 100) % 10;
 8012a6e:	c6638022 	divu      	r2, r3, r19
 8012a72:	c6628422 	mult      	r2, r2, r19
 8012a76:	60ca      	subu      	r3, r2
            outtxt[j++] = '0' + l;
 8012a78:	1a0c      	addi      	r2, r14, 48
 8012a7a:	e5840000 	addi      	r12, r4, 1
 8012a7e:	232f      	addi      	r3, 48
 8012a80:	d4820023 	str.b      	r3, (r2, r4 << 0)
 8012a84:	7730      	zextb      	r12, r12
            outtxt[j++] = '.';
 8012a86:	2401      	addi      	r4, 2
 8012a88:	7510      	zextb      	r4, r4
 8012a8a:	d5820035 	str.b      	r21, (r2, r12 << 0)
 8012a8e:	2007      	addi      	r0, 8
        for(i = 0; i < 4; i++)
 8012a90:	e832ffd1 	bnezad      	r18, 0x8012a32	// 8012a32 <_vsnprintf+0x1ba>
    outtxt[j - 1] = 0;
 8012a94:	e46e002e 	addi      	r3, r14, 47
 8012a98:	3200      	movi      	r2, 0
 8012a9a:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8012a9e:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8012aa0:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8012aa4:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8012aa6:	3a40      	cmpnei      	r2, 0
 8012aa8:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8012aac:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8012aae:	6c83      	mov      	r2, r0
 8012ab0:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8012ab4:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8012ab8:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8012aba:	b86b      	st.w      	r3, (r14, 0x2c)
 8012abc:	e9230333 	bnez      	r3, 0x8013122	// 8013122 <_vsnprintf+0x8aa>
          while (l++ < width) {
 8012ac0:	c6220420 	cmphs      	r2, r17
 8012ac4:	6ccb      	mov      	r3, r2
 8012ac6:	2300      	addi      	r3, 1
 8012ac8:	e86003ff 	bt      	0x80132c6	// 80132c6 <_vsnprintf+0xa4e>
 8012acc:	c5710023 	addu      	r3, r17, r11
 8012ad0:	5b89      	subu      	r4, r3, r2
 8012ad2:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012ad4:	e56b0000 	addi      	r11, r11, 1
 8012ad8:	6cdf      	mov      	r3, r7
 8012ada:	6c63      	mov      	r1, r8
 8012adc:	3020      	movi      	r0, 32
 8012ade:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012ae0:	66d2      	cmpne      	r4, r11
 8012ae2:	6caf      	mov      	r2, r11
 8012ae4:	0bf8      	bt      	0x8012ad4	// 8012ad4 <_vsnprintf+0x25c>
 8012ae6:	e4710000 	addi      	r3, r17, 1
 8012aea:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012aec:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8012af0:	e9000030 	bez      	r0, 0x8012b50	// 8012b50 <_vsnprintf+0x2d8>
 8012af4:	6caf      	mov      	r2, r11
 8012af6:	e60e002f 	addi      	r16, r14, 48
 8012afa:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8012afe:	0402      	br      	0x8012b02	// 8012b02 <_vsnprintf+0x28a>
          out(*(pstr++), buffer, idx++, maxlen);
 8012b00:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012b02:	e90b0007 	bez      	r11, 0x8012b10	// 8012b10 <_vsnprintf+0x298>
 8012b06:	e46a1000 	subi      	r3, r10, 1
 8012b0a:	e90a034a 	bez      	r10, 0x801319e	// 801319e <_vsnprintf+0x926>
 8012b0e:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8012b10:	e6100000 	addi      	r16, r16, 1
 8012b14:	6cdf      	mov      	r3, r7
 8012b16:	6c63      	mov      	r1, r8
 8012b18:	5a82      	addi      	r4, r2, 1
 8012b1a:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012b1c:	d8100000 	ld.b      	r0, (r16, 0x0)
 8012b20:	e920fff0 	bnez      	r0, 0x8012b00	// 8012b00 <_vsnprintf+0x288>
        if (flags & FLAGS_LEFT) {
 8012b24:	986b      	ld.w      	r3, (r14, 0x2c)
 8012b26:	e90302a5 	bez      	r3, 0x8013070	// 8013070 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8012b2a:	9868      	ld.w      	r3, (r14, 0x20)
 8012b2c:	c6230420 	cmphs      	r3, r17
 8012b30:	e86002a0 	bt      	0x8013070	// 8013070 <_vsnprintf+0x7f8>
 8012b34:	c4910020 	addu      	r0, r17, r4
 8012b38:	c460008a 	subu      	r10, r0, r3
 8012b3c:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8012b3e:	e5620000 	addi      	r11, r2, 1
 8012b42:	6cdf      	mov      	r3, r7
 8012b44:	6c63      	mov      	r1, r8
 8012b46:	3020      	movi      	r0, 32
 8012b48:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012b4a:	66ea      	cmpne      	r10, r11
 8012b4c:	6caf      	mov      	r2, r11
 8012b4e:	0bf8      	bt      	0x8012b3e	// 8012b3e <_vsnprintf+0x2c6>
        format++;
 8012b50:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8012b52:	9889      	ld.w      	r4, (r14, 0x24)
 8012b54:	06a1      	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8012b56:	da042000 	ld.w      	r16, (r4, 0x0)
 8012b5a:	5c6e      	addi      	r3, r4, 4
 8012b5c:	b868      	st.w      	r3, (r14, 0x20)
  for (s = str; *s && maxsize--; ++s);
 8012b5e:	d8100000 	ld.b      	r0, (r16, 0x0)
        unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
 8012b62:	3300      	movi      	r3, 0
 8012b64:	2b00      	subi      	r3, 1
 8012b66:	eb4a0000 	cmpnei      	r10, 0
 8012b6a:	c46a0c40 	inct      	r3, r10, 0
  for (s = str; *s && maxsize--; ++s);
 8012b6e:	c4104824 	lsli      	r4, r16, 0
 8012b72:	e9200006 	bnez      	r0, 0x8012b7e	// 8012b7e <_vsnprintf+0x306>
 8012b76:	0408      	br      	0x8012b86	// 8012b86 <_vsnprintf+0x30e>
 8012b78:	2b00      	subi      	r3, 1
 8012b7a:	e9030006 	bez      	r3, 0x8012b86	// 8012b86 <_vsnprintf+0x30e>
 8012b7e:	2400      	addi      	r4, 1
 8012b80:	8440      	ld.b      	r2, (r4, 0x0)
 8012b82:	e922fffb 	bnez      	r2, 0x8012b78	// 8012b78 <_vsnprintf+0x300>
  return (unsigned int)(s - str);
 8012b86:	c6040084 	subu      	r4, r4, r16
        if (flags & FLAGS_PRECISION) {
 8012b8a:	e4412400 	andi      	r2, r1, 1024
          l = (l < precision ? l : precision);
 8012b8e:	f944cd23 	min.u32      	r3, r4, r10
 8012b92:	3a40      	cmpnei      	r2, 0
 8012b94:	c4830c40 	inct      	r4, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8012b98:	e4612002 	andi      	r3, r1, 2
        if (flags & FLAGS_PRECISION) {
 8012b9c:	b849      	st.w      	r2, (r14, 0x24)
        if (!(flags & FLAGS_LEFT)) {
 8012b9e:	b86a      	st.w      	r3, (r14, 0x28)
 8012ba0:	e9230287 	bnez      	r3, 0x80130ae	// 80130ae <_vsnprintf+0x836>
          while (l++ < width) {
 8012ba4:	c6240420 	cmphs      	r4, r17
 8012ba8:	5c62      	addi      	r3, r4, 1
 8012baa:	e860039c 	bt      	0x80132e2	// 80132e2 <_vsnprintf+0xa6a>
 8012bae:	c5710023 	addu      	r3, r17, r11
 8012bb2:	5b91      	subu      	r4, r3, r4
 8012bb4:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012bb6:	e5620000 	addi      	r11, r2, 1
 8012bba:	6cdf      	mov      	r3, r7
 8012bbc:	6c63      	mov      	r1, r8
 8012bbe:	3020      	movi      	r0, 32
 8012bc0:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012bc2:	66d2      	cmpne      	r4, r11
 8012bc4:	6caf      	mov      	r2, r11
 8012bc6:	0bf8      	bt      	0x8012bb6	// 8012bb6 <_vsnprintf+0x33e>
 8012bc8:	c40b4832 	lsli      	r18, r11, 0
 8012bcc:	e4910000 	addi      	r4, r17, 1
 8012bd0:	d8100000 	ld.b      	r0, (r16, 0x0)
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012bd4:	e9000391 	bez      	r0, 0x80132f6	// 80132f6 <_vsnprintf+0xa7e>
 8012bd8:	b88b      	st.w      	r4, (r14, 0x2c)
 8012bda:	c4124822 	lsli      	r2, r18, 0
 8012bde:	d96e2009 	ld.w      	r11, (r14, 0x24)
 8012be2:	0402      	br      	0x8012be6	// 8012be6 <_vsnprintf+0x36e>
          out(*(p++), buffer, idx++, maxlen);
 8012be4:	6c93      	mov      	r2, r4
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012be6:	e90b0007 	bez      	r11, 0x8012bf4	// 8012bf4 <_vsnprintf+0x37c>
 8012bea:	e46a1000 	subi      	r3, r10, 1
 8012bee:	e90a02d2 	bez      	r10, 0x8013192	// 8013192 <_vsnprintf+0x91a>
 8012bf2:	6e8f      	mov      	r10, r3
          out(*(p++), buffer, idx++, maxlen);
 8012bf4:	e6100000 	addi      	r16, r16, 1
 8012bf8:	6cdf      	mov      	r3, r7
 8012bfa:	6c63      	mov      	r1, r8
 8012bfc:	5a82      	addi      	r4, r2, 1
 8012bfe:	7bd9      	jsr      	r6
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012c00:	d8100000 	ld.b      	r0, (r16, 0x0)
 8012c04:	e920fff0 	bnez      	r0, 0x8012be4	// 8012be4 <_vsnprintf+0x36c>
 8012c08:	6ed3      	mov      	r11, r4
 8012c0a:	988b      	ld.w      	r4, (r14, 0x2c)
        if (flags & FLAGS_LEFT) {
 8012c0c:	986a      	ld.w      	r3, (r14, 0x28)
 8012c0e:	e9030012 	bez      	r3, 0x8012c32	// 8012c32 <_vsnprintf+0x3ba>
          while (l++ < width) {
 8012c12:	c6240420 	cmphs      	r4, r17
 8012c16:	080e      	bt      	0x8012c32	// 8012c32 <_vsnprintf+0x3ba>
 8012c18:	c5710020 	addu      	r0, r17, r11
 8012c1c:	5891      	subu      	r4, r0, r4
 8012c1e:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012c20:	e56b0000 	addi      	r11, r11, 1
 8012c24:	6cdf      	mov      	r3, r7
 8012c26:	6c63      	mov      	r1, r8
 8012c28:	3020      	movi      	r0, 32
 8012c2a:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012c2c:	66d2      	cmpne      	r4, r11
 8012c2e:	6caf      	mov      	r2, r11
 8012c30:	0bf8      	bt      	0x8012c20	// 8012c20 <_vsnprintf+0x3a8>
        format++;
 8012c32:	2500      	addi      	r5, 1
        const char* p = va_arg(va, char*);
 8012c34:	9888      	ld.w      	r4, (r14, 0x20)
        break;
 8012c36:	0630      	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8012c38:	3308      	movi      	r3, 8
 8012c3a:	b864      	st.w      	r3, (r14, 0x10)
 8012c3c:	3310      	movi      	r3, 16
 8012c3e:	b862      	st.w      	r3, (r14, 0x8)
        flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
 8012c40:	ec210021 	ori      	r1, r1, 33
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8012c44:	3300      	movi      	r3, 0
 8012c46:	b825      	st.w      	r1, (r14, 0x14)
 8012c48:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8012c4c:	b861      	st.w      	r3, (r14, 0x4)
 8012c4e:	9460      	ld.w      	r3, (r4, 0x0)
 8012c50:	b860      	st.w      	r3, (r14, 0x0)
 8012c52:	6caf      	mov      	r2, r11
 8012c54:	6cdf      	mov      	r3, r7
 8012c56:	6c63      	mov      	r1, r8
 8012c58:	6c1b      	mov      	r0, r6
 8012c5a:	e6040003 	addi      	r16, r4, 4
 8012c5e:	e3fff8af 	bsr      	0x8011dbc	// 8011dbc <_ntoa_long>
 8012c62:	6ec3      	mov      	r11, r0
        format++;
 8012c64:	2500      	addi      	r5, 1
          idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
 8012c66:	c4104824 	lsli      	r4, r16, 0
        break;
 8012c6a:	0616      	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        if (!(flags & FLAGS_LEFT)) {
 8012c6c:	e4212002 	andi      	r1, r1, 2
 8012c70:	e9210227 	bnez      	r1, 0x80130be	// 80130be <_vsnprintf+0x846>
          while (l++ < width) {
 8012c74:	3301      	movi      	r3, 1
 8012c76:	c6230420 	cmphs      	r3, r17
 8012c7a:	e860032f 	bt      	0x80132d8	// 80132d8 <_vsnprintf+0xa60>
 8012c7e:	e60b1000 	subi      	r16, r11, 1
 8012c82:	c6300030 	addu      	r16, r16, r17
 8012c86:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012c88:	e5420000 	addi      	r10, r2, 1
 8012c8c:	6cdf      	mov      	r3, r7
 8012c8e:	6c63      	mov      	r1, r8
 8012c90:	3020      	movi      	r0, 32
 8012c92:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012c94:	c5500480 	cmpne      	r16, r10
 8012c98:	6cab      	mov      	r2, r10
 8012c9a:	0bf7      	bt      	0x8012c88	// 8012c88 <_vsnprintf+0x410>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 8012c9c:	8400      	ld.b      	r0, (r4, 0x0)
 8012c9e:	e6040003 	addi      	r16, r4, 4
 8012ca2:	6cdf      	mov      	r3, r7
 8012ca4:	6cab      	mov      	r2, r10
 8012ca6:	6c63      	mov      	r1, r8
 8012ca8:	e56a0000 	addi      	r11, r10, 1
 8012cac:	7bd9      	jsr      	r6
 8012cae:	c4104824 	lsli      	r4, r16, 0
        format++;
 8012cb2:	2500      	addi      	r5, 1
        break;
 8012cb4:	e800fdf1 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        if (*format == 'x' || *format == 'X') {
 8012cb8:	eb400078 	cmpnei      	r0, 120
 8012cbc:	e8400277 	bf      	0x80131aa	// 80131aa <_vsnprintf+0x932>
 8012cc0:	eb400058 	cmpnei      	r0, 88
 8012cc4:	e8400275 	bf      	0x80131ae	// 80131ae <_vsnprintf+0x936>
        else if (*format == 'o') {
 8012cc8:	eb40006f 	cmpnei      	r0, 111
 8012ccc:	e8400232 	bf      	0x8013130	// 8013130 <_vsnprintf+0x8b8>
        else if (*format == 'b') {
 8012cd0:	eb400062 	cmpnei      	r0, 98
 8012cd4:	e84002d5 	bf      	0x801327e	// 801327e <_vsnprintf+0xa06>
        if ((*format != 'i') && (*format != 'd')) {
 8012cd8:	eb400069 	cmpnei      	r0, 105
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8012cdc:	c4812823 	bclri      	r3, r1, 4
        if ((*format != 'i') && (*format != 'd')) {
 8012ce0:	e8600232 	bt      	0x8013144	// 8013144 <_vsnprintf+0x8cc>
        if (flags & FLAGS_PRECISION) {
 8012ce4:	e4212400 	andi      	r1, r1, 1024
          base = 10U;
 8012ce8:	320a      	movi      	r2, 10
        if (flags & FLAGS_PRECISION) {
 8012cea:	e9010236 	bez      	r1, 0x8013156	// 8013156 <_vsnprintf+0x8de>
          flags &= ~FLAGS_ZEROPAD;
 8012cee:	3b80      	bclri      	r3, 0
        if ((*format == 'i') || (*format == 'd')) {
 8012cf0:	eb400069 	cmpnei      	r0, 105
 8012cf4:	e8400231 	bf      	0x8013156	// 8013156 <_vsnprintf+0x8de>
 8012cf8:	eb400064 	cmpnei      	r0, 100
 8012cfc:	e840022d 	bf      	0x8013156	// 8013156 <_vsnprintf+0x8de>
          if (flags & FLAGS_LONG_LONG) {
 8012d00:	e4232200 	andi      	r1, r3, 512
 8012d04:	e9210276 	bnez      	r1, 0x80131f0	// 80131f0 <_vsnprintf+0x978>
          else if (flags & FLAGS_LONG) {
 8012d08:	e4032100 	andi      	r0, r3, 256
 8012d0c:	e92002a2 	bnez      	r0, 0x8013250	// 8013250 <_vsnprintf+0x9d8>
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8012d10:	e4232040 	andi      	r1, r3, 64
 8012d14:	e92102cf 	bnez      	r1, 0x80132b2	// 80132b2 <_vsnprintf+0xa3a>
 8012d18:	e4232080 	andi      	r1, r3, 128
 8012d1c:	e92102b3 	bnez      	r1, 0x8013282	// 8013282 <_vsnprintf+0xa0a>
 8012d20:	9420      	ld.w      	r1, (r4, 0x0)
 8012d22:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
 8012d24:	b865      	st.w      	r3, (r14, 0x14)
 8012d26:	3300      	movi      	r3, 0
 8012d28:	de2e2004 	st.w      	r17, (r14, 0x10)
 8012d2c:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8012d30:	b842      	st.w      	r2, (r14, 0x8)
 8012d32:	b861      	st.w      	r3, (r14, 0x4)
 8012d34:	b820      	st.w      	r1, (r14, 0x0)
 8012d36:	6caf      	mov      	r2, r11
 8012d38:	6cdf      	mov      	r3, r7
 8012d3a:	6c63      	mov      	r1, r8
 8012d3c:	6c1b      	mov      	r0, r6
 8012d3e:	e3fff83f 	bsr      	0x8011dbc	// 8011dbc <_ntoa_long>
 8012d42:	6ec3      	mov      	r11, r0
        format++;
 8012d44:	2500      	addi      	r5, 1
 8012d46:	e800fda8 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 8012d4a:	eb400046 	cmpnei      	r0, 70
 8012d4e:	e840023c 	bf      	0x80131c6	// 80131c6 <_vsnprintf+0x94e>
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8012d52:	b824      	st.w      	r1, (r14, 0x10)
 8012d54:	de2e2003 	st.w      	r17, (r14, 0xc)
 8012d58:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8012d5c:	e6040007 	addi      	r16, r4, 8
 8012d60:	9460      	ld.w      	r3, (r4, 0x0)
 8012d62:	9481      	ld.w      	r4, (r4, 0x4)
 8012d64:	b860      	st.w      	r3, (r14, 0x0)
 8012d66:	b881      	st.w      	r4, (r14, 0x4)
 8012d68:	6caf      	mov      	r2, r11
 8012d6a:	6cdf      	mov      	r3, r7
 8012d6c:	6c63      	mov      	r1, r8
 8012d6e:	6c1b      	mov      	r0, r6
 8012d70:	e3fff8f2 	bsr      	0x8011f54	// 8011f54 <_ftoa>
 8012d74:	6ec3      	mov      	r11, r0
        format++;
 8012d76:	2500      	addi      	r5, 1
        idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8012d78:	c4104824 	lsli      	r4, r16, 0
        break;
 8012d7c:	e800fd8d 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        out('%', buffer, idx++, maxlen);
 8012d80:	6caf      	mov      	r2, r11
 8012d82:	e54b0000 	addi      	r10, r11, 1
 8012d86:	6cdf      	mov      	r3, r7
 8012d88:	6c63      	mov      	r1, r8
 8012d8a:	3025      	movi      	r0, 37
 8012d8c:	7bd9      	jsr      	r6
        format++;
 8012d8e:	2500      	addi      	r5, 1
        out('%', buffer, idx++, maxlen);
 8012d90:	6eeb      	mov      	r11, r10
        break;
 8012d92:	e800fd82 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        char *ipv6 = va_arg(va, char*);
 8012d96:	5c6e      	addi      	r3, r4, 4
 8012d98:	dac42000 	ld.w      	r22, (r4, 0x0)
 8012d9c:	b869      	st.w      	r3, (r14, 0x24)
 8012d9e:	e716000f 	addi      	r24, r22, 16
 8012da2:	3400      	movi      	r4, 0
                if (h > 9)
 8012da4:	ea140009 	movi      	r20, 9
                    outtxt[j++] = ':';
 8012da8:	ea17003a 	movi      	r23, 58
          while (l++ < width) {
 8012dac:	ea0c0000 	movi      	r12, 0
 8012db0:	da562000 	ld.w      	r18, (r22, 0x0)
 8012db4:	6c33      	mov      	r0, r12
 8012db6:	ea0d0004 	movi      	r13, 4
                m = (*inuint >> (8 * i)) & 0xff;
 8012dba:	c5924043 	lsr      	r3, r18, r12
 8012dbe:	74cc      	zextb      	r3, r3
                h = m >> 4;
 8012dc0:	4b44      	lsri      	r2, r3, 4
                if (h > 9)
 8012dc2:	c4540420 	cmphs      	r20, r2
                    outtxt[j++] = 'A' + h - 10;
 8012dc6:	e6640000 	addi      	r19, r4, 1
                l = m & 0xf;
 8012dca:	e463200f 	andi      	r3, r3, 15
                    outtxt[j++] = 'A' + h - 10;
 8012dce:	c41354f3 	zext      	r19, r19, 7, 0
                if (h > 9)
 8012dd2:	092e      	bt      	0x801302e	// 801302e <_vsnprintf+0x7b6>
                    outtxt[j++] = 'A' + h - 10;
 8012dd4:	e6ae002f 	addi      	r21, r14, 48
 8012dd8:	2236      	addi      	r2, 55
 8012dda:	d4950022 	str.b      	r2, (r21, r4 << 0)
                if (l > 9)
 8012dde:	c4740420 	cmphs      	r20, r3
                    outtxt[j++] = 'A' + l - 10;
 8012de2:	e4930000 	addi      	r4, r19, 1
 8012de6:	7510      	zextb      	r4, r4
                if (l > 9)
 8012de8:	091e      	bt      	0x8013024	// 8013024 <_vsnprintf+0x7ac>
                    outtxt[j++] = 'A' + l - 10;
 8012dea:	1a0c      	addi      	r2, r14, 48
 8012dec:	2336      	addi      	r3, 55
 8012dee:	d6620023 	str.b      	r3, (r2, r19 << 0)
                if (0 != (i % 2))
 8012df2:	e4602001 	andi      	r3, r0, 1
 8012df6:	e9030007 	bez      	r3, 0x8012e04	// 8012e04 <_vsnprintf+0x58c>
                    outtxt[j++] = ':';
 8012dfa:	1a0c      	addi      	r2, r14, 48
 8012dfc:	5c62      	addi      	r3, r4, 1
 8012dfe:	d4820037 	str.b      	r23, (r2, r4 << 0)
 8012e02:	750c      	zextb      	r4, r3
            for(i = 0; i < 4; i++)
 8012e04:	2000      	addi      	r0, 1
 8012e06:	7400      	zextb      	r0, r0
 8012e08:	e58c0007 	addi      	r12, r12, 8
 8012e0c:	e82dffd7 	bnezad      	r13, 0x8012dba	// 8012dba <_vsnprintf+0x542>
            inuint++;
 8012e10:	e6d60003 	addi      	r22, r22, 4
        for (k = 0; k < 4; k++)
 8012e14:	c6d80480 	cmpne      	r24, r22
 8012e18:	0bca      	bt      	0x8012dac	// 8012dac <_vsnprintf+0x534>
    outtxt[j - 1] = 0;
 8012e1a:	e46e002e 	addi      	r3, r14, 47
 8012e1e:	3200      	movi      	r2, 0
 8012e20:	d4830022 	str.b      	r2, (r3, r4 << 0)
    return j - 1;
 8012e24:	5c63      	subi      	r3, r4, 1
        if (flags & FLAGS_PRECISION) {
 8012e26:	e4412400 	andi      	r2, r1, 1024
    return j - 1;
 8012e2a:	6c0f      	mov      	r0, r3
          l = (l < precision ? l : precision);
 8012e2c:	3a40      	cmpnei      	r2, 0
 8012e2e:	f943cd23 	min.u32      	r3, r3, r10
        if (flags & FLAGS_PRECISION) {
 8012e32:	b84a      	st.w      	r2, (r14, 0x28)
          l = (l < precision ? l : precision);
 8012e34:	6c83      	mov      	r2, r0
 8012e36:	c4430c40 	inct      	r2, r3, 0
        if (!(flags & FLAGS_LEFT)) {
 8012e3a:	e4612002 	andi      	r3, r1, 2
          l = (l < precision ? l : precision);
 8012e3e:	b848      	st.w      	r2, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8012e40:	b86b      	st.w      	r3, (r14, 0x2c)
 8012e42:	e923015a 	bnez      	r3, 0x80130f6	// 80130f6 <_vsnprintf+0x87e>
          while (l++ < width) {
 8012e46:	c6220420 	cmphs      	r2, r17
 8012e4a:	6ccb      	mov      	r3, r2
 8012e4c:	2300      	addi      	r3, 1
 8012e4e:	e8600239 	bt      	0x80132c0	// 80132c0 <_vsnprintf+0xa48>
 8012e52:	c5710023 	addu      	r3, r17, r11
 8012e56:	5b89      	subu      	r4, r3, r2
 8012e58:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012e5a:	e56b0000 	addi      	r11, r11, 1
 8012e5e:	6cdf      	mov      	r3, r7
 8012e60:	6c63      	mov      	r1, r8
 8012e62:	3020      	movi      	r0, 32
 8012e64:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012e66:	66d2      	cmpne      	r4, r11
 8012e68:	6caf      	mov      	r2, r11
 8012e6a:	0bf8      	bt      	0x8012e5a	// 8012e5a <_vsnprintf+0x5e2>
 8012e6c:	e4710000 	addi      	r3, r17, 1
 8012e70:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012e72:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8012e76:	e900fe6d 	bez      	r0, 0x8012b50	// 8012b50 <_vsnprintf+0x2d8>
 8012e7a:	6caf      	mov      	r2, r11
 8012e7c:	e60e002f 	addi      	r16, r14, 48
 8012e80:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8012e84:	0402      	br      	0x8012e88	// 8012e88 <_vsnprintf+0x610>
          out(*(pstr++), buffer, idx++, maxlen);
 8012e86:	6c93      	mov      	r2, r4
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012e88:	e90b0007 	bez      	r11, 0x8012e96	// 8012e96 <_vsnprintf+0x61e>
 8012e8c:	e46a1000 	subi      	r3, r10, 1
 8012e90:	e90a0185 	bez      	r10, 0x801319a	// 801319a <_vsnprintf+0x922>
 8012e94:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8012e96:	e6100000 	addi      	r16, r16, 1
 8012e9a:	6cdf      	mov      	r3, r7
 8012e9c:	6c63      	mov      	r1, r8
 8012e9e:	5a82      	addi      	r4, r2, 1
 8012ea0:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012ea2:	d8100000 	ld.b      	r0, (r16, 0x0)
 8012ea6:	e920fff0 	bnez      	r0, 0x8012e86	// 8012e86 <_vsnprintf+0x60e>
        if (flags & FLAGS_LEFT) {
 8012eaa:	986b      	ld.w      	r3, (r14, 0x2c)
 8012eac:	e90300e2 	bez      	r3, 0x8013070	// 8013070 <_vsnprintf+0x7f8>
          while (l++ < width) {
 8012eb0:	9868      	ld.w      	r3, (r14, 0x20)
 8012eb2:	c6230420 	cmphs      	r3, r17
 8012eb6:	08dd      	bt      	0x8013070	// 8013070 <_vsnprintf+0x7f8>
 8012eb8:	c4910020 	addu      	r0, r17, r4
 8012ebc:	c460008a 	subu      	r10, r0, r3
 8012ec0:	6c93      	mov      	r2, r4
            out(' ', buffer, idx++, maxlen);
 8012ec2:	e5620000 	addi      	r11, r2, 1
 8012ec6:	6cdf      	mov      	r3, r7
 8012ec8:	6c63      	mov      	r1, r8
 8012eca:	3020      	movi      	r0, 32
 8012ecc:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012ece:	66ea      	cmpne      	r10, r11
 8012ed0:	6caf      	mov      	r2, r11
 8012ed2:	0bf8      	bt      	0x8012ec2	// 8012ec2 <_vsnprintf+0x64a>
        format++;
 8012ed4:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8012ed6:	9889      	ld.w      	r4, (r14, 0x24)
 8012ed8:	e800fcdf 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        const char* p = va_arg(va, char*);
 8012edc:	5c6e      	addi      	r3, r4, 4
 8012ede:	b869      	st.w      	r3, (r14, 0x24)
 8012ee0:	da642000 	ld.w      	r19, (r4, 0x0)
 8012ee4:	1a0c      	addi      	r2, r14, 48
        if (hbit > 9)
 8012ee6:	ea140009 	movi      	r20, 9
        outtxt[3 * i + 2] = '-';
 8012eea:	ea15002d 	movi      	r21, 45
 8012eee:	ea120006 	movi      	r18, 6
        hbit = (*(inchar + i) & 0xf0) >> 4;
 8012ef2:	d8730000 	ld.b      	r3, (r19, 0x0)
 8012ef6:	4b04      	lsri      	r0, r3, 4
        if (hbit > 9)
 8012ef8:	c4140420 	cmphs      	r20, r0
        lbit = *(inchar + i ) & 0x0f;
 8012efc:	e463200f 	andi      	r3, r3, 15
        if (hbit > 9)
 8012f00:	089d      	bt      	0x801303a	// 801303a <_vsnprintf+0x7c2>
        if (lbit > 9)
 8012f02:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i] = 'A' + hbit - 10;
 8012f06:	2036      	addi      	r0, 55
 8012f08:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8012f0a:	089d      	bt      	0x8013044	// 8013044 <_vsnprintf+0x7cc>
            outtxt[3 * i + 1] = 'A' + lbit - 10;
 8012f0c:	2336      	addi      	r3, 55
 8012f0e:	a261      	st.b      	r3, (r2, 0x1)
        outtxt[3 * i + 2] = '-';
 8012f10:	dea20002 	st.b      	r21, (r2, 0x2)
 8012f14:	e6730000 	addi      	r19, r19, 1
 8012f18:	2202      	addi      	r2, 3
    for(i = 0; i < 6; i++)/* mac length */
 8012f1a:	e832ffec 	bnezad      	r18, 0x8012ef2	// 8012ef2 <_vsnprintf+0x67a>
    outtxt[3 * (i - 1) + 2] = 0;
 8012f1e:	3300      	movi      	r3, 0
 8012f20:	dc6e0041 	st.b      	r3, (r14, 0x41)
        if (flags & FLAGS_PRECISION) {
 8012f24:	e4612400 	andi      	r3, r1, 1024
 8012f28:	b86a      	st.w      	r3, (r14, 0x28)
 8012f2a:	e90300f3 	bez      	r3, 0x8013110	// 8013110 <_vsnprintf+0x898>
          l = (l < precision ? l : precision);
 8012f2e:	ea100011 	movi      	r16, 17
 8012f32:	fa0acd23 	min.u32      	r3, r10, r16
 8012f36:	b868      	st.w      	r3, (r14, 0x20)
        if (!(flags & FLAGS_LEFT)) {
 8012f38:	e4612002 	andi      	r3, r1, 2
 8012f3c:	b86b      	st.w      	r3, (r14, 0x2c)
 8012f3e:	e92300e2 	bnez      	r3, 0x8013102	// 8013102 <_vsnprintf+0x88a>
          while (l++ < width) {
 8012f42:	9848      	ld.w      	r2, (r14, 0x20)
 8012f44:	c6220420 	cmphs      	r2, r17
 8012f48:	6ccb      	mov      	r3, r2
 8012f4a:	2300      	addi      	r3, 1
 8012f4c:	09c9      	bt      	0x80132de	// 80132de <_vsnprintf+0xa66>
 8012f4e:	c5710023 	addu      	r3, r17, r11
 8012f52:	c4430090 	subu      	r16, r3, r2
 8012f56:	6caf      	mov      	r2, r11
            out(' ', buffer, idx++, maxlen);
 8012f58:	e56b0000 	addi      	r11, r11, 1
 8012f5c:	6cdf      	mov      	r3, r7
 8012f5e:	6c63      	mov      	r1, r8
 8012f60:	3020      	movi      	r0, 32
 8012f62:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012f64:	c60b0480 	cmpne      	r11, r16
 8012f68:	6caf      	mov      	r2, r11
 8012f6a:	0bf7      	bt      	0x8012f58	// 8012f58 <_vsnprintf+0x6e0>
 8012f6c:	e4710000 	addi      	r3, r17, 1
 8012f70:	b868      	st.w      	r3, (r14, 0x20)
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012f72:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8012f76:	e900fded 	bez      	r0, 0x8012b50	// 8012b50 <_vsnprintf+0x2d8>
 8012f7a:	6caf      	mov      	r2, r11
 8012f7c:	1c0c      	addi      	r4, r14, 48
 8012f7e:	d96e200a 	ld.w      	r11, (r14, 0x28)
 8012f82:	0403      	br      	0x8012f88	// 8012f88 <_vsnprintf+0x710>
          out(*(pstr++), buffer, idx++, maxlen);
 8012f84:	c4104822 	lsli      	r2, r16, 0
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012f88:	e90b0007 	bez      	r11, 0x8012f96	// 8012f96 <_vsnprintf+0x71e>
 8012f8c:	e46a1000 	subi      	r3, r10, 1
 8012f90:	e90a010a 	bez      	r10, 0x80131a4	// 80131a4 <_vsnprintf+0x92c>
 8012f94:	6e8f      	mov      	r10, r3
          out(*(pstr++), buffer, idx++, maxlen);
 8012f96:	2400      	addi      	r4, 1
 8012f98:	6cdf      	mov      	r3, r7
 8012f9a:	6c63      	mov      	r1, r8
 8012f9c:	e6020000 	addi      	r16, r2, 1
 8012fa0:	7bd9      	jsr      	r6
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8012fa2:	8400      	ld.b      	r0, (r4, 0x0)
 8012fa4:	e920fff0 	bnez      	r0, 0x8012f84	// 8012f84 <_vsnprintf+0x70c>
        if (flags & FLAGS_LEFT) {
 8012fa8:	986b      	ld.w      	r3, (r14, 0x2c)
 8012faa:	e90300b6 	bez      	r3, 0x8013116	// 8013116 <_vsnprintf+0x89e>
          while (l++ < width) {
 8012fae:	9868      	ld.w      	r3, (r14, 0x20)
 8012fb0:	c6230420 	cmphs      	r3, r17
 8012fb4:	08b1      	bt      	0x8013116	// 8013116 <_vsnprintf+0x89e>
 8012fb6:	c6110020 	addu      	r0, r17, r16
 8012fba:	588d      	subu      	r4, r0, r3
 8012fbc:	c4104822 	lsli      	r2, r16, 0
            out(' ', buffer, idx++, maxlen);
 8012fc0:	e5620000 	addi      	r11, r2, 1
 8012fc4:	6cdf      	mov      	r3, r7
 8012fc6:	6c63      	mov      	r1, r8
 8012fc8:	3020      	movi      	r0, 32
 8012fca:	7bd9      	jsr      	r6
          while (l++ < width) {
 8012fcc:	652e      	cmpne      	r11, r4
 8012fce:	6caf      	mov      	r2, r11
 8012fd0:	0bf8      	bt      	0x8012fc0	// 8012fc0 <_vsnprintf+0x748>
        format++;
 8012fd2:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8012fd4:	9889      	ld.w      	r4, (r14, 0x24)
 8012fd6:	e800fc60 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        if ((*format == 'g')||(*format == 'G')) flags |= FLAGS_ADAPT_EXP;
 8012fda:	e46020df 	andi      	r3, r0, 223
 8012fde:	eb430047 	cmpnei      	r3, 71
 8012fe2:	0805      	bt      	0x8012fec	// 8012fec <_vsnprintf+0x774>
 8012fe4:	ec210800 	ori      	r1, r1, 2048
        if ((*format == 'E')||(*format == 'G')) flags |= FLAGS_UPPERCASE;
 8012fe8:	e40020fd 	andi      	r0, r0, 253
 8012fec:	eb400045 	cmpnei      	r0, 69
 8012ff0:	0803      	bt      	0x8012ff6	// 8012ff6 <_vsnprintf+0x77e>
 8012ff2:	ec210020 	ori      	r1, r1, 32
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 8012ff6:	b824      	st.w      	r1, (r14, 0x10)
 8012ff8:	de2e2003 	st.w      	r17, (r14, 0xc)
 8012ffc:	dd4e2002 	st.w      	r10, (r14, 0x8)
 8013000:	e6040007 	addi      	r16, r4, 8
 8013004:	9460      	ld.w      	r3, (r4, 0x0)
 8013006:	9481      	ld.w      	r4, (r4, 0x4)
 8013008:	b860      	st.w      	r3, (r14, 0x0)
 801300a:	b881      	st.w      	r4, (r14, 0x4)
 801300c:	6caf      	mov      	r2, r11
 801300e:	6cdf      	mov      	r3, r7
 8013010:	6c63      	mov      	r1, r8
 8013012:	6c1b      	mov      	r0, r6
 8013014:	e3fff9ec 	bsr      	0x80123ec	// 80123ec <_etoa>
 8013018:	6ec3      	mov      	r11, r0
        format++;
 801301a:	2500      	addi      	r5, 1
        idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
 801301c:	c4104824 	lsli      	r4, r16, 0
        break;
 8013020:	e800fc3b 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
                    outtxt[j++] = '0' + l;
 8013024:	1a0c      	addi      	r2, r14, 48
 8013026:	232f      	addi      	r3, 48
 8013028:	d6620023 	str.b      	r3, (r2, r19 << 0)
 801302c:	06e3      	br      	0x8012df2	// 8012df2 <_vsnprintf+0x57a>
                    outtxt[j++]= '0' + h;
 801302e:	e6ae002f 	addi      	r21, r14, 48
 8013032:	222f      	addi      	r2, 48
 8013034:	d4950022 	str.b      	r2, (r21, r4 << 0)
 8013038:	06d3      	br      	0x8012dde	// 8012dde <_vsnprintf+0x566>
        if (lbit > 9)
 801303a:	c4740420 	cmphs      	r20, r3
            outtxt[3 * i]= '0' + hbit;
 801303e:	202f      	addi      	r0, 48
 8013040:	a200      	st.b      	r0, (r2, 0x0)
        if (lbit > 9)
 8013042:	0f65      	bf      	0x8012f0c	// 8012f0c <_vsnprintf+0x694>
            outtxt[3 * i + 1] = '0' + lbit;
 8013044:	232f      	addi      	r3, 48
 8013046:	a261      	st.b      	r3, (r2, 0x1)
 8013048:	0764      	br      	0x8012f10	// 8012f10 <_vsnprintf+0x698>
            m = (bit % 100) / 10;
 801304a:	c6828422 	mult      	r2, r2, r20
 801304e:	60ca      	subu      	r3, r2
 8013050:	74cc      	zextb      	r3, r3
 8013052:	c6638022 	divu      	r2, r3, r19
            if (m)
 8013056:	e902fd0c 	bez      	r2, 0x8012a6e	// 8012a6e <_vsnprintf+0x1f6>
 801305a:	6f13      	mov      	r12, r4
                outtxt[j++] = '0' + m;
 801305c:	e5ae002f 	addi      	r13, r14, 48
 8013060:	e48c0000 	addi      	r4, r12, 1
 8013064:	222f      	addi      	r2, 48
 8013066:	7510      	zextb      	r4, r4
 8013068:	d58d0022 	str.b      	r2, (r13, r12 << 0)
 801306c:	e800fd01 	br      	0x8012a6e	// 8012a6e <_vsnprintf+0x1f6>
          while (l++ < width) {
 8013070:	6ed3      	mov      	r11, r4
        format++;
 8013072:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 8013074:	9889      	ld.w      	r4, (r14, 0x24)
 8013076:	e800fc10 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
 801307a:	6caf      	mov      	r2, r11
 801307c:	e800fc81 	br      	0x801297e	// 801297e <_vsnprintf+0x106>
      const int w = va_arg(va, int);
 8013080:	9400      	ld.w      	r0, (r4, 0x0)
 8013082:	5c6e      	addi      	r3, r4, 4
      if (w < 0) {
 8013084:	e98000af 	blz      	r0, 0x80131e2	// 80131e2 <_vsnprintf+0x96a>
        width = (unsigned int)w;
 8013088:	c4004831 	lsli      	r17, r0, 0
 801308c:	8201      	ld.b      	r0, (r2, 0x1)
      const int w = va_arg(va, int);
 801308e:	6d0f      	mov      	r4, r3
      format++;
 8013090:	5aa2      	addi      	r5, r2, 1
 8013092:	e800fc38 	br      	0x8012902	// 8012902 <_vsnprintf+0x8a>
 8013096:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_CHAR;
 8013098:	ec2100c0 	ori      	r1, r1, 192
          format++;
 801309c:	2501      	addi      	r5, 2
 801309e:	e800fc47 	br      	0x801292c	// 801292c <_vsnprintf+0xb4>
 80130a2:	8502      	ld.b      	r0, (r5, 0x2)
          flags |= FLAGS_LONG_LONG;
 80130a4:	ec210300 	ori      	r1, r1, 768
          format++;
 80130a8:	2501      	addi      	r5, 2
 80130aa:	e800fc41 	br      	0x801292c	// 801292c <_vsnprintf+0xb4>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80130ae:	e900fdb2 	bez      	r0, 0x8012c12	// 8012c12 <_vsnprintf+0x39a>
 80130b2:	6caf      	mov      	r2, r11
 80130b4:	b88b      	st.w      	r4, (r14, 0x2c)
 80130b6:	d96e2009 	ld.w      	r11, (r14, 0x24)
 80130ba:	e800fd96 	br      	0x8012be6	// 8012be6 <_vsnprintf+0x36e>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80130be:	6cdf      	mov      	r3, r7
 80130c0:	6caf      	mov      	r2, r11
 80130c2:	6c63      	mov      	r1, r8
 80130c4:	8400      	ld.b      	r0, (r4, 0x0)
 80130c6:	7bd9      	jsr      	r6
          while (l++ < width) {
 80130c8:	eb110001 	cmphsi      	r17, 2
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80130cc:	e6040003 	addi      	r16, r4, 4
 80130d0:	e54b0000 	addi      	r10, r11, 1
          while (l++ < width) {
 80130d4:	0cfc      	bf      	0x80132cc	// 80132cc <_vsnprintf+0xa54>
 80130d6:	c571002b 	addu      	r11, r17, r11
 80130da:	6cab      	mov      	r2, r10
            out(' ', buffer, idx++, maxlen);
 80130dc:	5a82      	addi      	r4, r2, 1
 80130de:	6cdf      	mov      	r3, r7
 80130e0:	6c63      	mov      	r1, r8
 80130e2:	3020      	movi      	r0, 32
 80130e4:	7bd9      	jsr      	r6
          while (l++ < width) {
 80130e6:	652e      	cmpne      	r11, r4
 80130e8:	6c93      	mov      	r2, r4
 80130ea:	0bf9      	bt      	0x80130dc	// 80130dc <_vsnprintf+0x864>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80130ec:	c4104824 	lsli      	r4, r16, 0
        format++;
 80130f0:	2500      	addi      	r5, 1
 80130f2:	e800fbd2 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80130f6:	d80e0030 	ld.b      	r0, (r14, 0x30)
 80130fa:	e920fec0 	bnez      	r0, 0x8012e7a	// 8012e7a <_vsnprintf+0x602>
 80130fe:	6d2f      	mov      	r4, r11
 8013100:	06d8      	br      	0x8012eb0	// 8012eb0 <_vsnprintf+0x638>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013102:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013106:	e920ff3a 	bnez      	r0, 0x8012f7a	// 8012f7a <_vsnprintf+0x702>
 801310a:	c40b4830 	lsli      	r16, r11, 0
 801310e:	0750      	br      	0x8012fae	// 8012fae <_vsnprintf+0x736>
        unsigned int l = __mac2str((unsigned char *)p, store);
 8013110:	3311      	movi      	r3, 17
 8013112:	b868      	st.w      	r3, (r14, 0x20)
 8013114:	0712      	br      	0x8012f38	// 8012f38 <_vsnprintf+0x6c0>
          while (l++ < width) {
 8013116:	c410482b 	lsli      	r11, r16, 0
        format++;
 801311a:	2500      	addi      	r5, 1
        char *ipv6 = va_arg(va, char*);
 801311c:	9889      	ld.w      	r4, (r14, 0x24)
 801311e:	e800fbbc 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
        while ((*pstr != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 8013122:	d80e0030 	ld.b      	r0, (r14, 0x30)
 8013126:	e920fce7 	bnez      	r0, 0x8012af4	// 8012af4 <_vsnprintf+0x27c>
 801312a:	6d2f      	mov      	r4, r11
 801312c:	e800fcff 	br      	0x8012b2a	// 8012b2a <_vsnprintf+0x2b2>
          base =  8U;
 8013130:	3208      	movi      	r2, 8
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 8013132:	c4412823 	bclri      	r3, r1, 2
 8013136:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 8013138:	e4212400 	andi      	r1, r1, 1024
 801313c:	e901fdda 	bez      	r1, 0x8012cf0	// 8012cf0 <_vsnprintf+0x478>
 8013140:	e800fdd7 	br      	0x8012cee	// 8012cee <_vsnprintf+0x476>
        if ((*format != 'i') && (*format != 'd')) {
 8013144:	eb400064 	cmpnei      	r0, 100
          flags &= ~FLAGS_HASH;   // no hash for dec format
 8013148:	6c4f      	mov      	r1, r3
          base = 10U;
 801314a:	320a      	movi      	r2, 10
        if ((*format != 'i') && (*format != 'd')) {
 801314c:	0bf3      	bt      	0x8013132	// 8013132 <_vsnprintf+0x8ba>
        if (flags & FLAGS_PRECISION) {
 801314e:	e4232400 	andi      	r1, r3, 1024
 8013152:	e921fdce 	bnez      	r1, 0x8012cee	// 8012cee <_vsnprintf+0x476>
          if (flags & FLAGS_LONG_LONG) {
 8013156:	e4232200 	andi      	r1, r3, 512
 801315a:	e9210066 	bnez      	r1, 0x8013226	// 8013226 <_vsnprintf+0x9ae>
          else if (flags & FLAGS_LONG) {
 801315e:	e4032100 	andi      	r0, r3, 256
 8013162:	e9200099 	bnez      	r0, 0x8013294	// 8013294 <_vsnprintf+0xa1c>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 8013166:	e4232040 	andi      	r1, r3, 64
 801316a:	e92100a8 	bnez      	r1, 0x80132ba	// 80132ba <_vsnprintf+0xa42>
 801316e:	e4232080 	andi      	r1, r3, 128
 8013172:	e921008c 	bnez      	r1, 0x801328a	// 801328a <_vsnprintf+0xa12>
 8013176:	9420      	ld.w      	r1, (r4, 0x0)
 8013178:	491f      	lsri      	r0, r1, 31
 801317a:	2403      	addi      	r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801317c:	b865      	st.w      	r3, (r14, 0x14)
 801317e:	de2e2004 	st.w      	r17, (r14, 0x10)
 8013182:	dd4e2003 	st.w      	r10, (r14, 0xc)
 8013186:	b842      	st.w      	r2, (r14, 0x8)
 8013188:	b801      	st.w      	r0, (r14, 0x4)
 801318a:	c4010201 	abs      	r1, r1
 801318e:	e800fdd3 	br      	0x8012d34	// 8012d34 <_vsnprintf+0x4bc>
 8013192:	988b      	ld.w      	r4, (r14, 0x2c)
 8013194:	6ecb      	mov      	r11, r2
 8013196:	e800fd3b 	br      	0x8012c0c	// 8012c0c <_vsnprintf+0x394>
 801319a:	6d0b      	mov      	r4, r2
 801319c:	0687      	br      	0x8012eaa	// 8012eaa <_vsnprintf+0x632>
 801319e:	6d0b      	mov      	r4, r2
 80131a0:	e800fcc2 	br      	0x8012b24	// 8012b24 <_vsnprintf+0x2ac>
 80131a4:	c4024830 	lsli      	r16, r2, 0
 80131a8:	0700      	br      	0x8012fa8	// 8012fa8 <_vsnprintf+0x730>
          base = 16U;
 80131aa:	3210      	movi      	r2, 16
 80131ac:	07c3      	br      	0x8013132	// 8013132 <_vsnprintf+0x8ba>
 80131ae:	c4412823 	bclri      	r3, r1, 2
 80131b2:	3b83      	bclri      	r3, 3
        if (flags & FLAGS_PRECISION) {
 80131b4:	e4212400 	andi      	r1, r1, 1024
          flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
 80131b8:	ec630020 	ori      	r3, r3, 32
          base = 16U;
 80131bc:	3210      	movi      	r2, 16
        if (flags & FLAGS_PRECISION) {
 80131be:	e921fd98 	bnez      	r1, 0x8012cee	// 8012cee <_vsnprintf+0x476>
 80131c2:	e800fd9f 	br      	0x8012d00	// 8012d00 <_vsnprintf+0x488>
        if (*format == 'F') flags |= FLAGS_UPPERCASE;
 80131c6:	ec210020 	ori      	r1, r1, 32
 80131ca:	e800fdc4 	br      	0x8012d52	// 8012d52 <_vsnprintf+0x4da>
        precision = prec > 0 ? (unsigned int)prec : 0U;
 80131ce:	d9a42000 	ld.w      	r13, (r4, 0x0)
 80131d2:	3300      	movi      	r3, 0
 80131d4:	8502      	ld.b      	r0, (r5, 0x2)
 80131d6:	f86dccaa 	max.s32      	r10, r13, r3
        const int prec = (int)va_arg(va, int);
 80131da:	2403      	addi      	r4, 4
        format++;
 80131dc:	2501      	addi      	r5, 2
 80131de:	e800fb97 	br      	0x801290c	// 801290c <_vsnprintf+0x94>
        width = (unsigned int)-w;
 80131e2:	ea0c0000 	movi      	r12, 0
        flags |= FLAGS_LEFT;    // reverse padding
 80131e6:	ec210002 	ori      	r1, r1, 2
        width = (unsigned int)-w;
 80131ea:	c40c0091 	subu      	r17, r12, r0
 80131ee:	074f      	br      	0x801308c	// 801308c <_vsnprintf+0x814>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
 80131f0:	b867      	st.w      	r3, (r14, 0x1c)
 80131f2:	3300      	movi      	r3, 0
 80131f4:	de2e2006 	st.w      	r17, (r14, 0x18)
 80131f8:	dd4e2005 	st.w      	r10, (r14, 0x14)
 80131fc:	b843      	st.w      	r2, (r14, 0xc)
 80131fe:	b864      	st.w      	r3, (r14, 0x10)
 8013200:	b862      	st.w      	r3, (r14, 0x8)
 8013202:	e6040007 	addi      	r16, r4, 8
 8013206:	9460      	ld.w      	r3, (r4, 0x0)
 8013208:	9481      	ld.w      	r4, (r4, 0x4)
 801320a:	b860      	st.w      	r3, (r14, 0x0)
 801320c:	b881      	st.w      	r4, (r14, 0x4)
 801320e:	6caf      	mov      	r2, r11
 8013210:	6cdf      	mov      	r3, r7
 8013212:	6c63      	mov      	r1, r8
 8013214:	6c1b      	mov      	r0, r6
 8013216:	e3fff633 	bsr      	0x8011e7c	// 8011e7c <_ntoa_long_long>
 801321a:	6ec3      	mov      	r11, r0
 801321c:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013220:	2500      	addi      	r5, 1
 8013222:	e800fb3a 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
            const long long value = va_arg(va, long long);
 8013226:	9421      	ld.w      	r1, (r4, 0x4)
 8013228:	9400      	ld.w      	r0, (r4, 0x0)
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801322a:	b867      	st.w      	r3, (r14, 0x1c)
 801322c:	3300      	movi      	r3, 0
 801322e:	b864      	st.w      	r3, (r14, 0x10)
 8013230:	497f      	lsri      	r3, r1, 31
 8013232:	b843      	st.w      	r2, (r14, 0xc)
 8013234:	b862      	st.w      	r3, (r14, 0x8)
            const long long value = va_arg(va, long long);
 8013236:	e6040007 	addi      	r16, r4, 8
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 801323a:	de2e2006 	st.w      	r17, (r14, 0x18)
 801323e:	dd4e2005 	st.w      	r10, (r14, 0x14)
 8013242:	6c83      	mov      	r2, r0
 8013244:	6cc7      	mov      	r3, r1
 8013246:	e9810053 	blz      	r1, 0x80132ec	// 80132ec <_vsnprintf+0xa74>
 801324a:	b840      	st.w      	r2, (r14, 0x0)
 801324c:	b861      	st.w      	r3, (r14, 0x4)
 801324e:	07e0      	br      	0x801320e	// 801320e <_vsnprintf+0x996>
            idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
 8013250:	b865      	st.w      	r3, (r14, 0x14)
 8013252:	de2e2004 	st.w      	r17, (r14, 0x10)
 8013256:	dd4e2003 	st.w      	r10, (r14, 0xc)
 801325a:	b842      	st.w      	r2, (r14, 0x8)
 801325c:	b821      	st.w      	r1, (r14, 0x4)
 801325e:	9460      	ld.w      	r3, (r4, 0x0)
 8013260:	e6040003 	addi      	r16, r4, 4
 8013264:	b860      	st.w      	r3, (r14, 0x0)
 8013266:	6caf      	mov      	r2, r11
 8013268:	6cdf      	mov      	r3, r7
 801326a:	6c63      	mov      	r1, r8
 801326c:	6c1b      	mov      	r0, r6
 801326e:	e3fff5a7 	bsr      	0x8011dbc	// 8011dbc <_ntoa_long>
 8013272:	6ec3      	mov      	r11, r0
 8013274:	c4104824 	lsli      	r4, r16, 0
        format++;
 8013278:	2500      	addi      	r5, 1
 801327a:	e800fb0e 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
          base =  2U;
 801327e:	3202      	movi      	r2, 2
 8013280:	0759      	br      	0x8013132	// 8013132 <_vsnprintf+0x8ba>
 8013282:	8c20      	ld.h      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 8013284:	2403      	addi      	r4, 4
 8013286:	e800fd4f 	br      	0x8012d24	// 8012d24 <_vsnprintf+0x4ac>
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 801328a:	d8245000 	ld.hs      	r1, (r4, 0x0)
 801328e:	491f      	lsri      	r0, r1, 31
 8013290:	2403      	addi      	r4, 4
 8013292:	0775      	br      	0x801317c	// 801317c <_vsnprintf+0x904>
            const long value = va_arg(va, long);
 8013294:	9420      	ld.w      	r1, (r4, 0x0)
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 8013296:	b865      	st.w      	r3, (r14, 0x14)
 8013298:	497f      	lsri      	r3, r1, 31
 801329a:	c4010201 	abs      	r1, r1
            const long value = va_arg(va, long);
 801329e:	e6040003 	addi      	r16, r4, 4
            idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80132a2:	de2e2004 	st.w      	r17, (r14, 0x10)
 80132a6:	dd4e2003 	st.w      	r10, (r14, 0xc)
 80132aa:	b842      	st.w      	r2, (r14, 0x8)
 80132ac:	b861      	st.w      	r3, (r14, 0x4)
 80132ae:	b820      	st.w      	r1, (r14, 0x0)
 80132b0:	07db      	br      	0x8013266	// 8013266 <_vsnprintf+0x9ee>
 80132b2:	8420      	ld.b      	r1, (r4, 0x0)
            const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
 80132b4:	2403      	addi      	r4, 4
 80132b6:	e800fd37 	br      	0x8012d24	// 8012d24 <_vsnprintf+0x4ac>
 80132ba:	8420      	ld.b      	r1, (r4, 0x0)
            const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
 80132bc:	2403      	addi      	r4, 4
 80132be:	075f      	br      	0x801317c	// 801317c <_vsnprintf+0x904>
          while (l++ < width) {
 80132c0:	b868      	st.w      	r3, (r14, 0x20)
 80132c2:	e800fdd8 	br      	0x8012e72	// 8012e72 <_vsnprintf+0x5fa>
          while (l++ < width) {
 80132c6:	b868      	st.w      	r3, (r14, 0x20)
 80132c8:	e800fc12 	br      	0x8012aec	// 8012aec <_vsnprintf+0x274>
        out((char)va_arg(va, int), buffer, idx++, maxlen);
 80132cc:	c4104824 	lsli      	r4, r16, 0
 80132d0:	6eeb      	mov      	r11, r10
        format++;
 80132d2:	2500      	addi      	r5, 1
 80132d4:	e800fae1 	br      	0x8012896	// 8012896 <_vsnprintf+0x1e>
          while (l++ < width) {
 80132d8:	6eaf      	mov      	r10, r11
 80132da:	e800fce1 	br      	0x8012c9c	// 8012c9c <_vsnprintf+0x424>
          while (l++ < width) {
 80132de:	b868      	st.w      	r3, (r14, 0x20)
 80132e0:	0649      	br      	0x8012f72	// 8012f72 <_vsnprintf+0x6fa>
          while (l++ < width) {
 80132e2:	6d0f      	mov      	r4, r3
 80132e4:	c40b4832 	lsli      	r18, r11, 0
 80132e8:	e800fc76 	br      	0x8012bd4	// 8012bd4 <_vsnprintf+0x35c>
            idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
 80132ec:	3000      	movi      	r0, 0
 80132ee:	3100      	movi      	r1, 0
 80132f0:	f840c462 	sub.64      	r2, r0, r2
 80132f4:	07ab      	br      	0x801324a	// 801324a <_vsnprintf+0x9d2>
        while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
 80132f6:	c412482b 	lsli      	r11, r18, 0
 80132fa:	e800fc9c 	br      	0x8012c32	// 8012c32 <_vsnprintf+0x3ba>
	...

08013300 <fputc>:
    while((READ_REG(UART0->FIFOS) & 0x3F) >= 32);
 8013300:	1046      	lrw      	r2, 0x40010600	// 8013318 <fputc+0x18>
 8013302:	9267      	ld.w      	r3, (r2, 0x1c)
 8013304:	e463203f 	andi      	r3, r3, 63
 8013308:	3b1f      	cmphsi      	r3, 32
 801330a:	0bfc      	bt      	0x8013302	// 8013302 <fputc+0x2>
    WRITE_REG(UART0->TDW, (char)ch);
 801330c:	e40020ff 	andi      	r0, r0, 255
 8013310:	b208      	st.w      	r0, (r2, 0x20)
}
 8013312:	3000      	movi      	r0, 0
 8013314:	783c      	jmp      	r15
 8013316:	0000      	.short	0x0000
 8013318:	40010600 	.long	0x40010600

0801331c <wm_printf>:
  return _vsnprintf(_out_buffer, buffer, count, format, va);
}


int wm_printf(const char *fmt,...)
{
 801331c:	1424      	subi      	r14, r14, 16
 801331e:	b863      	st.w      	r3, (r14, 0xc)
 8013320:	b842      	st.w      	r2, (r14, 0x8)
 8013322:	b821      	st.w      	r1, (r14, 0x4)
 8013324:	b800      	st.w      	r0, (r14, 0x0)
 8013326:	14d0      	push      	r15
 8013328:	1421      	subi      	r14, r14, 4
 801332a:	9862      	ld.w      	r3, (r14, 0x8)
 801332c:	6c8f      	mov      	r2, r3
    va_list args;
    size_t length;

	va_start(args, fmt);
	length = _vsnprintf(_out_uart, (char*)fmt, (size_t) - 1, fmt, args);
 801332e:	1b03      	addi      	r3, r14, 12
 8013330:	b860      	st.w      	r3, (r14, 0x0)
 8013332:	6ccb      	mov      	r3, r2
 8013334:	3200      	movi      	r2, 0
 8013336:	2a00      	subi      	r2, 1
 8013338:	6c4f      	mov      	r1, r3
 801333a:	1005      	lrw      	r0, 0x8011b20	// 801334c <wm_printf+0x30>
 801333c:	e3fffa9e 	bsr      	0x8012878	// 8012878 <_vsnprintf>
	va_end(args);

	return length;
}
 8013340:	1401      	addi      	r14, r14, 4
 8013342:	d9ee2000 	ld.w      	r15, (r14, 0x0)
 8013346:	1405      	addi      	r14, r14, 20
 8013348:	783c      	jmp      	r15
 801334a:	0000      	.short	0x0000
 801334c:	08011b20 	.long	0x08011b20
