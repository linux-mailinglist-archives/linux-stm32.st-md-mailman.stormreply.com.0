Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01F84060B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64804C6B463;
	Mon, 29 Jan 2024 13:05:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC64FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533553; x=1738069553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swhxBtRu+RCpSe8dZMPl6Dv+QRyu2q9F2b9dNeHS8cM=;
 b=Ip0k2ebJnCT5msfCL0fYI2xETM1D5vY+VwEc2/5q0f+4dHNU9cuobLBA
 iN8AdHktxuFcj6JlKj4sPRn4Cy1hofS6Tc1aIDWY8Q3vXtKA/CkzKqwnC
 MogIauA3V7/mkZ2hLy9a4uGD4VV/IZMUQOmrR6x/9Y2LfzbN7PP/hBwei
 DF+CYYF9iL4/DiNwdfXyx6nn1Jbvn4fArCVNAPgPkp1P62IWYEFPF4Ac3
 48ljvA46jkKWD74TKwvpvwBqxGtdJ3/Aar67+kE5Z+lOR/WImzbt2tqQu
 C/26sylo9oXLpcIvUxU5ZfeOgc4yB1ALRaAd7jDtF3mHXma45hWzSf+UB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473479"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473479"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106807"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106807"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:05:43 -0800
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
Date: Mon, 29 Jan 2024 21:02:47 +0800
Message-Id: <20240129130253.1400707-6-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>, netdev@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v4 05/11] net: stmmac: select PCS
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
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 44 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 17 +++++++
 include/linux/stmmac.h                        |  2 +
 3 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 60283543ffc8..5110af776c8f 100644
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
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1ec075ae10a..00af5a4195fd 100644
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
index b99d11f4ff26..778bdfc3f010 100644
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
