Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07578C4EB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 15:11:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C2B4C6A60C;
	Tue, 29 Aug 2023 13:11:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BE9AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rcm8iFhg+0c6WYsWVIm3HUfcuIiftEfCHRbE95z0OwU=; b=qFpDv/O3VPuF6e9/9goDGLLs3B
 2ThJt0YRs/oaGuIj4mtAZex2qlm7Q/Tsh3IgAIiasysaOxyldJGetCvTUlaCB+wuydP1kadMNVlUE
 g6EtuFIHAnJMAnmp9jQM/BVDcvZtgvCi1pd9j3R4tEaawLasYVE2d3oLr+JISjVENDlP36XoPVR4Q
 APlO24Ei/wwIoD5l5dzYCKSO6FNAJyhsnrYk7ooYIO0hydN+r9fH9tZyAtoWNH+q8ioHb24nwQpmt
 R3/pLtsKgG4oiVWawF6F6wWB+a9AaAEQs5DGpyCy1ggzXqtMzvVPadFjC7l5ZebgtLCgGGM/y9snU
 qAqCdsBA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51830)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qayUa-0000Tm-2N;
 Tue, 29 Aug 2023 14:10:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qayUS-0004g8-6F; Tue, 29 Aug 2023 14:10:40 +0100
Date: Tue, 29 Aug 2023 14:10:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Message-ID: <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
 <12274852.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12274852.O9o76ZdvQC@steina-w>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Feiyang Chen <chenfeiyang@loongson.cn>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clarify difference
 between "interface" and "phy_interface"
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

On Tue, Aug 29, 2023 at 02:38:33PM +0200, Alexander Stein wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> > ff330423ee66..35f4b1484029 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -419,9 +419,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8
> > *mac) return ERR_PTR(phy_mode);
> > 
> >  	plat->phy_interface = phy_mode;
> > -	plat->interface = stmmac_of_get_mac_mode(np);
> > -	if (plat->interface < 0)
> > -		plat->interface = plat->phy_interface;
> > +	plat->mac_interface = stmmac_of_get_mac_mode(np);
> > +	if (plat->mac_interface < 0)
> 
> This check is never true as mac_interface is now an unsigned enum 
> (phy_interface_t). Thus mac_interface is not set to phy_interface resulting in 
> an invalid mac_interface. My platform (arch/arm64/boot/dts/freescale/imx8mp-
> tqma8mpql-mba8mpxl.dts) fails to probe now.

Thanks for catching that. Does this patch fix it for you?

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 231152ee5a32..0451d2c2aa43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -420,9 +420,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		return ERR_PTR(phy_mode);
 
 	plat->phy_interface = phy_mode;
-	plat->interface = stmmac_of_get_mac_mode(np);
-	if (plat->interface < 0)
-		plat->interface = plat->phy_interface;
+
+	rc = stmmac_of_get_mac_mode(np);
+	plat->interface = rc < 0 ? plat->phy_interface : rc;
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
