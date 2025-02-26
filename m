Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0BA4570C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:50:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9D2C7A82F;
	Wed, 26 Feb 2025 07:50:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0616CC7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740556248; x=1772092248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cmKtuwnc2KIDaRI+wvWtnzBRpft8byHlKWXn0enjH2M=;
 b=XE8HVoksAJbQzfh1P9UTAXe+8GwAoidBD0PGJgarvoDzPLQ0+jdPA6hd
 iD9zQ2fC6jxvWSV39vOvw6IWxIQUQSMBblg9V2uxCSEjSRvjXVmLjGeRy
 hAZlALYGWHx8ym/Eo4iokIojYjGfWL/Umm6P5jls66brZOqRUYDuYibfa
 dDfKcsSNUvYKc/XBtxxddOIhVcVzl7oDYg5KPvZcBnMnBnRDvHoiTu4fZ
 /L53K9+/oCurTMZUPsiBCOdclxZVhKy2ErmCYGy7z5yTlz5bgWxlA56I/
 QIwdRZcRqD7E3mVVPxVbSsFR8Tmw/Dy7wIbirOUZtY9DSR7Riun9At9aJ Q==;
X-CSE-ConnectionGUID: q7LN3j0rSBCfAzMivRBBeA==
X-CSE-MsgGUID: MGMQXvjHRDuQxaOgZHF13A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305251"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="45305251"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 23:50:46 -0800
X-CSE-ConnectionGUID: fM5vSBR0ToyfuZ21hlmvgA==
X-CSE-MsgGUID: 7VkCjDaiTceTPs/wK8065A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120743067"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 23:50:39 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Wed, 26 Feb 2025 15:48:37 +0800
Message-Id: <20250226074837.1679988-7-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 6/6] stmmac: intel: interface
	switching support for ADL-N platform
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

The intel_config_serdes function was provided to handle interface mode
changes for the ADL-N platform.

The Modphy register lane was provided to configure the serdes when
changing interface modes.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f73a48f98581..9c8de47ee149 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -87,6 +87,7 @@ static const struct pmc_serdes_regs pid_modphy1_2p5g_regs[] = {
 };
 
 static const int ehl_tsn_lane_regs[] = {7, 8, 9, 10, 11};
+static const int adln_tsn_lane_regs[] = {6};
 
 static int stmmac_pci_find_phy_addr(struct pci_dev *pdev,
 				    const struct dmi_system_id *dmi_list)
@@ -1004,6 +1005,55 @@ static int adls_sgmii_phy1_data(struct pci_dev *pdev,
 static struct stmmac_pci_info adls_sgmii1g_phy1_info = {
 	.setup = adls_sgmii_phy1_data,
 };
+
+static int adln_common_data(struct pci_dev *pdev,
+			    struct plat_stmmacenet_data *plat)
+{
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
+	plat->rx_queues_to_use = 6;
+	plat->tx_queues_to_use = 4;
+	plat->clk_ptp_rate = 204800000;
+
+	plat->safety_feat_cfg->tsoee = 1;
+	plat->safety_feat_cfg->mrxpee = 0;
+	plat->safety_feat_cfg->mestee = 1;
+	plat->safety_feat_cfg->mrxee = 1;
+	plat->safety_feat_cfg->mtxee = 1;
+	plat->safety_feat_cfg->epsi = 0;
+	plat->safety_feat_cfg->edpp = 0;
+	plat->safety_feat_cfg->prtyen = 0;
+	plat->safety_feat_cfg->tmouten = 0;
+
+	intel_priv->tsn_lane_regs = adln_tsn_lane_regs;
+	intel_priv->max_tsn_lane_regs = ARRAY_SIZE(adln_tsn_lane_regs);
+
+	return intel_mgbe_common_data(pdev, plat);
+}
+
+static int adln_sgmii_phy0_data(struct pci_dev *pdev,
+				struct plat_stmmacenet_data *plat)
+{
+	struct intel_priv_data *intel_priv = plat->bsp_priv;
+
+	plat->bus_id = 1;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+	plat->serdes_powerup = intel_serdes_powerup;
+	plat->serdes_powerdown = intel_serdes_powerdown;
+	plat->mac_finish = intel_mac_finish;
+
+	intel_priv->pid_1g.regs = pid_modphy1_1g_regs;
+	intel_priv->pid_1g.num_regs = ARRAY_SIZE(pid_modphy1_1g_regs);
+	intel_priv->pid_2p5g.regs = pid_modphy1_2p5g_regs;
+	intel_priv->pid_2p5g.num_regs = ARRAY_SIZE(pid_modphy1_2p5g_regs);
+
+	return adln_common_data(pdev, plat);
+}
+
+static struct stmmac_pci_info adln_sgmii1g_phy0_info = {
+	.setup = adln_sgmii_phy0_data,
+};
+
 static const struct stmmac_pci_func_data galileo_stmmac_func_data[] = {
 	{
 		.func = 6,
@@ -1386,7 +1436,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, TGLH_SGMII1G_1, &tgl_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
-	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &adln_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &tgl_sgmii1g_phy0_info) },
 	{}
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
