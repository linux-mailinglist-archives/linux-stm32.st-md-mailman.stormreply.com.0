Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB04466B81
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Dec 2021 22:17:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B5ADC5F1DF;
	Thu,  2 Dec 2021 21:17:43 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5BACC5F1DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 21:17:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="235577088"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="235577088"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 13:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="460620438"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Dec 2021 13:17:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A0E77B8; Thu,  2 Dec 2021 23:17:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jianqun Xu <jay.xu@rock-chips.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 bcm-kernel-feedback-list@broadcom.com, linux-power@fi.rohmeurope.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Date: Thu,  2 Dec 2021 23:08:38 +0200
Message-Id: <20211202210839.79140-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, Keerthy <j-keerthy@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Subject: [Linux-stm32] [PATCH v1 2/3] gpio: Setup parent device and get rid
	of unnecessary of_node assignment
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

Some of the drivers do not set parent device. This may lead to obstacles
during debugging or understanding the device relations from the Linux
point of view. Assign parent device for GPIO chips created by these
drivers.

While at it, let GPIO library to assign of_node from the parent device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-bcm-kona.c  | 2 +-
 drivers/gpio/gpio-creg-snps.c | 2 +-
 drivers/gpio/gpio-lpc32xx.c   | 2 +-
 drivers/gpio/gpio-pxa.c       | 8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index d329a143f5ec..e84474494429 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -606,7 +606,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 
 	kona_gpio->pdev = pdev;
 	platform_set_drvdata(pdev, kona_gpio);
-	chip->of_node = dev->of_node;
+	chip->parent = dev;
 	chip->ngpio = kona_gpio->num_bank * GPIO_PER_BANK;
 
 	kona_gpio->irq_domain = irq_domain_add_linear(dev->of_node,
diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 1d0827e79703..789384c6e178 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -163,12 +163,12 @@ static int creg_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&hcg->lock);
 
+	hcg->gc.parent = dev;
 	hcg->gc.label = dev_name(dev);
 	hcg->gc.base = -1;
 	hcg->gc.ngpio = ngpios;
 	hcg->gc.set = creg_gpio_set;
 	hcg->gc.direction_output = creg_gpio_dir_out;
-	hcg->gc.of_node = dev->of_node;
 
 	ret = devm_gpiochip_add_data(dev, &hcg->gc, hcg);
 	if (ret)
diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 4e626c4235c2..d2b65cfb336e 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -512,10 +512,10 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(reg_base);
 
 	for (i = 0; i < ARRAY_SIZE(lpc32xx_gpiochip); i++) {
+		lpc32xx_gpiochip[i].chip.parent = &pdev->dev;
 		if (pdev->dev.of_node) {
 			lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
-			lpc32xx_gpiochip[i].chip.of_node = pdev->dev.of_node;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
 		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 382468e294e1..c7fbfa3ae43b 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -343,8 +343,7 @@ static int pxa_gpio_of_xlate(struct gpio_chip *gc,
 }
 #endif
 
-static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
-			      struct device_node *np, void __iomem *regbase)
+static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio, void __iomem *regbase)
 {
 	int i, gpio, nbanks = DIV_ROUND_UP(ngpio, 32);
 	struct pxa_gpio_bank *bank;
@@ -354,6 +353,7 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 	if (!pchip->banks)
 		return -ENOMEM;
 
+	pchip->chip.parent = pchip->dev;
 	pchip->chip.label = "gpio-pxa";
 	pchip->chip.direction_input  = pxa_gpio_direction_input;
 	pchip->chip.direction_output = pxa_gpio_direction_output;
@@ -365,7 +365,6 @@ static int pxa_init_gpio_chip(struct pxa_gpio_chip *pchip, int ngpio,
 	pchip->chip.free = gpiochip_generic_free;
 
 #ifdef CONFIG_OF_GPIO
-	pchip->chip.of_node = np;
 	pchip->chip.of_xlate = pxa_gpio_of_xlate;
 	pchip->chip.of_gpio_n_cells = 2;
 #endif
@@ -675,8 +674,7 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* Initialize GPIO chips */
-	ret = pxa_init_gpio_chip(pchip, pxa_last_gpio + 1, pdev->dev.of_node,
-				 gpio_reg_base);
+	ret = pxa_init_gpio_chip(pchip, pxa_last_gpio + 1, gpio_reg_base);
 	if (ret) {
 		clk_put(clk);
 		return ret;
-- 
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
