Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32179754158
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 19:51:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBBE4C6B452;
	Fri, 14 Jul 2023 17:51:00 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D732C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 17:50:59 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-78654448524so85231939f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 10:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689357058; x=1691949058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tPaYytlE/dKDiPWONYGoHn0bUH6RRDwZOcpAYre31YM=;
 b=g2UAhM9KUE0JxFI01k0Ig6916RvW+xIJf3mR+yun6jAHwLlvdtfv+0Zm0ne83YFHIz
 QagNoqUGq5VrJGsz5zURHnGjp33qC0Npc+1EItJddN+IFJeUKjbtqXEliKagcyqtqJUj
 fFhVkgRWbANgw2vnlNy2rS6vbDn2wc6GrKSDtp9JKNgQ8WMu0aSfCH0+3ZAzvpsPn6f8
 0oEz7h9nxtUxjdCVUaNKajq067DKzO0N9WWTdhXqBKRkuALVwQiah14hmrLX6C8sDS1d
 KSiAcOOX5zqx7qDHSk9kLilAXV3tHhBfuJ9JBCPGGxZvuJx45pqJlGJT7EVF8IYDpU6L
 wu/w==
X-Gm-Message-State: ABy/qLYFmA79YWerSts6nnIEv1GIYoKKmVQzGvoFjamOGUBu/AObagtW
 5tyc0ogS6coNMf4bUjhuVg==
X-Google-Smtp-Source: APBJJlH0WZnWwucCN4gIdX66/gpDTQftSzdkzROwtscf9sh83/FTUUIIdbYbwXJ47kHQSsWbeUOR1g==
X-Received: by 2002:a92:da88:0:b0:346:6d97:ffd1 with SMTP id
 u8-20020a92da88000000b003466d97ffd1mr4998380iln.18.1689357058408; 
 Fri, 14 Jul 2023 10:50:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a02a90d000000b0042b7b76b29fsm2629924jam.174.2023.07.14.10.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:50:57 -0700 (PDT)
Received: (nullmailer pid 4064720 invoked by uid 1000);
 Fri, 14 Jul 2023 17:50:11 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Markus Mayer <mmayer@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Fri, 14 Jul 2023 11:50:07 -0600
Message-Id: <20230714175008.4064592-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] thermal: Explicitly include correct DT
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
 drivers/thermal/amlogic_thermal.c           | 2 --
 drivers/thermal/broadcom/bcm2711_thermal.c  | 2 +-
 drivers/thermal/broadcom/brcmstb_thermal.c  | 2 +-
 drivers/thermal/hisi_thermal.c              | 2 +-
 drivers/thermal/imx8mm_thermal.c            | 1 -
 drivers/thermal/imx_sc_thermal.c            | 1 -
 drivers/thermal/imx_thermal.c               | 2 +-
 drivers/thermal/k3_bandgap.c                | 2 +-
 drivers/thermal/k3_j72xx_bandgap.c          | 2 +-
 drivers/thermal/mediatek/auxadc_thermal.c   | 1 -
 drivers/thermal/mediatek/lvts_thermal.c     | 2 +-
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c    | 1 -
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 1 -
 drivers/thermal/rcar_gen3_thermal.c         | 2 +-
 drivers/thermal/rcar_thermal.c              | 2 +-
 drivers/thermal/rzg2l_thermal.c             | 2 +-
 drivers/thermal/samsung/exynos_tmu.c        | 2 +-
 drivers/thermal/sprd_thermal.c              | 2 +-
 drivers/thermal/st/stm_thermal.c            | 2 --
 drivers/thermal/sun8i_thermal.c             | 2 +-
 drivers/thermal/tegra/tegra30-tsensor.c     | 2 +-
 drivers/thermal/thermal_of.c                | 3 +--
 drivers/thermal/uniphier_thermal.c          | 1 -
 23 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 756b218880a7..81ebbf6de0de 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -22,8 +22,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/broadcom/bcm2711_thermal.c b/drivers/thermal/broadcom/bcm2711_thermal.c
index c243a76a3471..03ac2d02e9d4 100644
--- a/drivers/thermal/broadcom/bcm2711_thermal.c
+++ b/drivers/thermal/broadcom/bcm2711_thermal.c
@@ -15,8 +15,8 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
 
diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index 72d1dbe60b8f..0b73abdaa792 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -17,8 +17,8 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <linux/thermal.h>
 
 #define AVS_TMON_STATUS			0x00
diff --git a/drivers/thermal/hisi_thermal.c b/drivers/thermal/hisi_thermal.c
index 3f09ef8be41a..fb54ed4bf6f0 100644
--- a/drivers/thermal/hisi_thermal.c
+++ b/drivers/thermal/hisi_thermal.c
@@ -13,9 +13,9 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
 #include <linux/thermal.h>
 
 #define HI6220_TEMP0_LAG			(0x0)
diff --git a/drivers/thermal/imx8mm_thermal.c b/drivers/thermal/imx8mm_thermal.c
index d4b40869c7d7..e89b11b3f2b9 100644
--- a/drivers/thermal/imx8mm_thermal.c
+++ b/drivers/thermal/imx8mm_thermal.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_thermal.c
index 8d6b4ef23746..7224f8d21db9 100644
--- a/drivers/thermal/imx_sc_thermal.c
+++ b/drivers/thermal/imx_sc_thermal.c
@@ -8,7 +8,6 @@
 #include <linux/firmware/imx/sci.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index a94ec0a0c9dd..826358cbe810 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -11,7 +11,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
 #include <linux/nvmem-consumer.h>
diff --git a/drivers/thermal/k3_bandgap.c b/drivers/thermal/k3_bandgap.c
index 1c3e590157ec..68f59b3735d3 100644
--- a/drivers/thermal/k3_bandgap.c
+++ b/drivers/thermal/k3_bandgap.c
@@ -11,7 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/thermal.h>
 #include <linux/types.h>
diff --git a/drivers/thermal/k3_j72xx_bandgap.c b/drivers/thermal/k3_j72xx_bandgap.c
index 5be1f09eeb2c..a5a0fc9b9356 100644
--- a/drivers/thermal/k3_j72xx_bandgap.c
+++ b/drivers/thermal/k3_j72xx_bandgap.c
@@ -10,10 +10,10 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/err.h>
 #include <linux/types.h>
-#include <linux/of_platform.h>
 #include <linux/io.h>
 #include <linux/thermal.h>
 #include <linux/of.h>
diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index f59d36de20a0..c537aed71017 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -15,7 +15,6 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/io.h>
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index b693fac2d677..054c965ae5e1 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -13,7 +13,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 5ddc39b2be32..756ac6842ff9 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -14,7 +14,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index 0e8ebfcd84c5..78c5cfe6a0c0 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -10,7 +10,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 9029d01e029b..bd2fb8c2e968 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -11,7 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index b8571f7090aa..293f8dd9fe0a 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -11,7 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reboot.h>
diff --git a/drivers/thermal/rzg2l_thermal.c b/drivers/thermal/rzg2l_thermal.c
index b56981f85306..6b2bf3426f52 100644
--- a/drivers/thermal/rzg2l_thermal.c
+++ b/drivers/thermal/rzg2l_thermal.c
@@ -9,8 +9,8 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/math.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 45e5c840d130..58f4d8f7a3fd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
diff --git a/drivers/thermal/sprd_thermal.c b/drivers/thermal/sprd_thermal.c
index 2fb90fdad76e..e27c4bdc8912 100644
--- a/drivers/thermal/sprd_thermal.c
+++ b/drivers/thermal/sprd_thermal.c
@@ -6,7 +6,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 903fcf1763f1..142a7e5d12f4 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -14,8 +14,6 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/thermal.h>
 
diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 195f3c5d0b38..cca16d632d9f 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -14,7 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index c243e9d76d3c..d911fa60f100 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -18,7 +18,7 @@
 #include <linux/iopoll.h>
 #include <linux/math.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/reset.h>
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 6fb14e521197..c36c7d235cba 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -10,8 +10,7 @@
 
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 #include <linux/types.h>
diff --git a/drivers/thermal/uniphier_thermal.c b/drivers/thermal/uniphier_thermal.c
index aef6119cc004..6f32ab61d174 100644
--- a/drivers/thermal/uniphier_thermal.c
+++ b/drivers/thermal/uniphier_thermal.c
@@ -12,7 +12,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/thermal.h>
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
