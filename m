Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD5264684
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 15:04:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24A24C424B9;
	Thu, 10 Sep 2020 13:04:05 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DE32C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:04:02 +0000 (UTC)
IronPort-SDR: f4hyQIZb4+1e6mSSzM8G1dkPNQibeKzGqlbYqDsk01FFTnzE5I4JpScZFTC6FWKFYQ+UUXx3hY
 PDKchmQZnHjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146245267"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146245267"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:04:00 -0700
IronPort-SDR: KgbJY80cLw6sf4uRD0fDKIrG2SMUf9VIjFwG8qqVPU33W5i+sT9V3YPssiH8kH4hFz+B4rzSME
 4ADWV6S+CiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="329325728"
Received: from glass.png.intel.com ([172.30.181.92])
 by fmsmga004.fm.intel.com with ESMTP; 10 Sep 2020 06:03:56 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Thu, 10 Sep 2020 21:05:40 +0800
Message-Id: <20200910130540.19171-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: use
	netif_tx_start|stop_all_queues() function
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

The current implementation of stmmac_stop_all_queues() and
stmmac_start_all_queues() will not work correctly when the value of
tx_queues_to_use is changed through ethtool -L DEVNAME rx N tx M command.

Also, netif_tx_start|stop_all_queues() are only needed in driver open()
and close() only.

Fixes: c22a3f48 net: stmmac: adding multiple napi mechanism

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fea3b77892ab..90c1c37b64e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -176,32 +176,6 @@ static void stmmac_enable_all_queues(struct stmmac_priv *priv)
 	}
 }
 
-/**
- * stmmac_stop_all_queues - Stop all queues
- * @priv: driver private structure
- */
-static void stmmac_stop_all_queues(struct stmmac_priv *priv)
-{
-	u32 tx_queues_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
-
-	for (queue = 0; queue < tx_queues_cnt; queue++)
-		netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));
-}
-
-/**
- * stmmac_start_all_queues - Start all queues
- * @priv: driver private structure
- */
-static void stmmac_start_all_queues(struct stmmac_priv *priv)
-{
-	u32 tx_queues_cnt = priv->plat->tx_queues_to_use;
-	u32 queue;
-
-	for (queue = 0; queue < tx_queues_cnt; queue++)
-		netif_tx_start_queue(netdev_get_tx_queue(priv->dev, queue));
-}
-
 static void stmmac_service_event_schedule(struct stmmac_priv *priv)
 {
 	if (!test_bit(STMMAC_DOWN, &priv->state) &&
@@ -2865,7 +2839,7 @@ static int stmmac_open(struct net_device *dev)
 	}
 
 	stmmac_enable_all_queues(priv);
-	stmmac_start_all_queues(priv);
+	netif_tx_start_all_queues(priv->dev);
 
 	return 0;
 
@@ -2908,8 +2882,6 @@ static int stmmac_release(struct net_device *dev)
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
 
-	stmmac_stop_all_queues(priv);
-
 	stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
@@ -5117,7 +5089,6 @@ int stmmac_suspend(struct device *dev)
 	mutex_lock(&priv->lock);
 
 	netif_device_detach(ndev);
-	stmmac_stop_all_queues(priv);
 
 	stmmac_disable_all_queues(priv);
 
@@ -5244,8 +5215,6 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_enable_all_queues(priv);
 
-	stmmac_start_all_queues(priv);
-
 	mutex_unlock(&priv->lock);
 
 	if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
