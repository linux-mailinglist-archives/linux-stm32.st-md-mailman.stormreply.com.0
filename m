Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F28C76E8D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 03:00:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E54FC5F1E9;
	Fri, 21 Nov 2025 02:00:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB2CC5F1E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 02:00:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96B6B43938;
 Fri, 21 Nov 2025 02:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F45C116B1;
 Fri, 21 Nov 2025 02:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763690453;
 bh=hUYp9odp8LoH/NylHXpnLHdk7Xwiaj3w0z4IGhqyrPM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PpA/sSIjvKeThEpQIhCsUR2N4PjbMwx6f8VlOYvBqqY/Whhx81eabU0qVtr44yf2d
 ss2k65SjW38/zWZQZO/lP/QEUmeYUUr4d+tezl4HeimJ8JiUZK1jwqmFfDjOkgAYhk
 PI3CmJaCu0z2odMbDQVApUYMYabS7TEMGhUROchEufoZKV84m6Te+VaTq8xVwwYHoV
 BWcEbpWar42vIOnF+NAT6P0RIkYLSUqmoBGyhzXhfT6lSocbkMgfXIg4gTrpp1GytL
 G1CClY2fVJF5p6X2f1gPMqbfCNEG6IcKZEmUwwmC0zZCbmVDej9BRDld3udcPy8z69
 Wf2Kf2/49lFPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AEC4D3A41003; Fri, 21 Nov 2025 02:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176369041825.1856901.6474170870442345383.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:00:18 +0000
References: <E1vLgNA-0000000FMjN-0DSS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLgNA-0000000FMjN-0DSS@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: rk: use phylink's
 interface mode for set_clk_tx_rate()
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Nov 2025 11:29:16 +0000 you wrote:
> rk_set_clk_tx_rate() is passed the interface mode from phylink which
> will be the same as bsp_priv->phy_iface. Use the passed-in interface
> mode rather than bsp_priv->phy_iface.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: rk: use phylink's interface mode for set_clk_tx_rate()
    https://git.kernel.org/netdev/net-next/c/f15bcd071913

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
