Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE656C0DC5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D907C6A603;
	Mon, 20 Mar 2023 09:55:17 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75BCAC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bi9so14093600lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HAnQzgricg8Usxd+K390Bg6GFFRXEBuJfLaA0TdP+hw=;
 b=Lq7l5aeg8t6BBYbxGtC4sNU5S8fQuBBWobHnJIxj686s6RIddNS7y5zLxX+6jjMGVJ
 q8Np1dVHSXaDhxJexJ3Cja6w9ffPRDiUNb2OCSJjWDBk8iPYyzUx4mqlgiuxNGhbPTtW
 YgefU03E4fhoSdZAaNiHoKR5mnYkWlR3BKHnfv3+iy5d0VlNKlNoq94/wG1YS0LQJFvI
 iP3GQHkCA7ZHxNmQTsiY5N6CqU1lk5gzClIkEC/3IZNMZqhHeiQbRLgZrW+nHe80Qnak
 xmkD+VTW2eLGoVWT+mSMA5tyo3H4ysglh5BTU+FVTbIGQvvg5T111RiXWhyQ6HalDpq2
 BhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAnQzgricg8Usxd+K390Bg6GFFRXEBuJfLaA0TdP+hw=;
 b=F4EyyDqF4kCUff5PN5GMH8ZrrwfZf7+CfV9QPBom4CxUzFGawTpdA1x5vvuy5HDsTP
 5SJ2p2YxMkYadOjChMeJjc6vqH32syHS93uRgoT5JYZrd1gYzU3hk5TGfKqH0DFGMmVS
 3yUkpeCYSm89FFxjOpQ4HR0VO6jQi10YDNrqZmXrXpxyjhnxsUCBnlaIA3/WZMo7RT/l
 NaIMLGgglARxXPzBux1mpRsoAK6AKTcadxiMFpdhNcWSdG+BBhW0oF9jJ2CCtMI/NwYD
 6rF89jtP8+zJSiGa6uy6FxyTRpwX7tZqG3FYg0zdA7fcWhWZRmxFulzD8pIUMJDzPpXk
 k43Q==
X-Gm-Message-State: AO0yUKXpCsU7lWFdKC48MH/zdEdWlOYp9YChW35CnZaMdZbLZ67XfxdV
 ii4FJg+XyqB/2mhe0qNtcF2D9Q==
X-Google-Smtp-Source: AK7set8JyDN20awY9sNno52xF2TVH9J+MI/F8E9hCCxP2/SGPM7w1IlrEkTA+cYgLhq2Sf4h86VGVA==
X-Received: by 2002:ac2:44ab:0:b0:4de:d16f:3938 with SMTP id
 c11-20020ac244ab000000b004ded16f3938mr7279084lfm.53.1679306115099; 
 Mon, 20 Mar 2023 02:55:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:08 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-1-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 1/9] gpio: rda: Convert to immutable irq_chip
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
 drivers/gpio/gpio-rda.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 62ba18b3a602..dd568907d389 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -38,7 +38,6 @@ struct rda_gpio {
 	struct gpio_chip chip;
 	void __iomem *base;
 	spinlock_t lock;
-	struct irq_chip irq_chip;
 	int irq;
 };
 
@@ -74,6 +73,7 @@ static void rda_gpio_irq_mask(struct irq_data *data)
 	value |= BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
 
 	writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
+	gpiochip_disable_irq(chip, offset);
 }
 
 static void rda_gpio_irq_ack(struct irq_data *data)
@@ -154,6 +154,7 @@ static void rda_gpio_irq_unmask(struct irq_data *data)
 	u32 offset = irqd_to_hwirq(data);
 	u32 trigger = irqd_get_trigger_type(data);
 
+	gpiochip_enable_irq(chip, offset);
 	rda_gpio_set_irq(chip, offset, trigger);
 }
 
@@ -195,6 +196,16 @@ static void rda_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static const struct irq_chip rda_gpio_irq_chip = {
+	.name = "rda-gpio",
+	.irq_ack = rda_gpio_irq_ack,
+	.irq_mask = rda_gpio_irq_mask,
+	.irq_unmask = rda_gpio_irq_unmask,
+	.irq_set_type = rda_gpio_irq_set_type,
+	.flags = IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int rda_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -241,15 +252,8 @@ static int rda_gpio_probe(struct platform_device *pdev)
 	rda_gpio->chip.base = -1;
 
 	if (rda_gpio->irq >= 0) {
-		rda_gpio->irq_chip.name = "rda-gpio",
-		rda_gpio->irq_chip.irq_ack = rda_gpio_irq_ack,
-		rda_gpio->irq_chip.irq_mask = rda_gpio_irq_mask,
-		rda_gpio->irq_chip.irq_unmask = rda_gpio_irq_unmask,
-		rda_gpio->irq_chip.irq_set_type = rda_gpio_irq_set_type,
-		rda_gpio->irq_chip.flags = IRQCHIP_SKIP_SET_WAKE,
-
 		girq = &rda_gpio->chip.irq;
-		girq->chip = &rda_gpio->irq_chip;
+		gpio_irq_chip_set_chip(girq, &rda_gpio_irq_chip);
 		girq->handler = handle_bad_irq;
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->parent_handler = rda_gpio_irq_handler;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
