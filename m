Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B402C3EF51
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 09:29:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61F6AC60466;
	Fri,  7 Nov 2025 08:29:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F719C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gAd10CgJV5pNLqOpAenHV3c5toSi/7KgrhLgK7pr+jU=; b=ULLNl7sddPogW14zwv4kUhvYDa
 vPiTiKtDC8dcm6OcmGUYhu9P23b3NpYlXT/Yz8lpTxq2T6l36QZd8dpg9TRFZI5zedhUQJGIVjkpa
 bTkCWvOmatv/X7wHSOUsMZRZWgjsVegDjIN6/TlR1FNMKQgr3gJCGsyvUc4GJfZDYOeVtVUalvfHr
 FwpP61A3lvF6fAi5+95XT4sF/t1dzM0TigfS21bgtaz7AOg1f1IqcjdG4DB0EJPrHunlpHhyFGRjq
 H9VJ1jNxXEC+zwCIs7wndal/a9tHNq2q7enQACNhW77wpDJObdabU3lcZihKfB1ivzkPxByTMj+qV
 yoLEul4g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51600 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHHqP-000000006Au-0id1;
 Fri, 07 Nov 2025 08:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHHqO-0000000Djrb-0DPN; Fri, 07 Nov 2025 08:29:16 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHHqO-0000000Djrb-0DPN@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:29:16 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 09/11] net: stmmac: ingenic:
 simplify x2000 mac_set_mode()
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

As per the previous commit, we have validated that the phy_intf_sel
value is one that is permissible for this SoC, so there is no need to
handle invalid PHY interface modes. We can also apply the other
configuration based upon the phy_intf_sel value rather than the
PHY interface mode.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: fix build warnings in patch 9 by rearranging the code
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++--------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 7b2576fbb1e1..eb5744e0b9ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -122,39 +122,25 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
 	unsigned int val;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
-			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
-		break;
-
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-		val = 0;
+	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
+
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
+		       FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
+	} else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
 		if (mac->tx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
 		else
 			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
-				   FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
+			       FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
 
 		if (mac->rx_delay == 0)
 			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
 		else
 			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
 				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
-
-		break;
-
-	default:
-		dev_err(mac->dev, "Unsupported interface %s\n",
-			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
 	}
 
-	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
-
 	/* Update MAC PHY control register */
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
