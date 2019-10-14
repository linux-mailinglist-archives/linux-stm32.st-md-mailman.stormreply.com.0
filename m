Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D2D6522
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 16:28:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 510BDC36B0B;
	Mon, 14 Oct 2019 14:28:40 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E78C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 14:28:39 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iK1Kr-0001WJ-Uc; Mon, 14 Oct 2019 16:28:34 +0200
Date: Mon, 14 Oct 2019 16:28:33 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
In-Reply-To: <16f7e8e9-eefe-5973-a08a-3e1823d20034@st.com>
Message-ID: <alpine.DEB.2.21.1910141620100.2531@nanos.tec.linutronix.de>
References: <20191009160246.17898-1-benjamin.gaignard@st.com>
 <alpine.DEB.2.21.1910141441350.2531@nanos.tec.linutronix.de>
 <a4b4b785-c471-a3c2-2c41-01bd9865e479@st.com>
 <alpine.DEB.2.21.1910141535500.2531@nanos.tec.linutronix.de>
 <16f7e8e9-eefe-5973-a08a-3e1823d20034@st.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
 "fweisbec@gmail.com" <fweisbec@gmail.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] tick: check if broadcast device could
 really be stopped
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

On Mon, 14 Oct 2019, Benjamin GAIGNARD wrote:
> On 10/14/19 3:40 PM, Thomas Gleixner wrote:
> > I don't understand what you are trying to achieve here. If the tick device,
> > i.e. the comparator stops working in deep idle states, then the device has
> > rightfully the CLOCK_EVT_FEAT_C3STOP (mis)feature set. Which means that the
> > system needs a fallback device for the deep idle case. If there is no
> > physical fallback device then you should enable the hrtimer based broadcast
> > pseudo tick device.
> >
> > If the CPUs never go deep idle because there is no idle driver loaded or
> > the deep power state in which the comparator stops working is never
> > reached, then the broadcast hrtimer will never be used. It just eats a bit
> > of memory and a few extra instructions.
> 
> Since CPUs won't go in deep idle I don't want to get a broadcast timer
> but only an hrtimer to get accure latencies for the scheduler.

What's wrong with the broadcast timer if it is never utilized? It's there,
needs a few bytes of memory and that's it.

> When arch arm timer doesn't set CLOCK_EVT_FEAT_C3STOP flag, my system got
> a hrtimer and everything goes well.

Sure, but that's applicable to your particular system only and not a
generic solution. Neither your DT hack, nor the other one you posted.

> If arch arm timer set CLOCK_EVT_FEAT_C3STOP hrtimer disappear (except if
> I add an additional broadcast timer).

Right.

> What is the link between tick broadcast timer and hrtimer ? Does arch 
> arm timer could only implement them at the same time ?

If the clock event device is affected by deep power states, then the core
requires a fallback device, aka. broadcast timer, which makes sure that no
event is lost in case that the CPU goes into a deep power state. If no CPU
ever goes deep, the broadcast timer is there and unused.

Obviously the system cannot enable high resolution timers if the clock
event device is affected by power states.

Unless you have a solution which works under all circumstances (and the
current patch definitely does not) then you have to deal with the
requirement of the broadcast timer (either physical or software based).

"I don't want a broadcast timer falls" into the "I want a pony" realm.

Thanks,

	tglx

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
