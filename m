Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85E3D4488
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jul 2021 05:44:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECBCDC597AB;
	Sat, 24 Jul 2021 03:44:18 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 985FFC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jul 2021 03:44:16 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so11673503pjm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KzYdVSq+hzPkiy2rWNyAMfR6nXUf8PV4FMF6QSsanc0=;
 b=HwRIt5xmgKGu4CMhFNGPNx/cq8ZtKNiCaEeFzg23kvA2et/soaIIFDQOGRSFcLN3tf
 I5qJnEI08e203s/RTrO1hs4/7ZvfQz557bPfXnnSZvdUfNjD10vheWvfO3YHn7PK10hy
 854pE0hdmYJiAgNc22kAQGTphdhXNF0GgefDxV7twVAQ3+6VVXElg+d9hH0NAfBBOaBu
 Gz+nIijVPa1o5noz8726Y9K8g2T3zyPI28L+g5Rm3fswmQ4V4jP09I9cK2hqD/Br9o6C
 chz/uvb7Jrz5vWLE2B5vmMVpsqpJmRkXOPkqAi9EbkeM22CgdPczwAQ1whVECQxTIi9X
 D28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KzYdVSq+hzPkiy2rWNyAMfR6nXUf8PV4FMF6QSsanc0=;
 b=eb8/oERwH/2dqn25GeEKSa3T5SARjIIxG9vhAsVh6ktXmga1045WSOqSuaxPvYS7xa
 AZWHa/h+j1bF8F6bziymDSkSbuR0HOslzLRYq0ynVnIzH75vIe+L9xFoD2dHFjZAJ88k
 f7rKl3vc4MbaL6anGfgdoPfpmt5eaDyVaqGJv/0HjUKAL2KeOQ07wY0kKR8UU+OGAwDW
 rZLq8a8eUAe8EfLJw0TGe2We7ag0GGwCousByxOhyLEgBF7/I3Zsy2sVV4pQmY1h/5nC
 D9uM5WaeWk9Vxzu+ljy43ua60l6AIUcj3ikAhaUZT9mMU0tN3Yyx1htZF3rmf6XtL9SJ
 F/Lg==
X-Gm-Message-State: AOAM531l9wQtOnMdI309aXUvMBxADFbWZCuqjRKyQ8CBaOcTgcH3E7T9
 4+615ALaeWkly4bRuhmRf3Y=
X-Google-Smtp-Source: ABdhPJzC1Psa2hNrHlE+tkGyXCvT4y61A7xVh6MTTBPBveXgeXdVcEj/D8j1GbgPAqFrEqzYq9ll/w==
X-Received: by 2002:a17:902:c60b:b029:12a:e53f:9f44 with SMTP id
 r11-20020a170902c60bb029012ae53f9f44mr6562714plr.28.1627098253167; 
 Fri, 23 Jul 2021 20:44:13 -0700 (PDT)
Received: from localhost.localdomain ([23.228.102.68])
 by smtp.gmail.com with ESMTPSA id c17sm35118733pfv.68.2021.07.23.20.44.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 20:44:12 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, noralf@tronnes.org
Date: Sat, 24 Jul 2021 11:44:00 +0800
Message-Id: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/3] Add ilitek ili9341 panel driver
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

From: Dillon Min <dillon.minfei@gmail.com>

Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
but, the panel driver didn't get accepted from mainline. it's time to submit
patch fot it.

This driver can support two different interface by different dts bindings:
- spi+dpi, use spi to configure register, dpi for graphic data.
  st,sf-tc240t-9370-t
- only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
  adafruit,yx240qv29

I was submited the first patch last year, you can find it at [1].
this patch has one major difference from that one, which is replace the low
level communication way, from spi_sync() to mipi_dbi_{command,
command_stackbuf}() interface, referred from Linus's patch [2].

both the two dpi/dbi interface was tested on stm32f429-disco board, if anyone
want to verify this patch, you need apply the clk patch for this board first,
you can get it from [3].

[1] "drm/panel: Add ilitek ili9341 panel driver"
https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.minfei@gmail.com/

[2] "drm/panel: s6e63m0: Switch to DBI abstraction for SPI"
https://lore.kernel.org/dri-devel/20210611214243.669892-1-linus.walleij@linaro.org/

[3]
https://lore.kernel.org/lkml/1590378348-8115-6-git-send-email-dillon.minfei@gmail.com/

v4:
- fix m68k-allmodconfig build error which reported by lkp, thanks.
- add Copyright 2018 David Lechner <david@lechnology.com>.
v3 link:
https://lore.kernel.org/lkml/1627013203-23099-1-git-send-email-dillon.minfei@gmail.com/

v3:
- add Fixes tags.
- collect reviewed-by tags from linus and jagan.
- replace DRM_ERROR() with dev_err() or drm_err().
- remove kernel-doc markers from struct ili9341_config{}.
- reorder include headers.
- remove the struct device *dev from struct ili9341{}.
- restructure the ili9341_probe() function, add two ili9341_{dbi,dpi)_probe()
  to make it more readable according to jagan's suggestion, thanks.

for the full drm driver exist in drm/panel need Sam and Laurent's feedback.
so, not cover this part at this time, will be update later.

v2 link:
https://lore.kernel.org/lkml/1626853288-31223-1-git-send-email-dillon.minfei@gmail.com/

v2:
- replace vcc regulator to bulk regulators in driver, from linus suggestion.
- fix dtbs_check warnings on ili9341 dts binding check.
- add bulk regulation node in ilitek,ili9341.yaml.
v1 link:
https://lore.kernel.org/lkml/1626430843-23823-1-git-send-email-dillon.minfei@gmail.com/

Dillon Min (3):
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding
  drm/panel: Add ilitek ili9341 panel driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |  78 ++
 arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 792 +++++++++++++++++++++
 5 files changed, 884 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
