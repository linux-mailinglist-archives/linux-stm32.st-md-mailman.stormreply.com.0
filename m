Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4516FC14
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 11:26:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A381C36B0B;
	Wed, 26 Feb 2020 10:26:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B36BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MaXmveAEbocIrvzuxQzVYXJgzwA3f1xZm8m+avj8bxY=; b=hPTGRzY1xDXXmPUrCqSVc+0YCx
 smrhkuvCyTZ0SxSWcxZHeeVThrFwBORyq6kWAGVgQQO0pWPGDSbmZsLlytC+CEz1N+XgnKHwPaXx4
 tlzkMBszGiEuecymD85kj+vflZvU4MbtdsdIwcQQ7a0OckiyYl2MKryEeUrIiLvjILAzVq2xK+GL1
 AAp4trnP0DhvzD4uMaYYqF6jGJXigmF2IgDb0/Bjdi+sbv5ViwInQSp1OGx7VDRXzVvd4Wlos3Yk/
 3KnHvconU9mf3fBnui+w/c6F7P+ZHgC7BDOxFUONzNBFyuSc7a8Oj+VTMVc9VCug6/FZKGEwPzV1r
 ryRxn0gw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:33272 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trK-0006sC-T1; Wed, 26 Feb 2020 10:24:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j6trF-0003Gg-QH; Wed, 26 Feb 2020 10:24:01 +0000
In-Reply-To: <20200226102312.GX25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j6trF-0003Gg-QH@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Feb 2020 10:24:01 +0000
Cc: linux-doc@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: [Linux-stm32] [PATCH net-next v2 5/8] net: dpaa2-mac: use resolved
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

Convert the DPAA2 ethernet driver to use the finalised link parameters
in mac_link_up() rather than the parameters in mac_config(), which are
more suited to the needs of the DPAA2 MC firmware than those available
via mac_config().

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  | 54 +++++++++++--------
 .../net/ethernet/freescale/dpaa2/dpaa2-mac.h  |  1 +
 2 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index 3a75c5b58f95..3ee236c5fc37 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -123,35 +123,16 @@ static void dpaa2_mac_config(struct phylink_config *config, unsigned int mode,
 	struct dpmac_link_state *dpmac_state = &mac->state;
 	int err;
 
-	if (state->speed != SPEED_UNKNOWN)
-		dpmac_state->rate = state->speed;
-
-	if (state->duplex != DUPLEX_UNKNOWN) {
-		if (!state->duplex)
-			dpmac_state->options |= DPMAC_LINK_OPT_HALF_DUPLEX;
-		else
-			dpmac_state->options &= ~DPMAC_LINK_OPT_HALF_DUPLEX;
-	}
-
 	if (state->an_enabled)
 		dpmac_state->options |= DPMAC_LINK_OPT_AUTONEG;
 	else
 		dpmac_state->options &= ~DPMAC_LINK_OPT_AUTONEG;
 
-	if (state->pause & MLO_PAUSE_RX)
-		dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
-	else
-		dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
-
-	if (!!(state->pause & MLO_PAUSE_RX) ^ !!(state->pause & MLO_PAUSE_TX))
-		dpmac_state->options |= DPMAC_LINK_OPT_ASYM_PAUSE;
-	else
-		dpmac_state->options &= ~DPMAC_LINK_OPT_ASYM_PAUSE;
-
 	err = dpmac_set_link_state(mac->mc_io, 0,
 				   mac->mc_dev->mc_handle, dpmac_state);
 	if (err)
-		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n", err);
+		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() = %d\n",
+			   __func__, err);
 }
 
 static void dpaa2_mac_link_up(struct phylink_config *config,
@@ -165,10 +146,37 @@ static void dpaa2_mac_link_up(struct phylink_config *config,
 	int err;
 
 	dpmac_state->up = 1;
+
+	if (mac->if_link_type == DPMAC_LINK_TYPE_PHY) {
+		/* If the DPMAC is configured for PHY mode, we need
+		 * to pass the link parameters to the MC firmware.
+		 */
+		dpmac_state->rate = speed;
+
+		if (duplex == DUPLEX_HALF)
+			dpmac_state->options |= DPMAC_LINK_OPT_HALF_DUPLEX;
+		else if (duplex == DUPLEX_FULL)
+			dpmac_state->options &= ~DPMAC_LINK_OPT_HALF_DUPLEX;
+
+		/* This is lossy; the firmware really should take the pause
+		 * enablement status rather than pause/asym pause status.
+		 */
+		if (rx_pause)
+			dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
+		else
+			dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
+
+		if (rx_pause ^ tx_pause)
+			dpmac_state->options |= DPMAC_LINK_OPT_ASYM_PAUSE;
+		else
+			dpmac_state->options &= ~DPMAC_LINK_OPT_ASYM_PAUSE;
+	}
+
 	err = dpmac_set_link_state(mac->mc_io, 0,
 				   mac->mc_dev->mc_handle, dpmac_state);
 	if (err)
-		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n", err);
+		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() = %d\n",
+			   __func__, err);
 }
 
 static void dpaa2_mac_link_down(struct phylink_config *config,
@@ -241,6 +249,8 @@ int dpaa2_mac_connect(struct dpaa2_mac *mac)
 		goto err_close_dpmac;
 	}
 
+	mac->if_link_type = attr.link_type;
+
 	dpmac_node = dpaa2_mac_get_node(attr.id);
 	if (!dpmac_node) {
 		netdev_err(net_dev, "No dpmac@%d node found.\n", attr.id);
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
index 4da8079b9155..2130d9c7d40e 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
@@ -20,6 +20,7 @@ struct dpaa2_mac {
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
 	phy_interface_t if_mode;
+	enum dpmac_link_type if_link_type;
 };
 
 bool dpaa2_mac_is_type_fixed(struct fsl_mc_device *dpmac_dev,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
