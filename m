Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0D6C0DCA
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77B16C6A5F6;
	Mon, 20 Mar 2023 09:55:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3F15C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:18 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id e11so2784682lji.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eNbwpBrcxQyOJmFGB8QKYSUw0GcL4gHVq06YlQk9V4w=;
 b=odNzulw4pjVtLmYnmgubXKQe/ANfNF2OKvSlxkJ9K6L1U4dnK0JiNIUSeR8Kp8p1M6
 JRt4CtRCRZqu3tKU7aYmGCRu4ikbscZP1XUsDiD2DC1vTGR/pwWx15QJCQxkGos/DNlX
 +rMyAEbBulqnjMe6QLGGUbfv4QbiI9knU7AqXZQbWno2KRYKcSJ3/c31+XDMnyDGo/j/
 yxw2399oTI3QBwlqBJ/NLaC3h573x+XRYqBB4yof6B9oQ81hw0Vdtaca6L1zWBN2WXlz
 mbg9tBYRuFoBhn5MPkc6bAKoKRZ4ok7gPED6tHe0YEtpo2xIWVn4k82NHW3uLUy3f5IJ
 2/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306118;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNbwpBrcxQyOJmFGB8QKYSUw0GcL4gHVq06YlQk9V4w=;
 b=QmrDEELAzyenjTp/zOIUdJx80r7m+3qd+6gS/RhdORBUGu2CAfqhfHwc+03uzU5oGV
 mH/f9tBIUwFRrjcHuGap1yWxqTk2m667pIkRfs5e+9eTI0vHPJ27caamObEdy4gPeoNN
 See4ZNytSv8Om8XlX57k5ACasAyFsDu+7z/KLYn02wayae9mj5SeqTwc2MmLLkk27Hdi
 dME5evgPl738f0PpOAZV/YvBLP5wCh9UJmxESO9RPO5uqwUF1BBTtPM+Q9AILhhufD2X
 LHKrcwH8D9F2BXgVT5B+hah7B96GiQ58l/aRHsEt9iLq+X/kQzc/Sx+dZQBbxKRWF0Jn
 retg==
X-Gm-Message-State: AO0yUKVxP/aB2eYzQbqZRT64KWeJGf9jHgqT+UFCzVTinPwg2TMkyWMs
 9U4dGpQAm9Du549KJ5UiPXPIBg==
X-Google-Smtp-Source: AK7set+n7o2L968SF5glUu42xYtzIYLljtOPPBl1On6fNADisUPOjQZfTvXEfobi3RjvY4SRalsYSA==
X-Received: by 2002:a2e:7006:0:b0:298:ade0:40bc with SMTP id
 l6-20020a2e7006000000b00298ade040bcmr5128524ljc.10.1679306118261; 
 Mon, 20 Mar 2023 02:55:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:11 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-4-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 4/9] gpio: thunderx: Convert to immutable
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

Whereas in most cases we put the gpiochip_[enable|disable]_irq()
calls in the .irq_mask() and .irq_unmask() callbacks, here
we need to put them in the .irq_enable() and .irq_disable()
callbacks, as this driver uses both .irq_mask() and
.irq_mask_ack().

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-thunderx.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index cc62c6e64103..8521c6aacace 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -354,16 +354,22 @@ static int thunderx_gpio_irq_set_type(struct irq_data *d,
 	return IRQ_SET_MASK_OK;
 }
 
-static void thunderx_gpio_irq_enable(struct irq_data *data)
+static void thunderx_gpio_irq_enable(struct irq_data *d)
 {
-	irq_chip_enable_parent(data);
-	thunderx_gpio_irq_unmask(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	irq_chip_enable_parent(d);
+	thunderx_gpio_irq_unmask(d);
 }
 
-static void thunderx_gpio_irq_disable(struct irq_data *data)
+static void thunderx_gpio_irq_disable(struct irq_data *d)
 {
-	thunderx_gpio_irq_mask(data);
-	irq_chip_disable_parent(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	thunderx_gpio_irq_mask(d);
+	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 /*
@@ -372,7 +378,7 @@ static void thunderx_gpio_irq_disable(struct irq_data *data)
  * semantics and other acknowledgment tasks associated with the GPIO
  * mechanism.
  */
-static struct irq_chip thunderx_gpio_irq_chip = {
+static const struct irq_chip thunderx_gpio_irq_chip = {
 	.name			= "GPIO",
 	.irq_enable		= thunderx_gpio_irq_enable,
 	.irq_disable		= thunderx_gpio_irq_disable,
@@ -383,8 +389,8 @@ static struct irq_chip thunderx_gpio_irq_chip = {
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.irq_set_type		= thunderx_gpio_irq_set_type,
-
-	.flags			= IRQCHIP_SET_TYPE_MASKED
+	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int thunderx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -526,7 +532,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->set_multiple = thunderx_gpio_set_multiple;
 	chip->set_config = thunderx_gpio_set_config;
 	girq = &chip->irq;
-	girq->chip = &thunderx_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &thunderx_gpio_irq_chip);
 	girq->fwnode = of_node_to_fwnode(dev->of_node);
 	girq->parent_domain =
 		irq_get_irq_data(txgpio->msix_entries[0].vector)->domain;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
