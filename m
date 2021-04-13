Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED22135DB37
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 11:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A463CC58D5C;
	Tue, 13 Apr 2021 09:32:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B9B8C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 09:32:31 +0000 (UTC)
IronPort-SDR: UtxRR2mYICZ+tjg2udfNvY79HAvhr6Q8diaPZ4hk0BbQwMIjvBMpCnKJaW+v4xa0oUY5if3tSd
 gydFpdMzKy6A==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="255700221"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="255700221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 02:32:29 -0700
IronPort-SDR: sq66Kb+zGBZ6GtxebDWkkL5H5QQB/hUtKiKfpvIE1BMuHMYqDPrS3YGPUTn9jAOpO9VOVf26d4
 XYfs7nVIBYYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424178161"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 02:32:24 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Tue, 13 Apr 2021 17:36:22 +0800
Message-Id: <20210413093626.3447-4-boon.leong.ong@intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 3/7] net: stmmac: refactor
	stmmac_init_rx_buffers for stmmac_reinit_rx_buffers
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

The per-queue RX buffer allocation in stmmac_reinit_rx_buffers() can be
made to use stmmac_alloc_rx_buffers() by merging the page_pool alloc
checks for "buf->page" and "buf->sec_page" in stmmac_init_rx_buffers().

This is in preparation for XSK pool allocation later.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 378 +++++++++---------
 1 file changed, 189 insertions(+), 189 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a6c3414fd231..7e889ef0c7b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1388,12 +1388,14 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv, struct dma_desc *p,
 	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
 
-	buf->page = page_pool_dev_alloc_pages(rx_q->page_pool);
-	if (!buf->page)
-		return -ENOMEM;
-	buf->page_offset = stmmac_rx_offset(priv);
+	if (!buf->page) {
+		buf->page = page_pool_dev_alloc_pages(rx_q->page_pool);
+		if (!buf->page)
+			return -ENOMEM;
+		buf->page_offset = stmmac_rx_offset(priv);
+	}
 
