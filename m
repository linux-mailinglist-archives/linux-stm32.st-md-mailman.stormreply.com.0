Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B496C0DC7
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B9AAC6A5EF;
	Mon, 20 Mar 2023 09:55:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4ECEC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id t11so14144357lfr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sWq14yt3BM/27dxCw3WEXlHO0Q3kdzBlpwclk4xm8Qw=;
 b=AvmgwK5rhJ0aNG1XjY08pQJKKVLHdXA/4v5bKJS7/IdtwJAIMbgJLhAcrcecABl/Wg
 v+mDTWY2Kbr3UrNZAVREs3kw9LoKSInoux97YMBtE+ZjiMEJDiSz39VMK4LrI2Dfei+u
 0qH3wbJ23WHOyCqtNtNq1eJ3I31hv8Tlr8c11N1GpCStIuNuVZoLmRaxF7tPuQ09ye4/
 4q4dlq43UBB+72o9bw/Gtf7hTatbE60UF7ka9EyTkSd4ocOnJs3g0d3DLYIibi2p1v9u
 3gh1IBhLsCS+9S6uOvyQ0ciGJYTaQW+o/XxjF7qSMPXaPC15GcWOI9FZzTNGeH1g3/KF
 Q2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWq14yt3BM/27dxCw3WEXlHO0Q3kdzBlpwclk4xm8Qw=;
 b=DMrYU1aJUagSxCmsdpOBQmUGpGyKPyoubkixNI6lWcJkQARlhLFHkbXxLNmYPNrRB7
 tP4sv0q6zKn9smktor4+8NveAp94jxXkJcfabe/rSQ23+MfBcTZwS5/2EpKFTmTXaFeW
 tm4/Oqp0bvXXvFsCqEYzfMiKL1e+9hWD+Tuw5thKXVIMwvQ4w7iIWQRE4+bIsgOWhcrp
 /P7dE/lPW7zC7UG4ieimXaAjYnaz1FORCuWV+px+UtDNilLGr4QWZKpe4Wl44/vyQtsz
 yatqMsGF1Fna1Zrr40cXhmilhaez/TcYn+paHwK+p6LhZPpbE/s47dXveditqs91kj/M
 rJjw==
X-Gm-Message-State: AO0yUKWmnfGD0lVNoWkgR2hWYimodITIvTiGqUC5OkXzaNKzJaK2hrKX
 ZGe2+0uLWbwemF0JstL85qL4NQ==
X-Google-Smtp-Source: AK7set92TLDxmZOHLq6UfBl3aLUr2f4lDA7jWOJDuyEbTd0farNw+Y7n2xrNGRzhkkTPa8ppyMXeVg==
X-Received: by 2002:ac2:44a6:0:b0:4dd:9b6b:6b5b with SMTP id
 c6-20020ac244a6000000b004dd9b6b6b5bmr6239022lfm.16.1679306116142; 
 Mon, 20 Mar 2023 02:55:16 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:09 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-2-053d6ede831b@linaro.org>
References: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
In-Reply-To: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
To: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Richter <rric@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, 
 Srinivas Neeli <srinivas.neeli@xilinx.com>, 
 Michal Simek <michal.simek@xilinx.com>
X-Mailer: b4 0.12.1
Cc: Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] gpio: siox: Convert to immutable irq_chip
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

