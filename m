Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2DD80F12A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 16:36:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77E2CC6C85B;
	Tue, 12 Dec 2023 15:36:02 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C843C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 15:36:00 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-425e63955f6so2935741cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1702395360; x=1703000160;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXcJtFX60tA1qLiGEO8wBGyAsaG5MN46AN6euEyJwkw=;
 b=ng8vZiK39uFUHcNX6mdCu1Lvznx8qtL040HdE5nBKgwT3VdYS4d7EwHhnEWNl9TqlK
 Ca5ulQnLh1vdxhGUNczha9BVKSPqlOLVHc1X6HgpT58urg5OlYYY08sEtng3IKoxjXKw
 +AMfF1ZWBxdlg4nfVWnhj7RwTcQW3lKz9XUcBSaXkt5YFy93jg607mgwIb1zqdj/Qrs6
 sSeRBv9uE6Y6ZKDlGWUGmeQ0w4mcyvewFABSlYNNGDHWVUYa6/heMRTBlMyPzOPk7gu4
 GwIlSSxwfZwh/gfOIrLOQ4xsq3VSwYWXGcxWEBgNQPW0wD8RwOkqiu4h3JcJNEf+qaMX
 9lLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702395360; x=1703000160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXcJtFX60tA1qLiGEO8wBGyAsaG5MN46AN6euEyJwkw=;
 b=wVHaIqr3tdZkwuSKiNc/r5Yxr7ofSFkJ+xkQIy9LJG0YywlhYzcMFnsxfHA4CREFYp
 jhDYe9uq0e67fuqhotf9W+jnKibmrOH4WkQQFRKOJNt6bW8UA9jke7BXUmm3Jhkwsx65
 hLkIKeWdSiv7dh6PU83+FDoBoYZ97DdePw9FUFVeJ4fhDoD8SRGoRI5wj+5iyYIMZ9Or
 lXlDwLZqEYXgh+WkXgI4L3e81kR6hGGMjROW89US09mh2aduiTJWvcipQHnh+cG4YgrW
 3sFQGFDKSZuRFLssc+MNDTTcizWnzt/klbWAyfUWWYjqTxbmlOR1SqeLvLQMfMxyipgd
 dsxg==
X-Gm-Message-State: AOJu0Yx5NJjP/thCLOmM7ZhGWenpge++IAMeRmCvNnn29BwqvW8CYLhh
 dAZ65vsPdANHz9ITjHdnFeno3g==
X-Google-Smtp-Source: AGHT+IF+nhZFWFH1wPSdf7q8AFiMdrHCNgr9nWw0nKTFrSUNiS6YQ/1wS9TNqOAKUPbNLmAIHWUCaw==
X-Received: by 2002:ac8:5948:0:b0:421:c6ef:4b0b with SMTP id
 8-20020ac85948000000b00421c6ef4b0bmr8033608qtz.17.1702395359848; 
 Tue, 12 Dec 2023 07:35:59 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 kq12-20020ac8618c000000b00423b5cf305bsm4130866qtb.65.2023.12.12.07.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 07:35:59 -0800 (PST)
Date: Tue, 12 Dec 2023 10:35:08 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <ZXh9rIyy6mu9zFry@dell-precision-5540>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
 <87ttosqvbq.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ttosqvbq.ffs@tglx>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level
	interrupts
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Thank you for taking the time to look through the STM32 manual and
review the driver. Unfortunately, I don't have enough experience with
the Linux IRQ subsystem to give you a correspondingly in depth response,
but I will attempt to address the parts that relate to the bug in
question.

On Fri, Dec 08, 2023 at 09:43:21PM +0100, Thomas Gleixner wrote:
> Ben!
> 
> On Mon, Dec 04 2023 at 15:33, Ben Wolsieffer wrote:
> > The STM32 doesn't support GPIO level interrupts in hardware, so the
> > driver tries to emulate them using edge interrupts, by retriggering the
> > interrupt if necessary based on the pin state after the handler
> > finishes.
> >
> > Currently, this functionality does not work because the irqchip uses
> > handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
> > callbacks after handling the interrupt. This patch fixes this by using
> > handle_level_irq() for level interrupts, which causes irq_unmask() to be
> > called to retrigger the interrupt.
> 
> This does not make any sense at all. irq_unmask() does not retrigger
> anything. It sets the corresponding bit in the mask register, not more
> not less.

I don't think this is correct. I was referring to
stm32_gpio_irq_unmask(), which calls stm32_gpio_irq_trigger(), which in
turn (for level interrupts) checks the GPIO pin state and retriggers the
interrupt if necessary.

> 
> Switching to handle_level_irq() makes the following difference
> vs. handle_edge_irq() when an interrupt is handled (ignoring the inner
> loop):
> 
>       + irq_mask();
>         irq_ack();
>         ....
>         handle();
>         ....
>       + irq_unmask();

Yes, the additional call to irq_unmask() is the key difference here, as
that callback performs the retriggering for level interrupts.

> 
> So in both cases irq_ack() clears the interrupt in the Pending register,
> right?
> 
> Now comes the interesting difference.
> 
> When the interrupt is raised again after irq_ack() while the handler is
> running, i.e. a full toggle from active to inactive and back to active
> where the back to active transition causes the edge detector to trigger,
> then:

I don't see how this is relevant. The bug occurs with level interrupts
in the case where there are no new transitions while the handler is
running. For example, with a high level interrupt, if the pin is still
high after the handler finishes, the interrupt should be immediately
triggered again.

