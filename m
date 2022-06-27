Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB63566723
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jul 2022 11:56:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82EFBC640F7;
	Tue,  5 Jul 2022 09:56:07 +0000 (UTC)
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44608C640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 09:56:06 +0000 (UTC)
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
 (envelope-from <mchehab@linuxtv.org>)
 id 1o8fHn-00FTUN-6D; Tue, 05 Jul 2022 09:56:03 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 27 Jun 2022 08:15:07 +0000
To: linuxtv-commits@linuxtv.org
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Message-Id: <E1o8fHn-00FTUN-6D@www.linuxtv.org>
Cc: Marek Vasut <marex@denx.de>, Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [git:media_tree/master] media: stm32: dcmi: Fill in
	remaining Bayer formats
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
Reply-To: linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: stm32: dcmi: Fill in remaining Bayer formats
Author:  Marek Vasut <marex@denx.de>
Date:    Sat Jun 18 23:23:17 2022 +0100

Fill in 10, 12, 14 bit Bayer formats into the DCMI driver.
Those are useful e.g. when MT9P006 sensor is connected.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

 drivers/media/platform/st/stm32/stm32-dcmi.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

---

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 09a743cd7004..5f08ba47ea96 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1631,6 +1631,54 @@ static const struct dcmi_format dcmi_formats[] = {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.bpp = 2,
 	},
 };
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
