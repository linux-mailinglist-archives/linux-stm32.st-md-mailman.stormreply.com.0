Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264CA08CFF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:54:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37CBCC78F69;
	Fri, 10 Jan 2025 09:54:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EFD2C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:54:13 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-21661be2c2dso28682635ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736502852; x=1737107652;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SxF3XO1B6LZpy7SsHuT7EE8l6m2FcLCgWD0toKoIsSE=;
 b=IXMPbxzGr0jlEgf0sRHhc+uMZH4C3fVhEao5IjMyydVCgZMnlrWzworm2+KjZvNKlV
 JiNw65r8qMDfQNHDrdpdoNEw/wuMsBALXjNKgaoz9pgtuUtCuBCbCa4VH/K1sSsvOX54
 YG5q0KhfvXMy10osBaRwdTnfMosPC2iibg+P7ywLxf89MUzz8Y9oySFz1n0CUvNG4/8h
 ZT2BRCoecqtXklm2eWe5FBpT8LYQPwB1PgNGGL1hKFJIF8rx2aaJ4oeFDhK9XUv5G1qL
 pU1yOfofK372ID13vu1CENSSx7q2I0Z0mhlR+qCBXfpB7q6amoz5PA+RbeiD2bEZul4x
 hX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736502852; x=1737107652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxF3XO1B6LZpy7SsHuT7EE8l6m2FcLCgWD0toKoIsSE=;
 b=AKLby87Q3rwgi0JI6xqfYz9QbQGL37RNh9uTfVue8iPqXcpXtTzxt2fKKW7gMCgSJp
 YIfBY1xAuswyV6lba25nXoiPmvYR/pzC4FjCkHc30ZrrE0jYS7Vb76FsepaeCjaveDCs
 7p01Vvip+G+shOYFZ7y5PJK+oi2qTVdKK3H66YcfYAQpLsE3/1grgoKyWcn23ZuoH5dR
 ANsCfLw0QCqlrPBnbgRid5Njqkyr58LDmQqu/2iB4EgK5D8mNuFuISqgJGpn4bEYETtk
 QMwyb0x3f43xvu76r4pWzt5tBowtYnnJZRFHLSjy37yDLc9Dz8qaULvyRMmv/un7aH1p
 UoxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXqT+OQiCscmrg8lATBd/53os2eMKqr829sQHLfjJfjsKai1jwD1PVVzo3/FWjDalDNTMbv0sUQJ7aPA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw192DoBobMihDJuuXuKOP7cw6Rg/DWDpdl8+FisFAz/pHOTAeC
 pj5L0V3uF1ydpPfQVNGa9p5CNmpK7eV1GLUHC+3FwWaIG68m6ElE
X-Gm-Gg: ASbGncuvDw0YxI2H9Z35XdGki97LefhPC2PjGb41J9ETgGTEKRj//UDAjdnXyJ8Zy+2
 Uz/BcxQaAgfr+qSgVwkiBwOYQrEENuly94JMq2YT6AQIEZVs1OkgAb4tT57uSxNS1jBKVyY+uub
 J/gCJ0OlVX6+PYRh88nJoZVVmxj2I9FXDXleXP6z27hxSp4Z0gQWEOl4Pr4ri9/kwW+50eFMKtp
 9EUnyFpKPOKzzF+dH9W+hSo3x6zFDrsxQrb6dgdeQ73vOMU2wErWnRX6QBGewOBN4ZN0Q==
X-Google-Smtp-Source: AGHT+IFkCU9VmZRMCAwHW5xP2aexBm6vAYxF+cTLnmmRPs6gpn7mMaFELbrG88Frm/BNN1k4tXE+QA==
X-Received: by 2002:a05:6a00:1404:b0:725:d9b6:3958 with SMTP id
 d2e1a72fcca58-72d21f471c5mr15157812b3a.14.1736502852468; 
 Fri, 10 Jan 2025 01:54:12 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:54:12 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 10 Jan 2025 17:53:57 +0800
Message-Id: <600c76e88b6510f6a4635401ec1e224b3bbb76ec.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 1/3] net: stmmac: Switch to
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 548b28fed9b6..5c39292313de 100644
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
index 038df1b2bb58..43125a6f8f6b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1320,7 +1320,7 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	if (stmmac_xdp_is_enabled(priv))
 		return XDP_PACKET_HEADROOM;
 
-	return 0;
+	return NET_SKB_PAD;
 }
 
 static int stmmac_set_bfsize(int mtu, int bufsize)
@@ -2019,17 +2019,21 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
@@ -5574,19 +5578,20 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
+			skb_reserve(skb, ctx.xdp.data - ctx.xdp.data_hard_start);
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
