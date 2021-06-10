Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574203A2EBD
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 16:56:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F2C4C58D5B;
	Thu, 10 Jun 2021 14:56:36 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8561DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 14:56:33 +0000 (UTC)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1173E8D4;
 Thu, 10 Jun 2021 16:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1623336990;
 bh=SxEgL8cnLpb/jRlWgIpmg8TG8eHiIpa6PqahE1+yfYo=;
 h=From:To:Cc:Subject:Date:From;
 b=i/ZTfIZCBdUt08Ou/la3+E1RRfVNCCGWKugSMFIm6n1Pf4FfRR+QYvuIDoVHu/4HR
 nojyo9LdzeqRj/ubUvTKI6/klykqWoGnBgYFZfW6ElzMxulG5zr/4tSmoGZwIAFhMt
 cSU0kP4EectyzL7nrMPmBjVW+MwR/RLeJfsyGu0I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 10 Jun 2021 17:55:57 +0300
Message-Id: <20210610145606.3468235-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mickael Guene <mickael.guene@st.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Heiko Stuebner <heiko@sntech.de>,
 Leon Luo <leonl@leopardimaging.com>, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Mats Randgaard <matrandg@cisco.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shunqian Zheng <zhengsq@rock-chips.com>,
 linux-sunxi@lists.linux.dev, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Shawn Tu <shawnx.tu@intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Akinobu Mita <akinobu.mita@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Helen Koike <helen.koike@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andy Walls <awalls@md.metrocast.net>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Dan Scally <djrscally@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [PATCH v5 0/9] media: v4l2-subdev: add subdev-wide
	state struct
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

Hi,

v5 of the series. No content changes compared to v4, but the series is
split into smaller parts to enable reviews.

The split is artificial, and all the patches need to be squashed into
one before merging.

The point of the series is explained in "media: v4l2-subdev: add
subdev-wide state struct", but for easier reviews I add it partially
here:

We have 'struct v4l2_subdev_pad_config' which contains configuration for
a single pad used for the TRY functionality, and an array of those
structs is passed to various v4l2_subdev_pad_ops.

I was working on subdev internal routing between pads, and realized that
there's no way to add TRY functionality for routes, which is not pad
specific configuration. Adding a separate struct for try-route config
wouldn't work either, as e.g. set-fmt needs to know the try-route
configuration to propagate the settings.

This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
moment only contains the v4l2_subdev_pad_config array) and the new
struct is used in most of the places where v4l2_subdev_pad_config was
used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
are changed to instead take v4l2_subdev_state.

 Tomi

