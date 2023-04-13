Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C57086E0526
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 05:26:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D2FC65E4F;
	Thu, 13 Apr 2023 03:26:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 289D3C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681356384; x=1712892384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pL4q42CrpzLZpFIa2Sgvsf2gW8kvjKkSwOWcp1h+M68=;
 b=dHcoBJhdgAsihu0+Gd6G/dF1vMPPoDh/32XEQniLCvRhNgqj2vABZxRD
 llfH3dtru38L8kmINzGWBNV3MEs+BpHOe+OM5sbj+cCFR/Jwag16ntU75
 xKcg8dHQdDSItF82b2BYvyDjTfVWvLv6Qu7qwxeQ7byHEjVhY2Y2nwolZ
 IeJVRFcYWYzadDSEJ2KGeIZhopGmth79xyQKmwZGlEIJ9VcqIy5DA/yAb
 lajv7Lyu3b4Vv1lCn4fa1vYhz2wWFxig+4wBtDJywYpYjzQ4wudEVtqPJ
 uCNXu8h/tEQwEigt47MISSR6q0Vqt4Lwf2CQvxYxNfeKMRAtUiion8AIS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332781648"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332781648"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 20:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800597041"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800597041"
Received: from p12ill20yoongsia.png.intel.com ([10.88.227.28])
 by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 20:26:18 -0700
From: Song Yoong Siang <yoong.siang.song@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>
Date: Thu, 13 Apr 2023 11:25:39 +0800
Message-Id: <20230413032541.885238-2-yoong.siang.song@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413032541.885238-1-yoong.siang.song@intel.com>
References: <20230413032541.885238-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 1/3] net: stmmac: introduce
	wrapper for struct xdp_buff
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

Introduce struct stmmac_xdp_buff as a preparation to support XDP Rx
metadata via kfuncs.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  4 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 3d15e1e92e18..ac8ccf851708 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -92,6 +92,10 @@ struct stmmac_rx_buffer {
 	dma_addr_t sec_addr;
 };
 
+struct stmmac_xdp_buff {
+	struct xdp_buff xdp;
+};
+
 struct stmmac_rx_queue {
 	u32 rx_count_frames;
 	u32 queue_index;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d7fcab057032..6ffce52ca837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5188,9 +5188,9 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	int status = 0, coe = priv->hw->rx_csum;
 	unsigned int next_entry = rx_q->cur_rx;
 	enum dma_data_direction dma_dir;
+	struct stmmac_xdp_buff ctx = {};
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
-	struct xdp_buff xdp;
 	int xdp_status = 0;
 	int buf_sz;
 
@@ -5311,17 +5311,17 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 
-			xdp_init_buff(&xdp, buf_sz, &rx_q->xdp_rxq);
-			xdp_prepare_buff(&xdp, page_address(buf->page),
+			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
+			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, false);
 
-			pre_len = xdp.data_end - xdp.data_hard_start -
+			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
 				  buf->page_offset;
-			skb = stmmac_xdp_run_prog(priv, &xdp);
+			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
 			/* Due xdp_adjust_tail: DMA sync for_device
 			 * cover max len CPU touch
 			 */
-			sync_len = xdp.data_end - xdp.data_hard_start -
+			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
 				   buf->page_offset;
 			sync_len = max(sync_len, pre_len);
 
@@ -5331,7 +5331,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 				if (xdp_res & STMMAC_XDP_CONSUMED) {
 					page_pool_put_page(rx_q->page_pool,
-							   virt_to_head_page(xdp.data),
+							   virt_to_head_page(ctx.xdp.data),
 							   sync_len, true);
 					buf->page = NULL;
 					priv->dev->stats.rx_dropped++;
@@ -5359,7 +5359,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (!skb) {
 			/* XDP program may expand or reduce tail */
-			buf1_len = xdp.data_end - xdp.data;
+			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
 
 			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
 			if (!skb) {
@@ -5369,7 +5369,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			}
 
 			/* XDP program may adjust header */
-			skb_copy_to_linear_data(skb, xdp.data, buf1_len);
+			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
 			skb_put(skb, buf1_len);
 
 			/* Data payload copied into SKB, page ready for recycle */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
