Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C7A8B5D5
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 11:44:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00D41C78F81;
	Wed, 16 Apr 2025 09:44:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41FBFC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vkrogxE9fqcWgnHDzFG5wXo3h9r2wNqtjpY3V48QhTo=; b=XMJsKtQ9Ur1X7oyB9M2CEqty+E
 HBAliKQtNy4YEXkUtFS5uWWIbr2Kx8bz5a9zVPzPv9H56MQNqLOfcmDn4VyHPzFu4IWdHyeMtTYEz
 lCgHHztvRroHLM7+gl1bAeg7g4ia5eWewoSV32zSRB1jZSfT2H02F5KZ/Dss9UZT/fQt0aQnYZy9i
 ohNuHsMpQPxwD+ro38O07FbPoD5r7TM/7a1XlH22k9FfAamrpF3XSxAur7eIsebmSz7F4ifLrpMSe
 cuas0flZgnpWt/09MnhKhMpSllY+EqYQ+cmPX/89FVUqMUeQ7jfKLsuQ5YYsJob9gpIpwp6R2HH9o
 6Se+8qag==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35284 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u4zJc-000109-15;
 Wed, 16 Apr 2025 10:44:20 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u4zJ0-000xEX-TZ; Wed, 16 Apr 2025 10:43:42 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u4zJ0-000xEX-TZ@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 10:43:42 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: visconti: convert to
 set_clk_tx_rate() method
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

Convert visconti to use the set_clk_tx_rate() method. By doing so,
the GMAC control register will already have been updated (unlike with
the fix_mac_speed() method) so this code can be removed while porting
to the set_clk_tx_rate() method.

There is also no need for the spinlock, and has never been - neither
fix_mac_speed() nor set_clk_tx_rate() can be called by more than one
thread at a time, so the lock does nothing useful.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: add Andrew's r-b (he doesn't mind it being preserved for simple fixes)
fix build errors.

 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 23 +++++--------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index 33cf99797df5..3d08bc9f6854 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -51,21 +51,14 @@ struct visconti_eth {
 	u32 phy_intf_sel;
 	struct clk *phy_ref_clk;
 	struct device *dev;
-	spinlock_t lock; /* lock to protect register update */
 };
 
-static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int visconti_eth_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct visconti_eth *dwmac = priv;
+	struct visconti_eth *dwmac = bsp_priv;
 	struct net_device *netdev = dev_get_drvdata(dwmac->dev);
 	unsigned int val, clk_sel_val = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwmac->lock, flags);
-
-	/* adjust link */
-	val = readl(dwmac->reg + MAC_CTRL_REG);
-	val &= ~(GMAC_CONFIG_PS | GMAC_CONFIG_FES);
 
 	switch (speed) {
 	case SPEED_1000:
@@ -89,12 +82,9 @@ static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	default:
 		/* No bit control */
 		netdev_err(netdev, "Unsupported speed request (%d)", speed);
-		spin_unlock_irqrestore(&dwmac->lock, flags);
-		return;
+		return -EINVAL;
 	}
 
-	writel(val, dwmac->reg + MAC_CTRL_REG);
-
 	/* Stop internal clock */
 	val = readl(dwmac->reg + REG_ETHER_CLOCK_SEL);
 	val &= ~(ETHER_CLK_SEL_RMII_CLK_EN | ETHER_CLK_SEL_RX_TX_CLK_EN);
@@ -136,7 +126,7 @@ static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 		break;
 	}
 
-	spin_unlock_irqrestore(&dwmac->lock, flags);
+	return 0;
 }
 
 static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmacenet_data *plat_dat)
@@ -228,11 +218,10 @@ static int visconti_eth_dwmac_probe(struct platform_device *pdev)
 	if (!dwmac)
 		return -ENOMEM;
 
-	spin_lock_init(&dwmac->lock);
 	dwmac->reg = stmmac_res.addr;
 	dwmac->dev = &pdev->dev;
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->fix_mac_speed = visconti_eth_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = visconti_eth_set_clk_tx_rate;
 
 	ret = visconti_eth_clock_probe(pdev, plat_dat);
 	if (ret)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
