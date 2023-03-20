Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E716C0DCF
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF8FC6A60B;
	Mon, 20 Mar 2023 09:55:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ADE2C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:24 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id h25so2456234lfv.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306123;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cSpuqjy/eXDpqnKiK4OUOR7RpMUVN5QXd0K9J1nI3tU=;
 b=Ph9IxB/K1MagKuPpYcNTHdd1a0iCrw+L76Vhq2MD2jW8DA+dF0oUzJH2YUzr2HqIjB
 yLqqO7Ju5f+zqKibHuUfbPuUwD6+dseaWQ4FBN9f1G3CyOhRPUnm3UaLAQyI4lR/Qv9H
 +5mTs+wlfZvAXRjf0dovMN01lsNZd+l86pcj2o7gaunZ+uNHm0+viVKVdxSiLn9mVSEv
 mG1vifHHT4awWvocEkbiYrMIcgJUa6eu0av+kMiltzYOWC1VjQdjk5qTR3aBZ56I7g3u
 3UHfCMgukj6UI4cTDyj27WstwX5M3XMSCyX9suaMYfSNLZthYMDI+QKbCEw6E5deGByT
 nBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306123;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cSpuqjy/eXDpqnKiK4OUOR7RpMUVN5QXd0K9J1nI3tU=;
 b=vD5jqdqc1CBDwi7DrrpM5pwW5+u+Dgya2oHVRfnGjXj1CmIyNap8R0TN2S10qAfTft
 a4MsO6YoUqXrc5q8O51mbBEMqoQYAw7vxJ391B/vcRJDxNmdCJ89ZwCSYPVwBk2w8emh
 Ms6EeSQF+NYdg6fCqYPoC1tHT9Yfpcnb9NmQ44sgs7eaIueUFnD2++U5otZv6ZdQyrhk
 tXKypPEAHZw/udWplOYBpFkmSX/IBGa2crqtp5muUf6yXJav/hxU8ecWYsdwQpm4775s
 EXxpecBhp5EucZrWFb4SduoX4dPYiQFkiTxKzINRb3nZmjuH4RPnseSdNpxnJbTM3Je3
 ziCw==
X-Gm-Message-State: AO0yUKXeH1rznjjSN33Hy94YBee89r7qbNziYH7549H9bUI3CGuTVx5G
 VvwM6UafoZHgb1qMhM1O9200UQ==
X-Google-Smtp-Source: AK7set9zCyds0/IWFURuPSlfwVn1evNIdob22STjDDPktgt7NQqrIX1sEnshSNWw8CLlQTzfPolMVw==
X-Received: by 2002:ac2:52b5:0:b0:4b6:fddc:1fcd with SMTP id
 r21-20020ac252b5000000b004b6fddc1fcdmr3649099lfm.23.1679306123693; 
 Mon, 20 Mar 2023 02:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:23 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:16 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-9-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 9/9] gpio: xlp: Convert to immutable irq_chip
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

In this case the driver uses .mask_ack() and .unmask()
and since I have a vague idea about the semantics of
.mask_ack() I added .irq_enable() to the existing .irq_disable()
and called into the gpiolib core from those callbacks
instead of mask/unmask.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xlp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 0199f545335f..b4b52213bcd9 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -90,6 +90,13 @@ static void xlp_gpio_set_reg(void __iomem *addr, unsigned gpio, int state)
 	writel(value, addr + regset);
 }
 
+static void xlp_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+}
+
 static void xlp_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc  = irq_data_get_irq_chip_data(d);
@@ -100,6 +107,7 @@ static void xlp_gpio_irq_disable(struct irq_data *d)
 	xlp_gpio_set_reg(priv->gpio_intr_en, d->hwirq, 0x0);
 	__clear_bit(d->hwirq, priv->gpio_enabled_mask);
 	spin_unlock_irqrestore(&priv->lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void xlp_gpio_irq_mask_ack(struct irq_data *d)
@@ -163,10 +171,12 @@ static int xlp_gpio_set_irq_type(struct irq_data *d, unsigned int type)
 static struct irq_chip xlp_gpio_irq_chip = {
 	.name		= "XLP-GPIO",
 	.irq_mask_ack	= xlp_gpio_irq_mask_ack,
+	.irq_enable	= xlp_gpio_irq_enable,
 	.irq_disable	= xlp_gpio_irq_disable,
 	.irq_set_type	= xlp_gpio_set_irq_type,
 	.irq_unmask	= xlp_gpio_irq_unmask,
-	.flags		= IRQCHIP_ONESHOT_SAFE,
+	.flags		= IRQCHIP_ONESHOT_SAFE | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void xlp_gpio_generic_handler(struct irq_desc *desc)
@@ -272,7 +282,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->lock);
 
 	girq = &gc->irq;
-	girq->chip = &xlp_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &xlp_gpio_irq_chip);
 	girq->parent_handler = xlp_gpio_generic_handler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
