Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F09A5A2D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 08:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB08C78035;
	Mon, 21 Oct 2024 06:10:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 735C9C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 06:10:45 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-71e70c32cd7so3317173b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Oct 2024 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729491044; x=1730095844;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iQESqJ9aYfd46Wdo01VIZ5qOywZL6bQHldy6wnuTUU8=;
 b=O+zcmctZ0sru4MZCi5e7Yi94C9C5KCsQOzoKVkafmoyq6Wko66RE0X/p6DnmM6TJs/
 5OxExOdj55DSXVmQ6lO3Ei4OU4PXe6qGRHyjNWgQQaQ13HIGCuucSM5W1UEBR/ejHHHv
 5fFCY2LawtO0148REt3w5yHUbZ58tLGFenuAKyPmRkf/+J8QOwiKqHs8/aZdyLsvl5Iq
 P1O4P11bnLFecMu85kOTSESwh0aMZWtc30CB7j6NpMe83/azHgIM2QwG/ik9ykUbGOXQ
 lbp1tQaRBzVf9DQiStq01jfEUUqfAWSYpnpnZqG6gsLcoxCdmdwji8ZQ0eGOOpBLksHF
 cMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729491044; x=1730095844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQESqJ9aYfd46Wdo01VIZ5qOywZL6bQHldy6wnuTUU8=;
 b=nFM/alGh21nBw028niK+zKr5GpbIqAMAv4Lhcm9aQM1o4+ns7ppQQLCBgTC8rDFP7r
 z00sLjeYFCG0oqkqwoty6FLhYV6TEmKpV4hNHUXw6k6kk2IY4ReAIhXGOI57ZlVhe8/j
 X/vQok74PxTXg539WOlFl9JUQU5lBfJLfvAOn6XfYraXF7YkUXUAe0rfg4agIYwPdk5V
 H82tctifC1+OyvKEDOUQLP3RZluSNFoPNwmTe8s15w85lDWXaXJKExdUVCjZpnYSIyq+
 6PQddfNWcUtJa+mCohJ1+9/QI/C9pSscGaPy1TysQfCWFHexHc39Fxn1x1NstK/+ghjv
 6Jmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRVOmt4iGMZbZ6qtNLXcCNnOJMl3Xm5SpDnUAwtjkewOrbiBuKX6p7I8C6idSv5cf7psK23e5XxgmXsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx26t/cNmnIHeFTBVV7zo0BQ2D5u15PTS5u7njaMIqUyBmAJpNP
 20Rg191KCvMVJXU2jHEhxMNyRGQx3HSaLQfdYs+/gAcNEMHz0cnA
X-Google-Smtp-Source: AGHT+IFfcM3mmxhkbfvMBoyB5bFdlWr6KbbE9WM+AEcGbqCxvjfTNgq2Enq1ESlcFgxrfwc/MvRFcQ==
X-Received: by 2002:a05:6a00:3d15:b0:71e:79a9:ec47 with SMTP id
 d2e1a72fcca58-71ea3118addmr16050357b3a.6.1729491043923; 
 Sun, 20 Oct 2024 23:10:43 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71ec13d7422sm2145735b3a.97.2024.10.20.23.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 23:10:43 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Oct 2024 14:10:23 +0800
Message-Id: <20241021061023.2162701-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA
	map/unmap for non-paged SKB data
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

In case the non-paged data of a SKB carries protocol header and protocol
payload to be transmitted on a certain platform that the DMA AXI address
width is configured to 40-bit/48-bit, or the size of the non-paged data
is bigger than TSO_MAX_BUFF_SIZE on a certain platform that the DMA AXI
address width is configured to 32-bit, then this SKB requires at least
two DMA transmit descriptors to serve it.

For example, three descriptors are allocated to split one DMA buffer
mapped from one piece of non-paged data:
    dma_desc[N + 0],
    dma_desc[N + 1],
    dma_desc[N + 2].
Then three elements of tx_q->tx_skbuff_dma[] will be allocated to hold
extra information to be reused in stmmac_tx_clean():
    tx_q->tx_skbuff_dma[N + 0],
    tx_q->tx_skbuff_dma[N + 1],
    tx_q->tx_skbuff_dma[N + 2].
Now we focus on tx_q->tx_skbuff_dma[entry].buf, which is the DMA buffer
address returned by DMA mapping call. stmmac_tx_clean() will try to
unmap the DMA buffer _ONLY_IF_ tx_q->tx_skbuff_dma[entry].buf
is a valid buffer address.

The expected behavior that saves DMA buffer address of this non-paged
data to tx_q->tx_skbuff_dma[entry].buf is:
    tx_q->tx_skbuff_dma[N + 0].buf = NULL;
    tx_q->tx_skbuff_dma[N + 1].buf = NULL;
    tx_q->tx_skbuff_dma[N + 2].buf = dma_map_single();
Unfortunately, the current code misbehaves like this:
    tx_q->tx_skbuff_dma[N + 0].buf = dma_map_single();
    tx_q->tx_skbuff_dma[N + 1].buf = NULL;
    tx_q->tx_skbuff_dma[N + 2].buf = NULL;

On the stmmac_tx_clean() side, when dma_desc[N + 0] is closed by the
DMA engine, tx_q->tx_skbuff_dma[N + 0].buf is a valid buffer address
obviously, then the DMA buffer will be unmapped immediately.
There may be a rare case that the DMA engine does not finish the
pending dma_desc[N + 1], dma_desc[N + 2] yet. Now things will go
horribly wrong, DMA is going to access a unmapped/unreferenced memory
region, corrupted data will be transmited or iommu fault will be
triggered :(

In contrast, the for-loop that maps SKB fragments behaves perfectly
as expected, and that is how the driver should do for both non-paged
data and paged frags actually.

This patch corrects DMA map/unmap sequences by fixing the array index
for tx_q->tx_skbuff_dma[entry].buf when assigning DMA buffer address.

Tested and verified on DWXGMAC CORE 3.20a

Reported-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Fixes: f748be531d70 ("stmmac: support new GMAC4")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d3895d7eecfc..208dbc68aaf9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4304,11 +4304,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (dma_mapping_error(priv->device, des))
 		goto dma_map_err;
 
-	tx_q->tx_skbuff_dma[first_entry].buf = des;
-	tx_q->tx_skbuff_dma[first_entry].len = skb_headlen(skb);
-	tx_q->tx_skbuff_dma[first_entry].map_as_page = false;
-	tx_q->tx_skbuff_dma[first_entry].buf_type = STMMAC_TXBUF_T_SKB;
-
 	if (priv->dma_cap.addr64 <= 32) {
 		first->des0 = cpu_to_le32(des);
 
@@ -4327,6 +4322,23 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
 
+	/* In case two or more DMA transmit descriptors are allocated for this
+	 * non-paged SKB data, the DMA buffer address should be saved to
+	 * tx_q->tx_skbuff_dma[].buf corresponding to the last descriptor,
+	 * and leave the other tx_q->tx_skbuff_dma[].buf as NULL to guarantee
+	 * that stmmac_tx_clean() does not unmap the entire DMA buffer too early
+	 * since the tail areas of the DMA buffer can be accessed by DMA engine
+	 * sooner or later.
+	 * By saving the DMA buffer address to tx_q->tx_skbuff_dma[].buf
+	 * corresponding to the last descriptor, stmmac_tx_clean() will unmap
+	 * this DMA buffer right after the DMA engine completely finishes the
+	 * full buffer transmission.
+	 */
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
+	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
+
 	/* Prepare fragments */
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
