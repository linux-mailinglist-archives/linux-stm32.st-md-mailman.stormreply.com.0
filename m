Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3756CB41F3F
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 14:39:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F156BC3FAC8;
	Wed,  3 Sep 2025 12:39:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72449C3FAC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZWXN3lccSEg1goFEfsy0CS9OdO0KcxItBlMNoiHBWvc=; b=J/vnGkOCPkUvuaEzd4Tc5Hcb/9
 A3VesxVDakJlErUZhEi2H6HrYB23iKPaUGi/BwbT4U7vLwkZN6IlO/tYi8h9c2NMKz872OtJNihHF
 qoHpWXMtdecmh9UDaiVRMFPVPWm01YrqBS5u1NfXAFIrf72WwUeFSfG81k8sgwl67apZDILsrw/ht
 v7Uq/fbNtEyINWWXnQiwJk8DD02fF+PGNEL1u5pBADngNeam9xMVciNYphiw8O4UlLGP0icG4Gk2N
 Z0CTicEgX3Ewt9T2o17NW0qSuBeIGgs6lASnKo0WZyGZ9N2kmR50i8gWbukB9dAIqukL0eDjC8cv1
 wl1t90Iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51034 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1utmlj-000000000Ut-39bT;
 Wed, 03 Sep 2025 13:39:19 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1utmli-00000001s00-49Uk; Wed, 03 Sep 2025 13:39:19 +0100
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1utmli-00000001s00-49Uk@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 13:39:18 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: mdio: provide
 address register formatter
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

Rather than duplicating the logic for filling the PA (MDIO address),
GR (MDIO register/devad), CR (clock range) and GB (busy) fields of the
address register in four locations, provide a helper to do this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 53 +++++++++----------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 0a302b711bc2..3106fef6eed8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -229,6 +229,24 @@ static int stmmac_xgmac2_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 					phydata);
 }
 
+/**
+ * stmmac_mdio_format_addr() - format the address register
+ * @priv: struct stmmac_priv pointer
+ * @pa: 5-bit MDIO package address
+ * @gr: 5-bit MDIO register address (C22) or MDIO device address (C45)
+ */
+static u32 stmmac_mdio_format_addr(struct stmmac_priv *priv,
+				   unsigned int pa, unsigned int gr)
+{
+	const struct mii_regs *mii_regs = &priv->hw->mii;
+
+	return ((pa << mii_regs->addr_shift) & mii_regs->addr_mask) |
+	       ((gr << mii_regs->reg_shift) & mii_regs->reg_mask) |
+	       ((priv->clk_csr << mii_regs->clk_csr_shift) &
+		mii_regs->clk_csr_mask) |
+	       MII_BUSY;
+}
+
 static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
@@ -263,18 +281,14 @@ static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
 static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	u32 value = MII_BUSY;
 	int data = 0;
+	u32 value;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_READ;
 
@@ -300,20 +314,16 @@ static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 				int phyreg)
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
-	u32 value = MII_BUSY;
 	int data = 0;
+	u32 value;
 
 	data = pm_runtime_resume_and_get(priv->device);
 	if (data < 0)
 		return data;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
 	value |= MII_GMAC4_READ;
 	value |= MII_GMAC4_C45E;
-	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
@@ -357,18 +367,13 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value = MII_BUSY;
+	u32 value;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-	value |= (phyreg << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
-
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
+	value = stmmac_mdio_format_addr(priv, phyaddr, phyreg);
 	if (priv->plat->has_gmac4)
 		value |= MII_GMAC4_WRITE;
 	else
@@ -395,21 +400,15 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 {
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
-	u32 value = MII_BUSY;
+	u32 value;
 
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
 
-	value |= (phyaddr << priv->hw->mii.addr_shift)
-		& priv->hw->mii.addr_mask;
-
-	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
-		& priv->hw->mii.clk_csr_mask;
-
+	value = stmmac_mdio_format_addr(priv, phyaddr, devad);
 	value |= MII_GMAC4_WRITE;
 	value |= MII_GMAC4_C45E;
-	value |= (devad << priv->hw->mii.reg_shift) & priv->hw->mii.reg_mask;
 
 	data |= phyreg << MII_GMAC4_REG_ADDR_SHIFT;
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
