Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC48E269B0A
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 03:27:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96A0DC3FADF;
	Tue, 15 Sep 2020 01:27:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07A4FC3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 01:26:59 +0000 (UTC)
IronPort-SDR: H8dmu6I+3LIcQxbO8fYGYKagGOw8rprJ0WKWD2NGqrPuvxujf74YKTpZVEWfmOrv79ZiFwP8Wp
 fFgsxFcyUdoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156615188"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="156615188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 18:26:59 -0700
IronPort-SDR: jIVEJuYQqCga5XucY4eSzlHnvakjDw8IdBqZl0oHDxkB5fcfaVIG9XMl2iGjjEKSKqNESfA+Vz
 LAOWaaPvdhYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="345632604"
Received: from glass.png.intel.com ([172.30.181.92])
 by orsmga007.jf.intel.com with ESMTP; 14 Sep 2020 18:26:55 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Date: Tue, 15 Sep 2020 09:28:38 +0800
Message-Id: <20200915012840.31841-2-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200915012840.31841-1-vee.khee.wong@intel.com>
References: <20200915012840.31841-1-vee.khee.wong@intel.com>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Rusell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Seow Chen Yong <chen.yong.seow@intel.com>,
 Vijaya Balan Sadhishkhanna <sadhishkhanna.vijaya.balan@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: add ethtool support
	for get/set channels
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

From: Ong Boon Leong <boon.leong.ong@intel.com>

Restructure NAPI add and delete process so that we can call them
accordingly in open() and ethtool_set_channels() accordingly.

Introduced stmmac_reinit_queues() to handle the transition needed
for changing Rx & Tx channels accordingly.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 26 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 94 +++++++++++++------
 3 files changed, 93 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 9c02fc754bf1..509ce067538e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -264,6 +264,7 @@ int stmmac_dvr_probe(struct device *device,
 		     struct stmmac_resources *res);
 void stmmac_disable_eee_mode(struct stmmac_priv *priv);
 bool stmmac_eee_init(struct stmmac_priv *priv);
+int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 
 #if IS_ENABLED(CONFIG_STMMAC_SELFTESTS)
 void stmmac_selftest_run(struct net_device *dev,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index ac5e8cc5fb9f..db681287c273 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -840,6 +840,30 @@ static int stmmac_set_rxfh(struct net_device *dev, const u32 *indir,
 				    priv->plat->rx_queues_to_use);
 }
 
+static void stmmac_get_channels(struct net_device *dev,
+				struct ethtool_channels *chan)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	chan->rx_count = priv->plat->rx_queues_to_use;
+	chan->tx_count = priv->plat->tx_queues_to_use;
+	chan->max_rx = priv->dma_cap.number_rx_queues;
+	chan->max_tx = priv->dma_cap.number_tx_queues;
+}
+
+static int stmmac_set_channels(struct net_device *dev,
+			       struct ethtool_channels *chan)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	if (chan->rx_count > priv->dma_cap.number_rx_queues ||
+	    chan->tx_count > priv->dma_cap.number_tx_queues ||
+	    !chan->rx_count || !chan->tx_count)
+		return -EINVAL;
+
+	return stmmac_reinit_queues(dev, chan->rx_count, chan->tx_count);
+}
+
 static int stmmac_get_ts_info(struct net_device *dev,
 			      struct ethtool_ts_info *info)
 {
@@ -941,6 +965,8 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.get_ts_info = stmmac_get_ts_info,
 	.get_coalesce = stmmac_get_coalesce,
 	.set_coalesce = stmmac_set_coalesce,
+	.get_channels = stmmac_get_channels,
+	.set_channels = stmmac_set_channels,
 	.get_tunable = stmmac_get_tunable,
 	.set_tunable = stmmac_set_tunable,
 	.get_link_ksettings = stmmac_ethtool_get_link_ksettings,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 89b2b3472852..9302d8012a10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4740,6 +4740,69 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	return 0;
 }
 
+static void stmmac_napi_add(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 queue, maxq;
+
+	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
+
+	for (queue = 0; queue < maxq; queue++) {
+		struct stmmac_channel *ch = &priv->channel[queue];
+
+		ch->priv_data = priv;
+		ch->index = queue;
+
+		if (queue < priv->plat->rx_queues_to_use) {
+			netif_napi_add(dev, &ch->rx_napi, stmmac_napi_poll_rx,
+				       NAPI_POLL_WEIGHT);
+		}
+		if (queue < priv->plat->tx_queues_to_use) {
+			netif_tx_napi_add(dev, &ch->tx_napi,
+					  stmmac_napi_poll_tx,
+					  NAPI_POLL_WEIGHT);
+		}
+	}
+}
+
+static void stmmac_napi_del(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u32 queue, maxq;
+
+	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
+
+	for (queue = 0; queue < maxq; queue++) {
+		struct stmmac_channel *ch = &priv->channel[queue];
+
+		if (queue < priv->plat->rx_queues_to_use)
+			netif_napi_del(&ch->rx_napi);
+		if (queue < priv->plat->tx_queues_to_use)
+			netif_napi_del(&ch->tx_napi);
+	}
+}
+
+int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	int ret = 0;
+
+	if (netif_running(dev))
+		stmmac_release(dev);
+
+	stmmac_napi_del(dev);
+
+	priv->plat->rx_queues_to_use = rx_cnt;
+	priv->plat->tx_queues_to_use = tx_cnt;
+
+	stmmac_napi_add(dev);
+
+	if (netif_running(dev))
+		ret = stmmac_open(dev);
+
+	return ret;
+}
+
 /**
  * stmmac_dvr_probe
  * @device: device pointer
@@ -4756,7 +4819,7 @@ int stmmac_dvr_probe(struct device *device,
 {
 	struct net_device *ndev = NULL;
 	struct stmmac_priv *priv;
-	u32 queue, rxq, maxq;
+	u32 rxq;
 	int i, ret = 0;
 
 	ndev = devm_alloc_etherdev_mqs(device, sizeof(struct stmmac_priv),
@@ -4921,25 +4984,7 @@ int stmmac_dvr_probe(struct device *device,
 		priv->flow_ctrl = FLOW_AUTO;	/* RX/TX pause on */
 
 	/* Setup channels NAPI */
-	maxq = max(priv->plat->rx_queues_to_use, priv->plat->tx_queues_to_use);
-
-	for (queue = 0; queue < maxq; queue++) {
-		struct stmmac_channel *ch = &priv->channel[queue];
-
-		spin_lock_init(&ch->lock);
-		ch->priv_data = priv;
-		ch->index = queue;
-
-		if (queue < priv->plat->rx_queues_to_use) {
-			netif_napi_add(ndev, &ch->rx_napi, stmmac_napi_poll_rx,
-				       NAPI_POLL_WEIGHT);
-		}
-		if (queue < priv->plat->tx_queues_to_use) {
-			netif_tx_napi_add(ndev, &ch->tx_napi,
-					  stmmac_napi_poll_tx,
-					  NAPI_POLL_WEIGHT);
-		}
-	}
+	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
 
@@ -5004,14 +5049,7 @@ int stmmac_dvr_probe(struct device *device,
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
 error_mdio_register:
-	for (queue = 0; queue < maxq; queue++) {
-		struct stmmac_channel *ch = &priv->channel[queue];
-
-		if (queue < priv->plat->rx_queues_to_use)
-			netif_napi_del(&ch->rx_napi);
-		if (queue < priv->plat->tx_queues_to_use)
-			netif_napi_del(&ch->tx_napi);
-	}
+	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
 
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
