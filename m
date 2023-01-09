Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FDD6622AB
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 11:13:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 094F5C65E55;
	Mon,  9 Jan 2023 10:13:19 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95BBBC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 10:13:17 +0000 (UTC)
Date: Mon, 9 Jan 2023 11:13:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1673259197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFnYGz3uQ0ZPdkPZZNuXygm5ApMSSYWsgWYIkJd8NV8=;
 b=ceZrPFWU0BKTEN6iDyiA4MEYP4eYct7mjuR6n90DIua8FM3wgxVMaKSPhj2+aS/P0pV7X+
 0C0qDGz8wGCS8NYu35iQxlDAU9GwrmtagxVOFKjUQNYd5qyfR2lmizjx3hR5dqkvDPWXne
 TGGXdFhE560wYuDmLNmogcnSWp0CDuHSsoWh6Y07gtmw8CKFBUEUdZ/gJf7LByHxCeqCq8
 W8KXoF4hDvmVeUW3NfYE0kUOfxx36iX3JyATF50wE+C7r680ZaJUNCpc9GeNZccFW7OnHG
 zt9fBA/snsuBOwmRiXWY5PVpfUy/LXKYAPGzKuu5qoV9Kyjl9o6qB9RNO46X1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1673259197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFnYGz3uQ0ZPdkPZZNuXygm5ApMSSYWsgWYIkJd8NV8=;
 b=flPEUkggKxOeUluO3V4bQQVDLUaQy8YQatp726WllHL4rmlWtB1n9mhc45txPwJ2fnljod
 wxhFrpOyHU34TiDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Johan Hovold <johan@kernel.org>
Message-ID: <Y7vou3wAeLP4X+TY@linutronix.de>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On 2022-12-27 15:56:47 [+0100], Johan Hovold wrote:
> On Fri, Dec 16, 2022 at 12:53:38PM +0100, Marek Vasut wrote:
> > Requesting an interrupt with IRQF_ONESHOT will run the primary handler
> > in the hard-IRQ context even in the force-threaded mode. The
> > force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
> > sleeping locks (spinlock_t) in hard-IRQ context. This combination
> > makes it impossible and leads to "sleeping while atomic" warnings.
> > 
> > Use one interrupt handler for both handlers (primary and secondary)
> > and drop the IRQF_ONESHOT flag which is not needed.
> > 
> > Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")
> 
> I don't think a Fixes tag is warranted as this is only needed due to
> this undocumented quirk of PREEMPT_RT.

It is not an undocumented quirk of PREEMPT_RT. The part that might not
be well documented is that IRQF_ONESHOT won't run the primary handler as
a threaded handler. This is also the case for IRQF_NO_THREAD and
IRQF_PERCPU but might be more obvious.
Anyway, if the primary handler is not threaded then it runs in HARDIRQ
context and here you must not use a spinlock_t. This is documented in
Documentation/locking/locktypes.rst and there is also a LOCKDEP warning
for this on !RT which is off by default because it triggers with printk
(and this is worked on).

> And this should not be backported in any case.

Such things have been backported via -stable in the past. If you
disagree, please keep me in loop while is merged so I can poke people to
backport it as part of the RT patch for the relevant kernels.

> Johan

Sebastian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
