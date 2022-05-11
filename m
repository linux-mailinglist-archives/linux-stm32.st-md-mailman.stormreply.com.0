Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE8523119
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 13:06:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059B5C03FC4;
	Wed, 11 May 2022 11:06:12 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 927A6C03FC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 11:06:11 +0000 (UTC)
Date: Wed, 11 May 2022 13:06:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1652267170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JNTkaL7CYGyZNj/Sj8koZSQng8dqdZ7jLKa+MBiBnRk=;
 b=dgIVoq4bjM6CFOjcRf9HApW92bQ2y3k0/SJlbS6OnG+3lWnUXPqa035mm53LesqbTVJmPJ
 tIUhTOFMM7eOEW4VydCbPdEiP7A3hsgdH2jE41sa9iWpqRXvQbVe/JuKcmoA6ezhlpBD/Z
 cqOcf037r+soY/s9/bzhJmaSKcbtepCXS9oL53LWWYozv6L8H2VIGHTtrFUFiHnU3nliLC
 DYKWeQZI3Xbqgk8DUIVmyd8u0HXrbn2vz97o35peKn2TBWzmVy7yYRyRr7ayk3lSDr4FW3
 ZSvoS1ZvvaMZW8V0nNYN9jM+6xv27sSBb7Jm7P8Knrcu6QFDVtgmDRxrarin7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1652267170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JNTkaL7CYGyZNj/Sj8koZSQng8dqdZ7jLKa+MBiBnRk=;
 b=XYNZHjr/PZ4EoKKntKWBsm/WbrSJeOpdfr0XpqGcdUJ8SqXbM4Es/7EqV4jDflCErCR3nk
 NNg09sOiqA8lUfDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Message-ID: <YnuYoQIzJoFIyEJY@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Thomas Gleixner <tglx@linutronix.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Use
	generic_handle_domain_irq()
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

The call chain
	generic_handle_irq(irq_find_mapping(domain, x));

could be replaced with
	generic_handle_domain_irq(domain, x);

which looks up the struct irq_desc for the interrupt and handles it with
handle_irq_desc().
This is a slight optimisation given that the driver invokes only one
function and the struct irq_desc is used directly instead being looked
up via irq_to_desc().

Use generic_handle_domain_irq().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/iio/adc/stm32-adc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 1426562321575..c8fc97e52fef4 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -356,7 +356,7 @@ static void stm32_adc_irq_handler(struct irq_desc *desc)
 		if ((status & priv->cfg->regs->eoc_msk[i] &&
 		     stm32_adc_eoc_enabled(priv, i)) ||
 		     (status & priv->cfg->regs->ovr_msk[i]))
-			generic_handle_irq(irq_find_mapping(priv->domain, i));
+			generic_handle_domain_irq(priv->domain, i);
 	}
 
 	chained_irq_exit(chip, desc);
-- 
2.36.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
