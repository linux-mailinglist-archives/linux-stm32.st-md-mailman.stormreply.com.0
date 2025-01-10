Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 757B8A08D00
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41240C78F67;
	Fri, 10 Jan 2025 09:54:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28CA0C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:54:18 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2166360285dso30952125ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736502857; x=1737107657;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUq/PWSOM6Jgkh8a1Vg6y06uVsWzXgd/e9CTRW/3aLI=;
 b=XCImcsyHOwExuWFMlSQ/o5lnWSUy6NtB95l9Dj433BQ6qJ67z/qPRRiRy+P3pWZ7jM
 Kh1fXg6+CnpiYKOmslMlugXPu6mzJu0IJm35F8REtH0FeRd/H4abh5fHwZ71atGBHSPF
 jWk63h3ICl1CS0IOe4Mz3/R7YG081iQh/emqiRWYCJSlo5wS07bkiDIXkDhM0T0WivTU
 SRvpJoU7YCTLJvArJxJbAUX2sfXZqAIU2R1yrSLtXHm0yNRdu0qEUQS5iE73stDzl3M7
 rQVB2GYA1w2yuqnGMCsv6IwKuMS4dOOvZOjM4QUtbRCe0v1O76OgzBQ/XLwq3mJAJiFE
 yfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736502857; x=1737107657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUq/PWSOM6Jgkh8a1Vg6y06uVsWzXgd/e9CTRW/3aLI=;
 b=C3hR/YwAM1YTbXVRk8mod/379koG2MGNKE/g3wVrK4ZdxkI2Xt1USNkGuxtx6IXUh0
 zq4FmwBik1HxoenVUyIU/yqV9ved1EZOa8+5yLmURxWKqsmzAo19iRMcJLHRAN0oCFR9
 H/k4DmxOiD1T4mjmyXZ32yrQEzww7PDllI/jh1x5O/x0eV1EgtmkL3dNmbneLskSM8sC
 IoUEoyuAnjjYYUtRNb8U1w4Ajnqol27JrjmLnvtOU3B79AoiQMFUTlr+plMFk8pxv0zi
 X4BJ/ZHUUTST1W5aZHP+Lyo2i3eCspUGRIJs5JBj39Yllc4xB2GcmP0MQbfiut7e4a3w
 jO1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEynC3+cyc3GhLm4dJcslFQL10RpHDY8cXgUID5wZfTqQmo43asP/zLBvvdYqWZfuQpRHmuq0beslYRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzcWzIil16UvYFJXT/yQgnHLrnMZ79S8vFpPhN5NT6Kdemz5/7Z
 F22lGiV06SiKTQsOPUN3kygmzCPiICoOlgrhoVrUARO2jmlHOAXS
X-Gm-Gg: ASbGnctIKFcQNNaIQUdiOb/ESCe8F7p8ch2Bkri1ThGRCQ36S9mfwU8uroTWUmoeZTQ
 BJjYj4YNJVj5hDAKISuSwm9Rx/Bl8wUTeJ5h5o83lW6mdhBdRfiZRrb6OzQvVk/XrgWdIrUP1gc
 tI0lvqIufbLMszT5fXta1LsxEqWy65dCEnuVmnfhg7Pxif8WgXwPfRt+pdoPa4xvPxwgB4KwxG0
 /MhU99JjdykSQ4UmEpcGHJcU8GLqxwIMA2BQcW6IjEAL5eog4SGZBoeMTniMGboMddAig==
X-Google-Smtp-Source: AGHT+IHNOyExXpjKEAJvj5VF4TsAcm/8iRdMra6jEOVD+0OivVdVmbGUe1wn2Z9fO5OhUfPCMwcgdA==
X-Received: by 2002:a05:6a00:91cb:b0:72a:bc54:84a5 with SMTP id
 d2e1a72fcca58-72d21f296edmr12960201b3a.6.1736502856641; 
 Fri, 10 Jan 2025 01:54:16 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:54:16 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 10 Jan 2025 17:53:58 +0800
Message-Id: <4bfc67ece5ef615ce65972173f5256f10ea27f9a.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 2/3] net: stmmac: Set
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
index 43125a6f8f6b..c1aeaec53b4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2038,7 +2038,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
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
