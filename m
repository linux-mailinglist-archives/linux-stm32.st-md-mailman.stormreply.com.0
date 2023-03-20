Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A243B6C0DC8
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67161C6A60A;
	Mon, 20 Mar 2023 09:55:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0591C6A60A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id s8so13850580lfr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iBy8uglh8gI3CtA/oUcnRDs25I4dMI2aaLdEiGdH3E4=;
 b=VJSWksEl6WxkHvKzPymzEi6mf3ZUeAsMB9WkGKvRi4yYReG0Nz/6sBKaHTNxqci5JY
 nqhyqfT+O4UI8OcnALy74NJgtnZkDTgmzaryyCzE18tQHFKDZaX/vCyj9bmzq4MQwEqm
 7JspHuKpDSc9if5ybl5cxPLcd/u09a8lpVxbPNjMNhC1EVybYUH2BndXo7a2u+IJ12Tg
 Q1W984RSdg1rOcpmKqad1UkvNu2z1qqFc0ZJCIlsvJj3EI3CeUk2I4EBv1NfTJt/teZh
 kfeqyDjdd2/ny+QZeNEIVEdYu9QSsg+sQxIsHwHcN+SGVLdMwzvc1TikYc5i4lF/FyMo
 KnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBy8uglh8gI3CtA/oUcnRDs25I4dMI2aaLdEiGdH3E4=;
 b=HVyVBxMsUqLWHNcxv/7zDJGTedd20uPK2YL5s/Cvmr8fZxJV/FcVIMDy6fedasIYgk
 DL5Ti+h1+KTr9JvqJjE6jSojBtp1ab3g6PWd37OYiravBiWRvAXAqmKBXE2K/pWFc1h6
 mtaeRtoOzTSgvb2lgNCHHgoQqetEKgvWtPbcphkDrRD5m5NscWtnpVwceOXZSWwz1pD+
 lbrzPJbJM5gUmuDOMYYnz7Z61jOQp+B3sH3Ra83Wn1bJJOqnsXra4sFbpJmM3bPSqfl7
 BxJLuokYiA6wH3D+bumbOW4Iu0lifZF4gaE1Jw67bQ+bnsZmdrNLiiNFxMzcIzuXJ1+N
 SOZg==
X-Gm-Message-State: AO0yUKWKCGT9cWQ1dQqPaXoFR3tQPpElUG+cePicWoD1jwwBTb4+afTT
 j0SzlC3uKiuT3kuDDkVY52cmJg==
X-Google-Smtp-Source: AK7set9qOc4rmnFzJJmDKRIXSY9dptpUANbsXnl/EmAKnXz6o60CYgbqOnnyCFdeWMHDggShDpHNzg==
X-Received: by 2002:a19:ee14:0:b0:4e9:ccff:daa6 with SMTP id
 g20-20020a19ee14000000b004e9ccffdaa6mr939758lfb.30.1679306117176; 
 Mon, 20 Mar 2023 02:55:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:10 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-3-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 3/9] gpio: stmpe: Convert to immutable irq_chip
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
 drivers/gpio/gpio-stmpe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 0fa4f0a93378..27cc4da53565 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -234,6 +234,7 @@ static void stmpe_gpio_irq_mask(struct irq_data *d)
 	int mask = BIT(offset % 8);
 
 	stmpe_gpio->regs[REG_IE][regoffset] &= ~mask;
+	gpiochip_disable_irq(gc, offset);
 }
 
 static void stmpe_gpio_irq_unmask(struct irq_data *d)
@@ -244,6 +245,7 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 	int regoffset = offset / 8;
 	int mask = BIT(offset % 8);
 
+	gpiochip_enable_irq(gc, offset);
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
 }
 
@@ -357,13 +359,15 @@ static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 	}
 }
 
-static struct irq_chip stmpe_gpio_irq_chip = {
+static const struct irq_chip stmpe_gpio_irq_chip = {
 	.name			= "stmpe-gpio",
 	.irq_bus_lock		= stmpe_gpio_irq_lock,
 	.irq_bus_sync_unlock	= stmpe_gpio_irq_sync_unlock,
 	.irq_mask		= stmpe_gpio_irq_mask,
 	.irq_unmask		= stmpe_gpio_irq_unmask,
 	.irq_set_type		= stmpe_gpio_irq_set_type,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 #define MAX_GPIOS 24
@@ -511,7 +515,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		}
 
 		girq = &stmpe_gpio->chip.irq;
-		girq->chip = &stmpe_gpio_irq_chip;
+		gpio_irq_chip_set_chip(girq, &stmpe_gpio_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
