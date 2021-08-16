Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755953ED13D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 11:48:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D04F6C5A4D6;
	Mon, 16 Aug 2021 09:48:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C061EC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 06:19:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="195387478"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="195387478"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 23:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="678986822"
Received: from vijay.png.intel.com ([10.88.229.73])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 23:19:22 -0700
From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com
Date: Mon, 16 Aug 2021 14:15:59 +0800
Message-Id: <b0fd3bf4e5c105e959df60d3c876297721b62ee6.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
In-Reply-To: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
References: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:48:14 +0000
Cc: weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vijayakannan.ayyathurai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 2/3] net: stmmac: add ethtool
	per-queue statistic framework
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

Adding generic ethtool per-queue statistic framework to display the
statistics for each rx/tx queue. In future, users can avail it to add
more per-queue specific counters. Number of rx/tx queues displayed is
depending on the available rx/tx queues in that particular MAC config
and this number is limited up to the MTL_MAX_{RX|TX}_QUEUES defined
in the driver.

Ethtool per-queue statistic display will look like below, when users
start adding more counters.

Example:
 q0_tx_statA:
 q0_tx_statB:
 q0_tx_statC:
 |
 q0_tx_statX:
 .
 .
 .
 qMAX_tx_statA:
 qMAX_tx_statB:
 qMAX_tx_statC:
 |
 qMAX_tx_statX:

 q0_rx_statA:
 q0_rx_statB:
 q0_rx_statC:
 |
 q0_rx_statX:
 .
 .
 .
 qMAX_rx_statA:
 qMAX_rx_statB:
 qMAX_rx_statC:
 |
 qMAX_rx_statX:

In addition, this patch has the support on displaying the number of
packets received and transmitted per queue.

Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  | 11 ++++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 65 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 ++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 5fecc83f175b..79333deef2e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -58,6 +58,14 @@
 #undef FRAME_FILTER_DEBUG
 /* #define FRAME_FILTER_DEBUG */
 
+struct stmmac_txq_stats {
+	unsigned long tx_pkt_n;
+};
+
+struct stmmac_rxq_stats {
+	unsigned long rx_pkt_n;
+};
+
 /* Extra statistic and debug information exposed by ethtool */
 struct stmmac_extra_stats {
 	/* Transmit errors */
@@ -189,6 +197,9 @@ struct stmmac_extra_stats {
 	unsigned long mtl_est_hlbf;
 	unsigned long mtl_est_btre;
 	unsigned long mtl_est_btrlm;
+	/* per queue statistics */
+	struct stmmac_txq_stats txq_stats[MTL_MAX_TX_QUEUES];
+	struct stmmac_rxq_stats rxq_stats[MTL_MAX_RX_QUEUES];
 };
 
 /* Safety Feature statistics exposed by ethtool */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d0ce608b81c3..10c0895d0b43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -261,6 +261,16 @@ static const struct stmmac_stats stmmac_mmc[] = {
 };
 #define STMMAC_MMC_STATS_LEN ARRAY_SIZE(stmmac_mmc)
 
+static const char stmmac_qstats_tx_string[][ETH_GSTRING_LEN] = {
+	"tx_pkt_n",
+#define STMMAC_TXQ_STATS ARRAY_SIZE(stmmac_qstats_tx_string)
+};
+
+static const char stmmac_qstats_rx_string[][ETH_GSTRING_LEN] = {
+	"rx_pkt_n",
+#define STMMAC_RXQ_STATS ARRAY_SIZE(stmmac_qstats_rx_string)
+};
+
 static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 				      struct ethtool_drvinfo *info)
 {
@@ -510,6 +520,31 @@ stmmac_set_pauseparam(struct net_device *netdev,
 	}
 }
 
