Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D0C425A9
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 04:21:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48FA9C56603;
	Sat,  8 Nov 2025 03:21:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9F9AC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 03:21:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9064D601CF;
 Sat,  8 Nov 2025 03:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC16C4CEF7;
 Sat,  8 Nov 2025 03:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762572063;
 bh=DP08fxj1Pdwkhh9oz9l/d6OztIyIzUnB15JwEWi8VFk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=G5QfO/MiUu27w75C/ZLOlvWMwACK1YXcNog7YMeLC7VyzhKmEW66mj5ZB3oL4uOeY
 ho19rE0+re+c9qvvkIkyQtvUfs384GH25HqlPKY3E+eSYKtG50678DWyAcJh8Gw2ec
 fXvI8j7y7S+0tpTlKuphx1hXd9Ghfy2Ytoo3Oa/f6+bctPWzyZiNcq22YxFwpB6UzW
 IyaIZF33P9q+LbpQO9QlRUjBYbo3qrD4SRPs9e+K1oHUTVi+yrZNp6PAuPLdFWq5/t
 oQ7VToqP0EhYpAKWLzCV48bpcXtGoH2cHUCEo/uCw/opFVhvOipzQfGJNsFQBo2xIc
 dN0oZxWgRZr5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 716DC3A40FCA; Sat,  8 Nov 2025 03:20:36 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176257203525.1236021.18202260388195244751.git-patchwork-notify@kernel.org>
Date: Sat, 08 Nov 2025 03:20:35 +0000
References: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
In-Reply-To: <aQyEs4DAZRWpAz32@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, vz@mleia.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: lpc18xx and
 sti: convert to set_phy_intf_sel()
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

On Thu, 6 Nov 2025 11:21:23 +0000 you wrote:
> This series converts lpc18xx and sti to use the new .set_phy_intf_sel()
> method.
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c    | 42 ++++++++++--------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    | 50 ++++++++--------------
>  2 files changed, 42 insertions(+), 50 deletions(-)

Here is the summary with links:
  - [net-next,1/9] net: stmmac: lpc18xx: convert to PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/5636fcdb0211
  - [net-next,2/9] net: stmmac: lpc18xx: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/eb0533c7e63b
  - [net-next,3/9] net: stmmac: lpc18xx: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/9882f1219408
  - [net-next,4/9] net: stmmac: lpc18xx: validate phy_intf_sel
    https://git.kernel.org/netdev/net-next/c/4bad4219249f
  - [net-next,5/9] net: stmmac: lpc18xx: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/7fe0e06a7364
  - [net-next,6/9] net: stmmac: sti: use PHY_INTF_SEL_x to select PHY interface
    https://git.kernel.org/netdev/net-next/c/9cd23c02ac57
  - [net-next,7/9] net: stmmac: sti: use PHY_INTF_SEL_x directly
    https://git.kernel.org/netdev/net-next/c/bd5a68159259
  - [net-next,8/9] net: stmmac: sti: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/ef5e870be90f
  - [net-next,9/9] net: stmmac: sti: use ->set_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/e3c8f25cf2aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
