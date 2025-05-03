Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEEBAA7F8A
	for <lists+linux-stm32@lfdr.de>; Sat,  3 May 2025 11:00:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB21C78F62;
	Sat,  3 May 2025 09:00:01 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C7BC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 May 2025 08:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PkVXK7clTpydmjQPzKigib/TbsUCWoUyU4IFnzv0iUc=; b=L4PVO49lZrRMhwpLmEJ8TPgPBW
 kZ7gEZ9THS6C9iiDSGvSZ2OGi9ZgcCSjt1eBoN4iSKujni3GzA8j2doqCR6n3W7QD7pNQiZIiVxYH
 1e5ZAfPD60B1fUYD7pdq07K6dswCQ0OxVHoS32c/BgarvodZWD4SCI9hTzFY4Ap/aB9tkIyykFk95
 ZblsIKyxwEBPnNu3gVXD6UCxN6ci2wFf5Fde+4BL3LnSViNnQgEHi7+nTP/9a3+KAQZe2DuVPjyte
 QD2oFkPj/yVhDtFJIAch37FXqEKff8gTxiBpzit/XgMscAPFXq1DJHd0c9Kgbu5z8LKXLR4h01GfF
 6FEML5fw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45334)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uB8it-0002HF-2W;
 Sat, 03 May 2025 09:59:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uB8ip-0001Zw-37;
 Sat, 03 May 2025 09:59:47 +0100
Date: Sat, 3 May 2025 09:59:47 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: patchwork-bot+netdevbpf@kernel.org
Message-ID: <aBXbAwMC4V_3cmj6@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
 <174623583625.3773265.4045311227752993763.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174623583625.3773265.4045311227752993763.git-patchwork-notify@kernel.org>
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

Err, I sent v2 a couple of days ago, did patchwork not see it?

On Sat, May 03, 2025 at 01:30:36AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
> 
> On Thu, 1 May 2025 12:45:21 +0100 you wrote:
> > Hi,
> > 
> > This series replaces the speed_mode_2500() method with a new method
> > that is more flexible, allowing the platform glue driver to populate
> > phylink's supported_interfaces and set the PHY-side interface mode.
> > 
> > The only user of this method is currently dwmac-intel, which we
> > update to use this new method.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [net-next,1/6] net: stmmac: use a local variable for priv->phylink_config
>     https://git.kernel.org/netdev/net-next/c/5ad39ceaea00
>   - [net-next,2/6] net: stmmac: use priv->plat->phy_interface directly
>     https://git.kernel.org/netdev/net-next/c/1966be55da5b
>   - [net-next,3/6] net: stmmac: add get_interfaces() platform method
>     https://git.kernel.org/netdev/net-next/c/ca732e990fc8
>   - [net-next,4/6] net: stmmac: intel: move phy_interface init to tgl_common_data()
>     https://git.kernel.org/netdev/net-next/c/0f455d2d1bbe
>   - [net-next,5/6] net: stmmac: intel: convert speed_mode_2500() to get_interfaces()
>     https://git.kernel.org/netdev/net-next/c/d3836052fe09
>   - [net-next,6/6] net: stmmac: remove speed_mode_2500() method
>     https://git.kernel.org/netdev/net-next/c/9d165dc58055
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
