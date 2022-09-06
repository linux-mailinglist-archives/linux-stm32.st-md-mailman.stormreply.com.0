Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4E5AF3A2
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 20:35:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B882C63326;
	Tue,  6 Sep 2022 18:35:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C3D2C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 18:35:05 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id x1so7778150plv.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Qv7vr9hnlWPJCQbWCubbxvr7dX1UFw3F8MYYEI1by0g=;
 b=Mz0MdMZDEGT5vR197DGR6zwttYMpvkEWvq22F7MToy76uIYP2muNZ0snvsZHaVgv7P
 jV2aRPG3FFPyrbGrJHgjBmWkKzmYjauq2uKEVplqOnFi8jY+MLqWwWHhp5Dueuwiul4A
 mvL5fmXV6WAOHtYR6MXd/sJSqp8NctJCC2Mj0uTQFp6b8XdOtViLHQSF5fWoKXeN0biW
 VlVRDMi/MCtGvXYiwEieDCHDbNw5WTTB2W5xzVPvN6orARGRUrwheYouCPto0cfbIC8m
 TlxNb1fjlTrcBDqXrib1IKv1FwFsrYxAiiLGHYhiKhTLkP/9ITr1JdeUx3nTl5I7IYgl
 uNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Qv7vr9hnlWPJCQbWCubbxvr7dX1UFw3F8MYYEI1by0g=;
 b=l802oDcJ08YFFHknmCDXtr6HeOlaHEyZ8/IZDqKh7a836V3isS/RsMvDLRHWET2HWH
 ViA8apQcgR4QO8o6VnpfSQcZP9bK2i5/f1r/MxL9cLEBWmPJSjANlXAxutH0WrA2Keu7
 VqCQ7uVYvSbUuIq71s3nj9QgpCy7PzFefZksw6pHK/nsxYHuqgHSiG/fwCSISfoDp6wq
 rJWWkOi4DTspPXMR1u6QMEjspciKpNDrvsKMUEufZ4Jk6xOsgQJkci+hfGgbnPIsfvY8
 1yldyIY2Ah9m4d53InGgBOv+52iWGdtytZo3GgG+l95MncyGSrBzREi7orm+yDCUdLY9
 me+g==
X-Gm-Message-State: ACgBeo396MbxnlB5+Zq95kJJnacXEyPFJWUksUau5bkV7H3uIERZR4ue
 NevlOWy1CvgL3d1LGkJaGhE=
X-Google-Smtp-Source: AA6agR61r4MuX3r6sIQoB66/rvq8hkX+StGN4IgVkM4CTKlkH4yuvF8dXMVkTHOZMgfR9c3r94IJkQ==
X-Received: by 2002:a17:90b:3144:b0:1f5:2c6d:7dea with SMTP id
 ip4-20020a17090b314400b001f52c6d7deamr25642211pjb.220.1662489304003; 
 Tue, 06 Sep 2022 11:35:04 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 w128-20020a626286000000b0053dc56afd3csm4807504pfb.219.2022.09.06.11.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:35:03 -0700 (PDT)
Date: Tue, 6 Sep 2022 11:35:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Message-ID: <YxeS1BK2OBH1P/kO@google.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] mfd: stmpe: switch to using gpiod API
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

This patch switches the driver away from legacy gpio/of_gpio API to
gpiod API, and removes use of of_get_named_gpio_flags() which I want to
make private to gpiolib.

We also need to patch relevant DTS files, as the original code relied on
the fact that of_get_named_gpio_flags() would fetch any data encoded in
GPIO flags, even if it does not reflect valid flags for a GPIO.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v1->v2:
 - add DTS changes, as noticed by Francesco Dolcini.

