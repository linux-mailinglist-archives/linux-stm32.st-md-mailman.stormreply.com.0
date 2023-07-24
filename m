Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A60760023
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 21:57:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64A35C6B442;
	Mon, 24 Jul 2023 19:57:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0BD5C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 19:57:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7760061354;
 Mon, 24 Jul 2023 19:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05336C433C7;
 Mon, 24 Jul 2023 19:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690228631;
 bh=4/mO24Ikk4CHlDznLLlA+DvTvlfb2sd89TKv9AA3wYI=;
 h=From:To:Cc:Subject:Date:From;
 b=AUoQC2XvXKgQjD1P9rrEu/Kn5JiiXB9Y3c14lNwXwW8M78id+LM2WIXSvx/0NR4kN
 rpkXzhemn2iR1aPhh3j5QtMk4YkB+BZsYSHUbcUN/dhzG3tCUzR+xJBPGTVIKqqC+r
 ySr9TOHnyoViYDraWSOqRfjzyq3STt68AXlSa/tsZHOa4omxhxjV/EPfXYnpMeOO6+
 Dcza/NTZjSvHS0tLJHix2T6ZCkHi/3NCPCv0FoCii98M8APB8a8VB+aPtzvb8gAIjv
 vCzrcNIkUC8Le5AjF4JTIiIwRD2+163T6KL8/D79/DqObvVQNT/3zSbc/LF+5pbFGf
 mASLsQvohf3pw==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 24 Jul 2023 21:56:49 +0200
Message-Id: <20230724195704.2432382-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: fix incorrect optional
	pointers
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

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing without CONFIG_OF shows that the of_match_ptr() macro
was used incorrectly here:

drivers/remoteproc/stm32_rproc.c:662:34: warning: unused variable 'stm32_rproc_match' [-Wunused-const-variable]

As in almost every driver, the solution is simply to remove the
use of this macro. The same thing happened with the deprecated
SIMPLE_DEV_PM_OPS(), but the corresponding warning was already shut
up with __maybe_unused annotations, so fix those as well by using the
correct DEFINE_SIMPLE_DEV_PM_OPS() macros and removing the extraneous
__maybe_unused modifiers. For completeness, also add a pm_ptr() to let
the PM ops be eliminated completely when CONFIG_PM is turned off.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307242300.ia82qBTp-lkp@intel.com
Fixes: 03bd158e1535e ("remoteproc: stm32: use correct format strings on 64-bit")
Fixes: 410119ee29b6c ("remoteproc: stm32: wakeup the system by wdg irq")
Fixes: 13140de09cc2d ("remoteproc: stm32: add an ST stm32_rproc driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/stm32_rproc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 98234b44f0389..9d9b13530f78a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -921,7 +921,7 @@ static void stm32_rproc_remove(struct platform_device *pdev)
 	rproc_free(rproc);
 }
 
-static int __maybe_unused stm32_rproc_suspend(struct device *dev)
+static int stm32_rproc_suspend(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	struct stm32_rproc *ddata = rproc->priv;
@@ -932,7 +932,7 @@ static int __maybe_unused stm32_rproc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused stm32_rproc_resume(struct device *dev)
+static int stm32_rproc_resume(struct device *dev)
 {
 	struct rproc *rproc = dev_get_drvdata(dev);
 	struct stm32_rproc *ddata = rproc->priv;
@@ -943,16 +943,16 @@ static int __maybe_unused stm32_rproc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
-			 stm32_rproc_suspend, stm32_rproc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
+				stm32_rproc_suspend, stm32_rproc_resume);
 
 static struct platform_driver stm32_rproc_driver = {
 	.probe = stm32_rproc_probe,
 	.remove_new = stm32_rproc_remove,
 	.driver = {
 		.name = "stm32-rproc",
-		.pm = &stm32_rproc_pm_ops,
-		.of_match_table = of_match_ptr(stm32_rproc_match),
+		.pm = pm_ptr(&stm32_rproc_pm_ops),
+		.of_match_table = stm32_rproc_match,
 	},
 };
 module_platform_driver(stm32_rproc_driver);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
