Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9CACE4999
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Dec 2025 07:52:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8F28C5F1C5;
	Sun, 28 Dec 2025 06:52:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99CA3C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Dec 2025 06:52:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 88DA360055;
 Sun, 28 Dec 2025 06:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436C6C4CEFB;
 Sun, 28 Dec 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766904767;
 bh=uXXoCbWj+ft3G+bbeyfRGBLWRRFRoHtxxL0vn/VevBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2L+Z5OHw3Hd1gGt0E756UjXsqxG8RhwILE1aNPwgIQXC0rK6KeMfUyQmktUja8os
 bbjyLS3qPSL2ZDi9DkY7SHSNC2x/P76EJRw68nWV5d8rKpqTZ/FxSGWYLsHkq49Hkm
 LNjIQHEv1gEcMRy6ftiW1g+4ZlGVnRzqj0Imem4WYNL9AJNAMEylRD5WIr2OgVV7nN
 xPb0W697Zq0lHCMYmgvsp9e74pEDcBrdkHVFRuKK0ZBl+zEgp08u2cZgXyulSSsTzZ
 Z338+nSqrne2lBAvIHTtuF+JW2Ix+85u99QmaY+bknGr3tyTOX/BiTC3B1n2ljkEd0
 HO6vtHLspJQ6w==
From: William Breathitt Gray <wbg@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Sun, 28 Dec 2025 15:52:40 +0900
Message-ID: <20251228065241.21144-1-wbg@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
References: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=wbg@kernel.org;
 h=from:subject; bh=uXXoCbWj+ft3G+bbeyfRGBLWRRFRoHtxxL0vn/VevBo=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDJkBl5eV3nC/Oe0pY83T8hc6BcdPKfLm9+5mFD+035VV+
 kJtXqRjRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRaB1Ghs1TzRb95zCbxpir
 seOwT8ghvW/5s1aLfzTbkFv5Y0VSUhHDP3uzJrP45bUXa/adLkhWex/S6BOXfnXF1lOSr0113Nf
 MYAcA
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

On Wed, Dec 17, 2025 at 08:49:57AM +0100, Daniel Lezcano wrote:
> The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
> three Cortex-M7 cores, along with a large number of timers and
> counters. These hardware blocks can be used as clocksources or
> clockevents, or as timestamp counters shared across the various
> subsystems running alongside the Linux kernel, such as firmware
> components. Their actual usage depends on the overall platform
> software design.
> 
> In a Linux-based system, the kernel controls the counter, which is a
> read-only shared resource for the other subsystems. One of its primary
> purposes is to act as a common timestamp source for messages or
> traces, allowing correlation of events occurring in different
> operating system contexts.
> 
> These changes introduce a basic counter driver that can start, stop,
> and reset the counter. It also handles overflow accounting and
> configures the prescaler value.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Hi Daniel,

It sounds like you're trying to implement a clock for timestamping.
Although the Generic Counter interface is flexible enough to shoehorn a
a clock into its representation, I don't believe it's the right
abstraction for this particular device. Perhaps reimplementing this
driver under the Linux common clock framework would be a better approach
to achieve what you want.

Regardless, if you do pursue a Counter driver you'll need to follow the
Generic Counter paradigm[^1] and define at least three core components:
a Signal, a Synapse, and a Count. Resetting the Count is typically
implemented by defining a struct counter_ops counter_write()
callback[^2], while overflows are typically implemented by pushing
COUNTER_EVENT_OVERFLOW Counter events[^3] that can be watched by
userspace.

William Breathitt Gray

[^1] https://docs.kernel.org/driver-api/generic-counter.html#paradigm
[^2] https://docs.kernel.org/driver-api/generic-counter.html#c.counter_ops
[^3] https://docs.kernel.org/driver-api/generic-counter.html#counter-events
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
