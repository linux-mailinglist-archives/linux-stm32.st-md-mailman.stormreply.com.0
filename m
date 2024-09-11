Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EA975493
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 15:52:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C312FC6C841;
	Wed, 11 Sep 2024 13:52:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7C33C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 13:52:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B8oOqa007343;
 Wed, 11 Sep 2024 15:51:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 14gR+MCsBOivysdEUAEkA0MzfErSkPe5fIcIjROePWs=; b=xkObBTgKLxefMuuu
 yeOsvcerwQVyrZ15rJiZAUvLc0A8KLaJ9DeCsnvtc8BLjZlXzz90XLH0sadv1EZ5
 nQgSufU8nnKONbBqGZ9xtGFiRdPAx5DmuHrzyeW1/E3NDdE8JiV36WDZXXb/hbuT
 KUk+4JCrQCa5+a5aC9xmn/cBYah+4E2af64hQ5cEGRElcWP8KlqDOiU/7Qwo5Yjw
 eNq7ycx+Z/sddWQlTpq8Uj/JHwBEjAztESdTtaZ0a/QHIOBYxh6aDmmsTB1MG8+/
 1vMnI33aDJy2sEX2udOaMf44+4GBOayvJB5TLC1qF7Bw0tO0FYsGsDKEpdtfQpRL
 jVOE4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gyeh7d6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2024 15:51:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0F1924004C;
 Wed, 11 Sep 2024 15:50:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81FC5231534;
 Wed, 11 Sep 2024 15:50:14 +0200 (CEST)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Sep
 2024 15:50:14 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Fritz Koenig <frkoenig@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Wed, 11 Sep 2024 15:50:10 +0200
Message-ID: <20240911135011.161217-2-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [Linux-stm32] [PATCH 1/2] media: uapi: add WebP VP8 frame flag
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

Add a flag indicating that VP8 bitstream is a WebP picture.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst      | 3 +++
 include/uapi/linux/v4l2-controls.h                             | 1 +
 2 files changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 0da635691fdc..bb08aacddc9c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -1062,6 +1062,9 @@ FWHT Flags
     * - ``V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT``
       - 0x20
       - Sign of motion vectors when the alt frame is referenced.
+    * - ``V4L2_VP8_FRAME_FLAG_WEBP``
+      - 0x40
+      - Indicates that this frame is a WebP picture.
 
 .. c:type:: v4l2_vp8_entropy_coder_state
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..e41b62f2cb2b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1897,6 +1897,7 @@ struct v4l2_vp8_entropy_coder_state {
 #define V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF	0x08
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN	0x10
 #define V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT	0x20
+#define V4L2_VP8_FRAME_FLAG_WEBP		0x40
 
 #define V4L2_VP8_FRAME_IS_KEY_FRAME(hdr) \
 	(!!((hdr)->flags & V4L2_VP8_FRAME_FLAG_KEY_FRAME))
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
