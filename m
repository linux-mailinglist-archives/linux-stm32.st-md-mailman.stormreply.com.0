Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 329AF4EB065
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E823CC628A2;
	Tue, 29 Mar 2022 15:29:29 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A20DBC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567766; x=1680103766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W+IP0ugtBZoN9WwC/3gHuhgkJJpzkCJxYwfn4NdIErE=;
 b=YSpnVyePvWAxm6hUzG/kYZflWT9wHKJumgJIzI9nWQLp1i5Ug1QEwn30
 Y2s8aJFstjBNauvDu0URWHf8JZzcN5pffaANbltcrDGaTdc9LpT6h8LSU
 ZCSZkMYjsxUf9zc4kzhIALPNYh0lIOVFTEFQVQ96Hge1qcOTQxMoTVGjV
 WWeLwPNvxWsvyxDeMkBloJvpom/R98b0aX8DqbCPT9g8kLQQ2mz1/FSD5
 WIrV78jmsb9ejSsRKPqk/oNUjjoGTmpCfY28GhBFxlFyq9B+C5+4beqoe
 Jx7V8ZFP+gZhw8NVm6T0QubgwVsQh+Kl69/o/A8Fr3A44h56mEQziF5oV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259248439"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259248439"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554297181"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 427B5239; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:18 +0300
Message-Id: <20220329152926.50958-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nancy Yuen <yuenn@google.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: [Linux-stm32] [PATCH v2 05/13] pinctrl: samsung: Switch to use
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
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 8eb423193680..8eb0aa1de595 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
@@ -966,7 +967,7 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		gc->base = bank->grange.base;
 		gc->ngpio = bank->nr_pins;
 		gc->parent = &pdev->dev;
-		gc->of_node = bank->of_node;
+		gc->fwnode = bank->fwnode;
 		gc->label = bank->name;
 
 		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
@@ -1002,27 +1003,25 @@ samsung_pinctrl_get_soc_data_for_of_alias(struct platform_device *pdev)
 	return &(of_data->ctrl[id]);
 }
 
-static void samsung_banks_of_node_put(struct samsung_pinctrl_drv_data *d)
+static void samsung_banks_node_put(struct samsung_pinctrl_drv_data *d)
 {
 	struct samsung_pin_bank *bank;
 	unsigned int i;
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank)
-		of_node_put(bank->of_node);
+		fwnode_handle_put(bank->fwnode);
 }
 
 /*
  * Iterate over all driver pin banks to find one matching the name of node,
  * skipping optional "-gpio" node suffix. When found, assign node to the bank.
  */
-static void samsung_banks_of_node_get(struct device *dev,
-				      struct samsung_pinctrl_drv_data *d,
-				      struct device_node *node)
+static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
 {
 	const char *suffix = "-gpio-bank";
 	struct samsung_pin_bank *bank;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	/* Pin bank names are up to 4 characters */
 	char node_name[20];
 	unsigned int i;
@@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
 			continue;
 		}
 
-		for_each_child_of_node(node, child) {
-			if (!of_find_property(child, "gpio-controller", NULL))
-				continue;
-			if (of_node_name_eq(child, node_name))
+		for_each_gpiochip_node(dev, child) {
+			struct device_node *np = to_of_node(child);
+
+			if (of_node_name_eq(np, node_name))
 				break;
-			else if (of_node_name_eq(child, bank->name))
+			if (of_node_name_eq(np, bank->name))
 				break;
 		}
 
 		if (child)
-			bank->of_node = child;
+			bank->fwnode = child;
 		else
 			dev_warn(dev, "Missing node for bank %s - invalid DTB\n",
 				 bank->name);
@@ -1061,7 +1060,6 @@ static const struct samsung_pin_ctrl *
 samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 			     struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct samsung_pin_bank_data *bdata;
 	const struct samsung_pin_ctrl *ctrl;
 	struct samsung_pin_bank *bank;
@@ -1125,7 +1123,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 	 */
 	d->virt_base = virt_base[0];
 
-	samsung_banks_of_node_get(&pdev->dev, d, node);
+	samsung_banks_node_get(&pdev->dev, d);
 
 	d->pin_base = pin_base;
 	pin_base += d->nr_pins;
@@ -1186,7 +1184,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 err_unregister:
 	samsung_pinctrl_unregister(pdev, drvdata);
 err_put_banks:
-	samsung_banks_of_node_put(drvdata);
+	samsung_banks_node_put(drvdata);
 	return ret;
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 5b32d3f30fcd..fc6f5199c548 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -165,7 +165,7 @@ struct samsung_pin_bank {
 
 	u32		pin_base;
 	void		*soc_priv;
-	struct device_node *of_node;
+	struct fwnode_handle *fwnode;
 	struct samsung_pinctrl_drv_data *drvdata;
 	struct irq_domain *irq_domain;
 	struct gpio_chip gpio_chip;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
