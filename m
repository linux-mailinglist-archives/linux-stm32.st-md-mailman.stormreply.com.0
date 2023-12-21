Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E439E81B61C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 13:42:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FAF9C6DD69;
	Thu, 21 Dec 2023 12:42:23 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77360C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703157518;
 bh=2y+AFJ2E2tAlzXWqVd2TVOftiClzXpdJZMYw206QFqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7Ia43BtOPNb4MY5rahsKjZbOfPa3c8NWWpc+GotYFgxQEoLvwpQ8ciCH/wx95l6L
 a4MXtzWvRoe+q0XNes5Dh8rS25on3HW+5EaL8rUW7LP/8ewIz21013N108kFdzlBSA
 ZHm0GE3k1vRuti69qaeiwpHhZub8HR6xkGPXD+pf+lexmRcymwzUoFvNFS65c5wOik
 EHBJ0+79hWVy4FBekWMrTHY/r1eEkJYwXtxo3BPm0EywChSCl3mWzyTJfn24G2DgrU
 Bhp8fh/V1MvJYRoFLLGtAxqYVtAKCIZzOKc0ERSOye2DpJ0wZ8H74YmjVfSXO+RL4C
 3a8Heq6g5PIlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: sebastianfricke)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F379B3782001;
 Thu, 21 Dec 2023 11:18:37 +0000 (UTC)
Date: Thu, 21 Dec 2023 12:18:37 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Message-ID: <20231221111837.4u22pmba7jd3hinj@basti-XPS-13-9310>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <20231221084723.2152034-4-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221084723.2152034-4-hugues.fruchet@foss.st.com>
X-Mailman-Approved-At: Thu, 21 Dec 2023 12:42:22 +0000
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v5 3/5] media: hantro: add support for
	STM32MP25 VENC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hey Hugues,

one small comment below, if it should turn out to be the only problem I
can fix it myself for the pull request.

