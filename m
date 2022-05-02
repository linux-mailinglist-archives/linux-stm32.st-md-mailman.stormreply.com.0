Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB266516CF9
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 11:05:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF38C628AC;
	Mon,  2 May 2022 09:05:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49F86C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g1EGMUSX4uhdpumN1AqArSCJZUMcx2qk+SIJN7jkMXI=;
 b=P0h/w4e8bqfdcfuw0MzVuqo30xCR92VaVbU/cZWVK81Y/aYl1Hulb/zDJv3U8VC527kV4m
 U3pcdK/902HbQJMV5WWF5w9oFoD/ZwFVMpxmPmcoChf4Hyn5g1NkQU2mmlN8tjAgL6rYg4
 MfeBdRSBapuQll01D5v+FmDRUTMF3OU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-UCsJr6KWPx-izDxeLC14lw-1; Mon, 02 May 2022 04:49:01 -0400
X-MC-Unique: UCsJr6KWPx-izDxeLC14lw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so4276960wmk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 May 2022 01:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1EGMUSX4uhdpumN1AqArSCJZUMcx2qk+SIJN7jkMXI=;
 b=ZvVJA5763x5k8DRqoFu2QGxsoc+DFmt/62HpA0s9HPYeqo5rujBBn5YionXDJPYaeB
 XZzqCB7UjIHofXch1Oap8yBekK1td+VIEXPaRPY/JeSvd68lpgknUFu56hmq74v/cCxS
 H+njNXfcFl9IiWgeN7oPNFP9KeJYzKOEj2v7AMNHJEYu9V6I2jllnfq/VdRvfSwOkD8J
 Wb1X0oUzGzvE01nUcdUHzl5IeU3jlBIxnKzcVJz2rF2cQ26pA40QCT7Rul7pXpAaVRUi
 S9hj6sm8XCwrlb9Ba+uL1O8yTJZuYCZcok/0zMpZ03nHNHXCk4KTIZTAam2y48vkSPb4
 ZLSg==
X-Gm-Message-State: AOAM530pvWGdd4cFiAdZ0MZX62wthGUVlOiTZ4UPGHAc7NxgkQZnBf3D
 h2rVFkYDFynTJvOYZ1EpMbATCN4WyBRCi9yMtkRv3zFl2LwkMIuGUT1Q8bKWG1ZY4WCYw972OQh
 vTfV7S3PVH2S2kdcYUsoZsf87HfJ438sqh6Fezgk+
X-Received: by 2002:a1c:7512:0:b0:394:16ee:ab9b with SMTP id
 o18-20020a1c7512000000b0039416eeab9bmr9917256wmc.176.1651481339941; 
 Mon, 02 May 2022 01:48:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1HDOH0L0J59jWzQqe8OCc8OrGCpxEDekTc2b0ViBR9lVxUT3tRNZw5Yfr7Gkyc9Gu0hnOLg==
X-Received: by 2002:a1c:7512:0:b0:394:16ee:ab9b with SMTP id
 o18-20020a1c7512000000b0039416eeab9bmr9917168wmc.176.1651481339590; 
 Mon, 02 May 2022 01:48:59 -0700 (PDT)
Received: from minerva.. ([90.167.94.74]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm8032307wrb.18.2022.05.02.01.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:48:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  2 May 2022 10:48:27 +0200
Message-Id: <20220502084830.285639-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 02 May 2022 09:05:17 +0000
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 virtualization@lists.linux-foundation.org,
 Mario Limonciello <mario.limonciello@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Dave Airlie <airlied@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, John Stultz <john.stultz@linaro.org>,
 linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
 Yong Wu <yong.wu@mediatek.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Solomon Chiu <solomon.chiu@amd.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 Hao Fang <fanghao11@huawei.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Chia-I Wu <olvaffe@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomba@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Paul Cercueil <paul@crapouillou.net>, Nirmoy Das <nirmoy.das@amd.com>,
 Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-mips@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [Linux-stm32] [PATCH 0/3] drm: Allow simpledrm to setup its
	emulated FB as firmware provided
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

This series contain patches suggested by Thomas Zimmermannas a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/


Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 25 ++++++++++++++++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 22 ++++++++++++++++
 36 files changed, 80 insertions(+), 39 deletions(-)

-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
