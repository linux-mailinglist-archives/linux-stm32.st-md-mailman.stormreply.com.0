Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2826D2DD
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 07:00:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C451CC3FAE1;
	Thu, 17 Sep 2020 05:00:34 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82E57C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 05:00:30 +0000 (UTC)
IronPort-SDR: tOIwm15IsqMhz0pmUdkttNybaNDH6PrF18sdN+geocBZA+ikbaZo1D77YQLE/6nw2WF1JVUYxe
 gY5qSlyoAMKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="221179456"
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="221179456"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 22:00:28 -0700
IronPort-SDR: I2vTLVsvX8h5UF3mjIn+RSOOfj8ujvCbbBOZ/jLwXgFn+5ric5R27/Gx/NcaTmohGr5vo0j2bz
 KubqHSfrvIVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; d="scan'208";a="508258776"
Received: from glass.png.intel.com ([172.30.181.92])
 by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2020 22:00:24 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 17 Sep 2020 13:02:15 +0800
Message-Id: <20200917050215.8725-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Seow Chen Yong <chen.yong.seow@intel.com>,
 Vijaya Balan Sadhishkhanna <sadhishkhanna.vijaya.balan@intel.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: introduce
	rtnl_lock|unlock() on configuring real_num_rx|tx_queues
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

From: "Tan, Tee Min" <tee.min.tan@intel.com>

For driver open(), rtnl_lock is acquired by network stack but not in the
resume(). Therefore, we introduce lock_acquired boolean to control when
to use rtnl_lock|unlock() within stmmac_hw_setup().

Fixes: 686cff3d7022 ("net: stmmac: Fix incorrect location to set real_num_rx|tx_queues")

Signed-off-by: Tan, Tee Min <tee.min.tan@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index df2c74bbfcff..22e6a3defa78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2607,7 +2607,8 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
  *  0 on success and an appropriate (-)ve integer as defined in errno.h
  *  file on failure.
  */
-static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
+static int stmmac_hw_setup(struct net_device *dev, bool init_ptp,
+			   bool lock_acquired)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u32 rx_cnt = priv->plat->rx_queues_to_use;
@@ -2715,9 +2716,15 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	}
 
 	/* Configure real RX and TX queues */
+	if (!lock_acquired)
+		rtnl_lock();
+
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
 	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
 
+	if (!lock_acquired)
+		rtnl_unlock();
+
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
@@ -2804,7 +2811,7 @@ static int stmmac_open(struct net_device *dev)
 		goto init_error;
 	}
 
-	ret = stmmac_hw_setup(dev, true);
+	ret = stmmac_hw_setup(dev, true, true);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto init_error;
@@ -5238,7 +5245,7 @@ int stmmac_resume(struct device *dev)
 
 	stmmac_clear_descriptors(priv);
 
-	stmmac_hw_setup(ndev, false);
+	stmmac_hw_setup(ndev, false, false);
 	stmmac_init_coalesce(priv);
 	stmmac_set_rx_mode(ndev);
 
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
