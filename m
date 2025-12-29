Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 272BFCE6E7B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Dec 2025 14:50:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C04B2C58D77;
	Mon, 29 Dec 2025 13:50:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43E0EC57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 13:50:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDFEE40D6F;
 Mon, 29 Dec 2025 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F12C4CEF7;
 Mon, 29 Dec 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767016210;
 bh=JkD+7Su0h2sVFPy6YBrQzFZfhqvokIvRVoNcw/yYbk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GQhrozgZ3YlCEnV4LQ0e5FjvV7pwfEed0XenxxIsYtqTvg0aWEc1Ubj5VMDEFUJCm
 uaGAVrMSD1Q+ruWEev6a2ke9reO3YhPOFrFTPP6BJW0Pw1FaG0DYsWT0CxCuVCigqe
 Bo95h+sQsZemnhs2b9AsBV80kkibUBHFFF/2y240GItUj391+rPq/IN2X07beBYE87
 Kd7GKJ/wXyBS9M1F5C62GR9LRfBf8FWSdFnQVARJSLDUoAUZaVoTEgjqU854OZde3O
 5FOVd74V9w6ImzSmbNWTERx6VOy48/jQFyZ7zwE+H5ruRBRDoMCjPtWpUcv+k4WcwF
 EJ56w5Y67vcUw==
From: William Breathitt Gray <wbg@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 29 Dec 2025 22:50:01 +0900
Message-ID: <20251229135006.10133-1-wbg@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ba28863a-a5fe-498f-92a0-d71c356e7189@linaro.org>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=wbg@kernel.org;
 h=from:subject; bh=JkD+7Su0h2sVFPy6YBrQzFZfhqvokIvRVoNcw/yYbk8=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDJlBbXcnzuU387vWVz/VXHTJ8j6JpXukGCJVSuo+SAf8j
 Mq23lDRUcrCIMbFICumyNJrfvbug0uqGj9ezN8GM4eVCWQIAxenAEwk2pfhv6P1X9Puk1suqrwI
 nqqbbOwaoqCqbS/6+/fJ3qV3k/fJWjIynGJb5r18e3hWYPq//6tWPOx0a227dWFvraX3vdlmXZI
 V/AA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Cc: robh@kernel.org, conor+dt@kernel.org, s32@nxp.com,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/3] counter: Add STM based counter
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

On Sun, Dec 28, 2025 at 06:37:22PM +0100, Daniel Lezcano wrote:
> 
> Hi William,
> 
> On 12/28/25 07:52, William Breathitt Gray wrote:
> > On Wed, Dec 17, 2025 at 08:49:57AM +0100, Daniel Lezcano wrote:
> >> The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
> >> three Cortex-M7 cores, along with a large number of timers and
> >> counters. These hardware blocks can be used as clocksources or
> >> clockevents, or as timestamp counters shared across the various
> >> subsystems running alongside the Linux kernel, such as firmware
> >> components. Their actual usage depends on the overall platform
> >> software design.
> >>
> >> In a Linux-based system, the kernel controls the counter, which is a
> >> read-only shared resource for the other subsystems. One of its primary
> >> purposes is to act as a common timestamp source for messages or
> >> traces, allowing correlation of events occurring in different
> >> operating system contexts.
> >>
> >> These changes introduce a basic counter driver that can start, stop,
> >> and reset the counter. It also handles overflow accounting and
> >> configures the prescaler value.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >
> > Hi Daniel,
> >
> > It sounds like you're trying to implement a clock for timestamping.
> 
> Well no, it is a counter which is used for timestamping. It is an
> automotive design.

I'm sorry, I misunderstood your device earlier. We'll continue with the
Counter driver implementation in that case.

> > Regardless, if you do pursue a Counter driver you'll need to follow the
> > Generic Counter paradigm[^1] and define at least three core components:
> > a Signal, a Synapse, and a Count. Resetting the Count is typically
> > implemented by defining a struct counter_ops counter_write()

Oops, I should have written count_write() there; when a user sets the
Count back to 0, it can be considered a reset.

> > callback[^2], while overflows are typically implemented by pushing
> > COUNTER_EVENT_OVERFLOW Counter events[^3] that can be watched by
> > userspace.
> 
> Yes, I think the Generic counter makes sense here for the goal to be
> achieved. Thanks for the pointers, I'll see how the counter fits with
> the paradigm.
> 
>    -- Daniel

I suspect you'll define a Signal after the peripheral clock input to the
counter device block; if it's possible to read the instataneous level of
this signal, define a signal_read() callback for it.

Your Synapse action is dependent on the edge sensitivity (i.e. rising,
falling, or both edges) of your counter device; e.g. a rising edge
configuration corresponds to a COUNTER_SYNAPSE_ACTION_RISING_EDGE action
in action_read(). If your counter only ever increases, then you can
report a COUNTER_FUNCTION_INCREASE function in the function_read()
callback.

Finally, the component names should be intuitive so give the Count a
more intuitive name than "stm-cnt". The same idea applies to the name
you give the Signal.

William Breathitt Gray
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
