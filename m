Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F887B7B8F
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 11:16:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2596EC6C834;
	Wed,  4 Oct 2023 09:16:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BD5C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:16:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3945iOO7022001; Wed, 4 Oct 2023 11:16:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=JSXv5uBlf7Nq7B8f/KA47gP5JBCzVC46AOMucC11/d4=; b=Pf
 YwpTPAOJKrpER8qIM7JsE0+emuAPcUbNt41bs4tJtT2Qq0iey3xx4Ehip8WZHQlE
 qR78xciz6M8sJ5a0ZRV29odkI7ajhd6ksZEoSlummh+042oh4Q5U184iP+fvv2x6
 6xz5+u3dvJah+OO5pZ8rf6CMcLEUpZSOrV0ai4PkyjtiNtPtyFtVNAVIX0/OHFEu
 AcO8VIkSCrPid4C+pxGiJ+xA1LjMEvrRxmCaRQX0nRdeBlAIwxZ8YzhxlEq0Y2LG
 n++ERxqzwq5DE2Xa3Z5rr7+PsJy41rFVQyUPWHj4YLNn8/zkAJwUBaJZmtcpKVDB
 p5zh4fHRbBNdLxKRRDVA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3teajd04r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:16:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AAB710005C;
 Wed,  4 Oct 2023 11:16:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71A2E22A6DB;
 Wed,  4 Oct 2023 11:16:00 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:16:00 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Date: Wed, 4 Oct 2023 11:15:47 +0200
Message-ID: <20231004091552.3531659-3-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [Linux-stm32] [PATCH 2/7] media: hantro: add support for STM32MP25
	VDEC
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

Add support for STM32MP25 VDEC video hardware decoder.
H264/VP8 decoding up to 4080x4080.
No post-processor support.
VDEC has its own reset/clock/irq.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/verisilicon/Kconfig    | 14 ++-
 drivers/media/platform/verisilicon/Makefile   |  3 +
 .../media/platform/verisilicon/hantro_drv.c   |  3 +
 .../media/platform/verisilicon/hantro_hw.h    |  1 +
 .../platform/verisilicon/stm32mp25_vdec_hw.c  | 92 +++++++++++++++++++
 5 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c

diff --git a/drivers/media/platform/verisilicon/Kconfig b/drivers/media/platform/verisilicon/Kconfig
index e65b836b9d78..7642ff9cf96c 100644
--- a/drivers/media/platform/verisilicon/Kconfig
+++ b/drivers/media/platform/verisilicon/Kconfig
@@ -4,7 +4,7 @@ comment "Verisilicon media platform drivers"
 
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
-	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || ARCH_STM32 || COMPILE_TEST
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
@@ -16,8 +16,8 @@ config VIDEO_HANTRO
 	select V4L2_VP9
 	help
 	  Support for the Hantro IP based Video Processing Units present on
-	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
-	  encoding and decoding.
+	  Rockchip, NXP i.MX8M and STM32MP25 SoCs, which accelerate video
+	  and image encoding and decoding.
 	  To compile this driver as a module, choose M here: the module
 	  will be called hantro-vpu.
 
@@ -52,3 +52,11 @@ config VIDEO_HANTRO_SUNXI
 	default y
 	help
 	  Enable support for H6 SoC.
+
+config VIDEO_HANTRO_STM32MP25
+	bool "Hantro STM32MP25 support"
+	depends on VIDEO_HANTRO
+	depends on ARCH_STM32 || COMPILE_TEST
+	default y
+	help
+	  Enable support for STM32MP25 SoCs.
diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index 6ad2ef885920..5854e0f0dd32 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -39,3 +39,6 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
 
 hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
 		sunxi_vpu_hw.o
+
+hantro-vpu-$(CONFIG_VIDEO_HANTRO_STM32MP25) += \
+		stm32mp25_vdec_hw.o
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 423fc85d79ee..8c6e0c66f0cd 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -732,6 +732,9 @@ static const struct of_device_id of_hantro_match[] = {
 #endif
 #ifdef CONFIG_VIDEO_HANTRO_SUNXI
 	{ .compatible = "allwinner,sun50i-h6-vpu-g2", .data = &sunxi_vpu_variant, },
+#endif
+#ifdef CONFIG_VIDEO_HANTRO_STM32MP25
+	{ .compatible = "st,stm32mp25-vdec", .data = &stm32mp25_vdec_variant, },
 #endif
 	{ /* sentinel */ }
 };
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 7f33f7b07ce4..b7eccc1a96fc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -406,6 +406,7 @@ extern const struct hantro_variant rk3568_vpu_variant;
 extern const struct hantro_variant rk3588_vpu981_variant;
 extern const struct hantro_variant sama5d4_vdec_variant;
 extern const struct hantro_variant sunxi_vpu_variant;
+extern const struct hantro_variant stm32mp25_vdec_variant;
 
 extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
 extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
diff --git a/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c
new file mode 100644
index 000000000000..c9f107bc09db
--- /dev/null
+++ b/drivers/media/platform/verisilicon/stm32mp25_vdec_hw.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * STM32MP25 VDEC video decoder driver
+ *
+ * Copyright (C) STMicroelectronics SA 2022
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          for STMicroelectronics.
+ *
+ */
+
+#include "hantro.h"
+
+/*
+ * Supported formats.
+ */
+
+static const struct hantro_fmt stm32mp25_vdec_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.codec_mode = HANTRO_MODE_NONE,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 96,
+			.max_width = 4080,
+			.step_width = MB_DIM,
+			.min_height = 96,
+			.max_height = 4080,
+			.step_height = MB_DIM,
+		},
+	},
+};
+
+/*
+ * Supported codec ops.
+ */
+
+static const struct hantro_codec_ops stm32mp25_vdec_codec_ops[] = {
+	[HANTRO_MODE_VP8_DEC] = {
+		.run = hantro_g1_vp8_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_vp8_dec_init,
+		.exit = hantro_vp8_dec_exit,
+	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = hantro_g1_h264_dec_run,
+		.reset = hantro_g1_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
+};
+
+static const struct hantro_irq stm32mp25_irqs[] = {
+	{ "vdec", hantro_g1_irq },
+};
+
+static const char * const stm32mp25_clk_names[] = { "vdec-clk" };
+
+const struct hantro_variant stm32mp25_vdec_variant = {
+	.dec_fmts = stm32mp25_vdec_fmts,
+	.num_dec_fmts = ARRAY_SIZE(stm32mp25_vdec_fmts),
+	.codec = HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
+	.codec_ops = stm32mp25_vdec_codec_ops,
+	.irqs = stm32mp25_irqs,
+	.num_irqs = ARRAY_SIZE(stm32mp25_irqs),
+	.clk_names = stm32mp25_clk_names,
+	.num_clocks = ARRAY_SIZE(stm32mp25_clk_names),
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