In this case I had to figure out a way to get to the
struct gpio_chip that would work even when the irq_chip
is not part of the driver state container. I did this by
just doing what most other GPIO drivers do and pass
the state struct as data to devm_gpiochip_add_data()
and rewrite accordingly.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-siox.c | 75 ++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index f8c5e9fc4bac..051bc99bdfb2 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -10,7 +10,6 @@
 
 struct gpio_siox_ddata {
 	struct gpio_chip gchip;
-	struct irq_chip ichip;
 	struct mutex lock;
 	u8 setdata[1];
 	u8 getdata[3];
@@ -97,9 +96,8 @@ static int gpio_siox_get_data(struct siox_device *sdevice, const u8 buf[])
 
 static void gpio_siox_irq_ack(struct irq_data *d)
 {
-	struct irq_chip *ic = irq_data_get_irq_chip(d);
-	struct gpio_siox_ddata *ddata =
-		container_of(ic, struct gpio_siox_ddata, ichip);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(gc);
 
 	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_status &= ~(1 << d->hwirq);
@@ -108,21 +106,21 @@ static void gpio_siox_irq_ack(struct irq_data *d)
 
 static void gpio_siox_irq_mask(struct irq_data *d)
 {
-	struct irq_chip *ic = irq_data_get_irq_chip(d);
-	struct gpio_siox_ddata *ddata =
-		container_of(ic, struct gpio_siox_ddata, ichip);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(gc);
 
 	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_enable &= ~(1 << d->hwirq);
 	raw_spin_unlock(&ddata->irqlock);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void gpio_siox_irq_unmask(struct irq_data *d)
 {
-	struct irq_chip *ic = irq_data_get_irq_chip(d);
-	struct gpio_siox_ddata *ddata =
-		container_of(ic, struct gpio_siox_ddata, ichip);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_enable |= 1 << d->hwirq;
 	raw_spin_unlock(&ddata->irqlock);
@@ -130,9 +128,8 @@ static void gpio_siox_irq_unmask(struct irq_data *d)
 
 static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
 {
-	struct irq_chip *ic = irq_data_get_irq_chip(d);
-	struct gpio_siox_ddata *ddata =
-		container_of(ic, struct gpio_siox_ddata, ichip);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(gc);
 
 	raw_spin_lock(&ddata->irqlock);
 	ddata->irq_type[d->hwirq] = type;
@@ -143,8 +140,7 @@ static int gpio_siox_irq_set_type(struct irq_data *d, u32 type)
 
 static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gpio_siox_ddata *ddata =
-		container_of(chip, struct gpio_siox_ddata, gchip);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	int ret;
 
 	mutex_lock(&ddata->lock);
@@ -167,8 +163,7 @@ static int gpio_siox_get(struct gpio_chip *chip, unsigned int offset)
 static void gpio_siox_set(struct gpio_chip *chip,
 			  unsigned int offset, int value)
 {
-	struct gpio_siox_ddata *ddata =
-		container_of(chip, struct gpio_siox_ddata, gchip);
+	struct gpio_siox_ddata *ddata = gpiochip_get_data(chip);
 	u8 mask = 1 << (19 - offset);
 
 	mutex_lock(&ddata->lock);
@@ -208,11 +203,22 @@ static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 		return GPIO_LINE_DIRECTION_OUT;
 }
 
+static const struct irq_chip gpio_siox_irq_chip = {
+	.name = "siox-gpio",
+	.irq_ack = gpio_siox_irq_ack,
+	.irq_mask = gpio_siox_irq_mask,
+	.irq_unmask = gpio_siox_irq_unmask,
+	.irq_set_type = gpio_siox_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int gpio_siox_probe(struct siox_device *sdevice)
 {
 	struct gpio_siox_ddata *ddata;
 	struct gpio_irq_chip *girq;
 	struct device *dev = &sdevice->dev;
+	struct gpio_chip *gc;
 	int ret;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
@@ -224,30 +230,25 @@ static int gpio_siox_probe(struct siox_device *sdevice)
 	mutex_init(&ddata->lock);
 	raw_spin_lock_init(&ddata->irqlock);
 
-	ddata->gchip.base = -1;
-	ddata->gchip.can_sleep = 1;
-	ddata->gchip.parent = dev;
-	ddata->gchip.owner = THIS_MODULE;
-	ddata->gchip.get = gpio_siox_get;
-	ddata->gchip.set = gpio_siox_set;
-	ddata->gchip.direction_input = gpio_siox_direction_input;
-	ddata->gchip.direction_output = gpio_siox_direction_output;
-	ddata->gchip.get_direction = gpio_siox_get_direction;
-	ddata->gchip.ngpio = 20;
-
-	ddata->ichip.name = "siox-gpio";
-	ddata->ichip.irq_ack = gpio_siox_irq_ack;
-	ddata->ichip.irq_mask = gpio_siox_irq_mask;
-	ddata->ichip.irq_unmask = gpio_siox_irq_unmask;
-	ddata->ichip.irq_set_type = gpio_siox_irq_set_type;
-
-	girq = &ddata->gchip.irq;
-	girq->chip = &ddata->ichip;
+	gc = &ddata->gchip;
+	gc->base = -1;
+	gc->can_sleep = 1;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->get = gpio_siox_get;
+	gc->set = gpio_siox_set;
+	gc->direction_input = gpio_siox_direction_input;
+	gc->direction_output = gpio_siox_direction_output;
+	gc->get_direction = gpio_siox_get_direction;
+	gc->ngpio = 20;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_siox_irq_chip);
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->threaded = true;
 
-	ret = devm_gpiochip_add_data(dev, &ddata->gchip, NULL);
+	ret = devm_gpiochip_add_data(dev, gc, ddata);
 	if (ret)
 		dev_err(dev, "Failed to register gpio chip (%d)\n", ret);
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
