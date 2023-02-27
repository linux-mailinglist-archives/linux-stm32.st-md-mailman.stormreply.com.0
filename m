Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0C6A4C77
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 21:51:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F603C6A5EA;
	Mon, 27 Feb 2023 20:51:37 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4364EC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 20:51:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so31074217edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 12:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e124E0pr34PAN91uKXPAbGtavFgIogfWrydKthVEf0E=;
 b=Msljfd0DAOSV1Ng8uIK/mnFUzcITqVx7VNkBOQVwfqu7nD/mLOXNK+QL9hurrXRwFn
 W22/+c8iLbrDPOIExuNn6xorlSdGmNDZocrV4NhDMD8Dm3bnuuyL2lwLSBJiZQs3BAqF
 EYXQKn9EBAsLGT8Z+8bQyvV+taV8ZMcm7P5ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e124E0pr34PAN91uKXPAbGtavFgIogfWrydKthVEf0E=;
 b=k+Il4ALAwzhMnDwUPZKGrFlUdcHq4umSjDqW5Z/4KwUuRuDx2dWZWPnX6TSma/XoCX
 pOIxJKg4eeVjBHH+7FUpCdrFqVCiICdQwD9gNHnYLW80fZrWMIYu5nkt+cVfP6S2geW+
 JAfaIgMCDzncLY9rnUJoP4WuldlaPPDYrjj/Hg5pYS+8fSJpfbNR/4udk+SBW6GZPtk+
 dDrrSBgYHk1D8FMCSzG+eCMlPpZwUJB2ynvDUKulIJefpeJQLScObkhD7qm1f8nrSLH9
 azb+F5TsXdkLn1AL6PNwTtBwYvFdqicMxGBZ9v+JuoxtAdcJ284aT4GnezSchNF4Z6s7
 uk5Q==
X-Gm-Message-State: AO0yUKUJqEeqd+tjhYwyVnIi2NARZTvEdwK5EKiJ71EEc1An6XcRMgYn
 Mj8qm2i+D46NZOGyGzWaXIHYSw==
X-Google-Smtp-Source: AK7set/09hUebX3TUSz8Zk89YxuS48cruhUseyV6cCooMrzGlOnaU2lz/zSmizCZH80dS8HxpvF7Kg==
X-Received: by 2002:aa7:d98d:0:b0:4ad:5950:3f47 with SMTP id
 u13-20020aa7d98d000000b004ad59503f47mr963127eds.9.1677531095698; 
 Mon, 27 Feb 2023 12:51:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-22-12.retail.telecomitalia.it. [82.56.22.12])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a50871a000000b004af70a660a9sm3578032edb.75.2023.02.27.12.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 12:51:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 27 Feb 2023 21:51:31 +0100
Message-Id: <20230227205131.2104082-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: use dynamic allocation of
	GPIO base
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

Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using static
gpiobase allocation"), one or more warnings are printed during boot on
systems where static allocation of GPIO base is used:

[    0.197707] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.199942] stm32f429-pinctrl soc:pinctrl@40020000: GPIOA bank added
[    0.200711] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.202855] stm32f429-pinctrl soc:pinctrl@40020000: GPIOB bank added
[    0.203591] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.205704] stm32f429-pinctrl soc:pinctrl@40020000: GPIOC bank added
[    0.206338] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.208448] stm32f429-pinctrl soc:pinctrl@40020000: GPIOD bank added
[    0.209182] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.211282] stm32f429-pinctrl soc:pinctrl@40020000: GPIOE bank added
[    0.212094] gpio gpiochip5: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.214270] stm32f429-pinctrl soc:pinctrl@40020000: GPIOF bank added
[    0.215005] gpio gpiochip6: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.217110] stm32f429-pinctrl soc:pinctrl@40020000: GPIOG bank added
[    0.217845] gpio gpiochip7: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.219959] stm32f429-pinctrl soc:pinctrl@40020000: GPIOH bank added
[    0.220602] gpio gpiochip8: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.222714] stm32f429-pinctrl soc:pinctrl@40020000: GPIOI bank added
[    0.223483] gpio gpiochip9: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.225594] stm32f429-pinctrl soc:pinctrl@40020000: GPIOJ bank added
[    0.226336] gpio gpiochip10: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.228490] stm32f429-pinctrl soc:pinctrl@40020000: GPIOK bank added

So let's follow the suggestion and use dynamic allocation.

Tested on STM32F429I-DISC1 board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index cb33a23ab0c1..04ace4c7bd58 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1330,7 +1330,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 	if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
 		bank_ioport_nr = bank_nr;
 
-	bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
+	bank->gpio_chip.base = -1;
 
 	bank->gpio_chip.ngpio = npins;
 	bank->gpio_chip.fwnode = fwnode;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
