Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1AB1349D
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 08:05:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAB34C36B16;
	Mon, 28 Jul 2025 06:05:58 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B4EFC36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 06:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753682756; x=1785218756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
 b=RZmZPmZHXZAHIGjgQyAqDvPhzbF7yyln1Tgf7NKihy9MWtl2qdVbjyM8
 5GVAXvcVWKZdvWQWdN96nXQBtK+pVONjEYfp0fvbcyVU+LL1p2dQ1S/Z9
 YMyEqKN49OTdE0q4Zl4j/FNVlZCokEYSE0OcZxrlpsSz7Ux5RrP5dmfCV
 2EUR+8THO0p+Acbn2qrIJZP1INBEXUSIfkEZsZAW7+3aWw/U6KtdaoXwU
 UaZcq2nGrtYSK4x1iKJ5jF+78SwaDvEX3aGDkyJXIKky2vvivR4zDbBYG
 VYurUjSNnY2ljCt9gpTSzDqXq9Gw6gRljPugCXlI7yvToYFBQcxSRkrfJ g==;
X-CSE-ConnectionGUID: LuVdxQooQWywzzukvPuoDg==
X-CSE-MsgGUID: tSUhUxs7SjGmYTS1cQrlpA==
X-IronPort-AV: E=Sophos;i="6.16,339,1744063200"; d="scan'208";a="45440332"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Jul 2025 08:05:51 +0200
X-CheckPoint: {68871340-A-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: 154A4088696352CA20E2E8C7001DE7E1_2
X-Control-Analysis: str=0001.0A002106.6887134A.008B, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A938E16568B; Mon, 28 Jul 2025 08:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753682747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
 b=oh9g3DYI0g2Ihh111neIBiKYeOBcsinYlR9XMSILJwIObcOmA5eB3dYyvC8wwLQxrDbq5q
 TDue0UOUfjc6qvBGVcpfGQgRoOaUUuApM6qp8u3XV0kbAO2WWKa/Ojo1jsb5kvPSaGyTZ3
 FqEyJ8MZSkrwvEnl8RTD+2BwN/dKWwhzXWOKWJ5TNOi/onxB89OGjv/hZg0yeZtHolvYXD
 Rm3GkSeNmxHLodTJx4tZ9b9IJvZ2tLmKuSV7Y+bUeJMOUTYdByPimye8d5m/OL0u9VR9sc
 7jW5b8QXdC8A2WhFUr0LOs9IlmSmltBoUsvoUGHO6adfBJxN35gDfR9m6C3v0g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 28 Jul 2025 08:05:43 +0200
Message-ID: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/1] gpio: stmpe: Allow to compile as a
	module
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

Add the necessary boilerplate to also make this driver modular.
Keep the subsys_initcall to not change registration order for built-in.
Also add OF match table for module autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Do not touch subsys_initcall
* Add module_exit instead
* Adjust commit message

 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 500d839f65ee8..0621832d045fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1559,7 +1559,7 @@ config GPIO_SL28CPLD
 	  called gpio-sl28cpld.
 
 config GPIO_STMPE
-	bool "STMPE GPIOs"
+	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 0a270156e0bea..97d6c4f98eaf7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,10 +534,16 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio);
 }
 
+static const struct of_device_id stmpe_gpio_of_matches[] = {
+	{ .compatible = "st,stmpe-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
+
 static struct platform_driver stmpe_gpio_driver = {
 	.driver = {
-		.suppress_bind_attrs	= true,
-		.name			= "stmpe-gpio",
+		.name = "stmpe-gpio",
+		.of_match_table = stmpe_gpio_of_matches,
 	},
 	.probe		= stmpe_gpio_probe,
 };
@@ -547,3 +553,13 @@ static int __init stmpe_gpio_init(void)
 	return platform_driver_register(&stmpe_gpio_driver);
 }
 subsys_initcall(stmpe_gpio_init);
+
+static void __exit stmpe_gpio_exit(void)
+{
+	platform_driver_unregister(&stmpe_gpio_driver);
+}
+module_exit(stmpe_gpio_exit);
+
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
