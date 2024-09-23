Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7097ECBA
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 16:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E64C78006;
	Mon, 23 Sep 2024 14:01:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F530C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vxHPbwdu3NrSlbixsV+qQIiHnAwCu34d4pyAiTdjkuw=; b=Yijz3YPogHWGEjrC3klqTlhAQu
 UCCeUL/O7BNb/qHwU8ojKI6RCB+r4SsH0N6Q92Iu4cbPhdIUUBoxi/MpV6NzLZ6oJ0I6PqJ+4kzVf
 OUFDzWi2uX3ZbLR4mLddffoERDCd7a8TXdhvrT/WJ8HasUspI1othd016tenhLPTW6FCo1TmbvCdd
 AZaqllqdyAFNU+3gsBqMSFspd1nl9TKEu6JNZ9i7maoYbFZC8v9DMirCakCcSCR0SGF6FVJDRJ/8k
 OIiu1VWlIScDTJw8L9itzGWV1aTMrmD9mwmpYnZzhJ2ryDqawa8ZKfPOFdpuO5aDeruoePELsiNCl
 QBNTRWZg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34898 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ssjdH-0004JI-1m;
 Mon, 23 Sep 2024 15:01:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ssjdE-005NsR-OU; Mon, 23 Sep 2024 15:01:40 +0100
In-Reply-To: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ssjdE-005NsR-OU@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Sep 2024 15:01:40 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 09/10] net: pcs: xpcs: drop
 interface argument from xpcs_create*()
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

The XPCS sub-driver no longer uses the "interface" argument to the
xpcs_create_mdiodev() and xpcs_create_fwnode() functions. Remove
this now unnecessary argument, updating the stmmac driver
appropriately.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  7 +++----
 drivers/net/pcs/pcs-xpcs.c                        | 10 +++-------
 include/linux/pcs/pcs-xpcs.h                      |  6 ++----
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 03f90676b3ad..0c7d81ddd440 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -500,23 +500,22 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	struct fwnode_handle *devnode, *pcsnode;
 	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
-	int addr, mode, ret;
+	int addr, ret;
 
 	priv = netdev_priv(ndev);
-	mode = priv->plat->phy_interface;
 	devnode = priv->plat->port_node;
 
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
 	} else if (fwnode_property_present(devnode, "pcs-handle")) {
 		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
-		xpcs = xpcs_create_fwnode(pcsnode, mode);
+		xpcs = xpcs_create_fwnode(pcsnode);
 		fwnode_handle_put(pcsnode);
 		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else if (priv->plat->mdio_bus_data &&
 		   priv->plat->mdio_bus_data->pcs_mask) {
 		addr = ffs(priv->plat->mdio_bus_data->pcs_mask) - 1;
-		xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
+		xpcs = xpcs_create_mdiodev(priv->mii, addr);
 		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else {
 		return 0;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 9b61f97222b9..f25e7afdfdf5 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1520,14 +1520,12 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
  * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
  * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
  * @addr: device MDIO-bus ID
- * @interface: requested PHY interface
  *
  * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
  * the PCS device couldn't be found on the bus and other negative errno related
  * to the data allocation and MDIO-bus communications.
  */
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface)
+struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr)
 {
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
@@ -1554,7 +1552,7 @@ struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr)
 {
 	struct dw_xpcs *xpcs;
 
-	xpcs = xpcs_create_mdiodev(bus, addr, PHY_INTERFACE_MODE_NA);
+	xpcs = xpcs_create_mdiodev(bus, addr);
 	if (IS_ERR(xpcs))
 		return ERR_CAST(xpcs);
 
@@ -1565,7 +1563,6 @@ EXPORT_SYMBOL_GPL(xpcs_create_pcs_mdiodev);
 /**
  * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
  * @fwnode: fwnode handle poining to the DW XPCS device
- * @interface: requested PHY interface
  *
  * Return: a pointer to the DW XPCS handle if successful, otherwise -ENODEV if
  * the fwnode device is unavailable or the PCS device couldn't be found on the
@@ -1573,8 +1570,7 @@ EXPORT_SYMBOL_GPL(xpcs_create_pcs_mdiodev);
  * other negative errno related to the data allocations and MDIO-bus
  * communications.
  */
-struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
-				   phy_interface_t interface)
+struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode)
 {
 	struct mdio_device *mdiodev;
 	struct dw_xpcs *xpcs;
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index a4e2243ce647..758daabb76c7 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -72,10 +72,8 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
-				    phy_interface_t interface);
-struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
-				   phy_interface_t interface);
+struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr);
+struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 struct phylink_pcs *xpcs_create_pcs_mdiodev(struct mii_bus *bus, int addr);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