-	if (priv->sph) {
+	if (priv->sph && !buf->sec_page) {
 		buf->sec_page = page_pool_dev_alloc_pages(rx_q->page_pool);
 		if (!buf->sec_page)
 			return -ENOMEM;
@@ -1547,48 +1549,16 @@ static void stmmac_reinit_rx_buffers(struct stmmac_priv *priv)
 {
 	u32 rx_count = priv->plat->rx_queues_to_use;
 	u32 queue;
-	int i;
 
 	for (queue = 0; queue < rx_count; queue++)
 		dma_recycle_rx_skbufs(priv, queue);
 
 	for (queue = 0; queue < rx_count; queue++) {
-		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-
-		for (i = 0; i < priv->dma_rx_size; i++) {
-			struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-			struct dma_desc *p;
-
-			if (priv->extend_desc)
-				p = &((rx_q->dma_erx + i)->basic);
-			else
-				p = rx_q->dma_rx + i;
-
-			if (!buf->page) {
-				buf->page = page_pool_dev_alloc_pages(rx_q->page_pool);
-				if (!buf->page)
-					goto err_reinit_rx_buffers;
-
-				buf->addr = page_pool_get_dma_addr(buf->page) +
-					    buf->page_offset;
-			}
-
-			if (priv->sph && !buf->sec_page) {
-				buf->sec_page = page_pool_dev_alloc_pages(rx_q->page_pool);
-				if (!buf->sec_page)
-					goto err_reinit_rx_buffers;
-
-				buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
-			}
+		int ret;
 
-			stmmac_set_desc_addr(priv, p, buf->addr);
-			if (priv->sph)
-				stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-			else
-				stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
-			if (priv->dma_buf_sz == BUF_SIZE_16KiB)
-				stmmac_init_desc3(priv, p);
-		}
+		ret = stmmac_alloc_rx_buffers(priv, queue, GFP_KERNEL);
+		if (ret < 0)
+			goto err_reinit_rx_buffers;
 	}
 
 	return;
@@ -1791,153 +1761,173 @@ static void stmmac_free_tx_skbufs(struct stmmac_priv *priv)
 }
 
 /**
- * free_dma_rx_desc_resources - free RX dma desc resources
+ * __free_dma_rx_desc_resources - free RX dma desc resources (per queue)
  * @priv: private structure
+ * @queue: RX queue index
  */
-static void free_dma_rx_desc_resources(struct stmmac_priv *priv)
+static void __free_dma_rx_desc_resources(struct stmmac_priv *priv, u32 queue)
 {
-	u32 rx_count = priv->plat->rx_queues_to_use;
-	u32 queue;
+	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
 
-	/* Free RX queue resources */
-	for (queue = 0; queue < rx_count; queue++) {
-		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
+	/* Release the DMA RX socket buffers */
+	dma_free_rx_skbufs(priv, queue);
 
-		/* Release the DMA RX socket buffers */
-		dma_free_rx_skbufs(priv, queue);
+	/* Free DMA regions of consistent memory previously allocated */
+	if (!priv->extend_desc)
+		dma_free_coherent(priv->device, priv->dma_rx_size *
+				  sizeof(struct dma_desc),
+				  rx_q->dma_rx, rx_q->dma_rx_phy);
+	else
+		dma_free_coherent(priv->device, priv->dma_rx_size *
+				  sizeof(struct dma_extended_desc),
+				  rx_q->dma_erx, rx_q->dma_rx_phy);
 
-		/* Free DMA regions of consistent memory previously allocated */
-		if (!priv->extend_desc)
-			dma_free_coherent(priv->device, priv->dma_rx_size *
-					  sizeof(struct dma_desc),
-					  rx_q->dma_rx, rx_q->dma_rx_phy);
-		else
-			dma_free_coherent(priv->device, priv->dma_rx_size *
-					  sizeof(struct dma_extended_desc),
-					  rx_q->dma_erx, rx_q->dma_rx_phy);
+	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
+		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
-		if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
-			xdp_rxq_info_unreg(&rx_q->xdp_rxq);
+	kfree(rx_q->buf_pool);
+	if (rx_q->page_pool)
+		page_pool_destroy(rx_q->page_pool);
+}
 
-		kfree(rx_q->buf_pool);
-		if (rx_q->page_pool)
-			page_pool_destroy(rx_q->page_pool);
-	}
+static void free_dma_rx_desc_resources(struct stmmac_priv *priv)
+{
+	u32 rx_count = priv->plat->rx_queues_to_use;
+	u32 queue;
+
+	/* Free RX queue resources */
+	for (queue = 0; queue < rx_count; queue++)
+		__free_dma_rx_desc_resources(priv, queue);
 }
 
 /**
- * free_dma_tx_desc_resources - free TX dma desc resources
+ * __free_dma_tx_desc_resources - free TX dma desc resources (per queue)
  * @priv: private structure
+ * @queue: TX queue index
  */
-static void free_dma_tx_desc_resources(struct stmmac_priv *priv)
+static void __free_dma_tx_desc_resources(struct stmmac_priv *priv, u32 queue)
 {
-	u32 tx_count = priv->plat->tx_queues_to_use;
-	u32 queue;
+	struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
+	size_t size;
+	void *addr;
 
-	/* Free TX queue resources */
-	for (queue = 0; queue < tx_count; queue++) {
-		struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
-		size_t size;
-		void *addr;
+	/* Release the DMA TX socket buffers */
+	dma_free_tx_skbufs(priv, queue);
+
+	if (priv->extend_desc) {
+		size = sizeof(struct dma_extended_desc);
+		addr = tx_q->dma_etx;
+	} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
+		size = sizeof(struct dma_edesc);
+		addr = tx_q->dma_entx;
+	} else {
+		size = sizeof(struct dma_desc);
+		addr = tx_q->dma_tx;
+	}
 
-		/* Release the DMA TX socket buffers */
-		dma_free_tx_skbufs(priv, queue);
+	size *= priv->dma_tx_size;
 
-		if (priv->extend_desc) {
-			size = sizeof(struct dma_extended_desc);
-			addr = tx_q->dma_etx;
-		} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
-			size = sizeof(struct dma_edesc);
-			addr = tx_q->dma_entx;
-		} else {
-			size = sizeof(struct dma_desc);
-			addr = tx_q->dma_tx;
-		}
+	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
 
-		size *= priv->dma_tx_size;
+	kfree(tx_q->tx_skbuff_dma);
+	kfree(tx_q->tx_skbuff);
+}
 
-		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+static void free_dma_tx_desc_resources(struct stmmac_priv *priv)
+{
+	u32 tx_count = priv->plat->tx_queues_to_use;
+	u32 queue;
 
-		kfree(tx_q->tx_skbuff_dma);
-		kfree(tx_q->tx_skbuff);
-	}
+	/* Free TX queue resources */
+	for (queue = 0; queue < tx_count; queue++)
+		__free_dma_tx_desc_resources(priv, queue);
 }
 
 /**
- * alloc_dma_rx_desc_resources - alloc RX resources.
+ * __alloc_dma_rx_desc_resources - alloc RX resources (per queue).
  * @priv: private structure
+ * @queue: RX queue index
  * Description: according to which descriptor can be used (extend or basic)
  * this function allocates the resources for TX and RX paths. In case of
  * reception, for example, it pre-allocated the RX socket buffer in order to
  * allow zero-copy mechanism.
  */
