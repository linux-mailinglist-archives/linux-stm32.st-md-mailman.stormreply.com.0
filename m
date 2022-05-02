Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C242451727B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 May 2022 17:25:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 586F5C60462;
	Mon,  2 May 2022 15:25:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E466DC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 May 2022 15:25:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242EGuP1023012;
 Mon, 2 May 2022 17:25:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=0JY2d4G0/9ojnnPUTXCbTsscUCh+1Ur6T7M/thuZ+6k=;
 b=Xg9f9f+bGTNx/dlF8d4WCPoiyDN8IXWJ4fRqDWhTx+dgo0nWDFuCpBjgBZrX/qTQJD9P
 eGJsnJHI8bWH6xjHWeoyIC3Cssk22kgxTKF1c14L52F2I8bp5hN6UciG6gbRfUzWN3qZ
 dbWHkSajCWnOXCuMtkx2FR+/WC4ybyH/HhBcsxbq8Oh37uW68PBGzUDuiV4RaX2usPYY
 3A9gCPEqNN56oQpVwefy7nTta7lfMUS1Kv2vXK1fZMxycgAWEU/EjIPeWW6vnUB5lV23
 4Ywfkl+LPkl4p+Vk4OT5NMMIqJ4O0L4d7aJ0ubvEEmHxgUH0rcMYIYvZDq4xyBNyrHN4 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjhc5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 17:25:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B321610002A;
 Mon,  2 May 2022 17:25:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9ECD22AFFD;
 Mon,  2 May 2022 17:25:31 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 2 May 2022 17:25:31
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 2 May 2022 17:25:24 +0200
Message-ID: <20220502152524.283374-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_04,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: improve debugfs information
	of pinconf-pins entry
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

Print the name of the selected alternate function in addition to its
number. Ex:
   "pin 135 (PI7): alternate 10 (SAI2_FS_A) - ..."

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 31 +++++++++++++++++++++++----
 drivers/pinctrl/stm32/pinctrl-stm32.h | 13 +++++------
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index b308e7bb7487..2e8421600db5 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -507,7 +507,7 @@ stm32_pctrl_find_group_by_pin(struct stm32_pinctrl *pctl, u32 pin)
 static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		u32 pin_num, u32 fnum)
 {
-	int i;
+	int i, k;
 
 	for (i = 0; i < pctl->npins; i++) {
 		const struct stm32_desc_pin *pin = pctl->pins + i;
@@ -516,7 +516,7 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		if (pin->pin.number != pin_num)
 			continue;
 
-		while (func && func->name) {
+		for (k = 0; k < STM32_CONFIG_NUM; k++) {
 			if (func->num == fnum)
 				return true;
 			func++;
@@ -1118,10 +1118,27 @@ static int stm32_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	return 0;
 }
 
+static struct stm32_desc_pin *
+stm32_pconf_get_pin_desc_by_pin_number(struct stm32_pinctrl *pctl,
+				       unsigned int pin_number)
+{
+	struct stm32_desc_pin *pins = pctl->pins;
+	int i;
+
+	for (i = 0; i < pctl->npins; i++) {
+		if (pins->pin.number == pin_number)
+			return pins;
+		pins++;
+	}
+	return NULL;
+}
+
 static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 				 struct seq_file *s,
 				 unsigned int pin)
 {
+	struct stm32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct stm32_desc_pin *pin_desc;
 	struct pinctrl_gpio_range *range;
 	struct stm32_gpio_bank *bank;
 	int offset;
@@ -1171,7 +1188,12 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	case 2:
 		drive = stm32_pconf_get_driving(bank, offset);
 		speed = stm32_pconf_get_speed(bank, offset);
-		seq_printf(s, "%d - %s - %s - %s %s", alt,
+		pin_desc = stm32_pconf_get_pin_desc_by_pin_number(pctl, pin);
+		if (!pin_desc)
+			return;
+
+		seq_printf(s, "%d (%s) - %s - %s - %s %s", alt,
+			   pin_desc->functions[alt + 1].name,
 			   drive ? "open drain" : "push pull",
 			   biasing[bias],
 			   speeds[speed], "speed");
@@ -1386,7 +1408,8 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 		if (pctl->pkg && !(pctl->pkg & p->pkg))
 			continue;
 		pins->pin = p->pin;
-		pins->functions = p->functions;
+		memcpy((struct stm32_desc_pin *)pins->functions, p->functions,
+		       STM32_CONFIG_NUM * sizeof(struct stm32_desc_function));
 		pins++;
 		nb_pins_available++;
 	}
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
index b9584039cdf5..2ac2db41a498 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.h
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
@@ -17,6 +17,7 @@
 #define STM32_PIN_GPIO		0
 #define STM32_PIN_AF(x)		((x) + 1)
 #define STM32_PIN_ANALOG	(STM32_PIN_AF(15) + 1)
+#define STM32_CONFIG_NUM	(STM32_PIN_ANALOG + 1)
 
 /*  package information */
 #define STM32MP_PKG_AA		BIT(0)
@@ -31,26 +32,26 @@ struct stm32_desc_function {
 
 struct stm32_desc_pin {
 	struct pinctrl_pin_desc pin;
-	const struct stm32_desc_function *functions;
+	const struct stm32_desc_function functions[STM32_CONFIG_NUM];
 	const unsigned int pkg;
 };
 
 #define STM32_PIN(_pin, ...)					\
 	{							\
 		.pin = _pin,					\
-		.functions = (struct stm32_desc_function[]){	\
-			__VA_ARGS__, { } },			\
+		.functions = {	\
+			__VA_ARGS__},			\
 	}
 
 #define STM32_PIN_PKG(_pin, _pkg, ...)					\
 	{							\
 		.pin = _pin,					\
 		.pkg  = _pkg,				\
-		.functions = (struct stm32_desc_function[]){	\
-			__VA_ARGS__, { } },			\
+		.functions = {	\
+			__VA_ARGS__},			\
 	}
 #define STM32_FUNCTION(_num, _name)		\
-	{							\
+	[_num] = {						\
 		.num = _num,					\
 		.name = _name,					\
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
