Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D046A35DB36
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 11:32:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97BEBC58D58;
	Tue, 13 Apr 2021 09:32:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E20E6C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 09:32:24 +0000 (UTC)
IronPort-SDR: IJIdMcPwk0do8heuDPdawa2DBFQvsb9f1S35VHOWK5Sk0GQ//cdJRwjo1u7DeZHLAeuujSAo3d
 4UxsuyGhKfzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="279681227"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="279681227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 02:32:24 -0700
IronPort-SDR: rKmz5953TVTjrac7+HQsxRg+QzizWZAvu7ZVaUyWJXiddu2k4mczWcqTf76K84pDmNgbsz+LZj
 asyQzj5l+NJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424178125"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 02:32:19 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Tue, 13 Apr 2021 17:36:21 +0800
Message-Id: <20210413093626.3447-3-boon.leong.ong@intel.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 2/7] net: stmmac: introduce
	dma_recycle_rx_skbufs for stmmac_reinit_rx_buffers
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

Rearrange RX buffer page_pool recycling logics into dma_recycle_rx_skbufs,
so that we prepare stmmac_reinit_rx_buffers() for XSK pool expansion.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 44 ++++++++++++-------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f6d3d26ce45a..a6c3414fd231 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1512,6 +1512,31 @@ static int stmmac_alloc_rx_buffers(struct stmmac_priv *priv, u32 queue,
 	return 0;
 }
 
+/**
+ * dma_recycle_rx_skbufs - recycle RX dma buffers
+ * @priv: private structure
+ * @queue: RX queue index
+ */
+static void dma_recycle_rx_skbufs(struct stmmac_priv *priv, u32 queue)
+{
+	struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
+	int i;
+
+	for (i = 0; i < priv->dma_rx_size; i++) {
+		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
+
+		if (buf->page) {
+			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			buf->page = NULL;
+		}
+
+		if (priv->sph && buf->sec_page) {
+			page_pool_recycle_direct(rx_q->page_pool, buf->sec_page);
+			buf->sec_page = NULL;
+		}
+	}
+}
+
 /**
  * stmmac_reinit_rx_buffers - reinit the RX descriptor buffer.
  * @priv: driver private structure
@@ -1524,23 +1549,8 @@ static void stmmac_reinit_rx_buffers(struct stmmac_priv *priv)
 	u32 queue;
 	int i;
 
-	for (queue = 0; queue < rx_count; queue++) {
-		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-
-		for (i = 0; i < priv->dma_rx_size; i++) {
-			struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-
-			if (buf->page) {
-				page_pool_recycle_direct(rx_q->page_pool, buf->page);
-				buf->page = NULL;
-			}
-
-			if (priv->sph && buf->sec_page) {
-				page_pool_recycle_direct(rx_q->page_pool, buf->sec_page);
-				buf->sec_page = NULL;
-			}
-		}
-	}
+	for (queue = 0; queue < rx_count; queue++)
+		dma_recycle_rx_skbufs(priv, queue);
 
 	for (queue = 0; queue < rx_count; queue++) {
 		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
