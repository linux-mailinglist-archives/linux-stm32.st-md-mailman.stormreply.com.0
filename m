Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D524EEB71
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 12:35:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1951C6049C;
	Fri,  1 Apr 2022 10:35:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 297AFC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809355; x=1680345355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQJeoHDjZLYzGmOrK+oBTqEppFS7ObLysie7MCABhco=;
 b=HaPZ64esIpdexrAYxBCxxAkCWpbD7zf8hsOPJeJR6yOdcoLrkjLvhw7R
 K7YbCZW8Z/5mIGegsK7PqyUbdS98V+Qo3d5ACfxeS+1ULqyHf0h2qdtiD
 hkQLpSxDwFT4zx/2rQjGUEx6ukbhqKU3eRvmhJDR4GGMzpfnTtcsJff1g
 E87O6C52p6rKFCIMYI/p9JZP46BypqisIo8V+Sx3Nc638S+cwPKgy8CfE
 mOlM+zW7wYvVkne02rYvoBsm+7RGDLKIB9liD7BCBITzjzxX43QXhXv7t
 Z7v8+oHJFd6yLSaMftGKweMMK59nHQw07E90js+gPbMEbBT5xub+eg8Ko g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260281431"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="260281431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="606673270"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2022 03:35:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C344620B; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  1 Apr 2022 13:35:55 +0300
Message-Id: <20220401103604.8705-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v4 04/13] pinctrl: stm32: Switch to use
	for_each_gpiochip_node() helper
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

Switch the code to use for_each_gpiochip_node() helper.

While at it, in order to avoid additional churn in the future,
switch to fwnode APIs where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 72 ++++++++++++---------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 91b9a64b649e..09952c463f67 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1215,13 +1216,12 @@ static const struct pinconf_ops stm32_pconf_ops = {
 	.pin_config_dbg_show	= stm32_pconf_dbg_show,
 };
 
-static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
-	struct device_node *np)
+static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode_handle *fwnode)
 {
 	struct stm32_gpio_bank *bank = &pctl->banks[pctl->nbanks];
 	int bank_ioport_nr;
 	struct pinctrl_gpio_range *range = &bank->range;
-	struct of_phandle_args args;
+	struct fwnode_reference_args args;
 	struct device *dev = pctl->dev;
 	struct resource res;
 	int npins = STM32_GPIO_PINS_PER_BANK;
@@ -1230,7 +1230,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	if (!IS_ERR(bank->rstc))
 		reset_control_deassert(bank->rstc);
 
-	if (of_address_to_resource(np, 0, &res))
+	if (of_address_to_resource(to_of_node(fwnode), 0, &res))
 		return -ENODEV;
 
 	bank->base = devm_ioremap_resource(dev, &res);
@@ -1245,15 +1245,15 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 
 	bank->gpio_chip = stm32_gpio_template;
 
-	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
+	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
 
-	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
+	if (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, i, &args)) {
 		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
 		bank->gpio_chip.base = args.args[1];
 
 		/* get the last defined gpio line (offset + nb of pins) */
 		npins = args.args[0] + args.args[2];
-		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, ++i, &args))
+		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
 			npins = max(npins, (int)(args.args[0] + args.args[2]));
 	} else {
 		bank_nr = pctl->nbanks;
@@ -1268,20 +1268,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 				       &pctl->banks[bank_nr].range);
 	}
 
-	if (of_property_read_u32(np, "st,bank-ioport", &bank_ioport_nr))
+	if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
 		bank_ioport_nr = bank_nr;
 
 	bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
 
 	bank->gpio_chip.ngpio = npins;
-	bank->gpio_chip.of_node = np;
+	bank->gpio_chip.fwnode = fwnode;
 	bank->gpio_chip.parent = dev;
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	spin_lock_init(&bank->lock);
 
 	/* create irq hierarchical domain */
-	bank->fwnode = of_node_to_fwnode(np);
+	bank->fwnode = fwnode;
 
 	bank->domain = irq_domain_create_hierarchy(pctl->domain, 0,
 					STM32_GPIO_IRQ_LINE, bank->fwnode,
@@ -1418,7 +1418,7 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
@@ -1525,40 +1525,34 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
+		struct device_node *np = to_of_node(child);
 
-		if (of_property_read_bool(child, "gpio-controller")) {
-			bank->rstc = of_reset_control_get_exclusive(child,
-								    NULL);
-			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
-				of_node_put(child);
-				return -EPROBE_DEFER;
-			}
-
-			bank->clk = of_clk_get_by_name(child, NULL);
-			if (IS_ERR(bank->clk)) {
-				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get clk (%ld)\n",
-						PTR_ERR(bank->clk));
-				of_node_put(child);
-				return PTR_ERR(bank->clk);
-			}
-			i++;
+		bank->rstc = of_reset_control_get_exclusive(np, NULL);
+		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
+			fwnode_handle_put(child);
+			return -EPROBE_DEFER;
 		}
-	}
 
-	for_each_available_child_of_node(np, child) {
-		if (of_property_read_bool(child, "gpio-controller")) {
-			ret = stm32_gpiolib_register_bank(pctl, child);
-			if (ret) {
-				of_node_put(child);
-				return ret;
-			}
+		bank->clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(bank->clk)) {
+			if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
+				dev_err(dev, "failed to get clk (%ld)\n", PTR_ERR(bank->clk));
+			fwnode_handle_put(child);
+			return PTR_ERR(bank->clk);
+		}
+		i++;
+	}
 
-			pctl->nbanks++;
+	for_each_gpiochip_node(dev, child) {
+		ret = stm32_gpiolib_register_bank(pctl, child);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
 		}
+
+		pctl->nbanks++;
 	}
 
 	dev_info(dev, "Pinctrl STM32 initialized\n");
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
