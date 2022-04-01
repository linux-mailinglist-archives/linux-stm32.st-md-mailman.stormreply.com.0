Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EF4EEB7E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 12:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A8D2C628AB;
	Fri,  1 Apr 2022 10:36:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A76CC628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809369; x=1680345369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mokh5NeYfH0tCFWB5WUbjJ/CRT9R2RJiXuGQoGrRwY8=;
 b=f4SRO5Yo3teVoacAeRS9PYnmbF3BVZbt4Cp1iAGBKQMWgT4HvORjNdZ9
 +cdvhPt0D5HiHOvRO6c4vxa+KUtRkxvWFuousT3wXjMiUCl5iN73Ug86P
 Ex983S/A+lyaekFgON7Zx300fuyrcA3tkctX8Wp4oc2gShJ4qTdEV0KxM
 dq2dUsfA87HGZ67qKhJbCXgCi/C2+vdp/emQJUPiNw9ggvg4D7L36N89E
 PuxIvooXR/xmf2xjl2GWFBw+zv76Lvu9e52QaEpEeuRmt7FYt6OKtOhSk
 iu4jjwg+UitXUmmT5RCHCXJo3ZdlcBZGcWZ2gV6uVhnLqbLeXAfF1Lh8O Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="259804842"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="259804842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="522726475"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 03:35:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9A77681; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
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
Date: Fri,  1 Apr 2022 13:35:52 +0300
Message-Id: <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v4 01/13] gpiolib: Introduce
	for_each_gpiochip_node() loop helper
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

Introduce for_each_gpiochip_node() loop helper which iterates over
the GPIO controller child nodes of a given device.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/gpio/driver.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 98c93510640e..bfc91f122d5f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -3,13 +3,14 @@
 #define __LINUX_GPIO_DRIVER_H
 
 #include <linux/device.h>
-#include <linux/types.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/property.h>
+#include <linux/types.h>
 
 struct gpio_desc;
 struct of_phandle_args;
@@ -750,4 +751,8 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 }
 #endif /* CONFIG_GPIOLIB */
 
+#define for_each_gpiochip_node(dev, child)					\
+	device_for_each_child_node(dev, child)					\
+		if (!fwnode_property_present(child, "gpio-controller")) {} else
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
