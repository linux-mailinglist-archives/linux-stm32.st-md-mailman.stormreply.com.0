Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA03E1A1E
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 19:11:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D4CCC597BC;
	Thu,  5 Aug 2021 17:11:17 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5235C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 17:11:15 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id yk17so10715454ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 10:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7+jxX/JlbsLDgJC0GgP7ELLd+nfENBJ343/im26+GM=;
 b=QwxXvKxm2k7/2i5nl9qwda5BaP7qBrLV2BtBaa+hBN2K4E6Xc02ywtmjJKiu6RsA7P
 tsaYG5KwU2N36KSSNt3ozWz6fxwn99G02PPHhDdS2UO0O5LPCNSgrc9zn4YTGM29ku5O
 P30T0LBPJVooy29iVUsOM8VKgtcqACd+uiOGJfRHJC8aYo6douInj/0UlqGTOepWKdSL
 Y4P7/2AJ07ATlaGjB3YIrVMHpP7YCn5lynQQFGQMuM5S4Sz8XJBMzdJoHi4sTs/dRBwH
 70fnsecaX8j/BDrWeR6G6ib+ASnPVDTdv30v1y61h+N+NN+jADEpjsIkvAH7ZD2zh/sZ
 pQhQ==
X-Gm-Message-State: AOAM5308cONM3BN9yzCQpHneQM0LHixUwUs0BvnbanAAcKoCZ/ZS8HwK
 ulaUieK/e7Otw1Bl92RdbYE=
X-Google-Smtp-Source: ABdhPJygIfEvBUqlx0/X5AzYLa/bnmtDp5d4zz7lx3m8P24V0rWS5lGo5uMBsVpMwgA+mF2pSX/rQg==
X-Received: by 2002:a17:906:fb0a:: with SMTP id
 lz10mr5878137ejb.502.1628183475524; 
 Thu, 05 Aug 2021 10:11:15 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-116-27-227.retail.telecomitalia.it. [80.116.27.227])
 by smtp.gmail.com with ESMTPSA id n2sm2592655edi.32.2021.08.05.10.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:11:15 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org
Date: Thu,  5 Aug 2021 19:11:00 +0200
Message-Id: <20210805171101.13776-2-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805171101.13776-1-mcroce@linux.microsoft.com>
References: <20210805171101.13776-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFT net-next 1/2] stmmac: use build_skb()
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

From: Matteo Croce <mcroce@microsoft.com>

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a2aa75cb184e..30a0d915cd4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5208,7 +5208,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			/* XDP program may expand or reduce tail */
 			buf1_len = xdp.data_end - xdp.data;
 
-			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
+			skb = build_skb(xdp.data_hard_start, PAGE_SIZE);
 			if (!skb) {
 				priv->dev->stats.rx_dropped++;
 				count++;
@@ -5216,11 +5216,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			}
 
 			/* XDP program may adjust header */
-			skb_copy_to_linear_data(skb, xdp.data, buf1_len);
+			skb_reserve(skb, buf->page_offset);
 			skb_put(skb, buf1_len);
 
-			/* Data payload copied into SKB, page ready for recycle */
-			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			page_pool_release_page(rx_q->page_pool, buf->page);
 			buf->page = NULL;
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
