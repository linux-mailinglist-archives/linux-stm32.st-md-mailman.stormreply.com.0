Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CA6678D9
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 16:15:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89BF3C6904C;
	Thu, 12 Jan 2023 15:15:31 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6DBEC69054
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:15:28 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 1682519E1;
 Thu, 12 Jan 2023 16:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1673536528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M63+6MCstsrkrL79YC4nH8Ygb4Uiw61YneTbHbcZv4o=;
 b=HCr8AYDbVE/BRcy4f1FgkMaJKmd3QIOm1dWxMogbOow4MoeU6V239gDO62iCVAPmvK1Mpy
 d2a6tV9WARK31SJCS7hSczdPDHEu4UuYLxrzhoC/F5Awfj4TZLW1g704BhLwnLKJNeY5ck
 z2IZ2tFclfnGyEwbM3nNUbof4zg6F2PtlDadtm3JbgkrNqJ4a7i40Nq6wbZ6dcnJDzzPJe
 QUONECMSdmK2GgwMsBj7Dn337At3tlUQpK3PZNXLcE/17f3Xo9ivObRFWdck1EjuqSi+LY
 aL4urJi5AL/U9GatVV/eeVh9QcVy/BUy3D2yk5yJBJb+wGoND3qlh6W+CYcaaQ==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:16 +0100
MIME-Version: 1.0
Message-Id: <20230112-net-next-c45-seperation-part-2-v1-10-5eeaae931526@walle.cc>
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Li Yang <leoyang.li@nxp.com>
X-Mailer: b4 0.11.1
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/10] enetc: Separate C22 and C45
	transactions
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

From: Andrew Lunn <andrew@lunn.ch>

The enetc MDIO bus driver can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new API calls where appropriate.

This driver is shared with the Felix DSA switch, so update that at the
same time.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/dsa/ocelot/felix_vsc9959.c             |   6 +-
 drivers/net/ethernet/freescale/enetc/enetc_mdio.c  | 119 +++++++++++++++------
 .../net/ethernet/freescale/enetc/enetc_pci_mdio.c  |   6 +-
 drivers/net/ethernet/freescale/enetc/enetc_pf.c    |  12 ++-
 include/linux/fsl/enetc_mdio.h                     |  21 +++-
 5 files changed, 121 insertions(+), 43 deletions(-)

diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index 01ac70fd7ddf..cbcc457499f3 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -954,8 +954,10 @@ static int vsc9959_mdio_bus_alloc(struct ocelot *ocelot)
 		return -ENOMEM;
 
 	bus->name = "VSC9959 internal MDIO bus";
-	bus->read = enetc_mdio_read;
-	bus->write = enetc_mdio_write;
+	bus->read = enetc_mdio_read_c22;
+	bus->write = enetc_mdio_write_c22;
+	bus->read_c45 = enetc_mdio_read_c45;
+	bus->write_c45 = enetc_mdio_write_c45;
 	bus->parent = dev;
 	mdio_priv = bus->priv;
 	mdio_priv->hw = hw;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
index 1c8f5cc6dec4..998aaa394e9c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
@@ -55,7 +55,8 @@ static int enetc_mdio_wait_complete(struct enetc_mdio_priv *mdio_priv)
 				  is_busy, !is_busy, 10, 10 * 1000);
 }
 
-int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum, u16 value)
+int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id, int regnum,
+			 u16 value)
 {
 	struct enetc_mdio_priv *mdio_priv = bus->priv;
 	u32 mdio_ctl, mdio_cfg;
@@ -63,14 +64,39 @@ int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum, u16 value)
 	int ret;
 
 	mdio_cfg = ENETC_EMDIO_CFG;
