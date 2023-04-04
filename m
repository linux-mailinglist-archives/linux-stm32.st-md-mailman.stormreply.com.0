Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 983396D5C23
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64904C6A61A;
	Tue,  4 Apr 2023 09:43:16 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 563FBC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:15 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id g19so28496691lfr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
 b=ICxJ7YUe4hMVhguFvpnF1aY1g2Xg4mx4cDsI89BJpwkDMlqLi6qFs0qAm1gH1e7IVc
 H9O3qmNc5Yl380YTtScMkdC5MjYUVycM0Bb98+MNi+509Acfjw7PXF5zmVlmcPvVwWo1
 VSzvfDsF84XJxs79RETY7OSH6rXLO09va/3ONasKuU5gpMrlOEgtpmSU9I3aKMf9hlEZ
 MtI45uH3axyfhRJyE9oc9alpGa86BWOR2IXEDjISPQDnFE2IlXgfA0jpOdqvLwkpHCWf
 /WUJD9ayL7tzb2YqWLxpKOysDqLIUBDz39ffyaPdXGSmgnq+rp9f7iKgRfaZBtCqKQ9z
 kB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvdTyVfTrmaDBV4ot+H/Nt1e4zaa23404aJu9Xqb7mA=;
 b=2U0kc4eLFH/1ZxblrK31NaL+gZa432feOIZwnYDRIdk3hYUjKXCzGE6MoBRjzVzu/P
 clwIht11XFkJphkEUN94D0IYlqEBMXGSgSLr+r8du0mskmQbkVoKbcPC7mDHJr9WGHI5
 EKQy1030PTL4QXlXIRziQQ6eplAWB4dmf52kidQOg1Ia9x1AG96Gr7f4kz0+sBmG9cvs
 qkSH6zZbwS1P+5RuKE3MIh2iod0uEU+6jotQi4kAIUyeNxlhBxTgtOVRy4rDRbAiotTR
 knK5MHenhGdBAyetxzl+P4KOcDkTQe0ZP2nSVTNKeJ6fdphIvMCs+7JmoiVaQqrXiay9
 Y4BQ==
X-Gm-Message-State: AAQBX9dp+6+wd8x9/TKtf7pQTjfQgnbbdj0i6ZKYJFrMQvQpHcRfAC1d
 LMk+gEyJ2qoU89x7aP7KTyZJkg==
X-Google-Smtp-Source: AKy350aeLsqesUsg+RRQuKpGDi2+iTAe42ueN49XS6nl4LpQF3DdNJ5O0KERzFnZGDFb/T4668h+8A==
X-Received: by 2002:a05:6512:38c2:b0:4dd:cb1d:b3cc with SMTP id
 p2-20020a05651238c200b004ddcb1db3ccmr446350lft.11.1680601394784; 
 Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:07 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-5-503788a7f6e6@linaro.org>
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
Subject: [Linux-stm32] [PATCH 5/9] pinctrl: equilibrium: Convert to
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
 drivers/pinctrl/pinctrl-equilibrium.c | 22 ++++++++++++++--------
 drivers/pinctrl/pinctrl-equilibrium.h |  2 --
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 99cf24eb67ae..5b5ddf7e5d0e 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -32,6 +32,7 @@ static void eqbr_gpio_disable_irq(struct irq_data *d)
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNENCLR);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
+	gpiochip_disable_irq(gc, offset);
 }
 
 static void eqbr_gpio_enable_irq(struct irq_data *d)
@@ -42,6 +43,7 @@ static void eqbr_gpio_enable_irq(struct irq_data *d)
 	unsigned long flags;
 
 	gc->direction_input(gc, offset);
+	gpiochip_enable_irq(gc, offset);
 	raw_spin_lock_irqsave(&gctrl->lock, flags);
 	writel(BIT(offset), gctrl->membase + GPIO_IRNRNSET);
 	raw_spin_unlock_irqrestore(&gctrl->lock, flags);
@@ -161,6 +163,17 @@ static void eqbr_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static const struct irq_chip eqbr_irq_chip = {
+	.name = "gpio_irq",
+	.irq_mask = eqbr_gpio_disable_irq,
+	.irq_unmask = eqbr_gpio_enable_irq,
+	.irq_ack = eqbr_gpio_ack_irq,
+	.irq_mask_ack = eqbr_gpio_mask_ack_irq,
+	.irq_set_type = eqbr_gpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 {
 	struct gpio_irq_chip *girq;
@@ -176,15 +189,8 @@ static int gpiochip_setup(struct device *dev, struct eqbr_gpio_ctrl *gctrl)
 		return 0;
 	}
 
-	gctrl->ic.name = "gpio_irq";
-	gctrl->ic.irq_mask = eqbr_gpio_disable_irq;
-	gctrl->ic.irq_unmask = eqbr_gpio_enable_irq;
-	gctrl->ic.irq_ack = eqbr_gpio_ack_irq;
-	gctrl->ic.irq_mask_ack = eqbr_gpio_mask_ack_irq;
-	gctrl->ic.irq_set_type = eqbr_gpio_set_irq_type;
-
 	girq = &gctrl->chip.irq;
-	girq->chip = &gctrl->ic;
+	gpio_irq_chip_set_chip(girq, &eqbr_irq_chip);
 	girq->parent_handler = eqbr_irq_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents), GFP_KERNEL);
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 0c635a5b79f0..83768cc8b3db 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -103,7 +103,6 @@ struct fwnode_handle;
  * @fwnode: firmware node of gpio controller.
  * @bank: pointer to corresponding pin bank.
  * @membase: base address of the gpio controller.
- * @ic:   irq chip.
  * @name: gpio chip name.
  * @virq: irq number of the gpio chip to parent's irq domain.
  * @lock: spin lock to protect gpio register write.
@@ -113,7 +112,6 @@ struct eqbr_gpio_ctrl {
 	struct fwnode_handle	*fwnode;
 	struct eqbr_pin_bank	*bank;
 	void __iomem		*membase;
-	struct irq_chip		ic;
 	const char		*name;
 	unsigned int		virq;
 	raw_spinlock_t		lock; /* protect gpio register */

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
