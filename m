Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA388B1DD69
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 21:15:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36538C36B16;
	Thu,  7 Aug 2025 19:15:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3DFAC36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VTJAmK/RuqPGqNceQRqXn7WqL1onxDBkB7rg1B+KpRc=; b=y7R35GghiBYgAKpVICZVirOPT8
 5h7mM1XI90jlP/RPcoTWrygIdPQ5PPobGdFATPVC/YraPpasd6kXlCDSjNTBnIoiqUY8Cn4+tMuNL
 7ZIjqwrvBr9hqELYrBOGgZxqq5XmvoXEXPTA5clZE5gc4/zm4pBZXQKhckgw2gyJcFFyBhciRfv0U
 DuE/L63jFzmVKau62VmE6UIC0k2aOX/TUlgheRn9goZuadMp72U5CoYGE2bPIh/Rv5z4+j/6rmGki
 JBIwT1/sfM3o3toZHau7DVYhIPrhQhnnn3XzL2Z5U8Nr+vZ0uXd5ybIaM2OMr0J7/wgiJxhjRWvjO
 0f4MKsGA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41228)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uk65A-0006V3-1m;
 Thu, 07 Aug 2025 20:15:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uk654-0008LM-0X;
 Thu, 07 Aug 2025 20:15:14 +0100
Date: Thu, 7 Aug 2025 20:15:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <aJT7QTzT_AHmkS6H@shell.armlinux.org.uk>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
 <20250807183359.GO61519@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807183359.GO61519@horms.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: rk: put the PHY clock on
	remove
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

On Thu, Aug 07, 2025 at 07:33:59PM +0100, Simon Horman wrote:
> On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> > The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> > doesn't take part in the devm release. Therefore, when a device is
> > unbound, this clock needs to be explicitly put. Fix this.
> > 
> > Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > Spotted this resource leak while making other changes to dwmac-rk.
> > Would be great if the dwmac-rk maintainers can test it.
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 79b92130a03f..4a315c87c4d0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
> >  	stmmac_dvr_remove(&pdev->dev);
> >  
> >  	rk_gmac_powerdown(bsp_priv);
> > +
> > +	if (plat->phy_node && bsp_priv->integrated_phy)
> > +		clk_put(bsp_priv->clk_phy);
> 
> Hi Russell,
> 
> Something seems a little off here.
> I don't see plat in this context in net.

Already have a fix for it, thanks anyway. Today ended up going awol
due to dentistry stuff. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
