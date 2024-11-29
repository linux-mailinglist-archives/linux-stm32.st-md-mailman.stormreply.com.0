Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F189D78A6
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 23:43:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92E5C78F72;
	Sun, 24 Nov 2024 22:43:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A31B3C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 22:43:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3349A4108C;
 Sun, 24 Nov 2024 22:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB421C4DDEE;
 Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732488195;
 bh=AnO4R5j10w0FZih8smewfXdNr/fzYaVAE8TD7GxYUsA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MPguFaZSADD7Jdwoqp4SeJQnctrcUAkcHeVi98nHiL00sy5Su93jvVHEj/HMxZcXr
 ntP7k8zQXWqhatJRuxLTFIJTqhxvUeXYXIcYdqfa4yUwoHBHJmDZefXh8lsvFr5/31
 IN4Hk8+Y3zRO5gMvh0c1ZdM5caI0ukwQ4coFIcG1RnVwY4zS61NboLYiJzTJH+4U0h
 hVZ6zHFnpGsPnq1XjO9uR4CrfZ1wz6pEtnj2shM1Z9qrHVGZFuZtyDY+/cXlt3Zaeh
 fIgASDzCWRSzdRlR02yMjo/bWBRghtfBNaFSUTz/KtZPaiZY5+Vt0vCA3Q+DdX+jHe
 XIFV5IBw/mGjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id CFA73D3B7C7;
 Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:45 +0100
MIME-Version: 1.0
Message-Id: <20241124-upstream_s32cc_gmac-v6-14-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=7205;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=qUYNPbDOjNkOyElyWl7BlSsQNIBb0+hkETF3fWGpFIs=;
 b=2Ie4RB9PaId1khBTCg8rrz3vMbaIgM65drv1QHPsz435k4xW5wXVmNUGsaIP6ndamm37O5rD9
 4NEukT9tjXKCNBZcMdb/28s2TWkoB12y6xk82/TS+m/sdaKHh6AbkOk
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v6 14/15] net: stmmac: dwmac-s32:
 add basic NXP S32G/S32R glue driver
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.

The basic driver supports only RGMII interface.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig     |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile    |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 189 ++++++++++++++++++++++++
 3 files changed, 202 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 6658536a4e17..4cc85a36a1ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -154,6 +154,18 @@ config DWMAC_RZN1
 	  the stmmac device driver. This support can make use of a custom MII
 	  converter PCS device.
 
+config DWMAC_S32
+	tristate "NXP S32G/S32R GMAC support"
+	default ARCH_S32
+	depends on OF && (ARCH_S32 || COMPILE_TEST)
+	help
+	  Support for ethernet controller on NXP S32CC SOCs.
+
+	  This selects NXP SoC glue layer support for the stmmac
+	  device driver. This driver is used for the S32CC series
+	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
+	  S32R45.
+
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
 	default ARCH_INTEL_SOCFPGA
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 2389fd261344..b26f0e79c2b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
+obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
new file mode 100644
index 000000000000..1853a6b26e46
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NXP S32G/R GMAC glue layer
+ *
+ * Copyright 2019-2024 NXP
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/ethtool.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/of_address.h>
+#include <linux/phy.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
+
+/* SoC PHY interface control register */
+#define PHY_INTF_SEL_MII	0x00
+#define PHY_INTF_SEL_SGMII	0x01
+#define PHY_INTF_SEL_RGMII	0x02
+#define PHY_INTF_SEL_RMII	0x08
+
+struct s32_priv_data {
+	void __iomem *ioaddr;
+	void __iomem *ctrl_sts;
+	struct device *dev;
+	phy_interface_t *intf_mode;
+	struct clk *tx_clk;
+	struct clk *rx_clk;
+};
+
+static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
+{
+	writel(PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+
+	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
+
+	return 0;
+}
+
+static int s32_gmac_init(struct platform_device *pdev, void *priv)
+{
+	struct s32_priv_data *gmac = priv;
+	int ret;
+
+	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
+	if (!ret)
+		ret = clk_prepare_enable(gmac->tx_clk);
+
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set tx clock\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(gmac->rx_clk);
+	if (ret) {
+		clk_disable_unprepare(gmac->tx_clk);
+		dev_err(&pdev->dev, "Can't set rx clock\n");
+		return ret;
+	}
+
+	ret = s32_gmac_write_phy_intf_select(gmac);
+	if (ret) {
+		clk_disable_unprepare(gmac->tx_clk);
+		clk_disable_unprepare(gmac->rx_clk);
+		dev_err(&pdev->dev, "Can't set PHY interface mode\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void s32_gmac_exit(struct platform_device *pdev, void *priv)
+{
+	struct s32_priv_data *gmac = priv;
+
+	clk_disable_unprepare(gmac->tx_clk);
+	clk_disable_unprepare(gmac->rx_clk);
+}
+
+static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct s32_priv_data *gmac = priv;
+	long tx_clk_rate;
+	int ret;
+
+	tx_clk_rate = rgmii_clock(speed);
+	if (tx_clk_rate < 0) {
+		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
+		return;
+	}
+
+	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
+	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
+	if (ret)
+		dev_err(gmac->dev, "Can't set tx clock\n");
+}
+
+static int s32_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+	struct device *dev = &pdev->dev;
+	struct stmmac_resources res;
+	struct s32_priv_data *gmac;
+	int ret;
+
+	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
+	if (!gmac)
+		return -ENOMEM;
+
+	gmac->dev = &pdev->dev;
+
+	ret = stmmac_get_platform_resources(pdev, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get platform resources\n");
+
+	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	/* PHY interface mode control reg */
+	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+	if (IS_ERR(gmac->ctrl_sts))
+		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+				     "S32CC config region is missing\n");
+
+	/* tx clock */
+	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
+	if (IS_ERR(gmac->tx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->tx_clk),
+				     "tx clock not found\n");
+
+	/* rx clock */
+	gmac->rx_clk = devm_clk_get(&pdev->dev, "rx");
+	if (IS_ERR(gmac->rx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->rx_clk),
+				     "rx clock not found\n");
+
+	gmac->intf_mode = &plat->phy_interface;
+	gmac->ioaddr = res.addr;
+
+	/* S32CC core feature set */
+	plat->has_gmac4 = true;
+	plat->pmt = 1;
+	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat->rx_fifo_size = 20480;
+	plat->tx_fifo_size = 20480;
+
+	plat->init = s32_gmac_init;
+	plat->exit = s32_gmac_exit;
+	plat->fix_mac_speed = s32_fix_mac_speed;
+
+	plat->bsp_priv = gmac;
+
+	return stmmac_pltfr_probe(pdev, plat, &res);
+}
+
+static const struct of_device_id s32_dwmac_match[] = {
+	{ .compatible = "nxp,s32g2-dwmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s32_dwmac_match);
+
+static struct platform_driver s32_dwmac_driver = {
+	.probe = s32_dwmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "s32-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = s32_dwmac_match,
+	},
+};
+module_platform_driver(s32_dwmac_driver);
+
+MODULE_AUTHOR("Jan Petrous (OSS) <jan.petrous@oss.nxp.com>");
+MODULE_DESCRIPTION("NXP S32G/R common chassis GMAC driver");
+MODULE_LICENSE("GPL");
+

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
