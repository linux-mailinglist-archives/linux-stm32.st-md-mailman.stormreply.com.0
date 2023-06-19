Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E793735C81
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 18:56:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA6A6C6B454;
	Mon, 19 Jun 2023 16:55:59 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A47C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 16:55:58 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-763aba07271so2403785a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193757; x=1689785757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnZNU/I8hVx/txQg+gZcbNdILNkL1d9QJiWI/0DW9wI=;
 b=FZytthrbCYDv3RZOtaTdlEZCVgoapIc+1yj309YHwRqE+CagPIrZRG0F4niNuuyc3M
 wLe5zF+7iiwSyXRnaT6Y7CPeQqeymyE9pCTfaXwRIDGwIf5wx1u+z2L4eWJQ3cpboG1I
 Ho3OM31KAsV2ZJtI2AE5AiRcYIozPpNICyWts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193757; x=1689785757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnZNU/I8hVx/txQg+gZcbNdILNkL1d9QJiWI/0DW9wI=;
 b=a6KGb6yHoRrN78uTNNIjT1LlWu0N53Og+VVihcxXrDH7YHZhzi7gbbaPE+bgSrV+yl
 eMyRMYNlw4TQgTCRL7pGneHvDW/AbeDmC7ntoEBGHn3lA1ftRGNqLA9fUGlVA16bLJ1H
 1MuSKv7RgajKbQ10vMxH/DjGq07nLzMla7RnHm88kZxo5+NQjUU4C5WOQg9QCfqQlFUW
 oNv5Ko0aN3IILt/EFOltN8tTpsvltu6LKl6Ihj93rdVCfIvjC3a5tkrwaaB1fl8dsmAE
 K5VL1CgQU7BkR59pOgb991hmW/Lt1DJU1R1nM0tmMNU/A832IEMTvIk+zl2rlSSYx1hm
 eaSA==
X-Gm-Message-State: AC+VfDzZ3drmz75AAJFZtnXBQj+GFIUm5g9vJ/9rzPG+qUgd6serJnt0
 kQ7VKY58EV6RQ3sd/WcyU1h3hg==
X-Google-Smtp-Source: ACHHUZ4seV5vQMD1B3+dqGuDxNBwJBs85xEpHLWIbXaIhwEvDfAjEJU/sT7OAfJwkc2qH0vO0JafgQ==
X-Received: by 2002:a05:620a:4397:b0:762:39c:7fb3 with SMTP id
 a23-20020a05620a439700b00762039c7fb3mr11634709qkp.60.1687193757326; 
 Mon, 19 Jun 2023 09:55:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 19 Jun 2023 18:55:25 +0200
Message-Id: <20230619165525.1035243-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 6/6] drm/stm: set framebuffer bit depth
	through DTS property
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

The patch, which is backwards compatible, sets the bit depth of the
framebuffer using the optional property 'st,fb-bpp' in the DTS.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Use DTS property instead of module parameter to set the framebuffer bit depth.

Changes in v3:
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

 drivers/gpu/drm/stm/drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 422220df7d8c..7a61a3c63469 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -180,7 +180,9 @@ static const struct dev_pm_ops drv_pm_ops = {
 static int stm_drm_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = pdev->dev.of_node;
 	struct drm_device *ddev;
+	u32 fb_bpp = 16;
 	int ret;
 
 	DRM_DEBUG("%s\n", __func__);
@@ -203,7 +205,9 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put;
 
-	drm_fbdev_dma_setup(ddev, 16);
+	of_property_read_u32(np, "st,fb-bpp", &fb_bpp);
+
+	drm_fbdev_dma_setup(ddev, fb_bpp);
 
 	return 0;
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
