Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2ABA8B353
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 10:20:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D49ADC78F83;
	Wed, 16 Apr 2025 08:20:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E0CAC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=URwBuCbS6/neY6AV6CFvJFFAf/PObTEbrh2Q/19p6+0=; b=Dhx5jdtUk0jK2Karpqm4mt9/dP
 ozAsmNP8yHltiUVF1HqvFV+DJ1hNVy7pSEa9SRoRCOjoLJE+rjKQw5Kvuot4psTRt9Jv7ACkmJ9dp
 tqg87Jfh2arIdiureSuR7lKJe6u/SE3S4y1taSx61dIO4TdudScqo4Y5d7lRy5Bebcj65hyxU58Z1
 WvUbymB5Sgu6zqpQBb7DWuqop1+RTIG57QACukwxxHK9TiW7VkuzL640shud4iS5blZGWTtu1f1GB
 U1OQVCEVbH5SvaFawlZi1m/SzLGIgcEgT8NHKh7nsLAqAxplleH4ru+9ijTyJTwAwovAhwBPdP1G6
 FuO3O1ew==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38076)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4y0i-0000uI-1K;
 Wed, 16 Apr 2025 09:20:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4y0d-0001FI-0V;
 Wed, 16 Apr 2025 09:20:39 +0100
Date: Wed, 16 Apr 2025 09:20:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z_9oVrAOnInrhb6z@shell.armlinux.org.uk>
References: <Z_6JaPBiGu_RB4xN@shell.armlinux.org.uk>
 <20250416095343.1820272f@fedora.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416095343.1820272f@fedora.home>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: socfpga: fix
 init ordering and cleanups
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

On Wed, Apr 16, 2025 at 09:53:43AM +0200, Maxime Chevallier wrote:
> I've given this a try and unfortunately :

Great, someone with hardware, and who responds to patches! :)

> This is only to get the phymode, maybe we should do like dwmac_imx
> and store a pointer to plat_dat into struct dwmac_socfpga, so that we
> can get it back in dwmac_init ? I've tried with the patch below and it
> does solve the issue, but maybe you have a better approach.

Yes, but I don't think we need such a big patch:

 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 8e6d780669b9..59f90b123c5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -50,6 +50,7 @@ struct socfpga_dwmac {
 	u32	reg_offset;
 	u32	reg_shift;
 	struct	device *dev;
+	struct plat_stmmacenet_data *plat_dat;
 	struct regmap *sys_mgr_base_addr;
 	struct reset_control *stmmac_rst;
 	struct reset_control *stmmac_ocp_rst;
@@ -233,10 +234,7 @@ static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *
 
 static int socfpga_get_plat_phymode(struct socfpga_dwmac *dwmac)
 {
-	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-
-	return priv->plat->mac_interface;
+	return dwmac->plat_dat->mac_interface;
 }
 
 static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
@@ -490,6 +488,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	 */
 	dwmac->stmmac_rst = plat_dat->stmmac_rst;
 	dwmac->ops = ops;
+	dwmac->plat_dat = plat_dat;
 
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
