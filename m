Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA36A28B13
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 13:58:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 532E4C78F88;
	Wed,  5 Feb 2025 12:58:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC9FC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmIQrTyuSJm6WjsrcLaUswkBoX1MT9tLMUM8cxUna2c=; b=GW0YF75kSxWw2IcUqINTqUk9bd
 KKR6lAWOcolZL0WDhTLyWOYXcu9D5JlenFtCwk7KBJWKwWdDjxv6+5tWxU4w5ZxXzteY82XRfqTrC
 xnkS5Cg59LGXVD1emFbVa30+ZJe3asplDkJLLDk5hRkbqT+BLZePX/wJMYCsZ4GT2Jijyntox+HHS
 zHDw+G1CXuuwhgk8CDajM7cWixXnFykogyHE4Kp/2riu9zyfMtLC1ylG9Ing8LGPmcRVbxVq/H5Xq
 /cJyOvbYkHrb6T+yQ14RBnqu2fnCpQFp5Bdhyda9UEgI3e2A6XYTA9951RuttNKiaSjop9g87verV
 nEYQswog==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38818 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tfeyk-00070s-3A;
 Wed, 05 Feb 2025 12:58:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tfeyR-003YGJ-Gb; Wed, 05 Feb 2025 12:57:47 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 12:57:47 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] Revert "net: stmmac: Specify hardware
 capability value when FIFO size isn't specified"
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

This reverts commit 8865d22656b4, which caused breakage for platforms
which are not using xgmac2 or gmac4. Only these two cores have the
capability of providing the FIFO sizes from hardware capability fields
(which are provided in priv->dma_cap.[tr]x_fifo_size.)

All other cores can not, which results in these two fields containing
zero. We also have platforms that do not provide a value in
priv->plat->[tr]x_fifo_size, resulting in these also being zero.

This causes the new tests introduced by the reverted commit to fail,
and produce e.g.:

	stmmaceth f0804000.eth: Can't specify Rx FIFO size

An example of such a platform which fails is QEMU's npcm750-evb.
This uses dwmac1000 which, as noted above, does not have the capability
to provide the FIFO sizes from hardware.

Therefore, revert the commit to maintain compatibility with the way
the driver used to work.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 +++++++++----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..b34ebb916b89 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2424,6 +2424,11 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	u32 chan = 0;
 	u8 qmode = 0;
 
+	if (rxfifosz == 0)
+		rxfifosz = priv->dma_cap.rx_fifo_size;
+	if (txfifosz == 0)
+		txfifosz = priv->dma_cap.tx_fifo_size;
+
 	/* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
 	if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 		rxfifosz /= rx_channels_count;
@@ -2892,6 +2897,11 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 	int rxfifosz = priv->plat->rx_fifo_size;
 	int txfifosz = priv->plat->tx_fifo_size;
 
+	if (rxfifosz == 0)
+		rxfifosz = priv->dma_cap.rx_fifo_size;
+	if (txfifosz == 0)
+		txfifosz = priv->dma_cap.tx_fifo_size;
+
 	/* Adjust for real per queue fifo size */
 	rxfifosz /= rx_channels_count;
 	txfifosz /= tx_channels_count;
@@ -5868,6 +5878,9 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	const int mtu = new_mtu;
 	int ret;
 
+	if (txfifosz == 0)
+		txfifosz = priv->dma_cap.tx_fifo_size;
+
 	txfifosz /= priv->plat->tx_queues_to_use;
 
 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
@@ -7219,29 +7232,15 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
 	}
 
-	if (!priv->plat->rx_fifo_size) {
-		if (priv->dma_cap.rx_fifo_size) {
-			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
-		} else {
-			dev_err(priv->device, "Can't specify Rx FIFO size\n");
-			return -ENODEV;
-		}
-	} else if (priv->dma_cap.rx_fifo_size &&
-		   priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
+	if (priv->dma_cap.rx_fifo_size &&
+	    priv->plat->rx_fifo_size > priv->dma_cap.rx_fifo_size) {
 		dev_warn(priv->device,
 			 "Rx FIFO size (%u) exceeds dma capability\n",
 			 priv->plat->rx_fifo_size);
 		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
 	}
-	if (!priv->plat->tx_fifo_size) {
-		if (priv->dma_cap.tx_fifo_size) {
-			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
-		} else {
-			dev_err(priv->device, "Can't specify Tx FIFO size\n");
-			return -ENODEV;
-		}
-	} else if (priv->dma_cap.tx_fifo_size &&
-		   priv->plat->tx_fifo_size > priv->dma_cap.tx_fifo_size) {
+	if (priv->dma_cap.tx_fifo_size &&
+	    priv->plat->tx_fifo_size > priv->dma_cap.tx_fifo_size) {
 		dev_warn(priv->device,
 			 "Tx FIFO size (%u) exceeds dma capability\n",
 			 priv->plat->tx_fifo_size);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
