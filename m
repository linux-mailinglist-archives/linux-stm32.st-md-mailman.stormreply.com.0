Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837BC7A540
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 15:55:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F198CC60497;
	Fri, 21 Nov 2025 14:55:09 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 383E4C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cUWCvxpi6yN02JYD/ezJBruMSnXyrEhd3rz8Me29Xlw=; b=aO0PLSK7qfu/FovGYhfLS+dQiM
 jWQuzAs6xPj0Vr0IjwVw3gv6cdQwoc9+Yx0NbvWRI8UwmV3c7fAmavCZLEpmQ0fLazJtH9JTTzKsd
 dKPLG6xN2203lxzeTq9E1Dbb5rC1mGh1yBwhX7Udq2kzTZFv4U5l+7cQNyN1bH5Oi5lt1OzsxGGJt
 ev+SQZ1it8FDnn78f3rejJBbFH8pFxn2JL9qhi3E3E4i0DFoLOMk2l7+YNkAmOUt3nJGwqmEu985C
 6CU8IGKWREZcvV/e4EXDexO8eXzXmqgvtbgvgAQfU0k6FkZf6Tk5bsKXfA+UWeAnCUbXNq4E3guDR
 QECPI58g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59300)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vMSXJ-000000007gY-3h78;
 Fri, 21 Nov 2025 14:54:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vMSXG-000000005Qf-0QYl; Fri, 21 Nov 2025 14:54:54 +0000
Date: Fri, 21 Nov 2025 14:54:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aSB9Pfd0cAd4CQgL@shell.armlinux.org.uk>
References: <E1vMNoX-0000000FTBd-3Oup@rmk-PC.armlinux.org.uk>
 <0423d36b-05fa-4a2b-858c-e6ef5ff1560d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0423d36b-05fa-4a2b-858c-e6ef5ff1560d@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: move
 stmmac_mac_finish() after stmmac_mac_config()
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

On Fri, Nov 21, 2025 at 01:03:59PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 21/11/2025 10:52, Russell King (Oracle) wrote:
> > Keep the functions and initialisers in the same order that they exist
> > in phylink_mac_ops. This is the preferred order for phylink methods
> > as it arranges the configuration methods by called order.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 970c670fc302..d16e522c1e7d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -932,7 +932,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
> >  	struct stmmac_priv *priv = netdev_priv(ndev);
> >  
> >  	if (priv->plat->mac_finish)
> > -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
> > +		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> > +				       interface);
> 
> This is just a line wrap, I don't really see the connexion with the
> commit log :( Some missing hunks in the commit maybe ?

Oh, I thought I hadn't sent the patch, but I had... meanwhile I'd
updated my local copy to fix the line wrap, forgotten I'd done that,
rebased the patch and ended up with a patch with that description
but with only the reformatting. Bah. I'll move it out of patchwork.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
