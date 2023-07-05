Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6A4748ADE
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 19:45:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E66EC6B462;
	Wed,  5 Jul 2023 17:45:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8102C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 17:45:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 365EwgO5010376; Wed, 5 Jul 2023 19:45:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=7joXDmQdoUHq1t1Rk3B57rM7FLGMUsyE4+cudEdqeEA=;
 b=DXa+reieRdm8TWRO+XddByZ8WOREoSs11J5yutgLxEz/BuBWHl7ytkzs96U2+LLmO64W
 PYqdf/j82ZkvcXJ/OkhQRNRD5QuFzMoSobgyWllFJ9TOkP5caL1pjalbhLfkaYK21o3e
 wClxcLaR5JOoqFt1uXHKmSoiPnAJWroEiBGpBkKqKKTzA52jrNtyIMPcRgdkHo7ob6Ys
 znDtWh+5pjsRmH0Ac/7gg5ghOOLW8nNwEKHpAb4kvNashoS5rRoHpMaUnGGQhIqACZhW
 iwIsS2nAwL6kWfZ0+iD0KVp0bu/jT/RrgBiGydPxKzpeKIlSTTFI4wzIAenbOs9LF5mU vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rn7wp2by3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jul 2023 19:45:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 57EFF100060;
 Wed,  5 Jul 2023 19:45:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 511A3252252;
 Wed,  5 Jul 2023 19:45:07 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 5 Jul
 2023 19:45:06 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo
 <a.zummo@towertech.it>
Date: Wed, 5 Jul 2023 19:43:57 +0200
Message-ID: <20230705174357.353616-8-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705174357.353616-1-valentin.caron@foss.st.com>
References: <20230705174357.353616-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_09,2023-07-05_01,2023-05-22_02
Cc: linux-rtc@vger.kernel.org,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/7] rtc: stm32: fix unnecessary parentheses
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

Fix a few style issues reported by checkpatch.pl:
- Unnecessary parentheses
- Lines should not end with a '('

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/rtc-stm32.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 836d39a124dd..85689192fa7a 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -163,10 +163,9 @@ static int stm32_rtc_enter_init_mode(struct stm32_rtc *rtc)
 		 * slowest rtc_ck frequency may be 32kHz and highest should be
 		 * 1MHz, we poll every 10 us with a timeout of 100ms.
 		 */
-		return readl_relaxed_poll_timeout_atomic(
-					rtc->base + regs->isr,
-					isr, (isr & STM32_RTC_ISR_INITF),
-					10, 100000);
+		return readl_relaxed_poll_timeout_atomic(rtc->base + regs->isr, isr,
+							 (isr & STM32_RTC_ISR_INITF),
+							 10, 100000);
 	}
 
 	return 0;
@@ -671,7 +670,7 @@ static int stm32_rtc_init(struct platform_device *pdev,
 	 * Can't find a 1Hz, so give priority to RTC power consumption
 	 * by choosing the higher possible value for prediv_a
 	 */
-	if ((pred_s > pred_s_max) || (pred_a > pred_a_max)) {
+	if (pred_s > pred_s_max || pred_a > pred_a_max) {
 		pred_a = pred_a_max;
 		pred_s = (rate / (pred_a + 1)) - 1;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
