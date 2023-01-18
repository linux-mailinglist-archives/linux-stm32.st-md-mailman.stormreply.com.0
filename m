Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6A671860
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 11:01:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7D64C65E72;
	Wed, 18 Jan 2023 10:01:49 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A4C9C65E6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 10:01:46 +0000 (UTC)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 2C9B91670;
 Wed, 18 Jan 2023 11:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1674036105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sGIMeo0xOf+3HRghClVH+PZ/YqsQ1nE+ZFy+ze4Ous=;
 b=NHUX7muhruWGH3lnBOr/S/uqJpQ+U4zAk0U/A2nUwtxZLpL0RBfibHeDxRw5e4aOxxUbaD
 ya4muCRnd7Qu8R6EFopsvjujS/YdUdBgnZ0tnHqOwJCw9JcOMy4z3FtmH2468mjwN0agCf
 rEbaTvNKyxHEULtle3rEqhPxjH3Ool1Y11EUiJU4wlfX66sx9tKtKRm7a0zunpNLv9/B/H
 ueF1cQy679mgce3HqSBI6T5peevtcxc5KhX7JlcC0zgQ5wyJYTikR9hNKhPH8mFPLOdjth
 LJGAUxVuGg8AX6A8skIK3qhwxOgrAS8x/biP8JqsHA7NN36fOSzrnJcwOx7dXQ==
From: Michael Walle <michael@walle.cc>
Date: Wed, 18 Jan 2023 11:01:36 +0100
MIME-Version: 1.0
Message-Id: <20230116-net-next-remove-probe-capabilities-v2-2-15513b05e1f4@walle.cc>
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
X-Mailer: b4 0.11.1
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/6] net: mdio: Rework scanning of
	bus ready for quirks
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

Some C22 PHYs do bad things when there are C45 transactions on the
bus. In order to handle this, the bus needs to be scanned first for
C22 at all addresses, and then C45 scanned for all addresses.

The Marvell pxa168 driver scans a specific address on the bus to find
its PHY. This is a C22 only device, so update it to use the c22
helper.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
---
v2:
 [mw] Avoid the use of unitialized variabe. Thanks Jakub.
      Just iterate over all possible addresses in the error path.
---
 drivers/net/ethernet/marvell/pxa168_eth.c |   2 +-
 drivers/net/phy/mdio_bus.c                | 125 ++++++++++++++++++++----------
 include/linux/phy.h                       |   2 +-
 3 files changed, 88 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index cf456d62677f..87fff539d39d 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -965,7 +965,7 @@ static int pxa168_init_phy(struct net_device *dev)
 	if (dev->phydev)
 		return 0;
 
-	phy = mdiobus_scan(pep->smi_bus, pep->phy_addr);
+	phy = mdiobus_scan_c22(pep->smi_bus, pep->phy_addr);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
 
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 61c33c6098a1..667247f661c5 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -506,38 +506,12 @@ static int mdiobus_create_device(struct mii_bus *bus,
 	return ret;
 }
 
-/**
- * mdiobus_scan - scan a bus for MDIO devices.
- * @bus: mii_bus to scan
- * @addr: address on bus to scan
- *
- * This function scans the MDIO bus, looking for devices which can be
- * identified using a vendor/product ID in registers 2 and 3. Not all
- * MDIO devices have such registers, but PHY devices typically
- * do. Hence this function assumes anything found is a PHY, or can be
- * treated as a PHY. Other MDIO devices, such as switches, will
- * probably not be found during the scan.
- */
-struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
+static struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr, bool c45)
 {
 	struct phy_device *phydev = ERR_PTR(-ENODEV);
 	int err;
 
-	switch (bus->probe_capabilities) {
-	case MDIOBUS_NO_CAP:
-	case MDIOBUS_C22:
-		phydev = get_phy_device(bus, addr, false);
-		break;
-	case MDIOBUS_C45:
-		phydev = get_phy_device(bus, addr, true);
-		break;
-	case MDIOBUS_C22_C45:
-		phydev = get_phy_device(bus, addr, false);
-		if (IS_ERR(phydev))
-			phydev = get_phy_device(bus, addr, true);
-		break;
-	}
-
+	phydev = get_phy_device(bus, addr, c45);
 	if (IS_ERR(phydev))
 		return phydev;
 
@@ -554,7 +528,77 @@ struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
 
 	return phydev;
 }
