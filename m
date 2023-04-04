Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A3A6D5C1D
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 11:43:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28773C6A61B;
	Tue,  4 Apr 2023 09:43:13 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 513FFC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 09:43:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id k37so41665788lfv.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680601391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E1U3mznWUSnJq2x7KzrZeo74yHwZxjse8U63SQkTN4k=;
 b=eX5ZeFcrDyeOZ/+cmIw1GthasxB336QssKMWmkFVFjzUzquTWCGLPH0q1EZGkx57D7
 lMBTV4GQvDuLwdcpX7uMkCsYiT15dsHdEflv9g0w1W+ahbDSVxbyUvz5gUTVJ5sYN5nd
 gGSkMJIKgzuEsvJpz5qvVuUa9tXPAIFLLMxBUS9ZN6aJGEJa88cvLFIhVRzr7cFD3xO4
 V/C0tVGfceLtY5T6HC9Bg5fuMQSPe39vC9gft3my7IAoHhwOGoYe386nE0RCa7Nph0FF
 HFz4nkApA+T03Chl0EFnlvCZrI+HrbjlWiHUeCW0UG/pPXcOb+msKYSk3REigmMJsDvV
 tYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1U3mznWUSnJq2x7KzrZeo74yHwZxjse8U63SQkTN4k=;
 b=SDYyB/YAZuTUghmJNowmgdR/AlegnKDt+8dqWvp3m2WrUZbwFmV7ar5GWxEHorS6+8
 Q0kp1PxzvNWiRkO7QsZ6lZK+IT3FyE0u1nzx16bwkuG45kfNyMUIILPNH2iFvl4nAvch
 s+15uuRJ41w48EKird6xMAoR6U5hzaRaqVOiWnf7LM8lBijLI5jpqtP1SrQYp65DI/av
 ufmPBNrAcIg8GARvRW9UYJiBUPF+A3hoSuCdrcLNqivVr3HEToFqC9/Vj15LVt2mnKXK
 ygqTbKodbh0mA6D/plY1kPMrBMK5pi0/YzM8/VSzGWVQ3H8kI4KdqGhfwPnRQIFFX0uI
 6ljg==
X-Gm-Message-State: AAQBX9fTIFXHuYYalnEi1cHVEamt0m4loVXOajB9cKbB7tI8lqBQZ9m6
 BjY04ghRY11f43hWip7TuFbHiA==
X-Google-Smtp-Source: AKy350a7DLDlAx2wATbxYZ+yV4+OnJfCSexEHHMxv0+zsfQNpGxjvujPBQwRFlw396afIThPkSlLDg==
X-Received: by 2002:a05:6512:118d:b0:4eb:2b62:134f with SMTP id
 g13-20020a056512118d00b004eb2b62134fmr4661753lfr.16.1680601391634; 
 Tue, 04 Apr 2023 02:43:11 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 l25-20020a19c219000000b004eb258f73a9sm2218443lfc.163.2023.04.04.02.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:43:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 04 Apr 2023 11:43:04 +0200
MIME-Version: 1.0
Message-Id: <20230403-immutable-irqchips-v1-2-503788a7f6e6@linaro.org>
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
Subject: [Linux-stm32] [PATCH 2/9] pinctrl: nsp: Convert to immutable
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
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 3c792bf03bda..5045a7e57f1d 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -60,7 +60,6 @@ struct nsp_gpio {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *io_ctrl;
-	struct irq_chip irqchip;
 	struct gpio_chip gc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
@@ -193,6 +192,7 @@ static void nsp_gpio_irq_mask(struct irq_data *d)
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	nsp_gpio_irq_set_mask(d, false);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void nsp_gpio_irq_unmask(struct irq_data *d)
@@ -201,6 +201,7 @@ static void nsp_gpio_irq_unmask(struct irq_data *d)
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&chip->lock, flags);
 	nsp_gpio_irq_set_mask(d, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
@@ -258,6 +259,16 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static const struct irq_chip nsp_gpio_irq_chip = {
+	.name = "gpio-a",
+	.irq_ack = nsp_gpio_irq_ack,
+	.irq_mask = nsp_gpio_irq_mask,
+	.irq_unmask = nsp_gpio_irq_unmask,
+	.irq_set_type = nsp_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
 {
 	struct nsp_gpio *chip = gpiochip_get_data(gc);
@@ -650,14 +661,6 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
-		struct irq_chip *irqc;
-
-		irqc = &chip->irqchip;
-		irqc->name = "gpio-a";
-		irqc->irq_ack = nsp_gpio_irq_ack;
-		irqc->irq_mask = nsp_gpio_irq_mask;
-		irqc->irq_unmask = nsp_gpio_irq_unmask;
-		irqc->irq_set_type = nsp_gpio_irq_set_type;
 
 		val = readl(chip->base + NSP_CHIP_A_INT_MASK);
 		val = val | NSP_CHIP_A_GPIO_INT_BIT;
@@ -673,7 +676,7 @@ static int nsp_gpio_probe(struct platform_device *pdev)
 		}
 
 		girq = &chip->gc.irq;
-		girq->chip = irqc;
+		gpio_irq_chip_set_chip(girq, &nsp_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
