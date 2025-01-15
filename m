Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0110A117C5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 04:27:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9CA0C78F65;
	Wed, 15 Jan 2025 03:27:38 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7D31C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:27:37 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21644aca3a0so137135405ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736911656; x=1737516456;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UUplh7fAcpeM7Q5zE9FRPEWMTlb68cB4RMo0G5W1ro=;
 b=Jsg1aouT/vXulnd9rfzq65Axk4cVT+5xd8wThcfvpUUwFIaN5n7l/+2cfjzaGySAYn
 IbKv4ThxMd1BLSjGWeK6+LRNzT5VXsPEerlg6H2Rr377HMpqdDL/uH13n9j6l2lvBMsC
 dyt9+KfRzpObptjebCvxhMxJNSYg+WoaC/PUn3W+urwsoPZIIsTCyfbF2Ykkfz1bZ2Sh
 ADueeMZVb/7ooV1F16n94CsEyQ1y/mHDQE59LvlqXxHai+G3rFEvsU2YhJ1a26FIJc1q
 ytbP/+tf7Fi/4jVXjqpr7US54cmMhf9bsW9SHBmJ73WIMhHJlty/sTFs8tIddYZwtHh2
 Bp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736911656; x=1737516456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8UUplh7fAcpeM7Q5zE9FRPEWMTlb68cB4RMo0G5W1ro=;
 b=Yprut2WxbiYJMrNY28e+2bdQXGFAydmXg0D3iulfNmZYRCNNmdjah2Bws+V+elXxbi
 h2SMJ7hNvfuijBmNv3FP8kaJbm26W3oDks+Vv6sdTosIK1KKu1TsTHIIi263r9jGbrco
 nlthSNwVMVLmdGF+hZPRhO/lFMJnYHunZvrthcxpyzrLMiPaVNIc77nPBoJOld1CvjSF
 SFyIIccHYcOy/S7+DKD9Gc/fbiheN55tBDEUuS4jML+B7LVTC8vDeqP8K/3AK4qf2ezb
 dSBvGwRNhi0i3i5rV05i8Yd3M7CMZ3PKQMm2NeHVkVa9Y3w6KGoD32cIWmnrZ8MhDtPo
 Mf4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf+CJ71vzzom5ME5AqB9OL2/UXaBAsq680QkEKgLqv+W+IVnGJ2dHvWvIzNBRnWcBes1vNMcIy8OFG3Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyR0MBPqFxDa1n6f7pJGQQpI27dLa2qJY/ZRfEsS1vDxMVebdvO
 mPrve+D6vwSlO1yPGs+BB6rbvx5y/C8DJIuQdkI7hDgVLNMwPDeL
X-Gm-Gg: ASbGncv8rw5tRy2nPAK120dsViqwz/yyGZwJDIGkgVsn/5e++FYwF1OBVpKHuOGvqpJ
 Cxf7extYqYCxAk3MOCZY67E50lloR7VXtZAXjy5C75WUyQFVjaL+AM1nXfXMFVN/Xgt6Hcj8DYA
 b7w9+R8QbMZ5NlNkSZ1m3rA+SLwQNFWZWtELUPI6Xt2TNUntgte19ofdx2KKOcqiiKcvUlBef6w
 8owypBsW6fl5GNv05ONFBWo8SUrnTSLhgwkat/wxNvA1p0JzxzfBGPOHiXWKODcbkw2rQ==
X-Google-Smtp-Source: AGHT+IFNvLpuNXbqq/IV5KYaf3Nik/z1qK9SvaIPNMSsFV2O8gjEl3T3nKlKoNCJXm0ou755RaN0PQ==
X-Received: by 2002:a05:6a00:340c:b0:725:e015:908d with SMTP id
 d2e1a72fcca58-72d21f459b9mr35478358b3a.1.1736911656332; 
 Tue, 14 Jan 2025 19:27:36 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:27:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 11:27:03 +0800
Message-Id: <538f87c8bdd0ba9e2b9cb5cd0e2964511c001890.1736910454.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 2/4] net: stmmac: Set
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
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1d98a5e8c98c..811e2d372abf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2059,7 +2059,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
