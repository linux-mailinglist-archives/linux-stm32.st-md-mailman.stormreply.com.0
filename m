Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5B32A8A2
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 18:57:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D31BC56638;
	Tue,  2 Mar 2021 17:57:24 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3F62C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 17:57:22 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o6so2523526pjf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 09:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0XgsYWzCDRLhsNvXhAFsWAxsY9xHFp6XSF1To7GMYQ=;
 b=YLXgMyNgQnRjv23cdr0A9TqS5czUZWEqzjL+SQxCKArJAenMg38p+18B8lgzV/8W4O
 6MzfIGFKr7GFV33hd1rAckk4m5r4+6cECKAnMmht559jzSqe0nza6AoCUM5mLtb3bz2+
 bT/JSMkWWSIB0AxeshdzbRMy8Pi7xG/9lxKuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0XgsYWzCDRLhsNvXhAFsWAxsY9xHFp6XSF1To7GMYQ=;
 b=ddcRMsLgbIZNa3exQTg80rBG6uDz6NtG0V0tgYLNv+A6kSZZsAqxuhTprreDI4ggzt
 CVzETmDDZhXQiGvlQ3MCrYUzi49KX7Aq+syIP2imNaN+9TPR0nMv3zBHZo5fuyJR/uLY
 Fy7aVkO5M0E1SAHarrlrkxjugTyI2wBX97MPzVRc062QN7zdKyh7YTd+JqtKxTEe87xx
 Mtw2yKsvY1a9XAXfM3zQbmsapZEqHrV2pxDS5pCFYs/EU8B1phVLS2VPFKw3qlbdT0/5
 lsqSm5TDetBBjnWphfBMpLNbUwbM1nsB3sZN61zuBSVyxOXrbNPOj3/IQQsD93xwth5K
 NYVg==
X-Gm-Message-State: AOAM5301NuerF3+EfUeNMOxIp6G5J6J3tIJS3kojLjdoGW+nMRT/8sEo
 RUBs3xD41mo0TmJaqQ6MhBT/og==
X-Google-Smtp-Source: ABdhPJyo1UjGzp40tLRvvraXfpsxXnqkr/lo8Ai+kssmF8iV7dIyu7Zguv60AaGzSRRkEo9ejOaxTg==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id
 oa6mr5801071pjb.86.1614707841197; 
 Tue, 02 Mar 2021 09:57:21 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id e22sm18521329pgk.56.2021.03.02.09.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Date: Tue,  2 Mar 2021 23:27:00 +0530
Message-Id: <20210302175700.28640-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: Use simple encoder
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

STM ltdc driver uses an empty implementation for its encoder.
Replace the code with the generic simple encoder.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/stm/ltdc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 7812094f93d6..aeeb43524ca0 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -31,6 +31,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	return ret;
 }
 
-/*
- * DRM_ENCODER
- */
-
-static const struct drm_encoder_funcs ltdc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static void ltdc_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_device *ddev = encoder->dev;
@@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 	encoder->possible_crtcs = CRTC_MASK;
 	encoder->possible_clones = 0;	/* No cloning support */
 
-	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
-			 DRM_MODE_ENCODER_DPI, NULL);
+	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
 
 	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
