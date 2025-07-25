Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A4B11817
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 07:52:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62D4EC30883;
	Fri, 25 Jul 2025 05:52:34 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17018C3087B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 05:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753422753; x=1784958753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
 b=JrOSlwjmXAldf6eDIWcBu7geCy043y5uQJQb7HW53EvaotgZyAmvRegq
 VHfLb1X35JVjEy4dWfIdRxfbpN8n/Oh9oWPAWF447uUW94HQiAQQCJaJD
 LVCAcOVJX5U4+tMrDycZwTaUgEe9uk3y4oL56apq8bWznm6k9Qa1bHlDd
 lmY3znD6INvGKzY0p+TvoBvQnaR1AZRPdCe2QUmcBA4o6OmoIlgEs2njL
 tFkvb7oUN5XxBkSxlpCt6BeqSfoDAHqsFcL64At6rMx/YtER9QkvwxGMu
 Y1UC+xujFbseCCGR3RNfMPjdy7cMVjXS6a6oNhsxLwy52+AE4fxac9ODi w==;
X-CSE-ConnectionGUID: CnGdkg3lRoyewLU0Ay8xYw==
X-CSE-MsgGUID: 1gFfGMw+QYmLb3/VB/qSIw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45412473"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 07:52:29 +0200
X-CheckPoint: {68831B9C-2D-4FC15ADB-CD71293B}
X-MAIL-CPID: 1D1F9231A91F7DBFBC957FFF256F8A75_0
X-Control-Analysis: str=0001.0A002103.68831BC0.0008, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5047C1682BB; Fri, 25 Jul 2025 07:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753422744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
 b=oyzKEkx25B9P597urr/TQ4CGH0UThu7GbikqokVj9ixGHld5Sl+b1OgdtBB3sibD42o1EQ
 jTcdrSyJJEtMNTgoL3/DXrMVMjZ8eU2v3rq8RomCd/bCTeXs4wrJFD01qcQ5sDdKNF3Uql
 870iPX/fQoStQFzarajnlqh3tt4kxhhAsuwfekVfT00Tfq9gGrY6jMp/ACw/QB6rbmP9Gj
 9wawEB+ZJQiFh8z1inVKvzSaj+c59NVH2CENc6SsNriYhoVEo3Li2j3agO1ovmRGpUInI7
 oXr6/5ynsVBeoLQ9tdrF/11SFSYRa2AAlDRqzQb9sMl2PSIYkMCGY/VQ7m/+Tg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 07:52:20 +0200
Message-ID: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/1] gpio: stmpe: Allow to compile as a module
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
This follows commit a2b8191ab695a ("pwm: stmpe: Allow to compile as a
module") which does the same for pwm. Also add OF match table for module
autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

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
index 0a270156e0bea..db9f4cd1e8615 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,16 +534,19 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
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
-	.probe		= stmpe_gpio_probe,
 };
+module_platform_driver_probe(stmpe_gpio_driver, stmpe_gpio_probe);
 
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
