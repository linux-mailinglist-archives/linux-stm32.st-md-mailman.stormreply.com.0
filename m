Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC6D389DE
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Jan 2026 00:25:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D68D8C8F27C;
	Fri, 16 Jan 2026 23:25:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 066BACFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 23:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kIYBZYHbSuff3l7sAHhcXWX3iDvTERmwHuTeLbzpX8M=; b=dpHIgoZQ4tpA8MPgX8U/cCNmEx
 KNNxBIgSO4gK7dP/F5e2CUKYtRIsD3BB3+ccG5ZSvu4Tao6OVcDQ6DT8LfOwcbwwxgtZEW5pb2GAQ
 b8qJ7gxL58jll05fvRI5itD2bhGmYLP6o6qjM1TkD+KdDq7r1dxWfCxUKHB1WDKJ0OOlL/aHEkZyZ
 9h246Y8yIrmN4rTzefaHapns2KyoEAp1NUVqYmLriYXyJLtRTwbIu/a3I1MsE01Gx3zN4V1vDCyX5
 OTh+OoF+VlpAsjuwRlfEZHt89Hjhj1Y2XnhDYiliuKYUYQhO+e83eNuv+xEdC2CakuTfA49aq5dFc
 LNJGraWA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52834 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vgtBc-000000002lj-3N0W;
 Fri, 16 Jan 2026 23:25:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vgtBc-00000005D6v-040n; Fri, 16 Jan 2026 23:25:00 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
Date: Fri, 16 Jan 2026 23:25:00 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next] net: stmmac: enable RPS and RBU
	interrupts
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

Enable receive process stopped and receive buffer unavailable
interrupts, so that the statistic counters can be updated.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Maxime,

You may find this patch useful, as it makes the "rx_buf_unav_irq"
and "rx_process_stopped_irq" ethtool statistic counters functional.
This means that the lack of receive descriptors can still be detected
even if the receive side doesn't actually stall.

I'm not sure why we publish these statistic counters if we don't
enable the interrupts to allow them to ever be non-zero.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 9d9077a4ac9f..d7f86b398abe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -99,6 +99,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 #define DMA_CHAN_INTR_ENA_NIE_4_10	BIT(15)
 #define DMA_CHAN_INTR_ENA_AIE_4_10	BIT(14)
 #define DMA_CHAN_INTR_ENA_FBE		BIT(12)
+#define DMA_CHAN_INTR_ENA_RPS		BIT(8)
+#define DMA_CHAN_INTR_ENA_RBU		BIT(7)
 #define DMA_CHAN_INTR_ENA_RIE		BIT(6)
 #define DMA_CHAN_INTR_ENA_TIE		BIT(0)
 
@@ -107,6 +109,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL		(DMA_CHAN_INTR_ENA_AIE | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.00 */
 #define DMA_CHAN_INTR_DEFAULT_MASK	(DMA_CHAN_INTR_NORMAL | \
@@ -119,6 +123,8 @@ static inline u32 dma_chanx_base_addr(const struct dwmac4_addrs *addrs,
 					 DMA_CHAN_INTR_ENA_TIE)
 
 #define DMA_CHAN_INTR_ABNORMAL_4_10	(DMA_CHAN_INTR_ENA_AIE_4_10 | \
+					 DMA_CHAN_INTR_ENA_RPS | \
+					 DMA_CHAN_INTR_ENA_RBU | \
 					 DMA_CHAN_INTR_ENA_FBE)
 /* DMA default interrupt mask for 4.10a */
 #define DMA_CHAN_INTR_DEFAULT_MASK_4_10	(DMA_CHAN_INTR_NORMAL_4_10 | \
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
