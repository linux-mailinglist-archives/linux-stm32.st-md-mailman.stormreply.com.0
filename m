Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B08CFCFE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 11:34:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 421B9C71288;
	Mon, 27 May 2024 09:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A6CC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716802457; x=1748338457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E+EoT7O1nqssyNDflC3jIs91HYNjVo4Y6XoiJ0luzsQ=;
 b=c4SnOPCyU0LSduzUyppTE2T7E9wEYa36fOi2yXt8fZlC5zRtPKx3Jhhf
 fpsc3Ol426WYsi2POkYj671+o4364YWKoY35BYkQ174BRLkW80qa28kAR
 MoxG0GYiUaoho8AfcFf3IkRpZd2Yzbhro4pvAHtLsWsJhJH60ywRnYBNp
 xBrVQ9ZP+mrPPgSMVLpXItV8wE63q9VdQQY5Z83Yw8zhkLDvhueYXy594
 +zbvlnXRSrlJ4ibQPraeU9TWpXs/3y8BwGyCnWDD52lajHPR3wR67meBx
 nGvkvorxgR8GGyBqmwLApVlbSB+q3ntK4kVvJRP+xWp8k1evkdkiGgmNj g==;
X-CSE-ConnectionGUID: 1WazdfIkT1Cv2sVtsDMiGw==
X-CSE-MsgGUID: jSWH2Rw2SDyfBFfB/5DUkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12933285"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="12933285"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:34:09 -0700
X-CSE-ConnectionGUID: XqWhXrEDSTiplvGlUD+vlA==
X-CSE-MsgGUID: C+tsYZsyRba24MqYtp41Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35193445"
Received: from pglmail07.png.intel.com ([10.126.73.9])
 by orviesa006.jf.intel.com with ESMTP; 27 May 2024 02:34:06 -0700
Received: from pglc00465.png.intel.com (pglc00465.png.intel.com
 [10.221.239.148])
 by pglmail07.png.intel.com (Postfix) with ESMTP id 9B85616426;
 Mon, 27 May 2024 17:34:04 +0800 (+08)
Received: by pglc00465.png.intel.com (Postfix, from userid 11742525)
 id 9936160568E; Mon, 27 May 2024 17:34:04 +0800 (+08)
From: Boon Khai Ng <boon.khai.ng@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tien Sung Ang <tien.sung.ang@intel.com>,
 G Thomas Rohan <rohan.g.thomas@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 May 2024 17:33:39 +0800
Message-Id: <20240527093339.30883-2-boon.khai.ng@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240527093339.30883-1-boon.khai.ng@intel.com>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
MIME-Version: 1.0
Cc: Boon Khai Ng <boon.khai.ng@intel.com>
Subject: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature v2
	1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated
	VLAN Stripping
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

Currently, VLAN tag stripping is done by software driver in
stmmac_rx_vlan() for dwxgmac2 driver. This patch is to Add support
for VLAN tag stripping by the MAC hardware and MAC drivers to support it.
This is done by adding rx_hw_vlan() and set_hw_vlan_mode() callbacks
at stmmac_ops struct which are called from upper software layer.

The setting can be turn on and off at ethool by running the command
below:
ethtool -k eth0 rx-vlan-offload on
ethtool -k eth0 rx-vlan-offload off

Hence for XGMAC IP, it is supported with the hardware stripping and
the flag NETIF_F_HW_VLAN_CTAG_RX is used to
determine that the hardware stripping feature is selected.

This implementation was ported from the dwmac4 driver.

Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    | 28 +++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 34 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 18 ++++++++++
 3 files changed, 80 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 6a2c7d22df1e..05b0f210ad90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -7,6 +7,7 @@
 #ifndef __STMMAC_DWXGMAC2_H__
 #define __STMMAC_DWXGMAC2_H__
 
+#include <linux/bitfield.h>
 #include "common.h"
 
 /* Misc */
@@ -455,6 +456,7 @@
 #define XGMAC_TDES2_VTIR		GENMASK(15, 14)
 #define XGMAC_TDES2_VTIR_SHIFT		14
 #define XGMAC_TDES2_B1L			GENMASK(13, 0)
+#define XGMAC_TDES2_VLAN_TAG_MASK	GENMASK(15, 14)
 #define XGMAC_TDES3_OWN			BIT(31)
 #define XGMAC_TDES3_CTXT		BIT(30)
 #define XGMAC_TDES3_FD			BIT(29)
@@ -486,6 +488,7 @@
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
 #define XGMAC_RDES3_L34T_SHIFT		20
+#define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
 #define XGMAC_L34T_IP6TCP		0x9
@@ -495,4 +498,29 @@
 #define XGMAC_RDES3_TSD			BIT(6)
 #define XGMAC_RDES3_TSA			BIT(4)
 
