Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E797C8E2
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Sep 2024 14:11:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B69EEC6DD9A;
	Thu, 19 Sep 2024 12:11:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EDA4C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2024 12:10:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2055f630934so7053455ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2024 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726747855; x=1727352655;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o32/nc+Dqjrsv+Sp5j6ph6epltryoYejvMuSKLYsEsQ=;
 b=UdcrStB6C+OfEZWahtb/nVY8kFFjhNeelvx2hkg0Dir/0oCno2lNmljW/sU6BsnAH9
 0XYZ98tFfURLbNGjDbUAyu2jg7Lnj6+mzflZvacy+4F3LoQo4Tfudyy+TbJDQCV4bnzc
 Id+pTBVhto/RIaTwsD8IHJ7Grw8vDe3gJkeM75V5UKPcWqQ/JgtkxoHvFPoi3U6znxVt
 8ORa4rKH7LNH+jOAExvP6l8xqnhrnhn7CvmJoU30HXUMb4fg1hCh62MehFNGcs+VImZW
 CYQk55vUVfIfIcqsqL5WrEe7Hs+rh1PId/PXjPCX9FxPRLqCB/QjYRymUMjrejkQhLN2
 sC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726747855; x=1727352655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o32/nc+Dqjrsv+Sp5j6ph6epltryoYejvMuSKLYsEsQ=;
 b=h9dYBDxGPKHz+FzKXgBYKPZeRo0Mj1JFnF19WuQBxghpmUeCNtxI8BUpqDa6Y0kZvu
 CsyS8mjWNAlQpD9xnIzdfXIBdn7jXgQtOMeauFqFS/US32w+9C616UaL6zr0jyHOELvl
 l5WeUBljyULj8kgP83nDWEqzdz9nalg1Q6wp/lsqJJ+icNdJa87llMM7jsavf6BJTbnp
 nnkrO1mBfLyxIB9PQKcp8TIUJQb2iKYniY0twBAoZ9+cnTd3NixpYpnQfLJU4ow/CFki
 wXGCYaD7XcAltCHHX5k6aMqwnBuZx4Q25V5W0ev/APw+Qc0OrvJYlhUXJ+KaVAk1na+j
 jwAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkjh0hmjUU9w+VQmeNFLRdZwFS6DHBQr4cICWjbJk5i7TTy+mbng3zR5+3xE6T47EDc09N7JmEFkcRWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwmpczAu4OxvOdRBoa737m5zj54Id1DCBb91/Iw36tgkeBQjHQv
 6kVtEA3ztnkGgR5W/nE86omeo+ltGyrP7ClY00ZynaEEqOAM/58F
X-Google-Smtp-Source: AGHT+IGZREsj4SQwgdJITtOEHoTSJHe60c5soOhc/Mx1CbgeWx979RO8pm0n67220rUA8Tpw/0tJSQ==
X-Received: by 2002:a17:902:f54c:b0:1fb:a1cb:cb25 with SMTP id
 d9443c01a7336-2076e3eaabcmr356890015ad.40.1726747854563; 
 Thu, 19 Sep 2024 05:10:54 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2079460327bsm78691445ad.103.2024.09.19.05.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 05:10:54 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Thu, 19 Sep 2024 20:10:28 +0800
Message-Id: <20240919121028.1348023-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: set PP_FLAG_DMA_SYNC_DEV
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

Commit 5fabb01207a2 ("net: stmmac: Add initial XDP support") sets
PP_FLAG_DMA_SYNC_DEV flag for page_pool unconditionally,
page_pool_recycle_direct() will call page_pool_dma_sync_for_device()
on every page even the page is not going to be reused by XDP program.

When XDP is not enabled, the page which holds the received buffer
will be recycled once the buffer is copied into new SKB by
skb_copy_to_linear_data(), then the MAC core will never reuse this
page any longer. Always setting PP_FLAG_DMA_SYNC_DEV wastes CPU cycles
on unnecessary calling of page_pool_dma_sync_for_device().

After this patch, up to 9% noticeable performance improvement was observed
on certain platforms.

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
