Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D539D185002
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2020 21:17:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B87C36B0E;
	Fri, 13 Mar 2020 20:17:59 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E499C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 20:17:57 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s13so11974280ljm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y58XOkdziIOagbDJXaKPopb+GQlU9fbifw4eoZN3YIE=;
 b=a14X4w4dS2yd7C/5VPno7i/nBzVNU5gbbv+Tld50flDKi1V2uj3T8h6/bqF56ixDIQ
 epKRKteT7A80miLVVtDJi3lvb36JcaGYtUskmmoOqNaKJ1NhtEhyu2O2EAotEBWp0vT9
 9WxVBWDQZ3NOOOAnPnqFuwOoluVvfMrLSDkuPaw9WDbIK4blcU2ifQesuPyClX4FAKEs
 20CzvQQtSPOunxFWzyZAUq7Nt6KJj/ysnwxZsxhMBttkKp2bVYBC7zh8lFkV6nWVsRnn
 cvQoH0PplvOPvD0k55tWiSo15BFZN0+ND6QYMNzWUr48SkzrTsb7gci8hvbjgK5znBXe
 sG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Y58XOkdziIOagbDJXaKPopb+GQlU9fbifw4eoZN3YIE=;
 b=QH9cY1zeNF71DhbOzcnu3bVKmCn085767tZc+DWScK6p/Hz39GZMnmIoVIGIRYaS5H
 c0tWFOEsDjjZx/cr3XyiuGfTc1czrO60/cAwxMbY4C3YFgk1E48a9AA6M3YSH2qeicTm
 ee2jUzb/w0/dZiIfI72rW5lehnvAv/FZErXiGo3NG42dkCOrpBWsLiyADF+VpGS1gGcH
 P05zXyMmL3xtzA19oqVqRdQfjr86u5Ni4gzG5eviOBlYlETJgtuUrUyHI32lWlwCvh0q
 nt+3PAjz9geT1R3zsr3RYh+Elva/dnSiLuJXZk1fMcfLsyretP02oDZbaSggThNiwT9/
 r/gA==
X-Gm-Message-State: ANhLgQ2HWZTP+sXkFkC1rN+Mp4f4ZbP3DY7RnbTM2gyZN7MaVbKP0ZaQ
 qP6lQt43CR28vKPCDXXzITc=
X-Google-Smtp-Source: ADFU+vuuP8eLGHs61Pn00F6kfLCzZYEGZpi+HoTitf53XYXkeT4pF7N73LFSnuUIomov7m47p3b2kA==
X-Received: by 2002:a05:651c:1047:: with SMTP id
 x7mr6683206ljm.246.1584130676487; 
 Fri, 13 Mar 2020 13:17:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 v10sm30774074lfb.61.2020.03.13.13.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 13:17:55 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Fri, 13 Mar 2020 21:17:41 +0100
Message-Id: <20200313201744.19773-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Jose Roberto de Souza <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Emil Velikov <emil.velikov@collabora.com>, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [Linux-stm32] [PATCH v1 0/3] drm: drm_encoder_init() =>
	drm_encoder_init_funcs()
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

Thomas Zimmermann had made a nice patch-set that introduced
drm_simple_encoder_init() which is already present in drm-misc-next.

While looking at this it was suddenly obvious to me that
this was functionalty that really should be included in drm_encoder.c
The case where the core could handle the callback is pretty
common and not part of the simple pipe line.

So after some dialog on dri-devel the conclusion was to go for
a change like this:

    drm_encoder_init_funcs() for all users that specified a
    drm_encoder_funcs to extend the functionality.

    drm_encoder_init() for all users that did not
    need to extend the basic functionality with
    drm_encoder_funcs.

A similar approach with a _funcs() prefix is used elsewhere in drm/

This required a rename of the existing users, and
a follow-up patch that moves drm_simple_encoder_init()
to drm_encoder.c

Patches 3 in this set demonstrate the use of drm_encoder_init().
There are many more drivers that can be converted as Thomas
has already demonstrated.

