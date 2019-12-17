Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9A122C25
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2019 13:46:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9841CC36B25;
	Tue, 17 Dec 2019 12:46:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C84FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2019 12:46:22 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6ACE4C00DA;
 Tue, 17 Dec 2019 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576586780; bh=HuUY2G4nVW5hLrYfBiJSALRZ/+Sk6FEnzwe4HIfp7HY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=BJmiwsktzMbqZ6oAFDdc9Cy7xXrYjGVCUntZoJK5Xt0FW/nuPEEOMD6h5g9pFv5T3
 WhCyiwTMXX4VOlJL8maJ+B9t2cr82gJRjYpLMjKz92NPyDUEUCgvPerZE6/wJ/ywdb
 1UEeyy+zsLAOik0FJk8hMrAcS3pIgLQzcxcIwmIOkawc98aSCNs2+3al7Pa+AQXecs
 1VS6+bVG+KdPpGuIdjWh1M/p0QQKXdUgfgLbVax0A9yDb21sGzsgU2vbDx747VI37Y
 20Wo4gfKrd1Ekko1A8PvK/alSs5volTEoNjmtfXdtx/b/ZuKqg6mvUX/I7iyTD7D/y
 uoMqZ+aPS41QQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id C9DAEA008D;
 Tue, 17 Dec 2019 12:46:17 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 17 Dec 2019 13:46:07 +0100
Message-Id: <05fcacecee15320535de1f80660dcca4c184db44.1576586602.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576586602.git.Jose.Abreu@synopsys.com>
References: <cover.1576586602.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1576586602.git.Jose.Abreu@synopsys.com>
References: <cover.1576586602.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/7] net: stmmac: Let TX and RX
	interrupts be independently enabled/disabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

By using this mechanism we can get rid of the not so nice method of
scheduling TX NAPI when the RX was scheduled. No bandwidth reduction was
seen with this change.

Changes from v1:
- Remove useless comment (Jakub)
- Do not bind the TX clean to NAPI budget (Jakub)

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 24 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   | 11 +++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 47 ++++++++++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |  6 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    | 22 +++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 24 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  6 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 55 +++++++++++++---------
 10 files changed, 149 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 1c8d84ed8410..6f834302fda3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -335,14 +335,30 @@ static void sun8i_dwmac_dump_mac_regs(struct mac_device_info *hw,
 	}
 }
 
-static void sun8i_dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan)
+static void sun8i_dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan,
+				       bool rx, bool tx)
 {
-	writel(EMAC_RX_INT | EMAC_TX_INT, ioaddr + EMAC_INT_EN);
+	u32 value = readl(ioaddr + EMAC_INT_EN);
+
+	if (rx)
+		value |= EMAC_RX_INT;
+	if (tx)
+		value |= EMAC_TX_INT;
+
+	writel(value, ioaddr + EMAC_INT_EN);
 }
 
-static void sun8i_dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan)
+static void sun8i_dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan,
+					bool rx, bool tx)
 {
-	writel(0, ioaddr + EMAC_INT_EN);
+	u32 value = readl(ioaddr + EMAC_INT_EN);
+
+	if (rx)
+		value &= ~EMAC_RX_INT;
+	if (tx)
+		value &= ~EMAC_TX_INT;
+
+	writel(value, ioaddr + EMAC_INT_EN);
 }
 
 static void sun8i_dwmac_dma_start_tx(void __iomem *ioaddr, u32 chan)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 589931795847..bcb6d5190f3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -168,6 +168,8 @@
 /* DMA default interrupt mask for 4.00 */
 #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
 					 DMA_CHAN_INTR_ABNORMAL)
+#define DMA_CHAN_INTR_DEFAULT_RX	(DMA_CHAN_INTR_ENA_RIE)
+#define DMA_CHAN_INTR_DEFAULT_TX	(DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_NORMAL_4_10	(DMA_CHAN_INTR_ENA_NIE_4_10 | \
 					 DMA_CHAN_INTR_ENA_RIE | \
@@ -178,6 +180,8 @@
 /* DMA default interrupt mask for 4.10a */
 #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \
 					 DMA_CHAN_INTR_ABNORMAL_4_10)
+#define DMA_CHAN_INTR_DEFAULT_RX_4_10	(DMA_CHAN_INTR_ENA_RIE)
+#define DMA_CHAN_INTR_DEFAULT_TX_4_10	(DMA_CHAN_INTR_ENA_TIE)
 
 /* channel 0 specific fields */
 #define DMA_CHAN0_DBG_STAT_TPS		GENMASK(15, 12)
