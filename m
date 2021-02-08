Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF076313451
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:04:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E76FC57B62;
	Mon,  8 Feb 2021 14:03:56 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B58CAC57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:03:54 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Joao Pinto
 <Joao.Pinto@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:03:34 +0300
Message-ID: <20210208140341.9271-14-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140341.9271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH 13/20] net: stmmac: Move DMA Tx/Rx init
	methods to DW MAC lib
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

These methods are identical for both DW MAC100 and DW MAC1000 cores, so
their implementation can be moved to the common for the core library.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   | 20 ++-----------------
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    | 20 ++-----------------
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  4 ++++
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   | 14 +++++++++++++
 4 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 2bac49b49f73..2a04d9d45160 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -110,22 +110,6 @@ static void dwmac1000_dma_init(void __iomem *ioaddr,
 	writel(DMA_INTR_DEFAULT_MASK, ioaddr + DMA_INTR_ENA);
 }
 
-static void dwmac1000_dma_init_rx(void __iomem *ioaddr,
-				  struct stmmac_dma_cfg *dma_cfg,
-				  dma_addr_t dma_rx_phy, u32 chan)
-{
-	/* RX descriptor base address list must be written into DMA CSR3 */
-	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR);
-}
-
-static void dwmac1000_dma_init_tx(void __iomem *ioaddr,
-				  struct stmmac_dma_cfg *dma_cfg,
-				  dma_addr_t dma_tx_phy, u32 chan)
-{
-	/* TX descriptor base address list must be written into DMA CSR4 */
-	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_TX_BASE_ADDR);
-}
-
 static u32 dwmac1000_configure_fc(u32 csr6, int rxfifosz)
 {
 	csr6 &= ~DMA_CONTROL_RFA_MASK;
@@ -263,8 +247,8 @@ static void dwmac1000_rx_watchdog(void __iomem *ioaddr, u32 riwt,
 const struct stmmac_dma_ops dwmac1000_dma_ops = {
 	.reset = dwmac_dma_reset,
 	.init = dwmac1000_dma_init,
-	.init_rx_chan = dwmac1000_dma_init_rx,
-	.init_tx_chan = dwmac1000_dma_init_tx,
+	.init_rx_chan = dwmac_dma_init_rx,
+	.init_tx_chan = dwmac_dma_init_tx,
 	.axi = dwmac1000_dma_axi,
 	.dump_regs = dwmac1000_dump_dma_regs,
 	.dma_rx_mode = dwmac1000_dma_operation_mode_rx,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
index 8f0d9bc7cab5..ad51a7949a42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c
@@ -29,22 +29,6 @@ static void dwmac100_dma_init(void __iomem *ioaddr,
 	writel(DMA_INTR_DEFAULT_MASK, ioaddr + DMA_INTR_ENA);
 }
 
-static void dwmac100_dma_init_rx(void __iomem *ioaddr,
-				 struct stmmac_dma_cfg *dma_cfg,
-				 dma_addr_t dma_rx_phy, u32 chan)
-{
-	/* RX descriptor base addr lists must be written into DMA CSR3 */
-	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR);
-}
-
-static void dwmac100_dma_init_tx(void __iomem *ioaddr,
-				 struct stmmac_dma_cfg *dma_cfg,
-				 dma_addr_t dma_tx_phy, u32 chan)
-{
-	/* TX descriptor base addr lists must be written into DMA CSR4 */
-	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_TX_BASE_ADDR);
-}
-
 /* Store and Forward capability is not used at all.
  *
  * The transmit threshold can be programmed by setting the TTC bits in the DMA
@@ -111,8 +95,8 @@ static void dwmac100_dma_diagnostic_fr(void *data, struct stmmac_extra_stats *x,
 const struct stmmac_dma_ops dwmac100_dma_ops = {
 	.reset = dwmac_dma_reset,
 	.init = dwmac100_dma_init,
-	.init_rx_chan = dwmac100_dma_init_rx,
-	.init_tx_chan = dwmac100_dma_init_tx,
+	.init_rx_chan = dwmac_dma_init_rx,
+	.init_tx_chan = dwmac_dma_init_tx,
 	.dump_regs = dwmac100_dump_dma_regs,
 	.dma_tx_mode = dwmac100_dma_operation_mode_tx,
 	.dma_diagnostic_fr = dwmac100_dma_diagnostic_fr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index e5dbd0bc257e..fa919bf75e19 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -134,8 +134,12 @@
 void dwmac_enable_dma_transmission(void __iomem *ioaddr);
 void dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
 void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
+void dwmac_dma_init_tx(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg,
+		       dma_addr_t dma_tx_phy, u32 chan);
 void dwmac_dma_start_tx(void __iomem *ioaddr, u32 chan);
 void dwmac_dma_stop_tx(void __iomem *ioaddr, u32 chan);
+void dwmac_dma_init_rx(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg,
+		       dma_addr_t dma_rx_phy, u32 chan);
 void dwmac_dma_start_rx(void __iomem *ioaddr, u32 chan);
 void dwmac_dma_stop_rx(void __iomem *ioaddr, u32 chan);
 int dwmac_dma_interrupt(void __iomem *ioaddr, struct stmmac_extra_stats *x,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 57a53a600aa5..6ddfc689e77b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -56,6 +56,13 @@ void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 	writel(value, ioaddr + DMA_INTR_ENA);
 }
 
+void dwmac_dma_init_tx(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg,
+		       dma_addr_t dma_tx_phy, u32 chan)
+{
+	/* TX descriptor base address list must be written into DMA CSR4 */
+	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_TX_BASE_ADDR);
+}
+
 void dwmac_dma_start_tx(void __iomem *ioaddr, u32 chan)
 {
 	u32 value = readl(ioaddr + DMA_CONTROL);
@@ -70,6 +77,13 @@ void dwmac_dma_stop_tx(void __iomem *ioaddr, u32 chan)
 	writel(value, ioaddr + DMA_CONTROL);
 }
 
+void dwmac_dma_init_rx(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg,
+		       dma_addr_t dma_rx_phy, u32 chan)
+{
+	/* RX descriptor base address list must be written into DMA CSR3 */
+	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_RCV_BASE_ADDR);
+}
+
 void dwmac_dma_start_rx(void __iomem *ioaddr, u32 chan)
 {
 	u32 value = readl(ioaddr + DMA_CONTROL);
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
