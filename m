Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDA9688DE
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 15:32:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0805EC7801F;
	Mon,  2 Sep 2024 13:32:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6903C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725283928; x=1756819928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOdIiE5tZOppfGkiAtqdeQ7Xsi+hc/W2Ft00cv2eZik=;
 b=BSepRcJ77LfvmG8Jp/bVjTmcKeM4k2XImWIBlQvLktXMqK6TMSKtANeM
 d2lJt6RPQ/m7APQ67TKUUOjQfnTLoBY8sacqgYS9zVW3+SkcmwEBmM383
 wlfaP54V3xs2Y3h+Wy+c1VdSvg4XbpaQ2DFvLWiR1TKgAcyZOg2WncjVK
 dRHHIlTfXIOr49D8BnpPxWGlcvE9aCHPkgaVoCmdD11Gj8Y/Xqvo+OpSt
 Mc3de52KpemHOemOIAVeyYxOShRiWV23zulNRtx4LGxqstMi1cYjg+mIO
 6IBrUw4EV3YPncsI5gq5lTPRNaEPqRXsV4NjhoEceYHHzaNCarxP6eEoG g==;
X-CSE-ConnectionGUID: ++yeq9YXSLKrHLXMhL6Qjw==
X-CSE-MsgGUID: EDl8LBkzSg+9yf4WiFo2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022574"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="35022574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: UdwefpfjQBKyswgyCVLfIA==
X-CSE-MsgGUID: VvLoTozcSb+WvrB1eDpLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65114780"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3FDD8233; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Sep 2024 16:30:40 +0300
Message-ID: <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH v1 1/5] gpio: stmpe: Fix IRQ related error
	messages
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

First of all, remove duplicate message that platform_get_irq()
does already print. Second, correct the error message when unable
to register a handler, which is broken in two ways:
1) the misleading 'get' vs. 'register';
2) missing '\n' at the end.

(Yes, for the curious ones, the dev_*() cases do not require '\n'
and issue it automatically, but it's better to have them explicit)

Fix all this here.

Fixes: 1882e769362b ("gpio: stmpe: Simplify with dev_err_probe()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index abd42a975b09..4e171f9075bf 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -464,6 +464,7 @@ static void stmpe_gpio_disable(void *stmpe)
 
 static int stmpe_gpio_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmpe_gpio *stmpe_gpio;
@@ -493,12 +494,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	of_property_read_u32(np, "st,norequest-mask",
 			&stmpe_gpio->norequest_mask);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		dev_info(&pdev->dev,
-			"device configured in no-irq mode: "
-			"irqs are not available\n");
-
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
 		return ret;
@@ -507,6 +502,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
@@ -514,8 +510,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 				stmpe_gpio_irq, IRQF_ONESHOT,
 				"stmpe-gpio", stmpe_gpio);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "unable to get irq");
+			return dev_err_probe(dev, ret, "unable to register IRQ handler\n");
 
 		girq = &stmpe_gpio->chip.irq;
 		gpio_irq_chip_set_chip(girq, &stmpe_gpio_irq_chip);
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
