Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B12977E24
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Sep 2024 13:03:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2157CC78017;
	Fri, 13 Sep 2024 11:03:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E033C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 11:03:37 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7191901abd6so571934b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 04:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726225416; x=1726830216;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kekk9n1SKeIq8mwQfBadmC6X0rQ17ZPly6vPtHna6So=;
 b=QwoYKw4HBHiyhU25s8J8dEVMl8g1yGwEMtU8jI2oct+tZZzRYxVz/zN1R+rwhEXMSi
 MwCQsdZqOpfsDUSF77EQGH4HJIkKb7r7nE3RYw2IczX59R+IA0u72FPSlNT1GJLZmMk6
 SKqtRqw05X9sb+vt4sm3QDByT8bcNkuIBMY/M4oBkJZCxdE9VfBuDDQixopnMzbXx/Ff
 PhHa20JoZm2MFnr6ZsBXY4DPqxAHS3GnJ3djiUuDxwczivi+7EPr/fW2i2UPb44WZDz6
 SE0hvvOe1kRZkxVJOh+xVEOdpVMF+2qvherDKLvwETvs7NzH2x4YJ09tmwJp04qzI1/K
 aD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726225416; x=1726830216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kekk9n1SKeIq8mwQfBadmC6X0rQ17ZPly6vPtHna6So=;
 b=xPP/geaOKpWb9J3dpzbJ64Vr7Odnyj+JurcYcd0sMXwLIE4NP0WkdkJ+fobr821TOE
 ZU1k2byiiAHxPp6TyCTLsT/1hRsaGvHrSjrOacY9+X4pjsg7t+UgjbGNz5gW9k4V21JN
 kDweurIKZdUELUQQb8zlPMFzvpza15nxn5Umg/db1MaL8bWxwHhbW5VyFs1QJX2C/Jaf
 AjLUdoP7k0p5J7qo0oVnpf8srKq6g7xe8nnGNzS0kRjQLkvQA3lxPJs7+RUn6MRp1xO8
 b3NeTXdf4+sO2sVnbcRBsU2ZPJCxzJBkBpEXSiAf5kRCNnsz3/l4286c+Tpsx4bqU6ev
 qv6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnLoXaHPy9rUJBQGta55WMxPy4F4txZzw/74j5Xcc0v1clcGpq7TG1zfKRuKhCdhRhe1WrksaEox3iAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzIUsPBD/ntkBFeHGAYFWJOMqlpB9IErKX1mk4IUZDYKtYJMdq/
 gcW+747J4oEFBgzFKVKPrXInQQlYzNesV2nlsXdSvV1T0h7+ufrL
X-Google-Smtp-Source: AGHT+IGwEoyrvESSqovr/1cjtEp4lX2jChUMznGaRwX1hjVp0qpnhQ9RUdRvLc6shj18XvoBOrPGEg==
X-Received: by 2002:a05:6a00:23c3:b0:718:ea3c:35c3 with SMTP id
 d2e1a72fcca58-71936a5e2d6mr3704608b3a.15.1726225415732; 
 Fri, 13 Sep 2024 04:03:35 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71909092560sm5882778b3a.138.2024.09.13.04.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 04:03:35 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri, 13 Sep 2024 19:02:59 +0800
Message-Id: <20240913110259.1220314-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: set PP_FLAG_DMA_SYNC_DEV
	only if XDP is enabled
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

When XDP is not enabled, the page which holds the received buffer
will be recycled once the buffer is copied into SKB by
skb_copy_to_linear_data(), then the MAC core will never reuse this
page any longer. Set PP_FLAG_DMA_SYNC_DEV wastes CPU cycles.

This patch brings up to 9% noticeable performance improvement on
certain platforms.

Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f3a1b179aaea..95d3d1081727 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2022,7 +2022,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	rx_q->queue_index = queue;
 	rx_q->priv_data = priv;
 
-	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
+	pp_params.flags = PP_FLAG_DMA_MAP | (xdp_prog ? PP_FLAG_DMA_SYNC_DEV : 0);
 	pp_params.pool_size = dma_conf->dma_rx_size;
 	num_pages = DIV_ROUND_UP(dma_conf->dma_buf_sz, PAGE_SIZE);
 	pp_params.order = ilog2(num_pages);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