This is all based on work done by Thomas Zimmermann,
I just wanted to implement my suggestion so
we could select the best way forward.

Note: Daniel Vetter has hinted the approach implemented
here smelled like middle-layer.
IMO this is not so, it is just a way to handle cleanup
for the simple cases.

	Sam


Sam Ravnborg (3):
      drm: drm_encoder_init() => drm_encoder_init_funcs()
      drm: drm_simple_encoder_init() => drm_encoder_init()
      drm/atmel-hlcdc: Use drm_encoder_init()

 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              | 28 ++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c           |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 10 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 10 ++---
 drivers/gpu/drm/arc/arcpgu_hdmi.c                  |  4 +-
 drivers/gpu/drm/arc/arcpgu_sim.c                   |  4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  3 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  8 +---
 drivers/gpu/drm/drm_encoder.c                      | 49 +++++++++++++++++++---
 drivers/gpu/drm/drm_encoder_slave.c                |  2 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            | 45 +-------------------
 drivers/gpu/drm/drm_writeback.c                    |  6 +--
 drivers/gpu/drm/exynos/exynos_dp.c                 |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_crt.c             |  5 ++-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |  4 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  6 +--
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c             |  7 ++--
 drivers/gpu/drm/gma500/oaktrail_hdmi.c             |  6 +--
 drivers/gpu/drm/gma500/oaktrail_lvds.c             |  4 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c            |  6 +--
 drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |  4 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |  5 ++-
 drivers/gpu/drm/i915/display/icl_dsi.c             |  4 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |  5 ++-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  6 ++-
 drivers/gpu/drm/i915/display/intel_dp.c            |  6 +--
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  6 ++-
 drivers/gpu/drm/i915/display/intel_dvo.c           |  6 +--
 drivers/gpu/drm/i915/display/intel_hdmi.c          |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.c          |  4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |  6 +--
 drivers/gpu/drm/i915/display/intel_tv.c            |  4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |  5 ++-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  4 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |  4 +-
 drivers/gpu/drm/imx/imx-tve.c                      |  4 +-
 drivers/gpu/drm/imx/parallel-display.c             |  4 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c              |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  4 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  5 ++-
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  7 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c   |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c       |  3 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c             |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  3 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 16 +++----
 drivers/gpu/drm/omapdrm/omap_encoder.c             |  4 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |  7 +---
 drivers/gpu/drm/radeon/atombios_encoders.c         | 40 +++++++++---------
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |  4 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    | 20 ++++-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  5 ++-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  5 ++-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  4 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  5 ++-
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  5 ++-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  4 +-
 drivers/gpu/drm/sti/sti_tvout.c                    | 16 +++----
 drivers/gpu/drm/stm/ltdc.c                         |  4 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 10 ++---
 drivers/gpu/drm/sun4i/sun4i_tv.c                   | 10 ++---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             | 10 ++---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |  4 +-
 drivers/gpu/drm/tegra/dsi.c                        |  6 +--
 drivers/gpu/drm/tegra/hdmi.c                       |  5 ++-
 drivers/gpu/drm/tegra/rgb.c                        |  4 +-
 drivers/gpu/drm/tegra/sor.c                        |  4 +-
 drivers/gpu/drm/tidss/tidss_encoder.c              |  4 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           |  8 ++--
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              |  4 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                      |  4 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |  4 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |  4 +-
 drivers/gpu/drm/vkms/vkms_output.c                 |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  5 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  4 +-
 drivers/gpu/drm/zte/zx_hdmi.c                      |  4 +-
 drivers/gpu/drm/zte/zx_tvenc.c                     |  4 +-
 drivers/gpu/drm/zte/zx_vga.c                       |  4 +-
 include/drm/drm_encoder.h                          |  9 ++--
 include/drm/drm_simple_kms_helper.h                |  4 --
 109 files changed, 394 insertions(+), 395 deletions(-)


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
