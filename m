Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE13A0B94C
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 15:21:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86DF5C78012;
	Mon, 13 Jan 2025 14:21:09 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 370A5C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 14:21:08 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso72772085ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 06:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736778067; x=1737382867;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Y3BfZz7MekY1Z7yjTuQ+MWMRBeT+ElDKi7mbMigxYQ=;
 b=baSbhcmQ8LEaxJEyrVv8RsBunDFsq5VzZZNkNRgwiQUwpXJ9acQZPYtpGlURpNutfd
 XU9IPxuASxDe80hvT33cgGm/xPQqk+i3tGk5laJ7/ezzvC8JqHx6I3o/iDpZECoQ6FNc
 J/O8aTp0fHTeY/iZIKk/JS+6WMQJW2qe5zj7ithrHPPrHbvEWgcoek8S5LAhLPrE2HXz
 OX1iwbJ3xbGBa7Tx35J3nBVCTiRxFtRhGeSSTqLRj4ishN3Dh3caKeri4O6zdbkaFq3q
 wCdCi5ayRlSCGaagetAws1qhd+Ynze15Yn/J+2oA6cYBw66IU18yuAsmhxy6tkJ8GOHU
 3DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778067; x=1737382867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Y3BfZz7MekY1Z7yjTuQ+MWMRBeT+ElDKi7mbMigxYQ=;
 b=vJ3C0jtkuQRp6y1h+DePvKD47pT6FHTmEDq+rDMIbc0++ouHP2JI8KpqwS/kcSMPDh
 3z42gOdNRVTFlmSvYs0XRxZnSGOnCmSNgyWCGyFxsQT46aL/qrtZjGoC3kTO/IE+H7ja
 o2bcZTSrP2+1EArBDZXqFsAkJnsfRMDHEWiZnON0geEY9gDLT5RJ4aU9XvSsEZbP3fEr
 uozaG8rca+gaxxqQdMoCe6QAui9SUVR3f0kZRl6aANL3IYhbarKcGdJjpjvfGNdBqGa6
 YkXPmyARGJlkD58wcyguzQelhAe8lhDOaOwCcNvljebPb1tWwfvmN7heUF6QBX23U+HL
 wm0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdz8W2UrzzqmLms2fZSPStASNXRtRslFXed732KWIj3Cthe+jBdoZd9qvYuw0VmnCkgSZ3sAff2a6XDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxV+K8Jg2e7/V/jtQqMe2cVOjrLFr7Gcu+9EsvSysbJe7ZanRVV
 SH0/IbritIeRLFkHUTdlsa/Jj102h9+JEqyPp1fcqXSjK9ayzOFU
X-Gm-Gg: ASbGncuFDxvXRfI7DJmsq943TfeMOs6EX+Rkgka8TOpP7IlLT1D8qv4TSyuxFJG1shG
 FOs9P+gBQV8h1ZXDpFb8/AUw55poomtzDxhA2rC29AOhl8C037RxBkmO1JYFiCXhiBmsxCHREbF
 ivcVQtUgYDq9yISRMtyy1MTLhZTbLmSA+tf/z71trllA/IHX+0PUp4cSAh/q8acJinQO6aLDnKk
 ZYhH8md1Nttcjcofid5YzW/g0EuSHWeKA/h1affjKsNUyYP18sYKjW0ubDOoca9cjHDQQ==
X-Google-Smtp-Source: AGHT+IFg3sXPhg66pW+bXzniVJ+GWukBtXItLNm4Jyw30Z7qC0CWxK5D402KdXwOTZ+TRgV9PNNiUg==
X-Received: by 2002:a05:6a00:4603:b0:728:e745:23cd with SMTP id
 d2e1a72fcca58-72d21f113a1mr32141933b3a.3.1736778066667; 
 Mon, 13 Jan 2025 06:21:06 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d4067f0d1sm6089222b3a.136.2025.01.13.06.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:21:06 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 13 Jan 2025 22:20:31 +0800
Message-Id: <668cfa117e41a0f1325593c94f6bb739c3bb38da.1736777576.git.0x1207@gmail.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Optimize cache
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca340fd8c937..b60f2f27140c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5500,10 +5500,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Buffer is good. Go on. */
 
-		prefetch(page_address(buf->page) + buf->page_offset);
-		if (buf->sec_page)
-			prefetch(page_address(buf->sec_page));
-
 		buf1_len = stmmac_rx_buf1_len(priv, p, status, len);
 		len += buf1_len;
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
@@ -5525,6 +5521,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
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
