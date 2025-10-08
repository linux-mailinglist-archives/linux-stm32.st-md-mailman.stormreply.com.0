Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8FBC62E1
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 19:51:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF108C5558D;
	Wed,  8 Oct 2025 17:51:02 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32EC4C5558A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 17:51:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi
 [82.203.166.19])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E0410EFE;
 Wed,  8 Oct 2025 19:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759945765;
 bh=5QPb7bYF1JsxERE0FuwEAunttFsnfMgYjjBTINS4yIQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YPkQFe7m4tlSrmAl9ZBjyv+eI/JWf/k7WF+658nQWBrZIzV+uPNz37s0qBigB9HvU
 0b3YUzqxgqPxJB7+h8Qo5W0EGYR8x5T9nk5cynRX7S09Q60Zndi6x/TV/AEdKol4kX
 yrBnirUeTD4FdNnixpQ6jbt3LG5QWFlFQynrDDXA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Date: Wed,  8 Oct 2025 20:50:27 +0300
Message-ID: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthew Majewski <mattwmajewski@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bin Liu <bin.liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Michael Tretter <m.tretter@pengutronix.de>, Benoit Parrot <bparrot@ti.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Subject: [Linux-stm32] [PATCH 00/25] media: v4l2-mem2mem: Reduce cargo-cult
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

Hello,

The v4l2_m2m_get_vq() function never returns NULL, but many mem2mem
drivers still check its return value and consider NULL as an error. This
may have originated a long time ago from valid checks when
v4l2_m2m_get_vq() could return NULL, with drivers then just copying the
checks. This series attempts to stop the cargo-cult behaviour.

Patch 01/25 starts by explicitly stating in kerneldoc that the
v4l2_m2m_get_vq() function never returns NULL. All the other patches
drop NULL checks from drivers.

I have carefully checked all patched locations in all drivers. They fall
in 3 categories:

- Checks in the VIDIOC_G_FMT, VIDIOC_TRY_FMT and VIDIOC_S_FMT handlers:
  Those may have been added to ensure that the format type has a valid
  value, but that is ensured by the V4L2 ioctl core before calling the
  handlers. The checks can be dropped without a need to replace them
  with proper type checks.

- Checks in the VIDIOC_S_SELECTION handler: The only location where this
  is performed has an explicit type check, so the NULL check can also be
  dropped.

- Checks in other locations where the type parameter to the
  v4l2_m2m_get_vq() function is hardcoded: The hardcoded type is valid,
  so the NULL check can't have been meant to check the type. It can also
  be removed.

There's no dependency between any of those patches so they can be merged
in any order.

Laurent Pinchart (25):
  media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns
    NULL
  media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check
  media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check

 drivers/media/platform/allegro-dvt/allegro-core.c    |  2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c     |  5 -----
 drivers/media/platform/amphion/vdec.c                |  2 --
 drivers/media/platform/amphion/venc.c                |  2 --
 .../media/platform/chips-media/coda/coda-common.c    |  4 ----
 drivers/media/platform/imagination/e5010-jpeg-enc.c  |  4 ----
 drivers/media/platform/m2m-deinterlace.c             |  7 -------
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |  7 -------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c         |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c        |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c         |  8 --------
 drivers/media/platform/nxp/dw100/dw100.c             |  7 -------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c       |  4 ----
 drivers/media/platform/nxp/imx-pxp.c                 |  7 -------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   |  2 --
 drivers/media/platform/nxp/mx2_emmaprp.c             |  7 -------
 drivers/media/platform/qcom/iris/iris_vdec.c         |  2 --
 drivers/media/platform/qcom/venus/vdec.c             |  2 --
 drivers/media/platform/qcom/venus/venc.c             |  2 --
 drivers/media/platform/renesas/rcar_fdp1.c           |  3 ---
 drivers/media/platform/renesas/rcar_jpu.c            |  8 --------
 drivers/media/platform/rockchip/rga/rga.c            |  4 ----
 drivers/media/platform/samsung/s5p-g2d/g2d.c         |  4 ----
 drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c  |  7 -------
 drivers/media/platform/st/stm32/dma2d/dma2d.c        |  5 -----
 drivers/media/platform/ti/vpe/vpe.c                  |  7 -------
 drivers/media/test-drivers/vicodec/vicodec-core.c    |  7 -------
 drivers/media/test-drivers/vim2m.c                   | 12 ------------
 drivers/media/v4l2-core/v4l2-mem2mem.c               | 12 +-----------
 include/media/v4l2-mem2mem.h                         |  3 +++
 31 files changed, 4 insertions(+), 153 deletions(-)


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
