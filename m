Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34674EEB6C
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Apr 2022 12:35:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92167C5EC76;
	Fri,  1 Apr 2022 10:35:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CEAAC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Apr 2022 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809353; x=1680345353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nXk4zlyXR8B57i9BaB9FWZP2fV36YlgrhivlcqXLjKY=;
 b=Y1pGTzWNTEpUUiW0MNcJBsM/Hm/Hejmww2rrtEfzwW5C0yLmYwTVEtWO
 V0rBICtyixf0rMsYhae8GIt/U5iCQVBuRDkf6VnPwGbarPq1oBk8jkj56
 4syL8AxYp4ebCpjm7/nv0Xb5kkXUb0lvDEivwgm+NnLTncG5Ula+jP+3K
 wXS8COkd7QCwJRhyUd+QRIq6e9mlCT/b0NvL0L3mNKHe4MQ6FulVivXlG
 JpZMh4tkQxkQylOnzqAJ16RKjzxiq7Z3CLs23s6NBnr7ym1yd5zWmwmyt
 wDy9DAQ3/J2Mluqgep8FJcTYLasMni9p+mLMCckt6lq2dB0LUyC1JLqKS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260281424"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="260281424"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="843133139"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2022 03:35:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 92A23179; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri,  1 Apr 2022 13:35:51 +0300
Message-Id: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCH v4 00/13] gpiolib: Two new helpers and way
	toward fwnode
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

This is a spin-off of the previous work of switching GPIO library
to use fwnode instead of of_node. Here we introduce a couple of
a new macro helpers, which allows to switch some of the drivers
to use fwnode and partially fwnode APIs. As a result of this cleanup
a few drivers switched to use GPIO fwnode instead of of_node.

Bart, Linus, I can take it thru my tree with an immutable branch if
it's the way you prefer, otherwise please suggest on how to proceed.

Changelog v4:
- fixed compilation of the Samsung pin control drivers (LKP)
- explained in the commit message why namespacing is good for meson defs
- added tag to one of meson patches (Neil)

Changelog v3:
- moved count initialization to the definition in patch 2 (Geert)
- replaced of_args by args, used %pfwP in patch 7 (Geert)
- fixed kernel doc warning in patch 7
- added tags to patches 1, 2, 6, and 7 (Geert)
- added tag to patch 4 (Fabien)
- renamed MREG to MESON_REG in patch 9 (Neil)
- added tag to patch 10 (Neil)
- used --base for cover-letter

Changelog v2:
- properly based, so kbuild bot may test it (LKP)
- fixed typo in the macro (Geert)
- split to two macro helpers and rename the gpiochip_count()
- tagged one of stm32 and one of meson patches (Fabien, Neil)
- unified previously standalone armada patch
- due to above rewrote the armada patch from v1 completely (Sergey)
- added a lot of a new patches
- compile tested all of them on x86

Andy Shevchenko (13):
  gpiolib: Introduce for_each_gpiochip_node() loop helper
  gpiolib: Introduce gpiochip_node_count() helper
  pinctrl: stm32: Replace custom code by gpiochip_node_count() call
  pinctrl: stm32: Switch to use for_each_gpiochip_node() helper
  pinctrl: samsung: Switch to use for_each_gpiochip_node() helper
  pinctrl: renesas: rza1: Replace custom code by gpiochip_node_count()
    call
  pinctrl: renesas: rza1: Switch to use for_each_gpiochip_node() helper
  pinctrl: npcm7xx: Switch to use for_each_gpiochip_node() helper
  pinctrl: meson: Rename REG_* to MESON_REG_*
  pinctrl: meson: Enable COMPILE_TEST
  pinctrl: meson: Replace custom code by gpiochip_node_count() call
  pinctrl: armada-37xx: Switch to use fwnode instead of of_node
  pinctrl: armada-37xx: Reuse GPIO fwnode in
    armada_37xx_irqchip_register()

 drivers/pinctrl/meson/Kconfig               |   2 +-
 drivers/pinctrl/meson/pinctrl-meson.c       |  52 ++++---
 drivers/pinctrl/meson/pinctrl-meson.h       |  24 ++--
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c |  34 ++---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c   | 142 +++++++++-----------
 drivers/pinctrl/renesas/pinctrl-rza1.c      |  47 ++-----
 drivers/pinctrl/samsung/pinctrl-exynos.c    |   8 +-
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c   |   2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c   |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c   |  30 ++---
 drivers/pinctrl/samsung/pinctrl-samsung.h   |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  80 +++++------
 include/linux/gpio/driver.h                 |  18 ++-
 13 files changed, 198 insertions(+), 247 deletions(-)


base-commit: e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
