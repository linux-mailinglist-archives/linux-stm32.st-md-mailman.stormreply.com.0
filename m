Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AB6672F7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 14:13:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9C7C64106;
	Thu, 12 Jan 2023 13:13:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99A4CC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 13:13:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6052760AB9;
 Thu, 12 Jan 2023 13:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4369C433EF;
 Thu, 12 Jan 2023 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673529185;
 bh=71WCD2LYTHvB/FQ8+vaLVwWxU8IB40Qvo5Km4Lbz8Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RqxufPvOzIAyPAnyGVSCFxgrAu7uNssmK+q7P829ela4qcXC26u08NKHCi5sUk376
 cP1evOZfOInZku9T5QpMqwczl1hjlQoc0EJhbBUFdpzFn0GqW2n22a3wXiQ1NdYd90
 Bhf7ef8TW3NfA/tMHH0vGcekWbD3GidLKF9USZ2tyDPKRSS2gmS5/MvbH+9yKtiCsm
 qQWCQ5hjZq6juAcP5FZjLndLsDgWsXMHRYa8y97d+ScJOd3v/Es9dyk9qtQUxOdcUX
 lKZG9ScSWtu0xuOZHDzxRLXTcONyBrQt1dbrXghuGzaIDhDzaf+WuG1J5kHOQuv/Us
 97OREQoWnPhng==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pFxOK-0001PG-31; Thu, 12 Jan 2023 14:13:12 +0100
Date: Thu, 12 Jan 2023 14:13:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <Y8AHaJIttNga68q4@hovoldconsulting.com>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com>
 <Y7vou3wAeLP4X+TY@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y7vou3wAeLP4X+TY@linutronix.de>
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

On Mon, Jan 09, 2023 at 11:13:15AM +0100, Sebastian Andrzej Siewior wrote:
> On 2022-12-27 15:56:47 [+0100], Johan Hovold wrote:
> > On Fri, Dec 16, 2022 at 12:53:38PM +0100, Marek Vasut wrote:
> > > Requesting an interrupt with IRQF_ONESHOT will run the primary handler
> > > in the hard-IRQ context even in the force-threaded mode. The
> > > force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
> > > sleeping locks (spinlock_t) in hard-IRQ context. This combination
> > > makes it impossible and leads to "sleeping while atomic" warnings.
> > > 
> > > Use one interrupt handler for both handlers (primary and secondary)
> > > and drop the IRQF_ONESHOT flag which is not needed.
> > > 
> > > Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")
> > 
> > I don't think a Fixes tag is warranted as this is only needed due to
> > this undocumented quirk of PREEMPT_RT.
> 
> It is not an undocumented quirk of PREEMPT_RT. The part that might not
> be well documented is that IRQF_ONESHOT won't run the primary handler as
> a threaded handler. This is also the case for IRQF_NO_THREAD and
> IRQF_PERCPU but might be more obvious.

Yeah, that not being documented seems like an oversight as generally
drivers should not need be changed to continue working on PREEMPT_RT (or
with forced-threading generally).

> Anyway, if the primary handler is not threaded then it runs in HARDIRQ
> context and here you must not use a spinlock_t. This is documented in
> Documentation/locking/locktypes.rst and there is also a LOCKDEP warning
> for this on !RT which is off by default because it triggers with printk
> (and this is worked on).

All interrupt handlers typically run in hard interrupt context unless
explicitly requested to be threaded on !RT and drivers still use
spinlock_t for that so not sure how that lockdep warning is supposed to
work. Or do you mean that you have a lockdep warning specifically for
IRQF_ONESHOT primary handlers?
 
> > And this should not be backported in any case.
> 
> Such things have been backported via -stable in the past. If you
> disagree, please keep me in loop while is merged so I can poke people to
> backport it as part of the RT patch for the relevant kernels.

The author did not seem to think this was stable material as there is no
cc-stable tag and it also seems fairly intrusive.

But if the ST guys or whoever cares about this driver are fine with this
being backported, I don't really mind either.

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
