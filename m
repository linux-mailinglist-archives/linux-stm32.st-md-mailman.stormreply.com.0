Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF76C0DC2
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 10:55:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27B00C6A5EF;
	Mon, 20 Mar 2023 09:55:16 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DABADC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:55:14 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id bi9so14093516lfb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679306114;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KLcRecY4IurzeYGepE8N1+JONZ5XYr+wjjJNzOWAqBY=;
 b=HDoNBMSCxam0/t+IGp2epNMQAJJ5tUHM384qKl5sewn/e7sZZz8G//l0WjQGZ9Y0Hu
 MNfWTjcmCW8TaXaHvrHG1CyGWLzTm8U5zwY14JLETPIt+b537SqNtl4hzl6ZSWkSQj9H
 u5sP5KjumCZitZeUKfzimfI3EbobnA5rN26jszFk42YVNZchEkaKOXI+NX0RY8OcsSmR
 gc48XGUclmJLnpEhAEex34qOIarSP8bcwebuRmhEYvuor94Z0Liw29g0PRw20rhD3J/U
 GRue9v3d5c8J4uga5nn4Dha3qkV6eRVaeq9RmY1X/NAGQui5CvSoHZwWafDtbD0duIZq
 t8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679306114;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KLcRecY4IurzeYGepE8N1+JONZ5XYr+wjjJNzOWAqBY=;
 b=eF2W8gkgNtGVHTEx0f9+t2B6RUeUYENgHkJmGJvp150QaOoGpjyZ0matgmyQQXXfRs
 i075R/88zv770fluz3s/mGbab46OtYsCCq2BPpxBQGZMbfFQtNAhvMqokWcb9Bmh8IzV
 EG1UF0mBSnAY3Z22uPCWYlVuUA1J6KmRXA3h0sKeYQzWR2NUKpsjpmtgU5rTKoIF54MB
 hjiDj8zM0fW5hT4J6ls2b/RXRKQnvgMWjuefuWhVXjf+CaoHCaYAlfn5S9pKJOc1VVv2
 AukEXW/1Gw2bSi4LY4YFQfW7WbFhCzZjl1yoNC0kQuN/OAdiKd3LCorH0eDv9CMQqEMr
 0yQg==
X-Gm-Message-State: AO0yUKV5/KsPNXKcYEBn0vrrTNkIxNn/vbyqKL//LRFy2u1r2iMefGiL
 H6kHd/h5ceA5Q4fXBej2vzjBtw==
X-Google-Smtp-Source: AK7set+nwU6isBHx8JOiQQkLLqlKYNWzFoGlQOBBzIDvTgOy7DPWByuQtSAP1zptVBwRdRH8luzvmA==
X-Received: by 2002:ac2:51cc:0:b0:4e7:fa8a:886e with SMTP id
 u12-20020ac251cc000000b004e7fa8a886emr5392863lfm.51.1679306114054; 
 Mon, 20 Mar 2023 02:55:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 c3-20020ac244a3000000b004e792045b3dsm1640104lfm.106.2023.03.20.02.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 02:55:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Mar 2023 10:55:07 +0100
Message-Id: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHstGGQC/x2N0QrCMAwAf2Xk2UDXqRR/RXxI22gDto5kijD27
 3Y+HsdxKxirsMFlWEH5Iyav1mE8DJAKtQej5M7gnZ/cNJ5Ran0vFJ+Mqchs6JGyDy7kGNzpCL2
 LZIxRqaWyl5VsYd3FrHyX7392vW3bD6EzupF8AAAA
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
Subject: [Linux-stm32] [PATCH 0/9] Mass convert GPIO IRQ chips to be
	immutable part 2
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

Following up on my first series with this second series
concluding all the low-hanging immutable irqchip conversions
in the GPIO subsystem. These are all I could easily
convert.

The remaining irqchips are not using the GPIOLIB_IRQCHIP
for one or another reason, or too complex for me to
deal with. Mostly they are using generic irqchip, and
I guess those are fine as-is.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (9):
      gpio: rda: Convert to immutable irq_chip
      gpio: siox: Convert to immutable irq_chip
      gpio: stmpe: Convert to immutable irq_chip
      gpio: thunderx: Convert to immutable irq_chip
      gpio: tqmx86: Convert to immutable irq_chip
      gpio: visconti: Convert to immutable irq_chip
      gpio: xgs-iproc: Convert to immutable irq_chip
      gpio: xilinx: Convert to immutable irq_chip
      gpio: xlp: Convert to immutable irq_chip

 drivers/gpio/gpio-rda.c       | 22 +++++++------
 drivers/gpio/gpio-siox.c      | 75 ++++++++++++++++++++++---------------------
 drivers/gpio/gpio-stmpe.c     |  8 +++--
 drivers/gpio/gpio-thunderx.c  | 26 +++++++++------
 drivers/gpio/gpio-tqmx86.c    | 28 +++++++++++-----
 drivers/gpio/gpio-visconti.c  | 50 ++++++++++++++++++++++-------
 drivers/gpio/gpio-xgs-iproc.c | 32 ++++++++++++------
 drivers/gpio/gpio-xilinx.c    | 23 ++++++++-----
 drivers/gpio/gpio-xlp.c       | 14 ++++++--
 9 files changed, 181 insertions(+), 97 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230316-immutable-chips-2-ad2808db8054

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
