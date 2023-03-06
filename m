Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E806ACE79
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 20:55:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32BDEC65E73;
	Mon,  6 Mar 2023 19:55:31 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3055CC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132530; x=1709668530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rJbAmhmUdx0JelsNJpxwI+8sXh4dnVKq5IyabupyZfA=;
 b=NJUtQX/18YMafCtrqz5HacI6uCA6HqWIDZSdnPacZqb9EE5wnftf85ms
 ktj2eksGrE1NjeWKxQHceMa/vwPY1rD75EGVUEqAuks82cR3jLKRew4YO
 O1LmiJ3IZ4ujCO5v+p3mTRj6DInVfNWVoBx/2+qzSB3LNdwLW0uhA59Rv
 EHmYINKRx+1Eldqug12FmrwoOCnFSM6zBpZYwFwo1XXLcuW5nKUUTO0ar
 e2fqyw5qzz34Nix6EWF8uafPmIduoT/1cTOIRw19Q+fhJVRIL3ZUVS28K
 ZL9Dv+7mNPReBfd75gsquYMPrujsNC8bEbHaem3KdiWgt989wkS1Ym+S/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400483835"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="400483835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005549547"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="1005549547"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 11:55:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A373814F; Mon,  6 Mar 2023 21:56:06 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:40 +0200
Message-Id: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 00/16] gpio: Use string_choices.h
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

Use string_choices.h in the GPIO drivers and library.
It has been tested on x86_64 and (semi-)compile tested
over all.

Andy Shevchenko (16):
  lib/string_helpers: Add missing header files to MAINTAINERS database
  lib/string_helpers: Split out string_choices.h
  lib/string_choices: Add str_high_low() helper
  lib/string_choices: Add str_input_output() helper
  gpiolib: Utilize helpers from string_choices.h
  gpio: adnp: Utilize helpers from string_choices.h
  gpio: brcmstb: Utilize helpers from string_choices.h
  gpio: crystalcove: Utilize helpers from string_choices.h
  gpio: grgpio: Utilize helpers from string_choices.h
  gpio: mvebu: Utilize helpers from string_choices.h
  gpio: pl061: Utilize helpers from string_choices.h
  gpio: stmpe: Utilize helpers from string_choices.h
  gpio: wcove: Utilize helpers from string_choices.h
  gpio: wm831x: Utilize helpers from string_choices.h
  gpio: wm8994: Utilize helpers from string_choices.h
  gpio: xra1403: Utilize helpers from string_choices.h

 MAINTAINERS                     |  3 ++
 drivers/gpio/gpio-adnp.c        | 24 ++++----------
 drivers/gpio/gpio-brcmstb.c     |  3 +-
 drivers/gpio/gpio-crystalcove.c | 17 +++++-----
 drivers/gpio/gpio-grgpio.c      |  3 +-
 drivers/gpio/gpio-mvebu.c       | 27 +++++++---------
 drivers/gpio/gpio-pl061.c       |  4 +--
 drivers/gpio/gpio-stmpe.c       | 19 +++++------
 drivers/gpio/gpio-wcove.c       | 15 ++++-----
 drivers/gpio/gpio-wm831x.c      |  5 +--
 drivers/gpio/gpio-wm8994.c      |  6 ++--
 drivers/gpio/gpio-xra1403.c     |  5 +--
 drivers/gpio/gpiolib-sysfs.c    |  3 +-
 drivers/gpio/gpiolib.c          | 13 ++++----
 include/linux/string_choices.h  | 56 +++++++++++++++++++++++++++++++++
 include/linux/string_helpers.h  | 26 +--------------
 16 files changed, 125 insertions(+), 104 deletions(-)
 create mode 100644 include/linux/string_choices.h

-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
