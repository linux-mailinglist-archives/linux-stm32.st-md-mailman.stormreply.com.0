Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E688B21B87
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 05:20:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BE53C32E93;
	Tue, 12 Aug 2025 03:20:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D33E1C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 03:20:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63AF344392;
 Tue, 12 Aug 2025 03:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3438C4CEED;
 Tue, 12 Aug 2025 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754968800;
 bh=6A+jeyPnXO4AX6ZcycgzjX1K4rTdQsKw738pZ+L6V6Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=halp2w/8T0gvAzda6uNomNpUXHnhiG6miLpGMs1Ys53r8W/N4R2ccWOxIdvct14ta
 Y0rY4PE9oLh6DauJzq+PB5cFu53b67nXF4KzfSKpMEjeJGCcIa4nKDSaA1Ml91drmy
 Y4/AUu9PgKOw9idpCrXIZZ0m0qKcuUeofMMZsgpQzCJCzMM2R3/zCqJs2PShyWcZNj
 L2mRj/PR8Jxf3ScUKCILXuZx97QDEWc6jBBQNi4hcFKRPDV2wPKajw1pR1pYuC3jhJ
 cbl7r5y3TkbA92bZjieH5TAnxn3N9qSEad/8O8D6ZNj5z/nCz72p31Dt3u9PVIOmK6
 Hhuv9L8A8soQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70B35383BF51; Tue, 12 Aug 2025 03:20:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175496881199.1990527.5027010954317382429.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 03:20:11 +0000
References: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, david.wu@rock-chips.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: rk: put the PHY clock
	on remove
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 08 Aug 2025 13:16:34 +0100 you wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: rk: put the PHY clock on remove
    https://git.kernel.org/netdev/net/c/de1e963ad064

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
