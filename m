Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D934994689
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 13:21:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE2E1C7801F;
	Tue,  8 Oct 2024 11:21:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 666A9C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 11:21:47 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498A7J4T022075;
 Tue, 8 Oct 2024 13:21:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CZJJk/AWmyy2dhy9P2NmD4Kl4AXjFto8B4d1y7AFZJ0=; b=Je2XFAV+pm1Mhpva
 Vuky+p727UTIA9LAQwJZkCPTN5UbGe58W0LQ2KJJvtv/+S64QWtRaTQsJ4l8dXMz
 cKuC/9Y8t0XcopMFob8gG8TfSPQDzBzb7Jvp2C5cAjnHOXszPKO+sSPt3ViOmil7
 jrTei/A9yg5x3TEnHXk9E3vXpSt3FLt9LxGe00DyuqCUPra1ar7uBDmpSwpyG7Vz
 kTx32H7tt1zJeF/verDqmDWqZ/SI5FoCk3k3FsVI2GlbUk3mWwQVjShrpWLP7+dX
 dBSI6QNVuLGT+SV9tYMIJ24wAd54m+Q6WDFjWgR/URE/CpwSPo+bZq6OgNhfNgrg
 /gbMKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10u8bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 13:21:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DCCD440059;
 Tue,  8 Oct 2024 13:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18B0928519A;
 Tue,  8 Oct 2024 13:18:18 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:17 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:09 +0200
MIME-Version: 1.0
Message-ID: <20241008-csi_dcmipp_mp25-v1-7-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 07/15] media: stm32: dcmipp: add support for
 csi input into dcmipp-input
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

On stm32mp25, the dcmipp can accept data coming from a CSI bus in
addition to the parallel interface.  Add this support into
dcmipp-input subdev.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 134 +++++++++++++++++----
 1 file changed, 110 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 106f2a559812..7e5311b67d7e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/v4l2-mediabus.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-subdev.h>
 
@@ -19,6 +20,9 @@
 #define DCMIPP_PRCR_FORMAT_YUV422	0x1e
 #define DCMIPP_PRCR_FORMAT_RGB565	0x22
 #define DCMIPP_PRCR_FORMAT_RAW8		0x2a
+#define DCMIPP_PRCR_FORMAT_RAW10	0x2b
+#define DCMIPP_PRCR_FORMAT_RAW12	0x2c
+#define DCMIPP_PRCR_FORMAT_RAW14	0x2d
 #define DCMIPP_PRCR_FORMAT_G8		0x4a
 #define DCMIPP_PRCR_FORMAT_BYTE_STREAM	0x5a
 #define DCMIPP_PRCR_ESS			BIT(4)
@@ -31,43 +35,75 @@
 #define DCMIPP_PRESCR	0x108
 #define DCMIPP_PRESUR	0x10c
 
+#define DCMIPP_CMCR	0x204
+#define DCMIPP_CMCR_INSEL	BIT(0)
+
+#define DCMIPP_P0FSCR	0x404
+#define DCMIPP_P0FSCR_DTMODE_MASK	GENMASK(17, 16)
+#define DCMIPP_P0FSCR_DTMODE_SHIFT	16
+#define DCMIPP_P0FSCR_DTMODE_DTIDA	0x00
+#define DCMIPP_P0FSCR_DTMODE_ALLDT	0x03
+#define DCMIPP_P0FSCR_DTIDA_MASK	GENMASK(5, 0)
+#define DCMIPP_P0FSCR_DTIDA_SHIFT	0
+
 #define IS_SINK(pad) (!(pad))
 #define IS_SRC(pad)  ((pad))
 
 struct dcmipp_inp_pix_map {
 	unsigned int code_sink;
 	unsigned int code_src;
+	/* Parallel related information */
 	u8 prcr_format;
 	u8 prcr_swapcycles;
+	/* CSI related information */
+	unsigned int dt;
 };
 
-#define PIXMAP_SINK_SRC_PRCR_SWAP(sink, src, prcr, swap)	\
+#define PIXMAP_SINK_SRC_PRCR_SWAP(sink, src, prcr, swap, data_type)	\
 	{							\
 		.code_sink = MEDIA_BUS_FMT_##sink,		\
 		.code_src = MEDIA_BUS_FMT_##src,		\
 		.prcr_format = DCMIPP_PRCR_FORMAT_##prcr,	\
 		.prcr_swapcycles = swap,			\
+		.dt = data_type,				\
 	}
 static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	/* RGB565 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_LE, RGB565_2X8_LE, RGB565, 1, MIPI_CSI2_DT_RGB565),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_2X8_BE, RGB565_2X8_LE, RGB565, 0, MIPI_CSI2_DT_RGB565),
+	PIXMAP_SINK_SRC_PRCR_SWAP(RGB565_1X16, RGB565_1X16, RGB565, 0, MIPI_CSI2_DT_RGB565),
 	/* YUV422 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1),
-	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_1X16, UYVY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_1X16, YVYU8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
-	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
 	/* Raw Bayer */
