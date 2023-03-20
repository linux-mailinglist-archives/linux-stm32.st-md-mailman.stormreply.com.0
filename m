Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E943A6C0DCC
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7CFFC6A60A;
	Mon, 20 Mar 2023 09:55:23 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAA14C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id x17so14132932lfu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v+DXSMEQSq/E/GeQCvRmH9xVPSCzJghFx8xjxHqDlf8=;
 b=f3XMr/0a7E5112yn8B67+isIfWczaPX0COKFhxZkn86tE4AL1XxGx42+A1VpWkDmSt
 d+Y6jr+rwJt9Xe4wxYLwVW1QCMB1w6qWZAwj86Ei0FpY4cnzwtt+SaQVPqyz0SfGDAPH
 Qw4ueTfAzpFMmhhknevnUDjTFUksagTsBZJPqi3E3A0mRx6JxGwhCtlY0WWl33zsXdRN
 Z+x577EcFusK//cUApR8yZAamFCOLzS9uJs+haWkC+N2Ac07I2Pmcw9y8tno8eAq+VV3
 GXEQ/z2jBCxku12gxUKuuiS7wZMtbpc7urzScbumij6iW/ulL7l+d4/szT4r7lbaZfV3
 mtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306120;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v+DXSMEQSq/E/GeQCvRmH9xVPSCzJghFx8xjxHqDlf8=;
 b=sOgDP5inSK7u6ptUN9kMcbu6o+NcVPJDdyawfDocH1vmXzQsFUZgNZwob+eRboyhTa
 wS1myUoUYPRa7AG4hQrybUXPwCYIR/2VepLorqtFhny/bEzCBvZj0Q59Os+WCMQzihZt
 3JVVwPgJhx4l/okWVBaxj6qhmE3cq12lsx+mr/2F/1U6hvwLvnFde8CBhUKLXQfxpxad
 x8Bl26vb0uTkQYRKJ2AgTkfH1xFnNfWoeIRr65tMRU17uYO8HPsvCh12SEM4ukxZUpsH
 fnWGbMHL+L6+QG5sBKCryUhPFk9RJi2NvnCwljDpo57AnyZ/fDLLW/C3RhhL3j094vs0
 fn4A==
X-Gm-Message-State: AO0yUKXF6DdRaEIveDdaiHLQlhZlaLf6cSLDOvEQSAJFumVMdPJn/vrz
 bikJuxHHTbIT1YSUG3ixqWztdA==
X-Google-Smtp-Source: AK7set+Pmc8NqxdA9OwvsqIr+k0YVDKmaYSof2ahx5rWtRjmuhUGSY5w2crQgPv7G3r46Yg37D9+Sw==
X-Received: by 2002:a05:6512:404:b0:4db:2977:508e with SMTP id
 u4-20020a056512040400b004db2977508emr6682560lfk.18.1679306120372; 
 Mon, 20 Mar 2023 02:55:20 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:13 +0100
MIME-Version: 1.0
Message-Id: <20230316-immutable-chips-2-v1-6-053d6ede831b@linaro.org>
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
Subject: [Linux-stm32] [PATCH 6/9] gpio: visconti: Convert to immutable
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

The driver is for a hierarchical chip so some extra care
needs to be taken to introduce two new callbacks.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-visconti.c | 50 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
index 5e108ba9956a..82639e81303e 100644
--- a/drivers/gpio/gpio-visconti.c
+++ b/drivers/gpio/gpio-visconti.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/bitops.h>
 
 /* register offset */
@@ -31,7 +32,7 @@ struct visconti_gpio {
 	void __iomem *base;
 	spinlock_t lock; /* protect gpio register */
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
+	struct device *dev;
 };
 
 static int visconti_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -119,11 +120,45 @@ static int visconti_gpio_populate_parent_fwspec(struct gpio_chip *chip,
 	return 0;
 }
 
+static void visconti_gpio_mask_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	irq_chip_mask_parent(d);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+}
+
+static void visconti_gpio_unmask_irq(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+	irq_chip_unmask_parent(d);
+}
+
+static void visconti_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct visconti_gpio *priv = gpiochip_get_data(gc);
+
+	seq_printf(p, dev_name(priv->dev));
+}
+
+static const struct irq_chip visconti_gpio_irq_chip = {
+	.irq_mask = visconti_gpio_mask_irq,
+	.irq_unmask = visconti_gpio_unmask_irq,
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_set_type = visconti_gpio_irq_set_type,
+	.irq_print_chip = visconti_gpio_irq_print_chip,
+	.flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND |
+		 IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int visconti_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct visconti_gpio *priv;
-	struct irq_chip *irq_chip;
 	struct gpio_irq_chip *girq;
 	struct irq_domain *parent;
 	struct device_node *irq_parent;
@@ -134,6 +169,7 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&priv->lock);
+	priv->dev = dev;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
@@ -164,16 +200,8 @@ static int visconti_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	irq_chip = &priv->irq_chip;
-	irq_chip->name = dev_name(dev);
-	irq_chip->irq_mask = irq_chip_mask_parent;
-	irq_chip->irq_unmask = irq_chip_unmask_parent;
-	irq_chip->irq_eoi = irq_chip_eoi_parent;
-	irq_chip->irq_set_type = visconti_gpio_irq_set_type;
-	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
-
 	girq = &priv->gpio_chip.irq;
-	girq->chip = irq_chip;
+	gpio_irq_chip_set_chip(girq, &visconti_gpio_irq_chip);
 	girq->fwnode = of_node_to_fwnode(dev->of_node);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = visconti_gpio_child_to_parent_hwirq;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