-static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv)
+static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv, u32 queue)
 {
+	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
+	struct stmmac_channel *ch = &priv->channel[queue];
 	bool xdp_prog = stmmac_xdp_is_enabled(priv);
-	u32 rx_count = priv->plat->rx_queues_to_use;
-	int ret = -ENOMEM;
-	u32 queue;
+	struct page_pool_params pp_params = { 0 };
+	unsigned int num_pages;
+	int ret;
 
-	/* RX queues buffers and DMA */
-	for (queue = 0; queue < rx_count; queue++) {
-		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-		struct stmmac_channel *ch = &priv->channel[queue];
-		struct page_pool_params pp_params = { 0 };
-		unsigned int num_pages;
-		int ret;
+	rx_q->queue_index = queue;
+	rx_q->priv_data = priv;
+
+	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
+	pp_params.pool_size = priv->dma_rx_size;
+	num_pages = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
+	pp_params.order = ilog2(num_pages);
+	pp_params.nid = dev_to_node(priv->device);
+	pp_params.dev = priv->device;
+	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
+	pp_params.offset = stmmac_rx_offset(priv);
+	pp_params.max_len = STMMAC_MAX_RX_BUF_SIZE(num_pages);
+
+	rx_q->page_pool = page_pool_create(&pp_params);
+	if (IS_ERR(rx_q->page_pool)) {
+		ret = PTR_ERR(rx_q->page_pool);
+		rx_q->page_pool = NULL;
+		return ret;
+	}
 
-		rx_q->queue_index = queue;
-		rx_q->priv_data = priv;
-
-		pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
-		pp_params.pool_size = priv->dma_rx_size;
-		num_pages = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
-		pp_params.order = ilog2(num_pages);
-		pp_params.nid = dev_to_node(priv->device);
-		pp_params.dev = priv->device;
-		pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-		pp_params.offset = stmmac_rx_offset(priv);
-		pp_params.max_len = STMMAC_MAX_RX_BUF_SIZE(num_pages);
-
-		rx_q->page_pool = page_pool_create(&pp_params);
-		if (IS_ERR(rx_q->page_pool)) {
-			ret = PTR_ERR(rx_q->page_pool);
-			rx_q->page_pool = NULL;
-			goto err_dma;
-		}
+	rx_q->buf_pool = kcalloc(priv->dma_rx_size,
+				 sizeof(*rx_q->buf_pool),
+				 GFP_KERNEL);
+	if (!rx_q->buf_pool)
+		return -ENOMEM;
 
-		rx_q->buf_pool = kcalloc(priv->dma_rx_size,
-					 sizeof(*rx_q->buf_pool),
-					 GFP_KERNEL);
-		if (!rx_q->buf_pool)
-			goto err_dma;
+	if (priv->extend_desc) {
+		rx_q->dma_erx = dma_alloc_coherent(priv->device,
+						   priv->dma_rx_size *
+						   sizeof(struct dma_extended_desc),
+						   &rx_q->dma_rx_phy,
+						   GFP_KERNEL);
+		if (!rx_q->dma_erx)
+			return -ENOMEM;
 
-		if (priv->extend_desc) {
-			rx_q->dma_erx = dma_alloc_coherent(priv->device,
-							   priv->dma_rx_size *
-							   sizeof(struct dma_extended_desc),
-							   &rx_q->dma_rx_phy,
-							   GFP_KERNEL);
-			if (!rx_q->dma_erx)
-				goto err_dma;
+	} else {
+		rx_q->dma_rx = dma_alloc_coherent(priv->device,
+						  priv->dma_rx_size *
+						  sizeof(struct dma_desc),
+						  &rx_q->dma_rx_phy,
+						  GFP_KERNEL);
+		if (!rx_q->dma_rx)
+			return -ENOMEM;
+	}
 
-		} else {
-			rx_q->dma_rx = dma_alloc_coherent(priv->device,
-							  priv->dma_rx_size *
-							  sizeof(struct dma_desc),
-							  &rx_q->dma_rx_phy,
-							  GFP_KERNEL);
-			if (!rx_q->dma_rx)
-				goto err_dma;
-		}
+	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev,
+			       rx_q->queue_index,
+			       ch->rx_napi.napi_id);
+	if (ret) {
+		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
+		return -EINVAL;
+	}
 
-		ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev,
-				       rx_q->queue_index,
-				       ch->rx_napi.napi_id);
-		if (ret) {
-			netdev_err(priv->dev, "Failed to register xdp rxq info\n");
+	return 0;
+}
+
+static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv)
+{
+	u32 rx_count = priv->plat->rx_queues_to_use;
+	u32 queue;
+	int ret;
+
+	/* RX queues buffers and DMA */
+	for (queue = 0; queue < rx_count; queue++) {
+		ret = __alloc_dma_rx_desc_resources(priv, queue);
+		if (ret)
 			goto err_dma;
-		}
 	}
 
 	return 0;
