Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C90803FBD
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 21:35:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B3A5C6DD68;
	Mon,  4 Dec 2023 20:35:39 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2894C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 20:35:37 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1fadb9ac169so2724978fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722137; x=1702326937;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMsMKq+fG5BsTJ38ktkUAvKvU/juEXAO2vxB2M78m9A=;
 b=X/DEHs9kDp54WrOXzSaPa6QMpd6rN/Z0sx/NwIQoj4ZN+zf71uJsO3q0PsUU0ktb6S
 bRbAmh7xlorkAO8mLciPbPgWlOMwpVvgV6cMpPhLG1JS+y56ejLsvrqueZU985gcvyTr
 pJBmWU2wE7lqQN6dNTDBj+aVgcTlBp3s9FZkYDdw6dEVbSkDKfj1BsmdmrtcH7zbZC3S
 b2qCJr7br2U1IzySaw1ytwJb3sIyXgYxb3E1S7to/moTx/MDJvQVHyYxwSwvDMCT4SP8
 eT2Cr0lfKhTmTHlkRixY1NcdwpgiOHTIbW689w4yCB2iW9SsbipR49p93vnSqEYLAaxC
 vU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701722137; x=1702326937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMsMKq+fG5BsTJ38ktkUAvKvU/juEXAO2vxB2M78m9A=;
 b=i4DzPPBNlSVkzFGUM/9I7PI5xzjMAC5UYxBWPtzhgu0NyTLTOBV1d7g8qblyFJW6q7
 DaceNCGbHf79KofXo+99d09qhti8jrucTEqNCQedMvnOb83dLMm6FSxLFVnC0clbZQi6
 OKrEvCNLG9teljrM14Zm9wep3U//KPmuPZL5tWkOv56g5nW/txBSg9LEI+q0Bma/r3hZ
 RqVM3qOgYP+34a385gNbBN0trBLlPdVbc76bu6BtrrLcuL+y/qlaPbAaqq1QOJRJ13Lv
 FcTlLtvzCDURvvGmO5+RCDN6wSVpIHNCotNuEVHC08Gstt1R5oIM+AL6Phy1Kuz88bKx
 dtBw==
X-Gm-Message-State: AOJu0YwsLSfDQ/CPsuQ388ZTpFCyWbvyphEMXKMzR2SS9OnRUZCVhI+H
 CkIyHpAFcnakaugcPGtDTdLGog==
X-Google-Smtp-Source: AGHT+IF2Gj+iJqDa8aGY27lxy9gezYaVc/7geGOoCzfX8J7QXvpmy9rY5js/M1Vlkz5tRc2LBUEwAg==
X-Received: by 2002:a05:6871:281:b0:1fa:f230:4c58 with SMTP id
 i1-20020a056871028100b001faf2304c58mr5820598oae.59.1701722136896; 
 Mon, 04 Dec 2023 12:35:36 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 12:35:35 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Date: Mon,  4 Dec 2023 15:33:56 -0500
Message-ID: <20231204203357.2897008-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] irqchip/stm32-exti: support retriggering
	on STM32 MCUs
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

EXTI retriggering support was missing on STM32 MCUs. Retriggering is
required to emulate GPIO level interrupts using edge interrupts in the
STM32 pinctrl driver.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/irqchip/irq-stm32-exti.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 971240e2e31b..6b3f54457812 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -328,6 +328,18 @@ static void stm32_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int stm32_irq_retrigger(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct stm32_exti_chip_data *chip_data = gc->private;
+	const struct stm32_exti_bank *stm32_bank = chip_data->reg_bank;
+	u32 mask = BIT(d->hwirq % IRQS_PER_BANK);
+
+	irq_reg_writel(gc, mask, stm32_bank->swier_ofst);
+
+	return 0;
+}
+
 static int stm32_exti_set_type(struct irq_data *d,
 			       unsigned int type, u32 *rtsr, u32 *ftsr)
 {
@@ -856,6 +868,7 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 		gc->chip_types->chip.irq_ack = stm32_irq_ack;
 		gc->chip_types->chip.irq_mask = irq_gc_mask_clr_bit;
 		gc->chip_types->chip.irq_unmask = irq_gc_mask_set_bit;
+		gc->chip_types->chip.irq_retrigger = stm32_irq_retrigger;
 		gc->chip_types->chip.irq_set_type = stm32_irq_set_type;
 		gc->chip_types->chip.irq_set_wake = irq_gc_set_wake;
 		gc->suspend = stm32_irq_suspend;
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
