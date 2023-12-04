Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B64803FBA
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 21:35:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49DE2C6C85F;
	Mon,  4 Dec 2023 20:35:38 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8EC0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 20:35:36 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-67ad531686eso6061036d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 12:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701722135; x=1702326935;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DyOt6WNJoyGPyyAGB/bMPPXRQGKI15oaDucC2U+fr/M=;
 b=fpnW2H5vwhQgasot3a285omMluq6hk6VoLXc4yILyvHbi4ixjZtsHscQ2IrM4iNe3u
 NiAwpihGSbM7bvSdJwDhWxNwAv4loyvO/GyDJh78EFzMsNvpy0bx6FJUQzBN9TyKO5f1
 O/X3kKEYJO838BQr/o9zQq5UOFAi4dj+QzpoRrz6MOL2Ypo7krHMuFhIKKi0wAUQhR91
 qW5+B1GoNi/MCdqj5vf3V7RhTxXAIk5AyTowfXRACT1+gr7uKGKHNDgSMgFqqruiqgk+
 8+2+pzDlvV9p1ZRKt+/wmvYOWoeFUQTn/EJ6mfNz9OtNPd1FVIvQe1phAWjuRXKMT08T
 rKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701722135; x=1702326935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyOt6WNJoyGPyyAGB/bMPPXRQGKI15oaDucC2U+fr/M=;
 b=Klml0tCbr32vVkO4J1TFXuWM/uJC1GJsu7rSOFjOuk4HNiRvcu4OCp/HV5n7PgRrZ4
 SD0T6jhEVBSGWdxU02pJfkiK/QqVTdZFqin111Yeo8r9kuFWTeSNgvaqypuaLaJRk94C
 U5jTchtb2y6i7l8pki8F1KDN3lhkZpDPEWb2vphtBch9xGZK0beR8LJn0mkC+w23lE2Q
 V/OiI0FzyQqmoMj8NOzm2FJ5ZVlarqHn9YHuC2tIYQKkajo2QGo/5rZ+sSBZUTViaFKs
 SomPALbgNnOw72MLHwUoQ11waNms5gbcxRswSJn3LzR3aO9hWz8eMsI0hSP4vyfWG2tB
 QMHQ==
X-Gm-Message-State: AOJu0YzkjozPKq7WxLpmSd6ZqMbUYwm0vEnpbcW/VlqN46qEDLlYPM08
 m4Z8KonQocTygvuAX8tlNeVKmA==
X-Google-Smtp-Source: AGHT+IHQVPJUpnF0jpAxRYOUbhikG4xN8M9TPSoPIYVN8gwSA7y9CB1MpGu7A2cRrqTvvdjC++88Hg==
X-Received: by 2002:a05:6214:519d:b0:67a:5815:9996 with SMTP id
 kl29-20020a056214519d00b0067a58159996mr217380qvb.6.1701722135213; 
 Mon, 04 Dec 2023 12:35:35 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 jo23-20020a056214501700b0067ac930d17asm1123469qvb.141.2023.12.04.12.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 12:35:34 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Date: Mon,  4 Dec 2023 15:33:55 -0500
Message-ID: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [Linux-stm32] [PATCH 0/2] stm32: fix GPIO level interrupts
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

GPIO level interrupts on the STM32 were behaving like edge interrupts.
The STM32 lacks hardware support for GPIO level interrupts, therefore
the pinctrl driver contains code to emulate them using edge interrupts,
but this was not working.

First, the STM32 EXTI interrupt controller driver lacked support for
retriggering interrupts, and second, the wrong IRQ handler was being
used because the parent interrupt was an edge interrupt.

Ben Wolsieffer (2):
  irqchip/stm32-exti: support retriggering on STM32 MCUs
  pinctrl: stm32: fix GPIO level interrupts

 drivers/irqchip/irq-stm32-exti.c      | 13 +++++++++++++
 drivers/pinctrl/stm32/pinctrl-stm32.c |  3 +++
 2 files changed, 16 insertions(+)

-- 
2.42.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
