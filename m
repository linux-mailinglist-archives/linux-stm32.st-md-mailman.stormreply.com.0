Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A774EB063
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C29C7C628A1;
	Tue, 29 Mar 2022 15:29:27 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB548C60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567766; x=1680103766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9rIVVydA1U6YDG/4d1Ed8j+r9S7iMMFVbYxLfWOamY=;
 b=lGB/QbRIqHPBn49LcGLsR2OwP5ijXKCY1LFKVCmY8GAiqRi3rM8JhOOS
 MFoCP4ZJgIhFa0fe60RzpP9PhVrlSqVCfPEQ0eYoCXfw4XhDZUDQEXaig
 flrHPImv7J4jdi93R1rke3A87tPgFVCx34dIeIZbZjI44PUV6MexYf805
 KjdTWPL9/9dAjGudLZ2PfhKiYAn9s8/M5/xz5iv/JRa/lSfN3+A4pH4sI
 +n5RRPAgMkB3LGkcsiGalEQyiT1Tc4NQbIg9+ZNyJi9VdVQ+ToJgitsIW
 syLENsIPLe1d0xG+TdeWKqhdDVBq6i30QbooKqxOnz+YuYDSHmjltKAq7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="319974214"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="319974214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="604843273"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6E4873C5; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:21 +0300
Message-Id: <20220329152926.50958-9-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v2 08/13] pinctrl: npcm7xx: Switch to use
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
do the following:
- use a temporary variable for struct device pointer to shorten a few lines
- get rid of a temporary variable for vIRQ number, assign it directly
- switch to fwnode APIs where it makes sense

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 141 ++++++++++------------
 1 file changed, 61 insertions(+), 80 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 221c33300d60..e73732e79585 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1862,88 +1862,69 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
 	int ret = -ENXIO;
 	struct resource res;
-	int id = 0, irq;
-	struct device_node *np;
-	struct of_phandle_args pinspec;
-
-	for_each_available_child_of_node(pctrl->dev->of_node, np)
-		if (of_find_property(np, "gpio-controller", NULL)) {
-			ret = of_address_to_resource(np, 0, &res);
-			if (ret < 0) {
-				dev_err(pctrl->dev,
-					"Resource fail for GPIO bank %u\n", id);
-				return ret;
-			}
-
-			pctrl->gpio_bank[id].base =
-				ioremap(res.start, resource_size(&res));
-
-			irq = irq_of_parse_and_map(np, 0);
-			if (irq < 0) {
-				dev_err(pctrl->dev,
-					"No IRQ for GPIO bank %u\n", id);
-				ret = irq;
-				return ret;
-			}
-
-			ret = bgpio_init(&pctrl->gpio_bank[id].gc,
-					 pctrl->dev, 4,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_DIN,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_DOUT,
-					 NULL,
-					 NULL,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_IEM,
-					 BGPIOF_READ_OUTPUT_REG_SET);
-			if (ret) {
-				dev_err(pctrl->dev, "bgpio_init() failed\n");
-				return ret;
-			}
-
-			ret = of_parse_phandle_with_fixed_args(np,
-							       "gpio-ranges", 3,
-							       0, &pinspec);
-			if (ret < 0) {
-				dev_err(pctrl->dev,
-					"gpio-ranges fail for GPIO bank %u\n",
-					id);
-				return ret;
-			}
-
-			pctrl->gpio_bank[id].irq = irq;
-			pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
-			pctrl->gpio_bank[id].gc.parent = pctrl->dev;
-			pctrl->gpio_bank[id].irqbase =
-				id * NPCM7XX_GPIO_PER_BANK;
-			pctrl->gpio_bank[id].pinctrl_id = pinspec.args[0];
-			pctrl->gpio_bank[id].gc.base = pinspec.args[1];
-			pctrl->gpio_bank[id].gc.ngpio = pinspec.args[2];
-			pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
-			pctrl->gpio_bank[id].gc.label =
-				devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOF",
-					       np);
-			if (pctrl->gpio_bank[id].gc.label == NULL)
-				return -ENOMEM;
-
-			pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
-			pctrl->gpio_bank[id].direction_input =
-				pctrl->gpio_bank[id].gc.direction_input;
-			pctrl->gpio_bank[id].gc.direction_input =
-				npcmgpio_direction_input;
-			pctrl->gpio_bank[id].direction_output =
-				pctrl->gpio_bank[id].gc.direction_output;
-			pctrl->gpio_bank[id].gc.direction_output =
-				npcmgpio_direction_output;
-			pctrl->gpio_bank[id].request =
-				pctrl->gpio_bank[id].gc.request;
-			pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-			pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
-			pctrl->gpio_bank[id].gc.of_node = np;
-			id++;
+	struct device *dev = pctrl->dev;
+	struct fwnode_reference_args pinspec;
+	struct fwnode_handle *child;
+	int id = 0;
+
+	for_each_gpiochip_node(dev, child) {
+		struct device_node *np = to_of_node(child);
+
+		ret = of_address_to_resource(np, 0, &res);
+		if (ret < 0) {
+			dev_err(dev, "Resource fail for GPIO bank %u\n", id);
+			return ret;
+		}
+
+		pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
+
+		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
+				 NULL,
+				 NULL,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
+				 BGPIOF_READ_OUTPUT_REG_SET);
+		if (ret) {
+			dev_err(dev, "bgpio_init() failed\n");
+			return ret;
 		}
 
+		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &pinspec);
+		if (ret < 0) {
+			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
+			return ret;
+		}
+
+		ret = irq_of_parse_and_map(np, 0);
+		if (ret < 0) {
+			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
+			return ret;
+		}
+		pctrl->gpio_bank[id].irq = ret;
+		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
+		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
+		pctrl->gpio_bank[id].pinctrl_id = pinspec.args[0];
+		pctrl->gpio_bank[id].gc.base = pinspec.args[1];
+		pctrl->gpio_bank[id].gc.ngpio = pinspec.args[2];
+		pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
+		pctrl->gpio_bank[id].gc.parent = dev;
+		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].gc.label == NULL)
+			return -ENOMEM;
+
+		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
+		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
+		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
+		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
+		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
+		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
+		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
+		pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
+		pctrl->gpio_bank[id].gc.fwnode = child;
+		id++;
+	}
+
 	pctrl->bank_num = id;
 	return ret;
 }
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
