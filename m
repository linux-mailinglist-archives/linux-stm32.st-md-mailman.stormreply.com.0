Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EDA08D04
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A2A5C78011;
	Fri, 10 Jan 2025 09:54:23 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BDC0C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:54:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21675fd60feso40166585ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 01:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736502861; x=1737107661;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ion4rvgZVuG6XSBAcwwShmk186Mw8JOkfuQ4D1b8sOM=;
 b=FmFNyF6Poh5HUsNfDQUek/HR4mqpALwdP/PrO27H7J8ppZAAErpJORQFz9bPHQPsWx
 uxv41zXlI2syVXCbWfp4I8ZUpK5xApLW80VjFvdcbJRl2E2oONeO08qMBAG0ljciQ12b
 RnPSbP1p2U0FFsIhqXcSOdOoL8jpI+jBhAmTpVapn0kvhvcj0mSLTCwVCANKONyK4g1Y
 hjFF3PJEfL1GKol6NvhqDnppeOlLWW0DQ27fVSrRg3y52Al3YHa+jUKKmkqffEqdf6eb
 zKYA/3iOrC2XlR12tdB2PkXONjXk2dkdt2a+pwM2DdtNFEzTsvxlUtJcJEsKsoSgtwji
 lqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736502861; x=1737107661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ion4rvgZVuG6XSBAcwwShmk186Mw8JOkfuQ4D1b8sOM=;
 b=FSYwH0hnl6PInAMQZGRQX/dKoexViVD50bYMZKaUycMs4/b8eBe9A+z2OdFS73zdDc
 qD9ff/ukBcSxNOFizSCkvZeIxQkN+B8bjeLCAGblBXrFKn+xHMIrvz1lif6s0qfXd/jD
 XQFudoM1QA0bxAcx2wv8wBBY0koHey/7l4t94/4pTRiXlpF9BcerQjQn/6h5ckH2/awn
 1/4Da6vnk4cKvYDa3mX6Jgpa41sNHxS7v8P16VjJiJL7heRrl8TS+3AywE5kgRYvQf01
 6aNAfUWh0JmMJ04TP3G5AnRmBQoVhD25JvuOkJfK9NR3w3j3ziIMIOXWmhQdFUR1Acjd
 LDag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRZT3ENmaXnUrpDdUsBioTuywfTbplr2M9gmllbRKoaL7HhkCTHSfYl2EGizV/oPqpOh/sXGsXBSajug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMpY20OfnNQR8YOvQxnB6SuHYLtzBNRrm/K1l/WNFpWDy8E4al
 NcAg4bm+tefqom0jRuyxQ3TJcHj3NCLcxZTfsKI8t7lbCv0luB95
X-Gm-Gg: ASbGncv50yMfIXZ5AiTvHl6sLfyEKvfXmOEdVaWynyKBcLRjb6OKrJIzskPsxxcxHb3
 ZnFfyCNGx3hXWWkmpuVGZZrCBnpIIw2w3uP/93tf9h2P0y4Nnn1CF7qsZVdkZ82jWtZ/rP8R3Gb
 rn3TDF+oDpdNYOGKh1mbIPEN2NxX38xafjLqHx7zCX1RdpNE/fOxzbuE11WF9eKCNKcZGFIMgsj
 0I1pIzeFGxKfps3aiwJGqdYQ/doI/ABjaJRLtW1Ydz7S8y8xjeIsWLJ0aiMl/aUDEuaIg==
X-Google-Smtp-Source: AGHT+IFujh/KkTTFRhKx5MyKUB6ge9k+IJCqCvJTkEaAIWn/8HcGt05DziMhWszOmGBiewczqCOY1A==
X-Received: by 2002:a05:6a21:339b:b0:1e8:bd4e:c330 with SMTP id
 adf61e73a8af0-1e8bd4ec502mr734199637.30.1736502861030; 
 Fri, 10 Jan 2025 01:54:21 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4069217dsm1186183b3a.151.2025.01.10.01.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:54:20 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 10 Jan 2025 17:53:59 +0800
Message-Id: <b992690bf7197e4b967ed9f7a0422edae50129f2.1736500685.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1736500685.git.0x1207@gmail.com>
References: <cover.1736500685.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 3/3] net: stmmac: Optimize cache
	prefetch in RX path
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

Current code prefetches cache lines for the received frame first, and
then dma_sync_single_for_cpu() against this frame, this is wrong.
Cache prefetch should be triggered after dma_sync_single_for_cpu().

This patch brings ~2.8% driver performance improvement in a TCP RX
throughput test with iPerf tool on a single isolated Cortex-A65 CPU
core, 2.84 Gbits/sec increased to 2.92 Gbits/sec.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c1aeaec53b4c..1b4e8b035b1a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5497,10 +5497,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5522,6 +5518,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
@@ -5596,6 +5593,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
 					priv->dma_conf.dma_buf_sz);
@@ -5608,6 +5606,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (buf2_len) {
 			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
 						buf2_len, dma_dir);
+			prefetch(page_address(buf->sec_page));
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
 					priv->dma_conf.dma_buf_sz);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
