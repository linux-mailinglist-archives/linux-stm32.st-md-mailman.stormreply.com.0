Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0D74403E
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jun 2023 18:58:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC90C6B456;
	Fri, 30 Jun 2023 16:58:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28F9FC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 16:58:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1906841f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688144317; x=1690736317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pvu4fKAQ0tzSA1HLZHWmdOfD3AhGAjrR/Ll1y4HIr3g=;
 b=qr5+4nIwjldrvsGryhMYGLJ0OZ3YPZKjPv+OTuAp/4rNWzvkYiUv3O5yz/WzJXzRa6
 KQv/gt2z+CkoeUbaGX1zpGiZIZDi3/KNJDfW5geRr9w8FUrgkurUI4dljqHYFb2HLzRA
 bRkVvPlAnKyKccVD3felM+Q3xqIN+bmqcbjQ65eGbJQk+PyewF+8CU4wu2ZorlFWBrCT
 Aqy0rV7RN/Qph8ZMgN5kVUry9zzQtd08pvcu4b1ITLE+bPCVs/OEiCRLqW4Iy88vxE39
 ZbguzboHfYRuknRWQC8Wkmoy1NyAqglrkA9Xoe8FsTg5CQKTR6k99+zzk6ERh/USH1gy
 Ti/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688144317; x=1690736317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvu4fKAQ0tzSA1HLZHWmdOfD3AhGAjrR/Ll1y4HIr3g=;
 b=kdbXMRuSAEI/o9/Tx93TpRmhIxKXHvpnVFsJP55wOlc1tJmZiitPBeeV8T0Ol4xNt3
 rDVWtBEw+j9IaEoilkDWRD5TJk8mWa+MSUOw9Nfpwt60UAInu/Mo9Sleaqy2qARX8UPl
 3Jx2fGE6xp6LCRsrvMtyRodvuwXpRzAd46G67JT7snUU/xfeGjCzJQSDj0B++Kpuc9xr
 8PKwogaEIV2lMYXOTv2ONgDnrC8Gu3BcYWKgh1tdbm7a5Bx/6LKjLqskBwf6A5wBc8rI
 jJXzsBZgHx30Ou5mQiVGPAFRuF5ibaOtU4he8B4HD0sR8bsDcHj6TFlXLq0HZThcBt73
 6KFQ==
X-Gm-Message-State: AC+VfDyi0dkejaN4L5If1mIuE10+HPTcE8TG9SuyUQIK1poa2AYUb5XS
 lTTDf34mOg93VtdfsAUme26NGw==
X-Google-Smtp-Source: ACHHUZ5fJLXkeHDlekS99srv8CaNw+1WybS+1I3eAvpIdoFsONKseLREnwiIE5G4NEju+Wz8e4zHNQ==
X-Received: by 2002:a5d:4bc3:0:b0:314:99e:af46 with SMTP id
 l3-20020a5d4bc3000000b00314099eaf46mr8051304wrt.20.1688144317723; 
 Fri, 30 Jun 2023 09:58:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:58:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:26 +0200
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-1-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9036;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1hf999g5eEtxLqg8V04tUPdGH+Hq91QPzTw+uaq9mYk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm0FtQDp9YXTDLZeHYHxn9vyusAxAx2Z1sd8aTE
 pfEkqtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtAAKCRB33NvayMhJ0SWoEA
 C1ki9NvMY6YAJTD7BcigSaZFUnNaU3bNIzzoTSAIyg+6TKBlDoXVdGwTbafVx6QhUhwNO3NhCK5A6a
 oyCqgHPD4lFTu9ROCWJ2CL278zqVx1VmcSa+uOlpzKK4YYEaWm3vsa7+U5iVGZ8UAOkHyXdnzO8s8w
 1Dfqra3pX8U+bPlqDir97EjKWcfUDdAdzCU6sHYH2n3tQOnojyMSPnw0UwLguaknlzQjDPs029ARay
 XbH6olhY+PTxvnpFJw0Q5HqUuAv4X4Sq4cyUhfV2s/I9v+m0TAwMF+VVAVg1hmYOwWEhzkbiXYY1xg
 ehVEfeUKR3rsFfUMKYZsyfcHGfn9t+/OKBDm7Zr7tQ6x5e4WWB7R0DuWIdeMDAxJw7hkkP+i86lkor
 BKAR2oZiZpywLv+E9+kDhrys05V3s2hMWkjZcB54j5x75xihTEOkua+Wl3qE6PQIuvXbWzGychMmgA
 tBoNJApM2Rh8CFnosbeCabkduja6txGtKlOtxEoTmLmQIDe26HFznjp8yeBoqw9W5yUjj8W8GsTZZM
 EZ8nbLkV9nJjLOI47CzUJgQbQsZCHsILHByMA8g9mlLN9qs74x5fbf9RtEE9gwQqUTQbHb9eIKjXx7
 3fMabs0tQEqq4OPYpGl4GAhLKjcbpCbtNATt6UR9Mu0l878Fs4XmAloBcWDw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/15] clk: oxnas: remove obsolete clock
	driver
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 clock driver.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/Kconfig     |   7 --
 drivers/clk/Makefile    |   1 -
 drivers/clk/clk-oxnas.c | 251 ------------------------------------------------
 3 files changed, 259 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 93f38a8178ba..59a101e1cf65 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -360,13 +360,6 @@ config COMMON_CLK_PXA
 	help
 	  Support for the Marvell PXA SoC.
 
