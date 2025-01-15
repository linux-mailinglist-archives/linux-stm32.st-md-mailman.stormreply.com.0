Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F13A117C6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 04:27:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7479C78F65;
	Wed, 15 Jan 2025 03:27:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B412C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:27:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21644aca3a0so137136425ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736911661; x=1737516461;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8jofsVUx8ZDCJ6z8E8sSP3dj56gjS3NJDcAVJdYxeo=;
 b=gvahcs34HS8VMynoTC1GEMCbEgpiYwJ918kIsjs5KUIaVgzBAAXEQiFFEXjg+LMlvQ
 PKjiyMSIrhicivab8mnEqjFnrwwauWtaXTdCDptRabTlMr7KMi2y5yZUrvsOt7RgDkFV
 x/NaXnUuHdFLfwGTnO8Yg5bZeAdRxtsHJ/5CTfXLUBAwM9VucL9Wf6foz7FOM3OKlgDf
 2x8b+8tsTGtWD+xrItCjFxmcxQBo6E6hagBPfFvP05MF9bG+HTznitcSHYdOstuJf45z
 MN8j4hdIrmssaQdkjOm2furLjH97wRpYSNxUb5jBZbx8ia1ozGiLkHP1i2DTfXqQVf5f
 /H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736911661; x=1737516461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8jofsVUx8ZDCJ6z8E8sSP3dj56gjS3NJDcAVJdYxeo=;
 b=mWOXkwYcC/INhBGnzKdQPGEGEj4YKctwTGwcn/Vt3WU48GiQlhwNkhFIXqt9nDo3wn
 M9GgRaxqD7g6XqSUTrli8F6xpyfessf9KM7HV9e8i3Z6DoGKxiUBfxz92DwmtlCdsFdA
 UsR0Q+JDVhMtN3SfHvkq+y2yUpXW3QSh9t3Qci/b+pBziARkSnqsnJxBSjsUUM2DT4Iu
 uP4OAAUFl8AJqSRZi6An8Vj/i+1r7eRbGXMn4Xn9+o1Ey0Cp5z/c2RTOjDFupcuxzTgq
 Ti6mC7EKiGhXgqfVl8+EzCO0W74USDbve+qHHGmTrPs6GD2erl7EttoQSF++Gp7qPbjd
 F13g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy0+ztqQRby4ky9L6wSCU8jPYkw7IUYWeJQy5Ttb9W8vz2gC+FMv3KD4/fyqxK4Gs+V80OxCOGmaQogw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOjgVFhi+GE120BAmI2cQ/PzbBs//cRpPXjrhvEh9qVWTujE9J
 hK+4tKhBpZAda5ksuXxcpzOvb//tVlpjkWZdHnS0hTVAi08EZyqD
X-Gm-Gg: ASbGnctqPnVcMl8sSD71jsY5mLz66A/IQTKo8Cxrozri1fDt31HquvBRLpfn3WRYLKz
 zjklJUIr03s4K41HeSO4809jfKSkEcTMYo9j3/XhW8CoHd1ivvcbEesm8IT6JacLLHLDYEJgNrJ
 akLsxbS4MTiEVP5VWri4TA56QFgQbZFHdwYZsSSwAp0EVnFaX+zTUObC4cnFiGnk4HDgF7VvFWH
 yWNBS/Km+K1RqLT2KYZ1/oBFkt8A7dP1R8yMSMUZGoN0Nc+vem3TLFt7Kb0HjbqoHJnQg==
X-Google-Smtp-Source: AGHT+IH3vKpIs9HEB7OG2AlV/K4DtSeYgzdkPcn7TCEV2c0jCWcevtA7LwBwelnqC2AKojzBKBFAxQ==
X-Received: by 2002:a05:6a00:3c93:b0:72a:8461:d172 with SMTP id
 d2e1a72fcca58-72d21f4537emr43075844b3a.3.1736911661159; 
 Tue, 14 Jan 2025 19:27:41 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d405493basm8166452b3a.27.2025.01.14.19.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 19:27:40 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 11:27:04 +0800
Message-Id: <2574b35be4a9ccf6c4b1788c854fe8c13951f9d5.1736910454.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 3/4] net: stmmac: Optimize cache
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
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 811e2d372abf..ad928e8e21a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5508,10 +5508,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5533,6 +5529,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
+			prefetch(page_address(buf->page) + buf->page_offset);
 
 			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
