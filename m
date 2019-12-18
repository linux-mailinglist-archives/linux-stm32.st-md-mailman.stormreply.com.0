Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E6125C73
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2019 09:15:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5597C36B0F;
	Thu, 19 Dec 2019 08:15:50 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BABB7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 20:49:13 +0000 (UTC)
Received: from yow-cube1.wrs.com (yow-cube1.wrs.com [128.224.56.98])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTP id xBIKn0iT000214;
 Wed, 18 Dec 2019 12:49:07 -0800 (PST)
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Wed, 18 Dec 2019 15:48:40 -0500
Message-Id: <1576702137-25905-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:15:47 +0000
Cc: Viresh Kumar <vireshk@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 01/18] mfd: stmpe-spi: Make it explicitly
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

drivers/mfd/Kconfig:config STMPE_SPI
drivers/mfd/Kconfig:    bool "STMicroelectronics STMPE SPI Interface"

The Kconfig currently controlling compilation of this code is:

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

We explicitly disallow a driver unbind, since that doesn't have a
sensible use case anyway, and it allows us to drop the ".remove"
code for non-modular drivers.

Since module_init was not in use by this code, the init ordering
remains unchanged with this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/mfd/stmpe-spi.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 7351734f7593..3f6471e7301a 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -10,7 +10,7 @@
 #include <linux/spi/spi.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of.h>
 #include <linux/types.h>
 #include "stmpe.h"
@@ -102,13 +102,6 @@ stmpe_spi_probe(struct spi_device *spi)
 	return stmpe_probe(&spi_ci, id->driver_data);
 }
 
-static int stmpe_spi_remove(struct spi_device *spi)
-{
-	struct stmpe *stmpe = spi_get_drvdata(spi);
-
-	return stmpe_remove(stmpe);
-}
-
 static const struct of_device_id stmpe_spi_of_match[] = {
 	{ .compatible = "st,stmpe610", },
 	{ .compatible = "st,stmpe801", },
@@ -118,7 +111,6 @@ static const struct of_device_id stmpe_spi_of_match[] = {
 	{ .compatible = "st,stmpe2403", },
 	{ /* sentinel */ },
 };
-MODULE_DEVICE_TABLE(of, stmpe_spi_of_match);
 
 static const struct spi_device_id stmpe_spi_id[] = {
 	{ "stmpe610", STMPE610 },
@@ -129,18 +121,17 @@ static const struct spi_device_id stmpe_spi_id[] = {
 	{ "stmpe2403", STMPE2403 },
 	{ }
 };
-MODULE_DEVICE_TABLE(spi, stmpe_id);
 
 static struct spi_driver stmpe_spi_driver = {
 	.driver = {
 		.name	= "stmpe-spi",
 		.of_match_table = of_match_ptr(stmpe_spi_of_match),
+		.suppress_bind_attrs = true,
 #ifdef CONFIG_PM
 		.pm	= &stmpe_dev_pm_ops,
 #endif
 	},
 	.probe		= stmpe_spi_probe,
-	.remove		= stmpe_spi_remove,
 	.id_table	= stmpe_spi_id,
 };
 
@@ -149,13 +140,3 @@ static int __init stmpe_init(void)
 	return spi_register_driver(&stmpe_spi_driver);
 }
 subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	spi_unregister_driver(&stmpe_spi_driver);
-}
-module_exit(stmpe_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("STMPE MFD SPI Interface Driver");
-MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
