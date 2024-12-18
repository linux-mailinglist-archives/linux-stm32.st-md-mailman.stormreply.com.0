Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6DD9F60B8
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 10:04:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1196C5E2D2;
	Wed, 18 Dec 2024 09:04:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E2B1C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:04:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60Nv7011765;
 Wed, 18 Dec 2024 10:04:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +lTjR8Q9lHmpjW7EdKzwYrIkx1bGZyO/7h0hMlIzi6M=; b=kw/KQ2ZDnbLJGq12
 etXrbtvXuh1sGyFH60AMY1u0MbaBXKTHQHHgXUUNtXkAubZzx1uOPPbEs70R3M/g
 7aiTNo5Dfx3IH5PGkjPAojvV2zE14/muTdTqnUjaN0N23oTT/rYUVKDqZ12UawsK
 UTU5To7k54XvdWlsfXAgKwBs6aO0SHhhtGjeRDdR3APsmwx0aoGi3vZBJagLijMK
 HK6KICFLlwlwJEFVwchD0SsHyCsxfiPrdWmR1PMySfavciaBfqsovFbloHJEe1mR
 wt7nXyJaAri/qNyrn22OkcOeIfDouhjTL/CQqHXjae6ob2l0SFi5EbdaGvCrbzJg
 /W30gQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcrnkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 10:04:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DFD914006D;
 Wed, 18 Dec 2024 10:03:45 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82F2F2545E2;
 Wed, 18 Dec 2024 10:02:58 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:58 +0100
Received: from localhost (10.48.86.222) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 10:02:58 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
 <wbg@kernel.org>, <jic23@kernel.org>, <ukleinek@kernel.org>
Date: Wed, 18 Dec 2024 10:01:49 +0100
Message-ID: <20241218090153.742869-6-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] pwm: stm32: add support for stm32mp25
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

Add support for STM32MP25 SoC. Use newly introduced compatible to handle
new features along with registers and bits diversity.
The MFD part of the driver fills in ipidr, so it is used to check the
hardware configuration register, when available to gather the number
of PWM channels and complementary outputs.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/pwm/pwm-stm32.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 17e591f61efb..99383e09920e 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -19,6 +19,7 @@
 #define CCMR_CHANNEL_SHIFT 8
 #define CCMR_CHANNEL_MASK  0xFF
 #define MAX_BREAKINPUT 2
+#define MAX_PWM_OUTPUT 4
 
 struct stm32_breakinput {
 	u32 index;
@@ -775,10 +776,19 @@ static int stm32_pwm_probe_breakinputs(struct stm32_pwm *priv,
 	return stm32_pwm_apply_breakinputs(priv);
 }
 
-static void stm32_pwm_detect_complementary(struct stm32_pwm *priv)
+static void stm32_pwm_detect_complementary(struct stm32_pwm *priv, struct stm32_timers *ddata)
 {
 	u32 ccer;
 
+	if (ddata->ipidr) {
+		u32 val;
+
+		/* Simply read from HWCFGR the number of complementary outputs (MP25). */
+		regmap_read(priv->regmap, TIM_HWCFGR1, &val);
+		priv->have_complementary_output = !!FIELD_GET(TIM_HWCFGR1_NB_OF_DT, val);
+		return;
+	}
+
 	/*
 	 * If complementary bit doesn't exist writing 1 will have no
 	 * effect so we can detect it.
@@ -790,11 +800,31 @@ static void stm32_pwm_detect_complementary(struct stm32_pwm *priv)
 	priv->have_complementary_output = (ccer != 0);
 }
 
-static unsigned int stm32_pwm_detect_channels(struct regmap *regmap,
+static unsigned int stm32_pwm_detect_channels(struct stm32_timers *ddata,
 					      unsigned int *num_enabled)
 {
+	struct regmap *regmap = ddata->regmap;
 	u32 ccer, ccer_backup;
 
+	if (ddata->ipidr) {
+		unsigned int npwm = 0;
+		u32 val;
+
+		/* Simply deduce from HWCFGR the number of outputs (MP25). */
+		regmap_read(regmap, TIM_HWCFGR1, &val);
+
+		/*
+		 * Timers may have more capture/compare channels than the
+		 * actual number of PWM channel outputs (e.g. TIM_CH[1..4]).
+		 */
+		npwm = FIELD_GET(TIM_HWCFGR1_NB_OF_CC, val);
+
+		regmap_read(regmap, TIM_CCER, &ccer);
+		*num_enabled = hweight32(ccer & TIM_CCER_CCXE);
+
+		return npwm < MAX_PWM_OUTPUT ? npwm : MAX_PWM_OUTPUT;
+	}
+
 	/*
 	 * If channels enable bits don't exist writing 1 will have no
 	 * effect so we can detect and count them.
@@ -820,7 +850,7 @@ static int stm32_pwm_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret;
 
-	npwm = stm32_pwm_detect_channels(ddata->regmap, &num_enabled);
+	npwm = stm32_pwm_detect_channels(ddata, &num_enabled);
 
 	chip = devm_pwmchip_alloc(dev, npwm, sizeof(*priv));
 	if (IS_ERR(chip))
@@ -841,7 +871,7 @@ static int stm32_pwm_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to configure breakinputs\n");
 
-	stm32_pwm_detect_complementary(priv);
+	stm32_pwm_detect_complementary(priv, ddata);
 
 	ret = devm_clk_rate_exclusive_get(dev, priv->clk);
 	if (ret)
@@ -911,6 +941,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_pwm_pm_ops, stm32_pwm_suspend, stm32_pwm_r
 
 static const struct of_device_id stm32_pwm_of_match[] = {
 	{ .compatible = "st,stm32-pwm",	},
+	{ .compatible = "st,stm32mp25-pwm", },
 	{ /* end node */ },
 };
 MODULE_DEVICE_TABLE(of, stm32_pwm_of_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
