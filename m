Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A384958BB59
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Aug 2022 16:53:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 518BAC04000;
	Sun,  7 Aug 2022 14:53:11 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93B95C03FC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Aug 2022 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1659883988; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Di4PoDiPjRu7ZS4lHptDC2et/AkSYRZJ8WxHWXVd9fk=;
 b=M8PDLV+k4PAPs6D79cw8p2rh6Vx4VD2ELyDUhaqSKSWca15BHcIDzzjQ1MaYgg+XEYXWrV
 iWiVNeRH5E/4zQpjYAJHry4nbXXrkSxuxSKyTLBuDFe6gfzNRjhYRFAgHcIsgOevtlvSX2
 hVwdvb9hWNozN9FFcBs+xLCexp2B12g=
From: Paul Cercueil <paul@crapouillou.net>
To: Lee Jones <lee.jones@linaro.org>
Date: Sun,  7 Aug 2022 16:52:44 +0200
Message-Id: <20220807145247.46107-26-paul@crapouillou.net>
In-Reply-To: <20220807145247.46107-1-paul@crapouillou.net>
References: <20220807145247.46107-1-paul@crapouillou.net>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 25/28] mfd: stmfx: Remove #ifdef guards for PM
	related functions
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

The advantage is then that these functions are now always compiled
independently of any Kconfig option, and thanks to that bugs and
regressions are easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/mfd/stmfx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

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
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
