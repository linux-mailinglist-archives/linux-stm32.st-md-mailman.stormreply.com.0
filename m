Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BC37B9D61
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 15:37:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE46AC6C837;
	Thu,  5 Oct 2023 13:37:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97EE1C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 13:37:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 395AZGOe025796; Thu, 5 Oct 2023 15:37:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=bgESotg1ucUNSxBe+XGbEGaW9PYWluU0WM6A0IsNEdg=; b=uq
 MnlkmQTce8tPsaEn1KwfINY1DSTItlcAoQi/PYzP5ozT0InASOzkSiTftTTutRgF
 dwrTs/7mIb/a77WSzthL6clcTMDlEIOJGrkYK/7E0GR82+7zfytYeLvUuFIZP6Me
 uB/ZELnsN0xT5Yl9XcgUSeoWvzQTOplWorqD99m3wkB8I/8KJJr5MiufoJRiE0hi
 CjX1fSOeflyWGq7TfBGorvIPuRNeeH94jNyL9R2+X0XwnUilMwQL+TyJ0Ixn6RFr
 1NYxxjQtcO3sc7yh9FICvdip4IGLZ+4Czv9nHjBEG9BDXWTA4mjVyjCgGRr73nRV
 Z7+t9rMq2BJTMTGatONQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thuh40rg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 15:37:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 922D610005D;
 Thu,  5 Oct 2023 15:37:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88377260280;
 Thu,  5 Oct 2023 15:37:34 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 15:37:34 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Thu, 5 Oct 2023 15:37:08 +0200
Message-ID: <20231005133710.3589080-5-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
References: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Adam Ford <aford173@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: [Linux-stm32] [RFC v2 4/6] media: hantro: add VP8 encode support
	for STM32MP25 VENC
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

Add VP8 stateless support for STM32MP25 VENC video hardware encoder.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../platform/verisilicon/stm32mp25_venc_hw.c  | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
index 0aac33afcadc..2176eccd1f79 100644
--- a/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
+++ b/drivers/media/platform/verisilicon/stm32mp25_venc_hw.c
@@ -87,6 +87,19 @@ static const struct hantro_fmt stm32mp25_venc_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
+		.codec_mode = HANTRO_MODE_VP8_ENC,
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
 };
 
 static irqreturn_t stm32mp25_venc_irq(int irq, void *dev_id)
@@ -120,6 +133,13 @@ static const struct hantro_codec_ops stm32mp25_venc_codec_ops[] = {
 		.reset = stm32mp25_venc_reset,
 		.done = hantro_h1_jpeg_enc_done,
 	},
+	[HANTRO_MODE_VP8_ENC] = {
+		.run = hantro_h1_vp8_enc_run,
+		.reset = stm32mp25_venc_reset,
+		.init = hantro_vp8_enc_init,
+		.done = hantro_h1_vp8_enc_done,
+		.exit = hantro_vp8_enc_exit,
+	},
 };
 
 /*
@@ -137,7 +157,7 @@ static const char * const stm32mp25_venc_clk_names[] = {
 const struct hantro_variant stm32mp25_venc_variant = {
 	.enc_fmts = stm32mp25_venc_fmts,
 	.num_enc_fmts = ARRAY_SIZE(stm32mp25_venc_fmts),
-	.codec = HANTRO_JPEG_ENCODER,
+	.codec = HANTRO_JPEG_ENCODER | HANTRO_VP8_ENCODER,
 	.codec_ops = stm32mp25_venc_codec_ops,
 	.irqs = stm32mp25_venc_irqs,
 	.num_irqs = ARRAY_SIZE(stm32mp25_venc_irqs),
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
