Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E907540FF
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 19:47:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D808BC6B452;
	Fri, 14 Jul 2023 17:47:44 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3597FC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 17:47:44 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-78360b822abso87466939f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 10:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356863; x=1691948863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ws37MduKoZ6K8xKpYDUmo3zu7UbisfYB9fvzAAVlqfU=;
 b=b+m3cFDcqzZctdCa+4K6N3B1lVVHFSv0gxvkb0iRzcr+XGqtdx9ZZgGFiOnP3hzWtx
 R88VEPH2HYBwuRPVSbJONB8rncQgIhen+ZafL31xhQnS/6vbchMzm4y3IRTx1rlQ9vUv
 K0Gf3gCnYVvo7NbJxK2WNsy5vCgiaMZM7gecRfdm6/gJoFt2HpVlHTGGXPaQ9kJaQnAV
 DV1ORmQgMB8UoHXOTfaCyl4sqfYj8PyPKA49V2WFdiV7j6bnPOXOGCWGvE73oJ4oOpFO
 tjc0wQpwUeNdpn4wWA+C2dMo2lygg18Us4r+MrYVQ4XzH0R4USdf4udidkHcLJP5sPUx
 U2Qw==
X-Gm-Message-State: ABy/qLb5thjYIUAs6oGWYo6vGQPIKYNbTAP9uYeSCPyx9tnhS9+no6mW
 LHqrNEIm159PUbehlAkFxQ==
X-Google-Smtp-Source: APBJJlFFQ8o34m0x+b2BcDkHrd+gYnTS9IpTEgQAWqmgWHXwvhhVF5dvvgotkCgWFujK552QA+NMzQ==
X-Received: by 2002:a5e:c009:0:b0:783:5452:e343 with SMTP id
 u9-20020a5ec009000000b007835452e343mr5240574iol.14.1689356863024; 
 Fri, 14 Jul 2023 10:47:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a02ab89000000b0042af7792d7dsm2613615jan.97.2023.07.14.10.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:47:42 -0700 (PDT)
Received: (nullmailer pid 4059768 invoked by uid 1000);
 Fri, 14 Jul 2023 17:47:27 -0000
From: Rob Herring <robh@kernel.org>
To: Markus Mayer <mmayer@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Michal Simek <michal.simek@amd.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Fri, 14 Jul 2023 11:47:16 -0600
Message-Id: <20230714174717.4059518-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] memory: Explicitly include correct DT includes
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
 drivers/memory/brcmstb_dpfe.c            | 3 +--
 drivers/memory/da8xx-ddrctl.c            | 1 -
 drivers/memory/fsl_ifc.c                 | 2 +-
 drivers/memory/jz4780-nemc.c             | 1 -
 drivers/memory/pl353-smc.c               | 1 +
 drivers/memory/renesas-rpc-if.c          | 1 -
 drivers/memory/samsung/exynos5422-dmc.c  | 2 +-
 drivers/memory/stm32-fmc2-ebi.c          | 2 ++
 drivers/memory/tegra/mc.c                | 2 +-
 drivers/memory/tegra/tegra124.c          | 2 +-
 drivers/memory/tegra/tegra186.c          | 3 ++-
 drivers/memory/tegra/tegra20.c           | 3 ++-
 drivers/memory/tegra/tegra210-emc-core.c | 4 ++--
 drivers/memory/tegra/tegra30-emc.c       | 2 +-
 drivers/memory/tegra/tegra30.c           | 2 +-
 15 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/brcmstb_dpfe.c b/drivers/memory/brcmstb_dpfe.c
index 9339f80b21c5..a7ab3d377206 100644
--- a/drivers/memory/brcmstb_dpfe.c
+++ b/drivers/memory/brcmstb_dpfe.c
@@ -32,8 +32,7 @@
 #include <linux/firmware.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #define DRVNAME			"brcmstb-dpfe"
diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
index 0ef8cc878b95..2bf34da85d22 100644
--- a/drivers/memory/da8xx-ddrctl.c
+++ b/drivers/memory/da8xx-ddrctl.c
@@ -10,7 +10,6 @@
 
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 9e8d8e9c5ad8..2509e5152036 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -15,7 +15,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/fsl_ifc.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 555f7ac3b7dd..e5a93e7da15f 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -12,7 +12,6 @@
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index d39ee7d06665..48540817e046 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/amba/bus.h>
diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 75fcba45ec1b..9695b2d3ae59 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
diff --git a/drivers/memory/samsung/exynos5422-dmc.c b/drivers/memory/samsung/exynos5422-dmc.c
index c491cd549644..6d019dbd721c 100644
--- a/drivers/memory/samsung/exynos5422-dmc.c
+++ b/drivers/memory/samsung/exynos5422-dmc.c
@@ -13,7 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index ffec26a99313..9015e8277dc8 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -7,8 +7,10 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 4a750da1c12a..b3d72af80442 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -11,7 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index d780a84241fe..470b7dbab2c2 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/device.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/memory/tegra124-mc.h>
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 7bb73f06fad3..533f85a4b2bd 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -7,7 +7,8 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 #include <soc/tegra/mc.h>
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index fcd7738fcb53..544bfd216a22 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -5,8 +5,9 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index ae5f982f861b..3300bde47c13 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -9,10 +9,10 @@
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 #include <soc/tegra/fuse.h>
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index c91e9b7e2e01..9eae25c57ec6 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -22,7 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 84316357513d..06f8b35e0a14 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -3,8 +3,8 @@
  * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/memory/tegra30-mc.h>
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
