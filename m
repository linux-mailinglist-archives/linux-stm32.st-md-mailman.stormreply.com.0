Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E93032B810
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 14:36:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF44C57B64;
	Wed,  3 Mar 2021 13:36:03 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F667C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 13:36:00 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id p10so9220672ils.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mV7nRo9kv0WrCbk6EB35RPWl6ztHgF0++Sk3e0IPNlQ=;
 b=S3WIXSMd0vYgP8x2TKmJaUpzTZXqu0MLdDnHWr4/YHOuEXK3Zuvqu5I0GowTo4oqcq
 rkKfMWGUPEOHqWa8tyzdksOwPjTSV5YEtQ/fii3MkU4fUV6YkTgIerwnnJqz7eax0s7F
 Tqv8VVMWseQIV/s5lhS0fwd4JqLvs2QB//j+KM83pQZcTnA7fgs09a0xVRmx4qkWoZps
 qckI6WkMBI9xnO4I8gIeWBl5mU4DB859imOARDnAPRKbCc/152L6EDGxoEvf0vBnPy3F
 c7/W4VmachPy3DONPG5gY02GYMvSzkeoYafOceGRjUOoOIZwA2vC7j6BNwlwhZUYx5z+
 v8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mV7nRo9kv0WrCbk6EB35RPWl6ztHgF0++Sk3e0IPNlQ=;
 b=DjVovP2C0npxKSf8e2AlkGBuzvvrCNiwZ+yrL6lXJKbqXl843O2JzSJs+n1Yl6QdIG
 7DJR8OHs+wKB8b9T/3DPCWRnmZraYQ7wC7LPNdvGnWN1bf4v6qCvRlIKf3CjZ2KuiVhX
 DmWwfovVMIQCLK4TWRd7gF7pBNpdAf5F2nYPtvPpIHYjR2RXa+uqPGEgRql7a8O5a+9p
 rrkVTnyIJOTapOSujtddphGMmxe+qgbmFP7eHRHPgLxjAFIIPoLFzjudxKZt8NwBDOdo
 GtE/LcvlrgBL1Wcpu2NaEusfd+rBOXq3X8CuefY/4/cV9INrRGfzQWPU0l9HKZvk42UF
 nZDw==
X-Gm-Message-State: AOAM532TjJdT+k5K0YD7mcRlW711xUQ41HdeMkP58l7s4VsXN65j+Qdk
 MHqmQBmTQioFxKHsm+FNgS29LIAj5kfr8MVmclU=
X-Google-Smtp-Source: ABdhPJyTyl/1Qw3XzoM1h1OdLOMXAzxSz+3zavg+xqvdVIZzQseXECYY8QdrHxUKbCcOkNZMBUjpd5cndWv+4sfjTn8=
X-Received: by 2002:a05:6e02:194e:: with SMTP id
 x14mr22584922ilu.218.1614778559248; 
 Wed, 03 Mar 2021 05:35:59 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
 <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
In-Reply-To: <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 3 Mar 2021 21:35:23 +0800
Message-ID: <CAL9mu0KUhctbBzmem1ZSgEwf5CebivHOSUr9Q7VTyzib8pW=Cw@mail.gmail.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] ARM: ARMv7-M: Fix register restore
	corrupt after svc call
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

Hi Vladimir,

Thanks for the review.

On Wed, Mar 3, 2021 at 5:52 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>
> On 3/3/21 8:05 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > For some case, kernel not boot by u-boot(single thread),
> > but by rtos , as most rtos use pendsv to do context switch.
>
>
> Hmm, does it mean that it starts kernel from process context?
   Yes, kernel might be started from process context, since u-boot not
switch context, so kernel always startup under msp.
>
> I'd assume that it is not only kernel who expects MSP. So, what
> if RTOS you mentioned want to boot other RTOS (even itself)? What
> if you have no access to the source code for those RTOS(es) to
> patch MSP/PSP switch?

My case is a little complicated.
stm32h7 only have 128Kbytes internal flash, can't store u-boot.bin (>200K),
so, set a bootloader (rt-thread rtos) to internal flash, load
linux/u-boot from serial port via ymodem
store to qspi flash(8Mbytes), then jump to u-boot.

qspi flash layout:
0 - 512K:    u-boot
512K- 8M : kernel(xip)

load process : rt-thread -> u-boot -> linux

before add psp/msp check after svc call, register restore corrupt.
add a printhex8 around svc call, found the sp stack is 0x24040000c0ffcff8
it should be 0xc0ffcdf8c0ffcff8. 0x24040000 is the sp stack address
assigned by u-boot
i've no idea how it's become to u-boot's sp.

I have the rtos code, and will try to fix it on the rtos side.

Can you give more explanation about why linux relies on MSP ? thanks

>
> I'd very much prefer to keep stack switching logic outside kernel,
> say, in some shim which RTOS/bootloader can maintain.
>
> Cheers
> Vladimir
>
> >
> > So, we need add an lr check after svc call, to find out should
> > use psp or msp. else register restore after svc call might be
> > corrupted.
> >
> > Fixes: b70cd406d7fe ("ARM: 8671/1: V7M: Preserve registers across switch from Thread to Handler mode")
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  arch/arm/mm/proc-v7m.S | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
> > index 84459c1d31b8..c93d2757312d 100644
> > --- a/arch/arm/mm/proc-v7m.S
> > +++ b/arch/arm/mm/proc-v7m.S
> > @@ -137,7 +137,10 @@ __v7m_setup_cont:
> >  1:   cpsid   i
> >       /* Calculate exc_ret */
> >       orr     r10, lr, #EXC_RET_THREADMODE_PROCESSSTACK
> > -     ldmia   sp, {r0-r3, r12}
> > +     tst     lr, #EXC_RET_STACK_MASK
> > +     mrsne   r4, psp
> > +     moveq   r4, sp
> > +     ldmia   r4!, {r0-r3, r12}
> >       str     r5, [r12, #11 * 4]      @ restore the original SVC vector entry
> >       mov     lr, r6                  @ restore LR
> >
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