@@ -186,9 +190,10 @@
 #define DMA_CHAN0_DBG_STAT_RPS_SHIFT	8
 
 int dwmac4_dma_reset(void __iomem *ioaddr);
-void dwmac4_enable_dma_irq(void __iomem *ioaddr, u32 chan);
-void dwmac410_enable_dma_irq(void __iomem *ioaddr, u32 chan);
-void dwmac4_disable_dma_irq(void __iomem *ioaddr, u32 chan);
+void dwmac4_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
+void dwmac410_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
+void dwmac4_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
+void dwmac410_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
 void dwmac4_dma_start_tx(void __iomem *ioaddr, u32 chan);
 void dwmac4_dma_stop_tx(void __iomem *ioaddr, u32 chan);
 void dwmac4_dma_start_rx(void __iomem *ioaddr, u32 chan);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index f2a29a90e085..9becca280074 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -97,21 +97,52 @@ void dwmac4_set_rx_ring_len(void __iomem *ioaddr, u32 len, u32 chan)
 	writel(len, ioaddr + DMA_CHAN_RX_RING_LEN(chan));
 }
 
-void dwmac4_enable_dma_irq(void __iomem *ioaddr, u32 chan)
+void dwmac4_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 {
-	writel(DMA_CHAN_INTR_DEFAULT_MASK, ioaddr +
-	       DMA_CHAN_INTR_ENA(chan));
+	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
+
+	if (rx)
+		value |= DMA_CHAN_INTR_DEFAULT_RX;
+	if (tx)
+		value |= DMA_CHAN_INTR_DEFAULT_TX;
+
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
 
-void dwmac410_enable_dma_irq(void __iomem *ioaddr, u32 chan)
+void dwmac410_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 {
-	writel(DMA_CHAN_INTR_DEFAULT_MASK_4_10,
-	       ioaddr + DMA_CHAN_INTR_ENA(chan));
+	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
+
+	if (rx)
+		value |= DMA_CHAN_INTR_DEFAULT_RX_4_10;
+	if (tx)
+		value |= DMA_CHAN_INTR_DEFAULT_TX_4_10;
+
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
 
-void dwmac4_disable_dma_irq(void __iomem *ioaddr, u32 chan)
+void dwmac4_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 {
-	writel(0, ioaddr + DMA_CHAN_INTR_ENA(chan));
+	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
+
+	if (rx)
+		value &= ~DMA_CHAN_INTR_DEFAULT_RX;
+	if (tx)
+		value &= ~DMA_CHAN_INTR_DEFAULT_TX;
+
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
+}
+
+void dwmac410_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
+{
+	u32 value = readl(ioaddr + DMA_CHAN_INTR_ENA(chan));
+
+	if (rx)
+		value &= ~DMA_CHAN_INTR_DEFAULT_RX_4_10;
+	if (tx)
+		value &= ~DMA_CHAN_INTR_DEFAULT_TX_4_10;
+
+	writel(value, ioaddr + DMA_CHAN_INTR_ENA(chan));
 }
 
 int dwmac4_dma_interrupt(void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index 292b880f3f9f..e5dbd0bc257e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -96,6 +96,8 @@
 
 /* DMA default interrupt mask */
 #define DMA_INTR_DEFAULT_MASK	(DMA_INTR_NORMAL | DMA_INTR_ABNORMAL)
+#define DMA_INTR_DEFAULT_RX	(DMA_INTR_ENA_RIE)
+#define DMA_INTR_DEFAULT_TX	(DMA_INTR_ENA_TIE)
 
 /* DMA Status register defines */
 #define DMA_STATUS_GLPII	0x40000000	/* GMAC LPI interrupt */
@@ -130,8 +132,8 @@
 #define NUM_DWMAC1000_DMA_REGS	23
 
 void dwmac_enable_dma_transmission(void __iomem *ioaddr);
-void dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan);
-void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan);
+void dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
+void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx);
 void dwmac_dma_start_tx(void __iomem *ioaddr, u32 chan);
 void dwmac_dma_stop_tx(void __iomem *ioaddr, u32 chan);
 void dwmac_dma_start_rx(void __iomem *ioaddr, u32 chan);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index 1bc25aa86dbd..688d36095333 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -37,14 +37,28 @@ void dwmac_enable_dma_transmission(void __iomem *ioaddr)
 	writel(1, ioaddr + DMA_XMT_POLL_DEMAND);
 }
 
