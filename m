Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D46D5C1F
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47267C6A61C;
	Tue,  4 Apr 2023 09:43:14 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2B1AC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:12 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y20so41657210lfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OEIEuBxKK8j0WCwoJQ18kuVBxSDA3HKgR75PLHwlYjY=;
 b=QUgnZEVbU8qkLDF2ntyTZYUEn81xMGQMTF+In3pJjOtoHeA+wHfgBjiPJd3SQo2ubS
 EdNjEPTsTPejVfxjcQyDuBp9bw6lcgMwOYJ0hzaw94espyf5V34EXkl/ZpBlcv3D9D83
 +0V2+XrzqywGLnbVfh9drT5aX/q5V4zCL36sADRuJeqAfcn/NLlq8m4DdSrZY3wG0Zi/
 q8FBEDa9RQuvXQZ0GWlpOlmM6ZZK4U1qYzUppqfAYv14x6YsE1Ip3xn/3V6DSPeA1aCF
 FhyY2tH7hm6RIvEb2q12iB15E5zC2jQ355mxMbjoyJAliFKlrL3/5gyw+cCOHZfsai7x
 J1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEIEuBxKK8j0WCwoJQ18kuVBxSDA3HKgR75PLHwlYjY=;
 b=FAB8otPtO7I0mcNIx2d5qWQA+Uduw9ypMU2IQ/FIVPxyEAE0O4h/0v+1hU1xOt7noS
 zNjnKQVFdM1Jku6hxogScZYsrbbMeRn/ooSzI7JgmJ0kYdqIvWgLZlJjWRMvvDib7Zql
 qxExppUB0VU9xrRUpd7l0mypcnj5OUffuESrWRt6UPifZjSLcIchI9/pF6JRy3PYBUT/
 zqfKgbqEozsP506y+M0dS9NvCnwHdnGr2uOuRFI4mmrbtI75hunUVCZU+DIiOM5gs08E
 TJYmTEOQ1DjAQGqu94bDU6Im6K1ofnwWnkELunH47/C9dS/c7D+FT3fM0cvq+NyZh7rF
 aSyA==
X-Gm-Message-State: AAQBX9cluVE4VVwK9Lj5PxkqvOADzkXGD870ITEN0SH4VrVWxvWU0UVw
 PTY6yfKlzFeiEzkz8/DR39voqg==
X-Google-Smtp-Source: AKy350Y1n4D3ouEbNQ+64kQoJU+ffHbBrLRRh0g8NH1+mtywafqluhvvLZ5sB6bllrfgJQ3/14bcqQ==
X-Received: by 2002:a19:ad04:0:b0:4cb:4362:381d with SMTP id
 t4-20020a19ad04000000b004cb4362381dmr457830lfc.62.1680601392722; 
 Tue, 04 Apr 2023 02:43:12 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:05 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-3-503788a7f6e6@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/9] pinctrl: armada-37xx: Convert to
	immutable irq_chip
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

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 34 ++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 261b46841b9f..67c6751a6f06 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
 
@@ -101,7 +102,6 @@ struct armada_37xx_pinctrl {
 	const struct armada_37xx_pin_data	*data;
 	struct device			*dev;
 	struct gpio_chip		gpio_chip;
-	struct irq_chip			irq_chip;
 	raw_spinlock_t			irq_lock;
 	struct pinctrl_desc		pctl;
 	struct pinctrl_dev		*pctl_dev;
@@ -548,6 +548,7 @@ static void armada_37xx_irq_mask(struct irq_data *d)
 	val = readl(info->base + reg);
 	writel(val & ~d->mask, info->base + reg);
 	raw_spin_unlock_irqrestore(&info->irq_lock, flags);
+	gpiochip_disable_irq(chip, irqd_to_hwirq(d));
 }
 
 static void armada_37xx_irq_unmask(struct irq_data *d)
@@ -557,6 +558,7 @@ static void armada_37xx_irq_unmask(struct irq_data *d)
 	u32 val, reg = IRQ_EN;
 	unsigned long flags;
 
+	gpiochip_enable_irq(chip, irqd_to_hwirq(d));
 	armada_37xx_irq_update_reg(&reg, d);
 	raw_spin_lock_irqsave(&info->irq_lock, flags);
 	val = readl(info->base + reg);
@@ -729,11 +731,30 @@ static unsigned int armada_37xx_irq_startup(struct irq_data *d)
 	return 0;
 }
 
+static void armada_37xx_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
+
+	seq_printf(p, info->data->name);
+}
+
+static const struct irq_chip armada_37xx_irqchip = {
+	.irq_ack = armada_37xx_irq_ack,
+	.irq_mask = armada_37xx_irq_mask,
+	.irq_unmask = armada_37xx_irq_unmask,
+	.irq_set_wake = armada_37xx_irq_set_wake,
+	.irq_set_type = armada_37xx_irq_set_type,
+	.irq_startup = armada_37xx_irq_startup,
+	.irq_print_chip = armada_37xx_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int armada_37xx_irqchip_register(struct platform_device *pdev,
 					struct armada_37xx_pinctrl *info)
 {
 	struct gpio_chip *gc = &info->gpio_chip;
-	struct irq_chip *irqchip = &info->irq_chip;
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device_node *np = to_of_node(gc->fwnode);
 	struct device *dev = &pdev->dev;
@@ -751,14 +772,7 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	if (IS_ERR(info->base))
 		return PTR_ERR(info->base);
 
-	irqchip->irq_ack = armada_37xx_irq_ack;
-	irqchip->irq_mask = armada_37xx_irq_mask;
-	irqchip->irq_unmask = armada_37xx_irq_unmask;
-	irqchip->irq_set_wake = armada_37xx_irq_set_wake;
-	irqchip->irq_set_type = armada_37xx_irq_set_type;
-	irqchip->irq_startup = armada_37xx_irq_startup;
-	irqchip->name = info->data->name;
-	girq->chip = irqchip;
+	gpio_irq_chip_set_chip(girq, &armada_37xx_irqchip);
 	girq->parent_handler = armada_37xx_irq_handler;
 	/*
 	 * Many interrupts are connected to the parent interrupt

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
