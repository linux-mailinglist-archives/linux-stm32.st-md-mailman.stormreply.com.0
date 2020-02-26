Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EDA16FC11
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 11:26:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B8B8C36B0B;
	Wed, 26 Feb 2020 10:26:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76836C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3VDUs9GECL3V7Id9j1fk72SoO2qfr/Dzvti38P06AQ=; b=J8FV8fyS1ttsVp0GQ36eDoPiNb
 Mes6da/zElmMSd5Zk9n+yzS1yO4cqVw4+gRRNg09hoLP9wjPrKamVbHPCxfPaHKNRR2dp6CJjY5OX
 Q6fifb4sOQyRVQ82QXKN7Wy0HvHn8F0wGzCLlgD+NmY6TKY8RxHpBIJUYIEfNjg5PVDlTEdLOakdN
 FrRicJVTheCEahj18Tc9/Zjbv6wjhlgIgCB30GNt7ljOLe5n2HNUBQTmrqWhpCfY1mZD62XlFMG66
 g6Tn5iKBkZ3Kt5S91J4Ax2gt7i7Sipci2/b8JpZgwCtRh7rpu6VO3jwkCg10eAJQwWj+09bmgeITd
 /AW0XIVA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:53870 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trD-0006ry-Vp; Wed, 26 Feb 2020 10:24:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trA-0003GY-N1; Wed, 26 Feb 2020 10:23:56 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trA-0003GY-N1@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:23:56 +0000
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>
Subject: [Linux-stm32] [PATCH net-next v2 4/8] net: axienet: use resolved
 link config in mac_link_up()
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

Convert the Xilinx AXI ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 197740781157..c2f4c5ca2e80 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1440,6 +1440,22 @@ static void axienet_mac_an_restart(struct phylink_config *config)
 
 static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 			       const struct phylink_link_state *state)
+{
+	/* nothing meaningful to do */
+}
+
+static void axienet_mac_link_down(struct phylink_config *config,
+				  unsigned int mode,
+				  phy_interface_t interface)
+{
+	/* nothing meaningful to do */
+}
+
+static void axienet_mac_link_up(struct phylink_config *config,
+				struct phy_device *phy,
+				unsigned int mode, phy_interface_t interface,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
 {
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct axienet_local *lp = netdev_priv(ndev);
@@ -1448,7 +1464,7 @@ static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 	emmc_reg = axienet_ior(lp, XAE_EMMC_OFFSET);
 	emmc_reg &= ~XAE_EMMC_LINKSPEED_MASK;
 
-	switch (state->speed) {
+	switch (speed) {
 	case SPEED_1000:
 		emmc_reg |= XAE_EMMC_LINKSPD_1000;
 		break;
@@ -1467,33 +1483,17 @@ static void axienet_mac_config(struct phylink_config *config, unsigned int mode,
 	axienet_iow(lp, XAE_EMMC_OFFSET, emmc_reg);
 
 	fcc_reg = axienet_ior(lp, XAE_FCC_OFFSET);
-	if (state->pause & MLO_PAUSE_TX)
+	if (tx_pause)
 		fcc_reg |= XAE_FCC_FCTX_MASK;
 	else
 		fcc_reg &= ~XAE_FCC_FCTX_MASK;
-	if (state->pause & MLO_PAUSE_RX)
+	if (rx_pause)
 		fcc_reg |= XAE_FCC_FCRX_MASK;
 	else
 		fcc_reg &= ~XAE_FCC_FCRX_MASK;
 	axienet_iow(lp, XAE_FCC_OFFSET, fcc_reg);
 }
 
-static void axienet_mac_link_down(struct phylink_config *config,
-				  unsigned int mode,
-				  phy_interface_t interface)
-{
-	/* nothing meaningful to do */
-}
-
-static void axienet_mac_link_up(struct phylink_config *config,
-				struct phy_device *phy,
-				unsigned int mode, phy_interface_t interface,
-				int speed, int duplex,
-				bool tx_pause, bool rx_pause)
-{
-	/* nothing meaningful to do */
-}
-
 static const struct phylink_mac_ops axienet_phylink_ops = {
 	.validate = axienet_validate,
 	.mac_pcs_get_state = axienet_mac_pcs_get_state,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
