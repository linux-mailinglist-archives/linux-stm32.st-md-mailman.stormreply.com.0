Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDD6F9E51
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 05:45:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E6C0C6A608;
	Mon,  8 May 2023 03:45:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D977FC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 03:45:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B776361E5A;
 Mon,  8 May 2023 03:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BDE1C433A1;
 Mon,  8 May 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683517514;
 bh=B107g9Lt1qqRc8zGMhAvO5F9KOo7vdHb61jTMsoTnGM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hkMTnw/raTjwK8dXNNlAE97OKveUSkIvTENObtPpXmS/b16Zo99WrTSP7cywcVOaz
 2+XnilGdG5W9CxLf21CBgwIE3dr+BS7eeWVfHE2NnInr3cCuU07cmXjcdUiylXBODh
 rlNP3mWO5sv2ub5TQwGiSAwmfFrT56h1gR1UEdK9KiPWbygV7PLvqSJFb0Bn/t5IPY
 tOW3rn8pjHLIK17yRFrplFPu32Bd4Kid59zpQP1Hqnns7ZgLQGXjoHeKLpqWF0FShM
 CS13qoXkg1I2NfqjGaO5WOeMIk3l1Pc07ZvdP+PzhTx1ikCP9qq88EvckL12EFrnQc
 6GLTtN5goJPrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6D73BE26D27; Mon,  8 May 2023 03:45:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <168351751444.5651.16443197694918881526.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:45:14 +0000
References: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, alim.akhtar@samsung.com, groeck@chromium.org,
 linux-riscv@lists.infradead.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, f.fainelli@gmail.com, samuel@sholland.org,
 sean.anderson@seco.com, zhang.lyra@gmail.com, michal.simek@xilinx.com,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 rjui@broadcom.com, s.hauer@pengutronix.de, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 baolin.wang@linux.alibaba.com, paul.walmsley@sifive.com,
 matthias.bgg@gmail.com, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 sbranden@broadcom.com, nicolas.ferre@microchip.com,
 krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH 00/30] pwm: Convert to platform remove
	callback returning void
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri,  3 Mar 2023 19:54:15 +0100 you wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/pwm to use
> the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> [...]

Here is the summary with links:
  - [09/30] pwm: cros-ec: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/159a61a7b5b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
