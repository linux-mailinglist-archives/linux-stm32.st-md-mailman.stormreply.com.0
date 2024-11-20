Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9599D3909
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 12:04:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70B59C7A833;
	Wed, 20 Nov 2024 11:04:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00029C7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 11:04:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK8X5Hh000467;
 Wed, 20 Nov 2024 12:04:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=PRYNH4mrXgpLGGkA/dYqVr
 jp+qKkdlxRYRK4Gx/0a50=; b=NIHTE7GBrxeVaoKr2H8zrCSXlH458tDSItEyY2
 vqTE3unOn0ZDFocaXyXkSCINW8BMCghm2ML8ijcDF1J1PYNbsBHe/DwXnRf/o2FI
 7YbstArp6DPhxioCrGsP2HJDiajTpF00lGjSr0SNTOHIVtwwOohjFR7NBXEZKNxx
 wqp3g6qWjWHN+YG+1ULWnEdt9et2SVsJlMI8QZIm9Ax33wLQvOQw/TwtBy0MwtKI
 FmY6usRKfAw6uT1AlBVo5AiOu1lRCxeGI6OiYXhNkRzJhldlbgKtJfjcqFg001Se
 A5jkSUdykcGaw3sHhBZAG3ju/OuEZqPAb3HHOu2bsI92cYmw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkq61e9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2024 12:04:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E23140077;
 Wed, 20 Nov 2024 12:02:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7164027870D;
 Wed, 20 Nov 2024 12:01:34 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 20 Nov
 2024 12:01:34 +0100
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
Date: Wed, 20 Nov 2024 12:01:02 +0100
Message-ID: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [Linux-stm32] [PATCH v2 0/3] Add WebP support to hantro decoder
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

Add WebP image decoding support to stateless V4L2 VP8 decoder.

This have been tested on STM32MP257-EV board using GStreamer.

Simple basic test:
$> wget https://www.gstatic.com/webp/gallery/1.webp
$> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Slideshow of a set of WebP pictures and WebM video files:
$> wget https://www.gstatic.com/webp/gallery/2.webp
$> wget https://www.gstatic.com/webp/gallery/3.webp
$> wget https://www.gstatic.com/webp/gallery/4.webp
$> wget https://www.gstatic.com/webp/gallery/5.webp
$> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
$> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
<hit key ">" to display next file >

Large WebP image > 16777215 (size > 2^24)
$> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
$> ls -l 4096x3072_HQ_random.webp
[...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
$> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Large WebP image decoding using post-processor is untested because of lack
of hardware support on this platform, nevertheless support is provided in
this serie for further testing on another platform having post-processor
support.


Hugues Fruchet (3):
  media: uapi: add WebP uAPI
  media: verisilicon: add WebP decoding support
  media: verisilicon: postproc: 4K support

 .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
 .../media/v4l/pixfmt-compressed.rst             | 15 +++++++++++++++
 drivers/media/platform/verisilicon/hantro.h     |  2 ++
 .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
 .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
 .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
 .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
 .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 10 files changed, 66 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
