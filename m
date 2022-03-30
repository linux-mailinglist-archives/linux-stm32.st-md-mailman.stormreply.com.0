Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F244F4EC727
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 16:50:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B26D8C628AC;
	Wed, 30 Mar 2022 14:50:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1633C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651831; x=1680187831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXLXc+19o0UubT6TkmoiDgHQv9YpGm9hY5Ydb16Dc5c=;
 b=hVFdGvkznfRqL1cR046PqkU7GrcWCf7XONYN9ibliRI7JCRrnYpzM4iA
 1dEh0G314rijySP8eiUcSQxlqGE5m/lGzCZFPVYiJya97thrm/RkednY0
 A9M4YfEK0lFk11GEmY996O6voSa4iKTZpWS1OM1O1j9G6h+r2T06CI1w/
 fa+TRtnUkK6bjRV0AfaeVe/PDu8ydPC6mbi/Lfw/6G7yrZJTrJI1uOiq5
 EPAVFfgvWDRCJOhUPH4xiCLgzFINixfwcBhQQspB1uBWp8sc4lnYmowHg
 Y58t3nUqNR4CoRnWElEM0VhM+XyXVSv1PkxOqy+9VxO3emwDWSjKfK/vI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258391448"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="258391448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565571163"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 30 Mar 2022 07:50:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C214B6C0; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
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
Date: Wed, 30 Mar 2022 17:50:30 +0300
Message-Id: <20220330145030.1562-14-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 13/13] pinctrl: armada-37xx: Reuse GPIO
	fwnode in armada_37xx_irqchip_register()
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

Since we have fwnode of the first found GPIO controller assigned to the
struct gpio_chip, we may reuse it in the armada_37xx_irqchip_register().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 1fef8a38f574..c0384661ea48 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -727,23 +727,13 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct gpio_chip *gc = &info->gpio_chip;
 	struct irq_chip *irqchip = &info->irq_chip;
 	struct gpio_irq_chip *girq = &gc->irq;
+	struct device_node *np = to_of_node(gc->fwnode);
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	int ret = -ENODEV, i, nr_irq_parent;
-
-	/* Check if we have at least one gpio-controller child node */
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_property_read_bool(np, "gpio-controller")) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
+	unsigned int i, nr_irq_parent;
 
-	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
+	nr_irq_parent = of_irq_count(np);
 	if (!nr_irq_parent) {
 		dev_err(dev, "invalid or no IRQ\n");
 		return 0;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
