Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EA1C672E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 07:07:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AEBAC349C3;
	Wed,  6 May 2020 05:07:56 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43F51C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 05:07:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x25so998622wmc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2020 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vH1kJeWFMFqUY6h5ETi0ZcC8WleFTiD6Swlqzl2oX7U=;
 b=pl3mqNDFiO1VQ//NUB/a6LkFWdanYHjiv0fnTZkQ5RSbzLJ77gdm6X6hWt2CiFyaS1
 zdmIRRCuSaXtk9n35DrnHK8BigRY9zi8ydaxTBzqMm4oWNJge23/3PcGSK30xEZlbImm
 JzvRPPtsuJ5iAvyLlEzEtPaoeuXmllsd/r7J7DN/Box6IttiFmAykBIh4Wb/v9TmjlPc
 H/aB+R1iSkMsIMO1o4/DFbGuORdTZGyaE/pgHRxl5GJ7ZxLDTqrjuv67k0j97cVu+Hg/
 rwuAOm7Zsn5heUAMhMmQ1ePZ7QhWAe2bzCsGuX8dZpu6NyIDr3nSO76mGIBSW3aBD+JL
 hTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vH1kJeWFMFqUY6h5ETi0ZcC8WleFTiD6Swlqzl2oX7U=;
 b=NagYLthW5Cj/P2hz04MgmKlrjDLPtScJlCni6ftOd+OlkO4S+vMoxK96MfDRsFH34/
 qApE4yR7xXR5WNOXfsP5zvm9Ll4V91kQHUXAMj25z/zIhITyuOJBSSstyD2YRfOkHY9Z
 MfEq5Uivho8GUUCpKn89hHtBCqwUTmZGTOtZjezFq9x/ug6PkIFde6X91fK8zaBbnjo/
 xY2uxzZz9Va0xdgMNMz8DU+7vT+1kQzpgRaElhykUYh11X/tYi6eP58OPoiyxT9VOXQ7
 lSH4+zDlzQoCHwVFwnMo9mBOe9ZujIgbQb1Ufvs+2diPUes1VKmSDHCaZGLaaXp6n87a
 uQcg==
X-Gm-Message-State: AGi0Pubh1r04UGP5M18GhTTthTEv0aJYCQGAZwTjNRE4Vwq6R/ZOTq6I
 +lIcH0GOv/cEhGE1xzpqzSM=
X-Google-Smtp-Source: APiQypLH9+oYRyIqGtyM1npSpJ2vPM3TI6PRcfz/EzhzDgzXQrn+PSvjdvVyw1TNdLyHW7ga380FUg==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr2242366wma.149.1588741674674; 
 Tue, 05 May 2020 22:07:54 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2df1:2500:bc2e:80a7:2be5:2fcf])
 by smtp.gmail.com with ESMTPSA id x24sm791504wrd.51.2020.05.05.22.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 22:07:53 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Wed,  6 May 2020 07:07:44 +0200
Message-Id: <20200506050744.4779-1-lukas.bulwahn@gmail.com>
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
Subject: [Linux-stm32] [PATCH RESEND] MAINTAINERS: adjust entries to moving
	CEC platform drivers
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

applies cleanly on next-20200417 and still on next-20200505 for this
resend.

v1 send here:
https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/

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
