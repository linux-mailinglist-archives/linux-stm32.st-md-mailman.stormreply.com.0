Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43276B273
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 12:59:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27907C6B45A;
	Tue,  1 Aug 2023 10:59:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F186BC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 10:59:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C21786150F;
 Tue,  1 Aug 2023 10:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F66C433C8;
 Tue,  1 Aug 2023 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690887578;
 bh=W6uC+hfdQjXTE0b+hUiFIq4lfhy6AJ+5JMfKAqdfPEg=;
 h=From:To:Cc:Subject:Date:From;
 b=I3i7dgT+D7pQRjctNSQCfp2q3NsGd0IjKONwgsV5qi8MuPuNxiXt3FhH/F8UHr3NJ
 H6mbydie71eLjQgprazKi0/9WCDZaQdB9CI+YGBeO4ic0O7fDcb+Wh5kSA6akqKvsM
 rYzIwsA1LuNixpwVzxZzH4m1Kffo/le6cp3BCbeKy24Iuhw24sdRfesACPcTPrQ6FY
 Fy/HTlrayvB15X/PhESYg52xrOovl+Y5/mXrdEu0Y25QGEKzqdccTzl450jNLZ3EsJ
 szRAHJrb6MjAXz7UoAIcBBCTUn7hiYskhJrEbuvUPw3QcjsUIQWe0o2lp5XtyUblRS
 Jo/W818d0jTyw==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue,  1 Aug 2023 12:59:15 +0200
Message-Id: <20230801105932.3738430-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] rtc: stm32: remove incorrect #ifdef check
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

After a previous commit changed the driver over to
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(), the suspend/resume
functions must no longer be hidden behind an #ifdef:

In file included from include/linux/clk.h:13,
                 from drivers/rtc/rtc-stm32.c:8:
drivers/rtc/rtc-stm32.c:927:39: error: 'stm32_rtc_suspend' undeclared here (not in a function); did you mean 'stm32_rtc_probe'?
  927 |         SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
      |                                       ^~~~~~~~~~~~~~~~~
include/linux/kernel.h:58:44: note: in definition of macro 'PTR_IF'
   58 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
      |                                            ^~~
include/linux/pm.h:329:26: note: in expansion of macro 'pm_sleep_ptr'
  329 |         .suspend_noirq = pm_sleep_ptr(suspend_fn), \
      |                          ^~~~~~~~~~~~

Fixes: fb9a7e5360dc8 ("rtc: stm32: change PM callbacks to "_noirq()"")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/rtc-stm32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 85689192fa7ae..c296e7af0700c 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -890,7 +890,6 @@ static void stm32_rtc_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_rtc_suspend(struct device *dev)
 {
 	struct stm32_rtc *rtc = dev_get_drvdata(dev);
@@ -921,7 +920,6 @@ static int stm32_rtc_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops stm32_rtc_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
