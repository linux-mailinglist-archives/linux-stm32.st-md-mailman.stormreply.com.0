Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A536A44C16
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:12:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40FB6C78F9B;
	Tue, 25 Feb 2025 20:12:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C77C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:12:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E7475C708F;
 Tue, 25 Feb 2025 20:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DFC4CEDD;
 Tue, 25 Feb 2025 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740514356;
 bh=yTCj5mHCtdBx8pk+52dg55Yg5D96C+PxN6w8CQznwjM=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=qA/yQo2Dj7sATmTqu+FxRMZ65j9/jCkahdI62i/V40ioGuSi2VPnHu+ozuj0hCykM
 7SwJsjXxnFwy5gAEVVto5RF/S13qmg4gmUdYBgf6i+zc8r0IROTfT+VESyZEPDRs4H
 UxNacRkez6vE1G0S562m0LjxY9fD5f/Qub7y8BpjbWIkVKPsdJlRHbcAXQfPCJ4xLH
 DQyQUfZ+U1hwVn5ZH6fcdjIQJJ7uOc1hu6AAK1njsVkcmXuyu5F1ItA39HdEWxd/qN
 7p1JfHl5t6QAegMK+0wFDo2wggGt9kTyPga4LZqk3/r281/fkY6jUdkoUe6vqE6OGZ
 cdwFm+tgF71yQ==
Date: Tue, 25 Feb 2025 14:12:34 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
Message-Id: <174051415125.2971414.5163158019956863310.robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 lee@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, ukleinek@kernel.org, jic23@kernel.org,
 tglx@linutronix.de, will@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/8] Add STM32MP25 LPTIM support: MFD, PWM,
 IIO, counter, clocksource
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


On Mon, 24 Feb 2025 19:01:42 +0100, Fabrice Gasnier wrote:
> This series adds support for STM32MP25 to MFD PWM, IIO, counter and
> clocksource low-power timer (LPTIM) drivers.
> This new variant is managed by using a new DT compatible string.
> It comes with a slightly updated register set, some new features and new
> interconnect signals inside the SoC.
> Same feature list as on STM32MP1x is supported currently.
> The device tree files add all instances in stm32mp251 dtsi file.
> 
> Fabrice Gasnier (6):
>   dt-bindings: mfd: stm32-lptimer: add support for stm32mp25
>   mfd: stm32-lptimer: add support for stm32mp25
>   pwm: stm32-lp: add support for stm32mp25
>   counter: stm32-lptimer-cnt: add support for stm32mp25
>   arm64: defconfig: enable STM32 LP timers drivers
>   arm64: dts: st: add low-power timer nodes on stm32mp251
> 
> Olivier Moysan (1):
>   iio: trigger: stm32-lptimer: add support for stm32mp25
> 
> Patrick Delaunay (1):
>   clocksource: stm32-lptimer: add stm32mp25 support
> 
>  .../bindings/mfd/st,stm32-lptimer.yaml        |  23 +-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        | 177 ++++++++++++++
>  arch/arm64/configs/defconfig                  |   5 +
>  drivers/clocksource/timer-stm32-lp.c          |   1 +
>  drivers/counter/stm32-lptimer-cnt.c           |   1 +
>  drivers/iio/trigger/stm32-lptimer-trigger.c   | 109 +++++++--
>  drivers/mfd/stm32-lptimer.c                   |  30 ++-
>  drivers/pwm/pwm-stm32-lp.c                    | 220 +++++++++++++++---
>  include/linux/iio/timer/stm32-lptim-trigger.h |   9 +
>  include/linux/mfd/stm32-lptimer.h             |  32 ++-
>  10 files changed, 554 insertions(+), 53 deletions(-)
> 
> --
> 2.25.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250224180150.3689638-1-fabrice.gasnier@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46060000: trigger@3:reg:0:0: 3 is greater than the maximum of 2
	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46070000: trigger@4:reg:0:0: 4 is greater than the maximum of 2
	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
