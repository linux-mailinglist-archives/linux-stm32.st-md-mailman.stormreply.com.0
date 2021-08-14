Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C933A3EC34D
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Aug 2021 16:27:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B27EC5A4CE;
	Sat, 14 Aug 2021 14:27:37 +0000 (UTC)
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com
 [221.176.66.81])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A74FAC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Aug 2021 14:27:35 +0000 (UTC)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea6117d2b6ed1-8d01b;
 Sat, 14 Aug 2021 22:27:02 +0800 (CST)
X-RM-TRANSID: 2eea6117d2b6ed1-8d01b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66117d2b0886-2b22d;
 Sat, 14 Aug 2021 22:27:02 +0800 (CST)
X-RM-TRANSID: 2ee66117d2b0886-2b22d
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Sat, 14 Aug 2021 22:27:41 +0800
Message-Id: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Cc: linux-watchdog@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: drop superfluous error
	message
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

In the function stm32_iwdg_probe(), devm_platform_ioremap_resource
has already contained error message, so drop the redundant one.

Co-developed-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/watchdog/stm32_iwdg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a3436c296..570a71509 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -237,10 +237,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 
 	/* This is the timer base. */
 	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->regs)) {
-		dev_err(dev, "Could not get resource\n");
+	if (IS_ERR(wdt->regs))
 		return PTR_ERR(wdt->regs);
-	}
 
 	ret = stm32_iwdg_clk_init(pdev, wdt);
 	if (ret)
-- 
2.20.1.windows.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
