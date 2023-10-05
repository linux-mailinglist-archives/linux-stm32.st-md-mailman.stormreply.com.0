Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 305667B9D60
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 15:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2EA3C6C835;
	Thu,  5 Oct 2023 13:37:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 628EAC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 13:37:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3959PGld025910; Thu, 5 Oct 2023 15:37:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=WCUI4Zm
 GxriT+Ga2/swGoeDwu7aaDGkwS0/rm9KN1Jg=; b=5/0r7HqXG/B8ahJhNoT0LH0
 oEFVY/3+ZcCk0k1F7lb2Gc67t8PX4E0QgiqPf3drmZ1ALdhD/aUI+Q7qQtm9RDrF
 ruItWC2D/GCWBcrASPfsnK2iG3mkHEipcdLC5EXt0tgL6/hn4gvUUPc8Gwx8QAUT
 Svz1Ig8XGVM9ZltyJuOHu+/vcG3rnWg4U/lSZWy122nDK3ofSTVA0hRnZF8JViyd
 Z1Xri+nQOt9zUs+lMoSHkWjVl05ko02Fji2GINS0EzarvWO9/uROu73dml5v4+2W
 aKX0jkCRALpJUVZBN8p19Vf1eoaiDP8WAiEUFdm6ixv7t/8ciHEKypxnZ5LxKLg=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thtg7h2df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 15:37:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2814110005C;
 Thu,  5 Oct 2023 15:37:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BE63260278;
 Thu,  5 Oct 2023 15:37:31 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 15:37:30 +0200
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
Date: Thu, 5 Oct 2023 15:37:04 +0200
Message-ID: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Adam Ford <aford173@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: [Linux-stm32] [RFC v2 0/6] VP8 H1 stateless encoding
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

Hi all,

Here is an RFC to support VP8 encoding using Hantro H1 hardware
of STM32MP25 SoCs (Verisilicon VC8000NanoE IP).
This work is derived from work done to support Rockchip RK3399
VPU2 in RFC [1] with a reshuffling of registers to match H1
register set.

This has been tested on STM32MP257F-EV1 evaluation board using
GStreamer userspace [2]:
gst-launch-1.0 videotestsrc num-buffers=500 ! video/x-raw,width=640,height=480 \
! v4l2slvp8enc ! queue ! matroskamux ! filesink location=test_vp8.mkv

For the sake of simplicity I have embedded here the RFC [1] before the
changes related to this exact RFC, all rebased on v6.6 + STM32MP25
hardware codecs support [3].

[1] https://lwn.net/ml/linux-media/20230309125651.23911-1-andrzej.p@collabora.com/
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3736
[3] https://patchwork.kernel.org/project/linux-media/list/?series=789861

Best regards,
Hugues.

===========
= history =
===========
version 2:
  - Fix send-mail recipients

version 1:
  - Initial submission


Andrzej Pietrasiewicz (2):
  media: uapi: Add VP8 stateless encoder controls
  media: hantro: add VP8 encode support for Rockchip RK3399 VPU2

Hugues Fruchet (4):
  media: hantro: add h1 vp8 encode support
  media: hantro: add VP8 encode support for STM32MP25 VENC
  media: hantro: h1: NV12 single-plane support
  media: hantro: add NV12 single-plane support for STM32MP25 VENC

 drivers/media/platform/verisilicon/Makefile   |    3 +
 drivers/media/platform/verisilicon/hantro.h   |   10 +
 .../platform/verisilicon/hantro_boolenc.c     |   69 +
 .../platform/verisilicon/hantro_boolenc.h     |   21 +
 .../media/platform/verisilicon/hantro_drv.c   |   15 +-
 .../platform/verisilicon/hantro_h1_jpeg_enc.c |   42 +-
 .../platform/verisilicon/hantro_h1_regs.h     |   71 +-
 .../platform/verisilicon/hantro_h1_vp8_enc.c  | 1589 +++++++++++++++++
 .../media/platform/verisilicon/hantro_hw.h    |   93 +
 .../media/platform/verisilicon/hantro_v4l2.c  |    5 +-
 .../media/platform/verisilicon/hantro_vp8.c   |  118 ++
 .../verisilicon/rockchip_vpu2_hw_vp8_enc.c    | 1574 ++++++++++++++++
 .../platform/verisilicon/rockchip_vpu2_regs.h |    1 +
 .../platform/verisilicon/rockchip_vpu_hw.c    |   23 +-
 .../platform/verisilicon/stm32mp25_venc_hw.c  |   35 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   13 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    5 +
 include/media/v4l2-ctrls.h                    |    2 +
 include/uapi/linux/v4l2-controls.h            |   91 +
 include/uapi/linux/videodev2.h                |    3 +
 20 files changed, 3755 insertions(+), 28 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_boolenc.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_enc.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
