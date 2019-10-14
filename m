Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15FAD643B
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 15:40:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C83FC36B0B;
	Mon, 14 Oct 2019 13:40:28 +0000 (UTC)
Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D336FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 13:40:27 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iK0aE-0000dA-EF; Mon, 14 Oct 2019 15:40:22 +0200
Date: Mon, 14 Oct 2019 15:40:21 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
In-Reply-To: <a4b4b785-c471-a3c2-2c41-01bd9865e479@st.com>
Message-ID: <alpine.DEB.2.21.1910141535500.2531@nanos.tec.linutronix.de>
References: <20191009160246.17898-1-benjamin.gaignard@st.com>
 <alpine.DEB.2.21.1910141441350.2531@nanos.tec.linutronix.de>
 <a4b4b785-c471-a3c2-2c41-01bd9865e479@st.com>
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
> On 10/14/19 2:56 PM, Thomas Gleixner wrote:
> > On Wed, 9 Oct 2019, Benjamin Gaignard wrote:
> >> @@ -78,7 +78,7 @@ static bool tick_check_broadcast_device(struct clock_event_device *curdev,
> >>   {
> >>   	if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
> >>   	    (newdev->features & CLOCK_EVT_FEAT_PERCPU) ||
> >> -	    (newdev->features & CLOCK_EVT_FEAT_C3STOP))
> >> +	    tick_broadcast_could_stop(newdev))
> > No. This might be called _before_ a cpuidle driver is available and then
> > when that driver is loaded and goes deep, everything goes south.
> 
> What could be the solution to let know to tick broadcast framework that 
> this device
> 
> will not be stopped (because CPU won't go in idle) ?
> 
> I have tried to put "always-on" property on DT but it was a NACK too:
> 
> https://lkml.org/lkml/2019/9/27/164
> 
> Do I have miss a flag somewhere ?

I don't understand what you are trying to achieve here. If the tick device,
i.e. the comparator stops working in deep idle states, then the device has
rightfully the CLOCK_EVT_FEAT_C3STOP (mis)feature set. Which means that the
system needs a fallback device for the deep idle case. If there is no
physical fallback device then you should enable the hrtimer based broadcast
pseudo tick device.

If the CPUs never go deep idle because there is no idle driver loaded or
the deep power state in which the comparator stops working is never
reached, then the broadcast hrtimer will never be used. It just eats a bit
of memory and a few extra instructions.

Thanks,

	tglx

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