-	if (regnum & MII_ADDR_C45) {
-		dev_addr = (regnum >> 16) & 0x1f;
-		mdio_cfg |= MDIO_CFG_ENC45;
-	} else {
-		/* clause 22 (ie 1G) */
-		dev_addr = regnum & 0x1f;
-		mdio_cfg &= ~MDIO_CFG_ENC45;
-	}
+	dev_addr = regnum & 0x1f;
+	mdio_cfg &= ~MDIO_CFG_ENC45;
+
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CFG, mdio_cfg);
+
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
+
+	/* set port and dev addr */
+	mdio_ctl = MDIO_CTL_PORT_ADDR(phy_id) | MDIO_CTL_DEV_ADDR(dev_addr);
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl);
+
+	/* write the value */
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_DATA, value);
+
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(enetc_mdio_write_c22);
+
+int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id, int dev_addr,
+			 int regnum, u16 value)
+{
+	struct enetc_mdio_priv *mdio_priv = bus->priv;
+	u32 mdio_ctl, mdio_cfg;
+	int ret;
+
+	mdio_cfg = ENETC_EMDIO_CFG;
+	mdio_cfg |= MDIO_CFG_ENC45;
 
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CFG, mdio_cfg);
 
@@ -83,13 +109,11 @@ int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum, u16 value)
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl);
 
 	/* set the register address */
-	if (regnum & MII_ADDR_C45) {
-		enetc_mdio_wr(mdio_priv, ENETC_MDIO_ADDR, regnum & 0xffff);
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_ADDR, regnum & 0xffff);
 
-		ret = enetc_mdio_wait_complete(mdio_priv);
-		if (ret)
-			return ret;
-	}
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
 
 	/* write the value */
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_DATA, value);
@@ -100,9 +124,9 @@ int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum, u16 value)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(enetc_mdio_write);
+EXPORT_SYMBOL_GPL(enetc_mdio_write_c45);
 
-int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
+int enetc_mdio_read_c22(struct mii_bus *bus, int phy_id, int regnum)
 {
 	struct enetc_mdio_priv *mdio_priv = bus->priv;
 	u32 mdio_ctl, mdio_cfg;
@@ -110,14 +134,51 @@ int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 	int ret;
 
 	mdio_cfg = ENETC_EMDIO_CFG;
-	if (regnum & MII_ADDR_C45) {
-		dev_addr = (regnum >> 16) & 0x1f;
-		mdio_cfg |= MDIO_CFG_ENC45;
-	} else {
-		dev_addr = regnum & 0x1f;
-		mdio_cfg &= ~MDIO_CFG_ENC45;
+	dev_addr = regnum & 0x1f;
+	mdio_cfg &= ~MDIO_CFG_ENC45;
+
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CFG, mdio_cfg);
+
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
+
+	/* set port and device addr */
+	mdio_ctl = MDIO_CTL_PORT_ADDR(phy_id) | MDIO_CTL_DEV_ADDR(dev_addr);
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl);
+
+	/* initiate the read */
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl | MDIO_CTL_READ);
+
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
+
+	/* return all Fs if nothing was there */
+	if (enetc_mdio_rd(mdio_priv, ENETC_MDIO_CFG) & MDIO_CFG_RD_ER) {
+		dev_dbg(&bus->dev,
+			"Error while reading PHY%d reg at %d.%d\n",
+			phy_id, dev_addr, regnum);
+		return 0xffff;
 	}
 
+	value = enetc_mdio_rd(mdio_priv, ENETC_MDIO_DATA) & 0xffff;
+
+	return value;
+}
+EXPORT_SYMBOL_GPL(enetc_mdio_read_c22);
+
+int enetc_mdio_read_c45(struct mii_bus *bus, int phy_id, int dev_addr,
+			int regnum)
+{
+	struct enetc_mdio_priv *mdio_priv = bus->priv;
+	u32 mdio_ctl, mdio_cfg;
+	u16 value;
+	int ret;
+
+	mdio_cfg = ENETC_EMDIO_CFG;
+	mdio_cfg |= MDIO_CFG_ENC45;
+
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CFG, mdio_cfg);
 
 	ret = enetc_mdio_wait_complete(mdio_priv);
@@ -129,13 +190,11 @@ int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl);
 
 	/* set the register address */
-	if (regnum & MII_ADDR_C45) {
-		enetc_mdio_wr(mdio_priv, ENETC_MDIO_ADDR, regnum & 0xffff);
+	enetc_mdio_wr(mdio_priv, ENETC_MDIO_ADDR, regnum & 0xffff);
 
-		ret = enetc_mdio_wait_complete(mdio_priv);
-		if (ret)
-			return ret;
-	}
+	ret = enetc_mdio_wait_complete(mdio_priv);
+	if (ret)
+		return ret;
 
 	/* initiate the read */
 	enetc_mdio_wr(mdio_priv, ENETC_MDIO_CTL, mdio_ctl | MDIO_CTL_READ);