+/* RDES0 (write back format) */
+#define XGMAC_RDES0_VLAN_TAG_MASK	GENMASK(15, 0)
+
+/* MAC VLAN Tag Control */
+#define XGMAC_VLAN_TAG_CTRL_OB		BIT(0)
+#define XGMAC_VLAN_TAG_CTRL_CT		BIT(1)
+#define XGMAC_VLAN_TAG_CTRL_OFS_MASK	GENMASK(6, 2)
+#define XGMAC_VLAN_TAG_CTRL_OFS_SHIFT	2
+#define XGMAC_VLAN_TAG_CTRL_EVLS_MASK	GENMASK(22, 21)
+#define XGMAC_VLAN_TAG_CTRL_EVLS_SHIFT	21
+#define XGMAC_VLAN_TAG_CTRL_EVLRXS	BIT(24)
+
+#define XGMAC_VLAN_TAG_STRIP_NONE	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x0)
+#define XGMAC_VLAN_TAG_STRIP_PASS	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x1)
+#define XGMAC_VLAN_TAG_STRIP_FAIL	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x2)
+#define XGMAC_VLAN_TAG_STRIP_ALL	FIELD_PREP(XGMAC_VLAN_TAG_CTRL_EVLS_MASK, 0x3)
+
+/* Error Type or L2 Type(ET/LT) Field Number */
+#define XGMAC_ET_LT_VLAN_STAG		8
+#define XGMAC_ET_LT_VLAN_CTAG		9
+#define XGMAC_ET_LT_DVLAN_CTAG_CTAG	10
+#define XGMAC_ET_LT_DVLAN_STAG_STAG	11
+#define XGMAC_ET_LT_DVLAN_CTAG_STAG	12
+#define XGMAC_ET_LT_DVLAN_STAG_CTAG	13
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index f8e7775bb633..2870ee3d7104 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitrev.h>
 #include <linux/crc32.h>
+#include <linux/if_vlan.h>
 #include <linux/iopoll.h>
 #include "stmmac.h"
 #include "stmmac_ptp.h"
@@ -1301,6 +1302,35 @@ static void dwxgmac2_sarc_configure(void __iomem *ioaddr, int val)
 	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
+static void dwxgmac2_rx_hw_vlan(struct mac_device_info *hw,
+				struct dma_desc *rx_desc, struct sk_buff *skb)
+{
+	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
+		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
+
+		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
+	}
+}
+
+static void dwxgmac2_set_hw_vlan_mode(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 val = readl(ioaddr + XGMAC_VLAN_TAG);
+
+	val &= ~XGMAC_VLAN_TAG_CTRL_EVLS_MASK;
+
+	if (hw->hw_vlan_en)
+		/* Always strip VLAN on Receive */
+		val |= XGMAC_VLAN_TAG_STRIP_ALL;
+	else
+		/* Do not strip VLAN on Receive */
+		val |= XGMAC_VLAN_TAG_STRIP_NONE;
+
+	/* Enable outer VLAN Tag in Rx DMA descriptro */
+	val |= XGMAC_VLAN_TAG_CTRL_EVLRXS;
+	writel(val, ioaddr + XGMAC_VLAN_TAG);
+}
+
 static void dwxgmac2_enable_vlan(struct mac_device_info *hw, u32 type)
 {
 	void __iomem *ioaddr = hw->pcsr;
@@ -1574,6 +1604,8 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.rx_hw_vlan = dwxgmac2_rx_hw_vlan,
+	.set_hw_vlan_mode = dwxgmac2_set_hw_vlan_mode,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1634,6 +1666,8 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
 	.fpe_configure = dwxgmac3_fpe_configure,
+	.rx_hw_vlan = dwxgmac2_rx_hw_vlan,
+	.set_hw_vlan_mode = dwxgmac2_set_hw_vlan_mode,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index fc82862a612c..284c0c840ed1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -4,6 +4,7 @@
  * stmmac XGMAC support.
  */
 
+#include <linux/bitfield.h>
 #include <linux/stmmac.h>
 #include "common.h"
 #include "dwxgmac2.h"
@@ -67,6 +68,21 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
 	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
 }
 
+static inline u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
+{
+	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;
+}
+
+static inline bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)
+{
+	u32 et_lt;
+
+	et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));
+
+	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
+	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
+}
+
 static int dwxgmac2_get_rx_frame_len(struct dma_desc *p, int rx_coe)
 {
 	return (le32_to_cpu(p->des3) & XGMAC_RDES3_PL);
@@ -349,6 +365,8 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_tx_ls = dwxgmac2_get_tx_ls,
+	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
+	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
 	.enable_tx_timestamp = dwxgmac2_enable_tx_timestamp,
 	.get_tx_timestamp_status = dwxgmac2_get_tx_timestamp_status,
-- 
2.35.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
