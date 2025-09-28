Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9317BA6D17
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 11:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72510C424B0;
	Sun, 28 Sep 2025 09:21:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035BAC3FAE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PkzEXKrk7RiVwlShBSl0OJhiBXrJm3zMeL24zlXLNiM=; b=bNxEvZ+OfTskC0HV0M6CYZUSNr
 1D4LGOEusWj2nf3QjeTrWd7ogPP2CRG7W2Y9rczrUvXDmnZyhFw+2nT1R2CWCHxrpY/i4V/npQnam
 8jdWPLSKyvXtOiHlQCKaGkeC1UuEBgL4Y2BKWhIV4BNPqG7l9NX5o5qMjjQDj0J5bRtZq4hjmGo/u
 QFxKWY7BOQD7gkOnP1H3B3Ivw1u4+CSjFSzQMHjJ59kIosRqukAejVwYtEa9BhhdXEGvDS/D23zmy
 RyBP8Ip2cBUH5WDD0Xp/Jgtl6Jk23rcsmc/y/0x5xRocSfytMd/bZM8lVr5JY4500f2lGFHbqDTD1
 tSTfbG7A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51472 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v2naD-000000005GR-1Ye1;
 Sun, 28 Sep 2025 10:20:41 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v2na5-00000007oCw-26Z7; Sun, 28 Sep 2025 10:20:33 +0100
In-Reply-To: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
References: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v2na5-00000007oCw-26Z7@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 10:20:33 +0100
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Kees Cook <kees@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Huacai Chen <chenhuacai@kernel.org>, Furong Xu <0x1207@gmail.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shenwei Wang <shenwei.wang@nxp.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, linux-arm-msm@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Alexis Lothor__ <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [Linux-stm32] [PATCH RFC net-next v2 06/19] net: stmmac: remove
 hw->ps xxx_core_init() hardware setup
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

After a lot of digging, it seems that the oddly named hw->ps member is
all about configuring the core for reverse SGMII. This member is set to
one of 0, SPEED_10, SPEED_100 or SPEED_1000 depending on
priv->plat->mac_port_sel_speed. On DT systems, this comes from the
"snps,ps-speed" DT property.

When set to a non-zero value, it:

1. Configures the MAC at initialisation time to operate at a specific
   speed. However, this will be overwritten by mac_link_up() when the
   link comes up (e.g. with the fixed-link parameters.)

   Note that dwxgmac2 wants to also support SPEED_2500 and SPEED_10000,
   but both these values are impossible.

2. It _incorrectly_ enables the transmitter (GMAC_CONFIG_TE) which
   makes no sense, rather than enabling the "transmit configuration"
   bit (GMAC_CONFIG_TC). Likely a typo.

3. It configures the SGMII rate adapter layer to retrieve its speed
   setting from the MAC configuration register rather than the PHY.

There are two ways forward here:

a) fixing (2) so that we set GMAC_CONFIG_TC. However, we have platform
   that set the "snps,ps-speed" property and that work today. Fixing
   this will cause the RGMII, SGMII or SMII inband configuration to be
   transmitted, which will be a functional change which could cause a
   regression.

b) ripping out (1) and (2) as they are ineffective. This also has the
   possibility of regressions, but the patch author believes this risk
   is much lower than (a).

Therefore, this commit takes the approach in (b).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 23 +++--------------
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 24 +++---------------
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 25 ++-----------------
 3 files changed, 8 insertions(+), 64 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 5c653be3d453..d35db8958be1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -26,35 +26,18 @@ static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONTROL);
 	int mtu = dev->mtu;
+	u32 value;
 
 	/* Configure GMAC core */
-	value |= GMAC_CORE_INIT;
+	value = readl(ioaddr + GMAC_CONTROL);
 
 	if (mtu > 1500)
 		value |= GMAC_CONTROL_2K;
 	if (mtu > 2000)
 		value |= GMAC_CONTROL_JE;
 
-	if (hw->ps) {
-		value |= GMAC_CONTROL_TE;
-
-		value &= ~hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONTROL);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONTROL);
 
 	/* Mask GMAC interrupts */
 	value = GMAC_INT_DEFAULT_MASK;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 21e4461db937..d855ab6b9145 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -27,29 +27,11 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	void __iomem *ioaddr = hw->pcsr;
-	u32 value = readl(ioaddr + GMAC_CONFIG);
 	unsigned long clk_rate;
+	u32 value;
 
-	value |= GMAC_CORE_INIT;
-
-	if (hw->ps) {
-		value |= GMAC_CONFIG_TE;
-
-		value &= hw->link.speed_mask;
-		switch (hw->ps) {
-		case SPEED_1000:
-			value |= hw->link.speed1000;
-			break;
-		case SPEED_100:
-			value |= hw->link.speed100;
-			break;
-		case SPEED_10:
-			value |= hw->link.speed10;
-			break;
-		}
-	}
-
-	writel(value, ioaddr + GMAC_CONFIG);
+	value = readl(ioaddr + GMAC_CONFIG);
+	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
 
 	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 00e929bf280b..0430af27da40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -23,29 +23,8 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	tx = readl(ioaddr + XGMAC_TX_CONFIG);
 	rx = readl(ioaddr + XGMAC_RX_CONFIG);
 
-	tx |= XGMAC_CORE_INIT_TX;
-	rx |= XGMAC_CORE_INIT_RX;
-
-	if (hw->ps) {
-		tx |= XGMAC_CONFIG_TE;
-		tx &= ~hw->link.speed_mask;
-
-		switch (hw->ps) {
-		case SPEED_10000:
-			tx |= hw->link.xgmii.speed10000;
-			break;
-		case SPEED_2500:
-			tx |= hw->link.speed2500;
-			break;
-		case SPEED_1000:
-		default:
-			tx |= hw->link.speed1000;
-			break;
-		}
-	}
-
-	writel(tx, ioaddr + XGMAC_TX_CONFIG);
-	writel(rx, ioaddr + XGMAC_RX_CONFIG);
+	writel(tx | XGMAC_CORE_INIT_TX, ioaddr + XGMAC_TX_CONFIG);
+	writel(rx | XGMAC_CORE_INIT_RX, ioaddr + XGMAC_RX_CONFIG);
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
