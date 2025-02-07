Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB9A2BE8C
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 09:57:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF917C78F67;
	Fri,  7 Feb 2025 08:57:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D979EC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 08:57:02 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21ddab8800bso25578975ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Feb 2025 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738918621; x=1739523421;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Vx3ELvMf0qmQJJFnyKbMyptnWywqfF72JyrwcCPkjc=;
 b=QcUkO8Zy3voYaeGdC9LEpkIZ3QFZCbDrJcktbSgF37993B197be2WkGqLZ4MGbqmY4
 fd8lPmELj+K5m1ZuvYg0y/iQM+wPCbH8m4V9yr3QOWNcIT72YObrmlJ10sHddNg/f1ha
 AsHovM2JW4DDdL0SC5L5on4OcLtUUX10MUXZ5g5b7nq8DCJcHKZZnI8EwHuUuFJIoBrI
 SS3pSxmHzwfQpQMQh/gzPGl/c2dTdgyYT9bGVlvm6NFlo21YzGhY9Gf5TrpysEjrAkcy
 mQDTrE85nIN4gVQfNENXtP5SVYC2lmaUBAzJbSZl43GsDjVCo5yzaNH4C6wdQfaGUvG+
 yG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738918621; x=1739523421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Vx3ELvMf0qmQJJFnyKbMyptnWywqfF72JyrwcCPkjc=;
 b=trSlyl3iD2S+C0NLAY5lxX+49P6wmd0jhvny5PwNuTeM6KDMoD5jynSUzEsYujOToN
 t+pssnS1Tfp9p0mYbUUB+aFOLfaBBndvxYn2O4lS+gYWWz9Fq/8PmTSyoYTWJm3TCjLc
 biGb+yqc3py097GYCFjHG7TFX1R1ZjE4e4YeqE0Pls+NKtfLz6g9ZURJE0zOcDa0WPT1
 Afb/D/Ts9fAzdOeaGoL4x1yha5xswt8IL9zt5ZCsWcoPPHB5PVBxyl1y2qvDngKiCbkt
 hRKC4IIe3FKOAbAKfqeT5+8Yougerg3ns7mHzNgfpsTJJ7Qd8+XQpFhGuuSRd1QZuRdc
 t7qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpDrVyDwyxdMV0QIDN2hNajYf76Wz57zwAfZN4Vk9V8uMF5wZMHvTwRw10P1tkdspb5NQEtvEjrnlQFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwbwNd76dhuN1Z4YgCxgJoUIiI+k1mQaHAudbtnUDVuLX5C181p
 oqbTIjxaSFg/6h3Ycc75ICXBCrUed0DpJU/TYqbf6p0+dLUjuVoE
X-Gm-Gg: ASbGncvBOB5VOk0Lg5E6ZFKUl2dvhSqaOL+eOqR9+l17L6T6XSYF0c3IvF8Wlbj+woy
 4XWmyE6dmuLSsQQRMC5loQ8TDRhVIjRrHA9LgWunYDN1jwMOz/z/hFiAKDYebH0YaNd34rI7J4d
 nHkoRAoEX3iVig8WTVCA9NlVpG0lNFNFsu8h8vN8Ls6hdXVn7BlezHA3X9jIqiTyC6GC+2WJk1b
 8R3EnTvFe4oaG1FWexElOkX9T3FLqrjI6Oh5T8NKht30fN7FoHoqBnMkl4tuqVt+V6YxMPiY5gM
 BqxunWjVCrhMjE6doOQ5sVkQH2QS
X-Google-Smtp-Source: AGHT+IFlNjPnbw667WtlBgeKpirAAyliI8fxFRqc6Br/oWFk5pHJMGbuj7/4JbGsPe3J/2mcAIkPMA==
X-Received: by 2002:a17:903:19cc:b0:21f:35fd:1b6a with SMTP id
 d9443c01a7336-21f4e76cb06mr47882695ad.51.1738918621258; 
 Fri, 07 Feb 2025 00:57:01 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2fa2716c1ecsm945042a91.25.2025.02.07.00.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 00:57:00 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  7 Feb 2025 16:56:39 +0800
Message-Id: <20250207085639.13580-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Jon Hunter <jonathanh@nvidia.com>, Ido Schimmel <idosch@idosch.org>,
 Brad Griffis <bgriffis@nvidia.com>, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: Apply new page pool
	parameters when SPH is enabled
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

Commit df542f669307 ("net: stmmac: Switch to zero-copy in
non-XDP RX path") makes DMA write received frame into buffer at offset
of NET_SKB_PAD and sets page pool parameters to sync from offset of
NET_SKB_PAD. But when Header Payload Split is enabled, the header is
written at offset of NET_SKB_PAD, while the payload is written at
offset of zero. Uncorrect offset parameter for the payload breaks dma
coherence [1] since both CPU and DMA touch the page buffer from offset
of zero which is not handled by the page pool sync parameter.

And in case the DMA cannot split the received frame, for example,
a large L2 frame, pp_params.max_len should grow to match the tail
of entire frame.

[1] https://lore.kernel.org/netdev/d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com/

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: Brad Griffis <bgriffis@nvidia.com>
Suggested-by: Ido Schimmel <idosch@idosch.org>
Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b34ebb916b89..c0ae7db96f46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2094,6 +2094,11 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.offset = stmmac_rx_offset(priv);
 	pp_params.max_len = dma_conf->dma_buf_sz;
 
+	if (priv->sph) {
+		pp_params.offset = 0;
+		pp_params.max_len += stmmac_rx_offset(priv);
+	}
+
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
 		ret = PTR_ERR(rx_q->page_pool);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
