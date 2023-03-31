Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3496D1A20
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:35:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2928AC6A5FB;
	Fri, 31 Mar 2023 08:35:10 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58EA8C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:35:08 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r11so21577706wrr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wyeKmakvQ1hkSbEX4Ij16MupXpQFelz4/2NYVgWuJEU=;
 b=zClFd5Vlxi7e28KuIdUeqTBp1gtaAf//uuz3h43rioEByZfX20BHjwgCWryxHTo+9i
 oWtko8Ixqknbs450gQiNdzgPyJimKEQS8qc/dtfvgsqCDKLQqr6yI900pjhX/qGMFZdX
 E9YiCGD7wJEMaP2livuoEdQ3bY4d1sZa49exj5qQSZvqCNDpuRGe68UZyI6Xua/Z9nt1
 a5+zKV2l3pR4RD+Kel2t/PZXyj7R7YgcnFPa4uM70rQY8XI8A3moL7BiabGuEw6lZAtT
 fhJgPmMUIhLlGzDOshxVzvMD+/1i7AaQ78yMnrrXECZVdQNAju2O9I0ysOGtmNk5iTB6
 qXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyeKmakvQ1hkSbEX4Ij16MupXpQFelz4/2NYVgWuJEU=;
 b=LX7B/iX1Ac4qk5XPLeI/4+AoH+AAt4UvOo6RLB63Z57cKUOfldCJns2yvVLxHiZAQf
 Vi45LchKyR1wgNDkvuELMvDANxIkSfcXdv9VeRyKuvpJ9dzBrqZHRhgrGc7pL+KDgCp0
 UAD0jz/j7nzj1GYJzxG9mP68Ykm+1kfl/SoBkN/8zq5WO3xBvXKElG/k5gYYKlzLywtZ
 pmPUzfXxctCS5QooQOwQyy6FmWNZKQuvsL9tpv+IpgaFHJVDF9Eyqa9PBZA3ZLRQ9lv4
 VHu63XFdPVAA/Xli+ZI/Mdcm0Q3af6bo+RGWaKNpxsN5a+d+SR6HoaZHwjJFMLteC/4r
 KDlQ==
X-Gm-Message-State: AAQBX9fso3VbdhffW1Ta/zpEYVa8PWPzJmdsGJq5hf1OnEW0SkbofEu4
 o0j/ZOqTOfi9robo/eHCzQCUmw==
X-Google-Smtp-Source: AKy350ZgpW5+Oe3dbmzsCW6vw7rhJNBdmiyWR1Pp/d0MnEm1IxdpSh8x2o9HxYqyhz/1afKGjly3uQ==
X-Received: by 2002:a5d:538e:0:b0:2d5:ac9e:cdde with SMTP id
 d14-20020a5d538e000000b002d5ac9ecddemr18097313wrv.51.1680251707922; 
 Fri, 31 Mar 2023 01:35:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:35:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:55 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-17-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 17/20] reset: oxnas: remove obsolete reset
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 peripheral reset.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/reset/oxnas,reset.txt      |  32 ------
 drivers/reset/Kconfig                              |   3 -
 drivers/reset/Makefile                             |   1 -
 drivers/reset/reset-oxnas.c                        | 114 ---------------------
 4 files changed, 150 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/oxnas,reset.txt b/Documentation/devicetree/bindings/reset/oxnas,reset.txt
deleted file mode 100644
index d27ccb5d04fc..000000000000
--- a/Documentation/devicetree/bindings/reset/oxnas,reset.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Oxford Semiconductor OXNAS SoC Family RESET Controller
-================================================
-
-Please also refer to reset.txt in this directory for common reset
-controller binding usage.
-
-Required properties:
-- compatible: For OX810SE, should be "oxsemi,ox810se-reset"
-	      For OX820, should be "oxsemi,ox820-reset"
-- #reset-cells: 1, see below
-
-Parent node should have the following properties :
-- compatible: For OX810SE, should be :
-			"oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-	      For OX820, should be :
-			"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
-
-Reset indices are in dt-bindings include files :
-- For OX810SE: include/dt-bindings/reset/oxsemi,ox810se.h
-- For OX820: include/dt-bindings/reset/oxsemi,ox820.h
-
-example:
-
-sys: sys-ctrl@000000 {
-	compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-	reg = <0x000000 0x100000>;
-
-	reset: reset-controller {
-		compatible = "oxsemi,ox810se-reset";
-		#reset-cells = <1>;
-	};
-};
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2a52c990d4fe..695419d888ab 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -143,9 +143,6 @@ config RESET_NPCM
 	  This enables the reset controller driver for Nuvoton NPCM
 	  BMC SoCs.
 
