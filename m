Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB445269B0C
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 03:27:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2A7EC3FADF;
	Tue, 15 Sep 2020 01:27:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F39C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 01:27:04 +0000 (UTC)
IronPort-SDR: 5deVCkgi8T3h5TqSmu2Q3pGP6NlGThuZesn4Y1ZThGwQUbfEQ8L/Sx5Olfaht9HcTh0hzXBUtg
 sIP+33JBarGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156615193"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="156615193"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 18:27:04 -0700
IronPort-SDR: tZVelu4X/niBIzR5mobsMcwKMUVbm7vWUpqZa86Y1XfGcpPU/xI+T1FnV+fdQchIMN39qtLbNF
 3By/B/C53Z1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="345632631"
Received: from glass.png.intel.com ([172.30.181.92])
 by orsmga007.jf.intel.com with ESMTP; 14 Sep 2020 18:26:59 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Date: Tue, 15 Sep 2020 09:28:39 +0800
Message-Id: <20200915012840.31841-3-vee.khee.wong@intel.com>
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
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: Fix incorrect
	location to set real_num_rx|tx_queues
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

From: Aashish Verma <aashishx.verma@intel.com>

netif_set_real_num_tx_queues() & netif_set_real_num_rx_queues() should be
used to inform network stack about the real Tx & Rx queue (active) number
in both stmmac_open() and stmmac_resume(), therefore, we move the code
from stmmac_dvr_probe() to stmmac_hw_setup().

Fixes: c02b7a914551 net: stmmac: use netif_set_real_num_{rx,tx}_queues

Signed-off-by: Aashish Verma <aashishx.verma@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9302d8012a10..fea3b77892ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2733,6 +2733,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 		stmmac_enable_tbs(priv, priv->ioaddr, enable, chan);
 	}
 
+	/* Configure real RX and TX queues */
+	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
@@ -4883,10 +4887,6 @@ int stmmac_dvr_probe(struct device *device,
 
 	stmmac_check_ether_addr(priv);
 
-	/* Configure real RX and TX queues */
-	netif_set_real_num_rx_queues(ndev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
-
 	ndev->netdev_ops = &stmmac_netdev_ops;
 
 	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