-EXPORT_SYMBOL(mdiobus_scan);
+
+/**
+ * mdiobus_scan_c22 - scan one address on a bus for C22 MDIO devices.
+ * @bus: mii_bus to scan
+ * @addr: address on bus to scan
+ *
+ * This function scans one address on the MDIO bus, looking for
+ * devices which can be identified using a vendor/product ID in
+ * registers 2 and 3. Not all MDIO devices have such registers, but
+ * PHY devices typically do. Hence this function assumes anything
+ * found is a PHY, or can be treated as a PHY. Other MDIO devices,
+ * such as switches, will probably not be found during the scan.
+ */
+struct phy_device *mdiobus_scan_c22(struct mii_bus *bus, int addr)
+{
+	return mdiobus_scan(bus, addr, false);
+}
+EXPORT_SYMBOL(mdiobus_scan_c22);
+
+/**
+ * mdiobus_scan_c45 - scan one address on a bus for C45 MDIO devices.
+ * @bus: mii_bus to scan
+ * @addr: address on bus to scan
+ *
+ * This function scans one address on the MDIO bus, looking for
+ * devices which can be identified using a vendor/product ID in
+ * registers 2 and 3. Not all MDIO devices have such registers, but
+ * PHY devices typically do. Hence this function assumes anything
+ * found is a PHY, or can be treated as a PHY. Other MDIO devices,
+ * such as switches, will probably not be found during the scan.
+ */
+static struct phy_device *mdiobus_scan_c45(struct mii_bus *bus, int addr)
+{
+	return mdiobus_scan(bus, addr, true);
+}
+
+static int mdiobus_scan_bus_c22(struct mii_bus *bus)
+{
+	int i;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
+		if ((bus->phy_mask & BIT(i)) == 0) {
+			struct phy_device *phydev;
+
+			phydev = mdiobus_scan_c22(bus, i);
+			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
+				return PTR_ERR(phydev);
+		}
+	}
+	return 0;
+}
+
+static int mdiobus_scan_bus_c45(struct mii_bus *bus)
+{
+	int i;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
+		if ((bus->phy_mask & BIT(i)) == 0) {
+			struct phy_device *phydev;
+
+			/* Don't scan C45 if we already have a C22 device */
+			if (bus->mdio_map[i])
+				continue;
+
+			phydev = mdiobus_scan_c45(bus, i);
+			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
+				return PTR_ERR(phydev);
+		}
+	}
+	return 0;
+}
 
 /**
  * __mdiobus_register - bring up all the PHYs on a given bus and attach them to bus
@@ -639,16 +683,19 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 			goto error_reset_gpiod;
 	}
 
-	for (i = 0; i < PHY_MAX_ADDR; i++) {
-		if ((bus->phy_mask & BIT(i)) == 0) {
-			struct phy_device *phydev;
+	if (bus->probe_capabilities == MDIOBUS_NO_CAP ||
+	    bus->probe_capabilities == MDIOBUS_C22 ||
+	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+		err = mdiobus_scan_bus_c22(bus);
+		if (err)
+			goto error;
+	}
 
-			phydev = mdiobus_scan(bus, i);
-			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV)) {
-				err = PTR_ERR(phydev);
-				goto error;
-			}
-		}
+	if (bus->probe_capabilities == MDIOBUS_C45 ||
+	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+		err = mdiobus_scan_bus_c45(bus);
+		if (err)
+			goto error;
 	}
 
 	mdiobus_setup_mdiodev_from_board_info(bus, mdiobus_create_device);
@@ -658,7 +705,7 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 	return 0;
 
 error:
-	while (--i >= 0) {
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
 		mdiodev = bus->mdio_map[i];
 		if (!mdiodev)
 			continue;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index b3cf1e08e880..fceaac0fb319 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -464,7 +464,7 @@ static inline struct mii_bus *devm_mdiobus_alloc(struct device *dev)
 }
 
 struct mii_bus *mdio_find_bus(const char *mdio_name);
-struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr);
+struct phy_device *mdiobus_scan_c22(struct mii_bus *bus, int addr);
 
 #define PHY_INTERRUPT_DISABLED	false
 #define PHY_INTERRUPT_ENABLED	true

-- 
2.30.2
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
