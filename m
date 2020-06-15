Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D61F9731
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 14:54:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DD56C36B22;
	Mon, 15 Jun 2020 12:54:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1673C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 12:54:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FCqnb8011050; Mon, 15 Jun 2020 14:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bXos72rf0lg0iLm1zdmI8TWdbgoRub9K+Cl/CRJ6gjQ=;
 b=JmVIt0c2JGG9uc+PwWibzxVu6zQt6ygLyh7T4qihAFz+Rv3fOo1p/B4DHmvF/tozifkT
 7hmV5v9/hgm5c38E7qzIKMOcLmaTMrrOFsVLI9jCAZNrOzjD2ixwfppqUqF1ySK8xPY/
 o93ArBWaUymS/BP8LsiAIYzbrLjG9ouuxKM1eHqzc1l2Z84qcb8ptZaHF8PRe1eqjEe4
 20wRmOfY/erASbEVRlzZNfXjlhRTZl+AcNLeTF9kbvVv8sMH/OgKvBkXiEuNfyoNzb6J
 tNoJF/z+6qSb3uEDDHirsV1jYfb5H4cABCSdvHIj0Tjp6zXG61JkyJdut8a1wU9OIiCq QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvspcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 14:54:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01069100034;
 Mon, 15 Jun 2020 14:54:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA9812B35E0;
 Mon, 15 Jun 2020 14:54:22 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 14:54:22
 +0200
From: Alexandre Torgue <alexandre.torgue@st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Jun 2020 14:54:07 +0200
Message-ID: <20200615125407.27632-3-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615125407.27632-1-alexandre.torgue@st.com>
References: <20200615125407.27632-1-alexandre.torgue@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: defer probe if reset
	resource is not yet ready
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

From: Etienne Carriere <etienne.carriere@st.com>

Defer probe when pin controller reset is defined in the system resources
but not yet probed.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index c15460ef2307..162535e7c94d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -84,6 +84,7 @@ struct stm32_pinctrl_group {
 struct stm32_gpio_bank {
 	void __iomem *base;
 	struct clk *clk;
+	struct reset_control *rstc;
 	spinlock_t lock;
 	struct gpio_chip gpio_chip;
 	struct pinctrl_gpio_range range;
@@ -1202,13 +1203,11 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	struct of_phandle_args args;
 	struct device *dev = pctl->dev;
 	struct resource res;
-	struct reset_control *rstc;
 	int npins = STM32_GPIO_PINS_PER_BANK;
 	int bank_nr, err;
 
-	rstc = of_reset_control_get_exclusive(np, NULL);
-	if (!IS_ERR(rstc))
-		reset_control_deassert(rstc);
+	if (!IS_ERR(bank->rstc))
+		reset_control_deassert(bank->rstc);
 
 	if (of_address_to_resource(np, 0, &res))
 		return -ENODEV;
@@ -1516,6 +1515,11 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
 
 		if (of_property_read_bool(child, "gpio-controller")) {
+			bank->rstc = of_reset_control_get_exclusive(child,
+								    NULL);
+			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+
 			bank->clk = of_clk_get_by_name(child, NULL);
 			if (IS_ERR(bank->clk)) {
 				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