+static void stmmac_get_per_qstats(struct stmmac_priv *priv, u64 *data)
+{
+	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	int q, stat;
+	char *p;
+
+	for (q = 0; q < tx_cnt; q++) {
+		p = (char *)priv + offsetof(struct stmmac_priv,
+					    xstats.txq_stats[q].tx_pkt_n);
+		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
+			*data++ = (*(u64 *)p);
+			p += sizeof(u64 *);
+		}
+	}
+	for (q = 0; q < rx_cnt; q++) {
+		p = (char *)priv + offsetof(struct stmmac_priv,
+					    xstats.rxq_stats[q].rx_pkt_n);
+		for (stat = 0; stat < STMMAC_RXQ_STATS; stat++) {
+			*data++ = (*(u64 *)p);
+			p += sizeof(u64 *);
+		}
+	}
+}
+
 static void stmmac_get_ethtool_stats(struct net_device *dev,
 				 struct ethtool_stats *dummy, u64 *data)
 {
@@ -560,16 +595,21 @@ static void stmmac_get_ethtool_stats(struct net_device *dev,
 		data[j++] = (stmmac_gstrings_stats[i].sizeof_stat ==
 			     sizeof(u64)) ? (*(u64 *)p) : (*(u32 *)p);
 	}
+	stmmac_get_per_qstats(priv, &data[j]);
 }
 
 static int stmmac_get_sset_count(struct net_device *netdev, int sset)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u32 rx_cnt = priv->plat->rx_queues_to_use;
 	int i, len, safety_len = 0;
 
 	switch (sset) {
 	case ETH_SS_STATS:
-		len = STMMAC_STATS_LEN;
+		len = STMMAC_STATS_LEN +
+		      STMMAC_TXQ_STATS * tx_cnt +
+		      STMMAC_RXQ_STATS * rx_cnt;
 
 		if (priv->dma_cap.rmon)
 			len += STMMAC_MMC_STATS_LEN;
@@ -592,6 +632,28 @@ static int stmmac_get_sset_count(struct net_device *netdev, int sset)
 	}
 }
 
+static void stmmac_get_qstats_string(struct stmmac_priv *priv, u8 *data)
+{
+	u32 tx_cnt = priv->plat->tx_queues_to_use;
+	u32 rx_cnt = priv->plat->rx_queues_to_use;
+	int q, stat;
+
+	for (q = 0; q < tx_cnt; q++) {
+		for (stat = 0; stat < STMMAC_TXQ_STATS; stat++) {
+			snprintf(data, ETH_GSTRING_LEN, "q%d_%s", q,
+				 stmmac_qstats_tx_string[stat]);
+			data += ETH_GSTRING_LEN;
+		}
+	}
+	for (q = 0; q < rx_cnt; q++) {
+		for (stat = 0; stat < STMMAC_RXQ_STATS; stat++) {
+			snprintf(data, ETH_GSTRING_LEN, "q%d_%s", q,
+				 stmmac_qstats_rx_string[stat]);
+			data += ETH_GSTRING_LEN;
+		}
+	}
+}
+
 static void stmmac_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 {
 	int i;
@@ -622,6 +684,7 @@ static void stmmac_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 				ETH_GSTRING_LEN);
 			p += ETH_GSTRING_LEN;
 		}
+		stmmac_get_qstats_string(priv, p);
 		break;
 	case ETH_SS_TEST:
 		stmmac_selftest_get_strings(priv, p);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a2aa75cb184e..7b3fcf558603 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2500,6 +2500,7 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue)
 			} else {
 				priv->dev->stats.tx_packets++;
 				priv->xstats.tx_pkt_n++;
+				priv->xstats.txq_stats[queue].tx_pkt_n++;
 			}
 			if (skb)
 				stmmac_get_tx_hwtstamp(priv, p, skb);
@@ -5000,6 +5001,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 	stmmac_finalize_xdp_rx(priv, xdp_status);
 
+	priv->xstats.rx_pkt_n += count;
+	priv->xstats.rxq_stats[queue].rx_pkt_n += count;
+
 	if (xsk_uses_need_wakeup(rx_q->xsk_pool)) {
 		if (failure || stmmac_rx_dirty(priv, queue) > 0)
 			xsk_set_rx_need_wakeup(rx_q->xsk_pool);
@@ -5287,6 +5291,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	stmmac_rx_refill(priv, queue);
 
 	priv->xstats.rx_pkt_n += count;
+	priv->xstats.rxq_stats[queue].rx_pkt_n += count;
 
 	return count;
 }
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
