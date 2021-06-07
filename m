Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F839E552
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 19:25:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D389C58D7B;
	Mon,  7 Jun 2021 17:25:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AD7DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 17:25:13 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6797D826AA;
 Mon,  7 Jun 2021 19:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623086712;
 bh=p3eOiV058Lu3C5PA8aP1sUi9dv/4rSIfV7mxOaXnpiA=;
 h=From:To:Cc:Subject:Date:From;
 b=q1le/g3S2Lcwu0shiaQKw8AdyjwlWZlZ+jukhDnY3Vm9Jw8XsU5rTSGNzyZoni0dP
 nad7bwoJhdQtDz7EFDCVo0ZVCPLodjq35d+gEk8BFUNFDo5bXJt7TmOjh0y+mOCH7J
 4b3O76NGmFAJjuixQfnzQICcWQHUoMVn3qkjzSvv0FvnroINUIVfxC0QG9Fmr0wFbL
 uYmhla1mG2VKxOfKA6io/lz8H210OdSIkVFG01MgERQXQmEdLWB0C3jzfKtzXWkIy2
 2fXz/W0WmzHi/N9lZpTEwe8keuz4wTWQZiNV0LT+eu7CpCbzPmU/GU0K3M1/80Ogph
 tAIMSGl/h2YoQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Date: Mon,  7 Jun 2021 19:24:57 +0200
Message-Id: <20210607172457.14471-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: Remove usage of
	drm_display_mode_to_videomode()
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

There is not much value in the extra conversion step, the calculations
required for the LTDC IP are different than what is used in the
drm_display_mode_to_videomode(), so just do the right ones in the LTDC
driver right away.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index e99771b947b6..08b71248044d 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -531,7 +531,6 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_encoder *encoder = NULL;
 	struct drm_bridge *bridge = NULL;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
-	struct videomode vm;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
 	u32 bus_flags = 0;
@@ -570,31 +569,33 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		}
 	}
 
-	drm_display_mode_to_videomode(mode, &vm);
-
 	DRM_DEBUG_DRIVER("CRTC:%d mode:%s\n", crtc->base.id, mode->name);
-	DRM_DEBUG_DRIVER("Video mode: %dx%d", vm.hactive, vm.vactive);
+	DRM_DEBUG_DRIVER("Video mode: %dx%d", mode->hdisplay, mode->vdisplay);
 	DRM_DEBUG_DRIVER(" hfp %d hbp %d hsl %d vfp %d vbp %d vsl %d\n",
-			 vm.hfront_porch, vm.hback_porch, vm.hsync_len,
-			 vm.vfront_porch, vm.vback_porch, vm.vsync_len);
+			 mode->hsync_start - mode->hdisplay,
+			 mode->htotal - mode->hsync_end,
+			 mode->hsync_end - mode->hsync_start,
+			 mode->vsync_start - mode->vdisplay,
+			 mode->vtotal - mode->vsync_end,
+			 mode->vsync_end - mode->vsync_start);
 
 	/* Convert video timings to ltdc timings */
-	hsync = vm.hsync_len - 1;
-	vsync = vm.vsync_len - 1;
-	accum_hbp = hsync + vm.hback_porch;
-	accum_vbp = vsync + vm.vback_porch;
-	accum_act_w = accum_hbp + vm.hactive;
-	accum_act_h = accum_vbp + vm.vactive;
-	total_width = accum_act_w + vm.hfront_porch;
-	total_height = accum_act_h + vm.vfront_porch;
+	hsync = mode->hsync_end - mode->hsync_start - 1;
+	vsync = mode->vsync_end - mode->vsync_start - 1;
+	accum_hbp = mode->htotal - mode->hsync_start - 1;
+	accum_vbp = mode->vtotal - mode->vsync_start - 1;
+	accum_act_w = accum_hbp + mode->hdisplay;
+	accum_act_h = accum_vbp + mode->vdisplay;
+	total_width = mode->htotal - 1;
+	total_height = mode->vtotal - 1;
 
 	/* Configures the HS, VS, DE and PC polarities. Default Active Low */
 	val = 0;
 
-	if (vm.flags & DISPLAY_FLAGS_HSYNC_HIGH)
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		val |= GCR_HSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		val |= GCR_VSPOL;
 
 	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
