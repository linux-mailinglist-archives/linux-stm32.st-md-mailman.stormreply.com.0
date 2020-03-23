Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFCA18F758
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2020 15:50:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE94C36B0B;
	Mon, 23 Mar 2020 14:50:52 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AECC3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2020 14:50:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c81so4539179wmd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2020 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xv+IrwzuQ23kGkBFfkZ4yhYMKBg9vr4BWeG8XNXKFTc=;
 b=DFBuV/vHRlNy4uJgrHIviIKNEHIGV8DUY+m8Sf+lTTyhzMxZEKPTCOQJ6YV2BBEW6P
 /aR0KqcuCP7S7DbHXwUiuCcVeu9B/+SJ4+kFhRl4eHQaoHYLCN4Z6eWTRuk2PftIsH3z
 kRT6/M6GKtBM48YSYRBFw6eY40D4ZLZbGjffw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xv+IrwzuQ23kGkBFfkZ4yhYMKBg9vr4BWeG8XNXKFTc=;
 b=fznAXs1Y18myAaP6W1XChpHh81gzkO7WShBA5RYuU/jbFwsyjGklWk+FZZiArSUrMF
 Pchr0pJCHnlK9K5geJvWTOqVlRSaNM/LfLW7ZxeKpwigGbcYGbs/LhGyBoIax2OtTG8b
 zK94JddmbJsAom7syTGP7FfkTmWDzLUMsmMdo7j9iGQwbu17XwrYOAahEGgV8Se92bWM
 rDMqdQOlgj2EGLb83UlECoT/zmSH94ArWFfNKAhaT18lrl3wiW7Xh1N7mvAW3iLtiuQF
 C4QXirRgP0v8S837iFJ08yLN3MWC/ZjvRr2nz+0Fd9k8uJifIhWe890LYtlhkwN0qaFU
 8U2Q==
X-Gm-Message-State: ANhLgQ02DeBfCl7lLavC6vvboxKizgITd5ZyrxSNOg4ndky6lYGV1KTi
 wh6v3C4HOs6ELxgYRTbOlFYNow==
X-Google-Smtp-Source: ADFU+vszAryUzDEXodO9VeF21jcLEW9fueenhM6J2rfMAdMCTpAiCypypKtGWjmlifuRUoMyaOqCvg==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr13066649wmd.161.1584975051183; 
 Mon, 23 Mar 2020 07:50:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 23 Mar 2020 15:49:37 +0100
Message-Id: <20200323144950.3018436-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 38/51] drm/stm: Drop explicit
	drm_mode_config_cleanup call
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

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Philippe Cornu <philippe.cornu@st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index ea9fcbdc68b3..0f85dd86cafa 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
 
 	ddev->dev_private = (void *)ldev;
 
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
 
 	/*
 	 * set max width and height as default value.
@@ -103,7 +105,7 @@ static int drv_load(struct drm_device *ddev)
 
 	ret = ltdc_load(ddev);
 	if (ret)
-		goto err;
+		return ret;
 
 	drm_mode_config_reset(ddev);
 	drm_kms_helper_poll_init(ddev);
@@ -111,9 +113,6 @@ static int drv_load(struct drm_device *ddev)
 	platform_set_drvdata(pdev, ddev);
 
 	return 0;
-err:
-	drm_mode_config_cleanup(ddev);
-	return ret;
 }
 
 static void drv_unload(struct drm_device *ddev)
@@ -122,7 +121,6 @@ static void drv_unload(struct drm_device *ddev)
 
 	drm_kms_helper_poll_fini(ddev);
 	ltdc_unload(ddev);
-	drm_mode_config_cleanup(ddev);
 }
 
 static __maybe_unused int drv_suspend(struct device *dev)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
