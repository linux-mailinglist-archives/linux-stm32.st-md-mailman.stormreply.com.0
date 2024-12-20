Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0869F9F8DB9
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 09:08:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD406C78027;
	Fri, 20 Dec 2024 08:08:04 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D25EC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 08:07:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-801986033f9so1011787a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734682076; x=1735286876;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sIHIgWFpQUvX2jXNx2azeaWpatd549ZsSnWm31PKQmM=;
 b=ba0/h7oZ7Zp+Zv89i2W54cBvQPY4cjZjg3THWiVrE9vNQGFU/bOBjwBbswQsfjz9Mb
 AtEkwbI2EG7+YmEog5n4wErBdBHpfPv9U0IfXSAIX0uXPpqjKrUGZKuy3hOs9sN4Jyn8
 U3I3IrK2SKMzQUa/UUfi5vL9CMrYPgIjDHwI/QCjosT36/6iQTn//7lEGRLO0b+AnXtV
 pds3VRFpkf/V6UfzgBtfJ+mI8TEFYcVVqT9L6qc1124wAymBK7OpH0IoMLWiDGMqkSts
 qS9ZGnlUL5FULJ5PMd1zvbZ09jf1UEBWgSMFTz/p2/N7wn/aAC1+KyTcBU4x40/7Hx+U
 1gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734682076; x=1735286876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sIHIgWFpQUvX2jXNx2azeaWpatd549ZsSnWm31PKQmM=;
 b=LOwQ1CVYZl1h1yBmawdQiCAnlKuC5Zb5ymATCstHTUGXs2Oah17kjo9hJig93mmnsS
 tlJ5t5OjyKA2mtvAniUzPE02Ukw/esjaCuQfoldo8hvz77xknwnE3rszyqNootpl+aiX
 6MHgSig6ga+W70RH8p/a3/umdtWVzqtnGEPM1Q02ZMFxnwR/POfg+982kgyJ4ryoptAG
 B6/wK3l9BYbABe6KwnnlvAdy7T+qMrqhAXnmifrF7zOzLP3EeUNCOWr1bzzVxt2KYL6i
 dPfpn1LVgOhTbm0MOK/b1tMQJmwwmxxIXEUoAydlxoeIuWD4fuany1gxHYY56Yc2WG86
 qNDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGMq6PvQIO1ZPR19mBNPg0w05NT832r2mjj7FOW+P5c5zW02gtwIs6Be0v0OyxM4SvrEl0le8aVRxEcA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxKWNJWKqphGM3McH+9Tm/vOkL2O2a1jpxGZOeRRIZh383eFA8
 hBVT+rKCt/+2dBjkfdH4ZpF9tTumuBDz8ROfTcpvq45Vao0nWwmk
X-Gm-Gg: ASbGncv9T3iSvbo7ywpTgcT9A/i9IMSsMSiwqwpL1XoWInbxAoiK8tg7mq5clGMU3xA
 2OObJshAOBoPs5JQ0NLTUMVXBdWKRRoxrlG1ztAJIiALEKW54NpRJa2+2v94X8npDEI+vMZJxV1
 glAlRg/Uuokzzk8rwcna4fecvdOtCrmU3niyn5kiJfv9rWNZ1DhX3t+Omb2uNDAj3nT3YKDH4Ut
 b96QRyRQBAM2iUjeV28M1HhShpY0uvihy+BiBEj+nzUuTHSaE6vmRT5dVJv4Q/x4fgy5A==
X-Google-Smtp-Source: AGHT+IG/D9plEVilAERZI3fidpIBW8JkrUOdC70JJmLdSIf9OIsnZlzX/HnlT4jua2CEoZFs6bN1Fw==
X-Received: by 2002:a17:90b:5487:b0:2ee:d9f5:cfb4 with SMTP id
 98e67ed59e1d1-2f452eeb66dmr2697667a91.36.1734682075918; 
 Fri, 20 Dec 2024 00:07:55 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2f447883b0csm2971735a91.42.2024.12.20.00.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 00:07:55 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Dec 2024 16:07:26 +0800
Message-Id: <20241220080726.1733837-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: TSO: Simplify the
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

The TCP Segmentation Offload (TSO) engine is an optional function in
DWMAC cores, it is implemented for dwmac4 and dwxgmac2 only, ancient
dwmac100 and dwmac1000 are not supported by hardware. Current driver
code checks priv->dma_cap.tsoen which is read from MAC_HW_Feature1
register to determine if TSO is enabled in hardware configurations,
if (!priv->dma_cap.tsoen) driver never sets NETIF_F_TSO for net_device.

This patch never affects dwmac100/dwmac1000 and their stmmac_desc_ops:
ndesc_ops/enh_desc_ops, since TSO is never supported by them two.

The DMA AXI address width of DWMAC cores can be configured to
32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
get a little different between 32-bit and 40-bit/48-bit.
Current driver code checks priv->dma_cap.addr64 to use certain format
with certain configuration.

This patch converts the format of DMA transmit descriptors on dwmac4
and dwxgmac2 that the DMA AXI address width is configured to 32-bit (as
described by function comments of stmmac_tso_xmit() in current code) to
a more generic format (see updated function comments after this patch)
which is actually already used on 40-bit/48-bit platforms to provide
better compatibility and make code flow cleaner in TSO TX routine.

Another interesting finding, struct stmmac_desc_ops is a common abstract
interface to maintain descriptors, we should avoid the direct assignment
of descriptor members (e.g. desc->des0), stmmac_set_desc_addr() is the
proper method yet. This patch tries to improve this by the way.

Tested and verified on:
DWMAC CORE 5.00a with 32-bit DMA AXI address width
DWMAC CORE 5.10a with 32-bit DMA AXI address width
DWXGMAC CORE 3.20a with 40-bit DMA AXI address width

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
V1 -> V2: Update commit message
V1: https://lore.kernel.org/r/20241213030006.337695-1-0x1207@gmail.com
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 60 ++++++++-----------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..99eaec8bac4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4116,11 +4116,7 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
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
 
@@ -4166,17 +4162,27 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
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
@@ -4186,15 +4192,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4279,24 +4284,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -4400,11 +4390,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
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
