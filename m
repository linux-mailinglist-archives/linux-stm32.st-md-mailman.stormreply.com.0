Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B57B43B21
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 14:11:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C80EC36B1F;
	Thu,  4 Sep 2025 12:11:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82202C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=09jzU5RnoK37mEWoerkBBMdU2xO5D5cZIVVTnpRSdkI=; b=mlgIdPmRkCa/S9QYhoiyeNMC37
 ojIScjRfDgLlMMyfK8dr8TjvM5ogIHRMljyNu8Uir8Cd+Tdxrk4iRSjf9Bxe/33pR3mqj3PaLk5bp
 kGyHkrQd138DV+KQHHbrAE3yWiXVXqbOGpaPKsPhg96FDQHm9GqF7+mjyF+1GlMAMB87gU0zIf1vn
 cFH5Huc71dPSgV4qE3Y84ty1zal+kTKQDTEBi8iB3Juh9XaoaqWFRQ7psc++1aUOfiC5KU7WXykhh
 neEW/j6J7Gew22TWXxmFTk9D9XYc1/LMiYpaL4eDNaKNyx60Le+Aw4KQQMOBwbrgQegd+aKIOkcJS
 mtdJ7L+Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55610 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uu8ny-000000001xK-04Po;
 Thu, 04 Sep 2025 13:11:06 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uu8nx-00000001voa-0tJ0; Thu, 04 Sep 2025 13:11:05 +0100
In-Reply-To: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uu8nx-00000001voa-0tJ0@rmk-PC.armlinux.org.uk>
Date: Thu, 04 Sep 2025 13:11:05 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 02/11] net: stmmac: mdio: provide
 stmmac_mdio_wait()
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

All the readl_poll_timeout()s follow the same pattern - test a register
for a bit being clear every 100us, and timeout after 10ms returning
-EBUSY. Wrap this up into a function to avoid duplicating this.

This slightly changes the return value for stmmac_mdio_write() if the
second readl_poll_timeout() fails - rather than returning -ETIMEDOUT
we return -EBUSY matching the stmmac_mdio_read() behaviour.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 70 +++++++++----------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index c305c202055a..6acce54b5d55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -45,6 +45,16 @@
 #define MII_XGMAC_PA_SHIFT		16
 #define MII_XGMAC_DA_SHIFT		21
 
+static int stmmac_mdio_wait(void __iomem *reg, u32 mask)
+{
+	u32 v;
+
+	if (readl_poll_timeout(reg, v, !(v & mask), 100, 10000))
+		return -EBUSY;
+
+	return 0;
+}
+
 static void stmmac_xgmac2_c45_format(struct stmmac_priv *priv, int phyaddr,
 				     int devad, int phyreg, u32 *hw_addr)
 {
@@ -83,7 +93,6 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
-	u32 tmp;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(priv->device);
@@ -91,33 +100,27 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 		return ret;
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-			       !(tmp & MII_XGMAC_BUSY), 100, 10000)) {
-		ret = -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
+	if (ret)
 		goto err_disable_clks;
-	}
 
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
 	value |= MII_XGMAC_READ;
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-			       !(tmp & MII_XGMAC_BUSY), 100, 10000)) {
-		ret = -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
+	if (ret)
 		goto err_disable_clks;
-	}
 
 	/* Set the MII address register to read */
 	writel(addr, priv->ioaddr + mii_address);
 	writel(value, priv->ioaddr + mii_data);
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-			       !(tmp & MII_XGMAC_BUSY), 100, 10000)) {
-		ret = -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
+	if (ret)
 		goto err_disable_clks;
-	}
 
 	/* Read the data from the MII data register */
 	ret = (int)readl(priv->ioaddr + mii_data) & GENMASK(15, 0);
@@ -160,7 +163,6 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
-	u32 tmp;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(priv->device);
@@ -168,11 +170,9 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 		return ret;
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-			       !(tmp & MII_XGMAC_BUSY), 100, 10000)) {
-		ret = -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
+	if (ret)
 		goto err_disable_clks;
-	}
 
 	value |= (priv->clk_csr << priv->hw->mii.clk_csr_shift)
 		& priv->hw->mii.clk_csr_mask;
@@ -180,19 +180,16 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 	value |= MII_XGMAC_WRITE;
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-			       !(tmp & MII_XGMAC_BUSY), 100, 10000)) {
-		ret = -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
+	if (ret)
 		goto err_disable_clks;
-	}
 
 	/* Set the MII address register to write */
 	writel(addr, priv->ioaddr + mii_address);
 	writel(value, priv->ioaddr + mii_data);
 
 	/* Wait until any existing MII operation is complete */
-	ret = readl_poll_timeout(priv->ioaddr + mii_data, tmp,
-				 !(tmp & MII_XGMAC_BUSY), 100, 10000);
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_data, MII_XGMAC_BUSY);
 
 err_disable_clks:
 	pm_runtime_put(priv->device);
@@ -253,18 +250,18 @@ static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
-	u32 v;
+	int ret;
 
-	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
-			       100, 10000))
-		return -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
+	if (ret)
+		return ret;
 
 	writel(data, priv->ioaddr + mii_data);
 	writel(value, priv->ioaddr + mii_address);
 
-	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
-			       100, 10000))
-		return -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
+	if (ret)
+		return ret;
 
 	/* Read the data from the MII data register */
 	return readl(priv->ioaddr + mii_data) & MII_DATA_MASK;
@@ -340,20 +337,19 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, int data, u32 value)
 {
 	unsigned int mii_address = priv->hw->mii.addr;
 	unsigned int mii_data = priv->hw->mii.data;
-	u32 v;
+	int ret;
 
 	/* Wait until any existing MII operation is complete */
-	if (readl_poll_timeout(priv->ioaddr + mii_address, v, !(v & MII_BUSY),
-			       100, 10000))
-		return -EBUSY;
+	ret = stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
+	if (ret)
+		return ret;
 
 	/* Set the MII address register to write */
 	writel(data, priv->ioaddr + mii_data);
 	writel(value, priv->ioaddr + mii_address);
 
 	/* Wait until any existing MII operation is complete */
-	return readl_poll_timeout(priv->ioaddr + mii_address, v,
-				  !(v & MII_BUSY), 100, 10000);
+	return stmmac_mdio_wait(priv->ioaddr + mii_address, MII_BUSY);
 }
 
 /**
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
