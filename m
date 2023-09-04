Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC5791C4B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 20:04:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB48C6B455;
	Mon,  4 Sep 2023 18:04:02 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 231ADC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 18:04:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so3659318a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Sep 2023 11:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693850639; x=1694455439;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ksy+qMH8R5yMGAjjVFzbsFFI2zjTwEmtMlu8ALYBj/k=;
 b=iCUbPs9x2cSgzkAn2BFPTBofAh0SOPr5tTeieIykPFN45NE9TygcBxNHRN/p6u6ubZ
 eOC/QGnIxwxIwN3kb6F9d7A8v4FDb+Xobtf3NDYg9YFbWKHcu47+amZHrDidpzkgY1fB
 AeCBrdHzQO/5pwv/IldEinxjgEW5a2GuAs1Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693850639; x=1694455439;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ksy+qMH8R5yMGAjjVFzbsFFI2zjTwEmtMlu8ALYBj/k=;
 b=aCg9SNbHJEH6iXXv8vGZuQGBTS6zBZiTEnJm4QsKGEe8DY/kDdGyQPYs2gnNYwK4/y
 Xx5HfGm3m9xDdHhhGD4spqfQJH/U62nvfzcwEsUWMLVHPxrIbcQ8Gft8xYBa4fF7GJno
 2hhMdHPAQuXga4Q/uiSeP74HeICYk9LLmnwWg9wUJO58CF2ETaGx0yFJ94FaUEo5KgFI
 4IiT5Ndgjj+nGr46jKwKblVpJTS6DtAl2WJOZ1Uhvnlqg6m7fajNE0YxK2mm4b97j6Kr
 Zu+6GeR0MFY8mtiUk5sT9FCxHV5WDqOdW3sm7RRNCPSTB3NwgGxUW2ire6aN6bVYHxU4
 0CZg==
X-Gm-Message-State: AOJu0Yyc+3yBJ3G/5Z4nzqpJXbIrbsNX5TNglBPGCY1qn+d+wyhy38ZO
 4leeDs7ZQ3brXdA+zTMmkIhr/A==
X-Google-Smtp-Source: AGHT+IGq4JH8DOnn0BjrvIwyvYcYGN0s+T35UCtMjciu7zlWRXTb4L3CORMOIrN7+8VqTKIbAY/7pQ==
X-Received: by 2002:a05:6402:4025:b0:52e:4789:bee2 with SMTP id
 d37-20020a056402402500b0052e4789bee2mr2389806eda.6.1693850639378; 
 Mon, 04 Sep 2023 11:03:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 y24-20020aa7c258000000b0052237dfa82fsm6123289edo.64.2023.09.04.11.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 11:03:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  4 Sep 2023 20:03:41 +0200
Message-Id: <20230904180341.923038-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32f7-pinctrl: don't use
	multiple blank lines
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

The patch fixes the following warning:

arch/arm/dts/stm32f7-pinctrl.dtsi:380: check: Please don't use multiple blank lines

Fixes: ba287d1a0137 ("ARM: dts: stm32: add pin map for LTDC on stm32f7")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 65480a9f5cc4..842f2b17c4a8 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -376,7 +376,6 @@ pins2 {
 				};
 			};
 
-
 			ltdc_pins_a: ltdc-0 {
 				pins {
 					pinmux = <STM32_PINMUX('E', 4, AF14)>, /* LCD_B0 */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
