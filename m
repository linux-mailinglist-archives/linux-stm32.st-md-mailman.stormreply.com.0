Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915E4EC72C
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 16:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31CCCC628A2;
	Wed, 30 Mar 2022 14:50:47 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B04AAC628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651845; x=1680187845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3O4Dv2hy5JtpWu8VIfFu+PAFZBpau0bJ9ys20UBmDc=;
 b=dJK3WDtqWM/yJ+Xs4l32Rd56h3Y3Mo7BkxuE1tFWZP6oxkCaaKSp4FXT
 Ozg+Xes+AneOQyEaqqPXk3NzD2q/KkYCmTCN/6QP3OJH9blbDfHngPD/3
 /Gz0mG9N4hJ/ciCLwPlwQAjC1mQJOwvZaGeOXkV7dsKu3PeZJfkEoSMg0
 tvtkUxgdwm49nu6UpzTtf/3/NoOEibhkib/7bHGK3eaE0SQsjYD43g1pe
 UGKugg5viPiwdHCcxL7RHRBS1x1d5BTstneyW5twQNEHsAj331OoPtRNI
 N+o3Dy5IJCl1VhoR0F22z1b53bGYFfYreHu2HVTAwYI1rquiGyyNDGxv6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="320259357"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="320259357"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="586025529"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 30 Mar 2022 07:50:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B62EB6A9; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 30 Mar 2022 17:50:29 +0300
Message-Id: <20220330145030.1562-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 12/13] pinctrl: armada-37xx: Switch to use
	fwnode instead of of_node
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

GPIO library now accepts fwnode as a firmware node,
so switch the driver to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 08cad14042e2..1fef8a38f574 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -21,6 +21,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
@@ -787,18 +788,13 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 					struct armada_37xx_pinctrl *info)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct fwnode_handle *fwnode;
 	struct gpio_chip *gc;
-	int ret = -ENODEV;
+	int ret;
 
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_find_property(np, "gpio-controller", NULL)) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return ret;
+	fwnode = device_get_named_child_node(dev, "gpio-controller");
+	if (!fwnode)
+		return -ENODEV;
 
 	info->gpio_chip = armada_37xx_gpiolib_chip;
 
@@ -806,7 +802,7 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 	gc->ngpio = info->data->nr_pins;
 	gc->parent = dev;
 	gc->base = -1;
-	gc->of_node = np;
+	gc->fwnode = fwnode;
 	gc->label = info->data->name;
 
 	ret = armada_37xx_irqchip_register(pdev, info);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
