Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81C4EEB7A
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 12:36:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE71C628B4;
	Fri,  1 Apr 2022 10:36:05 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9870FC6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 10:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809363; x=1680345363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTI2sWpV0UzE6IeL8l7wpen8kbwzDYKP8YDjk2kp5w4=;
 b=L5G3WjBS4n4D/URqKvgJjtYqMCSCFrkpVZR7EOcXicVI1B7Sjmm+i4/k
 9ebUxuOkrOZHyL2zyqf4guccaBsl/andY+/Ofq5MqHFoamlIu+bNuojfh
 lal8N9nQBlj/m/3Z3aTfHTJCYZGBoPQ9+AFM8zt/A17JuUKGrT39rPTrr
 Vn8m/mHsSGLngQEYcBlSTKxc0zF9Zy1EIYj4Cxa5//lp4Lfyr6PcsAk8O
 e52G12iHkNzS7vH4+bX7Q4m2MPC3ZW2wcPkjFhvL4c291oSb0/KqdviE2
 HWAqqvOT16Jsu/R+LpZUda94A8Is8jrzzj/OQ5Y5NGAFYuK1fRiBcngKo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="247609930"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="247609930"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="521295002"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2022 03:35:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 213BA698; Fri,  1 Apr 2022 13:36:06 +0300 (EEST)
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
Date: Fri,  1 Apr 2022 13:36:02 +0300
Message-Id: <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v4 11/13] pinctrl: meson: Replace custom code
	by gpiochip_node_count() call
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

Since we have generic function to count GPIO controller nodes
under a given device, there is no need to open code it. Replace
custom code by gpiochip_node_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 28 ++++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 5b46a0979db7..1b078da81523 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -49,6 +49,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 
@@ -662,27 +663,22 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
 	return devm_regmap_init_mmio(pc->dev, base, &meson_regmap_config);
 }
 
-static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
-				  struct device_node *node)
+static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
 {
-	struct device_node *np, *gpio_np = NULL;
+	struct device_node *gpio_np;
+	unsigned int chips;
 
-	for_each_child_of_node(node, np) {
-		if (!of_find_property(np, "gpio-controller", NULL))
-			continue;
-		if (gpio_np) {
-			dev_err(pc->dev, "multiple gpio nodes\n");
-			of_node_put(np);
-			return -EINVAL;
-		}
-		gpio_np = np;
-	}
-
-	if (!gpio_np) {
+	chips = gpiochip_node_count(pc->dev);
+	if (!chips) {
 		dev_err(pc->dev, "no gpio node found\n");
 		return -EINVAL;
 	}
+	if (chips > 1) {
+		dev_err(pc->dev, "multiple gpio nodes\n");
+		return -EINVAL;
+	}
 
+	gpio_np = to_of_node(device_get_named_child_node(pc->dev, "gpio-controller"));
 	pc->of_node = gpio_np;
 
 	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
@@ -751,7 +747,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->dev = dev;
 	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
 
-	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
+	ret = meson_pinctrl_parse_dt(pc);
 	if (ret)
 		return ret;
 
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
