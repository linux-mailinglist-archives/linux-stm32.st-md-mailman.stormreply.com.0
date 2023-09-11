Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C664579A274
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 06:31:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C82C6B467;
	Mon, 11 Sep 2023 04:31:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C455C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 04:31:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C2E3960EFA;
 Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21BFEC433C9;
 Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694406700;
 bh=HeAxVqUDbuPU8OlsjqH69CvpFFmY4UWq7/M/U9Q7wfg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G85zgQQvJZg1Y5x8UnCyix+l2Yfn+Rogh9QvzeRm5oKG7U7YkZgrNdt1C3AgCbeIM
 amofs9m/cffOZH9wjwwpOTybDZQoulvVrk94Nr5MH4SxlxbPPM70twdmGJ6kdEdzhs
 k6WNSoqBV8upYywO+aAzkbPpmAnX2Rl84Y2IEbEyDo5lA3w0qTuvwNUESUvO7dcALV
 XFFWvb/BnzKJj6gWPjOKY4MrxcSqPBDAZCwcOnS4PypiYAY8rhtUBZXmyHUw7q6VFX
 KFKgpwDyWVJq3EX5QmmGA+GkOmL+KczLnAkLKnVQ987HqV1sDhgfou/6d7fGRPn6ng
 FkWiamQUpTQRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03727E1F67E; Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440670000.22573.14595180245385997034.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
References: <20230714174731.4059811-1-robh@kernel.org>
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: thor.thayer@linux.intel.com, vigneshr@ti.com, tony@atomide.com,
 linus.walleij@linaro.org, cristian.ciocaltea@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, groeck@chromium.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, samuel@sholland.org, zhang.lyra@gmail.com,
 lee@kernel.org, jernej.skrabec@gmail.com, cw00.choi@samsung.com, wens@csie.org,
 agross@kernel.org, orsonzhai@gmail.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, rf@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, baolin.wang@linux.alibaba.com,
 matthias.bgg@gmail.com, linux-omap@vger.kernel.org, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 support.opensource@diasemi.com, patches@opensource.cirrus.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 krzysztof.kozlowski@linaro.org, mcoquelin.stm32@gmail.com, richard@nod.at,
 mazziesaccount@gmail.com
Subject: Re: [Linux-stm32] [PATCH] mfd: Explicitly include correct DT
	includes
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
by Lee Jones <lee@kernel.org>:

On Fri, 14 Jul 2023 11:47:27 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - mfd: Explicitly include correct DT includes
    https://git.kernel.org/chrome-platform/c/dc0c386e09a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
