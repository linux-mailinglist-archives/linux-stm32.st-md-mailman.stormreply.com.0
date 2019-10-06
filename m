Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D62CD19F
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 13:17:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C08E7C36B0E;
	Sun,  6 Oct 2019 11:17:31 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63D2FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 11:17:30 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8746BC03AF;
 Sun,  6 Oct 2019 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1570360649; bh=8moAOsCCneweJvIUV4WGkjO8ZvdUjVai+OwCuSsM9VQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Gla8OvQUBGfcypLyQl9FJoBYxBV3pEs8sVmx43VgXN6jF5xNPpt1IY7Z+514jOfZp
 V1qL2vaB/I1oeiHP/9i5nytBJB4+aJlPS0CobMgdGwmkNpy6sGrpfuXWEfJgjtgNUM
 ll9X8zZSwuA3lUTPWnOlePV40zPW/mwvSPiJmizOHQ0YVkRBbXM5GLTF4Dw+aMSPoT
 ENUBMxh6w2dwNvoxqVZumk+Un/eDffuRW4kLArmyaDdsl9Con15ZpYNUtbNhJGWKfH
 nsWcw3XlQaXpUGO2xrhD15NMec9dMK7nsY2irV5PiOsi72JIsUoeDdDQl+lkfIOR/L
 NocjefxeELx6g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id EF01BA0060;
 Sun,  6 Oct 2019 11:17:25 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Sun,  6 Oct 2019 13:17:12 +0200
Message-Id: <3504067666a0cee6ecf636cf30081b09a6b79710.1570360411.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570360411.git.Jose.Abreu@synopsys.com>
References: <cover.1570360411.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1570360411.git.Jose.Abreu@synopsys.com>
References: <cover.1570360411.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Fallback to VLAN
	Perfect filtering if HASH is not available
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

From: Jose Abreu <joabreu@synopsys.com>

If VLAN Hash Filtering is not available we can fallback to perfect
filtering instead. Let's implement this in XGMAC and GMAC cores and let
the user use this filter.

VLAN VID=0 always passes filter so we check if more than 2 VLANs are
created and return proper error code if so because perfect filtering
only supports 1 VID at a time.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c   | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 17 ++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 18 ++++++++++++------
 4 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 5a7b0aca1d31..1a04815d1d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -733,7 +733,7 @@ static void dwmac4_set_mac_loopback(void __iomem *ioaddr, bool enable)
 }
 
 static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				    bool is_double)
+				    u16 perfect_match, bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -748,6 +748,16 @@ static void dwmac4_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 		}
 
 		writel(value, ioaddr + GMAC_VLAN_TAG);
+	} else if (perfect_match) {
+		u32 value = GMAC_VLAN_ETV;
+
+		if (is_double) {
+			value |= GMAC_VLAN_EDVLP;
+			value |= GMAC_VLAN_ESVL;
+			value |= GMAC_VLAN_DOVLTC;
+		}
+
+		writel(value | perfect_match, ioaddr + GMAC_VLAN_TAG);
 	} else {
 		u32 value = readl(ioaddr + GMAC_VLAN_TAG);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 5031398e612c..5cda360d5d07 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -555,7 +555,7 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
 }
 
 static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
-				      bool is_double)
+				      u16 perfect_match, bool is_double)
 {
 	void __iomem *ioaddr = hw->pcsr;
 
@@ -576,6 +576,21 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 		}
 
 		writel(value, ioaddr + XGMAC_VLAN_TAG);
+	} else if (perfect_match) {
+		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
+
+		value |= XGMAC_FILTER_VTFE;
+
+		writel(value, ioaddr + XGMAC_PACKET_FILTER);
+
+		value = XGMAC_VLAN_ETV;
+		if (is_double) {
+			value |= XGMAC_VLAN_EDVLP;
+			value |= XGMAC_VLAN_ESVL;
+			value |= XGMAC_VLAN_DOVLTC;
+		}
+
+		writel(value | perfect_match, ioaddr + XGMAC_VLAN_TAG);
 	} else {
 		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index ddb851d99618..1303d1e9a18f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -357,7 +357,7 @@ struct stmmac_ops {
 			     struct stmmac_rss *cfg, u32 num_rxq);
 	/* VLAN */
 	void (*update_vlan_hash)(struct mac_device_info *hw, u32 hash,
-				 bool is_double);
+				 u16 perfect_match, bool is_double);
 	void (*enable_vlan)(struct mac_device_info *hw, u32 type);
 	/* TX Timestamp */
 	int (*get_mac_tx_timestamp)(struct mac_device_info *hw, u64 *ts);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b8ac1744950e..8b76745a7ec4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4207,15 +4207,25 @@ static u32 stmmac_vid_crc32_le(__le16 vid_le)
 static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 {
 	u32 crc, hash = 0;
-	u16 vid;
+	int count = 0;
+	u16 vid = 0;
 
 	for_each_set_bit(vid, priv->active_vlans, VLAN_N_VID) {
 		__le16 vid_le = cpu_to_le16(vid);
 		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
 		hash |= (1 << crc);
+		count++;
+	}
+
+	if (!priv->dma_cap.vlhash) {
+		if (count > 2) /* VID = 0 always passes filter */
+			return -EOPNOTSUPP;
+
+		vid = cpu_to_le16(vid);
+		hash = 0;
 	}
 
-	return stmmac_update_vlan_hash(priv, priv->hw, hash, is_double);
+	return stmmac_update_vlan_hash(priv, priv->hw, hash, vid, is_double);
 }
 
 static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid)
@@ -4224,8 +4234,6 @@ static int stmmac_vlan_rx_add_vid(struct net_device *ndev, __be16 proto, u16 vid
 	bool is_double = false;
 	int ret;
 
-	if (!priv->dma_cap.vlhash)
-		return -EOPNOTSUPP;
 	if (be16_to_cpu(proto) == ETH_P_8021AD)
 		is_double = true;
 
@@ -4244,8 +4252,6 @@ static int stmmac_vlan_rx_kill_vid(struct net_device *ndev, __be16 proto, u16 vi
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	bool is_double = false;
 
-	if (!priv->dma_cap.vlhash)
-		return -EOPNOTSUPP;
 	if (be16_to_cpu(proto) == ETH_P_8021AD)
 		is_double = true;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
