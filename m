Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B6B37E04
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 10:41:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FF4C3FADB;
	Wed, 27 Aug 2025 08:41:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9730FC3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPRQY28nN74Kh95BFEt+ohvgl/j08Tf0hPpDTXYE12g=; b=HnZW6N+jpf3sOHGmvI2bA9wWHY
 Umws2c6dlonhdUQTelLzaFqCle4wIFR2/2y1InSx6mPaeVMKWZiuqBY5PM3tspQnWthiN8P5ukdSo
 oq42TC5OGjWwEJTugcBRfdncmOfVtoXctf2ZI9WFZHhWtkyl4WMA3yfJ1OrHQ6ZYsM0G6XJ/pG4/7
 AqZwvNW5TVmq1gJi1M2HWryE0lys2VHLorvU0lgi952fxqImPHxezA3IsllbivU14dOFAZA9UuaOq
 9pGIN75GwkMliRz5raVNb0vfPCMH2uUtO2aQDl0YO7HZDKpkqaisAvVtj3ocN2gEeJlWikgKflA7b
 zo0x9Tog==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49906 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1urBj2-000000000Es-3pdZ;
 Wed, 27 Aug 2025 09:41:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1urBj2-000000002as-0pod; Wed, 27 Aug 2025 09:41:48 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
Date: Wed, 27 Aug 2025 09:41:48 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: use netdev_priv()
	directly
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

netdev_priv() is an inline function, taking a struct net_device
pointer. When passing in the MII bus->priv, which is a void pointer,
there is no need to go via a local ndev variable to type it first.

Thus, instead of:

	struct net_device *ndev = bus->priv;
	struct stmmac_priv *priv;
...
	priv = netdev_priv(ndev);

we can simply do:

	struct stmmac_priv *priv = netdev_priv(bus->priv);

which simplifies the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 38 +++++--------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 836f2848dfeb..86021e6b67b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -131,12 +131,9 @@ static int stmmac_xgmac2_mdio_read(struct stmmac_priv *priv, u32 addr,
 static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 				       int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
 	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
@@ -150,12 +147,9 @@ static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 static int stmmac_xgmac2_mdio_read_c45(struct mii_bus *bus, int phyaddr,
 				       int devad, int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	stmmac_xgmac2_c45_format(priv, phyaddr, devad, phyreg, &addr);
 
 	return stmmac_xgmac2_mdio_read(priv, addr, MII_XGMAC_BUSY);
@@ -209,12 +203,9 @@ static int stmmac_xgmac2_mdio_write(struct stmmac_priv *priv, u32 addr,
 static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 					int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
 	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
 	    phyaddr > MII_XGMAC_MAX_C22ADDR)
@@ -229,12 +220,9 @@ static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 static int stmmac_xgmac2_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 					int devad, int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv;
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 addr;
 
-	priv = netdev_priv(ndev);
-
 	stmmac_xgmac2_c45_format(priv, phyaddr, devad, phyreg, &addr);
 
 	return stmmac_xgmac2_mdio_write(priv, addr, MII_XGMAC_BUSY,
@@ -274,8 +262,7 @@ static int stmmac_mdio_read(struct stmmac_priv *priv, int data, u32 value)
  */
 static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 value = MII_BUSY;
 	int data = 0;
 
@@ -312,8 +299,7 @@ static int stmmac_mdio_read_c22(struct mii_bus *bus, int phyaddr, int phyreg)
 static int stmmac_mdio_read_c45(struct mii_bus *bus, int phyaddr, int devad,
 				int phyreg)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	u32 value = MII_BUSY;
 	int data = 0;
 
@@ -373,8 +359,7 @@ static int stmmac_mdio_write(struct stmmac_priv *priv, int data, u32 value)
 static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 				 u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
@@ -412,8 +397,7 @@ static int stmmac_mdio_write_c22(struct mii_bus *bus, int phyaddr, int phyreg,
 static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 				 int devad, int phyreg, u16 phydata)
 {
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	int ret, data = phydata;
 	u32 value = MII_BUSY;
 
@@ -452,8 +436,7 @@ static int stmmac_mdio_write_c45(struct mii_bus *bus, int phyaddr,
 int stmmac_mdio_reset(struct mii_bus *bus)
 {
 #if IS_ENABLED(CONFIG_STMMAC_PLATFORM)
-	struct net_device *ndev = bus->priv;
-	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	unsigned int mii_address = priv->hw->mii.addr;
 
 #ifdef CONFIG_OF
@@ -497,12 +480,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 int stmmac_pcs_setup(struct net_device *ndev)
 {
+	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct fwnode_handle *devnode, *pcsnode;
 	struct dw_xpcs *xpcs = NULL;
-	struct stmmac_priv *priv;
 	int addr, ret;
 
-	priv = netdev_priv(ndev);
 	devnode = priv->plat->port_node;
 
 	if (priv->plat->pcs_init) {
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
