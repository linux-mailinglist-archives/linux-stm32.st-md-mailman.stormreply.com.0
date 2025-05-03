Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09409AA7DE4
	for <lists+linux-stm32@lfdr.de>; Sat,  3 May 2025 03:30:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD348C78F7D;
	Sat,  3 May 2025 01:29:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9ABDC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 May 2025 01:29:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE5B749F1E;
 Sat,  3 May 2025 01:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C7C4CEE4;
 Sat,  3 May 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746235797;
 bh=ckSRd/Z1qnGR5wOXMVaoNwn10WAMsGKB1bQB2+988VI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dYBU9/NCWhZT9cEjrZ/wwIvulZvVimgDEDPtNxu5T/H7Gzd8/Z64POfrz+Bvgbs6f
 MB72dWx4d/9CklUKdQ0/rjWzddt9bhkzZMTrAYouMti9W0vwq+chHA8hilvNpJzTPG
 0ApbmwCIEr0wIoHxP3W+WZmoFN3lWJubLBpSdz5UXOvB7olLl4REF3b3UlIKlO993s
 j6Tn6Z58KboK8DCCdnVmKsIqGfhLihnTtvfGDL1R23dsZf4DijJSBlumm6M3R86z8E
 0vfPmCv1lHOaZoX5p0i9E0RcInCPYY5YzuaCsyBKWhI7njUoY6EPykgVxR5O9mHt2H
 Q4oDSB9UI4/cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C66380DBE9; Sat,  3 May 2025 01:30:37 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174623583625.3773265.4045311227752993763.git-patchwork-notify@kernel.org>
Date: Sat, 03 May 2025 01:30:36 +0000
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: replace
	speed_mode_2500() method
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

On Thu, 1 May 2025 12:45:21 +0100 you wrote:
> Hi,
> 
> This series replaces the speed_mode_2500() method with a new method
> that is more flexible, allowing the platform glue driver to populate
> phylink's supported_interfaces and set the PHY-side interface mode.
> 
> The only user of this method is currently dwmac-intel, which we
> update to use this new method.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: use a local variable for priv->phylink_config
    https://git.kernel.org/netdev/net-next/c/5ad39ceaea00
  - [net-next,2/6] net: stmmac: use priv->plat->phy_interface directly
    https://git.kernel.org/netdev/net-next/c/1966be55da5b
  - [net-next,3/6] net: stmmac: add get_interfaces() platform method
    https://git.kernel.org/netdev/net-next/c/ca732e990fc8
  - [net-next,4/6] net: stmmac: intel: move phy_interface init to tgl_common_data()
    https://git.kernel.org/netdev/net-next/c/0f455d2d1bbe
  - [net-next,5/6] net: stmmac: intel: convert speed_mode_2500() to get_interfaces()
    https://git.kernel.org/netdev/net-next/c/d3836052fe09
  - [net-next,6/6] net: stmmac: remove speed_mode_2500() method
    https://git.kernel.org/netdev/net-next/c/9d165dc58055

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
