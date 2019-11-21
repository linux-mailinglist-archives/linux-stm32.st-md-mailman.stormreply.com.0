Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6167104DE2
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 09:28:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AE8CC36B0E;
	Thu, 21 Nov 2019 08:28:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9C3FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 08:28:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL8RHQa015864; Thu, 21 Nov 2019 09:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=twjnrkDQj2gpn7S/JQi3Gp1h6gkqTNkfZfkN2FjeW78=;
 b=kS72Yi03+KvFUReVKUamtKicfbFyH9gJlCoOercgzbymyMMqc0qclVMFhtfXzFCyKdm8
 E/4ZOepUX7kkwgR807/AyBK78OvSNIgq63Vbz0B8Tr0RotlTXNnB3uJ9ocTqeyz/yVu6
 +WpR+id2duSFNbx1c3P6H2pnGTaLgdZ1Rww7R2BcT4uDRrzTwKH/8hJA2/cppBKC3YdD
 oC7GEU62Z7o/HMwmTSkQmdSwTf9rs8G9lyBY495FHUwCumG6i+PHh1Vxwlo/WFeZgO1a
 UCKxjzM/ejDmC0PiK9gRUlFbqp0EH91KhhWcRZfXPOI84Yx5PA3T0buAPTBx8PJdqhhK Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9upafmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 09:28:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A879E100049;
 Thu, 21 Nov 2019 09:28:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B92E2AEF15;
 Thu, 21 Nov 2019 09:28:24 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 21 Nov 2019 09:28:24 +0100
From: Christophe Roullier <christophe.roullier@st.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Thu, 21 Nov 2019 09:28:13 +0100
Message-ID: <20191121082813.29267-2-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121082813.29267-1-christophe.roullier@st.com>
References: <20191121082813.29267-1-christophe.roullier@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_08:2019-11-20,2019-11-20 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] drivers: watchdog: stm32_iwdg: set
	WDOG_HW_RUNNING at probe
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

If the watchdog hardware is already enabled during the boot process,
when the Linux watchdog driver loads, it should reset the watchdog and
tell the watchdog framework. As a result, ping can be generated from
the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
until the userspace watchdog daemon takes over control

Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 57 ++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a3a329011a06..2b3be3b1c15b 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -87,8 +87,23 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
-	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
-	int ret;
+
+	dev_dbg(wdd->parent, "%s\n", __func__);
+
+	/*  Start the watchdog */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
+
+	/* reload watchdog */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
+
+	set_bit(WDOG_HW_RUNNING, &wdd->status);
+	return 0;
+}
+
+static int stm32_iwdg_setprescaler(struct watchdog_device *wdd)
+{
+	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
+	u32 tout, presc, iwdg_rlr, iwdg_pr;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
@@ -108,19 +123,6 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	/* set prescaler & reload registers */
 	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
 	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
-	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
-
-	/* wait for the registers to be updated (max 100ms) */
-	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
-					 !(iwdg_sr & (SR_PVU | SR_RVU)),
-					 SLEEP_US, TIMEOUT_US);
-	if (ret) {
-		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
-		return ret;
-	}
-
-	/* reload watchdog */
-	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
 
 	return 0;
 }
@@ -131,6 +133,9 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
+	/*  Start the watchdog */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
+
 	/* reload watchdog */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
 
@@ -140,12 +145,21 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
 static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
+	int ret;
+
 	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
 
 	wdd->timeout = timeout;
 
-	if (watchdog_active(wdd))
-		return stm32_iwdg_start(wdd);
+	if (watchdog_active(wdd)) {
+		ret = stm32_iwdg_setprescaler(wdd);
+		if (ret) {
+			dev_err(wdd->parent, "failed to set prescaler\n");
+			return ret;
+		} else {
+			return stm32_iwdg_start(wdd);
+		}
+	}
 
 	return 0;
 }
@@ -262,12 +276,21 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
 
+	/* Make sure the watchdog is serviced */
+	set_bit(WDOG_HW_RUNNING, &wdd->status);
+
 	ret = devm_watchdog_register_device(dev, wdd);
 	if (ret)
 		return ret;
 
 	platform_set_drvdata(pdev, wdt);
 
+	ret = stm32_iwdg_setprescaler(wdd);
+	if (ret) {
+		dev_err(dev, "failed to set prescaler\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
