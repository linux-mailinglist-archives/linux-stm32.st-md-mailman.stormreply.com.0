Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA3619E39
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 18:13:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD299C65043;
	Fri,  4 Nov 2022 17:13:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2649EC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5dZbdXu3R3mbhUpBVZJf8njJvsSXLtFO2DXcA1zzYw8=; b=zUuF6BGmmCI+OxUNr4Tz5sqZZ0
 MjQa7bIUslFMEqwVd5W97nm1cgDhSEMo7uFgNeIDVzwPkqotmvHf82XsKkEYJQB88zqbDHLEKMS+R
 dLr97dZeMkGeQYU9uu+SYjk7zYPl/yjh2vKIcRRggx1qgiUr09TuI5e0tvnVuitM8ppH7snRm8/fs
 /PIca07bgsHIdWqr1Nm5PQfh/0/BBibgxFqPscLE5WqIvjvFePTUQULP/uTt1N7DQEAbvH/pc7Bjr
 i5P/qad46UgDDgXtjuL6oTyMrutOnrnoJWg5vRlcD4bRrXEUiGvFVbLjA/gvYtqezotpnWDs5+NEg
 dLLvqYkQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48216 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1or0Fa-0007to-2m; Fri, 04 Nov 2022 17:13:02 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1or0FZ-001tRa-DI; Fri, 04 Nov 2022 17:13:01 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Joyce Ooi <joyce.ooi@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcin Wojtas <mw@semihalf.com>, Taras Chornyi <tchornyi@marvell.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Nov 2022 17:13:01 +0000
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: remove explicit
 phylink_generic_validate() references
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

Virtually all conventional network drivers are now converted to use
phylink_generic_validate() - only DSA drivers and fman_memac remain,
so lets remove the necessity for network drivers to explicitly set
this member, and default to phylink_generic_validate() when unset.
This is possible as .validate must currently be set.

