Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70A37D1C7
	for <lists+linux-stm32@lfdr.de>; Wed, 12 May 2021 20:04:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B894DC57B74;
	Wed, 12 May 2021 18:04:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D1AEC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 May 2021 18:04:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B45D461554;
 Wed, 12 May 2021 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842687;
 bh=eumWB6XYrKh4r8+SrrJ93BOgFZZJLEKh31NxM4tb/68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bSx4lrL/IGIOP3E6yGB+ecyShs6rSKHgFCoxSp8UjpNJiHzWhuNUsWpJFPI2j5C7t
 wmE+5CB9fTNMvsyyjHX3rtERV1XqmzaM6x7J6jiIc+OpcDCVGRFwBFy70jVPIqJdYL
 qDiDPw+LOYmxlwSXVVZ1fLmFA9rSOe29Uj7PSkUrflfuG4OEoh9ZPask0+oqd86Sfm
 monh0+fxzQhKv1iGvLfAr+QlUxk7K1GNiCT+PVMbdcxokNWiWYS+Id7jiQ1EAUGzwE
 4DpANIMnCt8AverpKrkZ+JzayIoLUEe34zo5RoyuUn6YqixjHAY5sQhmstmpbwN0hb
 9rtyOoxhRElhw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 12 May 2021 14:04:07 -0400
Message-Id: <20210512180408.665338-23-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180408.665338-1-sashal@kernel.org>
References: <20210512180408.665338-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Yannick Vignon <yannick.vignon@nxp.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 23/23] net: stmmac: Do not enable
	RX FIFO overflow interrupts
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

From: Yannick Vignon <yannick.vignon@nxp.com>

[ Upstream commit 8a7cb245cf28cb3e541e0d6c8624b95d079e155b ]

The RX FIFO overflows when the system is not able to process all received
packets and they start accumulating (first in the DMA queue in memory,
then in the FIFO). An interrupt is then raised for each overflowing packet
and handled in stmmac_interrupt(). This is counter-productive, since it
brings the system (or more likely, one CPU core) to its knees to process
the FIFO overflow interrupts.

stmmac_interrupt() handles overflow interrupts by writing the rx tail ptr
into the corresponding hardware register (according to the MAC spec, this
has the effect of restarting the MAC DMA). However, without freeing any rx
descriptors, the DMA stops right away, and another overflow interrupt is
raised as the FIFO overflows again. Since the DMA is already restarted at
the end of stmmac_rx_refill() after freeing descriptors, disabling FIFO
overflow interrupts and the corresponding handling code has no side effect,
and eliminates the interrupt storm when the RX FIFO overflows.

Signed-off-by: Yannick Vignon <yannick.vignon@nxp.com>
Link: https://lore.kernel.org/r/20210506143312.20784-1-yannick.vignon@oss.nxp.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  7 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 ++------------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index a41ac13cc4e5..0d993f4b701c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -211,7 +211,7 @@ static void dwmac4_dma_rx_chan_op_mode(void __iomem *ioaddr, int mode,
 				       u32 channel, int fifosz, u8 qmode)
 {
 	unsigned int rqs = fifosz / 256 - 1;
-	u32 mtl_rx_op, mtl_rx_int;
+	u32 mtl_rx_op;
 
 	mtl_rx_op = readl(ioaddr + MTL_CHAN_RX_OP_MODE(channel));
 
@@ -282,11 +282,6 @@ static void dwmac4_dma_rx_chan_op_mode(void __iomem *ioaddr, int mode,
 	}
 
 	writel(mtl_rx_op, ioaddr + MTL_CHAN_RX_OP_MODE(channel));
-
-	/* Enable MTL RX overflow */
-	mtl_rx_int = readl(ioaddr + MTL_CHAN_INT_CTRL(channel));
-	writel(mtl_rx_int | MTL_RX_OVERFLOW_INT_EN,
-	       ioaddr + MTL_CHAN_INT_CTRL(channel));
 }
 
 static void dwmac4_dma_tx_chan_op_mode(void __iomem *ioaddr, int mode,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8e7c60e02fa0..10d28be73f45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3855,7 +3855,6 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 	/* To handle GMAC own interrupts */
 	if ((priv->plat->has_gmac) || xmac) {
 		int status = stmmac_host_irq_status(priv, priv->hw, &priv->xstats);
-		int mtl_status;
 
 		if (unlikely(status)) {
 			/* For LPI we need to save the tx status */
@@ -3866,17 +3865,8 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 		}
 
 		for (queue = 0; queue < queues_count; queue++) {
-			struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
-
-			mtl_status = stmmac_host_mtl_irq_status(priv, priv->hw,
-								queue);
-			if (mtl_status != -EINVAL)
-				status |= mtl_status;
-
-			if (status & CORE_IRQ_MTL_RX_OVERFLOW)
-				stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
-						       rx_q->rx_tail_addr,
-						       queue);
+			status = stmmac_host_mtl_irq_status(priv, priv->hw,
+							    queue);
 		}
 
 		/* PCS link status */
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
