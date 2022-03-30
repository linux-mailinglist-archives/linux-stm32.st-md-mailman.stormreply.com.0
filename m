Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A374EC724
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 16:50:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 696D2C628A8;
	Wed, 30 Mar 2022 14:50:24 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CB5CC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651822; x=1680187822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zrZUa4zHyRrv/b7a2GsU0Ksg+xmTjt4NnPen2PLSXh8=;
 b=k3/UqaOoQeqVRo4XT3xGqZv+nuvmYGcyi3zCOxaKuV/vrfnIl4weIiJJ
 aRRCc6rM8O9Lax7iwSpr6BwG74K76CTyCXESN2PxncvfP8qzFs5WuV8/R
 2EA95ami0tfWcmPSjbLK/BY70O16oGwe4RwVLFp4oEsSbraXSsZ/NPyPS
 dBOdO8WJzhuAeoWeXUHlfEPQsn3IlSg2iSHBpranBfN7ymeyoofAMHRYI
 BJo002iLXoL+HfVRWTBzG3hKQYBNX351Ro4GdoqreEAbPkhRe03UTOWMT
 GeJbfTdkMC+fIQzZtfQY0Fcsr0rpt8fRpb2RuhKHBhoWyEKsxiL29WEOu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="284469635"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="284469635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="618556020"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 07:50:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 18849144; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 30 Mar 2022 17:50:17 +0300
Message-Id: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v3 00/13] gpiolib: Two new helpers and way
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
to use fwnode and partially fwnode APIs.

Bart, Linus, I can take it thru my tree with an immutable branch if
it's the way you prefer, otherwise please suggest on how to proceed.

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
 drivers/pinctrl/samsung/pinctrl-samsung.c   |  30 ++---
 drivers/pinctrl/samsung/pinctrl-samsung.h   |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c       |  80 +++++------
 include/linux/gpio/driver.h                 |  18 ++-
 10 files changed, 191 insertions(+), 240 deletions(-)


base-commit: a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
