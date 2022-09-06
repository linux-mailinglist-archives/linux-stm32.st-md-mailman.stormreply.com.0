Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1375ADEB8
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 07:01:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14FE6C640FE;
	Tue,  6 Sep 2022 05:01:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA4DCC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 05:01:52 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso5350546pjd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=Ldy1JheZ7FCt/jxCBpowwGYgtHJwSVrIu+wqfaCl/vY=;
 b=nS/IBGO0rkxxmQBAJnHTCAVhZXQMmuvxeYcH4cs0a+YlhuWNKPCfsikPzsfr+LtkfS
 6dFJ5Am/5uICOdFpIGq/cx5Ty18vXBL5HjnMo25/A19VuntRo3kInFc5HXDwqXipYAXa
 lWfAnEwLa24gqV2ERkHMSTaM/oY4KPV5rCTgrmuDgm+veZmX3NhMMcfHii8y1J4o6Kb9
 Lw0bP2cIXWGns+aWg8QGuWN0SFgs2KVVSyTlxcBThiPpAceQ//nY5KRXd3hwpW+MT6js
 NWTXNndRl3RG92hAeaDqG4JS0NklRtEHizXIr+N822eajjg/pYzeW8CKOgACy83iNz4M
 6YKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ldy1JheZ7FCt/jxCBpowwGYgtHJwSVrIu+wqfaCl/vY=;
 b=3dD4o1slinurfjTpC5uvyjhBcte+r5th0g4eEJkHL0K8qEzm2AG83Gr46jfT7jP3Nr
 Kyf3yknKh6U1OWn+hMHgL7+RhyWd+rdokcxXZus521e0Ld1YQkPNO1lfN0aPjeLVNjDy
 NvMH12Vfg/i0q6lMs2VrQUsjB/1GeIclSjOAUijinkY6HdVWhNNfjbscUr6pFIvFYpfs
 hfKVSl94OsneT6+DsMcLsLBEQavr18jx1hYqmRXfp6grClmM1gYEb+VO0ADNgr8gE1VI
 LhdWAJGawdGt6jp7NUZDdsDguuiedgvNGwfNMt5tjM8TavRWYKeMM4wF2XAx7NU4ZUpc
 jJlg==
X-Gm-Message-State: ACgBeo1bwqNCkjveUJb7n50Ni36ObeMeLVPMaXvfnnCjq6LghMiUYAKb
 /qKBIwMuJQLM4/eWlllGWV0=
X-Google-Smtp-Source: AA6agR6eECcxcWLwzhSb2s5VjWwhFiSzmD6nMYitrRoHBLxpoQHYUvHfxSxhVHWM2Ica/isLr3/jyw==
X-Received: by 2002:a17:903:1ce:b0:16e:f510:6666 with SMTP id
 e14-20020a17090301ce00b0016ef5106666mr51788528plh.158.1662440511104; 
 Mon, 05 Sep 2022 22:01:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
 by smtp.gmail.com with ESMTPSA id
 e15-20020aa798cf000000b005364e0ec330sm203458pfm.59.2022.09.05.22.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 22:01:50 -0700 (PDT)
Date: Mon, 5 Sep 2022 22:01:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <YxbUO7WM0TbUBatv@google.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: stmpe: switch to using gpiod API
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

This patch switches the driver away from legacy gpio/of_gpio API to
gpiod API, and removes use of of_get_named_gpio_flags() which I want to
make private to gpiolib.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/stmpe.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 987e251d90ae..0c4f74197d3e 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -8,14 +8,13 @@
  */
 
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/mfd/core.h>
@@ -30,17 +29,12 @@
  * @irq_trigger: IRQ trigger to use for the interrupt to the host
  * @autosleep: bool to enable/disable stmpe autosleep
  * @autosleep_timeout: inactivity timeout in milliseconds for autosleep
- * @irq_over_gpio: true if gpio is used to get irq
- * @irq_gpio: gpio number over which irq will be requested (significant only if
- *	      irq_over_gpio is true)
  */
 struct stmpe_platform_data {
 	int id;
 	unsigned int blocks;
 	unsigned int irq_trigger;
 	bool autosleep;
-	bool irq_over_gpio;
-	int irq_gpio;
 	int autosleep_timeout;
 };
 
@@ -1349,13 +1343,6 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	if (pdata->id < 0)
 		pdata->id = -1;
 
-	pdata->irq_gpio = of_get_named_gpio_flags(np, "irq-gpio", 0,
-				&pdata->irq_trigger);
-	if (gpio_is_valid(pdata->irq_gpio))
-		pdata->irq_over_gpio = 1;
-	else
-		pdata->irq_trigger = IRQF_TRIGGER_NONE;
-
 	of_property_read_u32(np, "st,autosleep-timeout",
 			&pdata->autosleep_timeout);
 
@@ -1381,6 +1368,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	struct stmpe_platform_data *pdata;
 	struct device_node *np = ci->dev->of_node;
 	struct stmpe *stmpe;
+	struct gpio_desc *irq_gpio;
 	int ret;
 	u32 val;
 
@@ -1434,18 +1422,20 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 	if (ci->init)
 		ci->init(stmpe);
 
-	if (pdata->irq_over_gpio) {
-		ret = devm_gpio_request_one(ci->dev, pdata->irq_gpio,
-				GPIOF_DIR_IN, "stmpe");
-		if (ret) {
-			dev_err(stmpe->dev, "failed to request IRQ GPIO: %d\n",
-					ret);
-			return ret;
-		}
+	irq_gpio = devm_gpiod_get_optional(ci->dev, "irq", GPIOD_ASIS);
+	ret = PTR_ERR_OR_ZERO(irq_gpio);
+	if (ret) {
+		dev_err(stmpe->dev, "failed to request IRQ GPIO: %d\n", ret);
+		return ret;
+	}
 
-		stmpe->irq = gpio_to_irq(pdata->irq_gpio);
+	if (irq_gpio) {
+		stmpe->irq = gpiod_to_irq(irq_gpio);
+		pdata->irq_trigger = gpiod_is_active_low(irq_gpio) ?
+					IRQF_TRIGGER_LOW : IRQF_TRIGGER_HIGH;
 	} else {
 		stmpe->irq = ci->irq;
+		pdata->irq_trigger = IRQF_TRIGGER_NONE;
 	}
 
 	if (stmpe->irq < 0) {
-- 
2.37.2.789.g6183377224-goog


-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
