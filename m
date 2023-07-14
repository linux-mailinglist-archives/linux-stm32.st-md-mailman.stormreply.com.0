Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E802C7540F7
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 19:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6AF0C6B452;
	Fri, 14 Jul 2023 17:47:25 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79512C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 17:47:24 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3465bd756afso10335125ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 10:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356843; x=1691948843;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPqdUUqkc4rI75UMAc4Xs8y3YEcjzz1RiNA4x7IYBHU=;
 b=CIRS+4j3YT2RGTOCTMWhGmEeX4kmGOySliLiGKYpjxC/aGJqTSeyi/oNJNOtkaYKtC
 8u6YIQ5NAC38nJDPXkFPmjWuxjMhBS4Dm/P6woxmvKPGiq62wdagT3qwCSuc/qyL6I09
 gw0fiG+JgONavxuQoQGnboDuXtXAkVCiLX9EwRdNbFEzcjKFCzDqBU3Ms8/7Pd1tXiaI
 rzVsGaQ4sY5XCEWAN9u43UGB/3S7aM3ZW3fJ2r/AQI+nRnBya4jlqwVaiv0jY4Gu8WFX
 D9eXISj6XIQ3F1YqUjXOzOHk7dnUgNiY6RGzHhub7dY8DVlQBZYeWVRV2RqO/IRCj1Vf
 AeHw==
X-Gm-Message-State: ABy/qLaLDUdUFLv8H8ITgHFVjfJ0QFK5yMPjeV3B23CIJeWBsBl+Fjvh
 W9mXz9hr9gPvBMFVI/PLNQ==
X-Google-Smtp-Source: APBJJlE9mCouhYM8S5pU14gRiUMFnROknyjtSCY83LyzowqhqRu2tyhgLmXsFN5YRo8A9ohFE0CbNg==
X-Received: by 2002:a92:c6ce:0:b0:346:46e:2099 with SMTP id
 v14-20020a92c6ce000000b00346046e2099mr5032285ilm.1.1689356843369; 
 Fri, 14 Jul 2023 10:47:23 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 gu16-20020a0566382e1000b0042b534e9f52sm2642967jab.59.2023.07.14.10.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:47:22 -0700 (PDT)
Received: (nullmailer pid 4059270 invoked by uid 1000);
 Fri, 14 Jul 2023 17:47:07 -0000
From: Rob Herring <robh@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>
Date: Fri, 14 Jul 2023 11:47:01 -0600
Message-Id: <20230714174702.4059100-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mailbox: Explicitly include correct DT
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
 drivers/mailbox/arm_mhu.c            | 1 +
 drivers/mailbox/arm_mhu_db.c         | 1 -
 drivers/mailbox/hi3660-mailbox.c     | 1 +
 drivers/mailbox/hi6220-mailbox.c     | 1 +
 drivers/mailbox/imx-mailbox.c        | 3 ++-
 drivers/mailbox/mailbox-mpfs.c       | 1 +
 drivers/mailbox/mailbox.c            | 1 +
 drivers/mailbox/mtk-adsp-mailbox.c   | 3 ++-
 drivers/mailbox/mtk-cmdq-mailbox.c   | 2 +-
 drivers/mailbox/omap-mailbox.c       | 2 +-
 drivers/mailbox/platform_mhu.c       | 1 +
 drivers/mailbox/rockchip-mailbox.c   | 2 +-
 drivers/mailbox/sprd-mailbox.c       | 2 +-
 drivers/mailbox/stm32-ipcc.c         | 1 +
 drivers/mailbox/tegra-hsp.c          | 1 -
 drivers/mailbox/zynqmp-ipi-mailbox.c | 2 --
 16 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
index 22243cabe056..537f7bfb7b06 100644
--- a/drivers/mailbox/arm_mhu.c
+++ b/drivers/mailbox/arm_mhu.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 #define INTR_STAT_OFS	0x0
 #define INTR_SET_OFS	0x8
diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index aa0a4d83880f..27a510d46908 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -15,7 +15,6 @@
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #define INTR_STAT_OFS	0x0
 #define INTR_SET_OFS	0x8
diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index ab24e731a782..17c29e960fbf 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -11,6 +11,7 @@
 #include <linux/iopoll.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mailbox/hi6220-mailbox.c b/drivers/mailbox/hi6220-mailbox.c
index 1c73c63598f5..f77741ce42e7 100644
--- a/drivers/mailbox/hi6220-mailbox.c
+++ b/drivers/mailbox/hi6220-mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/kfifo.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 20f2ec880ad6..3ef4dd8adf5d 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -14,7 +14,8 @@
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
 #include <linux/slab.h>
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 162df49654fb..20ee283a04cc 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/mailbox_controller.h>
 #include <soc/microchip/mpfs.h>
diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index adf36c05fa43..ebff3baf3045 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -17,6 +17,7 @@
 #include <linux/bitops.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox_controller.h>
+#include <linux/of.h>
 
 #include "mailbox.h"
 
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
index 14bc0057de81..91487aa4d7da 100644
--- a/drivers/mailbox/mtk-adsp-mailbox.c
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -10,7 +10,8 @@
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 struct mtk_adsp_mbox_priv {
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index b18d47ea13a0..4d62b07c1411 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
 #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size / CMDQ_INST_SIZE)
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index fa2ce3246b70..792bcaebbc9b 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -16,7 +16,7 @@
 #include <linux/kfifo.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/omap-mailbox.h>
diff --git a/drivers/mailbox/platform_mhu.c b/drivers/mailbox/platform_mhu.c
index a5922ac0b0bf..54161303a36b 100644
--- a/drivers/mailbox/platform_mhu.c
+++ b/drivers/mailbox/platform_mhu.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/mailbox_controller.h>
diff --git a/drivers/mailbox/rockchip-mailbox.c b/drivers/mailbox/rockchip-mailbox.c
index 116286ecc5a0..10c7bee2a915 100644
--- a/drivers/mailbox/rockchip-mailbox.c
+++ b/drivers/mailbox/rockchip-mailbox.c
@@ -8,8 +8,8 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
+#include <linux/of.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #define MAILBOX_A2B_INTEN		0x00
diff --git a/drivers/mailbox/sprd-mailbox.c b/drivers/mailbox/sprd-mailbox.c
index e3c899abeed8..9ae57de77d4d 100644
--- a/drivers/mailbox/sprd-mailbox.c
+++ b/drivers/mailbox/sprd-mailbox.c
@@ -11,7 +11,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 
diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 15d538fe2113..4ad3653f3866 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 7f98e7436d94..c87c2b900b64 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -8,7 +8,6 @@
 #include <linux/io.h>
 #include <linux/mailbox_controller.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index d097f45b0e5f..e4fcac97dbfa 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -16,8 +16,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 /* IPI agent ID any */
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