> 
>   1) in case of handle_edge_irq() this should immediately set it in the
>      pending register again and raise another CPU interrupt, which
>      should be handled once the interrupt service routine returned.
> 
>   2) in case of handle_level_irq() this does not set it in the pending
>      register because it's masked. The unmask will set the pending
>      register bit _if_ and only _if_ the edge detector has latched the
>      detection. No idea whether that's the case. The manual is
>      exceptionally blury about this.
> 
> So in theory both #1 and #2 should work. But the explanation in the
> changelog is fairy tale material.
> 
> As I couldn't figure out why #1 would not work, I looked at the driver
> in more detail and also at the STM32 manual. That tells me that the
> irqchip driver is at least suboptimal. Why?
> 
> The EXTI controller is just an intermediate between the peripheral
> (including GPIO pins) and the NVIC:
> 
>          |--------------|
>          | Edge config  |   |-----------------|
>  Source -|              |---| Int. Mask logic |---> Dedicated NVIC interrupt
>          | Edge detect  | | |-----------------|
>          |--------------| |
>                           | |-----------------|   
>                           |-| Evt. Mask logic |---> CPU event input
>                           | |-----------------|   
>                           |
>                           | |-----------------|   
>                           |-| Wakeup logic    |--->....
>                             |-----------------|   
> 
> So there are two classes of sources conntect to EXTI:
> 
>    1) Direct events
> 
>       - Have a fixed edge
>       - Can be masked for Interrupt and Event generation
>       - No software trigger
>       - Not tracked in the Pending register
>       - Can evtl. wakeup the CPUs or from D3
> 
>    2) Configurable events
> 
>       - Have a configurable edge
>       - Can be masked for Interrupt and Event generation
>       - Software trigger
>       - Tracked in the Pending register
>       - Can evtl. wakeup the CPUs or from D3
> 
> The CPU event is a single input to the CPU which can be triggered by any
> source which has the Event mask enabled.
> 
> For both classes there are sources which have no connection to the NVIC,
> they can only be used to generate CPU events or trigger the wakeup
> logic.
> 
> For direct events there is a category where the peripherial interrupt is
> routed to both the EXTI and the NVIC directly. The EXTI does not provide
> a connection to the NVIC and the event cannot be masked in EXTI to
> prevent CPU interrupts. Only the CPU event masking works.
> 
> GPIO pins are configurable events which are connected to the NVIC via
> the EXTI.
> 
> But the EXTI driver implements a chained interrupt handler which listens
> on a ton of NVIC interrupts. I.e. for the STM32H7 on:
> 
>   <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <62>, <76>
> 
> NVIC   1: PVD_PVM           EXTI-SRC 16
> NVIC   2: RTC_TAMP_STAMP    EXTI-SRC 18
> NVIC   3: RTC_WAKEUP        EXTI-SRC 19
> NVIC   6: EXTI0             EXTI-SRC  0
> NVIC   7: EXTI1             EXTI-SRC  1
> NVIC   8: EXTI2             EXTI-SRC  2
> NVIC   9: EXTI3             EXTI-SRC  3
> NVIC  10: EXTI4             EXTI-SRC  4
> NVIC  23: EXTI5-9           EXTI-SRC  5-9
> NVIC  40: EXTI10-15         EXTI-SRC 10-15
> NVIC  41: RTC_ALARM         EXTI-SRC 17
> NVIC  62: ETH_WKUP          EXTI-SRC 86
> NVIC  76: OTG_HS_WKUP       EXTI-SRC 43
> 
> Each of these chained interrupts handles the full EXTI interrupt domain
> with all three banks. This does not make any sense at all especially not
> on a SMP machine.
> 
> Though it _should_ work, but it might cause interrupts handlers to be
> invoked when nothing is pending when the edge handler is active. Which
> in turn can confuse the underlying device driver depending on the
> quality...
> 
> CPU0					CPU1
> 
> NVIC int X                      	NVIC int Y
> 
>  // read_pending() is serialized by a lock, but both read the same state
>  pend = read_pending()			pend = read_pending()
>  
>  for_each_bit(bit, pend)	 	for_each_bit(bit, pend)	
>     handle_irq(domain, base + bit)         handle_irq(domain, base + bit)
>       lock(desc);                            lock(desc);
>       ack();
>       do {
>          clear(PENDING);
>          set(IN_PROGRESS);
>          unlock(desc);
>          handle();                           if (IN_PROGRESS) {
>          lock(desc);                           ack();
>                                                set(PENDING);
>          				       unlock(desc);
>          clear(IN_PROGRESS);                   return;
>                                              }
>       } while (PENDING); <- Will loop
> 
> See?

Currently, this driver is only used on single core machines, and the
more complex devices use exti_h, so this shouldn't be a problem in
practice.

> 
> In fact the only NVIC interrupts which actually need demultiplexing are
> NVIC #23 and NVIC #40 and those should only care about the EXTI
> interrupts which are actually multiplexed on them. This let's randomly
> run whatever is pending on any demux handler is far from correct.
> 
> All others are direct NVIC interrupts which just have the extra EXTI
> interrupt masking, event masking and the wakeup magic. The indirection
> via the chained handler is just pointless overhead and not necessarily
> correct.
> 
> The exti_h variant of that driver does the right thing and installs a
> hierarchical interrupt domain which acts as man in the middle between
> the source and the NVIC. Though granted they don't have the odd problem
> of multiplexing several GPIO interrupts to a single NVIC interrupt.
> 
> But in fact the regular exti driver could do the same and just handle
> the two NVIC interrupts which need demultiplexing separately and let
> everything else go through the hierarchy without bells and whistles.

This sounds reasonable to me. It did seem strange to me that the exti
and exti_h drivers used such different approaches, although I wasn't
aware of the reasons behind them. I think this refactoring is out of
scope of this bug fix though.

> 
> Thanks,
> 
>         tglx

Thanks, Ben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