@@ -1949,60 +1939,70 @@ static int alloc_dma_rx_desc_resources(struct stmmac_priv *priv)
 }
 
 /**
- * alloc_dma_tx_desc_resources - alloc TX resources.
+ * __alloc_dma_tx_desc_resources - alloc TX resources (per queue).
  * @priv: private structure
+ * @queue: TX queue index
  * Description: according to which descriptor can be used (extend or basic)
  * this function allocates the resources for TX and RX paths. In case of
  * reception, for example, it pre-allocated the RX socket buffer in order to
  * allow zero-copy mechanism.
  */
-static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv)
+static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv, u32 queue)
 {
-	u32 tx_count = priv->plat->tx_queues_to_use;
-	int ret = -ENOMEM;
-	u32 queue;
+	struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
+	size_t size;
+	void *addr;
 
-	/* TX queues buffers and DMA */
-	for (queue = 0; queue < tx_count; queue++) {
-		struct stmmac_tx_queue *tx_q = &priv->tx_queue[queue];
-		size_t size;
-		void *addr;
+	tx_q->queue_index = queue;
+	tx_q->priv_data = priv;
 
-		tx_q->queue_index = queue;
-		tx_q->priv_data = priv;
+	tx_q->tx_skbuff_dma = kcalloc(priv->dma_tx_size,
+				      sizeof(*tx_q->tx_skbuff_dma),
+				      GFP_KERNEL);
+	if (!tx_q->tx_skbuff_dma)
+		return -ENOMEM;
 
-		tx_q->tx_skbuff_dma = kcalloc(priv->dma_tx_size,
-					      sizeof(*tx_q->tx_skbuff_dma),
-					      GFP_KERNEL);
-		if (!tx_q->tx_skbuff_dma)
-			goto err_dma;
+	tx_q->tx_skbuff = kcalloc(priv->dma_tx_size,
+				  sizeof(struct sk_buff *),
+				  GFP_KERNEL);
+	if (!tx_q->tx_skbuff)
+		return -ENOMEM;
 
-		tx_q->tx_skbuff = kcalloc(priv->dma_tx_size,
-					  sizeof(struct sk_buff *),
-					  GFP_KERNEL);
-		if (!tx_q->tx_skbuff)
-			goto err_dma;
+	if (priv->extend_desc)
+		size = sizeof(struct dma_extended_desc);
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		size = sizeof(struct dma_edesc);
+	else
+		size = sizeof(struct dma_desc);
 
-		if (priv->extend_desc)
-			size = sizeof(struct dma_extended_desc);
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			size = sizeof(struct dma_edesc);
-		else
-			size = sizeof(struct dma_desc);
+	size *= priv->dma_tx_size;
 
-		size *= priv->dma_tx_size;
+	addr = dma_alloc_coherent(priv->device, size,
+				  &tx_q->dma_tx_phy, GFP_KERNEL);
+	if (!addr)
+		return -ENOMEM;
 
-		addr = dma_alloc_coherent(priv->device, size,
-					  &tx_q->dma_tx_phy, GFP_KERNEL);
-		if (!addr)
-			goto err_dma;
+	if (priv->extend_desc)
+		tx_q->dma_etx = addr;
+	else if (tx_q->tbs & STMMAC_TBS_AVAIL)
+		tx_q->dma_entx = addr;
+	else
+		tx_q->dma_tx = addr;
 
-		if (priv->extend_desc)
-			tx_q->dma_etx = addr;
-		else if (tx_q->tbs & STMMAC_TBS_AVAIL)
-			tx_q->dma_entx = addr;
-		else
-			tx_q->dma_tx = addr;
+	return 0;
+}
+
+static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv)
+{
+	u32 tx_count = priv->plat->tx_queues_to_use;
+	u32 queue;
+	int ret;
+
+	/* TX queues buffers and DMA */
+	for (queue = 0; queue < tx_count; queue++) {
+		ret = __alloc_dma_tx_desc_resources(priv, queue);
+		if (ret)
+			goto err_dma;
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
