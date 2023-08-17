Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3677FC98
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 19:09:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26F74C6B475;
	Thu, 17 Aug 2023 17:09:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5878EC6B472
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 17:09:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52575675BE;
 Thu, 17 Aug 2023 17:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10155C43397;
 Thu, 17 Aug 2023 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692292189;
 bh=H6r17igTApBMtumIbML4/Pv00+k0irJssUyt+I4FyfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LYpTTr3Bt7kUAgHnD+wrvXcht/aMFZ37ye8zlLZaCbzamr0O075RyZSz23otSW+/I
 YFbZfGI1uQnLMW1zyJXqdY2ItxEqCvwT36UV+ZpL6i3HM075xn/Bb0ODnzp7m6m2qb
 8BF9OrUBbp8v3a7qFxGj7P0Aeqf8r9+l7R2uda486x8Xj9bU7QjTFnkHAqOWXTaTev
 zjlp4hZGZU8Dh6dEM9P+GxiEtVMPcT67RfeTmSpAxS487TbFmfTwomQiK5dL5Hp0sS
 wUt/gT5Ilg0hZf+ZJDnYE2IkyF+fXx+E77ZRbtsCNwx21b89C+eFzMYdk5t2UgK9NC
 Nu3sUuN2du5OQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Fri, 18 Aug 2023 00:57:45 +0800
Message-Id: <20230817165749.672-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230817165749.672-1-jszhang@kernel.org>
References: <20230817165749.672-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v5 5/9] net: stmmac: xgmac: support
	per-channel irq
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

The IP supports per channel interrupt, add support for this usage case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 33 +++++++++++--------
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 7f68bef456b7..18a042834d75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -340,6 +340,8 @@
 
 /* DMA Registers */
 #define XGMAC_DMA_MODE			0x00003000
+#define XGMAC_INTM			GENMASK(13, 12)
+#define XGMAC_INTM_MODE1		0x1
 #define XGMAC_SWR			BIT(0)
 #define XGMAC_DMA_SYSBUS_MODE		0x00003004
 #define XGMAC_WR_OSR_LMT		GENMASK(29, 24)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 1ef8fc132c2d..ce228c362403 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -31,6 +31,13 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value |= XGMAC_EAME;
 
 	writel(value, ioaddr + XGMAC_DMA_SYSBUS_MODE);
+
+	if (dma_cfg->perch_irq_en) {
+		value = readl(ioaddr + XGMAC_DMA_MODE);
+		value &= ~XGMAC_INTM;
+		value |= FIELD_PREP(XGMAC_INTM, XGMAC_INTM_MODE1);
+		writel(value, ioaddr + XGMAC_DMA_MODE);
+	}
 }
 
 static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
@@ -365,20 +372,20 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 	}
 
 	/* TX/RX NORMAL interrupts */
-	if (likely(intr_status & XGMAC_NIS)) {
-		if (likely(intr_status & XGMAC_RI)) {
-			u64_stats_update_begin(&rx_q->rxq_stats.syncp);
-			rx_q->rxq_stats.rx_normal_irq_n++;
-			u64_stats_update_end(&rx_q->rxq_stats.syncp);
-			ret |= handle_rx;
-		}
-		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
-			u64_stats_update_begin(&tx_q->txq_stats.syncp);
-			tx_q->txq_stats.tx_normal_irq_n++;
-			u64_stats_update_end(&tx_q->txq_stats.syncp);
-			ret |= handle_tx;
-		}
+	if (likely(intr_status & XGMAC_RI)) {
+		u64_stats_update_begin(&rx_q->rxq_stats.syncp);
+		rx_q->rxq_stats.rx_normal_irq_n++;
+		u64_stats_update_end(&rx_q->rxq_stats.syncp);
+		ret |= handle_rx;
+	}
+	if (likely(intr_status & XGMAC_TI)) {
+		u64_stats_update_begin(&tx_q->txq_stats.syncp);
+		tx_q->txq_stats.tx_normal_irq_n++;
+		u64_stats_update_end(&tx_q->txq_stats.syncp);
+		ret |= handle_tx;
 	}
+	if (unlikely(intr_status & XGMAC_TBU))
+		ret |= handle_tx;
 
 	/* Clear interrupts */
 	writel(intr_en & intr_status, ioaddr + XGMAC_DMA_CH_STATUS(chan));
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
