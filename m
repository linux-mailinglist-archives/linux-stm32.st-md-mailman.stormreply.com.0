Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF6A89EB5
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73F76C78F83;
	Tue, 15 Apr 2025 12:56:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4491C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:56:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394a823036so54909045e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744721812; x=1745326612;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
 b=DFvPGxecvgR2eQsuymJRfmlY3DDYtQ0pYdxafpAoa5BNGsTNgRi6mU2+K89NoNH5ve
 kpnwEElyvtgGMV/toGmEaL0/pAa1wq51uVEO0HxbBESjZLwSeGKfPVE50r0kyWV1zSSZ
 iNp4JVy7+CkwKBT/WFnDl10OTAxgnDeqtU1uTwiKueYNdqomSJxQQdLuSB6CufZvii65
 wUyU2Ck5MAQwrX4OahwJjcyLizuCJEc6A6t3UxY9F4OkXwyNmSug8s8Im/yMos8s4Wmn
 fsfvcm43nh4zT+qCYpKNQjlJ0R2MGMObtLvG0oGmGJYu2QXA8OrubhEhiRyZ5eoUiAXQ
 bG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721812; x=1745326612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=os69xApG4J/eUJVtkfaP7Pm1DMV7TS+WoXn/btx4EnY=;
 b=Yh1x+ufX1OdPOtPqeB/7iPtzu5Hvg5156Dt8Wy5n2zTK00X/+bjUJ+cK4jgZU5Agi9
 gm1RibGJCf48kdEAjRXyaoE0PGYcRM17YwIpaadJSAL/MggQtzScyVEZ2r2yS55LsWa2
 p6PzwpmrOccr5YxEXLowAYbF8F+KvlOtd6G6LNCeX2smqwh9xgZRnMmSyTgv+f5aMzQG
 CejoMM+TtoQh9iIBSN7JsiuX2LBQwqrsFkDozr+0JA5emHeutJzGphxDKOWkBOg6h1aQ
 PXcXBkwWz9yXT3sdnEWPeNJmCHoi5HvmKEX4+kxwxiXZTtrRO4jir4AtMAnhGn3uXMFh
 687g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURiukc2a+IIR1HHWddjxvUJw3cZvraLGjl0r8evsvj8938+wuXglIhmDyQMzjhGT0QDv+/xssr4zU10A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyfq0TiQwNLh2+doVDpWZmxXkUocqyFyGkJp5ve8Gfijvux6Sop
 ceIwbI0Msx8famPLqUoov17YuTykwrPQRZTHTUp1uJCg2Nqr/1eo
X-Gm-Gg: ASbGncvfTjaok8dVtMr5x9luql/kFR1PEUNjEXqLQHhsZZmnuOoH2Q+vTLWbcyc14XE
 2hGikeX5buMj2wjXPcDWBWcDi5FrSUSuRKlFN8k8NvHUmvM3mV6095AW2klvOFXfQLOCfDyrFE/
 F3Oj/MNSFX1qztv6vEOL2RjrfO6ttM4lIlIZjbQTCuF1oKya1RQ6O8/4yJgb2kAjumdT1YSoVti
 PETpzr4JWtAA2sPJ4aNmI4TFgMMF/akoX3MyKFz2DM34PUO/hAsFxoxQ3I7rPPGx2Xi+P5CYqBf
 uwiPeaj/et7HADZ6Z6QarWI87Lc8mx1BbLjJWW5mu9mvjBYZshwquS/Am31DqEfm
X-Google-Smtp-Source: AGHT+IHM99iCt9uGoM1ut7bwj22u5iPsrbMzCmzAjPLvhvpnLXPGkQlOQNK8dR5lm5kw+uFojdnLkg==
X-Received: by 2002:a05:600c:674a:b0:43c:efed:733e with SMTP id
 5b1f17b1804b1-43f4da84f37mr86587135e9.14.1744721812206; 
 Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:56:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue, 15 Apr 2025 13:56:41 +0100
Message-ID: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue
	layer for Renesas GBETH
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 3c820ef56775..2c99b23f0faa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
 	  This selects the Qualcomm ETHQOS glue layer support for the
 	  stmmac device driver.
 
+config DWMAC_RENESAS_GBETH
+	tristate "Renesas RZ/V2H(P) GBETH support"
+	default ARCH_RENESAS
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	help
+	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
+	  RZ/V2H(P) SoCs.
+
+	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
+	  for the stmmac device driver.
+
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 594883fb4164..91050215511b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
+obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
 obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
new file mode 100644
index 000000000000..8674b7605d83
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
+ *
+ * The Rx and Tx clocks are supplied as follows for the GBETH IP.
+ *
+ *                         Rx / Tx
+ *   -------+------------- on / off -------
+ *          |
+ *          |            Rx-180 / Tx-180
+ *          +---- not ---- on / off -------
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "stmmac_platform.h"
+
+struct renesas_gbeth {
+	struct plat_stmmacenet_data *plat_dat;
+	struct reset_control *rstc;
+	struct device *dev;
+	void __iomem *regs;
+};
+
+static const char *const renesas_gbeth_clks[] = {
+	"tx", "tx-180", "rx", "rx-180",
+};
+
+static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool enabled)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	int ret;
+
+	plat_dat = gbeth->plat_dat;
+	if (enabled) {
+		ret = reset_control_deassert(gbeth->rstc);
+		if (ret) {
+			dev_err(gbeth->dev, "Reset deassert failed\n");
+			return ret;
+		}
+
+		ret = clk_bulk_prepare_enable(plat_dat->num_clks,
+					      plat_dat->clks);
+		if (ret)
+			reset_control_assert(gbeth->rstc);
+	} else {
+		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
+		ret = reset_control_assert(gbeth->rstc);
+		if (ret)
+			dev_err(gbeth->dev, "Reset assert failed\n");
+	}
+
+	return ret;
+}
+
+static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
+{
+	return renesas_gbeth_clks_config(priv, true);
+}
+
+static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
+{
+	renesas_gbeth_clks_config(priv, false);
+}
+
+static int renesas_gbeth_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct device *dev = &pdev->dev;
+	struct renesas_gbeth *gbeth;
+	unsigned int i;
+	int err;
+
+	err = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "failed to get resources\n");
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
+
+	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
+	if (!gbeth)
+		return -ENOMEM;
+
+	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
+				      sizeof(*plat_dat->clks), GFP_KERNEL);
+	if (!plat_dat->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < plat_dat->num_clks; i++)
+		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+
+	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
+	if (err < 0)
+		return err;
+
+	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
+	if (!plat_dat->clk_tx_i)
+		return dev_err_probe(dev, -EINVAL,
+				     "error finding tx clock\n");
+
+	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(gbeth->rstc))
+		return PTR_ERR(gbeth->rstc);
+
+	gbeth->dev = dev;
+	gbeth->regs = stmmac_res.addr;
+	gbeth->plat_dat = plat_dat;
+	plat_dat->bsp_priv = gbeth;
+	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	plat_dat->init = renesas_gbeth_init;
+	plat_dat->exit = renesas_gbeth_exit;
+	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
+
+static struct platform_driver renesas_gbeth_driver = {
+	.probe  = renesas_gbeth_probe,
+	.driver = {
+		.name		= "renesas-gbeth",
+		.of_match_table	= renesas_gbeth_match,
+	},
+};
+module_platform_driver(renesas_gbeth_driver);
+
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
+MODULE_LICENSE("GPL");
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
