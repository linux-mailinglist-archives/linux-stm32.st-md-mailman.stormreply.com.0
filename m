Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69387CFAECA
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 21:31:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39302C8F279;
	Tue,  6 Jan 2026 20:31:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 290E1C8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Luh25YQfp2M+J9LmqGBEzB403xFiDCfMCyzxptMa4QY=; b=SCIaDDuOwJIryBMgZtdCz9jetm
 djnmffVj60OkJkmqKQGusroN6fRsvNYGyrnVYvMoIIH9mSwzy6O2YbgvV9lBXVCceC6p1R4P9Fgqv
 HG062RbSx/wSDmcvrPq+PzFHby/ktla7BmJ5NbJe1MoQRQJp+t3T+FocL1dvLA06iBt+k5ERvghMf
 iwgLjZpeWNTcOcgf9cDqqBPK2bDm6sbJaJ4PgJLrW6d42OU+dZQK1VeGH3ZXmS4Gju4zx4ZG2wFDC
 dWVLgF4ofs9hG8dAjrudtE+0s8xdxU7CHRy8UTiHktdVWIfuXrUy7zkTc2aaj1l1FIWciCu5WDFf5
 IG8vcvCw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46278 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vdDi6-0000000010m-3IIV;
 Tue, 06 Jan 2026 20:31:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vdDi5-00000002E1P-24pm; Tue, 06 Jan 2026 20:31:21 +0000
In-Reply-To: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vdDi5-00000002E1P-24pm@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Jan 2026 20:31:21 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/9] net: stmmac: dwmac4: fix RX FIFO
	fill statistics
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

In dwmac4_debug(), the wrong shift is used with the RXFSTS mask:

 #define MTL_DEBUG_RXFSTS_MASK          GENMASK(5, 4)
 #define MTL_DEBUG_RXFSTS_SHIFT         4
 #define MTL_DEBUG_RRCSTS_SHIFT         1

                       u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
                                    >> MTL_DEBUG_RRCSTS_SHIFT;

where rxfsts is tested against small integers 1 .. 3. This results in
the tests always failing, causing the "mtl_rx_fifo__fill_level_empty"
statistic counter to always be incremented no matter what the fill
level actually is.

Fix this by using FIELD_GET() and remove the unnecessary
MTL_DEBUG_RXFSTS_SHIFT definition as FIELD_GET() will shift according
to the least siginificant set bit in the supplied field mask.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index fa27639895ce..3da6891b9df7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -460,7 +460,6 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 
 /* MAC debug: GMII or MII Transmit Protocol Engine Status */
 #define MTL_DEBUG_RXFSTS_MASK		GENMASK(5, 4)
-#define MTL_DEBUG_RXFSTS_SHIFT		4
 #define MTL_DEBUG_RXFSTS_EMPTY		0
 #define MTL_DEBUG_RXFSTS_BT		1
 #define MTL_DEBUG_RXFSTS_AT		2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a4282fd7c3c7..bd5f48d0b9fc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -700,8 +700,7 @@ static void dwmac4_debug(struct stmmac_priv *priv, void __iomem *ioaddr,
 		value = readl(ioaddr + MTL_CHAN_RX_DEBUG(dwmac4_addrs, queue));
 
 		if (value & MTL_DEBUG_RXFSTS_MASK) {
-			u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
-				     >> MTL_DEBUG_RRCSTS_SHIFT;
+			u32 rxfsts = FIELD_GET(MTL_DEBUG_RXFSTS_MASK, value);
 
 			if (rxfsts == MTL_DEBUG_RXFSTS_FULL)
 				x->mtl_rx_fifo_fill_level_full++;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
