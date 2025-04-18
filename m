Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22042A92F88
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 03:50:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8AFBC78F72;
	Fri, 18 Apr 2025 01:50:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA164C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 01:50:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 328495C5464;
 Fri, 18 Apr 2025 01:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC52CC4CEEB;
 Fri, 18 Apr 2025 01:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744941023;
 bh=RWS3beSN0nf1LG/1NlhXEkDw2nBv4zaRnqOhm+10ccI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Hc1SNNT+G7wWIDXsMbBYH6kqxhekJntqM19hxW+syQOW5t8laYO+5aKRzz8QYhMrX
 bF1u0Ay9Qu1NTL3YoBDE+8lfoliQKhOT8/WUUoPQevnNmERTAxfNSoa3TEbQb02XhJ
 d9yRTqlz9dSqkd7jUQA5hv2lXVeLZJZyGTAL66t/G5DznRDt3IagjzE+rcoVp37Mpc
 SYbukbpLlYZAzPItqcVdVPleocnrFlsp+1NzZAGzsL5nMsfinvYvzBkxOk8OepL9Bx
 krH5AR1X9D2i1Mct8gD4P+ODe0uaw+pvcDOpQFnk5uJh0lRroXyf/UFu5wd5JHMTgg
 wstyBa+3h68Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33B0B380AAEB; Fri, 18 Apr 2025 01:51:03 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494106174.75375.14390030556312826842.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 01:51:01 +0000
References: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
In-Reply-To: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, edumazet@google.com, samuel@sholland.org,
 netdev@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch, wens@csie.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: sunxi cleanups
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Apr 2025 13:51:27 +0100 you wrote:
> Hi,
> 
> This series cleans up the sunxi (sun7i) code in two ways:
> 
> 1. it converts to use the new set_clk_tx_rate() method, even though
>    we don't use clk_tx_i. In doing so, I reformat the function to
>    read better, but with no changes to the code.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: sunxi: convert to set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/a27d798fd83c
  - [net-next,2/3] net: stmmac: sunxi: use stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/dd2cdba4709f
  - [net-next,3/3] net: stmmac: sunxi: use devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/69b3e38e2fb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
