Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7E1AEB62
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Apr 2020 11:36:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6520AC36B0D;
	Sat, 18 Apr 2020 09:36:42 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E30FBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Apr 2020 09:36:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k11so5754296wrp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Apr 2020 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
 b=Tb+VfyjCYOWDy0PsTMFPIeg6WnHIszFF59D9PjMUUN0svKLTjpF3sZyl8H3Co1dk1l
 D1IMe2542AOhP/cWtXp06jpZhMqZJ2BJoQRz9spW1Xg1zAObvwCgMXOwepeCGJGWeNGW
 N0P4haKVg4K0BRpas6bIX1+Bnr4FVIv8OeoorUMBA4fRnsia+1lhZ7HudEYL56Mbcwhe
 5qNE1ifOcKOUjKeJZossp3FYEzCrN/tzL6xjWouAJFs7pg9xpGak6nN4yMiaZeQgKYXs
 XENhLmqeK43ZT7BrVNpnfFHYAB/vIKiHYiSVJzfWrnw+xAabKU8ccD3mra38zKJ4fY04
 kWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wgfu39vG9R4ll9eCVwJav8n2HM7rx8PAeBSHmbcNkjA=;
 b=IhKhNhTJ2hijycAG+6cR0s+w1B15ftPqF0oqZWr84Lgq0U4E8U9QMK+WqyYAZHrO2T
 mTLJt8GDDxOjTuSHBdKsYu3jCj63mBNFGg7Mzn8TrMg6ZHQxZAd45d9o3pptichKEO0Y
 DGCuTgi8gBNP4BTAGozDcV6yM7akL4IQ/6MPHNEe+mStUWza/I2dmMYG+8a61bSVJpjN
 qkFqwwrKjqpwNQ8Lz/Xgq5PgpftiFtgSopd7gmMvN5H33SNS87H2wk0wzQL+X/9c2q4C
 1S0VLvZCAHMhivR7NIBYVAP9UVuCNeX3RKqYF3oEoGqxdw2rEWvlD4jKhayzMCiY3i2b
 Sx4w==
X-Gm-Message-State: AGi0PuY9xGgkowkS866Ss02LYH0VFZZjkmBqRcEvwy1sB7B1kO0smk4L
 1HJmb6/9CxbumL0I7DGMFDw=
X-Google-Smtp-Source: APiQypIcLoxJQNQyMnGc2ZI2HXyHFpNGpG/umKJLNyhN05r5WvOL5tqpbb3JhDDJb77z7YfCVPUx1g==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr3726868wrn.396.1587202600229; 
 Sat, 18 Apr 2020 02:36:40 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d7a:4700:391d:588b:ee8c:e294])
 by smtp.gmail.com with ESMTPSA id d133sm11782497wmc.27.2020.04.18.02.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 02:36:39 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Sat, 18 Apr 2020 11:36:30 +0200
Message-Id: <20200418093630.6149-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Ettore Chimenti <ek5.chimenti@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>
Subject: [Linux-stm32] [PATCH] MAINTAINERS: adjust entries to moving CEC
	platform drivers
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Commit 4be5e8648b0c ("media: move CEC platform drivers to a separate
directory") moved various files into a new directory structure, but did
not adjust the entries in MAINTAINERS.

Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches F: drivers/media/platform/s5p-cec/
  warning: no file matches F: drivers/media/platform/tegra-cec/
  warning: no file matches F: drivers/media/platform/cec-gpio/
  warning: no file matches F: drivers/media/platform/meson/ao-cec-g12a.c
  warning: no file matches F: drivers/media/platform/meson/ao-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.c
  warning: no file matches F: drivers/media/platform/seco-cec/seco-cec.h
  warning: no file matches F: drivers/media/platform/sti/cec/

Update the MAINTAINERS entries to the new file locations.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mauro, please pick this non-urgent minor clean-up patch on top of the
CEC platform driver moves.

applies cleanly on next-20200417

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3083282134de..a708773e1af7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2373,7 +2373,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2518,7 +2518,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -3932,7 +3932,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11027,8 +11027,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15063,8 +15062,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16089,7 +16087,7 @@ STI CEC DRIVER
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/stih-cec.txt
-F:	drivers/media/platform/sti/cec/
+F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
