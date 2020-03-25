Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF6C192208
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2020 08:58:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 918E5C36B0B;
	Wed, 25 Mar 2020 07:58:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16291C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2020 00:54:24 +0000 (UTC)
IronPort-SDR: tmP04BkmEcxJkKqwyRR50hk7P0b8gCoMXeNrI2fiIF3WgHqujiM9xJ+4xmZJL5XyQ1Tidh02fB
 je0eIdaj7I3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 17:54:22 -0700
IronPort-SDR: VcaTFbSEBq3Uua53uYD9L4EdqAwF34lru5RT9ZjwhyykjixAGfpn3MTe1pevnPIkW0Wcsz2QoH
 6sI0IgQNUsUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,302,1580803200"; d="scan'208";a="357664503"
Received: from glass.png.intel.com ([172.30.181.92])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2020 17:54:19 -0700
From: vee.khee.wong@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 25 Mar 2020 08:56:32 +0800
Message-Id: <20200325005632.6626-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Approved-At: Wed, 25 Mar 2020 07:58:48 +0000
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] net: stmmac: Add support for VLAN Rx
	filtering
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

From: "Chuah, Kim Tatt" <kim.tatt.chuah@intel.com>

Add support for VLAN ID-based filtering by the MAC controller for MAC
drivers that support it. Only the 12-bit VID field is used.

