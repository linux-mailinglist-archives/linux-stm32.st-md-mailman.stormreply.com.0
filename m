Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8B6AFF4B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Mar 2023 08:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 841CDC6B455;
	Wed,  8 Mar 2023 07:00:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23E8DC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678132543; x=1709668543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=89ohLboU1a/2JdE0Dw4HbVrvYKShu90dTe4vbBA2XKY=;
 b=Lsn9+Xn4xV1kmZQlkUM9iG47YxhDE39FwnE7QYP3C+Vbvs2uq9DrEsOG
 kqrCdO3/9Q1V5pA3D3QKdrY5Ya2lqar0fA99JHa9VglPj8xtw4swlRobh
 YND6Uo68hYZ4vQ7h8GeSIO081ZbryBHikBxxvB5Qvx8z12jEScCTVg92S
 BUcrVegx/2wIBapRd1ebqtg32yDHD8F6kl8WcuEpGhUHep9lp5EzOIcex
 tp7Uj+etwhxRQ+L32lznooSc8bzF57z48hD1SO0qcq+fQAMPaI/facbQJ
 74qRXTmkkS/SeZuFbL4vpwshoYFngPtSouwAn1haUsTKlx4Jr2aDifQtO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333128962"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="333128962"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 11:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745185190"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="745185190"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 11:55:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A15835A7; Mon,  6 Mar 2023 21:56:12 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Schspa Shi <schspa@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com
Date: Mon,  6 Mar 2023 21:55:49 +0200
Message-Id: <20230306195556.55475-10-andriy.shevchenko@linux.intel.com>
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
Subject: [Linux-stm32] [PATCH v1 09/16] gpio: grgpio: Utilize helpers from
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
 drivers/gpio/gpio-grgpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index bea0e32c195d..ccd942109f6a 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -30,6 +30,7 @@
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/bitops.h>
+#include <linux/string_choices.h>
 
 #define GRGPIO_MAX_NGPIO 32
 
@@ -426,7 +427,7 @@ static int grgpio_probe(struct platform_device *ofdev)
 	}
 
 	dev_info(&ofdev->dev, "regs=0x%p, base=%d, ngpio=%d, irqs=%s\n",
-		 priv->regs, gc->base, gc->ngpio, priv->domain ? "on" : "off");
+		 priv->regs, gc->base, gc->ngpio, str_on_off(priv->domain));
 
 	return 0;
 }
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
