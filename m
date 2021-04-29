Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA636E75C
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Apr 2021 10:51:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCC89C57B6F;
	Thu, 29 Apr 2021 08:51:48 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FC54C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Apr 2021 08:51:45 +0000 (UTC)
IronPort-SDR: N8D2VPFf0U6DXU9n9xLYazPlRFUBJYQfLKVg8YFOBfkqlu8cTsl8r/6fJCUHkSFaZBrUIu/kzH
 lMYzVllerLKw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="193770332"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="193770332"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:51:45 -0700
IronPort-SDR: SuZ9tfMNP5EQbtl+AkYk/IewFy3ZsHwjdPYuhr8U9Hnpbw0u4o9gNtZxoMFpCIsXjqSY1Loj12
 FxXGcocZnoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="605198520"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2021 01:51:40 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 29 Apr 2021 16:46:36 +0800
Message-Id: <20210429084636.24752-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429084636.24752-1-michael.wei.hong.sit@intel.com>
References: <20210429084636.24752-1-michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Add callbacks for
	DWC xpcs Energy Efficient Ethernet
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Link xpcs callback functions for MAC to configure the xpcs EEE feature.

The clk_eee frequency is used to calculate the MULT_FACT_100NS. This is
to adjust the clock tic closer to 100ns.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h           |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  6 ++++++
 include/linux/stmmac.h                               |  1 +
 4 files changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 80728a4c0e3f..e36a8cc59ad0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -429,6 +429,17 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->force_sf_dma_mode = 0;
 	plat->tso_en = 1;
 
+	/* Multiplying factor to the clk_eee_i clock time
+	 * period to make it closer to 100 ns. This value
+	 * should be programmed such that the clk_eee_time_period *
+	 * (MULT_FACT_100NS + 1) should be within 80 ns to 120 ns
+	 * clk_eee frequency is 19.2Mhz
+	 * clk_eee_time_period is 52ns
+	 * 52ns * (1 + 1) = 104ns
+	 * MULT_FACT_100NS = 1
+	 */
+	plat->mult_fact_100ns = 1;
+
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 2cc91759b91f..c678d7b826a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -624,6 +624,8 @@ struct stmmac_mmc_ops {
 	stmmac_do_callback(__priv, xpcs, link_up, __args)
 #define stmmac_xpcs_probe(__priv, __args...) \
 	stmmac_do_callback(__priv, xpcs, probe, __args)
+#define stmmac_xpcs_config_eee(__priv, __args...) \
+	stmmac_do_callback(__priv, xpcs, config_eee, __args)
 
 struct stmmac_regs_off {
 	u32 ptp_off;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 61b11639ee0c..1f6d749fd9a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -720,6 +720,12 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 		netdev_warn(priv->dev,
 			    "Setting EEE tx-lpi is not supported\n");
 
+	ret = stmmac_xpcs_config_eee(priv, &priv->hw->xpcs_args,
+				     priv->plat->mult_fact_100ns,
+				     edata->eee_enabled);
+	if (ret)
+		return ret;
+
 	if (!edata->eee_enabled)
 		stmmac_disable_eee_mode(priv);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 0db36360ef21..e14a12df381b 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -223,6 +223,7 @@ struct plat_stmmacenet_data {
 	struct clk *clk_ptp_ref;
 	unsigned int clk_ptp_rate;
 	unsigned int clk_ref_rate;
+	unsigned int mult_fact_100ns;
 	s32 ptp_max_adj;
 	struct reset_control *stmmac_rst;
 	struct stmmac_axi *axi;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
