Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E616417F
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2020 11:22:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 945CEC36B0B;
	Wed, 19 Feb 2020 10:22:20 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D10DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 10:22:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t3so27522144wru.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 02:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSnq2pVWW+HKeYXXYM7BB1vTVqLVzuXFgXE6h06xFu0=;
 b=liIx7CqvQUzNFoG4ELSAG3R9vmPB0o85DvqOnShuce4VgyiZn/mciQMBO1AhL0XJWg
 OjqpsJYMUaXd2uAVaUgmLW7I9Q0LCxuoUwB16ZRnK4xIZT3Zr6KbI1h43R1iQxSf1gxa
 lNBDHZGDLOUpLkxXfaGxaExMwBJNCUM1/5Zs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSnq2pVWW+HKeYXXYM7BB1vTVqLVzuXFgXE6h06xFu0=;
 b=Y5R9bAqr8iIfsSJsUXTZ08cxBtYSfrIdBc71rR2k9cvTh/cXEo3hOJFGO/M++JzrIH
 fcWJ3tQQY7K3HAuDyJpgwsqYoKpxy+KCSjSqoiK0VY3MQMaBy1/QJbcW3LwAvbkHXRUR
 Ci95HkPIqct6/aa8+9FZgK0KKLqgjmRR3vUbX23Nr+ctGHyxIyRsee/juUjWA05Iphhb
 kHgImKWEDnnSIuJwxxW8yqaFI+wi6TumKrfGY0fYziGM2oqKFRk7FtwsOxpZfkuTMSp+
 Ofxo83QVFPVqYOMrS09lDW957mbnhkZ5l3NggCb8slE2QOACmkffQySS1EMW9oA4ua/a
 Ycmg==
X-Gm-Message-State: APjAAAV8e3wGk4LI8oUlSHrvzBaxrmrNiK8fFbglFqjZj6OTBzB4nKpU
 BE0KShCRlxKvVKuqpYKBGW1CdQ==
X-Google-Smtp-Source: APXvYqy/e8jWrTjkXr2HY+OkVTrZXl8KRtvIPL5iL9prazJwu6GqRHfncrGgKjSWy6Dh2gzsPrnj6A==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr34513767wrp.63.1582107738038; 
 Wed, 19 Feb 2020 02:22:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Wed, 19 Feb 2020 11:21:09 +0100
Message-Id: <20200219102122.1607365-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 39/52] drm/stm: Drop explicit
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

Aside: Another driver with a bit much devm_kzalloc, which should
probably use drmm_kzalloc instead ...

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
index ea9fcbdc68b3..5b374531dd8c 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
 
 	ddev->dev_private = (void *)ldev;
 
-	drm_mode_config_init(ddev);
+	ret = drm_mode_config_init(ddev);
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
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
