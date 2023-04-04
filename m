Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E16646D5C2A
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE3AC6A61C;
	Tue,  4 Apr 2023 09:43:21 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8007AC6A614
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y20so41657531lfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RNcW0+JGFul/r7gTdVaVYsY6oiF69IsvdynyWjh+xH4=;
 b=IqiscGQIO7vvpA7PHEppUJtobdxHepbMUx6GNwDfHGIpDOZJG/8BLcmKFApHwQd+cy
 /ZoysvY8PM3jpBWKDq8C3E6DvCqNS24xASrDSBdO/8kEozm+lmFgZ+c0nwK9VZq2uatj
 cDSATL8++/5ds6m+vsT5QFlSjt9bjr17lLmhLW2phdaWVBU5SV32aqsZoT2S/9DaVKx8
 0ua+hmO/doBPifDKuTTcAUAUbRZdQEUH8CuZTIii9/tqyX8mjzjg4S5joY258LjcJbXm
 AeCeL47eYslepdPd7/EPqfSbdDuOvgp95hvVT0lRnFt3kjd6rJi3I2JcozXcUr9E00Wz
 jF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RNcW0+JGFul/r7gTdVaVYsY6oiF69IsvdynyWjh+xH4=;
 b=ivbK0zJOU3Cj46Ov55kVg7lmkG3jJpAV034RKx7kGA45zy0SRf/mdDF/t7Z9Pe/qHO
 krAHU2L/i72bmB8dUCv26dqM8bEaF8/ACJTNCfcZ0NRAUcvfP7N6ZMJWn3mpqse9Z03k
 mhSAD7ETx7eyZqPnWyS5Bps7kniUMSNKH7txtVXvD+blbE668HLggUQ31UoW0e0OQX4n
 1JppN5w5lqNU9h3yg5cJM1NDMT2oQ+kRVKHKnVy2ljHsv28v+xz+8nn6HTSOJ9Iyhob3
 P8yFQSGEExH1Tx5/r0enHSpFTSp8YN1wcvsqIeFacYsob+GnaL21LCSFNipSct5MenpD
 H3cA==
X-Gm-Message-State: AAQBX9e262vm2yLqccTcD409F9NZ7D/9iLryFs92GTx/ApG67f87vACi
 a7yLV5yq8u4oiZWWa3vuRiGl9A==
X-Google-Smtp-Source: AKy350bHtWLWxkw8v/3gtXShSIG6n42OYlnsV/lCyqHmYlMKXuVm423gkCgVUETn229gxABvBap0QQ==
X-Received: by 2002:ac2:59d9:0:b0:4ea:fa87:7a8a with SMTP id
 x25-20020ac259d9000000b004eafa877a8amr445870lfn.37.1680601399242; 
 Tue, 04 Apr 2023 02:43:19 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:11 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-9-503788a7f6e6@linaro.org>
References: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
In-Reply-To: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.1
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] pinctrl: sx150x: Convert to immutable
	irq_chip
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

Convert the driver to immutable irq-chip with a bit of
intuition.

I switched to consistently using irqd_to_hwirq() consistently
while we are at it.

As the driver now needs to get the gpio_chip in the .irq_mask
and .irq_unmask callbacks, I switched to a pattern where we
first fetch the gpio_chip and then the state container from
that in two steps. The compiler will do the same thing anyway.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-sx150x.c | 64 +++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 0b5ff99641e1..e49c7be2b47b 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -99,7 +99,6 @@ struct sx150x_pinctrl {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pinctrl_desc;
 	struct gpio_chip gpio;
-	struct irq_chip irq_chip;
 	struct regmap *regmap;
 	struct {
 		u32 sense;
@@ -487,19 +486,21 @@ static int sx150x_gpio_direction_output(struct gpio_chip *chip,
 
 static void sx150x_irq_mask(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int n = irqd_to_hwirq(d);
 
 	pctl->irq.masked |= BIT(n);
+	gpiochip_disable_irq(gc, n);
 }
 
 static void sx150x_irq_unmask(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int n = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+	unsigned int n = irqd_to_hwirq(d);
 
+	gpiochip_enable_irq(gc, n);
 	pctl->irq.masked &= ~BIT(n);
 }
 
@@ -520,14 +521,14 @@ static void sx150x_irq_set_sense(struct sx150x_pinctrl *pctl,
 
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 	unsigned int n, val = 0;
 
 	if (flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
 		return -EINVAL;
 
-	n = d->hwirq;
+	n = irqd_to_hwirq(d);
 
 	if (flow_type & IRQ_TYPE_EDGE_RISING)
 		val |= SX150X_IRQ_TYPE_EDGE_RISING;
@@ -562,22 +563,42 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 
 static void sx150x_irq_bus_lock(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 
 	mutex_lock(&pctl->lock);
 }
 
 static void sx150x_irq_bus_sync_unlock(struct irq_data *d)
 {
-	struct sx150x_pinctrl *pctl =
-			gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
 
 	regmap_write(pctl->regmap, pctl->data->reg_irq_mask, pctl->irq.masked);
 	regmap_write(pctl->regmap, pctl->data->reg_sense, pctl->irq.sense);
 	mutex_unlock(&pctl->lock);
 }
 
+
+static void sx150x_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sx150x_pinctrl *pctl = gpiochip_get_data(gc);
+
+	seq_printf(p, pctl->client->name);
+}
+
+static const struct irq_chip sx150x_irq_chip = {
+	.irq_mask = sx150x_irq_mask,
+	.irq_unmask = sx150x_irq_unmask,
+	.irq_set_type = sx150x_irq_set_type,
+	.irq_bus_lock = sx150x_irq_bus_lock,
+	.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock,
+	.irq_print_chip = sx150x_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			      unsigned long *config)
 {
@@ -1181,19 +1202,8 @@ static int sx150x_probe(struct i2c_client *client)
 	if (client->irq > 0) {
 		struct gpio_irq_chip *girq;
 
-		pctl->irq_chip.irq_mask = sx150x_irq_mask;
-		pctl->irq_chip.irq_unmask = sx150x_irq_unmask;
-		pctl->irq_chip.irq_set_type = sx150x_irq_set_type;
-		pctl->irq_chip.irq_bus_lock = sx150x_irq_bus_lock;
-		pctl->irq_chip.irq_bus_sync_unlock = sx150x_irq_bus_sync_unlock;
-		pctl->irq_chip.name = devm_kstrdup(dev, client->name,
-						   GFP_KERNEL);
-		if (!pctl->irq_chip.name)
-			return -ENOMEM;
-
 		pctl->irq.masked = ~0;
 		pctl->irq.sense = 0;
-
 		/*
 		 * Because sx150x_irq_threaded_fn invokes all of the
 		 * nested interrupt handlers via handle_nested_irq,
@@ -1206,7 +1216,7 @@ static int sx150x_probe(struct i2c_client *client)
 		 * called (should not happen)
 		 */
 		girq = &pctl->gpio.irq;
-		girq->chip = &pctl->irq_chip;
+		gpio_irq_chip_set_chip(girq, &sx150x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
@@ -1219,7 +1229,7 @@ static int sx150x_probe(struct i2c_client *client)
 						sx150x_irq_thread_fn,
 						IRQF_ONESHOT | IRQF_SHARED |
 						IRQF_TRIGGER_FALLING,
-						pctl->irq_chip.name, pctl);
+						client->name, pctl);
 		if (ret < 0)
 			return ret;
 	}

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
