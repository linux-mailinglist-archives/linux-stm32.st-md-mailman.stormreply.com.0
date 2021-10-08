Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025842681B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:42:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2C9FC5C822;
	Fri,  8 Oct 2021 10:42:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FEC4C597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:35:11 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 9353E240006;
 Fri,  8 Oct 2021 10:35:09 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: 
Date: Fri,  8 Oct 2021 12:34:37 +0200
Message-Id: <20211008103440.3929006-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008103440.3929006-1-herve.codina@bootlin.com>
References: <20211008103440.3929006-1-herve.codina@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Oct 2021 10:42:35 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Herve Codina <herve.codina@bootlin.com>,
 devicetree@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] net: stmmac: fix get_hw_feature() on old
	hardware
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

Some old IPs do not provide the hardware feature register.
On these IPs, this register is read 0x00000000.

In old driver version, this feature was handled but a regression came
with the commit f10a6a3541b4 ("stmmac: rework get_hw_feature function").
Indeed, this commit removes the return value in dma->get_hw_feature().
This return value was used to indicate the validity of retrieved
information and used later on in stmmac_hw_init() to override
priv->plat data if this hardware feature were valid.

This patch restores the return code in ->get_hw_feature() in order
to indicate the hardware feature validity and override priv->plat
data only if this hardware feature is valid.

Fixes: f10a6a3541b4 ("stmmac: rework get_hw_feature function")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 13 +++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c    |  6 ++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  6 ++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  6 +++---
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
index 90383abafa66..f5581db0ba9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
@@ -218,11 +218,18 @@ static void dwmac1000_dump_dma_regs(void __iomem *ioaddr, u32 *reg_space)
 				readl(ioaddr + DMA_BUS_MODE + i * 4);
 }
 
-static void dwmac1000_get_hw_feature(void __iomem *ioaddr,
-				     struct dma_features *dma_cap)
+static int dwmac1000_get_hw_feature(void __iomem *ioaddr,
+				    struct dma_features *dma_cap)
 {
 	u32 hw_cap = readl(ioaddr + DMA_HW_FEATURE);
 
+	if (!hw_cap) {
+		/* 0x00000000 is the value read on old hardware that does not
+		 * implement this register
+		 */
+		return -EOPNOTSUPP;
+	}
+
 	dma_cap->mbps_10_100 = (hw_cap & DMA_HW_FEAT_MIISEL);
 	dma_cap->mbps_1000 = (hw_cap & DMA_HW_FEAT_GMIISEL) >> 1;
 	dma_cap->half_duplex = (hw_cap & DMA_HW_FEAT_HDSEL) >> 2;
@@ -252,6 +259,8 @@ static void dwmac1000_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->number_tx_channel = (hw_cap & DMA_HW_FEAT_TXCHCNT) >> 22;
 	/* Alternate (enhanced) DESC mode */
 	dma_cap->enh_desc = (hw_cap & DMA_HW_FEAT_ENHDESSEL) >> 24;
+
+	return 0;
 }
 
 static void dwmac1000_rx_watchdog(void __iomem *ioaddr, u32 riwt,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 5be8e6a631d9..d99fa028c646 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -347,8 +347,8 @@ static void dwmac4_dma_tx_chan_op_mode(void __iomem *ioaddr, int mode,
 	writel(mtl_tx_op, ioaddr +  MTL_CHAN_TX_OP_MODE(channel));
 }
 
-static void dwmac4_get_hw_feature(void __iomem *ioaddr,
-				  struct dma_features *dma_cap)
+static int dwmac4_get_hw_feature(void __iomem *ioaddr,
+				 struct dma_features *dma_cap)
 {
 	u32 hw_cap = readl(ioaddr + GMAC_HW_FEATURE0);
 
@@ -437,6 +437,8 @@ static void dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->frpbs = (hw_cap & GMAC_HW_FEAT_FRPBS) >> 11;
 	dma_cap->frpsel = (hw_cap & GMAC_HW_FEAT_FRPSEL) >> 10;
 	dma_cap->dvlan = (hw_cap & GMAC_HW_FEAT_DVLAN) >> 5;
+
+	return 0;
 }
 
 /* Enable/disable TSO feature and set MSS */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 906e985441a9..5e98355f422b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -371,8 +371,8 @@ static int dwxgmac2_dma_interrupt(void __iomem *ioaddr,
 	return ret;
 }
 
-static void dwxgmac2_get_hw_feature(void __iomem *ioaddr,
-				    struct dma_features *dma_cap)
+static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
+				   struct dma_features *dma_cap)
 {
 	u32 hw_cap;
 
@@ -445,6 +445,8 @@ static void dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->frpes = (hw_cap & XGMAC_HWFEAT_FRPES) >> 11;
 	dma_cap->frpbs = (hw_cap & XGMAC_HWFEAT_FRPPB) >> 9;
 	dma_cap->frpsel = (hw_cap & XGMAC_HWFEAT_FRPSEL) >> 3;
+
+	return 0;
 }
 
 static void dwxgmac2_rx_watchdog(void __iomem *ioaddr, u32 riwt, u32 queue)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 6dc1c98ebec8..fe2660d5694d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -203,8 +203,8 @@ struct stmmac_dma_ops {
 	int (*dma_interrupt) (void __iomem *ioaddr,
 			      struct stmmac_extra_stats *x, u32 chan, u32 dir);
 	/* If supported then get the optional core features */
-	void (*get_hw_feature)(void __iomem *ioaddr,
-			       struct dma_features *dma_cap);
+	int (*get_hw_feature)(void __iomem *ioaddr,
+			      struct dma_features *dma_cap);
 	/* Program the HW RX Watchdog */
 	void (*rx_watchdog)(void __iomem *ioaddr, u32 riwt, u32 queue);
 	void (*set_tx_ring_len)(void __iomem *ioaddr, u32 len, u32 chan);
@@ -255,7 +255,7 @@ struct stmmac_dma_ops {
 #define stmmac_dma_interrupt_status(__priv, __args...) \
 	stmmac_do_callback(__priv, dma, dma_interrupt, __args)
 #define stmmac_get_hw_feature(__priv, __args...) \
-	stmmac_do_void_callback(__priv, dma, get_hw_feature, __args)
+	stmmac_do_callback(__priv, dma, get_hw_feature, __args)
 #define stmmac_rx_watchdog(__priv, __args...) \
 	stmmac_do_void_callback(__priv, dma, rx_watchdog, __args)
 #define stmmac_set_tx_ring_len(__priv, __args...) \
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
