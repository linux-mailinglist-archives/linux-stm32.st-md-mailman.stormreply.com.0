Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E090915C
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 19:22:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1311AC6B460;
	Fri, 14 Jun 2024 17:22:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10291C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pGSKTYEY3XLoZvCSCn2sR/kLClqwmlZjZwZrOeUP/pI=; b=Y4ROH0HXzL2kfp04FwoQZ+KxX1
 orX20RnLFtLM8Is4YgL8rtOC+L2u/EHCsJF26vNb5zHBx8SYBsNl/Lc9lWxXP46V9wyeadOKZheLJ
 rUhSy3+ecQSM1HOgbO/RX5hsgC04OvtitpYnpY9CUcuI+qByWcXU0uQCofC9avCiPp3JUmFHJrHD8
 GV9CfkggdTJl+3sOLK8meqVcN2PUbtLcEEpqlFXxuL7bY7OeHhSfr5KKRiQJnd//ME/SSWXmcCryY
 M+VVylxr9dmV4GJQAuRvsic8nYrekNFNbyX1Um5IIn7NHNpf/HemgB1a+6GvsIPF4PppzaR4tig+L
 5NrGt8GQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55500)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sIAcV-00025Z-1h;
 Fri, 14 Jun 2024 18:21:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sIAcT-0002IT-B0; Fri, 14 Jun 2024 18:21:45 +0100
Date: Fri, 14 Jun 2024 18:21:45 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <Zmx8KfFtEXIAVziC@shell.armlinux.org.uk>
References: <ZmrLbdwv6ALoy+gs@shell.armlinux.org.uk>
 <E1sHhoM-00Fesu-8E@rmk-PC.armlinux.org.uk>
 <2xl2icmnhym4pzikivo6wqeyqny6ewrbqlfvsxrisykztdcaip@mp54uqtmrgyf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2xl2icmnhym4pzikivo6wqeyqny6ewrbqlfvsxrisykztdcaip@mp54uqtmrgyf>
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/5] net: stmmac: add
 select_pcs() platform method
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

On Fri, Jun 14, 2024 at 07:38:40PM +0300, Serge Semin wrote:
> Hi Russell
> 
> On Thu, Jun 13, 2024 at 11:36:06AM +0100, Russell King (Oracle) wrote:
> > Allow platform drivers to provide their logic to select an appropriate
> > PCS.
> > 
> > Tested-by: Romain Gantois <romain.gantois@bootlin.com>
> > Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
> >  include/linux/stmmac.h                            | 4 +++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index bbedf2a8c60f..302aa4080de3 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -949,6 +949,13 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
> >  						 phy_interface_t interface)
> >  {
> >  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
> > +	struct phylink_pcs *pcs;
> > +
> > +	if (priv->plat->select_pcs) {
> > +		pcs = priv->plat->select_pcs(priv, interface);
> > +		if (!IS_ERR(pcs))
> > +			return pcs;
> > +	}
> >  
> >  	if (priv->hw->xpcs)
> >  		return &priv->hw->xpcs->pcs;
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 8f0f156d50d3..9c54f82901a1 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -13,7 +13,7 @@
> >  #define __STMMAC_PLATFORM_DATA
> >  
> >  #include <linux/platform_device.h>
> > -#include <linux/phy.h>
> > +#include <linux/phylink.h>
> >  
> >  #define MTL_MAX_RX_QUEUES	8
> >  #define MTL_MAX_TX_QUEUES	8
> > @@ -271,6 +271,8 @@ struct plat_stmmacenet_data {
> >  	void (*dump_debug_regs)(void *priv);
> 
> >  	int (*pcs_init)(struct stmmac_priv *priv);
> >  	void (*pcs_exit)(struct stmmac_priv *priv);
> > +	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
> > +					  phy_interface_t interface);
> 
> Just a small note/nitpick. We've got pcs_init() and pcs_exit()
> callbacks. Both of them have the pcs_ prefix followed by the action
> verb. What about using the same notation for the PCS-select method,
> using the plat_stmmacenet_data::pcs_select() callback-name instead?

From phylink's perspective, it's not part of the PCS, it's something
that the MAC does.

The interface passed in to mac_select_pcs() so so the MAC code can
decide which PCS (if it has many to choose from) will be used for
the specified interface mode to either a PHY or other device
connected to the netdev. It isn't a PCS operation, it's an
operation that returns an appropriate PCS.

So, I want to keep "select_pcs" as at least a suffix, because it
is selecting a PCS. Eventually, I would like to see the stmmac
implementations check the "interface" passed to it before deciding
whether to return a PCS or not - thus how it's intended to be
implemented.

"pcs_select" seems to make it sound like it's part of a PCS
implementation, which as I've explained above, it isn't. It also
doesn't convey that it's selecting a PCS based on its arguments.

I'd also like to keep the ability to grep for "select_pcs" to
find implementations and not have complex grep expressions to
find whatever the driver has called it! To that end, I much prefer
that drivers that name sub-implementations the same way that
phylink names them to make grepping easier.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