-void dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan)
+void dwmac_enable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 {
-	writel(DMA_INTR_DEFAULT_MASK, ioaddr + DMA_INTR_ENA);
+	u32 value = readl(ioaddr + DMA_INTR_ENA);
+
+	if (rx)
+		value |= DMA_INTR_DEFAULT_RX;
+	if (tx)
+		value |= DMA_INTR_DEFAULT_TX;
+
+	writel(value, ioaddr + DMA_INTR_ENA);
 }
 
-void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan)
+void dwmac_disable_dma_irq(void __iomem *ioaddr, u32 chan, bool rx, bool tx)
 {
-	writel(0, ioaddr + DMA_INTR_ENA);
+	u32 value = readl(ioaddr + DMA_INTR_ENA);
+
+	if (rx)
+		value &= ~DMA_INTR_DEFAULT_RX;
+	if (tx)
+		value &= ~DMA_INTR_DEFAULT_TX;
+
+	writel(value, ioaddr + DMA_INTR_ENA);
 }
 
 void dwmac_dma_start_tx(void __iomem *ioaddr, u32 chan)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 3b6e559aa0b9..158cf4ad1596 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -361,6 +361,8 @@
 #define XGMAC_TIE			BIT(0)
 #define XGMAC_DMA_INT_DEFAULT_EN	(XGMAC_NIE | XGMAC_AIE | XGMAC_RBUE | \
 					XGMAC_RIE | XGMAC_TIE)
+#define XGMAC_DMA_INT_DEFAULT_RX	(XGMAC_RBUE | XGMAC_RIE)
+#define XGMAC_DMA_INT_DEFAULT_TX	(XGMAC_TIE)
 #define XGMAC_DMA_CH_Rx_WATCHDOG(x)	(0x0000313c + (0x80 * (x)))
 #define XGMAC_RWT			GENMASK(7, 0)
 #define XGMAC_DMA_CH_STATUS(x)		(0x00003160 + (0x80 * (x)))
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 22a7f0cc1b90..ae066f4e99a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -248,14 +248,30 @@ static void dwxgmac2_dma_tx_mode(void __iomem *ioaddr, int mode,
 	writel(value, ioaddr +  XGMAC_MTL_TXQ_OPMODE(channel));
 }
 