Tomi Valkeinen (9):
  media: v4l2-subdev: add subdev-wide state struct
  media: s5k5baf: changes for subdev-wide state struct
  media: s3c-camif: changes for subdev-wide state struct
  media: i2c: changes for subdev-wide state struct
  media: pci: changes for subdev-wide state struct
  media: platform: changes for subdev-wide state struct
  media: test-drivers: changes for subdev-wide state struct
  media: usb: changes for subdev-wide state struct
  media: staging: changes for subdev-wide state struct

 drivers/media/i2c/adv7170.c                   |   6 +-
 drivers/media/i2c/adv7175.c                   |   6 +-
 drivers/media/i2c/adv7180.c                   |  18 +--
 drivers/media/i2c/adv7183.c                   |   8 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |  13 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |  14 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |  13 +-
 drivers/media/i2c/adv7511-v4l2.c              |  10 +-
 drivers/media/i2c/adv7604.c                   |  12 +-
 drivers/media/i2c/adv7842.c                   |  12 +-
 drivers/media/i2c/ak881x.c                    |   6 +-
 drivers/media/i2c/ccs/ccs-core.c              |  84 ++++++-----
 drivers/media/i2c/cx25840/cx25840-core.c      |   2 +-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  23 +--
 drivers/media/i2c/hi556.c                     |  15 +-
 drivers/media/i2c/imx208.c                    |  19 +--
 drivers/media/i2c/imx214.c                    |  37 ++---
 drivers/media/i2c/imx219.c                    |  30 ++--
 drivers/media/i2c/imx258.c                    |  19 +--
 drivers/media/i2c/imx274.c                    |  38 ++---
 drivers/media/i2c/imx290.c                    |  20 +--
 drivers/media/i2c/imx319.c                    |  18 +--
 drivers/media/i2c/imx334.c                    |  28 ++--
 drivers/media/i2c/imx355.c                    |  18 +--
 drivers/media/i2c/m5mols/m5mols_core.c        |  21 ++-
 drivers/media/i2c/max9286.c                   |  17 ++-
 drivers/media/i2c/ml86v7667.c                 |   4 +-
 drivers/media/i2c/mt9m001.c                   |  18 +--
 drivers/media/i2c/mt9m032.c                   |  38 ++---
 drivers/media/i2c/mt9m111.c                   |  18 +--
 drivers/media/i2c/mt9p031.c                   |  45 +++---
 drivers/media/i2c/mt9t001.c                   |  44 +++---
 drivers/media/i2c/mt9t112.c                   |  14 +-
 drivers/media/i2c/mt9v011.c                   |   6 +-
 drivers/media/i2c/mt9v032.c                   |  44 +++---
 drivers/media/i2c/mt9v111.c                   |  23 +--
 drivers/media/i2c/noon010pc30.c               |  19 ++-
 drivers/media/i2c/ov02a10.c                   |  17 ++-
 drivers/media/i2c/ov13858.c                   |  18 +--
 drivers/media/i2c/ov2640.c                    |  16 +-
 drivers/media/i2c/ov2659.c                    |  14 +-
 drivers/media/i2c/ov2680.c                    |  23 +--
 drivers/media/i2c/ov2685.c                    |  10 +-
 drivers/media/i2c/ov2740.c                    |  15 +-
 drivers/media/i2c/ov5640.c                    |  14 +-
 drivers/media/i2c/ov5645.c                    |  38 ++---
 drivers/media/i2c/ov5647.c                    |  26 ++--
 drivers/media/i2c/ov5648.c                    |  14 +-
 drivers/media/i2c/ov5670.c                    |  19 +--
 drivers/media/i2c/ov5675.c                    |  15 +-
 drivers/media/i2c/ov5695.c                    |  15 +-
 drivers/media/i2c/ov6650.c                    |  28 ++--
 drivers/media/i2c/ov7251.c                    |  39 ++---
 drivers/media/i2c/ov7670.c                    |  17 ++-
 drivers/media/i2c/ov772x.c                    |  12 +-
 drivers/media/i2c/ov7740.c                    |  17 ++-
 drivers/media/i2c/ov8856.c                    |  15 +-
 drivers/media/i2c/ov8865.c                    |  14 +-
 drivers/media/i2c/ov9640.c                    |   8 +-
 drivers/media/i2c/ov9650.c                    |  17 ++-
 drivers/media/i2c/ov9734.c                    |  15 +-
 drivers/media/i2c/rdacm20.c                   |   4 +-
 drivers/media/i2c/rdacm21.c                   |   4 +-
 drivers/media/i2c/rj54n1cb0c.c                |  12 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  55 +++----
 drivers/media/i2c/s5k4ecgx.c                  |  22 +--
 drivers/media/i2c/s5k5baf.c                   |  49 +++---
 drivers/media/i2c/s5k6a3.c                    |  19 ++-
 drivers/media/i2c/s5k6aa.c                    |  39 ++---
 drivers/media/i2c/saa6752hs.c                 |   6 +-
 drivers/media/i2c/saa7115.c                   |   2 +-
 drivers/media/i2c/saa717x.c                   |   2 +-
 drivers/media/i2c/sr030pc30.c                 |   8 +-
 drivers/media/i2c/st-mipid02.c                |  21 +--
 drivers/media/i2c/tc358743.c                  |   8 +-
 drivers/media/i2c/tda1997x.c                  |  14 +-
 drivers/media/i2c/tvp514x.c                   |  12 +-
 drivers/media/i2c/tvp5150.c                   |  20 +--
 drivers/media/i2c/tvp7002.c                   |  11 +-
 drivers/media/i2c/tw9910.c                    |  10 +-
 drivers/media/i2c/vs6624.c                    |   8 +-
 drivers/media/pci/cx18/cx18-av-core.c         |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 ++-
 drivers/media/pci/saa7134/saa7134-empress.c   |   5 +-
 drivers/media/platform/atmel/atmel-isc-base.c |  19 ++-
 drivers/media/platform/atmel/atmel-isi.c      |  19 ++-
 drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +-
 .../media/platform/exynos4-is/fimc-capture.c  |  22 +--
 drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++--
 drivers/media/platform/exynos4-is/fimc-lite.c |  39 ++---
 drivers/media/platform/exynos4-is/mipi-csis.c |  17 ++-
 .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
 drivers/media/platform/omap3isp/ispccdc.c     |  85 ++++++-----
 drivers/media/platform/omap3isp/ispccp2.c     |  49 +++---
 drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++---
 drivers/media/platform/omap3isp/isppreview.c  |  69 +++++----
 drivers/media/platform/omap3isp/ispresizer.c  |  70 +++++----
 drivers/media/platform/pxa_camera.c           |   5 +-
 .../media/platform/qcom/camss/camss-csid.c    |  35 ++---
 .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++---
 .../media/platform/qcom/camss/camss-ispif.c   |  36 ++---
 drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-----
 drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
 drivers/media/platform/renesas-ceu.c          |   7 +-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++-----
 .../media/platform/s3c-camif/camif-capture.c  |  18 +--
 drivers/media/platform/stm32/stm32-dcmi.c     |  14 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++--
 drivers/media/platform/via-camera.c           |   5 +-
 drivers/media/platform/video-mux.c            |  22 +--
 drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++--
 drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_entity.c     |  59 ++++----
 drivers/media/platform/vsp1/vsp1_entity.h     |  20 +--
 drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++---
 drivers/media/platform/vsp1/vsp1_hsit.c       |  14 +-
 drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++--
 drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
 drivers/media/platform/vsp1/vsp1_sru.c        |  22 +--
 drivers/media/platform/vsp1/vsp1_uds.c        |  22 +--
 drivers/media/platform/vsp1/vsp1_uif.c        |  27 ++--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  26 ++--
 drivers/media/platform/xilinx/xilinx-tpg.c    |  25 +--
 drivers/media/platform/xilinx/xilinx-vip.c    |  12 +-
 drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  20 +--
 drivers/media/test-drivers/vimc/vimc-scaler.c |  36 ++---
 drivers/media/test-drivers/vimc/vimc-sensor.c |  16 +-
 drivers/media/usb/go7007/s2250-board.c        |   2 +-
 drivers/media/v4l2-core/v4l2-subdev.c         | 142 ++++++++++--------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  12 +-
 .../media/atomisp/i2c/atomisp-ov2680.c        |  10 +-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  10 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 ++--
 .../staging/media/atomisp/pci/atomisp_csi2.c  |  28 ++--
 .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +-
 .../staging/media/atomisp/pci/atomisp_file.c  |  14 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |   6 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  64 ++++----
 .../media/atomisp/pci/atomisp_subdev.h        |   9 +-
 .../staging/media/atomisp/pci/atomisp_tpg.c   |  12 +-
 drivers/staging/media/imx/imx-ic-prp.c        |  19 +--
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  31 ++--
 drivers/staging/media/imx/imx-media-csi.c     |  82 +++++-----
 drivers/staging/media/imx/imx-media-utils.c   |   4 +-
 drivers/staging/media/imx/imx-media-vdic.c    |  24 +--
 drivers/staging/media/imx/imx-media.h         |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  33 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  34 +++--
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  26 ++--
 drivers/staging/media/omap4iss/iss_csi2.c     |  37 ++---
 drivers/staging/media/omap4iss/iss_ipipe.c    |  37 ++---
 drivers/staging/media/omap4iss/iss_ipipeif.c  |  47 +++---
 drivers/staging/media/omap4iss/iss_resizer.c  |  39 ++---
 drivers/staging/media/tegra-video/csi.c       |  10 +-
 drivers/staging/media/tegra-video/vi.c        |  24 +--
 include/media/v4l2-subdev.h                   |  74 +++++----
 166 files changed, 2162 insertions(+), 1802 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
