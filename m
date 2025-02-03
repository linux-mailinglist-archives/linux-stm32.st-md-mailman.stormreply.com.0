Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C5A25217
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 06:43:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 922F1C78F7B;
	Mon,  3 Feb 2025 05:43:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ED03C7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 05:43:58 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-216395e151bso46601585ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Feb 2025 21:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738561436; x=1739166236;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
 b=gu7hkHPQwR/E5lbDnjkmrOony/bi/9fpdtf92cIjr6C4qlkzHv7CY+uJhNpoUyXHpo
 /eqoOtDRzp/G51pfYTV56MaWSSoZyZe/7jFZHS4P5CNjDhXS6I/E7150e9Igz1hSCL0g
 gt3V2GaFPz8PneH/thwyzAt6BdR0jadEukGzdFBVPpX4hmUuli49gRmd+N+sJHlaRtmZ
 qZyJ+G5dMec1ZCS9anQoNAmLsKFOgBDpJZeebq0IkbTjYBMW+sHKU36Y3OZMXvLjdVkp
 Dq6RDA9EkvtNmhqLaUsNmesU22XP8Sr25YzsNZOFHx32kZyDmGWnaMAynNx/Ir1yAqOJ
 EXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738561436; x=1739166236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf/ShRyvxTN8+33G5lApFqsieby0UFmnabOeDI9FQLs=;
 b=CgSHbKng/JIkh+7zvn1JO1hrNCX/cGzF6K/0ZDmMJdNOaXYE3P01+DXFA6usAkOukI
 Bmos2R1ufHgsYbeteiSdlIHPwAAtn+TOVXU+7pZD8nxNV9PsjtfZ95UwXpQuOXkZT5co
 ciHC4Qsc//79B/GWZXpJkTHGAWfjAlEUe65udl8qSG/ZDWQUcTUib2yQJIvfiNA2TbwB
 v/peKtMBetcX7XIJjqQEnCcncyv0vWqMk/yeU6vx8PFb453PKU2YQzMM0ZL77VXevzFU
 x30cdhxbn5z+vRAiBdlKlq00c9PHbNfe3dZ0g2p1udIMFN7QiN/HIU8D+sIitgb/tifn
 jcKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt+4ID9feiuhW6YQp0HfqppPxZ/Eqq2dGTO22tgK6+3ZBTp5jgpP5QlZXN0Gmw8v3i/WcjRnBf53vGQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7VFGUdNxguQzUeIc/9Hwde/XvVsmgsiBNf2TPj+4cF5hFWId0
 OysDkKBYTKxvIehko3SGgs1vNZM70Rk4CdDDI0bQqJc5OJPf2wJD
X-Gm-Gg: ASbGncs/U75aCt5L5gvnHRyxHYHoKP5GvpPnwHGmDlrzTA6tix5y0p6zZ6Y6zIEZOfv
 9CqrqrQO9S+C+p7HlLHows2csodmiTytbnoQBmIXIrLWljzDRkdsndtgalym6d7/LAbbKnpdWWH
 g/ihSPvjz6CSFhU86hKINemlDJeT8sBy8Rizs/5XXFU3cZr4Nt+J9Hq0NZZFu4JUmnWPYcsppNn
 Wu3Ie+Vu1U2HrIw5b0yYAyRy2RDfjL0NiHrbV/vpZkyhtsw6PvbhocprNuess7pErU9X08xB3WE
 RKc69yW+nKOxkOVlnv67HyH2K0zkiLErlySRp5X9h1uZHf/C35Hv6RhL
X-Google-Smtp-Source: AGHT+IEFZ/36yBGHunOCtMy0HzmagZccJHEJhSVPNJSjo1bf8v5C2SzsrkRY+0DkSsg96GNkpYmziQ==
X-Received: by 2002:a17:902:c40e:b0:216:6ef9:60d with SMTP id
 d9443c01a7336-21edd86e506mr222878405ad.23.1738561436434; 
 Sun, 02 Feb 2025 21:43:56 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 21:43:56 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon,  3 Feb 2025 13:42:00 +0800
Message-Id: <20250203054200.21977-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 Andrew Lunn <andrew@lunn.ch>, schung@nuvoton.com, peppe.cavallaro@st.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 3/3] net: stmmac: dwmac-nuvoton:
	Add dwmac glue for Nuvoton MA35 family
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

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

The driver has been tested on the NuMaker-HMI-MA35D1-S1 development board,
and the log is attached below. For more information about the SoCs,
please refer to the MA35D1 series datasheet.

