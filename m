Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13F125C72
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2019 09:15:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A71A7C36B0C;
	Thu, 19 Dec 2019 08:15:50 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8E36C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 20:49:13 +0000 (UTC)
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0iU000214;
 Wed, 18 Dec 2019 12:49:08 -0800 (PST)
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed, 18 Dec 2019 15:48:41 -0500
Message-Id: <1576702137-25905-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:15:47 +0000
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH 02/18] mfd: stmpe-i2c: Make it explicitly
	non-modular
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

The Kconfig currently controlling compilation of this code is:

drivers/mfd/Kconfig:config STMPE_I2C
drivers/mfd/Kconfig:    bool "STMicroelectronics STMPE I2C Interface"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.  In
doing so stmpe_remove itself becomes orphaned, so it gets removed too.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.  As this makes stmpe_remove an orphaned
function, it gets removed too.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/stmpe-i2c.c | 23 ++---------------------
 drivers/mfd/stmpe.c     | 14 --------------
 drivers/mfd/stmpe.h     |  1 -
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 61aa020199f5..9d3e9443225a 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -12,7 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/types.h>
 #include <linux/of_device.h>
 #include "stmpe.h"
@@ -64,7 +64,6 @@ static const struct of_device_id stmpe_of_match[] = {
 	{ .compatible = "st,stmpe2403", .data = (void *)STMPE2403, },
 	{},
 };
-MODULE_DEVICE_TABLE(of, stmpe_of_match);
 
 static int
 stmpe_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
@@ -91,13 +90,6 @@ stmpe_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	return stmpe_probe(&i2c_ci, partnum);
 }
 
-static int stmpe_i2c_remove(struct i2c_client *i2c)
-{
-	struct stmpe *stmpe = dev_get_drvdata(&i2c->dev);
-
-	return stmpe_remove(stmpe);
-}
-
 static const struct i2c_device_id stmpe_i2c_id[] = {
 	{ "stmpe610", STMPE610 },
 	{ "stmpe801", STMPE801 },
@@ -109,7 +101,6 @@ static const struct i2c_device_id stmpe_i2c_id[] = {
 	{ "stmpe2403", STMPE2403 },
 	{ }
 };
-MODULE_DEVICE_TABLE(i2c, stmpe_id);
 
 static struct i2c_driver stmpe_i2c_driver = {
 	.driver = {
@@ -118,9 +109,9 @@ static struct i2c_driver stmpe_i2c_driver = {
 		.pm = &stmpe_dev_pm_ops,
 #endif
 		.of_match_table = stmpe_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= stmpe_i2c_probe,
-	.remove		= stmpe_i2c_remove,
 	.id_table	= stmpe_i2c_id,
 };
 
@@ -129,13 +120,3 @@ static int __init stmpe_init(void)
 	return i2c_add_driver(&stmpe_i2c_driver);
 }
 subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	i2c_del_driver(&stmpe_i2c_driver);
-}
-module_exit(stmpe_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
-MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 1aee3b3253fc..611f1d8243b9 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1492,20 +1492,6 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	return ret;
 }
 
-int stmpe_remove(struct stmpe *stmpe)
-{
-	if (!IS_ERR(stmpe->vio))
-		regulator_disable(stmpe->vio);
-	if (!IS_ERR(stmpe->vcc))
-		regulator_disable(stmpe->vcc);
-
-	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
-
-	mfd_remove_devices(stmpe->dev);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 static int stmpe_suspend(struct device *dev)
 {
diff --git a/drivers/mfd/stmpe.h b/drivers/mfd/stmpe.h
index 83491e99ba3c..ba9006b7f8f4 100644
--- a/drivers/mfd/stmpe.h
+++ b/drivers/mfd/stmpe.h
@@ -98,7 +98,6 @@ struct stmpe_client_info {
 };
 
 int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum);
-int stmpe_remove(struct stmpe *stmpe);
 
 #define STMPE_ICR_LSB_HIGH	(1 << 2)
 #define STMPE_ICR_LSB_EDGE	(1 << 1)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
