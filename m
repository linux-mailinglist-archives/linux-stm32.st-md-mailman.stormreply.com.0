Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111870F74B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 15:08:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8293C6B443;
	Wed, 24 May 2023 13:08:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BFAFC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 13:08:16 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8B408FF808;
 Wed, 24 May 2023 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1684933695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8cBm8vRbflanhNIL4+7YQt8sQT/rjU4f7UYp3PXRNg=;
 b=DYJfNBQQXXvmLSY4Uq9WNYdppiesZ4Rk+xDCbBSg7JXlKsAsJW8zAcVx7aHZDWKek+71zH
 V3SF5P/KYQRSBjEbh7ASuHwtvalv+BhCfN00jhWjAN5GrOOR2gddCcPoveyp6dToaOok3j
 Ez76uO26c7kpIjVeuypMsF2f5XkTEsOV2ixFizvYjCMQqJUFgeRRru/jxrR2pryqu41cLH
 xl7fyi8Ybk9wtbBpvK6b6f35+2huLKh7TKLBS1bG16f+1f8ldnS/ior4HObkpVApLMkYJg
 hQG3zKyK30yRqALdX8oQ7/P94Mm9YRbDP1yQRZMkGLb+ranJ7IWsP0NE9vNsqw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	davem@davemloft.net
Date: Wed, 24 May 2023 15:08:04 +0200
Message-Id: <20230524130807.310089-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524130807.310089-1-maxime.chevallier@bootlin.com>
References: <20230524130807.310089-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 1/4] net: mdio: Introduce a
	regmap-based mdio driver
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

There exists several examples today of devices that embed an ethernet
PHY or PCS directly inside an SoC. In this situation, either the device
is controlled through a vendor-specific register set, or sometimes
exposes the standard 802.3 registers that are typically accessed over
MDIO.

As phylib and phylink are designed to use mdiodevices, this driver
allows creating a virtual MDIO bus, that translates mdiodev register
accesses to regmap accesses.

The reason we use regmap is because there are at least 3 such devices
known today, 2 of them are Altera TSE PCS's, memory-mapped, exposed
with a 4-byte stride in stmmac's dwmac-socfpga variant, and a 2-byte
stride in altera-tse. The other one (nxp,sja1110-base-tx-mdio) is
exposed over SPI.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 MAINTAINERS                         |  7 +++
 drivers/net/ethernet/altera/Kconfig |  2 +
 drivers/net/mdio/Kconfig            | 10 ++++
 drivers/net/mdio/Makefile           |  1 +
 drivers/net/mdio/mdio-regmap.c      | 85 +++++++++++++++++++++++++++++
 include/linux/mdio/mdio-regmap.h    | 23 ++++++++
 6 files changed, 128 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-regmap.c
 create mode 100644 include/linux/mdio/mdio-regmap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c25172d6471a..ef8362aa93b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12840,6 +12840,13 @@ F:	Documentation/devicetree/bindings/net/ieee802154/mcr20a.txt
 F:	drivers/net/ieee802154/mcr20a.c
 F:	drivers/net/ieee802154/mcr20a.h
 
+MDIO REGMAP DRIVER
+M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/mdio/mdio-regmap.c
+F:	include/linux/mdio/mdio-regmap.h
+
 MEASUREMENT COMPUTING CIO-DAC IIO DRIVER
 M:	William Breathitt Gray <william.gray@linaro.org>
 L:	linux-iio@vger.kernel.org
diff --git a/drivers/net/ethernet/altera/Kconfig b/drivers/net/ethernet/altera/Kconfig
index dd7fd41ccde5..0a7c0a217536 100644
--- a/drivers/net/ethernet/altera/Kconfig
+++ b/drivers/net/ethernet/altera/Kconfig
@@ -5,6 +5,8 @@ config ALTERA_TSE
 	select PHYLIB
 	select PHYLINK
 	select PCS_ALTERA_TSE
+	select MDIO_REGMAP
+	depends on REGMAP
 	help
 	  This driver supports the Altera Triple-Speed (TSE) Ethernet MAC.
 
diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 9ff2e6f22f3f..aef39c89cf44 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -185,6 +185,16 @@ config MDIO_IPQ8064
 	  This driver supports the MDIO interface found in the network
 	  interface units of the IPQ8064 SoC
 
