Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA549FCB1
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jan 2022 16:20:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E07C6046D;
	Fri, 28 Jan 2022 15:20:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C80E3C6046C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jan 2022 15:20:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9549A60DF1;
 Fri, 28 Jan 2022 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36417C340EF;
 Fri, 28 Jan 2022 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643383211;
 bh=ex6whZix80c3R/+yIzxHpxb+HxTwZBN82khwzKcw/as=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=DfdOh8tq6w4FuRI+0yZN0xJHiV+YIHDU5X91yKeSHXDmOeCjcscC8s0T3AW6t6LR4
 EtSsbOcuKQEeWrzf4jCJU0C3Jcc4kFcIsm4seTtewqKyKaqfbW2/9Nw11e8Gy8qvAN
 YnpcXOtO5yNjCUfIAO2RYgUifpuv8Sj2/2qpN0Se5foe1cNSYWaehO1x/apl6iWxq2
 ILNm79vDaqEqr4E4x0kxHOdbDjzodY3YgldYj1ZW7NQpOdIhvmjbsbMe4lyACOn3nk
 pHmblx+BZMybodRVZlQr3gbRJEuQQgRM2ybAkImyTbky5n1NZLTW7cqN7TSTOTsys/
 md+4vAEHo4UqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 23129E5D087; Fri, 28 Jan 2022 15:20:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164338321113.8810.8058423675917516702.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jan 2022 15:20:11 +0000
References: <20220128145213.2454-1-jszhang@kernel.org>
In-Reply-To: <20220128145213.2454-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 mripard@kernel.org, linux-sunxi@lists.linux.dev, wens@csie.org,
 joabreu@synopsys.com, jernej.skrabec@gmail.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-sun8i: make
 clk really gated during rpm suspended
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 28 Jan 2022 22:52:13 +0800 you wrote:
> Currently, the dwmac-sun8i's stmmaceth clk isn't disabled even if the
> the device has been runtime suspended. The reason is the driver gets
> the "stmmaceth" clk as tx_clk and enabling it during probe. But
> there's no other usage of tx_clk except preparing and enabling, so
> we can remove tx_clk and its usage then rely on the common routine
> stmmac_probe_config_dt() to prepare and enable the stmmaceth clk
> during driver initialization, and benefit from the runtime pm feature
> after probed.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-sun8i: make clk really gated during rpm suspended
    https://git.kernel.org/netdev/net-next/c/b76bbb34dc80

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
