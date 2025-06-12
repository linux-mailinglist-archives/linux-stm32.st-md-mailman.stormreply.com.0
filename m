Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF4AD769C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 17:42:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1673C32E8E;
	Thu, 12 Jun 2025 15:42:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C71BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZnvOnHtbSmTRkDQY5OMcUHswqrZh6xf9n5dNyGk7Nw=; b=sHIPscLDJe2PxlFKqqldN0N61g
 9eMwdItQ/K45eKRVOY9dFpQYtJYYO6gHd6+qgOD4kbdXK0fxqMRvX9kt0bQiIE2cuSKLJaBxaDchy
 YauesJ/+zfnj+mr6OuJ4fJ7kk9cZOcEKDJyxveXbeQ2Rxvau7NNTYQBoRlcTdgNd3f335LmmNCBXp
 YtB0ImDWdzH87emHvyHdeCati/P/swpV0q3xhbe5OpnFbpfxLmrMu2LPLB7lnFjLsCKGzD4bLAvw9
 vSS1RHTq3OQ2CX8wQ92N3s7OICM48tcD3GSoZaVjWZ/WG65b3h4qjLMnbkbCJ3KJDgwZWyWv9SlCh
 6P2jOglg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44308 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uPk42-00085O-2N;
 Thu, 12 Jun 2025 16:42:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uPk3O-004CFx-Ir; Thu, 12 Jun 2025 16:41:22 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uPk3O-004CFx-Ir@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:22 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 9/9] net: stmmac: rk: remove obsolete
 .set_*_speed() methods
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

Now that no SoC implements the .set_*_speed() methods, we can get rid
of these methods and the now unused code in rk_set_clk_tx_rate().
Arrange for the function to return an error when the .set_speed()
method is not implemented.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 7cdb09037da0..18ae12df4a85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -37,8 +37,6 @@ struct rk_gmac_ops {
 	void (*set_to_rgmii)(struct rk_priv_data *bsp_priv,
 			     int tx_delay, int rx_delay);
 	void (*set_to_rmii)(struct rk_priv_data *bsp_priv);
-	void (*set_rgmii_speed)(struct rk_priv_data *bsp_priv, int speed);
-	void (*set_rmii_speed)(struct rk_priv_data *bsp_priv, int speed);
 	int (*set_speed)(struct rk_priv_data *bsp_priv,
 			 phy_interface_t interface, int speed);
 	void (*set_clock_selection)(struct rk_priv_data *bsp_priv, bool input,
@@ -1707,29 +1705,12 @@ static int rk_set_clk_tx_rate(void *bsp_priv_, struct clk *clk_tx_i,
 			      phy_interface_t interface, int speed)
 {
 	struct rk_priv_data *bsp_priv = bsp_priv_;
-	struct device *dev = &bsp_priv->pdev->dev;
 
 	if (bsp_priv->ops->set_speed)
 		return bsp_priv->ops->set_speed(bsp_priv, bsp_priv->phy_iface,
 						speed);
 
-	switch (bsp_priv->phy_iface) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		if (bsp_priv->ops->set_rgmii_speed)
-			bsp_priv->ops->set_rgmii_speed(bsp_priv, speed);
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		if (bsp_priv->ops->set_rmii_speed)
-			bsp_priv->ops->set_rmii_speed(bsp_priv, speed);
-		break;
-	default:
-		dev_err(dev, "unsupported interface %d", bsp_priv->phy_iface);
-	}
-
-	return 0;
+	return -EINVAL;
 }
 
 static int rk_gmac_probe(struct platform_device *pdev)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
