Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F7A45A6D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 10:40:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F32C78F8B;
	Wed, 26 Feb 2025 09:40:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E586C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=83zqbI+x0U8gPtjXear3SquLiO46uugWTwSYAMtbREo=; b=UqutqlGJIvxUsGizH3OmMYEY79
 1gUkhNTP6dnsG+xmSD9xemC1LTrj5vJtrHPQFCOEf8uykUCEgktMB9PRlBrgw8V9Plwa/r1N1Yhkn
 tjB0bufEAycPO1r/FWfGxiEYGaWv8s0UhFkIlcCnfKsx7N08rKykXCsy0XjPqmxabduh/ypagv8JV
 OJIuldAhllwqQGTb9TEsS/afmerYWy8+wPNqeO41sSu35L7UDEkVI8aawV/LmZftEmEtNxAm78bn5
 olE6xbjjH8MHE2Vd1QBQp0bBVc/zGk2/FIviY8wWn6fzq90d4x5BM/Aq02WkJWFN87+xpfIhfuf21
 dL2zjjyw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45812)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnDtL-0003mS-2I;
 Wed, 26 Feb 2025 09:39:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnDt8-0006xF-1k;
 Wed, 26 Feb 2025 09:39:34 +0000
Date: Wed, 26 Feb 2025 09:39:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <Z77hVrC5Lcbxrlx8@shell.armlinux.org.uk>
References: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
 <20250226104326.0000766e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226104326.0000766e@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, 2694439648@qq.com,
 hailong.fan@siengine.com, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] net: stmmac: weirdness in stmmac_hw_setup()
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

On Wed, Feb 26, 2025 at 10:43:26AM +0800, Furong Xu wrote:
> On Thu, 20 Feb 2025 16:17:43 +0000, "Russell King (Oracle)" wrote:
> 
> > While looking through the stmmac driver, I've come across some
> > weirdness in stmmac_hw_setup() which looks completely barmy to me.
> > 
> > It seems that it follows the initialisation suggested by Synopsys
> > (as best I can determine from the iMX8MP documentation), even going
> > as far as to *enable* transmit and receive *before* the network
> > device has been administratively brought up. stmmac_hw_setup() does
> > this:
> > 
> >         /* Enable the MAC Rx/Tx */
> >         stmmac_mac_set(priv, priv->ioaddr, true);
> > 
> > which sets the TE and RE bits in the MAC configuration register.
> > 
> > This means that if the network link is active, packets will start
> > to be received and will be placed into the receive descriptors.
> > 
> > We won't transmit anything because we won't be placing packets in
> > the transmit descriptors to be transmitted.
> > 
> > However, this in stmmac_hw_setup() is just wrong. Can it be deleted
> > as per the below?
> > Tested-by: Thierry Reding <treding@nvidia.com>
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index c2913f003fe6..d6e492f523f5 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3493,9 +3493,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
> >  		priv->hw->rx_csum = 0;
> >  	}
> >  
> > -	/* Enable the MAC Rx/Tx */
> > -	stmmac_mac_set(priv, priv->ioaddr, true);
> > -
> >  	/* Set the HW DMA mode and the COE */
> >  	stmmac_dma_operation_mode(priv);
> >  
> 
> A better fix here:
> https://lore.kernel.org/all/tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com/

I don't think that addresses the issue I highlighted above, since it's
still calling stmmac_mac_set(, true) in stmmac_hw_setup(), which I
believe to be wrong (as per my explanation above.)

However, the removal of setting GMAC_CONFIG_TE in the start_tx method
looks correct to me, because:

- the start_tx method is called via stmmac_start_tx(), which is only
  called from stmmac_start_tx_dma().

- stmmac_start_tx_dma() is called from:
  * stmmac_start_all_dma()
  * stmmac_tx_err()
  * stmmac_enable_tx_queue()

* stmmac_start_all_dma() is called from the end of stmmac_hw_setup(),
  but we've already called stmmac_mac_set(, true) both before and
  after the patch in the above URL, so is redundant.

  Incidentally, this brings the same set of questions I've stated in
  my initial email, and to me this is wrong.

* stmmac_tx_err() can only happen when we are already active (so
  transmission was already enabled).

* stmmac_enable_tx_queue() is called from stmmac_xdp_enable_pool(),
  which will only call this if netif_running() returns true,
  implying that the netdev is already adminstratively brought up
  and thus stmmac_hw_setup() will have been called.

  Again, this brings the same set of questions I've stated in my
  initial email, and to me this is wrong.


While looking at Simon's comment, he talks about stmmac_xdp_open(), so
I just looked at that, and found:

        netif_carrier_on(dev);

Then there's:

        netif_carrier_off(dev);

in stmmac_xdp_release().

These were introduced in commit ac746c8520d9 ("net: stmmac: enhance XDP
ZC driver level switching performance"), well after stmmac had been
converted to phylink. Phylink documents this:

16. Verify that the driver does not call::

        netif_carrier_on()
        netif_carrier_off()

    as these will interfere with phylink's tracking of the link state,
    and cause phylink to omit calls via the :c:func:`mac_link_up` and
    :c:func:`mac_link_down` methods.

So, the presence of these calls will mess up phylink, resulting in
mac_link_up() and/or mac_link_down() *NOT* being called at appropriate
times.

However, stmmac_xdp_(open|release)() doesn't seem to do anything to
bring the PHY or PCS up/down. This makes me wonder whether XDP support
in the stmmac driver is basically broken, or maybe the netdev needs to
already be administratively up (ip li set dev ... up). I don't know
XDP as I've never used it. If that is the case, then those
netif_carrier_*() calls need removing. Or - I say again - stmmac needs
to *stop* using phylink. It's one or the other. A network driver
either needs to use phylink properly or not use phylink *at* *all*.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
