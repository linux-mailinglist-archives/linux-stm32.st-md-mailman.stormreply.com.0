Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 135FF6AFF4F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCDF7C6B461;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B199AC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132544; x=1709668544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nB1Cjf4Z6soJzkyRCy4W4jPVtCrh+QSwebJoZzzTHU=;
 b=eI75FyZNVbak9cQ6zs7s9WrFaGmZTbI8tKhbXueSOLByt3krN2qK50lN
 GeHcxzHiwIXOdxJXIek0GuSqHQ02ysqAN/dn4hgVxieJzOrEJVEj5bmbK
 JN7G1CGuDrtc7tQ/QNLNnuvxSw5tV6iV68ArGrCZCE8XsSrnfJswhIfnJ
 LK259Mse7Z+biPNI+863QzyAsttU/FSsqOxc4KXrgAZWeixa5f+IW+Reu
 nCN5w6FHThHkRxyxad+F/Glp52a6vU74k4o98wJfEyAEDJZN1cMECl/bW
 2W4o+J1hhJFqL5FRZ3yQ/AnCT9xDvUhHI+UVy1/xGtIXPTX3xPkTa01TN Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333129018"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="333129018"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745185197"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="745185197"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 11:55:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D96A063E; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:54 +0200
Message-Id: <20230306195556.55475-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
References: <20230306195556.55475-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Mar 2023 07:00:24 +0000
Cc: Andy Shevchenko <andy@kernel.org>, Semi Malinen <semi.malinen@ge.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Nandor Han <nandor.han@ge.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [Linux-stm32] [PATCH v1 14/16] gpio: wm831x: Utilize helpers from
	string_choices.h
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

There are a few helpers available to convert a boolean variable
to the dedicated string literals depending on the application.
Use them in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-wm831x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 7eaf8a28638c..5456485ce801 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/core.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
+#include <linux/string_choices.h>
 
 #include <linux/mfd/wm831x/core.h>
 #include <linux/mfd/wm831x/pdata.h>
@@ -229,8 +230,8 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		seq_printf(s, " %s %s %s %s%s\n"
 			   "                                  %s%s (0x%4x)\n",
-			   reg & WM831X_GPN_DIR ? "in" : "out",
-			   wm831x_gpio_get(chip, i) ? "high" : "low",
+			   str_in_out(reg & WM831X_GPN_DIR),
+			   str_high_low(wm831x_gpio_get(chip, i)),
 			   pull,
 			   powerdomain,
 			   reg & WM831X_GPN_POL ? "" : " inverted",
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
