Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2437855925
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 04:07:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6147C62EFE;
	Thu, 15 Feb 2024 03:07:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C5EBCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707966476; x=1739502476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v3YcIHzlZFo38gIzLCM5tNLAmbkmNuWw2PgAfJFV8dc=;
 b=SYdP/r3iIkR6empDjHErL4ujIldYLQt4KGuaFxzED7vUtM4HOMTjOV+e
 eIw8QzJFZPq/RyXmNasadcf/2XhEe+b4VgbTHg3aJffpPdfyLSGXJyFHR
 u5Wr9DwRCJ076gUAU7uTjxvSQNLzH7ntkgbE3AAXPGznphzFh9n8DMavZ
 pquzPTGg27Qy1dTB0UH0IpW8IY2vXRX7mz1QY8PY6NH6Wn9xJpzuhW52O
 qPuLWuF736vdcLVl3m6iF9GidS3gGg4WcZmFEfl8KaoYL0hSJCrNR2WRd
 7DDxb6ztZKCfU1L3DV41XTh6uH+zWEbYIrkNtgDXTUxHV2iL/uFhmEEKR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19461277"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="19461277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3385692"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 19:07:46 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 15 Feb 2024 11:04:53 +0800
Message-Id: <20240215030500.3067426-4-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
References: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v5 3/9] net: stmmac: select PCS
	negotiation mode according to the interface mode
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

The 'stmmac_get_pcs_neg_mode' is invoked during link initialization or
interface mode changes.

In cases where 'priv->plat->get_pcs_neg_mode' is absent, the default
'phylink_pcs_neg_mode' function is utilized.

Additionally, the 'intel_get_pcs_neg_mode' function is available to
determine the PCS negotiation mode based on the provided interface mode.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 48 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 17 +++++++
 include/linux/stmmac.h                        |  2 +
 3 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 60283543ffc8..6f12e80b8a05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -414,6 +414,39 @@ static void intel_mgbe_pse_crossts_adj(struct intel_priv_data *intel_priv,
 	}
 }
 
+static bool is_fixed_link(struct pci_dev *pdev)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	bool is_fixed_link = false;
+
+	if (fwnode) {
+		struct fwnode_handle *fixed_node;
+
+		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
+		if (fixed_node)
+			is_fixed_link = true;
+
+		fwnode_handle_put(fixed_node);
+	}
+
+	return is_fixed_link;
+}
+
+static unsigned int intel_get_pcs_neg_mode(phy_interface_t interface,
+					   struct pci_dev *pdev)
+{
+	unsigned int neg_mode;
+
+	if ((interface == PHY_INTERFACE_MODE_SGMII ||
+	     interface == PHY_INTERFACE_MODE_1000BASEX) &&
+	     !is_fixed_link(pdev))
+		neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
+	else
+		neg_mode = PHYLINK_PCS_NEG_OUTBAND;
+
+	return neg_mode;
+}
+
 static void common_default_data(struct plat_stmmacenet_data *plat)
 {
 	plat->clk_csr = 2;	/* clk_csr_i = 20-35MHz & MDC = clk_csr_i/16 */
@@ -590,15 +623,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	}
 
 	/* For fixed-link setup, we clear xpcs_an_inband */
-	if (fwnode) {
-		struct fwnode_handle *fixed_node;
-
-		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
-		if (fixed_node)
-			plat->mdio_bus_data->xpcs_an_inband = false;
-
-		fwnode_handle_put(fixed_node);
-	}
+	if (is_fixed_link(pdev))
+		plat->mdio_bus_data->xpcs_an_inband = false;
 
 	/* Ensure mdio bus scan skips intel serdes and pcs-xpcs */
 	plat->mdio_bus_data->phy_mask = 1 << INTEL_MGBE_ADHOC_ADDR;
@@ -649,7 +675,7 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
-
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
 	plat->clk_ptp_rate = 204800000;
 
 	return ehl_common_data(pdev, plat);
@@ -708,6 +734,7 @@ static int ehl_pse0_sgmii1g_data(struct pci_dev *pdev,
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
 	return ehl_pse0_common_data(pdev, plat);
 }
 
@@ -749,6 +776,7 @@ static int ehl_pse1_sgmii1g_data(struct pci_dev *pdev,
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
 	return ehl_pse1_common_data(pdev, plat);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ae2ffa9595d6..dbd16fc38888 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1104,11 +1104,28 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		stmmac_hwtstamp_correct_latency(priv, priv);
 }
 
+static unsigned int stmmac_get_pcs_neg_mode(struct phylink_config *config,
+					    unsigned int mode,
+					    phy_interface_t interface,
+					    const unsigned long *advertising)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+	unsigned int neg_mode;
+
+	if (priv->plat->get_pcs_neg_mode)
+		neg_mode = priv->plat->get_pcs_neg_mode(interface, priv->plat->pdev);
+	else
+		neg_mode = phylink_pcs_neg_mode(mode, interface, advertising);
+
+	return neg_mode;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
+	.mac_get_pcs_neg_mode = stmmac_get_pcs_neg_mode,
 };
 
 /**
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dfa1828cd756..ffd66722eeda 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -277,6 +277,8 @@ struct plat_stmmacenet_data {
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
+	unsigned int (*get_pcs_neg_mode)(phy_interface_t interface,
+					 struct pci_dev *pdev);
 	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