@@ -156,7 +215,7 @@ int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
 
 	return value;
 }
-EXPORT_SYMBOL_GPL(enetc_mdio_read);
+EXPORT_SYMBOL_GPL(enetc_mdio_read_c45);
 
 struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
 {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
index dafb26f81f95..a1b595bd7993 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pci_mdio.c
@@ -39,8 +39,10 @@ static int enetc_pci_mdio_probe(struct pci_dev *pdev,
 	}
 
 	bus->name = ENETC_MDIO_BUS_NAME;
-	bus->read = enetc_mdio_read;
-	bus->write = enetc_mdio_write;
+	bus->read = enetc_mdio_read_c22;
+	bus->write = enetc_mdio_write_c22;
+	bus->read_c45 = enetc_mdio_read_c45;
+	bus->write_c45 = enetc_mdio_write_c45;
 	bus->parent = dev;
 	mdio_priv = bus->priv;
 	mdio_priv->hw = hw;
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 9f6c4f5c0a6c..bc012deedab4 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -848,8 +848,10 @@ static int enetc_mdio_probe(struct enetc_pf *pf, struct device_node *np)
 		return -ENOMEM;
 
 	bus->name = "Freescale ENETC MDIO Bus";
-	bus->read = enetc_mdio_read;
-	bus->write = enetc_mdio_write;
+	bus->read = enetc_mdio_read_c22;
+	bus->write = enetc_mdio_write_c22;
+	bus->read_c45 = enetc_mdio_read_c45;
+	bus->write_c45 = enetc_mdio_write_c45;
 	bus->parent = dev;
 	mdio_priv = bus->priv;
 	mdio_priv->hw = &pf->si->hw;
@@ -885,8 +887,10 @@ static int enetc_imdio_create(struct enetc_pf *pf)
 		return -ENOMEM;
 
 	bus->name = "Freescale ENETC internal MDIO Bus";
-	bus->read = enetc_mdio_read;
-	bus->write = enetc_mdio_write;
+	bus->read = enetc_mdio_read_c22;
+	bus->write = enetc_mdio_write_c22;
+	bus->read_c45 = enetc_mdio_read_c45;
+	bus->write_c45 = enetc_mdio_write_c45;
 	bus->parent = dev;
 	bus->phy_mask = ~0;
 	mdio_priv = bus->priv;
diff --git a/include/linux/fsl/enetc_mdio.h b/include/linux/fsl/enetc_mdio.h
index 2d9203314865..df25fffdc0ae 100644
--- a/include/linux/fsl/enetc_mdio.h
+++ b/include/linux/fsl/enetc_mdio.h
@@ -37,16 +37,27 @@ struct enetc_mdio_priv {
 
 #if IS_REACHABLE(CONFIG_FSL_ENETC_MDIO)
 
-int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum);
-int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum, u16 value);
+int enetc_mdio_read_c22(struct mii_bus *bus, int phy_id, int regnum);
+int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id, int regnum,
+			 u16 value);
+int enetc_mdio_read_c45(struct mii_bus *bus, int phy_id, int devad, int regnum);
+int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id, int devad, int regnum,
+			 u16 value);
 struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs);
 
 #else
 
-static inline int enetc_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
+static inline int enetc_mdio_read_c22(struct mii_bus *bus, int phy_id,
+				      int regnum)
 { return -EINVAL; }
-static inline int enetc_mdio_write(struct mii_bus *bus, int phy_id, int regnum,
-				   u16 value)
+static inline int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id,
+				       int regnum, u16 value)
+{ return -EINVAL; }
+static inline int enetc_mdio_read_c45(struct mii_bus *bus, int phy_id,
+				      int devad, int regnum)
+{ return -EINVAL; }
+static inline int enetc_mdio_write_c45(struct mii_bus *bus, int phy_id,
+				       int devad, int regnum, u16 value)
 { return -EINVAL; }
 struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iomem *port_regs)
 { return ERR_PTR(-EINVAL); }

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