Any remaining instances that have not been addressed by this patch can
be fixed up later.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/altera/altera_tse_main.c            | 1 -
 drivers/net/ethernet/atheros/ag71xx.c                    | 1 -
 drivers/net/ethernet/cadence/macb_main.c                 | 1 -
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c         | 1 -
 drivers/net/ethernet/freescale/enetc/enetc_pf.c          | 1 -
 drivers/net/ethernet/freescale/fman/fman_dtsec.c         | 1 -
 drivers/net/ethernet/freescale/fman/fman_tgec.c          | 1 -
 drivers/net/ethernet/marvell/mvneta.c                    | 1 -
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c          | 1 -
 drivers/net/ethernet/marvell/prestera/prestera_main.c    | 1 -
 drivers/net/ethernet/mediatek/mtk_eth_soc.c              | 1 -
 drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c | 1 -
 drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c   | 1 -
 drivers/net/ethernet/mscc/ocelot_net.c                   | 1 -
 drivers/net/ethernet/renesas/rswitch.c                   | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c        | 1 -
 drivers/net/ethernet/ti/am65-cpsw-nuss.c                 | 1 -
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c        | 1 -
 drivers/net/phy/phylink.c                                | 5 ++++-
 drivers/net/usb/asix_devices.c                           | 1 -
 include/linux/phylink.h                                  | 5 +++++
 21 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 7633b227b2ca..28b5cae60eb5 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1095,7 +1095,6 @@ static struct phylink_pcs *alt_tse_select_pcs(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops alt_tse_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_an_restart = alt_tse_mac_an_restart,
 	.mac_config = alt_tse_mac_config,
 	.mac_link_down = alt_tse_mac_link_down,
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index cc932b3cf873..a5de1bd8538c 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1086,7 +1086,6 @@ static void ag71xx_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops ag71xx_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_config = ag71xx_mac_config,
 	.mac_link_down = ag71xx_mac_link_down,
 	.mac_link_up = ag71xx_mac_link_up,
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 4f63f1ba3161..5d618814bb12 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -742,7 +742,6 @@ static struct phylink_pcs *macb_mac_select_pcs(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops macb_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = macb_mac_select_pcs,
 	.mac_config = macb_mac_config,
 	.mac_link_down = macb_mac_link_down,
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index 2bbab28f763d..51c9da8e1be2 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -236,7 +236,6 @@ static void dpaa2_mac_link_down(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops dpaa2_mac_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = dpaa2_mac_select_pcs,
 	.mac_config = dpaa2_mac_config,
 	.mac_link_up = dpaa2_mac_link_up,
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index bdf94335ee99..9f6c4f5c0a6c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -1111,7 +1111,6 @@ static void enetc_pl_mac_link_down(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops enetc_mac_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = enetc_pl_mac_select_pcs,
 	.mac_config = enetc_pl_mac_config,
 	.mac_link_up = enetc_pl_mac_link_up,
diff --git a/drivers/net/ethernet/freescale/fman/fman_dtsec.c b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
index 3c87820ca202..d00bae15a901 100644
--- a/drivers/net/ethernet/freescale/fman/fman_dtsec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_dtsec.c
@@ -986,7 +986,6 @@ static void dtsec_link_down(struct phylink_config *config, unsigned int mode,
 }
 
 static const struct phylink_mac_ops dtsec_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = dtsec_select_pcs,
 	.mac_config = dtsec_mac_config,
 	.mac_link_up = dtsec_link_up,
diff --git a/drivers/net/ethernet/freescale/fman/fman_tgec.c b/drivers/net/ethernet/freescale/fman/fman_tgec.c
index c265b7f19a4d..c2261d26db5b 100644
--- a/drivers/net/ethernet/freescale/fman/fman_tgec.c
+++ b/drivers/net/ethernet/freescale/fman/fman_tgec.c
@@ -469,7 +469,6 @@ static void tgec_link_down(struct phylink_config *config, unsigned int mode,
 }
 
 static const struct phylink_mac_ops tgec_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_config = tgec_mac_config,
 	.mac_link_up = tgec_link_up,
 	.mac_link_down = tgec_link_down,
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 05ff3c58087e..c2cb98d24f5c 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4228,7 +4228,6 @@ static void mvneta_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops mvneta_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = mvneta_mac_select_pcs,
 	.mac_prepare = mvneta_mac_prepare,
 	.mac_config = mvneta_mac_config,
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 116e53172072..d98f7e9a480e 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -6603,7 +6603,6 @@ static void mvpp2_mac_link_down(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops mvpp2_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = mvpp2_select_pcs,
 	.mac_prepare = mvpp2_mac_prepare,
 	.mac_config = mvpp2_mac_config,
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
index edbdda8f958d..f8deaee84398 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
@@ -360,7 +360,6 @@ static void prestera_pcs_an_restart(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_mac_ops prestera_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = prestera_mac_select_pcs,
 	.mac_config = prestera_mac_config,
 	.mac_link_down = prestera_mac_link_down,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 789268b15106..1cf76fd7afbc 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -653,7 +653,6 @@ static void mtk_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops mtk_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = mtk_mac_select_pcs,
 	.mac_pcs_get_state = mtk_mac_pcs_get_state,
 	.mac_config = mtk_mac_config,
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
index f9579a2ae676..c5f9803e6e63 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_phylink.c
@@ -124,7 +124,6 @@ static void lan966x_pcs_aneg_restart(struct phylink_pcs *pcs)
 }
 
 const struct phylink_mac_ops lan966x_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = lan966x_phylink_mac_select,
 	.mac_config = lan966x_phylink_mac_config,
 	.mac_prepare = lan966x_phylink_mac_prepare,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
index 830da0e5ff27..bb97d27a1da4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
@@ -138,7 +138,6 @@ const struct phylink_pcs_ops sparx5_phylink_pcs_ops = {
 };
 
 const struct phylink_mac_ops sparx5_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = sparx5_phylink_mac_select_pcs,
 	.mac_config = sparx5_phylink_mac_config,
 	.mac_link_down = sparx5_phylink_mac_link_down,
diff --git a/drivers/net/ethernet/mscc/ocelot_net.c b/drivers/net/ethernet/mscc/ocelot_net.c
index f50dada2bb8e..ca4bde861397 100644
--- a/drivers/net/ethernet/mscc/ocelot_net.c
+++ b/drivers/net/ethernet/mscc/ocelot_net.c
@@ -1727,7 +1727,6 @@ static void vsc7514_phylink_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops ocelot_phylink_ops = {
-	.validate		= phylink_generic_validate,
 	.mac_config		= vsc7514_phylink_mac_config,
 	.mac_link_down		= vsc7514_phylink_mac_link_down,
 	.mac_link_up		= vsc7514_phylink_mac_link_up,
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 20df2020d3e5..81c390bf7a35 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1190,7 +1190,6 @@ static void rswitch_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops rswitch_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_config = rswitch_mac_config,
 	.mac_link_down = rswitch_mac_link_down,
 	.mac_link_up = rswitch_mac_link_up,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8273e6a175c8..2fea8785aaf4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1080,7 +1080,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 0dbdce4dc077..1062d60d7a46 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1471,7 +1471,6 @@ static void am65_cpsw_nuss_mac_link_up(struct phylink_config *config, struct phy
 }
 
 static const struct phylink_mac_ops am65_cpsw_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_config = am65_cpsw_nuss_mac_config,
 	.mac_link_down = am65_cpsw_nuss_mac_link_down,
 	.mac_link_up = am65_cpsw_nuss_mac_link_up,
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 441e1058104f..205903a1aee4 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1736,7 +1736,6 @@ static void axienet_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops axienet_phylink_ops = {
-	.validate = phylink_generic_validate,
 	.mac_select_pcs = axienet_mac_select_pcs,
 	.mac_config = axienet_mac_config,
 	.mac_link_down = axienet_mac_link_down,
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 88f60e98b760..25feab1802ee 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -649,7 +649,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	}
 
 	/* Then validate the link parameters with the MAC */
-	pl->mac_ops->validate(pl->config, supported, state);
+	if (pl->mac_ops->validate)
+		pl->mac_ops->validate(pl->config, supported, state);
+	else
+		phylink_generic_validate(pl->config, supported, state);
 
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 02941d97d034..0fe3773c5bca 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -773,7 +773,6 @@ static void ax88772_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops ax88772_phylink_mac_ops = {
-	.validate = phylink_generic_validate,
 	.mac_config = ax88772_mac_config,
 	.mac_link_down = ax88772_mac_link_down,
 	.mac_link_up = ax88772_mac_link_up,
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 1df3e5e316e8..c492c26202b5 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -207,6 +207,11 @@ struct phylink_mac_ops {
  *
  * If the @state->interface mode is not supported, then the @supported
  * mask must be cleared.
+ *
+ * This member is optional; if not set, the generic validator will be
+ * used making use of @config->mac_capabilities and
+ * @config->supported_interfaces to determine which link modes are
+ * supported.
  */
 void validate(struct phylink_config *config, unsigned long *supported,
 	      struct phylink_link_state *state);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
