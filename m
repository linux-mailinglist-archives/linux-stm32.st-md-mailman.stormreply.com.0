Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3993756CA
	for <lists+linux-stm32@lfdr.de>; Thu,  6 May 2021 17:26:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4ECEC58D78;
	Thu,  6 May 2021 15:26:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6F8DC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 May 2021 15:26:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2403A61584;
 Thu,  6 May 2021 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620314800;
 bh=PvMAY6Y2fz/EvEn1dyCRJ72V76RqJb8t+KOlunBx8UY=;
 h=From:To:Cc:Subject:Date:From;
 b=WnFjjXi6QufHdKAf0NrxvIr88fq46S7vbtcI30ddxj18mrch8A+v1YNh2H9MQqftF
 xbggOG7JOxwSWbQTzeyT2oG4vE9DQQlDsqvm2Shs6WHwvcQtkEff1vL1xmCenTDUxz
 DDU2AwYzImtlNSUjehesEzHx7hlo+/ZKRBsRPbb9i9aumHNHqJTJUYvJFv8/Qa6aLG
 H5cs5YZDguj3bStGcWFq7Fsc7w2JID15ILH4nlzjsa4uOXBi6Sc5apsyWSH8ooG3GB
 bkXTuVqCSd6zl0UkdjlpxZOrap35ifdCt681cypv2r3raeYR+W9YzcVfw734dX4O9c
 P34nCnsFHocGA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1left7-000SB2-KN; Thu, 06 May 2021 17:26:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Date: Thu,  6 May 2021 17:25:38 +0200
Message-Id: <cover.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, mauro.chehab@huawei.com, linuxarm@huawei.com,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-staging@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 linux-sunxi@lists.linux.dev, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Steve Longerbeam <slongerbeam@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benoit Parrot <bparrot@ti.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Helen Koike <helen.koike@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org,
 Jacob Chen <jacob-chen@iotwrt.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Dan Scally <djrscally@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH v5 00/25] media: use
	pm_runtime_resume_and_get() on non-i2c drivers
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

Dealing with PM runtime (RPM) is different than dealing with other kAPIs used
on media, as most pm_runtime_get_*() functions won't return to the the state
before the call if an error rises. They, instead, increment an usage_count.

Due to that, there were several bugs on media. Just on this review, we found
24 such errors.

So, let's use pm_runtime_resume_and_get() whenever possible, as it
has two advantages over :

1. On errors, it decrements the usage count;
2. It always return zero on success or an error code. This prevents a
   common error pattern of checking if ret is not zero to identify
   for errors.

There are however a few places where calls to pm_runtime_get_sync()
are kept. On several of those, a comment was added, in order to
help preventing trivial patches that could try to change them.

PS.: This series was submitted already together with the fix patches
at:

   	https://lore.kernel.org/linux-media/cover.1619621413.git.mchehab+huawei@kernel.org/

I opted to break it on 3 parts, in order to make easier to review.

This is the third (and final) part.

Mauro Carvalho Chehab (25):
  staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
  staging: media: atomisp: use pm_runtime_resume_and_get()
  staging: media: ipu3: use pm_runtime_resume_and_get()
  staging: media: cedrus_video: use pm_runtime_resume_and_get()
  staging: media: tegra-vde: use pm_runtime_resume_and_get()
  staging: media: tegra-video: use pm_runtime_resume_and_get()
  media: rockchip/rga: use pm_runtime_resume_and_get()
  media: sti/hva: use pm_runtime_resume_and_get()
  media: ipu3: use pm_runtime_resume_and_get()
  media: coda: use pm_runtime_resume_and_get()
  media: mtk-jpeg: use pm_runtime_resume_and_get()
  media: camss: use pm_runtime_resume_and_get()
  media: venus: core: use pm_runtime_resume_and_get()
  media: venus: vdec: use pm_runtime_resume_and_get()
  media: venus: venc: use pm_runtime_resume_and_get()
  media: rcar-fcp: use pm_runtime_resume_and_get()
  media: rkisp1: use pm_runtime_resume_and_get()
  media: s3c-camif: use pm_runtime_resume_and_get()
  media: s5p-mfc: use pm_runtime_resume_and_get()
  media: stm32: use pm_runtime_resume_and_get()
  media: sunxi: use pm_runtime_resume_and_get()
  media: ti-vpe: use pm_runtime_resume_and_get()
  media: vsp1: use pm_runtime_resume_and_get()
  media: rcar-vin: use pm_runtime_resume_and_get()
  media: hantro: use pm_runtime_resume_and_get()

 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  3 +--
 drivers/media/platform/coda/coda-common.c     |  7 ++++---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 ++--
 .../media/platform/qcom/camss/camss-csid.c    |  6 ++----
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 ++----
 .../media/platform/qcom/camss/camss-ispif.c   |  6 ++----
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 +++--
 .../media/platform/qcom/venus/pm_helpers.c    |  3 +--
 drivers/media/platform/qcom/venus/vdec.c      |  6 +++---
 drivers/media/platform/qcom/venus/venc.c      |  5 +++--
 drivers/media/platform/rcar-fcp.c             |  8 +------
 drivers/media/platform/rcar-vin/rcar-csi2.c   | 15 ++++++++++---
 drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 ++----
 drivers/media/platform/rockchip/rga/rga-buf.c |  3 +--
 drivers/media/platform/rockchip/rga/rga.c     |  4 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  3 +--
 .../media/platform/s3c-camif/camif-capture.c  |  2 +-
 drivers/media/platform/s3c-camif/camif-core.c |  5 +++--
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c   |  6 ++----
 drivers/media/platform/sti/hva/hva-hw.c       | 17 ++++++++-------
 drivers/media/platform/stm32/stm32-dcmi.c     |  5 +++--
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  6 ++++--
 drivers/media/platform/ti-vpe/cal-video.c     |  4 +++-
 drivers/media/platform/ti-vpe/cal.c           |  8 ++++---
 drivers/media/platform/ti-vpe/vpe.c           |  8 +++----
 drivers/media/platform/vsp1/vsp1_drv.c        | 10 +--------
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 +++---
 drivers/staging/media/hantro/hantro_drv.c     |  5 ++---
 drivers/staging/media/imx/imx7-mipi-csis.c    |  7 +++----
 drivers/staging/media/ipu3/ipu3.c             |  3 +--
 .../staging/media/sunxi/cedrus/cedrus_video.c |  6 ++----
 drivers/staging/media/tegra-vde/vde.c         | 21 ++++++++++++++++---
 drivers/staging/media/tegra-video/csi.c       |  3 +--
 drivers/staging/media/tegra-video/vi.c        |  3 +--
 35 files changed, 110 insertions(+), 111 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
