Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E91D771FEE7
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 12:21:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7BC2C6B44C;
	Fri,  2 Jun 2023 10:21:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 544F2C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 10:21:43 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2b1a6a8e851so18593811fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701302; x=1688293302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=GsIwW50OWWABkFl4+MuMJVsJnIxd4RnUEQwdl1LBq+pD8w0HebLB/EDl2doqWRzJ8d
 FUc1iu7tzIbfsEjTdGKjveBeIhM3zz7X0KyRVROnmgYdIZH/WJXnskct5oE9wQHVFSwh
 lNzJ/DZ81S3JWUisdMUcVi1iR/gQGgqeymMQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701302; x=1688293302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=c4XUtxOYzplaueM6unohhle3Pot2P65H+tU0HWIIi7Ufn4NOtfBvL8Bs2zEyl5rk5/
 Zf84d1rNDfoPscitEnV9JnKcSpXg+lSo7r1oc6IUMoDb9ev1Gv4r2KKnsKJ4kVbJLPGQ
 +/MzkLujM0w2AmEspG7Dlwkh1UG/SSSJx06gDSgI+9vaJA4kLx3Eq1li3RyxeO4795K3
 wlcPqT+frAmVcbPyJ+yDR+N6HzRWHuZ7Oin59/pNmG0WaPuBU1Vz4yiwY5tsYtMDlgEQ
 I+LVLZ23hBvg4zOgMQ8j0ocHhJaE0hzWVUGRW7GImYTyuvNydXAzG8ZIHnx+yAI+S/G5
 ohxg==
X-Gm-Message-State: AC+VfDxI1x0gjjlz0TN9Y04KRRQhSNlyoH/mAEnV9KE85pv9yfTkPYPf
 RqQFD6FP3GHv8vzBs58qhKsCtg==
X-Google-Smtp-Source: ACHHUZ4v/QjfVIurcf6EcYp74yUStSbnTwORv45UFzpMUVWYQmmjYWbUpX5dFUE23r1qClGmatwwkg==
X-Received: by 2002:a2e:9216:0:b0:2a7:7d70:6bb with SMTP id
 k22-20020a2e9216000000b002a77d7006bbmr1425706ljg.2.1685701302702; 
 Fri, 02 Jun 2023 03:21:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  2 Jun 2023 12:21:22 +0200
Message-Id: <20230602102123.3345587-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/6] drm/stm: add an option to change FB bpp
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

Boards that use the STM32F{4,7} series have limited amounts of RAM. The
added parameter allows users to size, within certain limits, the memory
footprint required by the framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 drivers/gpu/drm/stm/drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..65be2b442a6a 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -30,6 +30,11 @@
 #define STM_MAX_FB_WIDTH	2048
 #define STM_MAX_FB_HEIGHT	2048 /* same as width to handle orientation */
 
+static uint stm_bpp = 16;
+
+MODULE_PARM_DESC(bpp, "bits-per-pixel (default: 16)");
+module_param_named(bpp, stm_bpp, uint, 0644);
+
 static const struct drm_mode_config_funcs drv_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -93,6 +98,7 @@ static int drv_load(struct drm_device *ddev)
 	ddev->mode_config.min_height = 0;
 	ddev->mode_config.max_width = STM_MAX_FB_WIDTH;
 	ddev->mode_config.max_height = STM_MAX_FB_HEIGHT;
+	ddev->mode_config.preferred_depth = stm_bpp;
 	ddev->mode_config.funcs = &drv_mode_config_funcs;
 	ddev->mode_config.normalize_zpos = true;
 
@@ -203,7 +209,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put;
 
-	drm_fbdev_dma_setup(ddev, 16);
+	drm_fbdev_dma_setup(ddev, stm_bpp);
 
 	return 0;
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
