Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 907506D5C20
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56EE6C6A61B;
	Tue,  4 Apr 2023 09:43:15 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E33C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:14 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x17so41651096lfu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
 b=VMkSf/30AORqPOlLZAvb5ejw7HZDEOIFzuFDKLf8ZeDEbmAan3qaO3LYScbQc9IBrD
 z3KNKoxPvP9VCHdV5C1q+HqWqDfxyxemBOlop94fOEmJJAqCmY0oOVPnFBk/nPhvPtlD
 05cg/JC4v30mUyeoMFa3DQ6+i5PU3zMgNTANV7m80Kypa8rJcPZdaNVj3Clv+EbQyGmv
 20gkxiqQIEK12gDQhJezK2Wcd1NquYFNF6ihh9EykeA70XyhRIhFy+LA8cGAM1Xw96Hv
 c/pB1pihxmAgDsslQ7maLWBZQr3ZHcuEuY1ABY9GS6J6GKEhEMqQyUCBCfLTQXiMlf+F
 QDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MyI3cyYnrYsvyUY9zGwb5dqwePkLtUbYm7n0o21VTww=;
 b=jgXfdSHQOUDYWhQQaaryZP3GVDt66aSuHeH8MsP9je2QiOmRGl9LJaNmO+ifW0pxGx
 WyBUGiATPehzsZsA7OOqDWFdXcON0USBEX8RqWP0LGMZ6SgvPbTh92VdhQFXklGpCnJa
 gBHa9KWMpSi+IGO3A2rIgGjj24tfQkufSQBxGzD9YMecvwTKseWh9U7AjEXOiCAotMBf
 ioQz1YVXiSeotiOfQJr5fvbId3sQK4cQ8gBEQjWfE0O0eg01ttG0e6tNawATmZZsiVPc
 0342FMm+dCRCacybGL59ovl1bzvjZ2tSjO2kANSiak8MA8xG4d0UH4OdebboJOULvx67
 ozhQ==
X-Gm-Message-State: AAQBX9eOVACWv7tdDT2PvBUCUMW/X1jcGRDq+MLisUMRdYZASREvXYQS
 SKTHzsH3XUZTYanzlehYuWet3Q==
X-Google-Smtp-Source: AKy350bAzs+k3GfXqrHrUh46WUwBaaa8Kv09rrmTTSTImYh5z6/205iT1zyUw8YZhG01/6vEVWpsVQ==
X-Received: by 2002:ac2:4422:0:b0:4cc:73ff:579a with SMTP id
 w2-20020ac24422000000b004cc73ff579amr549570lfl.38.1680601393741; 
 Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:06 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-4-503788a7f6e6@linaro.org>
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
Subject: [Linux-stm32] [PATCH 4/9] pinctrl: npcm7xx: Convert to immutable
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

I refactored the way the state container was accessed in
the irq_chip callbacks to all look the same and switch to
use irqd_to_hwirq() while we are at it.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index ff5bcea172e8..05d39f9111c2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -82,7 +82,6 @@ struct npcm7xx_gpio {
 	struct gpio_chip	gc;
 	int			irqbase;
 	int			irq;
-	struct irq_chip		irq_chip;
 	u32			pinctrl_id;
 	int (*direction_input)(struct gpio_chip *chip, unsigned int offset);
 	int (*direction_output)(struct gpio_chip *chip, unsigned int offset,
@@ -240,9 +239,9 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 
 static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = BIT(d->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = BIT(irqd_to_hwirq(d));
 
 	dev_dbg(bank->gc.parent, "setirqtype: %u.%u = %u\n", gpio,
 		d->irq, type);
@@ -288,9 +287,9 @@ static int npcmgpio_set_irq_type(struct irq_data *d, unsigned int type)
 
 static void npcmgpio_irq_ack(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	dev_dbg(bank->gc.parent, "irq_ack: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVST);
@@ -299,23 +298,25 @@ static void npcmgpio_irq_ack(struct irq_data *d)
 /* Disable GPIO interrupt */
 static void npcmgpio_irq_mask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Clear events */
 	dev_dbg(bank->gc.parent, "irq_mask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENC);
+	gpiochip_disable_irq(gc, gpio);
 }
 
 /* Enable GPIO interrupt */
 static void npcmgpio_irq_unmask(struct irq_data *d)
 {
-	struct npcm7xx_gpio *bank =
-		gpiochip_get_data(irq_data_get_irq_chip_data(d));
-	unsigned int gpio = d->hwirq;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct npcm7xx_gpio *bank = gpiochip_get_data(gc);
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* Enable events */
+	gpiochip_enable_irq(gc, gpio);
 	dev_dbg(bank->gc.parent, "irq_unmask: %u.%u\n", gpio, d->irq);
 	iowrite32(BIT(gpio), bank->base + NPCM7XX_GP_N_EVENS);
 }
@@ -323,7 +324,7 @@ static void npcmgpio_irq_unmask(struct irq_data *d)
 static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	unsigned int gpio = d->hwirq;
+	unsigned int gpio = irqd_to_hwirq(d);
 
 	/* active-high, input, clear interrupt, enable interrupt */
 	dev_dbg(gc->parent, "startup: %u.%u\n", gpio, d->irq);
@@ -341,6 +342,8 @@ static const struct irq_chip npcmgpio_irqchip = {
 	.irq_mask = npcmgpio_irq_mask,
 	.irq_set_type = npcmgpio_set_irq_type,
 	.irq_startup = npcmgpio_irq_startup,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 /* pinmux handing in the pinctrl driver*/
@@ -1906,7 +1909,6 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return -EINVAL;
 		}
 		pctrl->gpio_bank[id].irq = ret;
-		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
 		pctrl->gpio_bank[id].gc.base = args.args[1];
@@ -1941,7 +1943,7 @@ static int npcm7xx_gpio_register(struct npcm7xx_pinctrl *pctrl)
 		struct gpio_irq_chip *girq;
 
 		girq = &pctrl->gpio_bank[id].gc.irq;
-		girq->chip = &pctrl->gpio_bank[id].irq_chip;
+		gpio_irq_chip_set_chip(girq, &npcmgpio_irqchip);
 		girq->parent_handler = npcmgpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(pctrl->dev, 1,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