+config MDIO_REGMAP
+	tristate
+	help
+	  This driver allows using MDIO devices that are not sitting on a
+	  regular MDIO bus, but still exposes the standard 802.3 register
+	  layout. It's regmap-based so that it can be used on integrated,
+	  memory-mapped PHYs, SPI PHYs and so on. A new virtual MDIO bus is
+	  created, and its read/write operations are mapped to the underlying
+	  regmap.
+
 config MDIO_THUNDER
 	tristate "ThunderX SOCs MDIO buses"
 	depends on 64BIT
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 7d4cb4c11e4e..1015f0db4531 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MDIO_MOXART)		+= mdio-moxart.o
 obj-$(CONFIG_MDIO_MSCC_MIIM)		+= mdio-mscc-miim.o
 obj-$(CONFIG_MDIO_MVUSB)		+= mdio-mvusb.o
 obj-$(CONFIG_MDIO_OCTEON)		+= mdio-octeon.o
+obj-$(CONFIG_MDIO_REGMAP)		+= mdio-regmap.o
 obj-$(CONFIG_MDIO_SUN4I)		+= mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)		+= mdio-thunder.o
 obj-$(CONFIG_MDIO_XGENE)		+= mdio-xgene.o
diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
new file mode 100644
index 000000000000..9b8845b18536
--- /dev/null
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Driver for MMIO-Mapped MDIO devices. Some IPs expose internal PHYs or PCS
+ * within the MMIO-mapped area
+ *
+ * Copyright (C) 2023 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ */
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/mdio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mdio/mdio-regmap.h>
+
+#define DRV_NAME "mdio-regmap"
+
+static int mdio_regmap_read_c22(struct mii_bus *bus, int addr, int regnum)
+{
+	struct mdio_regmap_config *ctx = bus->priv;
+	unsigned int val;
+	int ret;
+
+	if (ctx->valid_addr != addr)
+		return -ENODEV;
+
+	ret = regmap_read(ctx->regmap, regnum, &val);
+	if (ret < 0)
+		return ret;
+
+	return val;
+}
+
+static int mdio_regmap_write_c22(struct mii_bus *bus, int addr, int regnum,
+				 u16 val)
+{
+	struct mdio_regmap_config *ctx = bus->priv;
+
+	if (ctx->valid_addr != addr)
+		return -ENODEV;
+
+	return regmap_write(ctx->regmap, regnum, val);
+}
+
+struct mii_bus *devm_mdio_regmap_register(struct device *dev,
+					  const struct mdio_regmap_config *config)
+{
+	struct mdio_regmap_config *mrc;
+	struct mii_bus *mii;
+	int rc;
+
+	if (!config->parent)
+		return ERR_PTR(-EINVAL);
+
+	mii = devm_mdiobus_alloc_size(config->parent, sizeof(*mrc));
+	if (!mii)
+		return ERR_PTR(-ENOMEM);
+
+	mrc = mii->priv;
+	memcpy(mrc, config, sizeof(*mrc));
+
+	mrc->regmap = config->regmap;
+	mrc->valid_addr = config->valid_addr;
+
+	mii->name = DRV_NAME;
+	strscpy(mii->id, config->name, MII_BUS_ID_SIZE);
+	mii->parent = config->parent;
+	mii->read = mdio_regmap_read_c22;
+	mii->write = mdio_regmap_write_c22;
+
+	rc = devm_mdiobus_register(dev, mii);
+	if (rc) {
+		dev_err(config->parent, "Cannot register MDIO bus![%s] (%d)\n", mii->id, rc);
+		return ERR_PTR(rc);
+	}
+
+	return mii;
+}
+EXPORT_SYMBOL_GPL(devm_mdio_regmap_register);
+
+MODULE_DESCRIPTION("MDIO API over regmap");
+MODULE_AUTHOR("Maxime Chevallier <maxime.chevallier@bootlin.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
new file mode 100644
index 000000000000..536a5bfcce35
--- /dev/null
+++ b/include/linux/mdio/mdio-regmap.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Driver for MMIO-Mapped MDIO devices. Some IPs expose internal PHYs or PCS
+ * within the MMIO-mapped area
+ *
+ * Copyright (C) 2023 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ */
+#ifndef MDIO_REGMAP_H
+#define MDIO_REGMAP_H
+
+struct device;
+struct regmap;
+
+struct mdio_regmap_config {
+	struct device *parent;
+	struct regmap *regmap;
+	char name[MII_BUS_ID_SIZE];
+	u32 valid_addr;
+};
+
+struct mii_bus *devm_mdio_regmap_register(struct device *dev,
+					  const struct mdio_regmap_config *config);
+
+#endif
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
