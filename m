Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E75F8B50
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Oct 2022 14:46:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CFEC6410D;
	Sun,  9 Oct 2022 12:46:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E7E3C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Oct 2022 12:46:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7A8A60BDC;
 Sun,  9 Oct 2022 12:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C98C433C1;
 Sun,  9 Oct 2022 12:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665319563;
 bh=4Nj1puvm6vqPNPlMuFm1NVtI87aUUZFMFh+0kE9uGy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rmok3e/Ig4bRD0InOAXvRsPjsuTDJHzdt/hKDk4DgRNCe2PefW+zuRASQD3yZdiW9
 1dufcr3fL1qkQxlJhjkl1+0Wg5ULDdPLxYSdkzawIqNxSF2pxWNZJVhYSTWHRiDK7o
 uvRst07UF46+7gGpsMJMg5UGqp1+onipWszF61cUjQ2idh069XpphazFPaMvI6Yqk7
 krc1zYr+6MjE6MqW1YRGxLMIZx36QcuTa6kKR1Z9Vqr+TDj0vtJUNG1Nk67VcaX3gD
 w0F1eSTrfeZW+1tw2CsuZSOjuBWTthkfOnMJ2bVoEoqXadznDii2QbDR3k7SomvNVs
 sgzGpIYCjg7Rw==
Date: Sun, 9 Oct 2022 13:46:23 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Message-ID: <20221009134623.1525c67c@jic23-huawei>
In-Reply-To: <20221005161424.4537-3-olivier.moysan@foss.st.com>
References: <20221005161424.4537-1-olivier.moysan@foss.st.com>
 <20221005161424.4537-3-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, nuno.sa@analog.com,
 Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/8] dt-bindings: iio: adc: stm32-adc:
 add stm32mp13 compatibles
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

On Wed, 5 Oct 2022 18:14:18 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Add st,stm32mp13-adc-core and st,stm32mp13-adc compatibles
> to support STM32MPU13 SoC.
> 
> On STM32MP13x, each ADC peripheral has a single ADC block.
> These ADC peripherals, ADC1 and ADC2, are fully independent.
> 
> Main characteristics of STM32MP13x ADC:
> - One interrupt line per ADC
> - 6 to 12 bits resolution
> - 19 channels
> 
> ADC2 instance supports two extra internal channels VDDCPU and VDDQ_DDR.
> Add "vddcpu" and "vddq_ddr" internal channels names to the reserved
> labels list.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Hi,

All patches touching device tree bindings need to go to the devicetree
list and device tree binding maintainers for review (See MAINTAINERS)
Make sure you cc them on v4 as I won't pick up DT patches without their
review unless they are much more trivial than this one.

I'm not always great at noticing this on early versions as I tend to pick
up on the fact they didn't review as first sign they haven't seen the
series!

Jonathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
