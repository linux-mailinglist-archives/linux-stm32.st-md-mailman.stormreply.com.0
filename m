Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1416C0DCB
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8510BC6A606;
	Mon, 20 Mar 2023 09:55:21 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2EAFC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id y20so14139711lfj.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EOglr4b8wCIZjowHrmCHalgLUTFsF3VGPj317uHaVFA=;
 b=kJ56kO3MduhiDK5ybC0WL3qaOzThm6WPK8eMyB1OamVZiJfOcQk0xmXE/zSisFY0dB
 MppJxQ2gGiT09ZH487ElXsDAGrtQ/ogdwA2zLb0Xrf5q0OObLU48m9uZiBd5rmAoLz19
 c87J3IwGn68t/c4poAw7ckPaJz82738fW0ktSIKaoEfp0jn+T05UpNTxbunOynb+fYHS
 3pOHgEPRPuSq+G9TlA0LQSX0mKmEBwa7IIaeFArqxLcZtYTIWuNLH25t/aVdXOosDUVK
 DJlQYGwxDg16lZOq/vLKok6RDvSzlCo4SCMZSJUDvn/fvHwz+bQnbahCPa4VITowm5zF
 hSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOglr4b8wCIZjowHrmCHalgLUTFsF3VGPj317uHaVFA=;
 b=rL5v0sCc8+Xm/E5QYubvrC30I0K8g/HG9IyY+jfXnj247lLto+HFP64z0MUAy2awcG
 LiyJuZJuzhR48B3s2fLNEK0JAzYrAVZ3u/6xS2+wYfaGmVCM6ClAGVL/pa3Jtdx94WqI
 q89CX/JItueu1D47FiaVMe7uQs4dZjr7409mwl7nut44PU+FwKRV1pQt8goHaUJzQM4u
 KhgxO0Jj6y//vDUy15M/CTUso1n/RTL9dQaWRpt9I9cykoj/aniTyz3QejqCKHBXOUCA
 Qh6TPEa/HZBJKPA/JCV0JuPUKud5NPfMBbpATXcOdVngQKWRuU28NtMde11ja1Nx4uSA
 Fizw==
X-Gm-Message-State: AO0yUKVPvZHEXWk+3Hknhr94mYuQaOPgeaa1KVWtYFwJbKmf6Mll1+K1
 OQ6Odtp7IDfH1IhjRAO3Fy9a/A==
X-Google-Smtp-Source: AK7set+nN7wJ+atkoSzdFP68LNe4ASCgnZA7hoX78zbZLZDK9kBtZZM0z69izqvAxxmLwp/AJRTN/A==
X-Received: by 2002:ac2:46d4:0:b0:4e9:4d61:e750 with SMTP id
 p20-20020ac246d4000000b004e94d61e750mr4663273lfo.32.1679306119303; 
 Mon, 20 Mar 2023 02:55:19 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:12 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-5-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 5/9] gpio: tqmx86: Convert to immutable
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
 drivers/gpio/gpio-tqmx86.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index e739dcea61b2..6f8bd1155db7 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 
 #define TQMX86_NGPIO	8
@@ -34,7 +35,6 @@
 
 struct tqmx86_gpio_data {
 	struct gpio_chip	chip;
-	struct irq_chip		irq_chip;
 	void __iomem		*io_base;
 	int			irq;
 	raw_spinlock_t		spinlock;
@@ -122,6 +122,7 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 	gpiic &= ~mask;
 	tqmx86_gpio_write(gpio, gpiic, TQMX86_GPIIC);
 	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
+	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
 }
 
 static void tqmx86_gpio_irq_unmask(struct irq_data *data)
@@ -134,6 +135,7 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 
 	mask = TQMX86_GPII_MASK << (offset * TQMX86_GPII_BITS);
 
+	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&gpio->spinlock, flags);
 	gpiic = tqmx86_gpio_read(gpio, TQMX86_GPIIC);
 	gpiic &= ~mask;
@@ -226,6 +228,22 @@ static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
 	clear_bit(3, valid_mask);
 }
 
+static void tqmx86_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	seq_printf(p, gc->label);
+}
+
+static const struct irq_chip tqmx86_gpio_irq_chip = {
+	.irq_mask = tqmx86_gpio_irq_mask,
+	.irq_unmask = tqmx86_gpio_irq_unmask,
+	.irq_set_type = tqmx86_gpio_irq_set_type,
+	.irq_print_chip = tqmx86_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int tqmx86_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -277,14 +295,8 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	if (irq > 0) {
-		struct irq_chip *irq_chip = &gpio->irq_chip;
 		u8 irq_status;
 
-		irq_chip->name = chip->label;
-		irq_chip->irq_mask = tqmx86_gpio_irq_mask;
-		irq_chip->irq_unmask = tqmx86_gpio_irq_unmask;
-		irq_chip->irq_set_type = tqmx86_gpio_irq_set_type;
-
 		/* Mask all interrupts */
 		tqmx86_gpio_write(gpio, 0, TQMX86_GPIIC);
 
@@ -293,7 +305,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 		tqmx86_gpio_write(gpio, irq_status, TQMX86_GPIIS);
 
 		girq = &chip->irq;
-		girq->chip = irq_chip;
+		gpio_irq_chip_set_chip(girq, &tqmx86_gpio_irq_chip);
 		girq->parent_handler = tqmx86_gpio_irq_handler;
 		girq->num_parents = 1;
 		girq->parents = devm_kcalloc(&pdev->dev, 1,

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
