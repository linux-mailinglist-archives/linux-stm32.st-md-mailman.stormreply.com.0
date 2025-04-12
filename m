Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB4A86C05
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Apr 2025 11:35:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A601BC78F77;
	Sat, 12 Apr 2025 09:35:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C952BC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Apr 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HgIKLwjmM3zOzMNcI6zf8TGzoq3WJV5zZ0yVxBt2glo=; b=EfvprTU/8x/51YDmQAMnZidivo
 WOj2km33+1oGuZga0iiSe8ziXDiLaqam9Is9OB4c1Ty/GOouFBjtFAltzNHSkoSaXQr/psGAgeJav
 G72MMjyzFVvNeXcD2ptyAgiQXXxt1vQCyxzy3JXS2xHrRX2kBCcdSefSGU1yQTPrnzPpt344PmoKI
 tuhE5NYrx5vRmvg9nabLWImOp3k8WDuWUHTPP709VUf7P6+clUWbaJXMQtVMFHKxHxBzjX6nb5K22
 AQyYJy6aFPP/Gn7FlUkJmJAnmbwriCfr9NrrT4b3BZCwFx2ymWv40IVuGVSxvu5BLQbzfsURDrOzr
 mG34zFwA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46246 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u3XGn-0004Qq-0z;
 Sat, 12 Apr 2025 10:35:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u3XGC-000EJm-2N; Sat, 12 Apr 2025 10:34:48 +0100
In-Reply-To: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u3XGC-000EJm-2N@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 10:34:48 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: remove _RE and _TE
 in (start|stop)_(tx|rx)() methods
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

Remove fiddling with _TE and _RE in the GMAC control register in the
start_tx/stop_tx/start_rx/stop_rx() methods as this should be handled
by stmmac_mac_link_up() and stmmac_mac_link_down() and not during
initialisation.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 57c03d491774..61584b569be7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -50,10 +50,6 @@ void dwmac4_dma_start_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 
 	value |= DMA_CONTROL_ST;
 	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
-
-	value = readl(ioaddr + GMAC_CONFIG);
-	value |= GMAC_CONFIG_TE;
-	writel(value, ioaddr + GMAC_CONFIG);
 }
 
 void dwmac4_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -77,10 +73,6 @@ void dwmac4_dma_start_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= DMA_CONTROL_SR;
 
 	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(dwmac4_addrs, chan));
-
-	value = readl(ioaddr + GMAC_CONFIG);
-	value |= GMAC_CONFIG_RE;
-	writel(value, ioaddr + GMAC_CONFIG);
 }
 
 void dwmac4_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 7840bc403788..cba12edc1477 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -288,10 +288,6 @@ static void dwxgmac2_dma_start_tx(struct stmmac_priv *priv,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value |= XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value |= XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
@@ -302,10 +298,6 @@ static void dwxgmac2_dma_stop_tx(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value = readl(ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
 	value &= ~XGMAC_TXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_TX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_TX_CONFIG);
-	value &= ~XGMAC_CONFIG_TE;
-	writel(value, ioaddr + XGMAC_TX_CONFIG);
 }
 
 static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
@@ -316,10 +308,6 @@ static void dwxgmac2_dma_start_rx(struct stmmac_priv *priv,
 	value = readl(ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
 	value |= XGMAC_RXST;
 	writel(value, ioaddr + XGMAC_DMA_CH_RX_CONTROL(chan));
-
-	value = readl(ioaddr + XGMAC_RX_CONFIG);
-	value |= XGMAC_CONFIG_RE;
-	writel(value, ioaddr + XGMAC_RX_CONFIG);
 }
 
 static void dwxgmac2_dma_stop_rx(struct stmmac_priv *priv, void __iomem *ioaddr,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
