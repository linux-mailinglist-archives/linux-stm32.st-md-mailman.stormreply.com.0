Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2278C556AB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 03:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B73AC597BF;
	Thu, 13 Nov 2025 02:20:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46F4CC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 02:20:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F9AC601AF;
 Thu, 13 Nov 2025 02:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C71C16AAE;
 Thu, 13 Nov 2025 02:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763000454;
 bh=8ejBa8X0oQZTOqEW8wmzYE3T4O7hj6OmR6op+Ep2U6k=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CSQv8g5loeBZqGzmCvUsSPniqMoFRVNtpoRs0afr+bvThoG+hh30q0camffgh4MaO
 JQG6cihmoYGnghBOeRxp6mBxZgq5Hcd2/K4DBMk7XhNwmmWaIFoEop/WrRN6cOVaF+
 ovE1OTaKveGq0UT+DQc4wQfxrfG2KTb1Fu8Oo3H9WYK7ZWb+WpxkpP98OIof4+sATD
 Joj+Z8Ka9I6buzx809VpN5D55WncG6CnYu0rHOF5E5yR44VUZT7zcGUWjHnKOKj8UK
 i+7Z6au5q+VA7oNQ0Ci+SvOlR0hFYuNYaAa4C39P2V40SNmkRQeZ37fO+IR2HlmXn1
 MpVw3p+2vu4Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E533A40FD1; Thu, 13 Nov 2025 02:20:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176300042425.285552.5459936972326957453.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 02:20:24 +0000
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, kernel@esmil.dk,
 nobuhiro.iwamatsu.x90@mail.toshiba, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, linux-mediatek@lists.infradead.org,
 minda.chen@starfivetech.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 kuba@kernel.org, hkallweit1@gmail.com, keguang.zhang@gmail.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/13] net: stmmac: convert
 glue drivers to use stmmac_get_phy_intf_sel()
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

On Tue, 11 Nov 2025 08:11:25 +0000 you wrote:
> This series converts the remaining glue drivers that support
> multi-interface to use stmmac_get_phy_intf_sel(). The reason these
> drivers are not converted to the set_phy_intf_sel() method is
> because it is unclear whether there are ordering dependencies that
> would prevent it.
> 
> For example, reading the stm32mp2 documentation, it is required to
> set the ETH1_SEL field while the dwmac core is in reset and before
> clocks are enabled. This requirement can not be satsified at the
> moment (but could with further changes.)
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/13] net: stmmac: loongson1: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/5d88b24c1de8
  - [net-next,v2,02/13] net: stmmac: loongson1: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/031f7a05d4b3
  - [net-next,v2,03/13] net: stmmac: loongson1: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/83eb6c7e1864
  - [net-next,v2,04/13] net: stmmac: mediatek: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/c3308d380e2c
  - [net-next,v2,05/13] net: stmmac: mediatek: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d9c7964fd934
  - [net-next,v2,06/13] net: stmmac: mediatek: simplify set_interface() methods
    https://git.kernel.org/netdev/net-next/c/f06620091fe7
  - [net-next,v2,07/13] net: stmmac: starfive: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/f0917b475378
  - [net-next,v2,08/13] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/d22045997b53
  - [net-next,v2,09/13] net: stmmac: stm32: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/73130c298fa0
  - [net-next,v2,10/13] net: stmmac: stm32: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/07669cf12ea8
  - [net-next,v2,11/13] net: stmmac: stm32: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/45c5e24a53f1
  - [net-next,v2,12/13] net: stmmac: visconti: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/bb68e0183e04
  - [net-next,v2,13/13] net: stmmac: visconti: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/ccb4ff9f24e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
