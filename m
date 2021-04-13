Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6253D35DB35
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 11:32:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19B20C57B78;
	Tue, 13 Apr 2021 09:32:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75BA2C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 09:32:21 +0000 (UTC)
IronPort-SDR: N1s2TNFwhTWTxcZPThMZD7WOBqZffSBWtFN40+HuiR1mCqkPqEtiM0cSRJMlf9PTW4spywez/V
 nXaEmGv2XcqA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="279681215"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="279681215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 02:32:19 -0700
IronPort-SDR: fqePouQHEYHxvaMPgMveVf7pX/F8esCGV9XWO3d6g0cJ/4AI2Jv4TgtL0ScUmxTEKWr8xiaNxq
 R080VoOgKxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424178074"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 02:32:14 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Tue, 13 Apr 2021 17:36:20 +0800
Message-Id: <20210413093626.3447-2-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413093626.3447-1-boon.leong.ong@intel.com>
References: <20210413093626.3447-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, Andrii Nakryiko <andrii@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/7] net: stmmac: rearrange RX
	buffer allocation and free functions
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

This patch restructures the per RX queue buffer allocation from page_pool
to stmmac_alloc_rx_buffers().

We also rearrange dma_free_rx_skbufs() so that it can be used in
init_dma_rx_desc_rings() during freeing of RX buffer in the event of
page_pool allocation failure to replace the more efficient method earlier.
The replacement is needed to make the RX buffer alloc and free method
scalable to XDP ZC xsk_pool alloc and free later.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 84 +++++++++++--------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 77285646c5fc..f6d3d26ce45a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1475,6 +1475,43 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv, u32 queue, int i)
 	tx_q->tx_skbuff_dma[i].map_as_page = false;
 }
 
+/**
+ * dma_free_rx_skbufs - free RX dma buffers
+ * @priv: private structure
+ * @queue: RX queue index
+ */
+static void dma_free_rx_skbufs(struct stmmac_priv *priv, u32 queue)
+{
+	int i;
+
+	for (i = 0; i < priv->dma_rx_size; i++)
+		stmmac_free_rx_buffer(priv, queue, i);
+}
+
+static int stmmac_alloc_rx_buffers(struct stmmac_priv *priv, u32 queue,
+				   gfp_t flags)
+{
+	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
+	int i;
+
+	for (i = 0; i < priv->dma_rx_size; i++) {
+		struct dma_desc *p;
+		int ret;
+
+		if (priv->extend_desc)
+			p = &((rx_q->dma_erx + i)->basic);
+		else
+			p = rx_q->dma_rx + i;
+
+		ret = stmmac_init_rx_buffers(priv, p, i, flags,
+					     queue);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * stmmac_reinit_rx_buffers - reinit the RX descriptor buffer.
  * @priv: driver private structure
@@ -1547,15 +1584,14 @@ static void stmmac_reinit_rx_buffers(struct stmmac_priv *priv)
 	return;
 
 err_reinit_rx_buffers:
-	do {
-		while (--i >= 0)
-			stmmac_free_rx_buffer(priv, queue, i);
+	while (queue >= 0) {
+		dma_free_rx_skbufs(priv, queue);
 
 		if (queue == 0)
 			break;
 
-		i = priv->dma_rx_size;
-	} while (queue-- > 0);
+		queue--;
+	}
 }
 
 /**
@@ -1572,7 +1608,6 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 	u32 rx_count = priv->plat->rx_queues_to_use;
 	int ret = -ENOMEM;
 	int queue;
-	int i;
 
 	/* RX INITIALIZATION */
 	netif_dbg(priv, probe, priv->dev,
@@ -1580,7 +1615,7 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 
 	for (queue = 0; queue < rx_count; queue++) {
 		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-		int ret;
+
 
 		netif_dbg(priv, probe, priv->dev,
 			  "(%s) dma_rx_phy=0x%08x\n", __func__,
@@ -1596,22 +1631,12 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 			    "Register MEM_TYPE_PAGE_POOL RxQ-%d\n",
 			    rx_q->queue_index);
 
-		for (i = 0; i < priv->dma_rx_size; i++) {
-			struct dma_desc *p;
-
-			if (priv->extend_desc)
-				p = &((rx_q->dma_erx + i)->basic);
-			else
-				p = rx_q->dma_rx + i;
-
-			ret = stmmac_init_rx_buffers(priv, p, i, flags,
-						     queue);
-			if (ret)
-				goto err_init_rx_buffers;
-		}
+		ret = stmmac_alloc_rx_buffers(priv, queue, flags);
+		if (ret < 0)
+			goto err_init_rx_buffers;
 
 		rx_q->cur_rx = 0;
-		rx_q->dirty_rx = (unsigned int)(i - priv->dma_rx_size);
+		rx_q->dirty_rx = 0;
 
 		/* Setup the chained descriptor addresses */
 		if (priv->mode == STMMAC_CHAIN_MODE) {
@@ -1630,13 +1655,11 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 
 err_init_rx_buffers:
 	while (queue >= 0) {
-		while (--i >= 0)
-			stmmac_free_rx_buffer(priv, queue, i);
+		dma_free_rx_skbufs(priv, queue);
 
 		if (queue == 0)
 			break;
 
-		i = priv->dma_rx_size;
 		queue--;
 	}
 
@@ -1731,19 +1754,6 @@ static int init_dma_desc_rings(struct net_device *dev, gfp_t flags)
 	return ret;
 }
 
-/**
- * dma_free_rx_skbufs - free RX dma buffers
- * @priv: private structure
- * @queue: RX queue index
- */
-static void dma_free_rx_skbufs(struct stmmac_priv *priv, u32 queue)
-{
-	int i;
-
-	for (i = 0; i < priv->dma_rx_size; i++)
-		stmmac_free_rx_buffer(priv, queue, i);
-}
-
 /**
  * dma_free_tx_skbufs - free TX dma buffers
  * @priv: private structure
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
