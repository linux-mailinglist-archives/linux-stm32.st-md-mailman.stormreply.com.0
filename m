Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D54EB068
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 17:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7F4C628AF;
	Tue, 29 Mar 2022 15:29:30 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F7FDC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567767; x=1680103767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1uhnGCeQRRhPDv5FfIf14aURC8nLj45dxjP/6kq7UUg=;
 b=ZE/yyFaR4l4GaQpjf3INnujjeNg72EdBEf9nrhrQrb3zTWqW9TmNWgAc
 Gk9U+rfjxoF7XtB0d/PryRpi1OLozPc0+rUsHo+fD2Wuz388loFZJhwmV
 Vq+8PvHDSvU63UbPxYBMMuIQ3Yqxa+CYh6Jr+U7KstnTej/7a1g2waaox
 PAt33XrE/9IJ69hNpqWa/f5NKLRGrb/4M3DQ/28SvRWPBc3vj5qs0bAUt
 Ff9KLP3OIZTUS1TTHHadrJVD4J6rL/8Ew3pWtDIx2Jm2vlaD6pZ4yLffp
 /tPythygRAcfHeeB76bGJT9H5tOdS5XotD+6UkcSo4b85st2IN9fu3xbA Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="319974221"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="319974221"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="546425146"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5FAC0314; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 29 Mar 2022 18:29:20 +0300
Message-Id: <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v2 07/13] pinctrl: renesas: rza1: Switch to
	use for_each_gpiochip_node() helper
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
 drivers/pinctrl/renesas/pinctrl-rza1.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 5075d5cebe8c..74183f36567b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include "../core.h"
@@ -1166,17 +1167,17 @@ static const struct pinmux_ops rza1_pinmux_ops = {
  * @range: pin range to register to pinctrl core
  */
 static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
-			       struct device_node *np,
+			       struct fwnode_handle *fwnode,
 			       struct gpio_chip *chip,
 			       struct pinctrl_gpio_range *range)
 {
 	const char *list_name = "gpio-ranges";
-	struct of_phandle_args of_args;
+	struct fwnode_reference_args of_args;
 	unsigned int gpioport;
 	u32 pinctrl_base;
 	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
+	ret = fwnode_property_get_reference_args(fwnode, list_name, NULL, 3, 0, &of_args);
 	if (ret) {
 		dev_err(rza1_pctl->dev, "Unable to parse %s list property\n",
 			list_name);
@@ -1197,13 +1198,12 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 
 	*chip		= rza1_gpiochip_template;
 	chip->base	= -1;
-	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
-					 np);
+	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);
 	if (!chip->label)
 		return -ENOMEM;
 
 	chip->ngpio	= of_args.args[2];
-	chip->of_node	= np;
+	chip->fwnode	= fwnode;
 	chip->parent	= rza1_pctl->dev;
 
 	range->id	= gpioport;
@@ -1232,10 +1232,9 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
  */
 static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 {
-	struct device_node *np = rza1_pctl->dev->of_node;
 	struct pinctrl_gpio_range *gpio_ranges;
 	struct gpio_chip *gpio_chips;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	unsigned int ngpiochips;
 	unsigned int i;
 	int ret;
@@ -1254,14 +1253,11 @@ static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
-		if (!of_property_read_bool(child, "gpio-controller"))
-			continue;
-
+	for_each_gpiochip_node(rza1_pctl->dev, child) {
 		ret = rza1_parse_gpiochip(rza1_pctl, child, &gpio_chips[i],
 					  &gpio_ranges[i]);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