On 21.12.2023 09:47, Hugues Fruchet wrote:
>Add support for STM32MP25 VENC video hardware encoder.
>Support of JPEG encoding.
>VENC has its own reset/clock/irq.
>
>Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
>Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>---
> drivers/media/platform/verisilicon/Makefile   |   3 +-
> .../media/platform/verisilicon/hantro_drv.c   |   1 +
> .../media/platform/verisilicon/hantro_hw.h    |   1 +
> .../platform/verisilicon/stm32mp25_venc_hw.c  | 115 ++++++++++++++++++
> 4 files changed, 119 insertions(+), 1 deletion(-)
> create mode 100644 drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
>
>diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
>index 5854e0f0dd32..3bf43fdbedc1 100644
>--- a/drivers/media/platform/verisilicon/Makefile
>+++ b/drivers/media/platform/verisilicon/Makefile
>@@ -41,4 +41,5 @@ hantro-vpu-$(CONFIG_VIDEO_HANTRO_SUNXI) += \
> 		sunxi_vpu_hw.o
>
> hantro-vpu-$(CONFIG_VIDEO_HANTRO_STM32MP25) += \
>-		stm32mp25_vdec_hw.o
>+		stm32mp25_vdec_hw.o \
>+		stm32mp25_venc_hw.o
>diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
>index 2db27c333924..4d97a8ac03de 100644
>--- a/drivers/media/platform/verisilicon/hantro_drv.c
>+++ b/drivers/media/platform/verisilicon/hantro_drv.c
>@@ -736,6 +736,7 @@ static const struct of_device_id of_hantro_match[] = {
> #endif
> #ifdef CONFIG_VIDEO_HANTRO_STM32MP25
> 	{ .compatible = "st,stm32mp25-vdec", .data = &stm32mp25_vdec_variant, },
>+	{ .compatible = "st,stm32mp25-venc", .data = &stm32mp25_venc_variant, },
> #endif
> 	{ /* sentinel */ }
> };
>diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
>index b7eccc1a96fc..70c72e9d11d5 100644
>--- a/drivers/media/platform/verisilicon/hantro_hw.h
>+++ b/drivers/media/platform/verisilicon/hantro_hw.h
>@@ -407,6 +407,7 @@ extern const struct hantro_variant rk3588_vpu981_variant;
> extern const struct hantro_variant sama5d4_vdec_variant;
> extern const struct hantro_variant sunxi_vpu_variant;
> extern const struct hantro_variant stm32mp25_vdec_variant;
>+extern const struct hantro_variant stm32mp25_venc_variant;
>
> extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
> extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
>diff --git a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
>new file mode 100644
>index 000000000000..0ff0f073b922
>--- /dev/null
>+++ b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
>@@ -0,0 +1,115 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * STM32MP25 VENC video encoder driver
>+ *
>+ * Copyright (C) STMicroelectronics SA 2022
>+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
>+ *          for STMicroelectronics.
>+ *
>+ */
>+
>+#include <linux/clk.h>
>+#include <linux/delay.h>
>+#include <linux/reset.h>
>+
>+#include "hantro.h"
>+#include "hantro_jpeg.h"
>+#include "hantro_h1_regs.h"
>+
>+/*
>+ * Supported formats.
>+ */
>+
>+static const struct hantro_fmt stm32mp25_venc_fmts[] = {
>+	{
>+		.fourcc = V4L2_PIX_FMT_YUV420M,
>+		.codec_mode = HANTRO_MODE_NONE,
>+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
>+	},
>+	{
>+		.fourcc = V4L2_PIX_FMT_NV12M,
>+		.codec_mode = HANTRO_MODE_NONE,
>+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
>+	},
>+	{
>+		.fourcc = V4L2_PIX_FMT_YUYV,
>+		.codec_mode = HANTRO_MODE_NONE,
>+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
>+	},
>+	{
>+		.fourcc = V4L2_PIX_FMT_UYVY,
>+		.codec_mode = HANTRO_MODE_NONE,
>+		.enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
>+	},
>+	{
>+		.fourcc = V4L2_PIX_FMT_JPEG,
>+		.codec_mode = HANTRO_MODE_JPEG_ENC,
>+		.max_depth = 2,
>+		.header_size = JPEG_HEADER_SIZE,
>+		.frmsize = {
>+			.min_width = 96,
>+			.max_width = FMT_4K_WIDTH,
>+			.step_width = MB_DIM,
>+			.min_height = 96,
>+			.max_height = FMT_4K_HEIGHT,
>+			.step_height = MB_DIM,
>+		},
>+	},
>+};
>+
>+static irqreturn_t stm32mp25_venc_irq(int irq, void *dev_id)
>+{
>+	struct hantro_dev *vpu = dev_id;
>+	enum vb2_buffer_state state;
>+	u32 status;
>+
>+	status = vepu_read(vpu, H1_REG_INTERRUPT);
>+	state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
>+		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>+
>+	vepu_write(vpu, H1_REG_INTERRUPT_BIT, H1_REG_INTERRUPT);
>+
>+	hantro_irq_done(vpu, state);
>+
>+	return IRQ_HANDLED;
>+}
>+
>+static void stm32mp25_venc_reset(struct hantro_ctx *ctx)
>+{
>+}
>+
>+/*
>+ * Supported codec ops.
>+ */
>+
>+static const struct hantro_codec_ops stm32mp25_venc_codec_ops[] = {
>+	[HANTRO_MODE_JPEG_ENC] = {
>+		.run = hantro_h1_jpeg_enc_run,
>+		.reset = stm32mp25_venc_reset,
>+		.done = hantro_h1_jpeg_enc_done,
>+	},
>+};
>+
>+/*
>+ * Variants.
>+ */
>+
>+static const struct hantro_irq stm32mp25_venc_irqs[] = {
>+	{ "venc", stm32mp25_venc_irq },
>+};
>+
>+static const char * const stm32mp25_venc_clk_names[] = {
>+	"venc-clk"
>+};
>+
>+const struct hantro_variant stm32mp25_venc_variant = {
>+	.enc_fmts = stm32mp25_venc_fmts,
>+	.num_enc_fmts = ARRAY_SIZE(stm32mp25_venc_fmts),
>+	.codec = HANTRO_JPEG_ENCODER,
>+	.codec_ops = stm32mp25_venc_codec_ops,
>+	.irqs = stm32mp25_venc_irqs,
>+	.num_irqs = ARRAY_SIZE(stm32mp25_venc_irqs),
>+	.clk_names = stm32mp25_venc_clk_names,
>+	.num_clocks = ARRAY_SIZE(stm32mp25_venc_clk_names)
>+};
>+

There is an superfluous new line here.

Greetings,
Sebastian

>-- 
>2.25.1
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
