Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8756BDD37E
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 09:54:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 992E5C5661A;
	Wed, 15 Oct 2025 07:54:05 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DE51C56618
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 07:54:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi
 [87.94.110.32])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7C3E8E92;
 Wed, 15 Oct 2025 09:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1760514742;
 bh=HMpyQc1vCbg200Ovi9oVcwwxqMAbktCljqyWnp6/pa4=;
 h=From:To:Cc:Subject:Date:From;
 b=bHz2suxZQcf0OwK6sXgHCFZZ6iQ17jH8d09o9a4jKXrYvttYbKQiN193Zi3ckmrEb
 VOc063B/05xd/wZPm3lhzUiRSoCLduQif6EbnCkdyDb4f7fNTKbIFtfsUB7NowV2j5
 Xm/CYKIPh8yqEnxujxmRWLzg3Hf6LshKSceZbfRg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Date: Wed, 15 Oct 2025 10:53:23 +0300
Message-ID: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Heiko Stuebner <heiko@sntech.de>, Devarsh Thakkar <devarsht@ti.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Matthew Majewski <mattwmajewski@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Yunseong Kim <ysk@kzalloc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bin Liu <bin.liu@mediatek.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
 Nathan Chancellor <nathan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Zhou Peng <eagle.zhou@nxp.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Subject: [Linux-stm32] [PATCH v2 00/25] media: v4l2-mem2mem: Reduce
	cargo-cult
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

Compared to v1, this version drops two more NULL checks, in the Mediatek
vcodec encoder get format handler (09/25) and the Qualcomm iris venc set
format handler (15/25).

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

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 --
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c   |  5 -----
 drivers/media/platform/amphion/vdec.c              |  2 --
 drivers/media/platform/amphion/venc.c              |  2 --
 .../media/platform/chips-media/coda/coda-common.c  |  4 ----
 .../media/platform/imagination/e5010-jpeg-enc.c    |  4 ----
 drivers/media/platform/m2m-deinterlace.c           |  7 -------
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |  7 -------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 14 --------------
 drivers/media/platform/nxp/dw100/dw100.c           |  7 -------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  4 ----
 drivers/media/platform/nxp/imx-pxp.c               |  7 -------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 --
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 -------
 drivers/media/platform/qcom/iris/iris_vdec.c       |  2 --
 drivers/media/platform/qcom/iris/iris_venc.c       |  2 --
 drivers/media/platform/qcom/venus/vdec.c           |  2 --
 drivers/media/platform/qcom/venus/venc.c           |  2 --
 drivers/media/platform/renesas/rcar_fdp1.c         |  3 ---
 drivers/media/platform/renesas/rcar_jpu.c          |  8 --------
 drivers/media/platform/rockchip/rga/rga.c          |  4 ----
 drivers/media/platform/samsung/s5p-g2d/g2d.c       |  4 ----
 .../media/platform/samsung/s5p-jpeg/jpeg-core.c    |  7 -------
 drivers/media/platform/st/stm32/dma2d/dma2d.c      |  5 -----
 drivers/media/platform/ti/vpe/vpe.c                |  7 -------
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  7 -------
 drivers/media/test-drivers/vim2m.c                 | 12 ------------
 drivers/media/v4l2-core/v4l2-mem2mem.c             | 12 +-----------
 include/media/v4l2-mem2mem.h                       |  3 +++
 32 files changed, 4 insertions(+), 161 deletions(-)


base-commit: 082b86919b7a94de01d849021b4da820a6cb89dc
-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
