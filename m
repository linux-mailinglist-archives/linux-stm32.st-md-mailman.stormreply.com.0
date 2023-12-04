Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA465803FBE
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 21:35:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 688DFC6C85F;
	Mon,  4 Dec 2023 20:35:41 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CBFCC6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 20:35:39 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-58dd6d9ae96so2019611eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722138; x=1702326938;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWagGRv/i1MW5G1zwpH94jc78fOBc/tv6/pgOnwcx6k=;
 b=2//7PK1qPA4uz6SXkoluNblOnGcCFE1f5zLDqo0XxOUEEn5vYsoNydvWVCf2dfXt2l
 OK2uIa7aC7l8USvJPtI5BE3i0VRBx4ye8xwPKi/nP+dGr2LnUPst5lh3ti+dfIFW5Qs4
 rFIg6yMG0InqYtY2rlW81a90XyxEawzmjr8n/PT/l8fEuxgUdDEkE1KK3IteUCaxO+e+
 TZZFIYhqfZhdWoO32qAz1ri0WBA5bGYo1nBty6JN5gEpo/jetNHlPsXL8cZ1LQamNpyL
 YyX2yYuM9EzFl46wZtUW+7zUHDufljAAOtrl+hLBSNcHLen1Z7GpPnv+SIaQaVG7iisf
 yBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701722138; x=1702326938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWagGRv/i1MW5G1zwpH94jc78fOBc/tv6/pgOnwcx6k=;
 b=XXbfcQjtfC9v/woAUYwlHauVFG4Mhe/FjQYiaJ6dNwqikcURU+0Q2YO4Ar7Tvs0hoG
 CrnQ8+eYyxIcKI40YdeT3xqF/SdyJb7wyqhGG8izyhX7KQom+5gPPoY1vzCHlvVIcPps
 zwTFV4kbt0DN7ufxMIr/5CbnxsyBeCMEg7oOI91T5hd8esr2Po4pXPy+WhygdMehFLOU
 TwI/PooV3raJVaWK75j1Lgc46+CSC0DbULYlH3Ff7Gzdz9YfwNk2KgIZdxnME0uimh9G
 GIFmHiUyKMebhIKJsfRLSrL44JBWq7GGuhsFC6ApZOWN2opf9T4SWgw7uepYbPuN12yA
 nKrQ==
X-Gm-Message-State: AOJu0YwfA45CtL+HAzbinqWGkI8z3paMrV1sfR9kTw4NKajMfafS9dEx
 QqJApuBtOOmUq/fX4WsyGIlzrmbyZB2W0J9q1bk=
X-Google-Smtp-Source: AGHT+IGpvpasx/jsnz18GATaaZSXxidSk27F4tka23is5+bIfanisW7osRFJz0pud48XSUhXK+w7lw==
X-Received: by 2002:a05:6358:640b:b0:16d:f932:b5f with SMTP id
 f11-20020a056358640b00b0016df9320b5fmr1254764rwh.30.1701722138274; 
 Mon, 04 Dec 2023 12:35:38 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 12:35:37 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Date: Mon,  4 Dec 2023 15:33:57 -0500
Message-ID: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level interrupts
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

The STM32 doesn't support GPIO level interrupts in hardware, so the
driver tries to emulate them using edge interrupts, by retriggering the
interrupt if necessary based on the pin state after the handler
finishes.

Currently, this functionality does not work because the irqchip uses
handle_edge_irq(), which doesn't run the irq_eoi() or irq_unmask()
callbacks after handling the interrupt. This patch fixes this by using
handle_level_irq() for level interrupts, which causes irq_unmask() to be
called to retrigger the interrupt.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 603f900e88c1..fb9532601cbb 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -348,12 +348,15 @@ static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_EDGE_BOTH:
+		irq_set_handler_locked(d, handle_edge_irq);
 		parent_type = type;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler_locked(d, handle_level_irq);
 		parent_type = IRQ_TYPE_EDGE_RISING;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
+		irq_set_handler_locked(d, handle_level_irq);
 		parent_type = IRQ_TYPE_EDGE_FALLING;
 		break;
 	default:
-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
