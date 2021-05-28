Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C9393E69
	for <lists+linux-stm32@lfdr.de>; Fri, 28 May 2021 10:05:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A511C5718D;
	Fri, 28 May 2021 08:05:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2161C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 08:05:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S82QEb008172; Fri, 28 May 2021 10:05:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=zlUZ4FPCmueUwNdjwddPrmOdSMDAIN5yHnfc9LimaJk=;
 b=DQpZRYdF3x2GZjYZ/XlPglm9ICNw6a/v8KgxfiXb7wvjWdXjAk/q523nQeUd8FMYQbTj
 cVrsvoYSHYjdjPZYV9Xkd5jHVbAjXxVbrEYdRY8jykQqOTdcffNpf4nNbGmpVuHQZtl7
 DFF74lM1RNpxMwMc1Fr4EWf/l2x8vv3WZKri5S7+HHuBsnTPYDMJIoyeAAGmG5VT/3VP
 Hqe1i9E14myhP7+Wg8eg+7W13WhuAUM9FPlhkMy5AjPLjmijquMO/8QHwGU3v5/+hAEs
 jjvuoKMPr/q2XOlzt11OH2zI2E/HqTrsJxkNwkmMTyuKrs5GDpf2bZaVFqzvOTnKkuQA kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0gyy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 10:05:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C3C2100034;
 Fri, 28 May 2021 10:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 499C021B521;
 Fri, 28 May 2021 10:05:21 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May 2021 10:05:20
 +0200
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Antonio Borneo <antonio.borneo@st.com>,
 "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 28 May 2021 10:05:13 +0200
Message-ID: <20210528080513.8168-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
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
Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index e99771b947b6..d113b9be12c0 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -570,31 +570,33 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
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
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