-config RESET_OXNAS
-	bool
-
 config RESET_PISTACHIO
 	bool "Pistachio Reset Driver"
 	depends on MIPS || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e7e5fd633a8..cb1f229e20a6 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
-obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
diff --git a/drivers/reset/reset-oxnas.c b/drivers/reset/reset-oxnas.c
deleted file mode 100644
index 8209f922dc16..000000000000
--- a/drivers/reset/reset-oxnas.c
+++ /dev/null
@@ -1,114 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Oxford Semiconductor Reset Controller driver
- *
- * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
- * Copyright (C) 2014 Ma Haijun <mahaijuns@gmail.com>
- * Copyright (C) 2009 Oxford Semiconductor Ltd
- */
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/reset-controller.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/types.h>
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
-/* Regmap offsets */
-#define RST_SET_REGOFFSET	0x34
-#define RST_CLR_REGOFFSET	0x38
-
-struct oxnas_reset {
-	struct regmap *regmap;
-	struct reset_controller_dev rcdev;
-};
-
-static int oxnas_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	struct oxnas_reset *data =
-		container_of(rcdev, struct oxnas_reset, rcdev);
-
-	regmap_write(data->regmap, RST_SET_REGOFFSET, BIT(id));
-	msleep(50);
-	regmap_write(data->regmap, RST_CLR_REGOFFSET, BIT(id));
-
-	return 0;
-}
-
-static int oxnas_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	struct oxnas_reset *data =
-		container_of(rcdev, struct oxnas_reset, rcdev);
-
-	regmap_write(data->regmap, RST_SET_REGOFFSET, BIT(id));
-
-	return 0;
-}
-
-static int oxnas_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct oxnas_reset *data =
-		container_of(rcdev, struct oxnas_reset, rcdev);
-
-	regmap_write(data->regmap, RST_CLR_REGOFFSET, BIT(id));
-
-	return 0;
-}
-
-static const struct reset_control_ops oxnas_reset_ops = {
-	.reset		= oxnas_reset_reset,
-	.assert		= oxnas_reset_assert,
-	.deassert	= oxnas_reset_deassert,
-};
-
-static const struct of_device_id oxnas_reset_dt_ids[] = {
-	 { .compatible = "oxsemi,ox810se-reset", },
-	 { .compatible = "oxsemi,ox820-reset", },
-	 { /* sentinel */ },
-};
-
-static int oxnas_reset_probe(struct platform_device *pdev)
-{
-	struct oxnas_reset *data;
-	struct device *parent;
-
-	parent = pdev->dev.parent;
-	if (!parent) {
-		dev_err(&pdev->dev, "no parent\n");
-		return -ENODEV;
-	}
-
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->regmap = syscon_node_to_regmap(parent->of_node);
-	if (IS_ERR(data->regmap)) {
-		dev_err(&pdev->dev, "failed to get parent regmap\n");
-		return PTR_ERR(data->regmap);
-	}
-
-	platform_set_drvdata(pdev, data);
-
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = 32;
-	data->rcdev.ops = &oxnas_reset_ops;
-	data->rcdev.of_node = pdev->dev.of_node;
-
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
-}
-
-static struct platform_driver oxnas_reset_driver = {
-	.probe	= oxnas_reset_probe,
-	.driver = {
-		.name		= "oxnas-reset",
-		.of_match_table	= oxnas_reset_dt_ids,
-	},
-};
-builtin_platform_driver(oxnas_reset_driver);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
