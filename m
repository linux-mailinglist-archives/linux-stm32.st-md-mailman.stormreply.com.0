Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B82F1C85FE5
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Nov 2025 17:37:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7067AC5A4E0;
	Tue, 25 Nov 2025 16:37:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17B6AC5A4DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Nov 2025 16:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C655044141;
 Tue, 25 Nov 2025 16:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 975F9C4CEF1;
 Tue, 25 Nov 2025 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764088637;
 bh=nBeML0ip1QW4LgnV9TIkkO+eD75Thqh7vMCTrOjDcoU=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=nndKed/qvsGzyjQlpMxhJr5D8NDa+9pN2yxdtF96KeTreqZpkq5/JTdojK6YoKppl
 Zy9vAqTZcpuSVzs5ajKlCPCfw6m4ru9lIoDvdlWnzCoAG9obF3xqT2UbR7iLQ60KRA
 rKaSUfhg03RpuG+CkMbnHA7/iqyVuPqQwu1V2Yif6hWxg84aFi/THEe5qpcw8IAc58
 +4EB+VkfYwbXU6Z94DYDb/vb7d9LMSYYeOajfYIHxo8K2Oycuf7/25YdT30DF2A+GR
 cIt+d6oPRB5OfjY2Jvn1Gn+egl5ivHiUDrjRFabwbEpK7wTSiDDm9FnR+mWKoh33uh
 J7WHOcJmDK2sA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 81943D0EE00;
 Tue, 25 Nov 2025 16:37:17 +0000 (UTC)
From: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Wed, 26 Nov 2025 00:37:12 +0800
MIME-Version: 1.0
Message-Id: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
X-B4-Tracking: v=1; b=H4sIADfbJWkC/x2MSwqAMAwFr1KyttAUItariIifqNlUaUWE4t0NL
 ucxbwpkTsIZWlMg8S1ZjqiAlYF5H+PGVhZl8M4Toic7ohv4uYZVHkuBsHE0heBq0MeZWOe/1kH
 ky0Y1oX/fDzRrBKVnAAAA
X-Change-ID: 20251125-a10_ext_fix-5951805b9906
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764088636; l=6674;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=1yOOam2AS2+5uDLyswXLrju6hz3Fas3Llt1CFCEF2XQ=;
 b=0nGCrQtOBgw4LLg/JEC16HfXKFngX7ZaZTAAG3vvYoi54fUKNVpkF6bRXIgxRlb7WXsCcGQjU
 dUDM7EjLUYEBhyqE0IYhZ/QVwrrpo3yYvvkDOPFJ42WkL9Oa9jBoOvv
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-kernel@vger.kernel.org, Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac: Disable flushing
 frames on Rx Buffer Unavailable
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
Reply-To: rohan.g.thomas@altera.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Rohan G Thomas <rohan.g.thomas@altera.com>

In Store and Forward mode, flushing frames when the receive buffer is
unavailable, can cause the MTL Rx FIFO to go out of sync. This results
in buffering of a few frames in the FIFO without triggering Rx DMA
from transferring the data to the system memory until another packet
is received. Once the issue happens, for a ping request, the packet is
forwarded to the system memory only after we receive another packet
and hece we observe a latency equivalent to the ping interval.

64 bytes from 192.168.2.100: seq=1 ttl=64 time=1000.344 ms

Also, we can observe constant gmacgrp_debug register value of
0x00000120, which indicates "Reading frame data".

The issue is not reproducible after disabling frame flushing when Rx
buffer is unavailable. But in that case, the Rx DMA enters a suspend
state due to buffer unavailability. To resume operation, software
must write to the receive_poll_demand register after adding new
descriptors, which reactivates the Rx DMA.

