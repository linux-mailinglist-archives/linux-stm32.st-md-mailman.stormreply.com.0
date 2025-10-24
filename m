Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB219C06167
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 13:50:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B1ABC5F1CC;
	Fri, 24 Oct 2025 11:50:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18E51C5F1D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 11:50:18 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.trumtrar.info)
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1vCGJ4-0002FG-RS; Fri, 24 Oct 2025 13:50:06 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 24 Oct 2025 13:49:54 +0200
MIME-Version: 1.0
Message-Id: <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Teoh Ji Sheng <ji.sheng.teoh@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 02/10] net: stmmac: Use interrupt mode
 INTM=1 for per channel irq
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

From: Teoh Ji Sheng <ji.sheng.teoh@intel.com>

commit 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=1
for multi-MSI") is introduced for platform that uses MSI.

Similar approach is taken to enable per channel interrupt
that uses shared peripheral interrupt (SPI), so only per channel
TX and RX intr (TI/RI) are handled by TX/RX ISR without calling
common interrupt ISR.

TX/RX NORMAL interrupts check is now decoupled, since NIS bit
is not asserted for any TI/RI events when INTM=1.

Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 +++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 20 ++++++++++++++++++++
 include/linux/stmmac.h                               |  2 ++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0d408ee17f337..64b533207e4a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -326,6 +326,9 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define DMA_MODE_INTM_MASK		GENMASK(13, 12)
+#define DMA_MODE_INTM_SHIFT		12
+#define DMA_MODE_INTM_MODE1		0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_WR_OSR_LMT_SHIFT		24
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 4d6bb995d8d84..1e9ee1f10f0ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	if (dma_cfg->multi_irq_en) {
+		value = readl(ioaddr + XGMAC_DMA_MODE);
+		value &= ~DMA_MODE_INTM_MASK;
+		value |= (DMA_MODE_INTM_MODE1 << DMA_MODE_INTM_SHIFT);
+		writel(value, ioaddr + XGMAC_DMA_MODE);
+	}
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
@@ -359,13 +366,14 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		}
 	}
 
-	/* TX/RX NORMAL interrupts */
+	/* RX NORMAL interrupts */
 	if (likely(intr_status & XGMAC_RI)) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->rx_normal_irq_n[chan]);
 		u64_stats_update_end(&stats->syncp);
 		ret |= handle_rx;
 	}
+	/* TX NORMAL interrupts */
 	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->tx_normal_irq_n[chan]);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 27bcaae07a7f2..cfa82b8e04b94 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -607,6 +607,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	dma_cfg->fixed_burst = of_property_read_bool(np, "snps,fixed-burst");
 	dma_cfg->mixed_burst = of_property_read_bool(np, "snps,mixed-burst");
 
+	dma_cfg->multi_irq_en = of_property_read_bool(np, "snps,multi-irq-en");
+
 	plat->force_thresh_dma_mode = of_property_read_bool(np, "snps,force_thresh_dma_mode");
 	if (plat->force_thresh_dma_mode && plat->force_sf_dma_mode) {
 		plat->force_sf_dma_mode = 0;
@@ -737,6 +739,8 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char irq_name[11];
+	int i;
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -746,6 +750,22 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	if (stmmac_res->irq < 0)
 		return stmmac_res->irq;
 
+	/* For RX Channel */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		sprintf(irq_name, "%s%d", "macirq_rx", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname(pdev, irq_name);
+		if (stmmac_res->rx_irq[i] < 0)
+			break;
+	}
+
+	/* For TX Channel */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		sprintf(irq_name, "%s%d", "macirq_tx", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname(pdev, irq_name);
+			if (stmmac_res->tx_irq[i] < 0)
+				break;
+	}
+
 	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
 	 * The external wake up irq can be passed through the platform code
 	 * named as "eth_wake_irq"
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index fa1318bac06c4..a8b15b4e3c370 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -102,6 +102,7 @@ struct stmmac_dma_cfg {
 	bool aal;
 	bool eame;
 	bool multi_msi_en;
+	bool multi_irq_en;
 	bool dche;
 	bool atds;
 };
@@ -290,6 +291,7 @@ struct plat_stmmacenet_data {
 	u8 vlan_fail_q;
 	struct pci_dev *pdev;
 	int int_snapshot_num;
+	bool multi_irq_en;
 	int msi_mac_vec;
 	int msi_wol_vec;
 	int msi_lpi_vec;

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
