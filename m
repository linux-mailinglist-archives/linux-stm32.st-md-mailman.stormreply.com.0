Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1792E84061C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:06:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA78AC6C841;
	Mon, 29 Jan 2024 13:06:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6021FC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533599; x=1738069599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVZuVXGKKl/w9vqXKLg9hV4CJBuyMpcx4WwCQPI+U90=;
 b=EuoVxACAnw39WtFdpHNDHqyr0q/vUZvkNbJAbiXVHTXBtBbfVYfPf7a7
 o9yCmAl3bFV68U5GDb+ZbW8dnm3U6hx1NQriDQwtDIe/T/OzyL3GrZ3TL
 c57sja5hjO9eY7byje2n12Xw86XA9EI5KvSJJkEbAaw9QYxPm7pdYBmIH
 QRq/qq2a3xa/Z60v4MDFoGiLwhYK9oL0VTTmyC/ddy5HuGKBmnEyHVn+4
 GVdG6aZspntJ54MKwk+Ylirwva2Cdmpkj+IrCLt+sRaUzduJdv+hXFsj5
 E5hGqi9YcMRL6R40wqamWuaTozuRSqRgP0cMsefLVMndSr6xw7zDerW+z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473686"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473686"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106888"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106888"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:06:26 -0800
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
Date: Mon, 29 Jan 2024 21:02:52 +0800
Message-Id: <20240129130253.1400707-11-yong.liang.choong@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 10/11] stmmac: intel: interface
	switching support for EHL platform
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

From: Choong Yong Liang <yong.liang.choong@intel.com>

'intel_get_pcs_neg_mode' and 'intel_config_serdes' was provided to
handle interface mode change for EHL platform.

Modphy register lane was provided to configure serdes on interface
mode changing.

Signed-off-by: Choong Yong Liang <yong.liang.choong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 27 ++++++++++++++++---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  4 +++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ddd96b18ce87..fd9d56b7c511 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -760,6 +760,8 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 static int ehl_common_data(struct pci_dev *pdev,
 			   struct plat_stmmacenet_data *plat)
 {
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
 	plat->rx_queues_to_use = 8;
 	plat->tx_queues_to_use = 8;
 	plat->flags |= STMMAC_FLAG_USE_PHY_WOL;
@@ -775,19 +777,26 @@ static int ehl_common_data(struct pci_dev *pdev,
 	plat->safety_feat_cfg->prtyen = 0;
 	plat->safety_feat_cfg->tmouten = 0;
 
+	intel_priv->tsn_lane_registers = ehl_tsn_lane_registers;
+	intel_priv->max_tsn_lane_registers = ARRAY_SIZE(ehl_tsn_lane_registers);
+
 	return intel_mgbe_common_data(pdev, plat);
 }
 
 static int ehl_sgmii_data(struct pci_dev *pdev,
 			  struct plat_stmmacenet_data *plat)
 {
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
-	plat->speed_mode_2500 = intel_speed_mode_2500;
+	plat->max_speed = SPEED_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
-
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
+	plat->config_serdes = intel_config_serdes;
 	plat->clk_ptp_rate = 204800000;
+	intel_priv->pid_modphy = PID_MODPHY3;
 
 	return ehl_common_data(pdev, plat);
 }
@@ -841,10 +850,16 @@ static struct stmmac_pci_info ehl_pse0_rgmii1g_info = {
 static int ehl_pse0_sgmii1g_data(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat)
 {
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
-	plat->speed_mode_2500 = intel_speed_mode_2500;
+	plat->max_speed = SPEED_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
+	plat->config_serdes = intel_config_serdes;
+	intel_priv->pid_modphy = PID_MODPHY1;
+
 	return ehl_pse0_common_data(pdev, plat);
 }
 
@@ -882,10 +897,16 @@ static struct stmmac_pci_info ehl_pse1_rgmii1g_info = {
 static int ehl_pse1_sgmii1g_data(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat)
 {
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->get_pcs_neg_mode = intel_get_pcs_neg_mode;
+	plat->config_serdes = intel_config_serdes;
+	intel_priv->pid_modphy = PID_MODPHY1;
+
 	return ehl_pse1_common_data(pdev, plat);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
index 79c35ba969ea..093eed977ab0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h
@@ -123,6 +123,10 @@ static const struct pmc_serdes_regs pid_modphy1_2p5g_regs[] = {
 	{ PID_MODPHY1_N_MODPHY_PCR_CMN_ANA_DWORD30,	N_MODPHY_PCR_CMN_ANA_DWORD30_2P5G },
 	{}
 };
+
+static const int ehl_tsn_lane_registers[] = {7, 8, 9, 10, 11};
+#else
+static const int ehl_tsn_lane_registers[] = {};
 #endif /* CONFIG_INTEL_PMC_IPC */
 
 #endif /* __DWMAC_INTEL_H__ */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
