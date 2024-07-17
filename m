Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCAD933845
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jul 2024 09:50:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48043C71280;
	Wed, 17 Jul 2024 07:50:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9972C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jul 2024 07:50:23 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H5eZxx001739;
 Wed, 17 Jul 2024 09:49:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 84dLckjcoBOg6vm9TCjuv5rFFiF1/3chz0ES2CQHAJA=; b=jl7gdPTxB42SEbu4
 RMOtjnFKxYmN/ZbqTNdHzq30dU46KC8+tEgIVqV2YqfMT4A6yqMeXAejqfFyPKTq
 QgRPKpK21tCON1Q4xWlzrh3lFxk2QbYol/XOARoqs1Ah/C0g34GMh5sw3tgLvypA
 r4VrW4eVUGGfTq45pfqmDH+e6M5WMjmqbRvCHjckjX0AAbbwSoeSdgEqrBOL6LKe
 xBweBbzUxfgdiSCB09A8vtwnGuRriTyCAmwewI+QjuUeaEzXTnVFHW/JWFnC/G94
 FJ8muLTvVs6NxOTiuaj0B++KDremWrWpTfS5HSyPfeOLeREZ8OHUGeJKJHLyU8Be
 yrLiXQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40dwfkt78q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2024 09:49:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 560F140047;
 Wed, 17 Jul 2024 09:49:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB06F24148B;
 Wed, 17 Jul 2024 09:48:55 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 17 Jul
 2024 09:48:55 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 17 Jul 2024 09:48:33 +0200
Message-ID: <20240717074835.2210411-3-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240717074835.2210411-1-valentin.caron@foss.st.com>
References: <20240717074835.2210411-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_04,2024-07-16_02,2024-05-17_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] rtc: stm32: add pinctrl and pinmux
	interfaces
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

STM32 RTC is capable to handle 3 specific pins of the soc.
"out1, out2 and out2_rmp". To handle this, we use pinctrl framework.
There is a single pin per group.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/rtc/Kconfig     |   2 +
 drivers/rtc/rtc-stm32.c | 120 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..9c88eb580209 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1922,6 +1922,8 @@ config RTC_DRV_R7301
 config RTC_DRV_STM32
 	tristate "STM32 RTC"
 	select REGMAP_MMIO
+	select PINMUX
+	select GENERIC_PINCONF
 	depends on ARCH_STM32 || COMPILE_TEST
 	help
 	   If you say yes here you get support for the STM32 On-Chip
diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 98b07969609d..6dfd9dc07e2e 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -13,6 +13,9 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
@@ -107,6 +110,14 @@
 /* STM32 RTC driver time helpers */
 #define SEC_PER_DAY		(24 * 60 * 60)
 
+/* STM32 RTC pinctrl helpers */
+#define STM32_RTC_PINMUX(_name, _action, ...) { \
+	.name = (_name), \
+	.action = (_action), \
+	.groups = ((const char *[]){ __VA_ARGS__ }), \
+	.num_groups = ARRAY_SIZE(((const char *[]){ __VA_ARGS__ })), \
+}
+
 struct stm32_rtc;
 
 struct stm32_rtc_registers {
@@ -171,6 +182,106 @@ static void stm32_rtc_wpr_lock(struct stm32_rtc *rtc)
 	writel_relaxed(RTC_WPR_WRONG_KEY, rtc->base + regs->wpr);
 }
 
+enum stm32_rtc_pin_name {
+	NONE,
+	OUT1,
+	OUT2,
+	OUT2_RMP
+};
+
+static const struct pinctrl_pin_desc stm32_rtc_pinctrl_pins[] = {
+	PINCTRL_PIN(OUT1, "out1"),
+	PINCTRL_PIN(OUT2, "out2"),
+	PINCTRL_PIN(OUT2_RMP, "out2_rmp"),
+};
+
+static int stm32_rtc_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_rtc_pinctrl_pins);
+}
+
+static const char *stm32_rtc_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						    unsigned int selector)
+{
+	return stm32_rtc_pinctrl_pins[selector].name;
+}
+
+static int stm32_rtc_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					    unsigned int selector,
+					    const unsigned int **pins,
+					    unsigned int *num_pins)
+{
+	*pins = &stm32_rtc_pinctrl_pins[selector].number;
+	*num_pins = 1;
+	return 0;
+}
+
+static const struct pinctrl_ops stm32_rtc_pinctrl_ops = {
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+	.get_groups_count	= stm32_rtc_pinctrl_get_groups_count,
+	.get_group_name		= stm32_rtc_pinctrl_get_group_name,
+	.get_group_pins		= stm32_rtc_pinctrl_get_group_pins,
+};
+
+struct stm32_rtc_pinmux_func {
+	const char *name;
+	const char * const *groups;
+	const unsigned int num_groups;
+	int (*action)(struct pinctrl_dev *pctl_dev, unsigned int pin);
+};
+
+static const struct stm32_rtc_pinmux_func stm32_rtc_pinmux_functions[] = {
+};
+
+static int stm32_rtc_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(stm32_rtc_pinmux_functions);
+}
+
+static const char *stm32_rtc_pinmux_get_fname(struct pinctrl_dev *pctldev, unsigned int selector)
+{
+	return stm32_rtc_pinmux_functions[selector].name;
+}
+
+static int stm32_rtc_pinmux_get_groups(struct pinctrl_dev *pctldev, unsigned int selector,
+				       const char * const **groups, unsigned int * const num_groups)
+{
+	*groups = stm32_rtc_pinmux_functions[selector].groups;
+	*num_groups = stm32_rtc_pinmux_functions[selector].num_groups;
+	return 0;
+}
+
+static int stm32_rtc_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
+				    unsigned int group)
+{
+	struct stm32_rtc_pinmux_func selected_func = stm32_rtc_pinmux_functions[selector];
+	struct pinctrl_pin_desc pin = stm32_rtc_pinctrl_pins[group];
+
+	/* Call action */
+	if (selected_func.action)
+		return selected_func.action(pctldev, pin.number);
+
+	return -EINVAL;
+}
+
+static const struct pinmux_ops stm32_rtc_pinmux_ops = {
+	.get_functions_count	= stm32_rtc_pinmux_get_functions_count,
+	.get_function_name	= stm32_rtc_pinmux_get_fname,
+	.get_function_groups	= stm32_rtc_pinmux_get_groups,
+	.set_mux		= stm32_rtc_pinmux_set_mux,
+	.strict			= true,
+};
+
+static struct pinctrl_desc stm32_rtc_pdesc = {
+	.name = DRIVER_NAME,
+	.pins = stm32_rtc_pinctrl_pins,
+	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),
+	.owner = THIS_MODULE,
+	.pctlops = &stm32_rtc_pinctrl_ops,
+	.pmxops = &stm32_rtc_pinmux_ops,
+};
+
 static int stm32_rtc_enter_init_mode(struct stm32_rtc *rtc)
 {
 	const struct stm32_rtc_registers *regs = &rtc->data->regs;
@@ -791,6 +902,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 {
 	struct stm32_rtc *rtc;
 	const struct stm32_rtc_registers *regs;
+	struct pinctrl_dev *pctl;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -912,6 +1024,14 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+
+	ret = pinctrl_enable(pctl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
 	 * must be initialized
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
