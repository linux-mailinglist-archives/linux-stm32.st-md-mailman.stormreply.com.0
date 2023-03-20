Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BA6C0DCD
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEFC0C6A612;
	Mon, 20 Mar 2023 09:55:23 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 412ACC6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:22 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id k37so1179791lfv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306121;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IQ8pDJ544LSAcFuKnZ1WqdUejeWGxtlm1VYmzzGBmgw=;
 b=lyJ+w0kp8l+cELb9UDJarzOUReNGbayK9wKZjJTyeWN91AK8i7Ojx1/+8902eHM++O
 9kF6KgWPr4bGDOvASkQQQ9H3Zmhv4qhTLYtfiLOOSJb+BuYd0RzL6B6g5MCVkqry2pkY
 TPZ9pMkcsEiWJyhR4BpfK8oE+pVkByFq5vPia5YqQMtmxXWrDekt/7CFGcEI0DfOzoJ4
 G3VTorPbaI1mBds+GzA7oerrUJKn7s/A0Oro1yOATwLbZ5MeDgM0Go+6GkqQgitIoYjg
 wEf1P1C9RBs5vanaRf2Fi7fyRDhAL0LJH2JrY3zV6i5A55/249WVxszwS96+eAqG0Y6F
 MyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306121;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQ8pDJ544LSAcFuKnZ1WqdUejeWGxtlm1VYmzzGBmgw=;
 b=Jx9PhZ3yClvDSFglH8REnOZKcUYYRmEdL3q3xblmB1QxItw5vonxdLRXJOXc+5joDH
 JkWq7+QLfDugdBekXIcjEEvIQEOO+CGYSEdqFm62RtahJ0pZ/VZnTGTxMl4lbfhSNt4M
 /XoszL7N2yNuC5xYiptmGh8cl1gDRWYBxnHvPtsikF7CXAI+RkMMVewihykQedXs4x9v
 mH5xkyndmdEYmeWKZJiNiVnYYYdk2ObnWLleMT4oc+ClT20d+cYqMep353y380jpMgUn
 KnilR8VVo6buh13TRcyR1HAEZcj20jiW9jklJbmAWwrrujJe+yNFARrT9N9Dwh5Tn9iD
 msTw==
X-Gm-Message-State: AO0yUKUnKxsY+PdcrDow4zfh87x5Pk9U/GMF09DGN29GgeOZ7CoBqBX4
 cO4G1PzGu29/nQez1jPtSqzTxQ==
X-Google-Smtp-Source: AK7set8WWtoMKppI+gZFwXPhBIrBDDyJUehoQ6BHpQ5qn6bNbMVaZKAx+l1kC81jShZDQeZAH3pMmA==
X-Received: by 2002:ac2:4142:0:b0:4dd:a445:e69d with SMTP id
 c2-20020ac24142000000b004dda445e69dmr5657173lfi.26.1679306121600; 
 Mon, 20 Mar 2023 02:55:21 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:21 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:14 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-7-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 7/9] gpio: xgs-iproc: Convert to immutable
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

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xgs-iproc.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index fd88500399c6..2d23b27d55af 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 
 #define IPROC_CCA_INT_F_GPIOINT		BIT(0)
@@ -27,7 +28,6 @@
 #define IPROC_GPIO_CCA_INT_EDGE		0x24
 
 struct iproc_gpio_chip {
-	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	spinlock_t lock;
 	struct device *dev;
@@ -69,6 +69,7 @@ static void iproc_gpio_irq_unmask(struct irq_data *d)
 	u32 irq = d->irq;
 	u32 int_mask, irq_type, event_mask;
 
+	gpiochip_enable_irq(gc, pin);
 	spin_lock_irqsave(&chip->lock, flags);
 	irq_type = irq_get_trigger_type(irq);
 	event_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
@@ -110,6 +111,7 @@ static void iproc_gpio_irq_mask(struct irq_data *d)
 			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
 	}
 	spin_unlock_irqrestore(&chip->lock, flags);
+	gpiochip_disable_irq(gc, pin);
 }
 
 static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
@@ -191,6 +193,24 @@ static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
 	return int_bits ? IRQ_HANDLED : IRQ_NONE;
 }
 
+static void iproc_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
+
+	seq_printf(p, dev_name(chip->dev));
+}
+
+static const struct irq_chip iproc_gpio_irq_chip = {
+	.irq_ack = iproc_gpio_irq_ack,
+	.irq_mask = iproc_gpio_irq_mask,
+	.irq_unmask = iproc_gpio_irq_unmask,
+	.irq_set_type = iproc_gpio_irq_set_type,
+	.irq_print_chip = iproc_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int iproc_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -230,16 +250,8 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
-		struct irq_chip *irqc;
 		u32 val;
 
-		irqc = &chip->irqchip;
-		irqc->name = dev_name(dev);
-		irqc->irq_ack = iproc_gpio_irq_ack;
-		irqc->irq_mask = iproc_gpio_irq_mask;
-		irqc->irq_unmask = iproc_gpio_irq_unmask;
-		irqc->irq_set_type = iproc_gpio_irq_set_type;
-
 		chip->intr = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(chip->intr))
 			return PTR_ERR(chip->intr);
@@ -261,7 +273,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		}
 
 		girq = &chip->gc.irq;
-		girq->chip = irqc;
+		gpio_irq_chip_set_chip(girq, &iproc_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
