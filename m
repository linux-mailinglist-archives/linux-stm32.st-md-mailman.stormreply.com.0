Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4807A0B94B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 15:21:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C177C78027;
	Mon, 13 Jan 2025 14:21:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9151C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 14:21:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21670dce0a7so92243985ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736778061; x=1737382861;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMPRQoz16EyCK3xxuYYjiNmaFFaTgtlHtG3fh6pk8TQ=;
 b=TwwMAfziawi30hzcbtzQBILVTuZ7d88IFCJxpb/1IRBDJ5WJ0hq11TmPKVLOm8RHO8
 RyKkdMCWWkAMc9Y6aj1SrDhxVCW9H/6irl6N6KdyF4Rheet9DsVzamo40HmZ8cv7u3jU
 NyHGCC2oG794cABEsRlotGepG9FH9rKQrTQu0kg4J+awC0nPLr3V2WtT59tagjQh95qE
 lfcs8UCGHh8fu94J27reLs4GhwQZAHhh2kq4fgHoNQsHBAfBDIi61+rn+w5yoZcjMS++
 ckeGL1/XJHa0hd1l2BaOYEmnGAMReuGUAStukWVRS5yIbtNa+JWzWEFKhSRyzCIez26Q
 KERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778061; x=1737382861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMPRQoz16EyCK3xxuYYjiNmaFFaTgtlHtG3fh6pk8TQ=;
 b=l3yyiEInrk6SOIAbnNviLaS99x9d3UWa8d8oSlQwBGxj/i1IO5cr8ZuROi4ZPvgMpR
 DqmRw5SSXuSKcA+coEbaQ8X7wZh1cCd6Ida+l4Ako8z0gqBjNu1O4OgqMfQbPug4Nube
 v+KWT9KYIh/OvVPBr5enJCwY3npvuUgsmO5WmAA/SilP+yK8g5iLGwHr9DfnV4jH6oro
 bNCd1neGeINyDafa0oE/WfOCj+baIW0lYBEcdU7smjgKk2wyOiD2HGa8O2C79l7MSFOh
 aZmW0uggcyi93zSY2q5QSCmLmT4ncr+f7LiGK5C3C9f/znPMpf9KHhJtico9AMmm0kf+
 ieRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTtEum5wPeN4eiL3Osz+PQLt9oEGeGciz7FnQK81TSIeRl4kRYwN10d80r9bCwZnEeEvUmI1DSBJ3DdA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMvcIqhszbIlllDQ0XadyGQJ99lFyz4CItCWNxcqpVse028O3n
 t5GXipIc/uaWQXT1R81rnnPjXz5hLY5zc6aQT8rlJWn5i6ns/QXr
X-Gm-Gg: ASbGncvMdh7JV8/QDr9nD9XmihsjAaDTYDuyNrBFJOQhL2db+ORhqbMS+gJ4RF9lqsa
 2NP/WSjlXD6rQJAPtUbBMVj1eqoCOueQevzUs5fnZryih5XCFGRq00L4d2cTrnegiS+sYByhTWT
 DAM5qdEEKg3J4ahNPNH3PSUIr5gdcSyLtaMaYwluV1gELV2O9eKH+9hAEKkgGgFy1hgD5xdGZbw
 JDLcPVKEh0i9FwIkiTHV4vZWkh4qnDJnDJBXV2xwlEW6VY2qUwdFob5+F4rN4zw05c6Jg==
X-Google-Smtp-Source: AGHT+IEzC0EK5taqL22BOdLKvphG994lgupCqXrHRE6t3LRIiNlReqX+BVov6VJfmVVXuiJkjK9M/A==
X-Received: by 2002:a05:6a20:7491:b0:1e1:a06b:375a with SMTP id
 adf61e73a8af0-1e88d0ddc82mr38181731637.35.1736778061055; 
 Mon, 13 Jan 2025 06:21:01 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:21:00 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 22:20:30 +0800
Message-Id: <3f0cad344d45bb15957e20059f9cda44d6369419.1736777576.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: Set
	page_pool_params.max_len to a precise size
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

DMA engine will always write no more than dma_buf_sz bytes of a received
frame into a page buffer, the remaining spaces are unused or used by CPU
exclusively.
Setting page_pool_params.max_len to almost the full size of page(s) helps
nothing more, but wastes more CPU cycles on cache maintenance.

For a standard MTU of 1500, then dma_buf_sz is assigned to 1536, and this
patch brings ~16.9% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, from 2.43 Gbits/sec increased to 2.84 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6ec7bc61df9b..ca340fd8c937 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2048,7 +2048,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
 	pp_params.offset = stmmac_rx_offset(priv);
-	pp_params.max_len = STMMAC_MAX_RX_BUF_SIZE(num_pages);
+	pp_params.max_len = dma_conf->dma_buf_sz;
 
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
index 896dc987d4ef..77ce8cfbe976 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
@@ -4,7 +4,6 @@
 #ifndef _STMMAC_XDP_H_
 #define _STMMAC_XDP_H_
 
-#define STMMAC_MAX_RX_BUF_SIZE(num)	(((num) * PAGE_SIZE) - XDP_PACKET_HEADROOM)
 #define STMMAC_RX_DMA_ATTR	(DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING)
 
 int stmmac_xdp_setup_pool(struct stmmac_priv *priv, struct xsk_buff_pool *pool,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