[    0.000000] Machine model: Nuvoton MA35D1-SOM
...
[    1.836386] nuvoton-dwmac 40120000.ethernet: IRQ eth_wake_irq not found
[    1.843039] nuvoton-dwmac 40120000.ethernet: IRQ eth_lpi not found
[    1.849304] nuvoton-dwmac 40120000.ethernet: IRQ sfty not found
[    1.856331] nuvoton-dwmac 40120000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    1.863532] nuvoton-dwmac 40120000.ethernet:         DWMAC1000
[    1.868750] nuvoton-dwmac 40120000.ethernet: DMA HW capability register supported
[    1.876190] nuvoton-dwmac 40120000.ethernet: RX Checksum Offload Engine supported
[    1.883696] nuvoton-dwmac 40120000.ethernet: COE Type 2
[    1.888903] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion supported
[    1.895912] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate descriptors
[    1.902846] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    1.909598] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    1.915406] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    2.540881] nuvoton-dwmac 40130000.ethernet: IRQ eth_wake_irq not found
[    2.547463] nuvoton-dwmac 40130000.ethernet: IRQ eth_lpi not found
[    2.553626] nuvoton-dwmac 40130000.ethernet: IRQ sfty not found
[    2.560015] nuvoton-dwmac 40130000.ethernet: User ID: 0x10, Synopsys ID: 0x37
[    2.567116] nuvoton-dwmac 40130000.ethernet:         DWMAC1000
[    2.572300] nuvoton-dwmac 40130000.ethernet: DMA HW capability register supported
[    2.579747] nuvoton-dwmac 40130000.ethernet: RX Checksum Offload Engine supported
[    2.587198] nuvoton-dwmac 40130000.ethernet: COE Type 2
[    2.592395] nuvoton-dwmac 40130000.ethernet: TX Checksum insertion supported
[    2.599418] nuvoton-dwmac 40130000.ethernet: Enhanced/Alternate descriptors
[    2.606351] nuvoton-dwmac 40130000.ethernet: Enabled extended descriptors
[    2.613109] nuvoton-dwmac 40130000.ethernet: Ring mode enabled
[    2.618918] nuvoton-dwmac 40130000.ethernet: Enable RX Mitigation via HW Watchdog Timer

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..f083a0e97b75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,18 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NUVOTON
+	tristate "Nuvoton MA35 dwmac support"
+	default ARCH_MA35
+	depends on OF && (ARCH_MA35 || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for Ethernet controller on Nuvoton MA35 series SoC.
+
+	  This selects the Nuvoton MA35 series SoC glue layer support
+	  for the stmmac device driver. The nuvoton-dwmac driver is
+	  used for MA35 series SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b26f0e79c2b3..48e25b85ea06 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
new file mode 100644
index 000000000000..588e2f234c5b
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nuvoton DWMAC specific glue layer
+ *
+ * Copyright (C) 2025 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <a0987203069@gmail.com>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+
+#include "stmmac.h"
+#include "stmmac_platform.h"
+
+#define NVT_REG_SYS_GMAC0MISCR  0x108
+#define NVT_REG_SYS_GMAC1MISCR  0x10C
+
+#define NVT_MISCR_RMII          BIT(0)
+
+/* Two thousand picoseconds are evenly mapped to a 4-bit field,
+ * resulting in each step being 2000/15 picoseconds.
+ */
+#define NVT_PATH_DELAY_STEP     134
+#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
+#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
+
+struct nvt_priv_data {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+};
+
+static struct nvt_priv_data *
+nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *bsp_priv;
+	phy_interface_t phy_mode;
+	u32 macid, arg, reg;
+	u32 tx_delay_step;
+	u32 rx_delay_step;
+	u32 miscr;
+
+	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
+	if (!bsp_priv)
+		return ERR_PTR(-ENOMEM);
+
+	bsp_priv->regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
+	if (IS_ERR(bsp_priv->regmap)) {
+		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
+		return ERR_PTR(-ENODEV);
+	}
+	if (macid > 1) {
+		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
+		tx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Tx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay_step = 0;
+	} else {
+		if (arg <= 2000) {
+			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
+		} else {
+			dev_err(dev, "Invalid Rx path delay argument.\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
+	regmap_read(bsp_priv->regmap, miscr, &reg);
+	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
+
+	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
+		dev_err(dev, "missing phy mode property\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		reg &= ~NVT_MISCR_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= NVT_MISCR_RMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!(reg & NVT_MISCR_RMII)) {
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
+		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);
+	}
+
+	regmap_write(bsp_priv->regmap, miscr, reg);
+
+	bsp_priv->pdev = pdev;
+
+	return bsp_priv;
+}
+
+static int nvt_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct nvt_priv_data *priv_data;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return ret;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return PTR_ERR(plat_dat);
+
+	/* Nuvoton DWMAC configs */
+	plat_dat->has_gmac = 1;
+	plat_dat->tx_fifo_size = 2048;
+	plat_dat->rx_fifo_size = 4096;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 8;
+	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
+
+	priv_data = nvt_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(priv_data))
+		return PTR_ERR(priv_data);
+
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	/* The PMT flag is determined by the RWK property.
+	 * However, our hardware is configured to support only MGK.
+	 * This is an override on PMT to enable WoL capability.
+	 */
+	plat_dat->pmt = 1;
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	return 0;
+}
+
+static const struct of_device_id nvt_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
+
+static struct platform_driver nvt_dwmac_driver = {
+	.probe  = nvt_gmac_probe,
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nvt_dwmac_match,
+	},
+};
+module_platform_driver(nvt_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
