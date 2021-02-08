Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171A31347E
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Feb 2021 15:08:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BE87C57B59;
	Mon,  8 Feb 2021 14:08:28 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DBB7C57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Feb 2021 14:08:25 +0000 (UTC)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 8 Feb 2021 17:08:08 +0300
Message-ID: <20210208140820.10410-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
References: <20210208140820.10410-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/16] net: stmmac: Introduce DMA core cleanup
	method
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

Similarly to the MAC core cleanup method let's introduce the DMA core
cleanup method, since we need have a way to get the DMA registers back
to their initial state while the whole interface reset is unavailable for
the particular DW MAC IP-core setup, like in case of GPIs and GPOs
support.

For now we've created the DMA cleanup method for the DW GMAC IP only,
since the chip we've got has been equipped with that IP and we lack the
documents to add and test the rest of the IPs support.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h     |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c     | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  3 +++
 4 files changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 2a04d9d45160..bae63e1420f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -246,6 +246,7 @@ static void dwmac1000_rx_watchdog(void __iomem *ioaddr, u32 riwt,
 
 const struct stmmac_dma_ops dwmac1000_dma_ops = {
 	.reset = dwmac_dma_reset,
+	.clean = dwmac_dma_clean,
 	.init = dwmac1000_dma_init,
 	.init_rx_chan = dwmac_dma_init_rx,
 	.init_tx_chan = dwmac_dma_init_tx,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index fa919bf75e19..f6e759d039d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -145,5 +145,6 @@ void dwmac_dma_stop_rx(void __iomem *ioaddr, u32 chan);
 int dwmac_dma_interrupt(void __iomem *ioaddr, struct stmmac_extra_stats *x,
 			u32 chan);
 int dwmac_dma_reset(void __iomem *ioaddr);
+void dwmac_dma_clean(void __iomem *ioaddr);
 
 #endif /* __DWMAC_DMA_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 6ddfc689e77b..2186e95d5aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -26,6 +26,18 @@ int dwmac_dma_reset(void __iomem *ioaddr)
 				 10000, 200000);
 }
 
+void dwmac_dma_clean(void __iomem *ioaddr)
+{
+	/* Clean the basic DMA registers up */
+	writel(0, ioaddr + DMA_INTR_ENA);
+	writel(0x00020100, ioaddr + DMA_BUS_MODE);
+	writel(0, ioaddr + DMA_RCV_BASE_ADDR);
+	writel(0, ioaddr + DMA_TX_BASE_ADDR);
+	writel(0x00100000, ioaddr + DMA_CONTROL);
+	writel(0x00110001, ioaddr + DMA_AXI_BUS_MODE);
+	writel(0x0001FFFF, ioaddr + DMA_STATUS);
+}
+
 /* CSR1 enables the transmit DMA to check for new descriptor */
 void dwmac_enable_dma_transmission(void __iomem *ioaddr)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 3f5eed8333a5..dea5a4d17677 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -169,6 +169,7 @@ struct dma_features;
 struct stmmac_dma_ops {
 	/* DMA core initialization */
 	int (*reset)(void __iomem *ioaddr);
+	void (*clean)(void __iomem *ioaddr);
 	void (*init)(void __iomem *ioaddr, struct stmmac_dma_cfg *dma_cfg,
 		     int atds);
 	void (*init_chan)(void __iomem *ioaddr,
@@ -219,6 +220,8 @@ struct stmmac_dma_ops {
 
 #define stmmac_reset(__priv, __args...) \
 	stmmac_do_callback(__priv, dma, reset, __args)
+#define stmmac_dma_clean(__priv, __args...) \
+	stmmac_do_void_callback(__priv, dma, clean, __args)
 #define stmmac_dma_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, init, __args)
 #define stmmac_init_chan(__priv, __args...) \
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
