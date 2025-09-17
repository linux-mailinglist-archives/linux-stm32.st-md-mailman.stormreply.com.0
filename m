Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79337B808E1
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Sep 2025 17:29:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F3F3C3F954;
	Wed, 17 Sep 2025 15:29:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 008EFC3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Sep 2025 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xtZeWx9KqJQHyw/RwePAF9k/RAwt4wluWSxKJcfUeCU=; b=cmLmfPjnvDCQAT+4j4CDP/CqP2
 f9se6tU2GSHHFs2/ZKmDFUJECu+41yF3IJuR3tgPqhxBrmeKO00vPY4wEJsBuiXrROerDtefj0e5L
 3uxX34vV3QCJgBKz9rY9eTWSUDFR3A6UMaWCOAgXwFljG9OFlctEbZIjvIbTo65S+IWe3uSk62+ta
 vJEZQOlRae+y+ZlL/MZhPc4wm2RWWSiHhmToiL8nbMTCFDwMv+WozI8us5n1RVKhj2iGYxVWXBrQs
 we6nbF3GePtbZP3AHiSy+yEMfMAIWSQagl/ymveh19RWWdpor5uHVFj4foxiGRFdSir85U72CO2OU
 OAY1GLZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57100 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uytq1-000000004nF-1c12;
 Wed, 17 Sep 2025 16:12:53 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uytpv-00000006H2x-196h; Wed, 17 Sep 2025 16:12:47 +0100
In-Reply-To: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uytpv-00000006H2x-196h@rmk-PC.armlinux.org.uk>
Date: Wed, 17 Sep 2025 16:12:47 +0100
Cc: Drew Fustini <fustini@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Minda Chen <minda.chen@starfivetech.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 10/10] net: stmmac: remove
	mac_interface
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

mac_interface has served little purpose, and has only caused confusion.
Now that we have cleaned up all platform glue drivers which should not
have been using mac_interface, there are no users remaining. Remove
mac_interface.

This results in the special dwmac specific "mac-mode" DT property
becoming redundant, and an in case, no DTS files in the kernel make use
of this property. Add a warning if the property is set, and it is
different from the "phy-mode".

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  5 +----
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  6 +++++-
 include/linux/stmmac.h                                | 11 +++--------
 5 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index dd82dc2189e9..592aa9d636e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,8 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	plat->mac_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Set default value for unicast filter entries */
 	plat->unicast_filter_entries = 1;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
index c0c44916f849..2562a6d036a2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
@@ -41,7 +41,6 @@ static int lpc18xx_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
-	plat_dat->mac_interface = PHY_INTERFACE_MODE_NA;
 	plat_dat->has_gmac = true;
 
 	reg = syscon_regmap_lookup_by_compatible("nxp,lpc1850-creg");
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a23017a886f3..d17820d9e7f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1118,10 +1118,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
  */
 static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
-	int interface = priv->plat->mac_interface;
-
-	if (interface == PHY_INTERFACE_MODE_NA)
-		interface = priv->plat->phy_interface;
+	int interface = priv->plat->phy_interface;
 
 	if (priv->dma_cap.pcs) {
 		if ((interface == PHY_INTERFACE_MODE_RGMII) ||
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index a3e077f225d1..712ef235f0f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -453,8 +453,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		return ERR_PTR(phy_mode);
 
 	plat->phy_interface = phy_mode;
+
 	rc = stmmac_of_get_mac_mode(np);
-	plat->mac_interface = rc < 0 ? plat->phy_interface : rc;
+	if (rc >= 0 && rc != phy_mode)
+		dev_warn(&pdev->dev,
+			 "\"mac-mode\" property used for %s but differs to \"phy-mode\" of %s, and will be ignored. Please report.\n",
+			 phy_modes(rc), phy_modes(phy_mode));
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
 	 * they are not converted to phylink. */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f14f34ec6d5e..fa1318bac06c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -190,8 +190,8 @@ struct plat_stmmacenet_data {
 	int bus_id;
 	int phy_addr;
 	/* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
-	 *                          ^            ^
-	 *                    mac_interface phy_interface
+	 *                                       ^
+	 *                                  phy_interface
 	 *
 	 * The Synopsys dwmac core only covers the MAC and an optional
 	 * integrated PCS. Where the integrated PCS is used with a SerDes,
@@ -208,12 +208,7 @@ struct plat_stmmacenet_data {
 	 * is used, this counts as "the rest of the SoC" in the above
 	 * paragraph.
 	 *
-	 * Thus, mac_interface is of little use inside the stmmac code;
-	 * please do not use unless there is a definite requirement, and
-	 * make sure to gain review feedback first.
-	 */
-	phy_interface_t mac_interface;
-	/* phy_interface is the PHY-side interface - the interface used by
+	 * phy_interface is the PHY-side interface - the interface used by
 	 * an attached PHY or SFP etc. This is equivalent to the interface
 	 * that phylink uses.
 	 */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
