Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D572543C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:31:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70BAAC6A5FB;
	Wed,  7 Jun 2023 06:31:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEDF8C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:31:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so6827218f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119514; x=1688711514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=oij5WgWkvYYOUtEp7mGMYwADDCD01LfrAmCNgml9W85dFDuFYvvNhkENHGeXh9Cq9u
 3pK6gWcbQ7t2LYbZXgI0BCw/6fRRB5PeqRjLTlBbp+ET9axLadAiZztH4few/0KIz34X
 QJqbD/+9emeAKB44hrtPdlFjhs5oBzK5xrdwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119514; x=1688711514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAW+zzizoPdH0S/aO5WCXuWp95MvJ4568t/x7rERkZ8=;
 b=f/Zz89jtkvE5GZjNMVAb5VlixyX2iyvx0h3t27oPAcC+7i/NFsbIGXc5STfGsPhUgJ
 Amu7wRqJE1li8YvXKAom7sJkFU+nmrLpPuTCJwhKg4GDcedwfUF5s8FeGNY8oADfu3jk
 HjwZYXVZFPRpePNJ1cto4yjGeb3o1VGRiymqTRhI7hF6pAaxtPIqf0iy4bCK3eaM+ZYO
 fy4QPQb+FpBDdZhmQztmrzHJHwrV8Gnm0jbucy26j01PH/mdwbKJ+GikwNS/8y55K6qW
 5Ni/92+xX0QwDbElAe6y2j3+0yE/HYuQq/zuSOXTaeydiOFCtFLwppvhVyaJ+MigciMb
 hykA==
X-Gm-Message-State: AC+VfDyj2cjWLwyoLAWN3aVhJQ4j9eag5YhBHvl+9eX1kdswB3q/wW8H
 FSBBRJGAo242Ki7Ay9WBfMzymA==
X-Google-Smtp-Source: ACHHUZ43EByLSLWH1Hp4CJmVlLkzIZdJ1bFJA5cBLjDViBWwpcPQQjpHCIvTkQJTIAxM2+k+COUtcA==
X-Received: by 2002:a5d:420e:0:b0:306:3b78:fe33 with SMTP id
 n14-20020a5d420e000000b003063b78fe33mr3151485wrq.32.1686119514598; 
 Tue, 06 Jun 2023 23:31:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jun 2023 08:31:39 +0200
Message-Id: <20230607063139.621351-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 6/6] drm/stm: add an option to
	change FB bpp
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
