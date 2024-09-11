Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660797549A
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2024 15:52:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D173EC6C841;
	Wed, 11 Sep 2024 13:52:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43087C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 13:52:41 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BAdpJo026944;
 Wed, 11 Sep 2024 15:52:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=8x5WYgjMDMpnQ929UybthC
 m8FyP9r1CPBj4apvbGduM=; b=HtiJI3A0PLnjUTScM80t5XNe1q/yQqxkeUZyKf
 wQxfL7N8waMKM582PebO9qvQ8ywOZOn/MCFe9Lv0w/8974k/0CCybWe887DqLt0M
 rR+wT/uzqVIbYSR0AwyuVXf95hxKcENQ+cGKXPLFfQp5HoKCJaAvsz8DkOlN+NPb
 /jAfeuzvKXgBgdx41JY1vUQKut8IhJCWtTD6eIgyg27TDaLB/Vj2vze1qDRDXx9R
 2Owxm6euHjjZoprZ2yJWb0QvopsZqe4wSgkcZppI8d0MFazIYF/kWkXwY2G2v0Ia
 4Bm+nRvCjD4WzvJFKoQLMCNIMEfCBERczgLP1hDRbkANVnaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41h0cyq91r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2024 15:52:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A72DC4005C;
 Wed, 11 Sep 2024 15:51:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C02A622FA44;
 Wed, 11 Sep 2024 15:50:13 +0200 (CEST)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Sep
 2024 15:50:13 +0200
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
Date: Wed, 11 Sep 2024 15:50:09 +0200
Message-ID: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [Linux-stm32] [PATCH 0/2] Add WebP support to hantro decoder
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

Tested on STM32MP257F-EV1 evaluation board with GStreamer
using an updated version of V4L2 VP8 stateless decoder element:

wget https://www.gstatic.com/webp/gallery/1.webp
gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slvp8dec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Hugues Fruchet (2):
  media: uapi: add WebP VP8 frame flag
  media: verisilicon: add WebP decoding support

 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst  | 3 +++
 drivers/media/platform/verisilicon/hantro_g1_regs.h        | 1 +
 drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c     | 7 +++++++
 include/uapi/linux/v4l2-controls.h                         | 1 +
 4 files changed, 12 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
