Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8628971F02A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 19:03:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4852DC6B444;
	Thu,  1 Jun 2023 17:03:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABFFBC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:03:54 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-96f7bf3cf9eso165763766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639034; x=1688231034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ftjev7ny28lvJRfWKN2KXX1gaG/LDneackQ782m2++c=;
 b=RXpREj32QF9glE5vpN59wgL/+UV12KKLNYA9IA5/BKkN5MgZGAFTz0Twq/Y4ZK8Udq
 3MKAomKMltBYpKajAE7tTaJq0jTEmWFCGs2ZhQaB1L+TuroGqIzUDmhiCBh2XBcq0rQR
 wyY6MJzAzVQZ1h79fJtF4m08kX4kf4xEXSOBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639034; x=1688231034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ftjev7ny28lvJRfWKN2KXX1gaG/LDneackQ782m2++c=;
 b=RT5JZhq2s3d2+cuCIL6sIb+iNPteZcDb4xRpHSS0uELEj1R+7mCRSMGJDwf9o3eiYA
 8G0ecdFCwDsCgLigTItMfEJmo7xTwIUpbwnYE0wK4xS1QehBYewWf0sgotZqraMLWwd9
 p+KTr21CpQP2vaaYCnLSVnH6PUS52wG1XvJjHjPEKRAPSd/92cvbbhVCB0nRUdUWFKUD
 GD5LU9dEqBo9lhSwT5aRrPKxvHa7vDs9+H0JGHd0o9ag4DHxEDMg8MUlDQStbHeVeqwg
 0AVE9xhcBkgs6mdsbVpNwswHowjML//rLRF1aT+CFc0Fh3345c6TrmuLz2tBYIZ1zRED
 YrEw==
X-Gm-Message-State: AC+VfDxHTL1Heub1irrzU+6B/THOQ6e93x0PDyo2BhcLFaziWHYSIRgY
 h6izDMgUfqwTsrkyecIuvVGr1w==
X-Google-Smtp-Source: ACHHUZ5oUVMAwFD6jXFbU87iuAQJMHlHZ+OpaWeKz6pu4pcRR1a2Pb6wyFg0KLbejd0vnRuywS3xIQ==
X-Received: by 2002:a17:907:da3:b0:973:d2b6:f536 with SMTP id
 go35-20020a1709070da300b00973d2b6f536mr9135641ejc.21.1685639034375; 
 Thu, 01 Jun 2023 10:03:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  1 Jun 2023 19:03:20 +0200
Message-Id: <20230601170320.2845218-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
References: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] drm/stm: add an option to change FB bpp
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
