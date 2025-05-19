Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E071ABC519
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 19:03:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C067C78F8E;
	Mon, 19 May 2025 17:03:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79FD4C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 17:03:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JENVIQ010263;
 Mon, 19 May 2025 19:02:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=/GHcyFS0HynTNqpKjFvRFs
 q5Oc2635v1fvZXhZzErh0=; b=oNuqiAW1ifBHjNyvHpFVETOZ0KvqqrmF6zMp4Y
 8CVo/IWxBq/PvB/qyIW/QA2FP091vTAmFj9r0AazMhtMV7Q1gy27YsdfQFb3s3//
 qmeOQZjmaAl+jZA/JtktB3FkcfkTvp5UTgbA4z4qK+PKB0LG6+0YVpsY+NJvQ+Be
 +E/Ckl509SJvGeJW/DRlo6PQbj3cSMfdqY21Oqe3uxRu0k92+MFY9wg9nrXDQ5d+
 cfMXfTQRw9OOLpyaiiez2elqEdfztHh0KYF5mqRqID9nFFPzwG+HZfTUlFrtGob6
 raZADNeuPopF6ZcGaX8eYjCD+tz/aqs/TH0U33mnJa11dp4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfka13yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 19:02:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A48D40052;
 Mon, 19 May 2025 19:01:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E64DAF7007;
 Mon, 19 May 2025 19:01:17 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 19:01:17 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 19 May 2025 19:00:55 +0200
Message-ID: <20250519170055.205544-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] watchdog: arm_smc_wdt: get wdt status through
	SMCWD_GET_TIMELEFT
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

The optional SMCWD_GET_TIMELEFT command can be used to detect if
the watchdog has already been started.
See the implementation in OP-TEE secure OS [1].

If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
if the watchdog is already started and then set WDOG_HW_RUNNING in
the watchdog status. This will cause the watchdog framework to
ping the watchdog until a userspace watchdog daemon takes over the
control.

Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index 8f3d0c3a005fb..f1268f43327ea 100644
--- a/drivers/watchdog/arm_smc_wdt.c
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
 		return -ENODEV;
 	if (res->a0 == PSCI_RET_INVALID_PARAMS)
 		return -EINVAL;
+	if (res->a0 == PSCI_RET_DISABLED)
+		return -ENODATA;
 	if (res->a0 != PSCI_RET_SUCCESS)
 		return -EIO;
 	return 0;
@@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pdev)
 
 	wdd->info = &smcwd_info;
 	/* get_timeleft is optional */
-	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
-		wdd->ops = &smcwd_ops;
-	else
+	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
+	switch (err) {
+	case 0:
+		if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
+			set_bit(WDOG_HW_RUNNING, &wdd->status);
+		fallthrough;
+	case -ENODATA:
 		wdd->ops = &smcwd_timeleft_ops;
+		break;
+	default:
+		wdd->ops = &smcwd_ops;
+		break;
+	}
+
 	wdd->timeout = res.a2;
 	wdd->max_timeout = res.a2;
 	wdd->min_timeout = res.a1;

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