This issue is observed in the socfpga platforms which has dwmac1000 IP
like Arria 10, Cyclone V and Agilex 7. Issue is reproducible after
running iperf3 server at the DUT for UDP lower packet sizes.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 5 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c     | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h          | 3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 2 ++
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 6d9b8fac3c6d0fd76733ab4a1a8cce2420fa40b4..5877fec9f6c30ed18cdcf5398816e444e0bd0091 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -135,10 +135,10 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
 
 	if (mode == SF_DMA_MODE) {
 		pr_debug("GMAC: enable RX store and forward mode\n");
-		csr6 |= DMA_CONTROL_RSF;
+		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;
 	} else {
 		pr_debug("GMAC: disable RX SF mode (threshold %d)\n", mode);
-		csr6 &= ~DMA_CONTROL_RSF;
+		csr6 &= ~(DMA_CONTROL_RSF | DMA_CONTROL_DFF);
 		csr6 &= DMA_CONTROL_TC_RX_MASK;
 		if (mode <= 32)
 			csr6 |= DMA_CONTROL_RTC_32;
@@ -262,6 +262,7 @@ const struct stmmac_dma_ops dwmac1000_dma_ops = {
 	.dma_rx_mode = dwmac1000_dma_operation_mode_rx,
 	.dma_tx_mode = dwmac1000_dma_operation_mode_tx,
 	.enable_dma_transmission = dwmac_enable_dma_transmission,
+	.enable_dma_reception = dwmac_enable_dma_reception,
 	.enable_dma_irq = dwmac_enable_dma_irq,
 	.disable_dma_irq = dwmac_disable_dma_irq,
 	.start_tx = dwmac_dma_start_tx,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index d1c149f7a3dd9e472b237101666e11878707f0f2..054ecb20ce3f68bce5da3efaf36acf33e430d3f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -169,6 +169,7 @@ static inline u32 dma_chan_base_addr(u32 base, u32 chan)
 #define NUM_DWMAC4_DMA_REGS	27
 
 void dwmac_enable_dma_transmission(void __iomem *ioaddr, u32 chan);
+void dwmac_enable_dma_reception(void __iomem *ioaddr, u32 chan);
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			  u32 chan, bool rx, bool tx);
 void dwmac_disable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 467f1a05747ecf0be5b9f3392cd3d2049d676c21..97a803d68e3a2f120beaa7c3254748cf404236df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -33,6 +33,11 @@ void dwmac_enable_dma_transmission(void __iomem *ioaddr, u32 chan)
 	writel(1, ioaddr + DMA_CHAN_XMT_POLL_DEMAND(chan));
 }
 
+void dwmac_enable_dma_reception(void __iomem *ioaddr, u32 chan)
+{
+	writel(1, ioaddr + DMA_CHAN_RCV_POLL_DEMAND(chan));
+}
+
 void dwmac_enable_dma_irq(struct stmmac_priv *priv, void __iomem *ioaddr,
 			  u32 chan, bool rx, bool tx)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index f257ce4b6c66e0bbd3180d54ac7f5be934153a6b..df6e8a567b1f646f83effbb38d8e53441a6f6150 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -201,6 +201,7 @@ struct stmmac_dma_ops {
 	void (*dma_diagnostic_fr)(struct stmmac_extra_stats *x,
 				  void __iomem *ioaddr);
 	void (*enable_dma_transmission)(void __iomem *ioaddr, u32 chan);
+	void (*enable_dma_reception)(void __iomem *ioaddr, u32 chan);
 	void (*enable_dma_irq)(struct stmmac_priv *priv, void __iomem *ioaddr,
 			       u32 chan, bool rx, bool tx);
 	void (*disable_dma_irq)(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -261,6 +262,8 @@ struct stmmac_dma_ops {
 	stmmac_do_void_callback(__priv, dma, dma_diagnostic_fr, __args)
 #define stmmac_enable_dma_transmission(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, enable_dma_transmission, __args)
+#define stmmac_enable_dma_reception(__priv, __args...) \
+	stmmac_do_void_callback(__priv, dma, enable_dma_reception, __args)
 #define stmmac_enable_dma_irq(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, enable_dma_irq, __priv, __args)
 #define stmmac_disable_dma_irq(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6cacedb2c9b3fefdd4c9ec8ba98d389443d21ebd..1ecca60baf74286da7f156b4c3c835b3cbabf1ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4973,6 +4973,8 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 	rx_q->rx_tail_addr = rx_q->dma_rx_phy +
 			    (rx_q->dirty_rx * sizeof(struct dma_desc));
 	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, queue);
+	/* Wake up Rx DMA from the suspend state if required */
+	stmmac_enable_dma_reception(priv, priv->ioaddr, queue);
 }
 
 static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,

---
base-commit: e3daf0e7fe9758613bec324fd606ed9caa187f74
change-id: 20251125-a10_ext_fix-5951805b9906

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
