Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 675ED7540C8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 19:44:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB31C6B44F;
	Fri, 14 Jul 2023 17:44:41 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FD84C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 17:44:39 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7872d448c5aso89994839f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 10:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689356678; x=1691948678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VtjcGGt85IZMCa+mEEA7O0gZ6wqolQXg/0SyxtwNezE=;
 b=CWCSyoo4iprxgX9ldx7+Txs+mCzcNGX0TGI3BHpWLeIZNEBhnYgmec53e/uQ4Ag9QQ
 P9bSj0yXLgf15ofgB8J/hbZLiB8hGlZ20yz/KTo+8ZmtgSuft7cCTiZ9qQfE0bEFf5ha
 lCzyxnKh+tTxqdpYF4yVyNRRY/35r71EX1Rc7xW4Z8MTTCgqXtK3mNEHa5P+1KXmCxiU
 aa4+usFt7Wnk+OqMr/yKdSFxLUxJjJ3waLYIa66WtLksW1a20V4E2uUPC7i5LOgpZRnM
 aUISuIUfsiJ+b0NldAfearzrkGDSVFwckus+w15UEB3OkbPFx1qIRd92N5199UlZ88Rm
 WCbQ==
X-Gm-Message-State: ABy/qLZYAf7e1DxYfRehmceQ5MfoYzEMzYrFSBr91+VxVPrshZ+FqSPp
 CvpPvehzpPOIaW1N2LM9ZA==
X-Google-Smtp-Source: APBJJlGQtIflGF1mT3Lwdz2E7oxJQCR+E1W9CJR407r7zma02hoqOmUhTsVE3Jg4rsZdBeQyxbHKsQ==
X-Received: by 2002:a6b:902:0:b0:786:98bd:66d4 with SMTP id
 t2-20020a6b0902000000b0078698bd66d4mr5912011ioi.15.1689356678173; 
 Fri, 14 Jul 2023 10:44:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a02cdd1000000b0042bc199556dsm2811774jap.21.2023.07.14.10.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 10:44:37 -0700 (PDT)
Received: (nullmailer pid 4054684 invoked by uid 1000);
 Fri, 14 Jul 2023 17:44:33 -0000
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Michal Simek <michal.simek@amd.com>
Date: Fri, 14 Jul 2023 11:44:28 -0600
Message-Id: <20230714174430.4054533-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 asahi@lists.linux.dev, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: Explicitly include correct DT
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
 drivers/dma/apple-admac.c                      | 3 ++-
 drivers/dma/at_hdmac.c                         | 2 +-
 drivers/dma/bcm-sba-raid.c                     | 4 +++-
 drivers/dma/bestcomm/bestcomm.c                | 4 +---
 drivers/dma/dma-jz4780.c                       | 1 -
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 1 -
 drivers/dma/dw/rzn1-dmamux.c                   | 4 +++-
 drivers/dma/fsl-qdma.c                         | 4 ++--
 drivers/dma/fsl_raid.c                         | 3 ++-
 drivers/dma/fsldma.c                           | 3 ++-
 drivers/dma/img-mdc-dma.c                      | 1 -
 drivers/dma/imx-dma.c                          | 2 +-
 drivers/dma/imx-sdma.c                         | 1 -
 drivers/dma/lpc18xx-dmamux.c                   | 4 +++-
 drivers/dma/mediatek/mtk-cqdma.c               | 1 -
 drivers/dma/mediatek/mtk-hsdma.c               | 1 -
 drivers/dma/mediatek/mtk-uart-apdma.c          | 1 -
 drivers/dma/mpc512x_dma.c                      | 4 ++--
 drivers/dma/mxs-dma.c                          | 1 -
 drivers/dma/nbpfaxi.c                          | 1 -
 drivers/dma/owl-dma.c                          | 3 ++-
 drivers/dma/ppc4xx/adma.c                      | 2 +-
 drivers/dma/qcom/hidma.c                       | 2 +-
 drivers/dma/sh/shdmac.c                        | 1 -
 drivers/dma/sprd-dma.c                         | 2 +-
 drivers/dma/stm32-dmamux.c                     | 4 +++-
 drivers/dma/stm32-mdma.c                       | 1 -
 drivers/dma/sun6i-dma.c                        | 2 +-
 drivers/dma/tegra186-gpc-dma.c                 | 2 +-
 drivers/dma/tegra20-apb-dma.c                  | 1 -
 drivers/dma/tegra210-adma.c                    | 3 ++-
 drivers/dma/ti/dma-crossbar.c                  | 5 +++--
 drivers/dma/ti/edma.c                          | 1 -
 drivers/dma/ti/k3-udma-private.c               | 2 ++
 drivers/dma/ti/k3-udma.c                       | 1 -
 drivers/dma/ti/omap-dma.c                      | 2 +-
 drivers/dma/xgene-dma.c                        | 3 ++-
 drivers/dma/xilinx/xilinx_dma.c                | 4 ++--
 drivers/dma/xilinx/zynqmp_dma.c                | 3 ++-
 39 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 4cf8da77bdd9..3af795635c5c 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -10,8 +10,9 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index ee3a219e3a89..b2876f67471f 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -20,7 +20,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/overflow.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 064761289a73..94ea35330eb5 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -35,7 +35,9 @@
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/brcm-message.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/raid/pq.h>
 
diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index eabbcfcaa7cb..466dd9919c4a 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -14,9 +14,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/mpc52xx.h>
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 9c1a6e9a9c03..adbd47bd6adf 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -13,7 +13,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 796b6caf0bab..dd02f84e404d 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -21,7 +21,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/dw/rzn1-dmamux.c b/drivers/dma/dw/rzn1-dmamux.c
index f9912c3dd4d7..4fb8508419db 100644
--- a/drivers/dma/dw/rzn1-dmamux.c
+++ b/drivers/dma/dw/rzn1-dmamux.c
@@ -5,8 +5,10 @@
  * Based on TI crossbar driver written by Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 #include <linux/bitops.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/soc/renesas/r9a06g032-sysctrl.h>
 #include <linux/types.h>
diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index eddb2688f234..a8cc8a4bc610 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -13,10 +13,10 @@
 
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
 
 #include "virt-dma.h"
 #include "fsldma.h"
diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index fdf3500d96a9..0b9ca93ce3dc 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -60,9 +60,10 @@
  */
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
 #include <linux/dmaengine.h>
diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index f8459cc5315d..ddcf736d283d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -28,9 +28,10 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/fsldma.h>
 #include "dmaengine.h"
 #include "fsldma.h"
diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index ad084552640f..9be0d3226e19 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -17,7 +17,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index f040751690af..114f254b9f50 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -21,7 +21,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
 
 #include <asm/irq.h>
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 7a912f90c2a9..51012bd39900 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -31,7 +31,6 @@
 #include <linux/dmaengine.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/workqueue.h>
 
diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
index df98cae8792b..2b6436f4b193 100644
--- a/drivers/dma/lpc18xx-dmamux.c
+++ b/drivers/dma/lpc18xx-dmamux.c
@@ -12,8 +12,10 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 9ae92b8940ef..324b7387b1b9 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -18,7 +18,6 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 69cc61c0b262..64120767d983 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -17,7 +17,6 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index a1517ef1f4a0..69366ba5db65 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -16,7 +16,6 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 4a51fdbf5aa9..1104017320b8 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -36,11 +36,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_dma.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <linux/random.h>
 
diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index acc4d53e4630..cfb9962417ef 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -21,7 +21,6 @@
 #include <linux/module.h>
 #include <linux/stmp_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/list.h>
 #include <linux/dma/mxs-dma.h>
diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index e72e8c10355e..0b2f96fd8bf0 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -15,7 +15,6 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 95a462a1f511..e745f0c67094 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -20,8 +20,9 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include "virt-dma.h"
 
diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 686c270ef710..f9b82dff3387 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -28,7 +28,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/dcr.h>
 #include <asm/dcr-regs.h>
 #include "adma.h"
diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 344525c3a32f..5baf7e593ea5 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -45,12 +45,12 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/of_dma.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/delay.h>
 #include <linux/acpi.h>
diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
index 5aafe548ca5f..6f881d7d2f79 100644
--- a/drivers/dma/sh/shdmac.c
+++ b/drivers/dma/sh/shdmac.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rculist.h>
diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 2b639adb48ba..168aa0bd73a0 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index e415bd9f4f2b..8d77e2a7939a 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -15,8 +15,10 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 1d0e9dd72ab3..0de234022c6d 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -24,7 +24,6 @@
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ebfd29888b2f..2469efddf540 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -14,8 +14,8 @@
 #include <linux/dmapool.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 8f67f453a492..33b101001100 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -13,7 +13,7 @@
 #include <linux/iopoll.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index cc6b91f48979..063022f9df76 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -17,7 +17,6 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index b97004036071..e557bada1510 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -8,9 +8,10 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
diff --git a/drivers/dma/ti/dma-crossbar.c b/drivers/dma/ti/dma-crossbar.c
index f744ddbbbad7..7f17ee87a6dc 100644
--- a/drivers/dma/ti/dma-crossbar.c
+++ b/drivers/dma/ti/dma-crossbar.c
@@ -3,14 +3,15 @@
  *  Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_platform.h>
 
 #define TI_XBAR_DRA7		0
 #define TI_XBAR_AM335X		1
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 9ea91c640c32..aa8e2e8ac260 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -20,7 +20,6 @@
 #include <linux/of_dma.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #include <linux/platform_data/edma.h>
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 85e00701473c..05228bf00033 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -3,6 +3,8 @@
  *  Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
+#include <linux/of.h>
+#include <linux/of_platform.h>
 
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index eb4dc5fffe64..30fd2f386f36 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -20,7 +20,6 @@
 #include <linux/sys_soc.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 02e1c08c596d..cf96cf915c0c 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -16,8 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_device.h>
 
 #include "../virt-dma.h"
 
diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3589b4ef50b8..bb4ff8c86733 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -18,8 +18,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "dmaengine.h"
 
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index ac09f0e5f58d..8a4c98d28dfc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -41,10 +41,10 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_platform.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 9360f43b8e0f..bd8c3cc2eaab 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -11,8 +11,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_dma.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