-config COMMON_CLK_OXNAS
-	bool "Clock driver for the OXNAS SoC Family"
-	depends on ARCH_OXNAS || COMPILE_TEST
-	select MFD_SYSCON
-	help
-	  Support for the OXNAS SoC Family clocks.
-
 config COMMON_CLK_RS9_PCIE
 	tristate "Clock driver for Renesas 9-series PCIe clock generators"
 	depends on I2C
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 7cb000549b61..94155999eba3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_ARCH_MOXART)		+= clk-moxart.o
 obj-$(CONFIG_ARCH_NOMADIK)		+= clk-nomadik.o
 obj-$(CONFIG_ARCH_NPCM7XX)	    	+= clk-npcm7xx.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= clk-nspire.o
-obj-$(CONFIG_COMMON_CLK_OXNAS)		+= clk-oxnas.o
 obj-$(CONFIG_COMMON_CLK_PALMAS)		+= clk-palmas.o
 obj-$(CONFIG_CLK_LS1028A_PLLDIG)	+= clk-plldig.o
 obj-$(CONFIG_COMMON_CLK_PWM)		+= clk-pwm.o
diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
deleted file mode 100644
index 584e293156ad..000000000000
--- a/drivers/clk/clk-oxnas.c
+++ /dev/null
@@ -1,251 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2010 Broadcom
- * Copyright (C) 2012 Stephen Warren
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#include <linux/clk-provider.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/stringify.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
-#include <dt-bindings/clock/oxsemi,ox810se.h>
-#include <dt-bindings/clock/oxsemi,ox820.h>
-
-/* Standard regmap gate clocks */
-struct clk_oxnas_gate {
-	struct clk_hw hw;
-	unsigned int bit;
-	struct regmap *regmap;
-};
-
-struct oxnas_stdclk_data {
-	struct clk_hw_onecell_data *onecell_data;
-	struct clk_oxnas_gate **gates;
-	unsigned int ngates;
-	struct clk_oxnas_pll **plls;
-	unsigned int nplls;
-};
-
-/* Regmap offsets */
-#define CLK_STAT_REGOFFSET	0x24
-#define CLK_SET_REGOFFSET	0x2c
-#define CLK_CLR_REGOFFSET	0x30
-
-static inline struct clk_oxnas_gate *to_clk_oxnas_gate(struct clk_hw *hw)
-{
-	return container_of(hw, struct clk_oxnas_gate, hw);
-}
-
-static int oxnas_clk_gate_is_enabled(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std = to_clk_oxnas_gate(hw);
-	int ret;
-	unsigned int val;
-
-	ret = regmap_read(std->regmap, CLK_STAT_REGOFFSET, &val);
-	if (ret < 0)
-		return ret;
-
-	return val & BIT(std->bit);
-}
-
-static int oxnas_clk_gate_enable(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std = to_clk_oxnas_gate(hw);
-
-	regmap_write(std->regmap, CLK_SET_REGOFFSET, BIT(std->bit));
-
-	return 0;
-}
-
-static void oxnas_clk_gate_disable(struct clk_hw *hw)
-{
-	struct clk_oxnas_gate *std = to_clk_oxnas_gate(hw);
-
-	regmap_write(std->regmap, CLK_CLR_REGOFFSET, BIT(std->bit));
-}
-
-static const struct clk_ops oxnas_clk_gate_ops = {
-	.enable = oxnas_clk_gate_enable,
-	.disable = oxnas_clk_gate_disable,
-	.is_enabled = oxnas_clk_gate_is_enabled,
-};
-
-static const char *const osc_parents[] = {
-	"oscillator",
-};
-
-static const char *const eth_parents[] = {
-	"gmacclk",
-};
-
-#define OXNAS_GATE(_name, _bit, _parents)				\
-struct clk_oxnas_gate _name = {						\
-	.bit = (_bit),							\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name,						\
-		.ops = &oxnas_clk_gate_ops,				\
-		.parent_names = _parents,				\
-		.num_parents = ARRAY_SIZE(_parents),			\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
-	},								\
-}
-
-static OXNAS_GATE(ox810se_leon, 0, osc_parents);
-static OXNAS_GATE(ox810se_dma_sgdma, 1, osc_parents);
-static OXNAS_GATE(ox810se_cipher, 2, osc_parents);
-static OXNAS_GATE(ox810se_sata, 4, osc_parents);
-static OXNAS_GATE(ox810se_audio, 5, osc_parents);
-static OXNAS_GATE(ox810se_usbmph, 6, osc_parents);
-static OXNAS_GATE(ox810se_etha, 7, eth_parents);
-static OXNAS_GATE(ox810se_pciea, 8, osc_parents);
-static OXNAS_GATE(ox810se_nand, 9, osc_parents);
-
-static struct clk_oxnas_gate *ox810se_gates[] = {
-	&ox810se_leon,
-	&ox810se_dma_sgdma,
-	&ox810se_cipher,
-	&ox810se_sata,
-	&ox810se_audio,
-	&ox810se_usbmph,
-	&ox810se_etha,
-	&ox810se_pciea,
-	&ox810se_nand,
-};
-
-static OXNAS_GATE(ox820_leon, 0, osc_parents);
-static OXNAS_GATE(ox820_dma_sgdma, 1, osc_parents);
-static OXNAS_GATE(ox820_cipher, 2, osc_parents);
-static OXNAS_GATE(ox820_sd, 3, osc_parents);
-static OXNAS_GATE(ox820_sata, 4, osc_parents);
-static OXNAS_GATE(ox820_audio, 5, osc_parents);
-static OXNAS_GATE(ox820_usbmph, 6, osc_parents);
-static OXNAS_GATE(ox820_etha, 7, eth_parents);
-static OXNAS_GATE(ox820_pciea, 8, osc_parents);
-static OXNAS_GATE(ox820_nand, 9, osc_parents);
-static OXNAS_GATE(ox820_ethb, 10, eth_parents);
-static OXNAS_GATE(ox820_pcieb, 11, osc_parents);
-static OXNAS_GATE(ox820_ref600, 12, osc_parents);
-static OXNAS_GATE(ox820_usbdev, 13, osc_parents);
-
-static struct clk_oxnas_gate *ox820_gates[] = {
-	&ox820_leon,
-	&ox820_dma_sgdma,
-	&ox820_cipher,
-	&ox820_sd,
-	&ox820_sata,
-	&ox820_audio,
-	&ox820_usbmph,
-	&ox820_etha,
-	&ox820_pciea,
-	&ox820_nand,
-	&ox820_etha,
-	&ox820_pciea,
-	&ox820_ref600,
-	&ox820_usbdev,
-};
-
-static struct clk_hw_onecell_data ox810se_hw_onecell_data = {
-	.hws = {
-		[CLK_810_LEON]	= &ox810se_leon.hw,
-		[CLK_810_DMA_SGDMA]	= &ox810se_dma_sgdma.hw,
-		[CLK_810_CIPHER]	= &ox810se_cipher.hw,
-		[CLK_810_SATA]	= &ox810se_sata.hw,
-		[CLK_810_AUDIO]	= &ox810se_audio.hw,
-		[CLK_810_USBMPH]	= &ox810se_usbmph.hw,
-		[CLK_810_ETHA]	= &ox810se_etha.hw,
-		[CLK_810_PCIEA]	= &ox810se_pciea.hw,
-		[CLK_810_NAND]	= &ox810se_nand.hw,
-	},
-	.num = ARRAY_SIZE(ox810se_gates),
-};
-
-static struct clk_hw_onecell_data ox820_hw_onecell_data = {
-	.hws = {
-		[CLK_820_LEON]	= &ox820_leon.hw,
-		[CLK_820_DMA_SGDMA]	= &ox820_dma_sgdma.hw,
-		[CLK_820_CIPHER]	= &ox820_cipher.hw,
-		[CLK_820_SD]	= &ox820_sd.hw,
-		[CLK_820_SATA]	= &ox820_sata.hw,
-		[CLK_820_AUDIO]	= &ox820_audio.hw,
-		[CLK_820_USBMPH]	= &ox820_usbmph.hw,
-		[CLK_820_ETHA]	= &ox820_etha.hw,
-		[CLK_820_PCIEA]	= &ox820_pciea.hw,
-		[CLK_820_NAND]	= &ox820_nand.hw,
-		[CLK_820_ETHB]	= &ox820_ethb.hw,
-		[CLK_820_PCIEB]	= &ox820_pcieb.hw,
-		[CLK_820_REF600]	= &ox820_ref600.hw,
-		[CLK_820_USBDEV]	= &ox820_usbdev.hw,
-	},
-	.num = ARRAY_SIZE(ox820_gates),
-};
-
-static struct oxnas_stdclk_data ox810se_stdclk_data = {
-	.onecell_data = &ox810se_hw_onecell_data,
-	.gates = ox810se_gates,
-	.ngates = ARRAY_SIZE(ox810se_gates),
-};
-
-static struct oxnas_stdclk_data ox820_stdclk_data = {
-	.onecell_data = &ox820_hw_onecell_data,
-	.gates = ox820_gates,
-	.ngates = ARRAY_SIZE(ox820_gates),
-};
-
-static const struct of_device_id oxnas_stdclk_dt_ids[] = {
-	{ .compatible = "oxsemi,ox810se-stdclk", &ox810se_stdclk_data },
-	{ .compatible = "oxsemi,ox820-stdclk", &ox820_stdclk_data },
-	{ }
-};
-
-static int oxnas_stdclk_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node, *parent_np;
-	const struct oxnas_stdclk_data *data;
-	struct regmap *regmap;
-	int ret;
-	int i;
-
-	data = of_device_get_match_data(&pdev->dev);
-
-	parent_np = of_get_parent(np);
-	regmap = syscon_node_to_regmap(parent_np);
-	of_node_put(parent_np);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "failed to have parent regmap\n");
-		return PTR_ERR(regmap);
-	}
-
-	for (i = 0 ; i < data->ngates ; ++i)
-		data->gates[i]->regmap = regmap;
-
-	for (i = 0; i < data->onecell_data->num; i++) {
-		if (!data->onecell_data->hws[i])
-			continue;
-
-		ret = devm_clk_hw_register(&pdev->dev,
-					   data->onecell_data->hws[i]);
-		if (ret)
-			return ret;
-	}
-
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
-				      data->onecell_data);
-}
-
-static struct platform_driver oxnas_stdclk_driver = {
-	.probe = oxnas_stdclk_probe,
-	.driver	= {
-		.name = "oxnas-stdclk",
-		.suppress_bind_attrs = true,
-		.of_match_table = oxnas_stdclk_dt_ids,
-	},
-};
-builtin_platform_driver(oxnas_stdclk_driver);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
