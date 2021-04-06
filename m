Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7667355AE8
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 20:00:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80AB6C5719D;
	Tue,  6 Apr 2021 18:00:49 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCA08C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 18:00:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FFFgd0Rd1z1s1JC;
 Tue,  6 Apr 2021 20:00:45 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FFFgc6n7hz1qqx1;
 Tue,  6 Apr 2021 20:00:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id nsKINH-zRnAt; Tue,  6 Apr 2021 20:00:43 +0200 (CEST)
X-Auth-Info: aqZbcfl71BhIIKzWCbFBE1N+MMm8PY2K9jfFRvIQp60=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  6 Apr 2021 20:00:43 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue,  6 Apr 2021 20:00:35 +0200
Message-Id: <20210406180035.279249-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: Print invalid AF warning
	inside stm32_pctrl_is_function_valid()
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

The "invalid function %d on pin %d .\n" message is triplicated in the
driver in different variants, just pull it into the function and have
it once in the driver. The bonus is that all variants of the message
now print the pin number and AF consistently, so it is easier to debug
such pinmux problems.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index da72e3e5c08d..ad9eb5ed8e81 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -531,6 +531,8 @@ static bool stm32_pctrl_is_function_valid(struct stm32_pinctrl *pctl,
 		break;
 	}
 
+	dev_err(pctl->dev, "invalid function %d on pin %d .\n", fnum, pin_num);
+
 	return false;
 }
 
@@ -545,11 +547,8 @@ static int stm32_pctrl_dt_node_to_map_func(struct stm32_pinctrl *pctl,
 	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
 	(*map)[*num_maps].data.mux.group = grp->name;
 
-	if (!stm32_pctrl_is_function_valid(pctl, pin, fnum)) {
-		dev_err(pctl->dev, "invalid function %d on pin %d .\n",
-				fnum, pin);
+	if (!stm32_pctrl_is_function_valid(pctl, pin, fnum))
 		return -EINVAL;
-	}
 
 	(*map)[*num_maps].data.mux.function = stm32_gpio_functions[fnum];
 	(*num_maps)++;
@@ -620,7 +619,6 @@ static int stm32_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		func = STM32_GET_PIN_FUNC(pinfunc);
 
 		if (!stm32_pctrl_is_function_valid(pctl, pin, func)) {
-			dev_err(pctl->dev, "invalid function.\n");
 			err = -EINVAL;
 			goto exit;
 		}
@@ -821,11 +819,8 @@ static int stm32_pmx_set_mux(struct pinctrl_dev *pctldev,
 	int pin;
 
 	ret = stm32_pctrl_is_function_valid(pctl, g->pin, function);
-	if (!ret) {
-		dev_err(pctl->dev, "invalid function %d on group %d .\n",
-				function, group);
+	if (!ret)
 		return -EINVAL;
-	}
 
 	range = pinctrl_find_gpio_range_from_pin(pctldev, g->pin);
 	if (!range) {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
