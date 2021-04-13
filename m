Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A335DB9D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 11:49:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88318C57B78;
	Tue, 13 Apr 2021 09:49:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179E4C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 09:49:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j5so14800568wrn.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/VCtoETMmUzL0vMPqbtcoUDD2y2ltfbzTlgLqC6ZdU=;
 b=BRRd8qbtTFGYEMdRV5HexTZXmoRkVYk8JiyfN7BdyhztQs/RDa754NvDDd2qaxbN8U
 DUWmf96W1+eX9ioCfQNqH//U3DZEaHBT4N/+sGgxpgWhazVlP6RJBuaqEj6TztkURr04
 NJXk2wKPT930X8RRnXr25PPTXiO/eMJ+BuGck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/VCtoETMmUzL0vMPqbtcoUDD2y2ltfbzTlgLqC6ZdU=;
 b=Aljj7vsLcgCmMR4UlLuisJZAMk1h1u43iw7xLDcsqJn8I96cgwE9FHTXbfUR/1dESf
 KjpK+nZexnFV6EVs6tHV6/hKCNeZ7tjxXMZZyYfYdt24OF4/CqD3I+waVj5AWt5QXwqm
 R7R11BUJYTp4E60Y/iZd/inu6+WylDciBQThVNVz5ljpD5K0iaGKjf1l5VsuO1wmPBn0
 YymCBh+hJdwX001kCsTHAZlrEUVaIRJDucD+zC/XB5//FmdeyhdN5xUyCaCDaMSYINQC
 mcHrW5I0hjNlP/yKym8N+HvQl7e78EXs+4zJ64Cf7hSMPE9cI+LndSqumWEVNSPZtr31
 BZlg==
X-Gm-Message-State: AOAM530F/YY5O8b+J0qvVzElcU0yVMxVtxbUVSjuUBPjW/LD7+dP8W3x
 0vANorBe5IDIfQQghp5sIlxJqg==
X-Google-Smtp-Source: ABdhPJw1GFAzXcytfZXNu9CcACpZoWl3EZWaSegc/mUkmbt0A5hEw3xdPxj85E3UJSo3NsC8wcDNLA==
X-Received: by 2002:a05:6000:83:: with SMTP id
 m3mr34903882wrx.321.1618307358507; 
 Tue, 13 Apr 2021 02:49:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue, 13 Apr 2021 11:49:00 +0200
Message-Id: <20210413094904.3736372-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/12] drm/stm: Don't set allow_fb_modifiers
	explicitly
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

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/ltdc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 65c3c79ad1d5..e99771b947b6 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1326,8 +1326,6 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
-	ddev->mode_config.allow_fb_modifiers = true;
-
 	ret = ltdc_crtc_init(ddev, crtc);
 	if (ret) {
 		DRM_ERROR("Failed to init crtc\n");
-- 
2.31.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
