Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B262516FC19
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 11:26:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F870C36B0B;
	Wed, 26 Feb 2020 10:26:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D00BDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvXRdKBQwWqpifCLpYCrvOQkEY6QAL9CbEYBlFLaB2Y=; b=KmVgZMAe1fxE5Zxf2Nc/df2ey4
 2APSIzPFVDdLPw8mC7f86bqQM/c5D3hECwLr91/OCaBMXKuXU7OETLtn4B8KAS3bXa3WQc0786zns
 sEDKiLsCh/nsIDeIqunmIMx4pcSY4NQ5Z+NqyyJa+a8m1C0IACnoe9+t4YVe5eWjbrItewvVGhX9f
 gYf/U+8ty23700lBYbzNDK+VcEuOoi98zHiUmmW17IVFBKh99vK/ErW1DfEU3uggDYZLZdjozZyFS
 4M7n23vNcTnrJ3xBiBvIyi1qbmpI6TZUm+09R1W5jxY00P3KaZvFx2nHdsxgKK9AMwb/879NluvDD
 E9xSSyRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41412 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trX-0006sO-Gc; Wed, 26 Feb 2020 10:24:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trQ-0003Gu-1G; Wed, 26 Feb 2020 10:24:12 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trQ-0003Gu-1G@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:24:12 +0000
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
Subject: [Linux-stm32] [PATCH net-next v2 7/8] net: mvneta: use resolved
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

Convert the Marvell mvneta ethernet driver to use the finalised link
parameters in mac_link_up() rather than the parameters in mac_config().

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 55 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 9af3f8d5b289..b22eeb5f8700 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -3830,13 +3830,9 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 	new_clk = gmac_clk & ~MVNETA_GMAC_1MS_CLOCK_ENABLE;
 	new_an = gmac_an & ~(MVNETA_GMAC_INBAND_AN_ENABLE |
 			     MVNETA_GMAC_INBAND_RESTART_AN |
-			     MVNETA_GMAC_CONFIG_MII_SPEED |
-			     MVNETA_GMAC_CONFIG_GMII_SPEED |
 			     MVNETA_GMAC_AN_SPEED_EN |
 			     MVNETA_GMAC_ADVERT_SYM_FLOW_CTRL |
-			     MVNETA_GMAC_CONFIG_FLOW_CTRL |
 			     MVNETA_GMAC_AN_FLOW_CTRL_EN |
-			     MVNETA_GMAC_CONFIG_FULL_DUPLEX |
 			     MVNETA_GMAC_AN_DUPLEX_EN);
 
 	/* Even though it might look weird, when we're configured in
@@ -3851,24 +3847,20 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 
 	if (phylink_test(state->advertising, Pause))
 		new_an |= MVNETA_GMAC_ADVERT_SYM_FLOW_CTRL;
-	if (state->pause & MLO_PAUSE_TXRX_MASK)
-		new_an |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
 
 	if (!phylink_autoneg_inband(mode)) {
-		/* Phy or fixed speed */
-		if (state->duplex)
-			new_an |= MVNETA_GMAC_CONFIG_FULL_DUPLEX;
-
-		if (state->speed == SPEED_1000 || state->speed == SPEED_2500)
-			new_an |= MVNETA_GMAC_CONFIG_GMII_SPEED;
-		else if (state->speed == SPEED_100)
-			new_an |= MVNETA_GMAC_CONFIG_MII_SPEED;
+		/* Phy or fixed speed - nothing to do, leave the
+		 * configured speed, duplex and flow control as-is.
+		 */
 	} else if (state->interface == PHY_INTERFACE_MODE_SGMII) {
 		/* SGMII mode receives the state from the PHY */
 		new_ctrl2 |= MVNETA_GMAC2_INBAND_AN_ENABLE;
 		new_clk |= MVNETA_GMAC_1MS_CLOCK_ENABLE;
 		new_an = (new_an & ~(MVNETA_GMAC_FORCE_LINK_DOWN |
-				     MVNETA_GMAC_FORCE_LINK_PASS)) |
+				     MVNETA_GMAC_FORCE_LINK_PASS |
+				     MVNETA_GMAC_CONFIG_MII_SPEED |
+				     MVNETA_GMAC_CONFIG_GMII_SPEED |
+				     MVNETA_GMAC_CONFIG_FULL_DUPLEX)) |
 			 MVNETA_GMAC_INBAND_AN_ENABLE |
 			 MVNETA_GMAC_AN_SPEED_EN |
 			 MVNETA_GMAC_AN_DUPLEX_EN;
@@ -3877,7 +3869,8 @@ static void mvneta_mac_config(struct phylink_config *config, unsigned int mode,
 		new_ctrl0 |= MVNETA_GMAC0_PORT_1000BASE_X;
 		new_clk |= MVNETA_GMAC_1MS_CLOCK_ENABLE;
 		new_an = (new_an & ~(MVNETA_GMAC_FORCE_LINK_DOWN |
-				     MVNETA_GMAC_FORCE_LINK_PASS)) |
+				     MVNETA_GMAC_FORCE_LINK_PASS |
+				     MVNETA_GMAC_CONFIG_MII_SPEED)) |
 			 MVNETA_GMAC_INBAND_AN_ENABLE |
 			 MVNETA_GMAC_CONFIG_GMII_SPEED |
 			 /* The MAC only supports FD mode */
@@ -3977,8 +3970,36 @@ static void mvneta_mac_link_up(struct phylink_config *config,
 
 	if (!phylink_autoneg_inband(mode)) {
 		val = mvreg_read(pp, MVNETA_GMAC_AUTONEG_CONFIG);
-		val &= ~MVNETA_GMAC_FORCE_LINK_DOWN;
+		val &= ~(MVNETA_GMAC_FORCE_LINK_DOWN |
+			 MVNETA_GMAC_CONFIG_MII_SPEED |
+			 MVNETA_GMAC_CONFIG_GMII_SPEED |
+			 MVNETA_GMAC_CONFIG_FLOW_CTRL |
+			 MVNETA_GMAC_CONFIG_FULL_DUPLEX);
 		val |= MVNETA_GMAC_FORCE_LINK_PASS;
+
+		if (speed == SPEED_1000 || speed == SPEED_2500)
+			val |= MVNETA_GMAC_CONFIG_GMII_SPEED;
+		else if (speed == SPEED_100)
+			val |= MVNETA_GMAC_CONFIG_MII_SPEED;
+
+		if (duplex == DUPLEX_FULL)
+			val |= MVNETA_GMAC_CONFIG_FULL_DUPLEX;
+
+		if (tx_pause || rx_pause)
+			val |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
+		mvreg_write(pp, MVNETA_GMAC_AUTONEG_CONFIG, val);
+	} else {
+		/* When inband doesn't cover flow control or flow control is
+		 * disabled, we need to manually configure it. This bit will
+		 * only have effect if MVNETA_GMAC_AN_FLOW_CTRL_EN is unset.
+		 */
+		val = mvreg_read(pp, MVNETA_GMAC_AUTONEG_CONFIG);
+		val &= ~MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
+		if (tx_pause || rx_pause)
+			val |= MVNETA_GMAC_CONFIG_FLOW_CTRL;
+
 		mvreg_write(pp, MVNETA_GMAC_AUTONEG_CONFIG, val);
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
