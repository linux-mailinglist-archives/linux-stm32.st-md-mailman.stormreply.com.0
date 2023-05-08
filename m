Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8776F9E64
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 05:56:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1871AC6A5F7;
	Mon,  8 May 2023 03:56:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5067C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 03:56:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 797AC61113;
 Mon,  8 May 2023 03:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0525C4339B;
 Mon,  8 May 2023 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683518161;
 bh=NrJr0EBtNIgpAarh3hsg9dldeOGUlRjf/3/JXcqh+nU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=X7Dj3d2UdyEHAXKLIl/zP/EagxnlIOOO361aTHP/9S37uGTBFAUZ/A3T8XxjRO/ct
 ka4fIGeNufAEUZUGWQTXPqBVf5Fi6T1S6jXxMShex5cm+Kg7oyrHDO6NIX7LamSMMN
 j9sSBMYy1gqcPjf2QxtJLqSR7zDU4gh0HJVC3r4YHPMzkGFGX7rVKW9gotzYsZnooV
 TeEY5jCwIP4dvklJeYpU/TrxoysK/QCgVfLMXmZl8UDSbvturAi6WsSbx1c9Qq0HHK
 DPppWwftxiCGJvYFfzZ/2xL7AEJ/de3i3fO0hXboi7ZQtcmnsWG8cTmRODuePCWOAe
 lTHDKmzU22p5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A0975C395C8; Mon,  8 May 2023 03:56:01 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <168351816165.5651.12752189615466403387.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:56:01 +0000
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: alexandre.belloni@bootlin.com, linus.walleij@linaro.org,
 linux-tegra@vger.kernel.org, conor.dooley@microchip.com,
 thierry.reding@gmail.com, miquel.raynal@bootlin.com, groeck@chromium.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 f.fainelli@gmail.com, michal.simek@xilinx.com, jonathanh@nvidia.com,
 cw00.choi@samsung.com, bcm-kernel-feedback-list@broadcom.com,
 vincent.sunplus@gmail.com, kernel@pengutronix.de, ulli.kroll@googlemail.com,
 sean.wang@mediatek.com, vz@mleia.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 a.zummo@towertech.it, daire.mcnamara@microchip.com,
 patches@opensource.cirrus.com, nicolas.ferre@microchip.com,
 linux-renesas-soc@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 mcoquelin.stm32@gmail.com, claudiu.beznea@microchip.com, kumba@gentoo.org
Subject: Re: [Linux-stm32] [PATCH 00/41] rtc: Convert to platform remove
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

This patch was applied to chrome-platform/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat,  4 Mar 2023 14:29:47 +0100 you wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Here is the summary with links:
  - [10/41] rtc: cros-ec: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/0d8742e61098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
