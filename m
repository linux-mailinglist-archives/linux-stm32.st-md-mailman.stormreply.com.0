Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6191DB41F44
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17BC0C3FACD;
	Wed,  3 Sep 2025 12:39:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBAD7C3FACD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=89Pirc1gdz/+FhXD1SYe0RDV3wF24KaWnBhuIYtR8Co=; b=ZOr1+w81C3EMXtHncCOJtem4OH
 MSoE5NPA8lIJhTDeQKockj6T+Z1FMeYkS503DajJJDx9c2LMuNRcwXF7tLpx9qxv7tC6Psdp1pJoa
 iFvZ2KcAT0LMfysV38HiE07U2UpyAIkTWsnhNvE6C/cKKU5zfNI0yajJu+0SbSXhPU2emx1LgeoIV
 saJChiZbnEGxFPl41upIpCq+8Uef4olMv/qhyRSWo5To45VfcRFVbioxEMRlQdMounJWDsBFWpAg1
 Y1SOArjxCNQdozPGp0gJXIJOQUFOF9QEmep9KoceLjaMFrpXHGL/axvhoXfvWca+RBM4S2r9wiKjp
 GtM3yWJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37348 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1utmlt-000000000VL-4439;
 Wed, 03 Sep 2025 13:39:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1utmlt-00000001s0C-0wac; Wed, 03 Sep 2025 13:39:29 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1utmlt-00000001s0C-0wac@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:29 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 03/11] net: stmmac: mdio: provide
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
index 7887340ae7b6..2267a93ce44d 100644
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
@@ -239,8 +234,7 @@ static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
 
 	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
 	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
-	       ((priv->clk_csr << mii_regs->clk_csr_shift) &
-		mii_regs->clk_csr_mask) |
+	       priv->gmii_address_bus_config |
 	       MII_BUSY;
 }
 
@@ -515,6 +509,18 @@ void stmmac_pcs_clean(struct net_device *ndev)
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
@@ -535,6 +541,8 @@ int stmmac_mdio_register(struct net_device *ndev)
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
