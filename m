Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161946C0DCE
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0F84C6A602;
	Mon, 20 Mar 2023 09:55:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41B4DC6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:23 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id y15so14112292lfa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ONs8hu4DakRq6Eq9QQk6sVabt3pk1jUGku2e96eNaoc=;
 b=aOazW7qyLg8EFAxpfusMynHT4aR5dT28i5YmCDy2aNE49eIk4P+GQ36cGYKN769CRr
 8MkfV47LsZ80x+/3fpq0B+lMRPiab+22V/Z6LIGq14vI7NkNTumNzLDvAegjlBKrKiED
 CHMcfcXyEZuYYPSJNKR3mketsbGFofKCVw2uSSXwVWr8U1utrhwdZ0QehLWUyi5Dadpd
 Jbj8c7/XlikkigGSWOIokZzMIs5a/eKH8LEosYiibLs+1z3BAW4j9/9Q+RHg13e3SDFJ
 /Gb8o/Df2SJUEbvYbCJnKo4RkxaNF1CXYnsJ2MLVe6QcXoHDeRRWRu4g6DOsK4q7iC+V
 LyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306122;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ONs8hu4DakRq6Eq9QQk6sVabt3pk1jUGku2e96eNaoc=;
 b=Az6n8nto0padj44aqOBmjd6xLLo74Dio3XWIgbTo3TxLyNJzPVpa3mWHz0Y5CFpc71
 wz/hpjUYqmgKaY80nIFeX1MAbWCBbjy95HfTWPOg6voK/3/IdvX2Afshcxy9ta9jId4e
 7h+ZsbSnx6MpBug6NVIj6OhnFT9TEscpa6K9vXWAkHi4hfku3n1sft4HFXht+QsUQump
 TbqGd0hSnb44PiPIB30ZpE6iL5g6KKvlJw4eOG1cF31Ci3AD01GzoaYDpKOfcky5LlA9
 Df+hx3TeCPzIhEC/Wazl50HQXU4n33uZHIim8Aaqc8ManyLz0T0OC/+7l0986uQH9L/V
 IYQg==
X-Gm-Message-State: AO0yUKXRZSU+NkI8lPLgieI8X/997Bip/UuraXS9zItD0r4o4SD9r3fa
 UOC6GWfh2ytm9rLBK6Aprn7bWA==
X-Google-Smtp-Source: AK7set8w6iy03am10n1Sm2MgCdWv1BERnE5+g5WCs7+WojuUv198OHiedcdFMO8QaEfHsO52hTcu8A==
X-Received: by 2002:a19:f00d:0:b0:4e9:d53:a5ef with SMTP id
 p13-20020a19f00d000000b004e90d53a5efmr4588282lfc.1.1679306122703; 
 Mon, 20 Mar 2023 02:55:22 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:15 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-8-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 8/9] gpio: xilinx: Convert to immutable
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
 drivers/gpio/gpio-xilinx.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index e248809965ca..1fa66f2a667f 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -68,7 +68,6 @@ struct xgpio_instance {
 	DECLARE_BITMAP(dir, 64);
 	spinlock_t gpio_lock;	/* For serializing operations */
 	int irq;
-	struct irq_chip irqchip;
 	DECLARE_BITMAP(enable, 64);
 	DECLARE_BITMAP(rising_edge, 64);
 	DECLARE_BITMAP(falling_edge, 64);
@@ -416,6 +415,8 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
 	}
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	gpiochip_disable_irq(&chip->gc, irq_offset);
 }
 
 /**
@@ -431,6 +432,8 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	u32 old_enable = xgpio_get_value32(chip->enable, bit);
 	u32 mask = BIT(bit / 32), val;
 
+	gpiochip_enable_irq(&chip->gc, irq_offset);
+
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__set_bit(bit, chip->enable);
@@ -544,6 +547,16 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	chained_irq_exit(irqchip, desc);
 }
 
+static const struct irq_chip xgpio_irq_chip = {
+	.name = "gpio-xilinx",
+	.irq_ack = xgpio_irq_ack,
+	.irq_mask = xgpio_irq_mask,
+	.irq_unmask = xgpio_irq_unmask,
+	.irq_set_type = xgpio_set_irq_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /**
  * xgpio_probe - Probe method for the GPIO device.
  * @pdev: pointer to the platform device
@@ -653,12 +666,6 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (chip->irq <= 0)
 		goto skip_irq;
 
-	chip->irqchip.name = "gpio-xilinx";
-	chip->irqchip.irq_ack = xgpio_irq_ack;
-	chip->irqchip.irq_mask = xgpio_irq_mask;
-	chip->irqchip.irq_unmask = xgpio_irq_unmask;
-	chip->irqchip.irq_set_type = xgpio_set_irq_type;
-
 	/* Disable per-channel interrupts */
 	xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, 0);
 	/* Clear any existing per-channel interrupts */
@@ -668,7 +675,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	xgpio_writereg(chip->regs + XGPIO_GIER_OFFSET, XGPIO_GIER_IE);
 
 	girq = &chip->gc.irq;
-	girq->chip = &chip->irqchip;
+	gpio_irq_chip_set_chip(girq, &xgpio_irq_chip);
 	girq->parent_handler = xgpio_irqhandler;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