Signed-off-by: Chuah, Kim Tatt <kim.tatt.chuah@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Wong, Vee Khee <vee.khee.wong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  25 +++
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 196 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  14 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  10 +
 5 files changed, 247 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 5b505a15aa6a..bcda7faa1bfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -481,6 +481,8 @@ struct mac_device_info {
 	unsigned int pcs;
 	unsigned int pmt;
 	unsigned int ps;
+	unsigned int num_vlan;
+	u32 vlan_filter[32];
 };
 
 struct stmmac_rx_routing {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index af50af27550b..28cac28253b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -18,6 +18,7 @@
 #define GMAC_PACKET_FILTER		0x00000008
 #define GMAC_HASH_TAB(x)		(0x10 + (x) * 4)
 #define GMAC_VLAN_TAG			0x00000050
+#define GMAC_VLAN_TAG_DATA		0x00000054
 #define GMAC_VLAN_HASH_TABLE		0x00000058
 #define GMAC_RX_FLOW_CTRL		0x00000090
 #define GMAC_VLAN_INCL			0x00000060
@@ -90,6 +91,29 @@
 #define GMAC_VLAN_VLC			GENMASK(17, 16)
 #define GMAC_VLAN_VLC_SHIFT		16
 
+/* MAC VLAN Tag */
+#define GMAC_VLAN_TAG_VID		GENMASK(15, 0)
+#define GMAC_VLAN_TAG_ETV		BIT(16)
+
+/* MAC VLAN Tag Control */
+#define GMAC_VLAN_TAG_CTRL_OB		BIT(0)
+#define GMAC_VLAN_TAG_CTRL_CT		BIT(1)
+#define GMAC_VLAN_TAG_CTRL_OFS_MASK	GENMASK(6, 2)
+#define GMAC_VLAN_TAG_CTRL_OFS_SHIFT	2
+#define GMAC_VLAN_TAG_CTRL_EVLS_MASK	GENMASK(22, 21)
+#define GMAC_VLAN_TAG_CTRL_EVLS_SHIFT	21
+#define GMAC_VLAN_TAG_CTRL_EVLRXS	BIT(24)
+
+#define GMAC_VLAN_TAG_STRIP_NONE	(0x0 << GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
+#define GMAC_VLAN_TAG_STRIP_PASS	(0x1 << GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
+#define GMAC_VLAN_TAG_STRIP_FAIL	(0x2 << GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
+#define GMAC_VLAN_TAG_STRIP_ALL		(0x3 << GMAC_VLAN_TAG_CTRL_EVLS_SHIFT)
+
+/* MAC VLAN Tag Data/Filter */
+#define GMAC_VLAN_TAG_DATA_VID		GENMASK(15, 0)
+#define GMAC_VLAN_TAG_DATA_VEN		BIT(16)
+#define GMAC_VLAN_TAG_DATA_ETV		BIT(17)
+
 /* MAC RX Queue Enable */
 #define GMAC_RX_QUEUE_CLEAR(queue)	~(GENMASK(1, 0) << ((queue) * 2))
 #define GMAC_RX_AV_QUEUE_ENABLE(queue)	BIT((queue) * 2)
@@ -248,6 +272,7 @@ enum power_event {
 #define GMAC_HW_FEAT_FRPBS		GENMASK(12, 11)
 #define GMAC_HW_FEAT_FRPSEL		BIT(10)
 #define GMAC_HW_FEAT_DVLAN		BIT(5)
+#define GMAC_HW_FEAT_NRVF		GENMASK(2, 0)
 
 /* MAC HW ADDR regs */
 #define GMAC_HI_DCS			GENMASK(18, 16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 8e772fe9d048..c8eaa42bd3ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -395,6 +395,156 @@ static void dwmac4_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + GMAC4_LPI_TIMER_CTRL);
 }
 
+static void dwmac4_write_single_vlan(struct net_device *dev, u16 vid)
+{
+	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
+	u32 val;
+
+	val = readl(ioaddr + GMAC_VLAN_TAG);
+	val &= ~GMAC_VLAN_TAG_VID;
+	val |= GMAC_VLAN_TAG_ETV | vid;
+
+	writel(val, ioaddr + GMAC_VLAN_TAG);
+}
+
+static int dwmac4_write_vlan_filter(struct net_device *dev,
+				    struct mac_device_info *hw,
+				    u8 index, u32 data)
+{
+	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
+	int i, timeout = 10;
+	u32 val;
+
+	if (index >= hw->num_vlan)
+		return -EINVAL;
+
+	writel(data, ioaddr + GMAC_VLAN_TAG_DATA);
+
+	val = readl(ioaddr + GMAC_VLAN_TAG);
+	val &= ~(GMAC_VLAN_TAG_CTRL_OFS_MASK |
+		 GMAC_VLAN_TAG_CTRL_CT |
+		 GMAC_VLAN_TAG_CTRL_OB);
+	val |= (index << GMAC_VLAN_TAG_CTRL_OFS_SHIFT) | GMAC_VLAN_TAG_CTRL_OB;
+
+	writel(val, ioaddr + GMAC_VLAN_TAG);
+
+	for (i = 0; i < timeout; i++) {
+		val = readl(ioaddr + GMAC_VLAN_TAG);
+		if (!(val & GMAC_VLAN_TAG_CTRL_OB))
+			return 0;
+		udelay(1);
+	}
+
+	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
+
+	return -EBUSY;
+}
+
+static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
+				      struct mac_device_info *hw,
+				      __be16 proto, u16 vid)
+{
+	int index = -1;
+	u32 val = 0;
+	int i, ret;
+
+	if (vid > 4095)
+		return -EINVAL;
+
+	/* Single Rx VLAN Filter */
+	if (hw->num_vlan == 1) {
+		/* For single VLAN filter, VID 0 means VLAN promiscuous */
+		if (vid == 0) {
+			netdev_warn(dev, "Adding VLAN ID 0 is not supported\n");
+			return -EPERM;
+		}
+
+		if (hw->vlan_filter[0] & GMAC_VLAN_TAG_VID) {
+			netdev_err(dev, "Only single VLAN ID supported\n");
+			return -EPERM;
+		}
+
+		hw->vlan_filter[0] = vid;
+		dwmac4_write_single_vlan(dev, vid);
+
+		return 0;
+	}
+
+	/* Extended Rx VLAN Filter Enable */
+	val |= GMAC_VLAN_TAG_DATA_ETV | GMAC_VLAN_TAG_DATA_VEN | vid;
+
+	for (i = 0; i < hw->num_vlan; i++) {
+		if (hw->vlan_filter[i] == val)
+			return 0;
+		else if (!(hw->vlan_filter[i] & GMAC_VLAN_TAG_DATA_VEN))
+			index = i;
+	}
+
+	if (index == -1) {
+		netdev_err(dev, "MAC_VLAN_Tag_Filter full (size: %0u)\n",
+			   hw->num_vlan);
+		return -EPERM;
+	}
+
+	ret = dwmac4_write_vlan_filter(dev, hw, index, val);
+
+	if (!ret)
+		hw->vlan_filter[index] = val;
+
+	return ret;
+}
+
+static int dwmac4_del_hw_vlan_rx_fltr(struct net_device *dev,
+				      struct mac_device_info *hw,
+				      __be16 proto, u16 vid)
+{
+	int i, ret = 0;
+
+	/* Single Rx VLAN Filter */
+	if (hw->num_vlan == 1) {
+		if ((hw->vlan_filter[0] & GMAC_VLAN_TAG_VID) == vid) {
+			hw->vlan_filter[0] = 0;
+			dwmac4_write_single_vlan(dev, 0);
+		}
+		return 0;
+	}
+
+	/* Extended Rx VLAN Filter Enable */
+	for (i = 0; i < hw->num_vlan; i++) {
+		if ((hw->vlan_filter[i] & GMAC_VLAN_TAG_DATA_VID) == vid) {
+			ret = dwmac4_write_vlan_filter(dev, hw, i, 0);
+
+			if (!ret)
+				hw->vlan_filter[i] = 0;
+			else
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void dwmac4_restore_hw_vlan_rx_fltr(struct net_device *dev,
+					   struct mac_device_info *hw)
+{
+	u32 val;
+	int i;
+
+	/* Single Rx VLAN Filter */
+	if (hw->num_vlan == 1) {
+		dwmac4_write_single_vlan(dev, hw->vlan_filter[0]);
+		return;
+	}
+
+	/* Extended Rx VLAN Filter Enable */
+	for (i = 0; i < hw->num_vlan; i++) {
+		if (hw->vlan_filter[i] & GMAC_VLAN_TAG_DATA_VEN) {
+			val = hw->vlan_filter[i];
+			dwmac4_write_vlan_filter(dev, hw, i, val);
+		}
+	}
+}
+
 static void dwmac4_set_filter(struct mac_device_info *hw,
 			      struct net_device *dev)
 {
@@ -470,6 +620,10 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 		}
 	}
 
+	/* VLAN filtering */
+	if (dev->features & NETIF_F_HW_VLAN_CTAG_FILTER)
+		value |= GMAC_PACKET_FILTER_VTFE;
+
 	writel(value, ioaddr + GMAC_PACKET_FILTER);
 }
 
@@ -948,6 +1102,9 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_arp_offload = dwmac4_set_arp_offload,
 	.config_l3_filter = dwmac4_config_l3_filter,
 	.config_l4_filter = dwmac4_config_l4_filter,
+	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
+	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
+	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
 };
 
 const struct stmmac_ops dwmac410_ops = {
@@ -988,6 +1145,9 @@ const struct stmmac_ops dwmac410_ops = {
 	.config_l4_filter = dwmac4_config_l4_filter,
 	.est_configure = dwmac5_est_configure,
 	.fpe_configure = dwmac5_fpe_configure,
+	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
+	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
+	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
 };
 
 const struct stmmac_ops dwmac510_ops = {
@@ -1033,8 +1193,42 @@ const struct stmmac_ops dwmac510_ops = {
 	.config_l4_filter = dwmac4_config_l4_filter,
 	.est_configure = dwmac5_est_configure,
 	.fpe_configure = dwmac5_fpe_configure,
+	.add_hw_vlan_rx_fltr = dwmac4_add_hw_vlan_rx_fltr,
+	.del_hw_vlan_rx_fltr = dwmac4_del_hw_vlan_rx_fltr,
+	.restore_hw_vlan_rx_fltr = dwmac4_restore_hw_vlan_rx_fltr,
 };
 
+static u32 dwmac4_get_num_vlan(void __iomem *ioaddr)
+{
+	u32 val, num_vlan;
+
+	val = readl(ioaddr + GMAC_HW_FEATURE3);
+	switch (val & GMAC_HW_FEAT_NRVF) {
+	case 0:
+		num_vlan = 1;
+		break;
+	case 1:
+		num_vlan = 4;
+		break;
+	case 2:
+		num_vlan = 8;
+		break;
+	case 3:
+		num_vlan = 16;
+		break;
+	case 4:
+		num_vlan = 24;
+		break;
+	case 5:
+		num_vlan = 32;
+		break;
+	default:
+		num_vlan = 1;
+	}
+
+	return num_vlan;
+}
+
 int dwmac4_setup(struct stmmac_priv *priv)
 {
 	struct mac_device_info *mac = priv->hw;
@@ -1064,5 +1258,7 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->mii.clk_csr_shift = 8;
 	mac->mii.clk_csr_mask = GENMASK(11, 8);
 
+	mac->num_vlan = dwmac4_get_num_vlan(priv->ioaddr);
+
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8b5225b6b24e..bcaf4d068d51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -369,6 +369,14 @@ struct stmmac_ops {
 	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
 				 __le16 perfect_match, bool is_double);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
+	int (*add_hw_vlan_rx_fltr)(struct net_device *dev,
+				   struct mac_device_info *hw,
+				   __be16 proto, u16 vid);
+	int (*del_hw_vlan_rx_fltr)(struct net_device *dev,
+				   struct mac_device_info *hw,
+				   __be16 proto, u16 vid);
+	void (*restore_hw_vlan_rx_fltr)(struct net_device *dev,
+					struct mac_device_info *hw);
 	/* TX Timestamp */
 	int (*get_mac_tx_timestamp)(struct mac_device_info *hw, u64 *ts);
 	/* Source Address Insertion / Replacement */
@@ -461,6 +469,12 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, update_vlan_hash, __args)
 #define stmmac_enable_vlan(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, enable_vlan, __args)
+#define stmmac_add_hw_vlan_rx_fltr(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, add_hw_vlan_rx_fltr, __args)
+#define stmmac_del_hw_vlan_rx_fltr(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, del_hw_vlan_rx_fltr, __args)
+#define stmmac_restore_hw_vlan_rx_fltr(__priv, __args...) \
+	stmmac_do_void_callback(__priv, mac, restore_hw_vlan_rx_fltr, __args)
 #define stmmac_get_mac_tx_timestamp(__priv, __args...) \
 	stmmac_do_callback(__priv, mac, get_mac_tx_timestamp, __args)
 #define stmmac_sarc_configure(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f910cdc956a6..58be760a1f8d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4881,6 +4881,8 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 		return ret;
 	}
 
+	ret = stmmac_add_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+
 	return ret;
 }
 
@@ -4888,11 +4890,17 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	bool is_double = false;
+	int ret;
 
 	if (be16_to_cpu(proto) == ETH_P_8021AD)
 		is_double = true;
 
 	clear_bit(vid, priv->active_vlans);
+
+	ret = stmmac_del_hw_vlan_rx_fltr(priv, ndev, priv->hw, proto, vid);
+	if (ret)
+		return ret;
+
 	return stmmac_vlan_update(priv, is_double);
 }
 
@@ -5493,6 +5501,8 @@ int stmmac_resume(struct device *dev)
 	stmmac_init_coalesce(priv);
 	stmmac_set_rx_mode(ndev);
 
+	stmmac_restore_hw_vlan_rx_fltr(priv, ndev, priv->hw);
+
 	stmmac_enable_all_queues(priv);
 
 	stmmac_start_all_queues(priv);
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
