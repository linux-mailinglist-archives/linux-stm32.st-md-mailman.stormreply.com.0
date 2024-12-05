Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805F9E5114
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 10:19:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06178C71292;
	Thu,  5 Dec 2024 09:19:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8882CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 09:19:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2153e642114so6029645ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 01:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733390376; x=1733995176;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y0HmfRBKBkLsgyW/HeIjKXTJHSnwiReWOxGDbcg2lig=;
 b=XL7ua9GAYxFqDqP9TYpQuCHnWVEMRj0bk6oisrH+RwEzE/fPM8u+rpZfyciwuvZ8TM
 ZEQjBbGrH3rs0jNyNEA9N1+mX7espsG1usNYr3AHmxM4jBmsl4yECSdgd1715nylMj57
 pUKNko3DZ6zXniwHlcZYxuITQeWs9FkkoN0PM7t7FBK7o6X6b2N7d7UKmHZvfCvMPdc7
 WWy4FuvsGgjd1pOeiANF97z+1roRu/I/r/K2BOZ2fw42aLI3yOTNAKOb4OXJDblWDIHE
 P21kQV/TW6lDVnV/nl685zFPPEZvteowMwfmQajqbvW7v2i3pNAuukMAywiQCIL7eBUb
 foZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733390376; x=1733995176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y0HmfRBKBkLsgyW/HeIjKXTJHSnwiReWOxGDbcg2lig=;
 b=IBxn5HwRHCgn3TP46gHqoyd9WavhKaW3yliboM/WafKQqpNN8/0Re7XwJp1Dsaiyu3
 gIkewgWox8S5VOLZHlWnbhbkyn/wsZddD+39odC69sa2ZqNaDzFxOwkNqLSNM+sVxxTg
 fi9oe3q9q4hZhpCEcDzZlU/fG75yZ98FNiE3Ol4OPLLVX9DZOmQp5EAX8XWb4NedihYE
 8OeaQ2kKnNBwXahIkpATioysez48yus4LHmAzc6uVgpdJ32Uy1LjSmQuSLBh67gmpG+9
 iIBDGZOUlnaScLz+c3dn4kn33JDZQ8XUW4p0ecepfDBiMe0RP71TopOC+xEG0ufCnlJo
 ihZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkSKFNMFdksVQbrnT+QPTrG2ewEC0NcKzN0Hj9gSrZguERhdhhUAPLKE4WC9nlf1wujvzFmUfkejqraw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBbcM+GApH8ba1nAgQa6WvV4P2NePbtrBax6X8minUHnbE6A9F
 g026XOA4OSbSbM+Rdnwy+CcxMRo5BqgmOkWd0G0gJN2i8i4kz/Qb
X-Gm-Gg: ASbGncuW3+Eus7jo1/g5m/akm/WlNQidrAu/6+5QZxyUrPVwzce+CkZfFuX2kdScAOF
 7uE3iKdawUKasAcB9ijEOO5ZiKHPFZDyuCeqit+eUAb/dn9hMfP45oXNmtOk0uCvw9Eg/Z7UA8W
 uPtap7pzRbgQvIn7LrbgxAZrY9r/6xlEzFqT3jL0HIm9vN7VEIiewQq4Flb3u8OXRr1B3AL17LU
 L0mnj7caoUg3ckJ6eQj82v0GzkFG3HFEENDW5PE511UZrOYtdl4TNAjbFRa8O4=
X-Google-Smtp-Source: AGHT+IHFjK3cGcjfncsTvxz/JQr72PK97p7r+aYYZQ6H2u3kZ0kfRozsXNPN9a0ZsbcFy3VaXfTZ0g==
X-Received: by 2002:a17:903:1ca:b0:20b:8a71:b5c1 with SMTP id
 d9443c01a7336-215bd1b4604mr141553115ad.1.1733390376224; 
 Thu, 05 Dec 2024 01:19:36 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-215f8f09270sm8234895ad.203.2024.12.05.01.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 01:19:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  5 Dec 2024 17:18:30 +0800
Message-Id: <20241205091830.3719609-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Jon Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>,
 Furong Xu <0x1207@gmail.com>, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unaligned DMA
	unmap for non-paged SKB data
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

Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for
non-paged SKB data") assigns a wrong DMA buffer address that is added an
offset of proto_hdr_len to tx_q->tx_skbuff_dma[entry].buf on a certain
platform that the DMA AXI address width is configured to 40-bit/48-bit,
stmmac_tx_clean() will try to unmap this illegal DMA buffer address
and many crashes are reported: [1] [2].

This patch guarantees that DMA address is passed to stmmac_tx_clean()
unmodified and without offset.

[1] https://lore.kernel.org/all/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/
[2] https://lore.kernel.org/all/klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw/

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: Thierry Reding <thierry.reding@gmail.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Fixes: 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b262cdad60b..7227f8428b5e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
+	dma_addr_t tso_hdr, des;
 	u8 proto_hdr_len, hdr;
-	dma_addr_t des;
 	bool set_ic;
 	int i;
 
@@ -4279,6 +4279,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			     DMA_TO_DEVICE);
 	if (dma_mapping_error(priv->device, des))
 		goto dma_map_err;
+	tso_hdr = des;
 
 	if (priv->dma_cap.addr64 <= 32) {
 		first->des0 = cpu_to_le32(des);
@@ -4310,7 +4311,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	 * this DMA buffer right after the DMA engine completely finishes the
 	 * full buffer transmission.
 	 */
-	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = tso_hdr;
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
 	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
