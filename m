Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE8A0B94A
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 15:21:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 727C6C78012;
	Mon, 13 Jan 2025 14:21:02 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4E7C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 14:20:57 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21670dce0a7so92239905ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736778056; x=1737382856;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ccKpY1leYRtGPw2tEgtgVTc2GSp/SOKDOJPp9BmSe4Y=;
 b=SRne0mw2rq1+JVdaCCakjEfcMAfP2RI5Lmck5QWexxK95KIDaXuQ9EEubvTaUA5Hfl
 CZRcbKHggHArYFGvfGzgLQUGLXkULk1ysDst03n9m/+qs7pSiHS6Pfj6Qksm8XQnBHGl
 5YEbIKt3b9hqE+od4NeE04SbCmrVqfSG40asnhKxHNYRwceLXA8W+0JJyB45LHcCjHwq
 GD0+IhQJGf4dNDXai6ReyocBc5IEkOG4ZxU5aXHSQvk8T/yZEuK6MLWjHGcTiHIvTFpz
 UUrIzvK4Z1X0n5Pu/pNF0qHCAeD8iaFfVlGJYFGlmo9IMe7N5lHoNMlSysZfKI6+9kN+
 Xc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778056; x=1737382856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ccKpY1leYRtGPw2tEgtgVTc2GSp/SOKDOJPp9BmSe4Y=;
 b=t9YNvwPKLscMfAkzXsHjzgFWz+eCD/UsIwdTOnYVjX0ZmT2tqWens+ouQJm1b6bWie
 p1ir6/eMT0QGsd3/5bc4X3miFFqY4RI/se0+CyRYBLIg7uFkYvepc80JhLirqW5gmdJK
 pD6kcUXqzXsj5T3X8pT3Qx3R/tA+Nzu4137uGcziOSQSd/r+BzCt1s5bVluz0YHT4YKG
 cVzqDmFgU3GOvefrUOhOw2c8Voo07u7W7U/Q4VM+FyYy1B5aJeoUXNzBIik+KliYTghX
 lo1cSrByyapTsJhgPv3nhyIQf4L9n1be+RcOdflcvy7fRGpQYk5K99TiUyH1rbTjVOSt
 VoWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/Rwpr/t5MxGweCfEeRcie31CSbC8/2Tn/YaXrJFeuXKkesSAK7GoztZOXHyEee0FEHsQAw74ffU2uhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLFRySaDQBeBuGbvTg5IWkUvL9eCi/QMFxIlNcfON34rcDTd0n
 eTFpDyJFaPGaEjUAuglihIdeqg4WUxA5Lo8ktsHJs1L/vMfzdzxR
X-Gm-Gg: ASbGnctZkzG8atE5mOuKOj2AVYvrcIGxSsh/mhRFpiX6R9EgUj9bCujyzLQY0RBvaTr
 b8vrTiUOzUgSKj3pZWQ8MwltTSDAkyY7oja1FqNzAhyyombQ73X620cZkef9FV1hk2tbr3vp3MV
 q5ZbXrLcN2Rd7A4DYItroDLNSc4xyakFaoFRbIp3h6TLaDNyKL5byIO034gPkb/Dia7ICM+NH3v
 mIZniMRrzk3yl59c7wxKyMOxSxCPY9ADez+PMpgqWLu+X29dFdeRUGoMoNX0WE0OfnBGQ==
X-Google-Smtp-Source: AGHT+IGKv3lMSzF+D1LHruGGkM9/Rgx0EUTXEe4+mf7NCbt27F7Ct+oQGMUGSmcsLeFCk+WT+xqn0A==
X-Received: by 2002:a05:6a21:4a41:b0:1e3:e836:8ad8 with SMTP id
 adf61e73a8af0-1e88d0ef9f6mr36157231637.38.1736778056233; 
 Mon, 13 Jan 2025 06:20:56 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:20:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 22:20:29 +0800
Message-Id: <7e7c594913b003b3eb7a836042fe00515421218e.1736777576.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736777576.git.0x1207@gmail.com>
References: <cover.1736777576.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Furong Xu <0x1207@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac: Switch to
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
index 58b013528dea..6ec7bc61df9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1330,7 +1330,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2029,17 +2029,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
@@ -5574,22 +5578,26 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
