Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45C7540F2
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 19:46:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65320C6B44F;
	Fri, 14 Jul 2023 17:46:53 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C2C0C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 17:46:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7835ae70e46so89097939f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 10:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356810; x=1691948810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vj61uuakSXL6S+ShqveHzPHKdxzqOSnkWIu6XJlRCO8=;
 b=VmnvANXPsl1DjIbdljWwOedke6psD3v1P1qYqfZLD+a2xd/9db/DFHZsTwBRYzBj//
 1E7JdfegYE6uzYdAk/fQZRfxEX3eZT7NDg2tUmgU82yIhOIYi/fRYf9mTslKNransJU3
 cnrZCmU1oETw7XLX5x7gyPA93VGNP5W9Pbj9r928npWFLzGlK0xVlyPhkcWBesrW+Lfq
 et+/zs+jFCsb95AXgyXgXlVm/jBSUTe3Mphq1ZsrPsiYEiVA7ff3RE9CxtdMrjxrk2SL
 eVeQF2gtDFfZbmF2qw/Yv3D62G0iG84AJWE3tU4S6zkGL/sIL/4rkjX+JyYsXsdz5h/Z
 OQ0g==
X-Gm-Message-State: ABy/qLa38erDWrUaF/h4FSTXgjwf39EYLLBeDn1jIixAjvvITiM/XXJ9
 1hpuBANGr7xzX10bjiTcSw==
X-Google-Smtp-Source: APBJJlGgqfJa0zk9WWLj6ia40Lq0YCoeBva3jgLVniHR6ZSizAasRtUVQAviqdwLxUc9CvquiSxSiA==
X-Received: by 2002:a6b:5b04:0:b0:783:4f8d:4484 with SMTP id
 v4-20020a6b5b04000000b007834f8d4484mr5952812ioh.2.1689356809853; 
 Fri, 14 Jul 2023 10:46:49 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a02cbd0000000b0042adc25ab12sm2718535jaq.44.2023.07.14.10.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:46:48 -0700 (PDT)
Received: (nullmailer pid 4058053 invoked by uid 1000);
 Fri, 14 Jul 2023 17:46:31 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Hennerich <michael.hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Crt Mori <cmo@melexis.com>
Date: Fri, 14 Jul 2023 11:46:26 -0600
Message-Id: <20230714174628.4057920-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: adc: Explicitly include correct DT
	includes
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/iio/accel/adxl372_spi.c    | 1 -
 drivers/iio/accel/bma180.c         | 1 -
 drivers/iio/accel/kxsd9-spi.c      | 1 -
 drivers/iio/accel/mma8452.c        | 2 +-
 drivers/iio/adc/ad7124.c           | 2 +-
 drivers/iio/adc/ad7192.c           | 2 +-
 drivers/iio/adc/ad9467.c           | 2 +-
 drivers/iio/adc/adi-axi-adc.c      | 3 ++-
 drivers/iio/adc/at91_adc.c         | 1 -
 drivers/iio/adc/cc10001_adc.c      | 1 -
 drivers/iio/adc/ina2xx-adc.c       | 2 +-
 drivers/iio/adc/meson_saradc.c     | 1 -
 drivers/iio/adc/palmas_gpadc.c     | 1 -
 drivers/iio/adc/qcom-spmi-iadc.c   | 1 -
 drivers/iio/adc/rockchip_saradc.c  | 1 -
 drivers/iio/adc/sc27xx_adc.c       | 1 -
 drivers/iio/adc/stm32-adc-core.c   | 2 ++
 drivers/iio/adc/stm32-dfsdm-adc.c  | 3 ++-
 drivers/iio/adc/stm32-dfsdm-core.c | 4 +++-
 drivers/iio/adc/stmpe-adc.c        | 3 ++-
 drivers/iio/adc/sun4i-gpadc-iio.c  | 1 -
 drivers/iio/adc/ti_am335x_adc.c    | 1 -
 drivers/iio/proximity/isl29501.c   | 2 +-
 drivers/iio/temperature/mlx90614.c | 2 +-
 24 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/accel/adxl372_spi.c b/drivers/iio/accel/adxl372_spi.c
index 2bd267a22f29..75a88f16c6c9 100644
--- a/drivers/iio/accel/adxl372_spi.c
+++ b/drivers/iio/accel/adxl372_spi.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 
 #include "adxl372.h"
diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index e8ab0d249351..13439f52d26d 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -16,7 +16,6 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/bitops.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/iio/accel/kxsd9-spi.c b/drivers/iio/accel/kxsd9-spi.c
index 07f14a9f22c7..1719a9f1d90a 100644
--- a/drivers/iio/accel/kxsd9-spi.c
+++ b/drivers/iio/accel/kxsd9-spi.c
@@ -2,7 +2,6 @@
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index 6e7399e72221..f42a88711486 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -28,7 +28,7 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/events.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index 050a2fbf5c49..b9b206fcd748 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
diff --git a/drivers/iio/adc/ad7192.c b/drivers/iio/adc/ad7192.c
index 8685e0b58a83..81063accedae 100644
--- a/drivers/iio/adc/ad7192.c
+++ b/drivers/iio/adc/ad7192.c
@@ -16,7 +16,7 @@
 #include <linux/err.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
diff --git a/drivers/iio/adc/ad9467.c b/drivers/iio/adc/ad9467.c
index 0621cf59d614..39eccc28debe 100644
--- a/drivers/iio/adc/ad9467.c
+++ b/drivers/iio/adc/ad9467.c
@@ -13,7 +13,7 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 
 #include <linux/iio/iio.h>
diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index e8a8ea4140f1..aff0532a974a 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -11,8 +11,9 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/iio/iio.h>
diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 366e252ebeb0..de6650f9c4b1 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2cde4b44fc6e..a432342348ab 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index 213526c1592f..277574484fb1 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -28,7 +28,7 @@
 #include <linux/iio/sysfs.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/sched/task.h>
 #include <linux/util_macros.h>
diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index af6bfcc19075..ef0a9a76743e 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -17,7 +17,6 @@
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpadc.c
index 27b2632c1037..3d7cfbb00a69 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -18,7 +18,6 @@
 #include <linux/mfd/palmas.h>
 #include <linux/completion.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/machine.h>
diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index acbda6636dc5..7fb8b2499a1d 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -13,7 +13,6 @@
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
index 4b011f7eddec..19ce43117685 100644
--- a/drivers/iio/adc/rockchip_saradc.c
+++ b/drivers/iio/adc/rockchip_saradc.c
@@ -11,7 +11,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
diff --git a/drivers/iio/adc/sc27xx_adc.c b/drivers/iio/adc/sc27xx_adc.c
index ff1fc329bb9b..b4a2e057d80f 100644
--- a/drivers/iio/adc/sc27xx_adc.c
+++ b/drivers/iio/adc/sc27xx_adc.c
@@ -7,7 +7,6 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 48f02dcc81c1..7bdd230ce2cb 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -18,6 +18,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index a428bdb567d5..b5cc43d12b6f 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -19,7 +19,8 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
index 0362df285a57..0f6ebb3061a0 100644
--- a/drivers/iio/adc/stm32-dfsdm-core.c
+++ b/drivers/iio/adc/stm32-dfsdm-core.c
@@ -12,8 +12,10 @@
 #include <linux/iio/sysfs.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index 67518e460e05..55e36b40fdf5 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -14,9 +14,10 @@
 #include <linux/kernel.h>
 #include <linux/mfd/stmpe.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/device.h>
+#include <linux/of.h>
 
 #define STMPE_REG_INT_STA		0x0B
 #define STMPE_REG_ADC_INT_EN		0x0E
diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index a5322550c422..25bba96367a8 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -24,7 +24,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index 642c5c4895e3..8db7a01cb5fb 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -14,7 +14,6 @@
 #include <linux/io.h>
 #include <linux/iio/iio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/iio/machine.h>
 #include <linux/iio/driver.h>
 #include <linux/iopoll.h>
diff --git a/drivers/iio/proximity/isl29501.c b/drivers/iio/proximity/isl29501.c
index fe45ca35a124..bcebacaf3dab 100644
--- a/drivers/iio/proximity/isl29501.c
+++ b/drivers/iio/proximity/isl29501.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature/mlx90614.c
index 676dc8701924..07bb5df24ab3 100644
--- a/drivers/iio/temperature/mlx90614.c
+++ b/drivers/iio/temperature/mlx90614.c
@@ -27,8 +27,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #include <linux/iio/iio.h>
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
