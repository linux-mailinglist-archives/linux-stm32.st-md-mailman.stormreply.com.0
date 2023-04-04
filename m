Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F86D5C26
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FA62C6A61C;
	Tue,  4 Apr 2023 09:43:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7907C6A61C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:17 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id g17so41623958lfv.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MNYdQtD12ErxW9Tb9ALuTo8L9TpmlxX4Klxpk5H7jnk=;
 b=jYDIjklTKr8Cj1T9VYHcmDrIMw8h/xDvQ8AMsEyXG+GrHhNO6IT9GJzRVnpgvE4yOr
 bQ0iZBI8TaAJOXFbpWzOtgJL6eO+DTNoYJoUFm1SpNwJRbx4KIdU7BzH5hvCEIQROCfV
 UO7TGmAGOtDwu2qtnobq3CJ12F7/QAEvf9COV1OTAtdZvsQ9njcN3WU1ziJ2Tlk6Hbyv
 DdSrZZcOGKQvQVaF/j5ZLtSOL01ixH6Jb0wKyxDe9LegyLQ/2P6VG5YtKct2uf4iAp3B
 6y8YnqYVJX/tsuFKs/z1r9qs7y/ylL6o40MaYO4Cg+S0mBerit+PSnXLxbzR2a9eNyVi
 l1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNYdQtD12ErxW9Tb9ALuTo8L9TpmlxX4Klxpk5H7jnk=;
 b=W0tnpbezqFOUG7QUsUK3HMFxhQWsXuAoCG0/Wxk8UOBu0OTwZuFQWO3nXv7yj9FC74
 8PhU3AYw3H01WhtL/RtU3bcadJPGSdfLfsg5ngP0nOFfYpU8KI8HTmZqK+Z0d57OIXae
 kADTsr2aEoUIeXA4uiD6Is1D4D0YhPnp45UG+9ebC0raG11khy5xMVxHNh6GVNMsBTl6
 9bPuGpHATn+UuZReulJERbdlAUdTqAwqpbOa1+ZH4joZy0JjG1PnGKHAtrIBjb9vYIdw
 LOylbX7zUddzu2La7ZW8RoSlsVvtTE5TKYIdeSrXTrn/uy68eM+a/v5IF9rmw5TcXY8p
 lAKg==
X-Gm-Message-State: AAQBX9fsl0IIQY0nLP/UySW3WPRBt4wuGfMmDO1TPYmalYuH4Hhz1W1Q
 I7n1rByf4zHuCqL0pFTBBpgGCA==
X-Google-Smtp-Source: AKy350aGvdFi+RZKjqDDMQzvmBaZ/OiWcvh3hUJR1pdqaSXWZoxf8OpalMpYOO2vxe4OeQZKqKjv7g==
X-Received: by 2002:ac2:43a5:0:b0:4b0:2a2f:ea6d with SMTP id
 t5-20020ac243a5000000b004b02a2fea6dmr444334lfl.35.1680601397119; 
 Tue, 04 Apr 2023 02:43:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:09 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-7-503788a7f6e6@linaro.org>
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
Subject: [Linux-stm32] [PATCH 7/9] pinctrl: st: Convert to immutable irq_chip
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

I switched to using irqd_to_hwirq() consistently while we
are at it.

This driver does not use the GPIOCHIP_IRQ_RESOURCE_HELPERS
as it defines its own resource reservations, simply in
order to turn IRQ lines into inputs on initialization.

Also switched the open coded calls to gpiochip_lock_as_irq()
to gpiochip_reqres_irq() so we also get the right module
reference counting.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 1409339f0279..c1f36b164ea5 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1313,7 +1313,8 @@ static void st_gpio_irq_mask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
-	writel(BIT(d->hwirq), bank->base + REG_PIO_CLR_PMASK);
+	writel(BIT(irqd_to_hwirq(d)), bank->base + REG_PIO_CLR_PMASK);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void st_gpio_irq_unmask(struct irq_data *d)
@@ -1321,7 +1322,8 @@ static void st_gpio_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
-	writel(BIT(d->hwirq), bank->base + REG_PIO_SET_PMASK);
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	writel(BIT(irqd_to_hwirq(d)), bank->base + REG_PIO_SET_PMASK);
 }
 
 static int st_gpio_irq_request_resources(struct irq_data *d)
@@ -1330,14 +1332,14 @@ static int st_gpio_irq_request_resources(struct irq_data *d)
 
 	st_gpio_direction_input(gc, d->hwirq);
 
-	return gpiochip_lock_as_irq(gc, d->hwirq);
+	return gpiochip_reqres_irq(gc, d->hwirq);
 }
 
 static void st_gpio_irq_release_resources(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	gpiochip_unlock_as_irq(gc, d->hwirq);
+	gpiochip_relres_irq(gc, d->hwirq);
 }
 
 static int st_gpio_irq_set_type(struct irq_data *d, unsigned type)
@@ -1492,7 +1494,7 @@ static const struct gpio_chip st_gpio_template = {
 	.ngpio			= ST_GPIO_PINS_PER_BANK,
 };
 
-static struct irq_chip st_gpio_irqchip = {
+static const struct irq_chip st_gpio_irqchip = {
 	.name			= "GPIO",
 	.irq_request_resources	= st_gpio_irq_request_resources,
 	.irq_release_resources	= st_gpio_irq_release_resources,
@@ -1500,7 +1502,7 @@ static struct irq_chip st_gpio_irqchip = {
 	.irq_mask		= st_gpio_irq_mask,
 	.irq_unmask		= st_gpio_irq_unmask,
 	.irq_set_type		= st_gpio_irq_set_type,
-	.flags			= IRQCHIP_SKIP_SET_WAKE,
+	.flags			= IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
 };
 
 static int st_gpiolib_register_bank(struct st_pinctrl *info,
@@ -1570,7 +1572,7 @@ static int st_gpiolib_register_bank(struct st_pinctrl *info,
 		}
 
 		girq = &bank->gpio_chip.irq;
-		girq->chip = &st_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &st_gpio_irqchip);
 		girq->parent_handler = st_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
