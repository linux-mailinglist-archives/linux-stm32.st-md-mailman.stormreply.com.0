Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 366671481F
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 12:06:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3D68CA8E60
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2019 10:05:59 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEB4CCA8E5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2019 10:05:57 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c6so1292099pfa.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2019 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WKqEBPsoDpTtAdSfNyFLIMHr8olM8ej+c9mYA02GcCA=;
 b=qPWznxScaM12nn3xySR9qMH+ArqYqHs7zb1I5dnOfe5n17nWQ+RDgZ6egeXGBpx8jV
 2PNDhNE9D6uGZM1QTq+XpdQwg/4Ly0RZWY+dFS78niW8M/RGivNwF612wMA5SI11MYCI
 wD1hx9RvUAA6JQJFxW52OuaNp613fGfPv1eG9jI8V4wH2wEEnWlx82lERMz+xBBbveZh
 2Z7QcL4bRjkHZPTGLy3Q9dj/UWI4sqsf6qXrJy888kgl12mR4tOoxbmikstmIxoc8NYx
 Q/0TrWOv32gksWYxshsjOd/iz/Cv9fuavrSKL6/wZjfAu3OBhj791zT4N0g9Yhoi4Zag
 yu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WKqEBPsoDpTtAdSfNyFLIMHr8olM8ej+c9mYA02GcCA=;
 b=C9MTdTRyG58HoM1wbFbbk3tBHofbyU8/PVcPveru/OsnW12D7rgdDbBbw2nlK361PW
 uR6jmpIRdDuPwRTY9m+ZTQ0Z0TGysP6jYlECQI+KroiPZrjY1d8K58v8pV8mktiieAIL
 W6t9kKojbmYZWvuXbcbVEteSy+zeqgVrhmbFecuxP8+CE0SMkjp4hP3r6yNgmqtIjNH/
 086/oGbFw9kbmpGaR+6ueevo+5R/Op9Lxrddq6YJUaeN9UveYcPY+GukrCd5xTcMalr1
 0a+UQqE+IqsKCwvqbem0MyIsvKIOQtzvvZwrUVXrbB60Boga9cpzChX0+5UIXPziZlk6
 q+gQ==
X-Gm-Message-State: APjAAAV6dp8WmniKPIFQgfixAUU0W3BuupAobNexjkSRAGNxuo/zLc9V
 HFLpstTVu8IaMATLXFvtUpin
X-Google-Smtp-Source: APXvYqyvyMit260wxAd9y8a+eQMxKEDvoHWY30D7y0aGg8LJY2AhtCFPGP98qESpHbpY5zrFQ53WTA==
X-Received: by 2002:a63:9214:: with SMTP id o20mr30919321pgd.203.1557137156473; 
 Mon, 06 May 2019 03:05:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:611b:55a4:e119:3b84:2d86:5b07])
 by smtp.gmail.com with ESMTPSA id c137sm16229653pfb.154.2019.05.06.03.05.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 03:05:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Mon,  6 May 2019 15:35:33 +0530
Message-Id: <20190506100534.24145-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
References: <20190506100534.24145-1-manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32mp157: Add missing
	pinctrl definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add missing pinctrl definitions for STM32MP157 MPU.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 85c417d9983b..5efae4b4b37f 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -241,6 +241,23 @@
 				};
 			};
 
+			i2c1_pins_b: i2c1-2 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c1_pins_sleep_b: i2c1-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+				};
+			};
+
 			i2c2_pins_a: i2c2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
@@ -258,6 +275,21 @@
 				};
 			};
 
+			i2c2_pins_b1: i2c2-2 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c2_pins_sleep_b1: i2c2-3 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+				};
+			};
+
 			i2c5_pins_a: i2c5-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
@@ -599,6 +631,34 @@
 					bias-disable;
 				};
 			};
+
+			uart4_pins_b: uart4-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
+
+			uart7_pins_a: uart7-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+					bias-disable;
+				};
+			};
 		};
 
 		pinctrl_z: pin-controller-z@54004000 {
@@ -623,6 +683,21 @@
 				gpio-ranges = <&pinctrl_z 0 400 8>;
 			};
 
+			i2c2_pins_b2: i2c2-0 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, AF3)>; /* I2C2_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c2_pins_sleep_b2: i2c2-1 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>; /* I2C2_SCL */
+				};
+			};
+
 			i2c4_pins_a: i2c4-0 {
 				pins {
 					pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
