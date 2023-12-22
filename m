Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C2822AB3
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 10:57:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34E56C6DD81;
	Wed,  3 Jan 2024 09:57:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B902C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703223987; x=1734759987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKRp9iRvAm9GuBLgpwNJYxVqDu1ubCTAkbYv82hvvk0=;
 b=X8lZuKcYrCHMej5cS0oZorQ+KE55v2iPyn3nIJ/EdFxcXmp1bS8c0AN3
 vOdVOUZaExt381Q4EljCMlHtruHtgavmRuJrHF6VS9eYrOIrPp7WWZTeX
 aGYqV/TeZigdErxcqEtam0p9NVTRWP7fNV6lMDd2daNFDp+D1XSLNOKJt
 h7cDXiEho6/uyp6c4LbsR1TU72h4Kay68Y04Fpb9zvVVMPBKtbvEzvp5x
 hx1d4apr2yXYfJqM129VDBIWu3ZdJ+brMzh/kWx4usMFaWnanqYvMULdw
 SJcNNFPyWG2NkUUZcBxgKhpLL31i9T0sJnex/66siUYAN7E4z2vXH9bYe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9470608"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9470608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 21:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900324247"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="900324247"
Received: from pg-esw-build.png.intel.com ([10.226.214.57])
 by orsmga004.jf.intel.com with ESMTP; 21 Dec 2023 21:46:21 -0800
From: Leong Ching Swee <leong.ching.swee@intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Dec 2023 13:44:51 +0800
Message-Id: <20231222054451.2683242-5-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222054451.2683242-1-leong.ching.swee@intel.com>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:57:54 +0000
Cc: devicetree@vger.kernel.org, Teoh Ji Sheng <ji.sheng.teoh@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 4/4] net: stmmac: Use interrupt
	mode INTM=1 for per channel irq
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

From: Swee Leong Ching <leong.ching.swee@intel.com>

Enable per DMA channel interrupt that uses shared peripheral
interrupt (SPI), so only per channel TX and RX intr (TI/RI)
are handled by TX/RX ISR without calling common interrupt ISR.

Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 32 +++++++++++--------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 207ff1799f2c..04bf731cb7ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -346,6 +346,9 @@
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
 #define XGMAC_SWR			BIT(0)
+#define XGMAC_DMA_MODE_INTM_MASK	GENMASK(13, 12)
+#define XGMAC_DMA_MODE_INTM_SHIFT	12
+#define XGMAC_DMA_MODE_INTM_MODE1	0x1
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
 #define XGMAC_WR_OSR_LMT_SHIFT		24
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 3cde695fec91..dcb9f094415d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	if (dma_cfg->multi_irq_en) {
+		value = readl(ioaddr + XGMAC_DMA_MODE);
+		value &= ~XGMAC_DMA_MODE_INTM_MASK;
+		value |= (XGMAC_DMA_MODE_INTM_MODE1 << XGMAC_DMA_MODE_INTM_SHIFT);
+		writel(value, ioaddr + XGMAC_DMA_MODE);
+	}
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
@@ -365,19 +372,18 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 	}
 
 	/* TX/RX NORMAL interrupts */
-	if (likely(intr_status & XGMAC_NIS)) {
-		if (likely(intr_status & XGMAC_RI)) {
-			u64_stats_update_begin(&rxq_stats->syncp);
-			rxq_stats->rx_normal_irq_n++;
-			u64_stats_update_end(&rxq_stats->syncp);
-			ret |= handle_rx;
-		}
-		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
-			u64_stats_update_begin(&txq_stats->syncp);
-			txq_stats->tx_normal_irq_n++;
-			u64_stats_update_end(&txq_stats->syncp);
-			ret |= handle_tx;
-		}
+	if (likely(intr_status & XGMAC_RI)) {
+		u64_stats_update_begin(&rxq_stats->syncp);
+		rxq_stats->rx_normal_irq_n++;
+		u64_stats_update_end(&rxq_stats->syncp);
+		ret |= handle_rx;
+	}
+
+	if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
+		u64_stats_update_begin(&txq_stats->syncp);
+		txq_stats->tx_normal_irq_n++;
+		u64_stats_update_end(&txq_stats->syncp);
+		ret |= handle_tx;
 	}
 
 	/* Clear interrupts */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
