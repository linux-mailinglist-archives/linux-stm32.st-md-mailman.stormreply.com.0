Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3A1F977E
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 15:00:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91857C36B22;
	Mon, 15 Jun 2020 13:00:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3589FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 13:00:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FCpwZ6001459; Mon, 15 Jun 2020 14:59:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=32+lk+UyvnjPhzVzmGdEmn3lX2QHGEm15Hyud+sWxiQ=;
 b=P3gAewxVE16cpYqMAlt+qbU/B+qdtVxuqssi3+OxPvXREQlbNYfI+JPMRg4FmOfCqatT
 xsw+WwNLwCpezKaDHdX/CT/sW8RQ7TZ8xvnMUVvtJFpBkMnErW/JuvLsEMlDBZNmcGtw
 WDuR1RhoEu0oyIfe/mKYzXKyqFRznxBrIM5P0EWW2pZNooEOgLwq+hfwvAfS2mfZGpfz
 8KDX2kRz7cmxNGtY5qrLTRFwl70D8S+RZuVt5bhSjviEknEVOBsNu1mZ3j3nE9ovTe1m
 WApaBWPRk/7UUfSTBxzdjU6PvBPV+VKDqqZwOcy9vcsae0mNJK+TsovnVmYeVtpCi3wy jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph1h22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 14:59:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26B22100034;
 Mon, 15 Jun 2020 14:59:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A2812B3613;
 Mon, 15 Jun 2020 14:59:59 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:59:58
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Jun 2020 14:59:51 +0200
Message-ID: <20200615125951.28008-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615125951.28008-1-alexandre.torgue@st.com>
References: <20200615125951.28008-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: add possibility to
	configure pins individually
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

Adds the possibility to configure a single pin through the gpiolib (i.e:
to set PULL_UP/PULL_DOWN config).
Mutex behavior is slightly changed to avoid a deadlock when pin_config_set
is called (in this case pctldev->mutex is already taken).

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5d9839beaa07..b5cb7d9536dc 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -302,6 +302,7 @@ static const struct gpio_chip stm32_gpio_template = {
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,
 	.get_direction		= stm32_gpio_get_direction,
+	.set_config		= gpiochip_generic_config,
 };
 
 static void stm32_gpio_irq_trigger(struct irq_data *d)
@@ -1051,7 +1052,7 @@ static int stm32_pconf_parse_conf(struct pinctrl_dev *pctldev,
 	struct stm32_gpio_bank *bank;
 	int offset, ret = 0;
 
-	range = pinctrl_find_gpio_range_from_pin(pctldev, pin);
+	range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
 	if (!range) {
 		dev_err(pctl->dev, "No gpio range defined.\n");
 		return -EINVAL;
@@ -1109,9 +1110,11 @@ static int stm32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
+		mutex_lock(&pctldev->mutex);
 		ret = stm32_pconf_parse_conf(pctldev, g->pin,
 			pinconf_to_config_param(configs[i]),
 			pinconf_to_config_argument(configs[i]));
+		mutex_unlock(&pctldev->mutex);
 		if (ret < 0)
 			return ret;
 
@@ -1121,6 +1124,22 @@ static int stm32_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	return 0;
 }
 
+static int stm32_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			   unsigned long *configs, unsigned int num_configs)
+{
+	int i, ret;
+
+	for (i = 0; i < num_configs; i++) {
+		ret = stm32_pconf_parse_conf(pctldev, pin,
+				pinconf_to_config_param(configs[i]),
+				pinconf_to_config_argument(configs[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 				 struct seq_file *s,
 				 unsigned int pin)
@@ -1186,10 +1205,10 @@ static void stm32_pconf_dbg_show(struct pinctrl_dev *pctldev,
 	}
 }
 
-
 static const struct pinconf_ops stm32_pconf_ops = {
 	.pin_config_group_get	= stm32_pconf_group_get,
 	.pin_config_group_set	= stm32_pconf_group_set,
+	.pin_config_set		= stm32_pconf_set,
 	.pin_config_dbg_show	= stm32_pconf_dbg_show,
 };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
