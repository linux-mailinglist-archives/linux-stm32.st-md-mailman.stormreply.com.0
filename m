Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FAC1E108B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 16:30:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A54A8C36B24;
	Mon, 25 May 2020 14:30:04 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7397C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 14:30:02 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id d7so20667448eja.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yMh1OLCPJYxMT3dRwDh/Pc1pXHaCVXG/hZf91AhdVB4=;
 b=BOeyv6u90esY242TIOVf8kZuHxZc7IiQ4MFI+Zqvwnzes9+xpAj9hLrHuSa2uyOBDF
 Or68NuUhIgoEg6nrhjh+IEbnG9Whd1p5tJqEWeNdAT0ST3Osy+qsjbWYmUd9upYS+BdI
 2qgI30mwbvOogfXDlMdztExw+nMndzWJd43DYd3kfgXSNP3MnD7GjZ0Xy8FkjRu7QqWk
 VUSXBMCyKF/d2KTbv5eA+/8WowJnlaEfolsh1wtKblHmFhkOjXyGM9Yf7P7h8hbeuACF
 hyKMECLKRaGsrNpU3R2oAklEG3KJhKdUdgKPm1XyKHn81exBNgBWveq1bY0yPJAdBZfJ
 PuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yMh1OLCPJYxMT3dRwDh/Pc1pXHaCVXG/hZf91AhdVB4=;
 b=rZCEg6SlAOYd/GLX95I42g8QkKOENCs8v1wwUpXdJJXcpB8Jv2OLfQ5DfXEFxEI6b0
 90Zg03hcN15W1EZw/2xegzSgrDqBMbdIu4nc5gF0a/gSYw0T24Twy1DF/7laV9iJgG2+
 F1RZOkuYrcUacLN7KRTe+KU3Iu2sM6nEp6cjll2uPQhuTMbSDMCqNY6l28UsU5W5zcdL
 TXz6/vcKvzN1fCh1E7NDS+QlbSMxqoF2KfhAB7C2tCSj/T16yYL0ZLK/47ollCkc44iI
 iWRIXKERp4ehw2FCcNqzw1Rkrx7ihzqgmZkT9HBxUJAlOEbEa/uz0CMeIU8GCP7+GIna
 Bnjw==
X-Gm-Message-State: AOAM5336ttteiloSvmM2JxCjLCswXPtHIt2WJ4aE3FPeY/38jxsQSuFb
 GFHk18/26I5mZadJpEX81mc=
X-Google-Smtp-Source: ABdhPJwpDfwq3VxDQ5PqHUh5/tPRWT5lYSDfIlEbnN3rH0SxoiirUlcrfg9jhMOb+eHRznUbsJQX/A==
X-Received: by 2002:a17:906:c7cc:: with SMTP id
 dc12mr19635108ejb.263.1590417002325; 
 Mon, 25 May 2020 07:30:02 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dfa:6900:4b6:3b49:50f6:6c03])
 by smtp.gmail.com with ESMTPSA id f10sm16642978edt.69.2020.05.25.07.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:30:01 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Mon, 25 May 2020 16:29:46 +0200
Message-Id: <20200525142946.8268-1-lukas.bulwahn@gmail.com>
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
Subject: [Linux-stm32] [PATCH SECOND RESEND] MAINTAINERS: adjust entries to
	moving CEC platform drivers
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
 
applies cleanly on next-20200417, next-20200505 and still on next-20200525
for this second resend.

v1 send here:
https://lore.kernel.org/lkml/20200418093630.6149-1-lukas.bulwahn@gmail.com/

v1 first resend here:
https://lore.kernel.org/lkml/20200506050744.4779-1-lukas.bulwahn@gmail.com/

 MAINTAINERS | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a442b48f24b..bf5cb149101b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2403,7 +2403,7 @@ L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/s5p-cec.txt
-F:	drivers/media/platform/s5p-cec/
+F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
 M:	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
@@ -2548,7 +2548,7 @@ L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/tegra-cec.txt
-F:	drivers/media/platform/tegra-cec/
+F:	drivers/media/cec/platform/tegra/
 
 ARM/TETON BGA MACHINE SUPPORT
 M:	"Mark F. Brown" <mark.brown314@gmail.com>
@@ -3969,7 +3969,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/cec-gpio.txt
-F:	drivers/media/platform/cec-gpio/
+F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
 M:	Arnd Bergmann <arnd@arndb.de>
@@ -11146,8 +11146,7 @@ S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
-F:	drivers/media/platform/meson/ao-cec-g12a.c
-F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/cec/platform/meson/
 
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
@@ -15212,8 +15211,7 @@ F:	drivers/mmc/host/sdricoh_cs.c
 SECO BOARDS CEC DRIVER
 M:	Ettore Chimenti <ek5.chimenti@gmail.com>
 S:	Maintained
-F:	drivers/media/platform/seco-cec/seco-cec.c
-F:	drivers/media/platform/seco-cec/seco-cec.h
+F:	drivers/media/cec/platform/seco/
 
 SECURE COMPUTING
 M:	Kees Cook <keescook@chromium.org>
@@ -16249,7 +16247,7 @@ STI CEC DRIVER
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
