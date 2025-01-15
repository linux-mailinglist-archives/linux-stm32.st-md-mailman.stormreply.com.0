Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E231DA117C2
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 04:27:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 963EEC78F65;
	Wed, 15 Jan 2025 03:27:35 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A40C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:27:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so10303392a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736911652; x=1737516452;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRq1k9DQ7dcpFSRaoKAokYKGtHAonMVK3g5kkcieDXA=;
 b=aJG5NoCYypK/V2/4I6q1sOTKyZxh31pQOz+vZSGFlbu8FxEnsTT54byomHnmZVk1Wc
 PRjKfeK5x6y8KeisjXTFsMZDj3MrtcdpmOK3cj0yui1ydZwgtbGnH+LQSP2XizdjzR37
 Lp37KO0fOfC1JZNgr7ezbIBKhVnq2uW5R2v7hofVCn6xMpGjpNXukk+JT/13mBK4geb1
 XNzFgARtM5+4BkZEXbnIMfIOEEMr04P+9YRpBWqDeVEVQUwgYY6yTq7f7Oub1fQgyieC
 TpaMV3Mup0+ork3jn9+gt0EovQJdoXF1JTkFEpmRPf8q3VNw2GuIzAqR7Xyg+Z7wRr7S
 YEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736911652; x=1737516452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lRq1k9DQ7dcpFSRaoKAokYKGtHAonMVK3g5kkcieDXA=;
 b=Ney/+BfFHjRk50IF9GJioUQvOUqjUF9AX41HKwK/1T2Lxu+GD4Rk2i6DwJk2OkbpNZ
 IfQnyj/mI8jdfKnliQiRQM0YivlFGtdo/4vyuS2lOgFYQLW8RO8jJp58UJ5A/PWs1UbX
 vbRyDU5gYHpNtoJEuyKiIwrcTMAcqzYc5SrqNMcjkKT6y/mW63gm0acmYZ/gV8byaguX
 sApFJzuctFBqt8xz/eYP/GIFUZA7swW7e/5no4o6QrVUv/P187RfYUCyfrb49oS4LrFz
 j3p1ZFCeuMPkAgQQCx9nH4wUwCb1dy2G0zZPHkvK71l6t5g0UrH2o85vHq7yKNatgOal
 RwsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCUE6g7DN1ZG8rEEUCOYKKaRjnpgHuULEoQsItlKsulvdzs4PMidZOcHRnH2R5ei8dsjSKrH57MdXOAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxX+pFEtZHI31OO0caOL5i3+GWzBBRBnT5fGG48dmsyaFgwv8qv
 n2RQ1xqG+US5SCRlB5DAnql09n4hsrgPGlwU+pNUpOE+esiYvLCo
X-Gm-Gg: ASbGnctzTue1yMK62OR/z4+9IRnCRfc0SSEEuOTG13CmVPvTfDoLtTLGTLwuZx9epqX
 SkKnyJFyehDm2ikBsC5Lb94IClZX0ySx0xI2ge8YtOa1LN9ZLozAMTpAu6yzOacy90+K9afPUzc
 /kD7FQKUn9T5zz+VpQZuxstVcdMkMZ2yFNFW5GNaH8p1hBTepjUQvAgAszdAGq91c/IYKWzgtiO
 s9Kxrc+0rvDN8Uf5RPeMsndSBNj+DfKoTK/GlN1X4dBxp8w2Lsy2gCrZYzlPOoUdOENXA==
X-Google-Smtp-Source: AGHT+IG7F3H2v0kSliTabXyeox9qkdn3NF3T6JxmOyvChSMJeeHU3yFa4THc3jIhecOqrdwKMRxkVA==
X-Received: by 2002:a05:6a00:35c7:b0:725:ef4d:c1bd with SMTP id
 d2e1a72fcca58-72d21fcec0fmr43073016b3a.19.1736911651509; 
 Tue, 14 Jan 2025 19:27:31 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:27:31 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 11:27:02 +0800
Message-Id: <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736910454.git.0x1207@gmail.com>
References: <cover.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <jdamato@fastly.com>,
 Furong Xu <0x1207@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
	zero-copy in non-XDP RX path
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

Avoid memcpy in non-XDP RX path by marking all allocated SKBs to
be recycled in the upper network stack.

This patch brings ~11.5% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, from 2.18 Gbits/sec increased to 2.43 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index e8dbce20129c..f05cae103d83 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -126,6 +126,7 @@ struct stmmac_rx_queue {
 	unsigned int cur_rx;
 	unsigned int dirty_rx;
 	unsigned int buf_alloc_num;
+	unsigned int napi_skb_frag_size;
 	dma_addr_t dma_rx_phy;
 	u32 rx_tail_addr;
 	unsigned int state_saved;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index acd6994c1764..1d98a5e8c98c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1341,7 +1341,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2040,17 +2040,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	bool xdp_prog = stmmac_xdp_is_enabled(priv);
 	struct page_pool_params pp_params = { 0 };
-	unsigned int num_pages;
+	unsigned int dma_buf_sz_pad, num_pages;
 	unsigned int napi_id;
 	int ret;
 
+	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
+			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
+
 	rx_q->queue_index = queue;
 	rx_q->priv_data = priv;
+	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
 
 	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
 	pp_params.pool_size = dma_conf->dma_rx_size;
-	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
-	pp_params.order = ilog2(num_pages);
+	pp_params.order = order_base_2(num_pages);
 	pp_params.nid = dev_to_node(priv->device);
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
@@ -5582,22 +5586,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		if (!skb) {
+			unsigned int head_pad_len;
+
 			/* XDP program may expand or reduce tail */
 			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
 
-			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
+			skb = napi_build_skb(page_address(buf->page),
+					     rx_q->napi_skb_frag_size);
 			if (!skb) {
+				page_pool_recycle_direct(rx_q->page_pool,
+							 buf->page);
 				rx_dropped++;
 				count++;
 				goto drain_data;
 			}
 
 			/* XDP program may adjust header */
-			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
+			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
+			skb_reserve(skb, head_pad_len);
 			skb_put(skb, buf1_len);
-
-			/* Data payload copied into SKB, page ready for recycle */
-			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
