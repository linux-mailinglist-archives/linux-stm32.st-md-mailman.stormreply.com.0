Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE079D4183
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20424C7A848;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 645C8C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 05:20:10 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-288642376bcso3321872fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 21:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731475209; x=1732080009;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5353xv9nfR949Aq3luMMcKblmb1cgT053z7RFtTwcFU=;
 b=agTJZG0/6xViBod+nj/INRrn49VZqr5+0rbAN7IbkO9Ot0G6J6lsbM0QJ07oku955N
 T9SL5srHUkdRPe3qlwkFi8gWCxgkWwKeGnAJTGIT2MYeuK87oO55cqYF6Q6U3+t/pFNn
 ZSZ5U+TC6P9eqJGx2gC7Pq4SsZCcYtKm7GZKgAjwqJZD+erSaxLLlgkjgwGJtDwjznbw
 8RkC/QAq+XwZMyI5Tt4LAWxCDvgMxV9AGKvz0vJlzswEYbi8KJOHLijO0hm6RpAOsO3Z
 9jiihMewmtBM/auyHkXo+oc2FUrLKobb12EcTFL716/ux1nR9yob22IbHkY00Qneahv3
 1lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731475209; x=1732080009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5353xv9nfR949Aq3luMMcKblmb1cgT053z7RFtTwcFU=;
 b=ZbruGjlDygRUVsD1FQvNU4yE2TYMdbVmzgIZLDS3hCksgU3Z23WQKR+IXQjz9a9a/6
 q2N4Y1IzquWOqmxkARb26ZYWEJVlteTWsZLW8qO8XVm/z9D/yflyc1t/yP5+wsjYyXyL
 xNZHdccU1qDCVMKvi1Yy/C96e+RYvvy1Kv0LtXOIo92tEhdn3WowEBRQphbq8jHoiDjw
 Z0HcMjkzI8ifx7gMnp/QTzDUvS8A6yYOuwRZ7i2b+ksxIzUFobTxU/WDg6/j6LS5MkOL
 qNkVbl9/zLo+NR35pmxBBIcIEkrfoDZE/qMYPPLCNj5I3oRYZwogZEhAUm7iZEqEv5ri
 mqOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW6dd5tzV1yN+JAcmvixUfl99XkdypKvQ/pSP6so3ytIA+OsQHDpVpB82XllIiTXrTWhH5ifLqe3WjOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTzX5m5+4C0BkBJALmD75VpV6uWnAiSnam4bUrhv5D3y5nzDVw
 Pau5/QXVJzvCWJetFVnCUvC6Afbzp/ZZxnMACLuPyHU5gbYHt1AY
X-Google-Smtp-Source: AGHT+IFA7M9iVYxjJX9yzGaZF33PqN+3je2YxeBLIbH3+k+DhcZianzX1wGkCN8eQ4smDjyciHl1ng==
X-Received: by 2002:a05:6870:230a:b0:254:bd24:de83 with SMTP id
 586e51a60fabf-29560065134mr17026514fac.12.1731475209174; 
 Tue, 12 Nov 2024 21:20:09 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 21:20:08 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Wed, 13 Nov 2024 13:18:57 +0800
Message-Id: <20241113051857.12732-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
	support for MA35 family
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

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 3 files changed, 191 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..55d94f669be3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,17 @@ config DWMAC_MESON
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
+	  for the stmmac device driver.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..c08fcfdd7b31 100644
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
index 000000000000..68c71d2b46f4
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * dwmac-nuvoton.c - Nuvoton MA35 series DWMAC specific glue layer
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ *
+ * Author: Joey Lu <yclu4@nuvoton.com>
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
+#define PATHDLY_DEC         134
+#define TXDLY_OFST          16
+#define TXDLY_MSK           GENMASK(19, 16)
+#define RXDLY_OFST          20
+#define RXDLY_MSK           GENMASK(23, 20)
+
+#define REG_SYS_GMAC0MISCR  0x108
+#define REG_SYS_GMAC1MISCR  0x10C
+
+#define MISCR_RMII          BIT(0)
+
+struct nvt_priv_data {
+	struct platform_device *pdev;
+	struct regmap *regmap;
+};
+
+static struct nvt_priv_data *
+nuvoton_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
+{
+	struct device *dev = &pdev->dev;
+	struct nvt_priv_data *bsp_priv;
+	phy_interface_t phy_mode;
+	u32 tx_delay, rx_delay;
+	u32 macid, arg, reg;
+
+	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
+	if (!bsp_priv)
+		return ERR_PTR(-ENOMEM);
+
+	bsp_priv->regmap =
+		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
+	if (IS_ERR(bsp_priv->regmap)) {
+		dev_err(dev, "Failed to get sys register\n");
+		return ERR_PTR(-ENODEV);
+	}
+	if (macid > 1) {
+		dev_err(dev, "Invalid sys arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
+		tx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg > 0 && arg <= 2000) {
+			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
+			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
+		} else {
+			tx_delay = 0;
+			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
+		}
+	}
+	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
+		rx_delay = 0; /* Default value is 0 */
+	} else {
+		if (arg > 0 && arg <= 2000) {
+			rx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
+			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
+		} else {
+			rx_delay = 0;
+			dev_err(dev, "Invalid Rx path delay argument. Setting to default.\n");
+		}
+	}
+
+	regmap_read(bsp_priv->regmap,
+		    macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, &reg);
+	reg &= ~(TXDLY_MSK | RXDLY_MSK);
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
+		reg &= ~MISCR_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg |= MISCR_RMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!(reg & MISCR_RMII)) {
+		reg |= tx_delay << TXDLY_OFST;
+		reg |= rx_delay << RXDLY_OFST;
+	}
+
+	regmap_write(bsp_priv->regmap,
+		     macid == 0 ? REG_SYS_GMAC0MISCR : REG_SYS_GMAC1MISCR, reg);
+
+	bsp_priv->pdev = pdev;
+
+	return bsp_priv;
+}
+
+static int nuvoton_gmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
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
+	plat_dat->bsp_priv = nuvoton_gmac_setup(pdev, plat_dat);
+	if (IS_ERR(plat_dat->bsp_priv)) {
+		ret = PTR_ERR(plat_dat->bsp_priv);
+		return ret;
+	}
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	/* We support WoL by magic packet, override pmt to make it work! */
+	plat_dat->pmt = 1;
+	dev_info(&pdev->dev, "Wake-Up On Lan supported\n");
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_dwmac_match[] = {
+	{ .compatible = "nuvoton,ma35d1-dwmac"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_dwmac_match);
+
+static struct platform_driver nuvoton_dwmac_driver = {
+	.probe  = nuvoton_gmac_probe,
+	.remove_new = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "nuvoton-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = nuvoton_dwmac_match,
+	},
+};
+module_platform_driver(nuvoton_dwmac_driver);
+
+MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
