Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC584A08B6C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 10:22:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BF06C78F69;
	Fri, 10 Jan 2025 09:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F53C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:22:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A8DlBH000357;
 Fri, 10 Jan 2025 10:21:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 h6ab+x6Ynx/O74V+SfsXYwAL7nLhG88cwarhkjj6DpE=; b=nDji/mW/AuPMid5J
 aoKDXsEF0VSGsNnbjL53ztfvRBa6mPsGcYdAqD2HQAqIg5yF47WOEszIV9k5RkT6
 Y9Ou0mc7dpg4TUwSrM48ZW1evbpnw9+20HM/DmG3tNp0IsBpDdANURGgIbT8lduD
 69zzx5Gl0EN1mSx49s1qmc/sOrJw4zrkBjFP559t3a89YzIpMmXhMJcV85bi7QPz
 pE8TcPH7wyQ1dJnIkHCgqyhF41F4WdKE+d8u5MfQdmzrDwZ6rTNzNss4uJ15qN8I
 ++du5Tr9GAWKKqnO3CCuVQNO7BCmdR4diVoOwDwrWM3joMzxk4WtGuYB9kVhsOzU
 pSefXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442q2dhyvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 10:21:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D33AA40052;
 Fri, 10 Jan 2025 10:21:01 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D50F28A669;
 Fri, 10 Jan 2025 10:20:02 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:20:01 +0100
Received: from localhost (10.252.28.64) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:20:01 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>
Date: Fri, 10 Jan 2025 10:19:17 +0100
Message-ID: <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.28.64]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: [Linux-stm32] [PATCH v3 3/8] counter: stm32-timer-cnt: add support
	for stm32mp25
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

Add support for STM32MP25 SoC. There are new counter modes that may be
implemented in later. Still, use newly introduced compatible to handle
this new HW variant and avoid being blocked with existing compatible
in SoC dtsi file. Modes supported currently still remains compatible.
New timer 20 has encoder capability, add it to the list.

Acked-by: William Breathitt Gray <wbg@kernel.org>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/counter/stm32-timer-cnt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index e75b69476a00..3d3384cbea87 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -669,12 +669,14 @@ static void stm32_timer_cnt_detect_channels(struct device *dev,
 	dev_dbg(dev, "has %d cc channels\n", priv->nchannels);
 }
 
-/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 */
-#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7))
+/* encoder supported on TIM1 TIM2 TIM3 TIM4 TIM5 TIM8 TIM20 */
+#define STM32_TIM_ENCODER_SUPPORTED	(BIT(0) | BIT(1) | BIT(2) | BIT(3) | BIT(4) | BIT(7) | \
+					 BIT(19))
 
 static const char * const stm32_timer_trigger_compat[] = {
 	"st,stm32-timer-trigger",
 	"st,stm32h7-timer-trigger",
+	"st,stm32mp25-timer-trigger",
 };
 
 static int stm32_timer_cnt_probe_encoder(struct device *dev,
@@ -846,6 +848,7 @@ static SIMPLE_DEV_PM_OPS(stm32_timer_cnt_pm_ops, stm32_timer_cnt_suspend,
 
 static const struct of_device_id stm32_timer_cnt_of_match[] = {
 	{ .compatible = "st,stm32-timer-counter", },
+	{ .compatible = "st,stm32mp25-timer-counter", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_timer_cnt_of_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
