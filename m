Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF4B43B23
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 14:11:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 887C6C36B1F;
	Thu,  4 Sep 2025 12:11:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF63C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ULNdmNCRIkxTZoG3Dhg+00hD3xZk802sCVX/OceuCXk=; b=vcQihDfN3gMaQiuBf8ew4pox7j
 7jNiz2DnlR2GdLbke/hlIY+/eDcKVQbEMNYzgP7Tjiotnks50pHa8HpLEe0LrubZNTrYPcWedwdQa
 N5Ab0BJ+Oe+RJATmx0fFgK9HboPcqMkWlYodGiunL1PtgOOSx+rn/Ivieud8C+D3fxXWZ4tzkEE5G
 gr2vFRW2jhW+YAn3HZoY7tTxULKuVshPK23EKZYQHQ1i5uvsQ9XQaKNnBDCxyiqfAyjiDru++3yR8
 1JHhU/HX1AK8KRovfviR65FBbf3mZEhyvFvUYnxilA9vvgEXOVqFhONT4lrq+pfVC08YfmjY4E0kO
 5/Bo094g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36092 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uu8o3-000000001xZ-0ySZ;
 Thu, 04 Sep 2025 13:11:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uu8o2-00000001vog-1LyK; Thu, 04 Sep 2025 13:11:10 +0100
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uu8o2-00000001vog-1LyK@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:10 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 03/11] net: stmmac: mdio: provide
 priv->gmii_address_bus_config
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

Provide a pre-formatted value for the MDIO address register fields
which remain constant across the various different transactions
rather than recreating the register value from scratch every time.
Currently, we only do this for the CR (clock range) field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 26 ++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 78d6b3737a26..4d5577935b13 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -290,6 +290,7 @@ struct stmmac_priv {
 	int wolopts;
 	int wol_irq;
 	int clk_csr;
+	u32 gmii_address_bus_config;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
 	u32 tx_lpi_timer;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 6acce54b5d55..4294262c208d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -104,9 +104,7 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 	if (ret)
 		goto err_disable_clks;
 
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-	value |= MII_XGMAC_READ;
+	value |= priv->gmii_address_bus_config | MII_XGMAC_READ;
 
 	/* Wait until any existing MII operation is complete */
 	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
@@ -174,10 +172,7 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 	if (ret)
 		goto err_disable_clks;
 
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-	value |= phydata;
-	value |= MII_XGMAC_WRITE;
+	value |= priv->gmii_address_bus_config | phydata | MII_XGMAC_WRITE;
 
 	/* Wait until any existing MII operation is complete */
 	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
@@ -241,8 +236,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
-	       ((priv->clk_csr << mii_regs->clk_csr_shift) &
-		mii_regs->clk_csr_mask) |
+	       priv->gmii_address_bus_config |
 	       MII_BUSY;
 }
 
@@ -517,6 +511,18 @@ void stmmac_pcs_clean(struct net_device *ndev)
 	priv->hw->xpcs = NULL;
 }
 
+static void stmmac_mdio_bus_config(struct stmmac_priv *priv, u32 value)
+{
+	value <<= priv->hw->mii.clk_csr_shift;
+
+	if (value & ~priv->hw->mii.clk_csr_mask)
+		dev_warn(priv->device,
+			 "clk_csr value out of range (0x%08x exceeds mask 0x%08x), truncating\n",
+			 value, priv->hw->mii.clk_csr_mask);
+
+	priv->gmii_address_bus_config = value & priv->hw->mii.clk_csr_mask;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -537,6 +543,8 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (!mdio_bus_data)
 		return 0;
 
+	stmmac_mdio_bus_config(priv, priv->clk_csr);
+
 	new_bus = mdiobus_alloc();
 	if (!new_bus)
 		return -ENOMEM;
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
