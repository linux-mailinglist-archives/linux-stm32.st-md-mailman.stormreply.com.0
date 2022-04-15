Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 718F4503024
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Apr 2022 23:54:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EBC1C6049C;
	Fri, 15 Apr 2022 21:54:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12DF0C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 21:54:23 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A70483894;
 Fri, 15 Apr 2022 23:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650059662;
 bh=CikPWEoVsPPQ9qQACVoJTyNXfRZhEnbtHIAX4K2c1OQ=;
 h=From:To:Cc:Subject:Date:From;
 b=foG04/ApDyCcDs20x0fnX3ov7sJ7HaXpZZz0Fh869/+GvmZ7NEFXTA8wJhYDqWvsW
 WQZS3Ye/3yGG+UkEyZ/hHIT2XMGfo3k+Tm9MVtGlwKII8G4NWD11sX4UjX+y2ZI6qT
 M8oJdnq8Mfc9vkljkK6YfHVlSgQGlu2GBXrZaVHPcG0/WGqsC86RRU9RlJ47eOcQX4
 Ot08cWJCi2F5piweQAqqyomsA9n09su1u7L4eFOO6Twu54Zv1mxAlxTRRGcxl1c0SV
 KZ627KYsCsXM9C6uMh7Zg9oZJZsvWPNh234lIUe2UR6kzfqvwrVxWtksxoWfID17t7
 0Q7bXh6xUlpmA==
From: Marek Vasut <marex@denx.de>
To: linux-gpio@vger.kernel.org
Date: Fri, 15 Apr 2022 23:54:10 +0200
Message-Id: <20220415215410.498349-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] irqchip/stm32: Do not call stm32_gpio_get()
	for edge triggered IRQs in EOI
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

The stm32_gpio_get() should only be called for LEVEL triggered interrupts,
skip calling it for EDGE triggered interrupts altogether to avoid wasting
CPU cycles in EOI handler. On this platform, EDGE triggered interrupts are
the majority and LEVEL triggered interrupts are the exception no less, and
the CPU cycles are not abundant.

Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
To: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 09952c463f67d..242d1c37c6e4b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -312,6 +312,10 @@ static void stm32_gpio_irq_trigger(struct irq_data *d)
 	struct stm32_gpio_bank *bank = d->domain->host_data;
 	int level;
 
+	/* Do not access the GPIO if this is not LEVEL triggered IRQ. */
+	if (!(bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK))
+		return;
+
 	/* If level interrupt type then retrig */
 	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
 	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
