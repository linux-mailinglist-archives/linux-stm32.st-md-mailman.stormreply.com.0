Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D149F02DF
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 04:00:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72CBCC7129D;
	Fri, 13 Dec 2024 03:00:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A817C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 03:00:46 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-725ee6f56b4so1129363b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 19:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734058845; x=1734663645;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KPBXi5N5CCwTHICg2FM5R+V0qUviqQKoqSquGXTiuRs=;
 b=a/p+VwOpQOU5DwIn2H9o+/FloWdtZ0zlkMmovY47nkCD5NMpLq2+YmxJSfb0DvYiIM
 6vqu39qwknllEnkObmJl4tHNxjhftxnIaHL35dGpsLC9rKbtkAY0vMlnfDNAgPwFg7zd
 6Py6AV6yIt7dBqZsYPdY/LQnIdOoJ6eOvW6jV0XIutUJW7miDUsngkpoI7H1kMtB65PY
 fM6MPjazG5lGi0lfdmnHTnmEcDRlun1LOR5a3z0KJH3p4sq1IdCgmoRlbT5KzVOYYzju
 D78bpM04I1otOKFeHy6pVE2SNOeT7Vx5T92rNHxh02xUWnF4szyjxIwvjnwG7P1bXw4V
 IRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734058845; x=1734663645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPBXi5N5CCwTHICg2FM5R+V0qUviqQKoqSquGXTiuRs=;
 b=VMhywcHtyBz/NztHpaDCHqvmx4BYglLmZFqXqCSNZ2hqpLFkB8x3kwj5alhEeyQeD+
 jIg5Ijl4obYUq9lEFct+YEzFYLaB40GpfJ7R/QsTGPD6lpIQDx2p/DZSQeGYEtdNU3F2
 pYe+AiyQeuGdEBqFKZwX/G3bSOxXhG5O5i7ezUfsGImBnwmUPiMJNuIxZKOh5GoOHmA5
 vqavrRz9LzonuhLp/EcIF7TtMuxNOgzE0gT+I27f290B0BPqsRF9G4Eky6D0zrGiSuzD
 4rtiePTlt9+8yO9TJK8hk5VKYQVsMweBVOfQlmG2ho3ZxO4rrB5au+/y7P6lvu9O9Lqa
 tBmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpqXCYJuaupr4WnpjGjbVwlkwlTcvLhkOv2LJ9gjAmjAKXA4lpZExsvmvJUkPnV46UadSw4Kx2PoB+Hw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YypZbcj0Od5m07SFAiwBc/bIROkXGdcyMT4uZGPqS+Ag4IaL8vC
 S+HF4ZhMllTozXfhep/M6YTpV3tqGPEQqK6Q27bFbII+/dtbKmKs
X-Gm-Gg: ASbGncvug8qLnMKPYTJiGOHYqs3D4F+sHbhUDucODTTFMYvWiKlE8n8D8qmm6+kUULe
 kdrH+MhCVes/zqaEFmSdJtcaMlhBXoZnurkUaMFfw3/U0rxqYacZWPSpqXPhnNBojdciL3DS3F9
 JS3AbOklAfjC5J9rEJlbmk+YNr6M1awbeVL8fkgMOYJ9u/zLaHxx1MHK7o/ulTscs5FRP2bgqQ6
 qy5tvXbefUyGMllbnnUyKcyIPT6ZQSe0jA9ujiABMVcrTaWkXdJ9DdWEbcm4xvxkWicCQ==
X-Google-Smtp-Source: AGHT+IHZz0EP8rBsHt73REos2pRhq2kj90v6bkCqeRkKUwXgaZ0ElTwKurf6FJc0UkKYBVOnQvmB0Q==
X-Received: by 2002:a05:6a00:c82:b0:728:eb62:a132 with SMTP id
 d2e1a72fcca58-7290c1b1c49mr1368212b3a.15.1734058844679; 
 Thu, 12 Dec 2024 19:00:44 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-728957aaf22sm5977712b3a.128.2024.12.12.19.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 19:00:44 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Dec 2024 11:00:06 +0800
Message-Id: <20241213030006.337695-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: TSO: Simplify the
	code flow of DMA descriptor allocations
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

The DMA AXI address width of DWMAC cores can be configured to
32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
get a little different between 32-bit and 40-bit/48-bit.
Current driver code checks priv->dma_cap.addr64 to use certain format
with certain configuration.

