Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A003B58CCD7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Aug 2022 19:41:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40B6DC04003;
	Mon,  8 Aug 2022 17:41:49 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ED96C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1659980507; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0TOf7NCTCNZLEJUd0n3YWp93p2MEOQ2XhRWmHJulpk=;
 b=rMgv++6XK2xdJknO31ryPaoawJDkx77mVzmGwzj1bCiQbqPpOKQuY7Snak2IVPYIeIcZTX
 J/6sWTX0o9bKJSo7eIPrlIm9B6LAPwIKxrng0Kwg4o6n0IuTTfMoytD0WULKBOEuD9zKN6
 h2ctYA8WDLGslUmH4V0KrHt1I7BVoQ0=
From: Paul Cercueil <paul@crapouillou.net>
To: Lee Jones <lee.jones@linaro.org>
Date: Mon,  8 Aug 2022 19:41:03 +0200
Message-Id: <20220808174107.38676-27-paul@crapouillou.net>
In-Reply-To: <20220808174107.38676-1-paul@crapouillou.net>
References: <20220808174107.38676-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 26/30] mfd: stmfx: Remove #ifdef guards for
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

Use the new DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros
to handle the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

V2: remove CONFIG_PM wrapper around fields in private struct

Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

 drivers/mfd/stmfx.c       | 6 ++----
 include/linux/mfd/stmfx.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 122f96094410..94af27346669 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -476,7 +476,6 @@ static int stmfx_remove(struct i2c_client *client)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stmfx_suspend(struct device *dev)
 {
 	struct stmfx *stmfx = dev_get_drvdata(dev);
@@ -542,9 +541,8 @@ static int stmfx_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(stmfx_dev_pm_ops, stmfx_suspend, stmfx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stmfx_dev_pm_ops, stmfx_suspend, stmfx_resume);
 
 static const struct of_device_id stmfx_of_match[] = {
 	{ .compatible = "st,stmfx-0300", },
@@ -556,7 +554,7 @@ static struct i2c_driver stmfx_driver = {
 	.driver = {
 		.name = "stmfx-core",
 		.of_match_table = stmfx_of_match,
-		.pm = &stmfx_dev_pm_ops,
+		.pm = pm_sleep_ptr(&stmfx_dev_pm_ops),
 	},
 	.probe = stmfx_probe,
 	.remove = stmfx_remove,
diff --git a/include/linux/mfd/stmfx.h b/include/linux/mfd/stmfx.h
index 744dce63946e..967a2e486800 100644
--- a/include/linux/mfd/stmfx.h
+++ b/include/linux/mfd/stmfx.h
@@ -113,10 +113,8 @@ struct stmfx {
 	struct irq_domain *irq_domain;
 	struct mutex lock; /* IRQ bus lock */
 	u8 irq_src;
-#ifdef CONFIG_PM
 	u8 bkp_sysctrl;
 	u8 bkp_irqoutpin;
-#endif
 };
 
 int stmfx_function_enable(struct stmfx *stmfx, u32 func);
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
