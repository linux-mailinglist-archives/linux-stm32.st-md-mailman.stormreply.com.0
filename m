Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177C3828BF
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 11:48:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18AB8C58D5F;
	Mon, 17 May 2021 09:48:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7405C57B74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 09:48:42 +0000 (UTC)
IronPort-SDR: oEMj+N/q04rV3S8jATz1FGRA27fXaxzCB3K3ZsSdJE8Rh0ICNS9yq7qyOL9BeGThNhBOJTd2tb
 UenWGXyWK9eg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="197344791"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="197344791"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 02:48:42 -0700
IronPort-SDR: rME9TzGhPgHXvRp3v/U89+7RJbt2dOakBUJ5/8pgJkfdJdOLkRJmwiN3xWcaRrh0Ifn+fHXCN7
 PpfVMGmoerZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="540356013"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga001.fm.intel.com with ESMTP; 17 May 2021 02:48:38 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 17 May 2021 17:43:32 +0800
Message-Id: <20210517094332.24976-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
References: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
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