-static void dwxgmac2_enable_dma_irq(void __iomem *ioaddr, u32 chan)
+static void dwxgmac2_enable_dma_irq(void __iomem *ioaddr, u32 chan,
+				    bool rx, bool tx)
 {
-	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
+	u32 value = readl(ioaddr + XGMAC_DMA_CH_INT_EN(chan));
+
+	if (rx)
+		value |= XGMAC_DMA_INT_DEFAULT_RX;
+	if (tx)
+		value |= XGMAC_DMA_INT_DEFAULT_TX;
+
+	writel(value, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
-static void dwxgmac2_disable_dma_irq(void __iomem *ioaddr, u32 chan)
+static void dwxgmac2_disable_dma_irq(void __iomem *ioaddr, u32 chan,
+				     bool rx, bool tx)
 {
-	writel(0, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
+	u32 value = readl(ioaddr + XGMAC_DMA_CH_INT_EN(chan));
+
+	if (rx)
+		value &= ~XGMAC_DMA_INT_DEFAULT_RX;
+	if (tx)
+		value &= ~XGMAC_DMA_INT_DEFAULT_TX;
+
+	writel(value, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
 static void dwxgmac2_dma_start_tx(void __iomem *ioaddr, u32 chan)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index aa5b917398fe..098fbe7a5862 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -187,8 +187,10 @@ struct stmmac_dma_ops {
 	void (*dma_diagnostic_fr) (void *data, struct stmmac_extra_stats *x,
 				   void __iomem *ioaddr);
 	void (*enable_dma_transmission) (void __iomem *ioaddr);
-	void (*enable_dma_irq)(void __iomem *ioaddr, u32 chan);
-	void (*disable_dma_irq)(void __iomem *ioaddr, u32 chan);
+	void (*enable_dma_irq)(void __iomem *ioaddr, u32 chan,
+			       bool rx, bool tx);
+	void (*disable_dma_irq)(void __iomem *ioaddr, u32 chan,
+				bool rx, bool tx);
 	void (*start_tx)(void __iomem *ioaddr, u32 chan);
 	void (*stop_tx)(void __iomem *ioaddr, u32 chan);
 	void (*start_rx)(void __iomem *ioaddr, u32 chan);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d993fc7e82c3..f98c5eefb382 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -88,6 +88,7 @@ struct stmmac_channel {
 	struct napi_struct rx_napi ____cacheline_aligned_in_smp;
 	struct napi_struct tx_napi ____cacheline_aligned_in_smp;
 	struct stmmac_priv *priv_data;
+	spinlock_t lock;
 	u32 index;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 311647cdd672..80575243820b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2069,17 +2069,25 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan)
 	int status = stmmac_dma_interrupt_status(priv, priv->ioaddr,
 						 &priv->xstats, chan);
 	struct stmmac_channel *ch = &priv->channel[chan];
+	unsigned long flags;
 
 	if ((status & handle_rx) && (chan < priv->plat->rx_queues_to_use)) {
 		if (napi_schedule_prep(&ch->rx_napi)) {
-			stmmac_disable_dma_irq(priv, priv->ioaddr, chan);
+			spin_lock_irqsave(&ch->lock, flags);
+			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
+			spin_unlock_irqrestore(&ch->lock, flags);
 			__napi_schedule_irqoff(&ch->rx_napi);
-			status |= handle_tx;
 		}
 	}
 
-	if ((status & handle_tx) && (chan < priv->plat->tx_queues_to_use))
-		napi_schedule_irqoff(&ch->tx_napi);
+	if ((status & handle_tx) && (chan < priv->plat->tx_queues_to_use)) {
+		if (napi_schedule_prep(&ch->tx_napi)) {
+			spin_lock_irqsave(&ch->lock, flags);
+			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
+			spin_unlock_irqrestore(&ch->lock, flags);
+			__napi_schedule_irqoff(&ch->tx_napi);
+		}
+	}
 
 	return status;
 }
@@ -2274,14 +2282,14 @@ static void stmmac_tx_timer(struct timer_list *t)
 
 	ch = &priv->channel[tx_q->queue_index];
 
-	/*
-	 * If NAPI is already running we can miss some events. Let's rearm
-	 * the timer and try again.
-	 */
-	if (likely(napi_schedule_prep(&ch->tx_napi)))
+	if (likely(napi_schedule_prep(&ch->tx_napi))) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_disable_dma_irq(priv, priv->ioaddr, ch->index, 0, 1);
+		spin_unlock_irqrestore(&ch->lock, flags);
 		__napi_schedule(&ch->tx_napi);
-	else
-		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(10));
+	}
 }
 
 /**
@@ -3749,8 +3757,14 @@ static int stmmac_napi_poll_rx(struct napi_struct *napi, int budget)
 	priv->xstats.napi_poll++;
 
 	work_done = stmmac_rx(priv, budget, chan);
-	if (work_done < budget && napi_complete_done(napi, work_done))
-		stmmac_enable_dma_irq(priv, priv->ioaddr, chan);
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
+		spin_unlock_irqrestore(&ch->lock, flags);
+	}
+
 	return work_done;
 }
 
@@ -3759,7 +3773,6 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 	struct stmmac_channel *ch =
 		container_of(napi, struct stmmac_channel, tx_napi);
 	struct stmmac_priv *priv = ch->priv_data;
-	struct stmmac_tx_queue *tx_q;
 	u32 chan = ch->index;
 	int work_done;
 
@@ -3768,15 +3781,12 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
 	work_done = stmmac_tx_clean(priv, DMA_TX_SIZE, chan);
 	work_done = min(work_done, budget);
 
-	if (work_done < budget)
-		napi_complete_done(napi, work_done);
+	if (work_done < budget && napi_complete_done(napi, work_done)) {
+		unsigned long flags;
 
-	/* Force transmission restart */
-	tx_q = &priv->tx_queue[chan];
-	if (tx_q->cur_tx != tx_q->dirty_tx) {
-		stmmac_enable_dma_transmission(priv, priv->ioaddr);
-		stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr,
-				       chan);
+		spin_lock_irqsave(&ch->lock, flags);
+		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
+		spin_unlock_irqrestore(&ch->lock, flags);
 	}
 
 	return work_done;
@@ -4712,6 +4722,7 @@ int stmmac_dvr_probe(struct device *device,
 	for (queue = 0; queue < maxq; queue++) {
 		struct stmmac_channel *ch = &priv->channel[queue];
 
+		spin_lock_init(&ch->lock);
 		ch->priv_data = priv;
 		ch->index = queue;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