I guess we could do a dance of changing stmpe to check the flags coming
from DTS and try to distinguish IRQ flags from proper GPIO flags, then
have a separate patch changing DTSes, and finally a 2nd patch to stmpe
to use GPIOD API, but I am hoping we could apply this in one go...

 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi |  2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi      |  2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi     |  2 +-
 drivers/mfd/stmpe.c                        | 36 ++++++++--------------
 4 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 380f22a35821..a1bcd67fa505 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -993,7 +993,7 @@ ldo8_reg: ldo8 {
 		touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
-			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
+			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
 			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 9bdc4cb71449..99d7dad72d29 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -976,7 +976,7 @@ ldo8_reg: ldo8 {
 		touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
-			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
+			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
 			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 310dff05910d..2867a138e011 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -849,7 +849,7 @@ ldo8_reg: ldo8 {
 		touchscreen@41 {
 			compatible = "st,stmpe811";
 			reg = <0x41>;
-			irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;
+			irq-gpio = <&gpio TEGRA_GPIO(V, 0) GPIO_ACTIVE_LOW>;
 			interrupt-controller;
 			id = <0>;
 			blocks = <0x5>;
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 987e251d90ae..0c4f74197d3e 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -8,14 +8,13 @@
  */
 
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/mfd/core.h>
@@ -30,17 +29,12 @@
  * @irq_trigger: IRQ trigger to use for the interrupt to the host
  * @autosleep: bool to enable/disable stmpe autosleep
  * @autosleep_timeout: inactivity timeout in milliseconds for autosleep
- * @irq_over_gpio: true if gpio is used to get irq
- * @irq_gpio: gpio number over which irq will be requested (significant only if
- *	      irq_over_gpio is true)
  */
 struct stmpe_platform_data {
 	int id;
 	unsigned int blocks;
 	unsigned int irq_trigger;
 	bool autosleep;
-	bool irq_over_gpio;
-	int irq_gpio;
 	int autosleep_timeout;
 };
 
@@ -1349,13 +1343,6 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	if (pdata->id < 0)
 		pdata->id = -1;
 
-	pdata->irq_gpio = of_get_named_gpio_flags(np, "irq-gpio", 0,
-				&pdata->irq_trigger);
-	if (gpio_is_valid(pdata->irq_gpio))
-		pdata->irq_over_gpio = 1;
-	else
-		pdata->irq_trigger = IRQF_TRIGGER_NONE;
-
 	of_property_read_u32(np, "st,autosleep-timeout",
 			&pdata->autosleep_timeout);
 
@@ -1381,6 +1368,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	struct stmpe_platform_data *pdata;
 	struct device_node *np = ci->dev->of_node;
 	struct stmpe *stmpe;
+	struct gpio_desc *irq_gpio;
 	int ret;
 	u32 val;
 
@@ -1434,18 +1422,20 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	if (ci->init)
 		ci->init(stmpe);
 
-	if (pdata->irq_over_gpio) {
-		ret = devm_gpio_request_one(ci->dev, pdata->irq_gpio,
-				GPIOF_DIR_IN, "stmpe");
-		if (ret) {
-			dev_err(stmpe->dev, "failed to request IRQ GPIO: %d\n",
-					ret);
-			return ret;
-		}
+	irq_gpio = devm_gpiod_get_optional(ci->dev, "irq", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(irq_gpio);
+	if (ret) {
+		dev_err(stmpe->dev, "failed to request IRQ GPIO: %d\n", ret);
+		return ret;
+	}
 
-		stmpe->irq = gpio_to_irq(pdata->irq_gpio);
+	if (irq_gpio) {
+		stmpe->irq = gpiod_to_irq(irq_gpio);
+		pdata->irq_trigger = gpiod_is_active_low(irq_gpio) ?
+					IRQF_TRIGGER_LOW : IRQF_TRIGGER_HIGH;
 	} else {
 		stmpe->irq = ci->irq;
+		pdata->irq_trigger = IRQF_TRIGGER_NONE;
 	}
 
 	if (stmpe->irq < 0) {
-- 
2.37.2.789.g6183377224-goog


-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
