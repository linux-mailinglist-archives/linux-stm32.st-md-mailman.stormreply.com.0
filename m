Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4547430D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 13:59:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 380EBC5E2C5;
	Tue, 14 Dec 2021 12:59:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46BF5C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 12:59:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325246334"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="325246334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 04:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="463785891"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 14 Dec 2021 04:58:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DD49981; Tue, 14 Dec 2021 14:58:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Tue, 14 Dec 2021 14:58:55 +0200
Message-Id: <20211214125855.33207-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
References: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, soc@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Sean Wang <sean.wang@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [PATCH v2 2/2] pinctrl: Propagate firmware node from
	a parent device
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

When creating MFD platform devices the firmware node is left unset.
This, in particular, prevents GPIO library to use it for different
purposes. Propagate firmware node from the parent device and let
GPIO library do the right thing.

While at it, slightly modify the headers to reflect the usage of APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: fixed compilation bug (LKP), due to above reshuffle headers in the rest
 drivers/pinctrl/cirrus/pinctrl-madera-core.c |  5 ++++-
 drivers/pinctrl/pinctrl-as3722.c             | 13 +++++++------
 drivers/pinctrl/pinctrl-da9062.c             |  6 +++---
 drivers/pinctrl/pinctrl-max77620.c           | 10 ++++++----
 drivers/pinctrl/pinctrl-rk805.c              | 12 ++++++------
 5 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-madera-core.c b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
index dce2626384a9..e1cfbee3643a 100644
--- a/drivers/pinctrl/cirrus/pinctrl-madera-core.c
+++ b/drivers/pinctrl/cirrus/pinctrl-madera-core.c
@@ -8,8 +8,10 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
@@ -1004,13 +1006,14 @@ static int madera_pin_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = &pdev->dev;
 	priv->madera = madera;
-	pdev->dev.of_node = madera->dev->of_node;
 
 	switch (madera->type) {
 	case CS47L15:
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 13c193156363..5a175e3d7439 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -23,19 +23,20 @@
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
 #include <linux/kernel.h>
+#include <linux/mod_device_table.h>
 #include <linux/module.h>
 #include <linux/mfd/as3722.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -551,12 +552,13 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 	struct as3722_pctrl_info *as_pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	as_pci = devm_kzalloc(&pdev->dev, sizeof(*as_pci), GFP_KERNEL);
 	if (!as_pci)
 		return -ENOMEM;
 
 	as_pci->dev = &pdev->dev;
-	as_pci->dev->of_node = pdev->dev.parent->of_node;
 	as_pci->as3722 = dev_get_drvdata(pdev->dev.parent);
 	platform_set_drvdata(pdev, as_pci);
 
@@ -578,7 +580,6 @@ static int as3722_pinctrl_probe(struct platform_device *pdev)
 
 	as_pci->gpio_chip = as3722_gpio_chip;
 	as_pci->gpio_chip.parent = &pdev->dev;
-	as_pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 	ret = gpiochip_add_data(&as_pci->gpio_chip, as_pci);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Couldn't register gpiochip, %d\n", ret);
diff --git a/drivers/pinctrl/pinctrl-da9062.c b/drivers/pinctrl/pinctrl-da9062.c
index 1c08579f0198..0e0ac3f3ffef 100644
--- a/drivers/pinctrl/pinctrl-da9062.c
+++ b/drivers/pinctrl/pinctrl-da9062.c
@@ -14,6 +14,7 @@
 #include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/gpio/driver.h>
@@ -256,6 +257,8 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	struct da9062_pctl *pctl;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
 	if (!pctl)
 		return -ENOMEM;
@@ -277,9 +280,6 @@ static int da9062_pctl_probe(struct platform_device *pdev)
 	pctl->gc = reference_gc;
 	pctl->gc.label = dev_name(&pdev->dev);
 	pctl->gc.parent = &pdev->dev;
-#ifdef CONFIG_OF_GPIO
-	pctl->gc.of_node = parent->of_node;
-#endif
 
 	platform_set_drvdata(pdev, pctl);
 
diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index c643ed43ebbf..132987340637 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -11,13 +11,14 @@
 
 #include <linux/mfd/max77620.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/regmap.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -551,12 +552,13 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	struct max77620_pctrl_info *mpci;
 	int i;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	mpci = devm_kzalloc(&pdev->dev, sizeof(*mpci), GFP_KERNEL);
 	if (!mpci)
 		return -ENOMEM;
 
 	mpci->dev = &pdev->dev;
-	mpci->dev->of_node = pdev->dev.parent->of_node;
 	mpci->rmap = max77620->rmap;
 
 	mpci->pins = max77620_pins_desc;
diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index c6f4229eb106..7c1f7408fb9a 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -13,17 +13,17 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mfd/rk808.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
 
 #include "core.h"
 #include "pinconf.h"
@@ -420,18 +420,18 @@ static int rk805_pinctrl_probe(struct platform_device *pdev)
 	struct rk805_pctrl_info *pci;
 	int ret;
 
+	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
+
 	pci = devm_kzalloc(&pdev->dev, sizeof(*pci), GFP_KERNEL);
 	if (!pci)
 		return -ENOMEM;
 
 	pci->dev = &pdev->dev;
-	pci->dev->of_node = pdev->dev.parent->of_node;
 	pci->rk808 = dev_get_drvdata(pdev->dev.parent);
 
 	pci->pinctrl_desc = rk805_pinctrl_desc;
 	pci->gpio_chip = rk805_gpio_chip;
 	pci->gpio_chip.parent = &pdev->dev;
-	pci->gpio_chip.of_node = pdev->dev.parent->of_node;
 
 	platform_set_drvdata(pdev, pci);
 
-- 
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
