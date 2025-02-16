Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E22A3742E
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Feb 2025 13:40:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7226C7802E;
	Sun, 16 Feb 2025 12:40:36 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E00C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 12:40:35 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-46fee2b9c7aso31208411cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 04:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739709634; x=1740314434;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KFRnQlxBlj8MitIqq9TpK3sWiM8HCVYDpiQS/J2Je0=;
 b=M53+ww/mk+QHPrZ+BhT12GcnEyp7GWi+3mGW67mZAmmOnL4wn8rN/mEtRG155u9p4Z
 JdU2ErvrPpcyrJfbfBIduhpRIoWOptwsYezLm466CwMuhvanSd7dvittHOyGRHGSns2Z
 NX+8YqRh/LeV1wU80deGI1NwXMIErOmBY9DD5icypmNX8ITycQeuKxZCNHZdxpLhcYPC
 i85sIhDRYRdpXmoJdzBtYoew87lwCHnW/E86mZFJWJ5iwVm+tApNKF0QhIAwBSE6ojAZ
 1iknptsGbJqnNmsM385kYWhckgDSPEj3Oo/BVv4GAesIS5eF6oP8SxDRVnOFW70kdXad
 +kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739709635; x=1740314435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KFRnQlxBlj8MitIqq9TpK3sWiM8HCVYDpiQS/J2Je0=;
 b=q+YQVdEw6VNp+evZuFd4wEfvqTalcoSjWYm1z2sMohu1leW1TWkWQpBKnU9sKOl+1C
 vLbynU91q+6AJu9eL0M8cnGKNY05Kwtlymhus7eB7Ybpta1sBNANiSDcEwm19p0Octx7
 j7MKGP+1QxPQwVRM/VF2KhZFOV8eSXaL0ejW7CW3a97HuSqCWrfFHfCR/jlYj0E1uqlC
 s7fp6VLq/CBhCK+jFmYyQPUH9H+pk/JveB/dxdmShd6a7OsrtCyTA5zsAqjyUecm0iIL
 iARf8Rdlh3k9fXSi9Uw9YKz8PXfDRiPFc7Wkd1VNjV/StHPTZNJ4kXyhjwOnQCrGpmdD
 GlRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzVcmaNcQRrndNu2YGkkn8vA31nelz0o2JSs3TkRRyaH7y3lCbIrN4PUDCX35dNNPgiw2neKpF0TYhxg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywwvt2PrCNc7lAd0OcQcoMt74+hZh9LvhVzTY/tX3dC5pPWqsGy
 /jjDU1LJ8SZK1ebJBMJ0LlT3yVAXbjWPwLPHNu3rWN5Syc5LE5A8
X-Gm-Gg: ASbGncvXvJLus+9bARmOHRKTLIUpo2L7ncL8X+6gV7gHsLM03h2L10O3fWpDAOIL3cA
 1lVjSpfEcDyJuAAner/eplDKzX2797jU+dKqTyjT6yVJpWQxeGDcXHvMOpoAVxpmJvzNvndVeeD
 4eThP1pz33x1ZMA9MDKWXN/UNbPSX8VQ09MIYQWCDaBcy03g7wzAKHjCw5l6H5xjKpof+xtv8fA
 YUBnEuk0iPryJ8/J4n73O7s0LiBXD6o8TvWNxlKtD45DWTkGwyrfvuKI4VSAvzE7WY=
X-Google-Smtp-Source: AGHT+IHtPqzqpeM26zZRpTzLLu/33zKztkr8vbt8BLSYA3H4NJ3o65rJ7atKUIP33d/TkeRY7YUrcg==
X-Received: by 2002:a05:6214:dc5:b0:6d8:6a74:ae68 with SMTP id
 6a1803df08f44-6e66cd1a6dfmr88111666d6.29.1739709634524; 
 Sun, 16 Feb 2025 04:40:34 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e65d9f3458sm41060086d6.92.2025.02.16.04.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 04:40:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Serge Semin <fancer.lancer@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Sun, 16 Feb 2025 20:39:51 +0800
Message-ID: <20250216123953.1252523-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add glue layer
	for Sophgo SG2044 SoC
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
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 107 ++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 4cc85a36a1ab..b6ff51e1ebce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -181,6 +181,17 @@ config DWMAC_SOCFPGA
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
index b26f0e79c2b3..594883fb4164 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
+obj-$(CONFIG_DWMAC_SOPHGO)	+= dwmac-sophgo.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
 obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
new file mode 100644
index 000000000000..93ea280da6bd
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sophgo DWMAC platform driver
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#include "stmmac_platform.h"
+
+struct sophgo_dwmac {
+	struct device *dev;
+	struct clk *clk_tx;
+};
+
+static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct sophgo_dwmac *dwmac = priv;
+	long rate;
+	int ret;
+
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
+		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		return;
+	}
+
+	ret = clk_set_rate(dwmac->clk_tx, rate);
+	if (ret)
+		dev_err(dwmac->dev, "failed to set tx rate %ld: %pe\n",
+			rate, ERR_PTR(ret));
+}
+
+static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
+				    struct plat_stmmacenet_data *plat_dat,
+				    struct stmmac_resources *stmmac_res)
+{
+	struct sophgo_dwmac *dwmac;
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
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get platform resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "failed to parse DT parameters\n");
+
+	ret = sophgo_sg2044_dwmac_init(pdev, plat_dat, &stmmac_res);
+	if (ret)
+		return ret;
+
+	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
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
+	.remove = stmmac_pltfr_remove,
+	.driver = {
+		.name = "sophgo-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = sophgo_dwmac_match,
+	},
+};
+module_platform_driver(sophgo_dwmac_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
