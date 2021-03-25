Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A774E349860
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Mar 2021 18:39:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F6BEC57B78;
	Thu, 25 Mar 2021 17:39:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C1EFC57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 17:39:39 +0000 (UTC)
IronPort-SDR: MYUMrAxzNYaiPbaJ2l3U+PcWt8ncRoT/ZYH0uDLb1FjewI/szWR4/7lJmPA452XphxydVninxd
 l13t0i+1czSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="187681998"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="187681998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:39:38 -0700
IronPort-SDR: 0hFyAKLCiHgyi8/DV1Uk0KEAkAJD9gjMGBKTu+UtdBaplzzPCSNdfMHnwOtreDvKYvq2u4NZSY
 l62/m9uzksgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="416112357"
Received: from climb.png.intel.com ([10.221.118.165])
 by orsmga008.jf.intel.com with ESMTP; 25 Mar 2021 10:39:35 -0700
From: Voon Weifeng <weifeng.voon@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 26 Mar 2021 01:39:16 +0800
Message-Id: <20210325173916.13203-6-weifeng.voon@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325173916.13203-1-weifeng.voon@intel.com>
References: <20210325173916.13203-1-weifeng.voon@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Weifeng <weifeng.voon@intel.com>, Wong Vee Khee <vee.khee.wong@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 5/5] net: stmmac: use interrupt
	mode INTM=1 for multi-MSI
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

From: "Wong, Vee Khee" <vee.khee.wong@intel.com>

For interrupt mode INTM=0, TX/RX transfer complete will trigger signal
not only on sbd_perch_[tx|rx]_intr_o (Transmit/Receive Per Channel) but
also on the sbd_intr_o (Common).

As for multi-MSI implementation, setting interrupt mode INTM=1 is more
efficient as each TX intr and RX intr (TI/RI) will be handled by TX/RX ISR
without the need of calling the common MAC ISR.

Updated the TX/RX NORMAL interrupts status checking process as the
NIS status bit is not asserted for any RI/TI events for INTM=1.

Signed-off-by: Wong, Vee Khee <vee.khee.wong@intel.com>
Co-developed-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
---
Changes:
v1 -> v2
 -Moved the readl and writel into the if statement as it is only executed
  when multi msi is enabled
---
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  7 ++++++
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  3 +++
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 23 +++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  1 +
 include/linux/stmmac.h                        |  1 +
 5 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 8954b85eb850..cb17f6c35e54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -161,6 +161,13 @@ static void dwmac4_dma_init(void __iomem *ioaddr,
 		value |= DMA_SYS_BUS_EAME;
 
 	writel(value, ioaddr + DMA_SYS_BUS_MODE);
+
+	if (dma_cfg->multi_msi_en) {
+		value = readl(ioaddr + DMA_BUS_MODE);
+		value &= ~DMA_BUS_MODE_INTM_MASK;
+		value |= (DMA_BUS_MODE_INTM_MODE1 << DMA_BUS_MODE_INTM_SHIFT);
+		writel(value, ioaddr + DMA_BUS_MODE);
+	}
 }
 
 static void _dwmac4_dump_dma_regs(void __iomem *ioaddr, u32 channel,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 5c0c53832adb..05481eb13ba6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -25,6 +25,9 @@
 #define DMA_TBS_CTRL			0x00001050
 
 /* DMA Bus Mode bitmap */
+#define DMA_BUS_MODE_INTM_MASK		GENMASK(17, 16)
+#define DMA_BUS_MODE_INTM_SHIFT		16
+#define DMA_BUS_MODE_INTM_MODE1		0x1
 #define DMA_BUS_MODE_SFT_RESET		BIT(0)
 
 /* DMA SYS Bus Mode bitmap */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 3fa602dabf49..e63270267578 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -166,20 +166,19 @@ int dwmac4_dma_interrupt(void __iomem *ioaddr,
 		}
 	}
 	/* TX/RX NORMAL interrupts */
-	if (likely(intr_status & DMA_CHAN_STATUS_NIS)) {
+	if (likely(intr_status & DMA_CHAN_STATUS_NIS))
 		x->normal_irq_n++;
-		if (likely(intr_status & DMA_CHAN_STATUS_RI)) {
-			x->rx_normal_irq_n++;
-			ret |= handle_rx;
-		}
-		if (likely(intr_status & (DMA_CHAN_STATUS_TI |
-					  DMA_CHAN_STATUS_TBU))) {
-			x->tx_normal_irq_n++;
-			ret |= handle_tx;
-		}
-		if (unlikely(intr_status & DMA_CHAN_STATUS_ERI))
-			x->rx_early_irq++;
+	if (likely(intr_status & DMA_CHAN_STATUS_RI)) {
+		x->rx_normal_irq_n++;
+		ret |= handle_rx;
+	}
+	if (likely(intr_status & (DMA_CHAN_STATUS_TI |
+		DMA_CHAN_STATUS_TBU))) {
+		x->tx_normal_irq_n++;
+		ret |= handle_tx;
 	}
+	if (unlikely(intr_status & DMA_CHAN_STATUS_ERI))
+		x->rx_early_irq++;
 
 	writel(intr_status & intr_en, ioaddr + DMA_CHAN_STATUS(chan));
 	return ret;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 459477db455c..f4fa5402cd64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5620,6 +5620,7 @@ int stmmac_dvr_probe(struct device *device,
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
+	priv->plat->dma_cfg->multi_msi_en = priv->plat->multi_msi_en;
 
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index afc12b9385db..e338ef7abc00 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -96,6 +96,7 @@ struct stmmac_dma_cfg {
 	int mixed_burst;
 	bool aal;
 	bool eame;
+	bool multi_msi_en;
 };
 
 #define AXI_BLEN	7
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
