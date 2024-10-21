Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BF9AE508
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F7F2C78F6B;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96356C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 10:36:56 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e2903a48ef7so4021835276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 03:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729507015; x=1730111815;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svclsiCEeUb5+9t03qJl3db9yymwfO2bBzTcRxMC9P8=;
 b=XDRc4t2pE9x2Vjnz2JRAO/G1tPrLkSNz0fUm5XoQI7zYDipM0cGx0KJZgvpTwCU+4Z
 UfhYNRRAyekwOUC/1Iutmf9qzUrDRtNb3hHXpQYMip2rlwXTEzKZKPUCHQSj8ZoXg2yA
 CKmFEw0wI8PIOyFt/ssC7KbEU1vhz3r/sZQb8+ChHx760+Ant7SEtkqZ89afeFSVvfkS
 OKQ4BuGXcgCGqTPKaqHCYfkmIMMaPsmQudx6FAmea2OZGwwJXzgloEGkgF+TJFE2lau6
 S0c/MH9i08iZYFJthWzCLn1CYsFaqKH+0bvaEWH5k3zJgblBwXmhHAC8ysbywY+gHI/g
 +KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507015; x=1730111815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svclsiCEeUb5+9t03qJl3db9yymwfO2bBzTcRxMC9P8=;
 b=jbhKrUrN60KaHE5bTke7Bx1DEYbsmR6u8kuMUqT9xFKOZXsO1+nzLuXikuh4rm3oQw
 nLAGRTc5i92EFD0iBHlg42bs61U+Q1deXsnaypDL3OfEvf8gahSNF/tT0388HVsnylus
 CPU9panJXgyJQZ4+iHZxFro+27CNrYj+u1jXoCkC9O/IPV3Q9HE/9RkC4ZcuF9hLwLa9
 rHvMIiak8Oh6rkCnlhfMjdAUmYvIrWNQxxJ2et9V9+r9c0WYXlP/BCtYELEKxeUgUiox
 vbW171YNQ33kIK4A7OQa8vE6lQcifCWqzxTh5jcpGEor+UFOGhUGMytepOiuvgeLaE85
 gYPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuZoijJOIemuH1JF9FO5lfP+vWWUGcmtB7OWdzfjqBddb1Eam10oHH2lzjKN8THuAARfCsCfSo5g5MJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHLUdSvIhtDTzwys27JVeHgIQRKfo6DUNGMlP4k5QI4Q7X460z
 P2hjehvAtzFuzqjQRzAOoLxrlyNAlF4KYKEchSVuBL/dZajsYYf8
X-Google-Smtp-Source: AGHT+IHlrA+/dcj1vd4lrPU9QHu+0p+ysA9RIWhCRIkhzXUN8cuwR3GxzlOFB2/p619LdCBVuIUTOA==
X-Received: by 2002:a05:6902:1b8b:b0:e29:1572:6d03 with SMTP id
 3f1490d57ef6-e2bb16cf119mr9061983276.47.1729507015417; 
 Mon, 21 Oct 2024 03:36:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eaeabd8dc8sm2772799a12.77.2024.10.21.03.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:36:55 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 21 Oct 2024 18:36:17 +0800
Message-ID: <20241021103617.653386-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for Sophgo
	SG2044 SoC
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

Adds Sophgo dwmac driver support on the Sophgo SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 132 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..bc44b21c593f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -169,6 +169,17 @@ config DWMAC_SOCFPGA
 	  for the stmmac device driver. This driver is used for
 	  arria5 and cyclone5 FPGA SoCs.
 
+config DWMAC_SOPHGO
+	tristate "Sophgo dwmac support"
+	depends on OF && (ARCH_SOPHGO || COMPILE_TEST)
+	default m if ARCH_SOPHGO
+	help
+	  Support for ethernet controllers on Sophgo RISC-V SoCs
+
+	  This selects the Sophgo SoC specific glue layer support
+	  for the stmmac device driver. This driver is used for the
+	  ethernet controllers on various Sophgo SoCs.
+
 config DWMAC_STARFIVE
 	tristate "StarFive dwmac support"
 	depends on OF && (ARCH_STARFIVE || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..e1287b53047b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
new file mode 100644
index 000000000000..83c67c061182
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sophgo DWMAC platform driver
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ *
+ */
+
+#include <linux/bits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+struct sophgo_dwmac {
+	struct device *dev;
+	struct clk *clk_tx;
+};
+
+#define DWMAC_SG2044_FLAG_USE_RX_DELAY		BIT(16)
+
+static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct sophgo_dwmac *dwmac = priv;
+	unsigned long rate;
+	int ret;
+
+	switch (speed) {
+	case SPEED_1000:
+		rate = 125000000;
+		break;
+	case SPEED_100:
+		rate = 25000000;
+		break;
+	case SPEED_10:
+		rate = 2500000;
+		break;
+	default:
+		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		break;
+	}
+
+	ret = clk_set_rate(dwmac->clk_tx, rate);
+	if (ret)
+		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
+}
+
+static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat_dat,
+				    struct stmmac_resources *stmmac_res)
+{
+	struct sophgo_dwmac *dwmac;
+	struct regmap *regmap;
+	unsigned int args[2];
+	int ret;
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
+	if (IS_ERR(dwmac->clk_tx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
+				     "failed to get tx clock\n");
+
+	regmap = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						      "sophgo,syscon",
+						      2, args);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "failed to get the regmap\n");
+
+	ret = regmap_set_bits(regmap, args[0], DWMAC_SG2044_FLAG_USE_RX_DELAY);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to set the phy rx delay\n");
+
+	dwmac->dev = &pdev->dev;
+	plat_dat->bsp_priv = dwmac;
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->fix_mac_speed = sophgo_dwmac_fix_mac_speed;
+	plat_dat->multicast_filter_bins = 0;
+	plat_dat->unicast_filter_entries = 1;
+
+	return 0;
+}
+
+static int sophgo_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2044-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_dwmac_match);
+
+static struct platform_driver sophgo_dwmac_driver = {
+	.probe  = sophgo_dwmac_probe,
+	.remove_new = stmmac_pltfr_remove,
+	.driver = {
+		.name = "sophgo-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = sophgo_dwmac_match,
+	},
+};
+module_platform_driver(sophgo_dwmac_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