This patch converts the format of DMA transmit descriptors on platforms
that the DMA AXI address width is configured to 32-bit (as described by
function comments of stmmac_tso_xmit() in current code) to a more generic
format (see the updated function comments after this patch) which is
actually already used on 40-bit/48-bit platforms to provide better
compatibility and make code flow cleaner.

Tested and verified on:
DWMAC CORE 5.10a with 32-bit DMA AXI address width
DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 60 ++++++++-----------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 16b8bcfa8b11..a48b7cf74a29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4121,11 +4121,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 			desc = &tx_q->dma_tx[tx_q->cur_tx];
 
 		curr_addr = des + (total_len - tmp_len);
-		if (priv->dma_cap.addr64 <= 32)
-			desc->des0 = cpu_to_le32(curr_addr);
-		else
-			stmmac_set_desc_addr(priv, desc, curr_addr);
-
+		stmmac_set_desc_addr(priv, desc, curr_addr);
 		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
 			    TSO_MAX_BUFF_SIZE : tmp_len;
 
@@ -4171,17 +4167,27 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
  *  First Descriptor
  *   --------
  *   | DES0 |---> buffer1 = L2/L3/L4 header
- *   | DES1 |---> TCP Payload (can continue on next descr...)
- *   | DES2 |---> buffer 1 and 2 len
+ *   | DES1 |---> can be used as buffer2 for TCP Payload if the DMA AXI address
+ *   |      |     width is 32-bit, but we never use it.
+ *   |      |     Also can be used as the most-significant 8-bits or 16-bits of
+ *   |      |     buffer1 address pointer if the DMA AXI address width is 40-bit
+ *   |      |     or 48-bit, and we always use it.
+ *   | DES2 |---> buffer1 len
  *   | DES3 |---> must set TSE, TCP hdr len-> [22:19]. TCP payload len [17:0]
  *   --------
+ *   --------
+ *   | DES0 |---> buffer1 = TCP Payload (can continue on next descr...)
+ *   | DES1 |---> same as the First Descriptor
+ *   | DES2 |---> buffer1 len
+ *   | DES3 |
+ *   --------
  *	|
  *     ...
  *	|
  *   --------
- *   | DES0 | --| Split TCP Payload on Buffers 1 and 2
- *   | DES1 | --|
- *   | DES2 | --> buffer 1 and 2 len
+ *   | DES0 |---> buffer1 = Split TCP Payload
+ *   | DES1 |---> same as the First Descriptor
+ *   | DES2 |---> buffer1 len
  *   | DES3 |
  *   --------
  *
@@ -4191,15 +4197,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int tmp_pay_len = 0, first_tx, nfrags;
 	unsigned int first_entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
-	dma_addr_t tso_des, des;
+	int i, first_tx, nfrags;
 	u8 proto_hdr_len, hdr;
+	dma_addr_t des;
 	bool set_ic;
-	int i;
 
 	/* Always insert VLAN tag to SKB payload for TSO frames.
 	 *
@@ -4284,24 +4289,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (dma_mapping_error(priv->device, des))
 		goto dma_map_err;
 
-	if (priv->dma_cap.addr64 <= 32) {
-		first->des0 = cpu_to_le32(des);
-
-		/* Fill start of payload in buff2 of first descriptor */
-		if (pay_len)
-			first->des1 = cpu_to_le32(des + proto_hdr_len);
-
-		/* If needed take extra descriptors to fill the remaining payload */
-		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
-		tso_des = des;
-	} else {
-		stmmac_set_desc_addr(priv, first, des);
-		tmp_pay_len = pay_len;
-		tso_des = des + proto_hdr_len;
-		pay_len = 0;
-	}
-
-	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
+	stmmac_set_desc_addr(priv, first, des);
+	stmmac_tso_allocator(priv, des + proto_hdr_len, pay_len,
+			     (nfrags == 0), queue);
 
 	/* In case two or more DMA transmit descriptors are allocated for this
 	 * non-paged SKB data, the DMA buffer address should be saved to
@@ -4405,11 +4395,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	/* Complete the first descriptor before granting the DMA */
-	stmmac_prepare_tso_tx_desc(priv, first, 1,
-			proto_hdr_len,
-			pay_len,
-			1, tx_q->tx_skbuff_dma[first_entry].last_segment,
-			hdr / 4, (skb->len - proto_hdr_len));
+	stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
+				   tx_q->tx_skbuff_dma[first_entry].last_segment,
+				   hdr / 4, (skb->len - proto_hdr_len));
 
 	/* If context desc is used to change MSS */
 	if (mss_desc) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
