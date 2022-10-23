Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1F609219
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Oct 2022 11:49:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF46C03FDA;
	Sun, 23 Oct 2022 09:49:24 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A954C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Oct 2022 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1666518558; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSXFtUMP2239U1R0Zna0E84HFug4CfOI1c/yuHZa1WY=;
 b=QOwuLGThnniJS2rm7pVt7LxJYscZhBKEE7Tv34kOWnFNg4Qiz4BxDRIvnRFQJWm4Vjeave
 jRY7bIDtV1wqowQozXM0Zt9yfBDxihcCiPy9yhGzUSrj76q0r6YVLc1XMtj/Hs3oaYI4+C
 Oqz7GOeo7RU3/xKrtYb7ogh96xfqmGA=
From: Paul Cercueil <paul@crapouillou.net>
To: Lee Jones <lee@kernel.org>
Date: Sun, 23 Oct 2022 10:48:49 +0100
Message-Id: <20221023094852.8035-26-paul@crapouillou.net>
In-Reply-To: <20221023094852.8035-1-paul@crapouillou.net>
References: <20221023094852.8035-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 25/28] mfd: stmpe: Remove #ifdef guards for
	PM related functions
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

Use the new EXPORT_GPL_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros
to handle the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

V2: remove duplicated "const".

Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

 drivers/mfd/stmpe-i2c.c | 4 +---
 drivers/mfd/stmpe-spi.c | 4 +---
 drivers/mfd/stmpe.c     | 8 ++------
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index d3eedf3d607e..bf094cc9f9de 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -116,9 +116,7 @@ MODULE_DEVICE_TABLE(i2c, stmpe_i2c_id);
 static struct i2c_driver stmpe_i2c_driver = {
 	.driver = {
 		.name = "stmpe-i2c",
-#ifdef CONFIG_PM
-		.pm = &stmpe_dev_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&stmpe_dev_pm_ops),
 		.of_match_table = stmpe_of_match,
 	},
 	.probe		= stmpe_i2c_probe,
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index ad8055a0e286..e9cbf33502b3 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -135,9 +135,7 @@ static struct spi_driver stmpe_spi_driver = {
 	.driver = {
 		.name	= "stmpe-spi",
 		.of_match_table = of_match_ptr(stmpe_spi_of_match),
-#ifdef CONFIG_PM
-		.pm	= &stmpe_dev_pm_ops,
-#endif
+		.pm	= pm_sleep_ptr(&stmpe_dev_pm_ops),
 	},
 	.probe		= stmpe_spi_probe,
 	.remove		= stmpe_spi_remove,
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 0c4f74197d3e..c304d20bb988 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1495,7 +1495,6 @@ void stmpe_remove(struct stmpe *stmpe)
 	mfd_remove_devices(stmpe->dev);
 }
 
-#ifdef CONFIG_PM
 static int stmpe_suspend(struct device *dev)
 {
 	struct stmpe *stmpe = dev_get_drvdata(dev);
@@ -1516,8 +1515,5 @@ static int stmpe_resume(struct device *dev)
 	return 0;
 }
 
-const struct dev_pm_ops stmpe_dev_pm_ops = {
-	.suspend	= stmpe_suspend,
-	.resume		= stmpe_resume,
-};
-#endif
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmpe_dev_pm_ops,
+			     stmpe_suspend, stmpe_resume);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
