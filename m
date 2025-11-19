Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8480C6DF36
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 11:23:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84928C62D37;
	Wed, 19 Nov 2025 10:23:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A25FFC56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sbRkLsOzrPKfiOjtitRKcKtlTS1mD+vXrFtZbAGt4MQ=; b=Zo7vfu7Z6HTQHQvm2FYRanNvTh
 1eTs+K0wgvZnVzuYb/rlhngHfF+SSxcoC5Mws6OrriKZipx3nQHhyQqvKruhUfvvOQypt+OI6Lq36
 xc8Wf5twdC6E1ByYQoQ6WRiXq66CB1LE7GqQ+0j05OjyBLFMp2bOPdxCCutKfWGrE9VaQU/Q8bxMD
 XgYaI3fbgxSjkEWC0UZAOL6RGdxwaC9y9e/3gOb+jGgb7Lw6D3In0u4BY9E1TWddxpw+E45a5G7+F
 U8B9P92swp13X8nkSGhzBsRx0FIXnS8pJynrHdBlZR4Xkhe6RRG8XzVONLN1ZhuiS/qFUGk+P0MDw
 F7UJ2GhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48928 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLfLM-000000004Us-3O3A;
 Wed, 19 Nov 2025 10:23:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLfLL-0000000FMap-49gf; Wed, 19 Nov 2025 10:23:20 +0000
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLfLL-0000000FMap-49gf@rmk-PC.armlinux.org.uk>
Date: Wed, 19 Nov 2025 10:23:19 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: move common DMA AXI
 register bits to common.h
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

Move the common DMA AXI register bits to common.h so they can be shared
and we can provide a common function to convert the axi->dma_blen[]
array to the format needed for this register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 10 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h |  9 +--------
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h  | 11 ++---------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 16 ++++++++--------
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 7395bbb94aea..3c6e7fe7b999 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -548,6 +548,16 @@ struct dma_features {
 #define LPI_CTRL_STATUS_TLPIEX	BIT(1)	/* Transmit LPI Exit */
 #define LPI_CTRL_STATUS_TLPIEN	BIT(0)	/* Transmit LPI Entry */
 
+/* Common definitions for AXI Master Bus Mode */
+#define DMA_AXI_AAL		BIT(12)
+#define DMA_AXI_BLEN256		BIT(7)
+#define DMA_AXI_BLEN128		BIT(6)
+#define DMA_AXI_BLEN64		BIT(5)
+#define DMA_AXI_BLEN32		BIT(4)
+#define DMA_AXI_BLEN16		BIT(3)
+#define DMA_AXI_BLEN8		BIT(2)
+#define DMA_AXI_BLEN4		BIT(1)
+
 #define STMMAC_CHAIN_MODE	0x1
 #define STMMAC_RING_MODE	0x2
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
index 4f980dcd3958..dfcb7ce79e76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h
@@ -69,15 +69,8 @@
 
 #define DMA_SYS_BUS_MB			BIT(14)
 #define DMA_AXI_1KBBE			BIT(13)
-#define DMA_SYS_BUS_AAL			BIT(12)
+#define DMA_SYS_BUS_AAL			DMA_AXI_AAL
 #define DMA_SYS_BUS_EAME		BIT(11)
-#define DMA_AXI_BLEN256			BIT(7)
-#define DMA_AXI_BLEN128			BIT(6)
-#define DMA_AXI_BLEN64			BIT(5)
-#define DMA_AXI_BLEN32			BIT(4)
-#define DMA_AXI_BLEN16			BIT(3)
-#define DMA_AXI_BLEN8			BIT(2)
-#define DMA_AXI_BLEN4			BIT(1)
 #define DMA_SYS_BUS_FB			BIT(0)
 
 #define DMA_BURST_LEN_DEFAULT		(DMA_AXI_BLEN256 | DMA_AXI_BLEN128 | \
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
index 5d9c18f5bbf5..967a735e9a0b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h
@@ -68,20 +68,13 @@ static inline u32 dma_chan_base_addr(u32 base, u32 chan)
 #define DMA_AXI_OSR_MAX		0xf
 #define DMA_AXI_MAX_OSR_LIMIT ((DMA_AXI_OSR_MAX << DMA_AXI_WR_OSR_LMT_SHIFT) | \
 			       (DMA_AXI_OSR_MAX << DMA_AXI_RD_OSR_LMT_SHIFT))
-#define	DMA_AXI_1KBBE		BIT(13)
-#define DMA_AXI_AAL		BIT(12)
-#define DMA_AXI_BLEN256		BIT(7)
-#define DMA_AXI_BLEN128		BIT(6)
-#define DMA_AXI_BLEN64		BIT(5)
-#define DMA_AXI_BLEN32		BIT(4)
-#define DMA_AXI_BLEN16		BIT(3)
-#define DMA_AXI_BLEN8		BIT(2)
-#define DMA_AXI_BLEN4		BIT(1)
 #define DMA_BURST_LEN_DEFAULT	(DMA_AXI_BLEN256 | DMA_AXI_BLEN128 | \
 				 DMA_AXI_BLEN64 | DMA_AXI_BLEN32 | \
 				 DMA_AXI_BLEN16 | DMA_AXI_BLEN8 | \
 				 DMA_AXI_BLEN4)
 
+#define	DMA_AXI_1KBBE		BIT(13)
+
 #define DMA_AXI_UNDEF		BIT(0)
 
 #define DMA_AXI_BURST_LEN_MASK	0x000000FE
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index e48cfa05000c..16c6d03fc929 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -338,16 +338,16 @@
 #define XGMAC_RD_OSR_LMT_SHIFT		16
 #define XGMAC_EN_LPI			BIT(15)
 #define XGMAC_LPI_XIT_PKT		BIT(14)
-#define XGMAC_AAL			BIT(12)
+#define XGMAC_AAL			DMA_AXI_AAL
 #define XGMAC_EAME			BIT(11)
 #define XGMAC_BLEN			GENMASK(7, 1)
-#define XGMAC_BLEN256			BIT(7)
-#define XGMAC_BLEN128			BIT(6)
-#define XGMAC_BLEN64			BIT(5)
-#define XGMAC_BLEN32			BIT(4)
-#define XGMAC_BLEN16			BIT(3)
-#define XGMAC_BLEN8			BIT(2)
-#define XGMAC_BLEN4			BIT(1)
+#define XGMAC_BLEN256			DMA_AXI_BLEN256
+#define XGMAC_BLEN128			DMA_AXI_BLEN128
+#define XGMAC_BLEN64			DMA_AXI_BLEN64
+#define XGMAC_BLEN32			DMA_AXI_BLEN32
+#define XGMAC_BLEN16			DMA_AXI_BLEN16
+#define XGMAC_BLEN8			DMA_AXI_BLEN8
+#define XGMAC_BLEN4			DMA_AXI_BLEN4
 #define XGMAC_UNDEF			BIT(0)
 #define XGMAC_TX_EDMA_CTRL		0x00003040
 #define XGMAC_TDPS			GENMASK(29, 0)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
