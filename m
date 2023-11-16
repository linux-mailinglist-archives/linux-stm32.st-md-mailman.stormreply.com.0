Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD407EF493
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D5D4C6C85D;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F8CFC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:48:27 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF506660734C;
 Thu, 16 Nov 2023 15:48:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700149706;
 bh=qOGURixP10SKLR9eMJf0x73f6ugT8/gbvL3YowPyUCo=;
 h=From:To:Cc:Subject:Date:From;
 b=ev+qQXOisOTKnWgq1P8D8oEK9yX30W34JGRLzV4HX5MsrGgm5YSfT1TzKlVvs57sN
 jBk6KH6DXlhwFAnLWXHB/J/NH2MvGglS/ROafXqXx8zTDgGQ8+WZsx19p3SrsoMg5F
 /PwJvvgMErv+GUu7KnFg1TZMdE9xO2GWaJPnoNG99XheUvcgUFrpHjxZhTgTgqxFR9
 ymC+EI1dQI66IedwlkqLLasg7uL6hGRYGeKzn0qkMvTzPvWDhrDR5Sg4RAZkfg8GBs
 J93wjM93c473Jgzoq4nMovXzxh68aVPVQYttT5nW3me3sAFvu6FDEAOcJh4z0RnULv
 KW8GoQcONBLTQ==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 16 Nov 2023 16:48:10 +0100
Message-Id: <20231116154816.70959-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Nov 2023 14:35:32 +0000
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [Linux-stm32] [RFC 0/6] H.264 stateless encoder RFC 0/6
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

Dear All,

This series adds uAPI for stateless H.264 encoding and an
accompanying driver using it.

It has been tested on an stm32mp25 and there exists
a gstreamer user:

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5676

example pipeline:

gst-launch-1.0 videotestsrc num-buffers=30 ! video/x-raw, format=YUY2 !
v4l2slh264enc ! filesink location=test.h264

Rebased onto v6.6 with:

- some patches from ST to actually run the hardware
- my previous VP8 statless encoding series
- VP8 support for H1 from Hugues Fruchet

In particular, this series depends on the latter, which can be
found here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=11358

Here's a branch which contains everything needed to actually run:

https://gitlab.collabora.com/linux/for-upstream/-/tree/h264-enc-rfc-6.6

I kindly ask for comments.

Regards,

Andrzej Pietrasiewicz (6):
  media: verisilicon Correct a typo in
    H1_REG_ENC_CTRL2_DEBLOCKING_FILTER_MODE
  media: verisilicon: Correct a typo in H1_REG_MAD_CTRL_MAD_THRESHOLD
  media: verisilicon: Improve constant's name
  media: verisilicon: Update H1 register definitions
  media: uapi: Add H.264 stateless encoding uAPI
  media: verisilicon: Add H.264 stateless encoder

 drivers/media/platform/verisilicon/Makefile   |   1 +
 drivers/media/platform/verisilicon/hantro.h   |   3 +
 .../media/platform/verisilicon/hantro_drv.c   |  10 +
 .../platform/verisilicon/hantro_h1_h264_enc.c | 493 +++++++++++
 .../platform/verisilicon/hantro_h1_regs.h     |  20 +-
 .../platform/verisilicon/hantro_h1_vp8_enc.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.c  | 777 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_hw.h    |  23 +
 .../platform/verisilicon/stm32mp25_venc_hw.c  |  22 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  54 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   9 +
 include/uapi/linux/v4l2-controls.h            |  85 ++
 include/uapi/linux/videodev2.h                |   2 +
 13 files changed, 1496 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h1_h264_enc.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