-	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG8_1X8, SGRBG8_1X8, RAW8, 0),
-	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB8_1X8, SRGGB8_1X8, RAW8, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR8_1X8, SBGGR8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG8_1X8, SGBRG8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG8_1X8, SGRBG8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB8_1X8, SRGGB8_1X8, RAW8, 0, MIPI_CSI2_DT_RAW8),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR10_1X10, SBGGR10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG10_1X10, SGBRG10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG10_1X10, SGRBG10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB10_1X10, SRGGB10_1X10, RAW10, 0, MIPI_CSI2_DT_RAW10),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR12_1X12, SBGGR12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG12_1X12, SGBRG12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG12_1X12, SGRBG12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB12_1X12, SRGGB12_1X12, RAW12, 0, MIPI_CSI2_DT_RAW12),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SBGGR14_1X14, SBGGR14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGBRG14_1X14, SGBRG14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SGRBG14_1X14, SGRBG14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
+	PIXMAP_SINK_SRC_PRCR_SWAP(SRGGB14_1X14, SRGGB14_1X14, RAW14, 0, MIPI_CSI2_DT_RAW14),
 	/* JPEG */
-	PIXMAP_SINK_SRC_PRCR_SWAP(JPEG_1X8, JPEG_1X8, BYTE_STREAM, 0),
+	PIXMAP_SINK_SRC_PRCR_SWAP(JPEG_1X8, JPEG_1X8, BYTE_STREAM, 0, 0),
 };
 
 /*
@@ -260,8 +296,8 @@ static int dcmipp_inp_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int dcmipp_inp_configure(struct dcmipp_inp_device *inp,
-				struct v4l2_subdev_state *state)
+static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
+					 struct v4l2_subdev_state *state)
 {
 	u32 val = 0;
 	const struct dcmipp_inp_pix_map *vpix;
@@ -315,6 +351,52 @@ static int dcmipp_inp_configure(struct dcmipp_inp_device *inp,
 
 	reg_write(inp, DCMIPP_PRCR, val);
 
+	/* Select the DCMIPP parallel interface */
+	reg_write(inp, DCMIPP_CMCR, 0);
+
+	/* Enable parallel interface */
+	reg_set(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+
+	return 0;
+}
+
+static int dcmipp_inp_configure_csi(struct dcmipp_inp_device *inp,
+				    struct v4l2_subdev_state *state)
+{
+	const struct dcmipp_inp_pix_map *vpix;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_mbus_framefmt *src_fmt;
+
+	/* Get format information */
+	sink_fmt = v4l2_subdev_state_get_format(state, 0);
+	src_fmt = v4l2_subdev_state_get_format(state, 1);
+
+	vpix = dcmipp_inp_pix_map_by_code(sink_fmt->code, src_fmt->code);
+	if (!vpix) {
+		dev_err(inp->dev, "Invalid sink/src format configuration\n");
+		return -EINVAL;
+	}
+
+	/* Apply configuration on each input pipe */
+	reg_clear(inp, DCMIPP_P0FSCR,
+		  DCMIPP_P0FSCR_DTMODE_MASK | DCMIPP_P0FSCR_DTIDA_MASK);
+
+	/* In case of JPEG we don't know the DT so we allow all data */
+	/*
+	 * TODO - check instead dt == 0 for the time being to allow other
+	 * unknown data-type
+	 */
+	if (!vpix->dt)
+		reg_set(inp, DCMIPP_P0FSCR,
+			DCMIPP_P0FSCR_DTMODE_ALLDT << DCMIPP_P0FSCR_DTMODE_SHIFT);
+	else
+		reg_set(inp, DCMIPP_P0FSCR,
+			vpix->dt << DCMIPP_P0FSCR_DTIDA_SHIFT |
+			DCMIPP_P0FSCR_DTMODE_DTIDA);
+
+	/* Select the DCMIPP CSI interface */
+	reg_write(inp, DCMIPP_CMCR, DCMIPP_CMCR_INSEL);
+
 	return 0;
 }
 
@@ -326,7 +408,7 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 				container_of(sd, struct dcmipp_inp_device, sd);
 	struct v4l2_subdev *s_subdev;
 	struct media_pad *s_pad;
-	int ret;
+	int ret = 0;
 
 	/* Get source subdev */
 	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
@@ -334,13 +416,14 @@ static int dcmipp_inp_enable_streams(struct v4l2_subdev *sd,
 		return -EINVAL;
 	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
 
-	ret = dcmipp_inp_configure(inp);
+	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
+	    inp->ved.bus_type == V4L2_MBUS_BT656)
+		ret = dcmipp_inp_configure_parallel(inp, state);
+	else if (inp->ved.bus_type == V4L2_MBUS_CSI2_DPHY)
+		ret = dcmipp_inp_configure_csi(inp, state);
 	if (ret)
 		return ret;
 
-	/* Enable parallel interface */
-	reg_set(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
-
 	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
 	if (ret < 0) {
 		dev_err(inp->dev,
@@ -374,8 +457,11 @@ static int dcmipp_inp_disable_streams(struct v4l2_subdev *sd,
 		return ret;
 	}
 
-	/* Disable parallel interface */
-	reg_clear(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	if (inp->ved.bus_type == V4L2_MBUS_PARALLEL ||
+	    inp->ved.bus_type == V4L2_MBUS_BT656) {
+		/* Disable parallel interface */
+		reg_clear(inp, DCMIPP_PRCR, DCMIPP_PRCR_ENABLE);
+	}
 
 	return 0;
 }

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
