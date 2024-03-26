Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8088CE47
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 21:24:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2118C7128A;
	Tue, 26 Mar 2024 20:24:19 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCD25C71281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 20:24:18 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a46f0da1b4fso765876966b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711484658; x=1712089458;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kB5jvT4S7A1HpS3cfPeTRooUZKIZ+DXxiu/1Uok5y18=;
 b=NQ4VVrAfn5phJvYQpWgsCNL/2rGQ6he2XS46HxIjytZeEv/ZIiZPKMoQe1uEPB7hEY
 WpqEWEncKdIB4lSVHdYOtJ5naWkc1j0RgpxW0Ez0mxRAWooASgYxMIqviVGlZgjy4WCh
 YEHWyCvlLSvObjtK8CrlVvd6O0iMk2imfJFephG2krpPVkJQ18Yg434e4DRSqXx81uTg
 7gnBJLBI9++VBsxqWJRgh8ZwyHqOP01NM5AkTCVLEH24dGv3ETsmbMGPnlgBFixd+BvB
 M63+pox8LjQiQqsX4LUsd0/39lRyXZFMlf3W/0p2DtTaXTJV61Ky/GoSZgMX3uTwm70D
 LOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711484658; x=1712089458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kB5jvT4S7A1HpS3cfPeTRooUZKIZ+DXxiu/1Uok5y18=;
 b=kdMokexv85Bvbftx5j6GjZajR4Pyb/ckoxRvcqB8RfPjLdp9KbKluGE1GgsJ1r+1jo
 16zhUH+uDYhJhonlru4drGA1NyFgDSlVQuF2mw9YsI3iW74KH7OxTIVTT1eTf80hzrOn
 A37NHpyZH23CUd5CNInekjQFy9hp7ZSIwb02ipqxSFO2eG0OVFjn/FEfxhyfm/80ItMo
 9m8K4DzgLei+Irz8hIvUWypjNpx7i9avs9U56+SMxJw+BRGbdI/pI2AvjKncBTvuJc1f
 sZO1IKxBDodLWBnOs42jAIDB22d0mbAiNt/nRlyQkJS1JIyGwiF/K9QvhwUmF/Rj6T/c
 I5uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOjrQZ6zTDWpybgSCQRMn6nZc/BKmuhuv5qsFjLf//JwKYt5n0fwA2e8gnP6o7S4XHdPIV7y5CuHq51mwHpjpjD0rYRBsQEMm/w+fLLZcHeB1tAFxw2K/R
X-Gm-Message-State: AOJu0Yya42U2lcBA+ehLqYqoX8XuHL74HoU7QGzOwx3RXLwsS5WGc4/q
 Ghoa/1jFcUuR1/K33WY/X001l5pj+lsO3/OYVAvm6MhXsYpcsPsAdXxfbTmmHcU=
X-Google-Smtp-Source: AGHT+IEyS9tnrSIemw0kLFF+72JgXRqLE6M9KrOysNkNOnmeH8BJgB2ASc79O+oEZQvxgv1o8wCeug==
X-Received: by 2002:a17:907:86aa:b0:a4e:29d:c2cf with SMTP id
 qa42-20020a17090786aa00b00a4e029dc2cfmr30786ejc.29.1711484658382; 
 Tue, 26 Mar 2024 13:24:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:24:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 26 Mar 2024 21:23:39 +0100
MIME-Version: 1.0
Message-Id: <20240326-module-owner-amba-v1-9-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=722;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fnlJGlGCPlGnh8/3y5/698na0L3A4l3OxrAMDKXym3w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7THHtSEYd3f96/f1nr7d+Iclo+pWi5CIiYZ
 0YERGX5JTOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMu0wAKCRDBN2bmhouD
 1yFjD/9SWsyXmiy+bsVRyfZIBbZGZjdHUxFAHi59IUIzhHcxiGObntzThm/sYmK1ZNe2fjd4Z6x
 ty2Pq7Ib3KxpEGKe9D1nz/n3zS+yAGd3ntbzjNreMPx6j8HKOvrql7CVhIPk6CiYN9f3Lm7ZpUw
 G7Mv0ajwulkRjHAa16rssNS8kuE2mBU0LRawMhsF9fFF3i0lP+tN5Mx3dCtK+pQ8xnYxrqfwj60
 g6YFNuR+3EUGl0fhhIY0GtSfkW9UtLAeWjX1UpcKdL1DdMbGUOJ2lvgEXUPRpHdE87zqUOR4+up
 alHUpmtEY8VSkpqT6uTlIeC4MoU88Tyn62VGNjqH6zcBmra7HEVqkUV1gxfVgXFfS0sB48enFRe
 yLy9P1TFBQa4RPGISdHtbTViJFByBeOrMrdB+bEFiEmco76wyt2gcYL4+QEAuNkx05obioAK0LW
 oi6k5fu5eYVOiTtEK5eNA8wQ1fZGmx3bwH8GLIOfPjhDqtlkt4TR+B11CZxOUV+aHVl4mX99s9X
 D0FUGqojtc6l2Vpa/AAiBHWAsw2feN4vhNgaoG2PzUW5DUkTGu2/NeShZMo3mLZseoyc0UYaXWB
 Zpb+IacOi/SIBoR7oiTw6e13jMWBQ4lltgnAd8i2GB76EFyPIItuxNHEM8W+XUdNgm4Cj1EA2SR
 B6yGWbHpUQGNRWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: [Linux-stm32] [PATCH 09/19] coresight: stm: drop owner assignment
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

Amba bus core already sets owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-stm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 974d37e5f94c..15b52358965c 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -954,7 +954,6 @@ MODULE_DEVICE_TABLE(amba, stm_ids);
 static struct amba_driver stm_driver = {
 	.drv = {
 		.name   = "coresight-stm",
-		.owner	= THIS_MODULE,
 		.pm	= &stm_dev_pm_ops,
 		.suppress_bind_attrs = true,
 	},

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
