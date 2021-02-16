Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DF31D0F1
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Feb 2021 20:27:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65917C5718D;
	Tue, 16 Feb 2021 19:27:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D445C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 19:27:28 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A079F64ED0;
 Tue, 16 Feb 2021 19:27:23 +0000 (UTC)
Date: Tue, 16 Feb 2021 19:27:20 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210216192720.75082d22@archlinux>
In-Reply-To: <YCsq42hXqdRWrSEd@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <d2e72eac404ca5b7c99d8a642f2c07ebb2eb240a.1613131238.git.vilhelm.gray@gmail.com>
 <20210214181946.1d2f7e78@archlinux> <YCsq42hXqdRWrSEd@shinobu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 21/22] counter: 104-quad-8: Replace
 mutex with spinlock
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

On Tue, 16 Feb 2021 11:16:03 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Sun, Feb 14, 2021 at 06:19:46PM +0000, Jonathan Cameron wrote:
> > On Fri, 12 Feb 2021 21:13:45 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > This patch replaces the mutex I/O lock with a spinlock. This is in
> > > preparation for a subsequent patch adding IRQ support for 104-QUAD-8
> > > devices; we can't sleep in an interrupt context, so we'll need to use a
> > > spinlock instead.
> > > 
> > > Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>  
> > 
> > Why do these need to be raw_spin_locks?
> > Normally only need to do that if in code related to interrupt chips etc,
> > not their use.
> > 
> > Jonathan  
> 
> This lock can be taken in an interrupt context in a subsequent patch:
> counter_push_event() called by quad8_irq_handler() can end up calling
> the Counter component callbacks which take this lock. We can't use a
> mutex nor a regular spinlock because those can sleep on RT setups [1]

But on RT setups the interrupts become threads and are preemptable etc,
so that shouldn't matter.  There are a few corner cases that cause
trouble, but in most normal drivers you should be fine with a
spin_lock.

Jonathan


> which would result in a deadlock due to the interrupt context here -- so
> therefore we're left with using raw_spin_lock.
> 
> [1] https://lwn.net/Articles/367219/
> 
> William Breathitt Gray

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
