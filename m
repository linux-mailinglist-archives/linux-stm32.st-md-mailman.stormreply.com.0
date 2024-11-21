Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD5E9D4DA9
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2024 14:22:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CE34C6C855;
	Thu, 21 Nov 2024 13:22:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB6FC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2024 13:22:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALBeQQh032344;
 Thu, 21 Nov 2024 14:21:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e8LQCstHdgkhmoXO872hDxjShUfxudEBRkObGgEdqWo=; b=p6FrRAACkwPjjSPA
 11INp/FuzrKreawEA7zwbc9yrlJLSbr0jj8vXerS/5MDbBqw73VHXTgTPYnHNwZV
 0+5E1pHvGV4Ltbp8wYeJx92nC3IkzPxxOFVD1NQkqmJLXyn7timay4tVcwRZtjWp
 i09uToGmr272+PNOpS+DM+5Pj2JX4eN0+8aPUuOniExrZ7uNt4p0b1L9sVtAuj6c
 HzD3kHTp1duHnxuS2xEY5vzDYe3LE9IbiXREQoc4Uq+SUo+W/KIkSpxjAsaWvzfA
 bAV2ZHeRgQHhWT3Hiltyc0lQDmRK+VLujHyJksDU8POm1L0utw5HjmBF08S0f1iQ
 PkymNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf6rsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 14:21:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C22244002D;
 Thu, 21 Nov 2024 14:20:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D65D22843D2;
 Thu, 21 Nov 2024 14:19:07 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:07 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Hugues Fruchet
 <hugues.fruchet@foss.st.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Erling Ljunggren <hljunggr@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 21 Nov 2024 14:19:02 +0100
Message-ID: <20241121131904.261230-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Subject: [Linux-stm32] [PATCH v3 1/3] media: uapi: add WebP uAPI
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

This patch adds the WebP picture decoding kernel uAPI.

This design is based on currently available VP8 API implementation and
aims to support the development of WebP stateless video codecs
on Linux.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
 .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 4 files changed, 28 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 35674eeae20d..df3e963fc54f 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -447,3 +447,12 @@ AV1
 :title:     AV1 Bitstream & Decoding Process Specification
 
 :author:    Peter de Rivaz, Argon Design Ltd, Jack Haughton, Argon Design Ltd
+
+.. _webp:
+
+WEBP
+====
+
+:title:     WEBP picture Bitstream & Decoding Process Specification
+
+:author:    Google (https://developers.google.com/speed/webp)
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 806ed73ac474..08a989511e7d 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -169,6 +169,23 @@ Compressed Formats
 	this pixel format. The output buffer must contain the appropriate number
 	of macroblocks to decode a full corresponding frame to the matching
 	capture buffer.
+    * .. _V4L2-PIX-FMT-WEBP-FRAME:
+
+      - ``V4L2_PIX_FMT_WEBP_FRAME``
+      - 'WEBP'
+      - WEBP VP8 parsed frame, excluding WEBP RIFF header, keeping only the VP8
+	bitstream including the frame header, as extracted from the container.
+	This format is adapted for stateless video decoders that implement a
+	WEBP pipeline with the :ref:`stateless_decoder`.
+	Metadata associated with the frame to decode is required to be passed
+	through the ``V4L2_CID_STATELESS_VP8_FRAME`` control.
+	See the :ref:`associated Codec Control IDs <v4l2-codec-stateless-vp8>`.
+	Because of key frames only bitstream, ``V4L2_VP8_FRAME_FLAG_KEY_FRAME``
+	flag must be set, see :ref:`Frame Flags <vp8_frame_flags>`.
+	Exactly one output and one capture buffer must be provided for use with
+	this pixel format. The output buffer must contain the appropriate number
+	of macroblocks to decode a full corresponding frame to the matching
+	capture buffer.
 
     * .. _V4L2-PIX-FMT-VP9:
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..e2ff03d0d773 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1501,6 +1501,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_VC1_ANNEX_L:	descr = "VC-1 (SMPTE 412M Annex L)"; break;
 		case V4L2_PIX_FMT_VP8:		descr = "VP8"; break;
 		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
+		case V4L2_PIX_FMT_WEBP_FRAME:    descr = "WEBP VP8 Frame"; break;
 		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
 		case V4L2_PIX_FMT_VP9_FRAME:    descr = "VP9 Frame"; break;
 		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..09fff269e852 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -757,6 +757,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L') /* SMPTE 421M Annex L compliant stream */
 #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
+#define V4L2_PIX_FMT_WEBP_FRAME v4l2_fourcc('W', 'B', 'P', 'F') /* WEBP VP8 parsed frame */
 #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
 #define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
 #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
