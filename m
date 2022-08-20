Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5159AC95
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Aug 2022 10:30:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E04C9C64100;
	Sat, 20 Aug 2022 08:30:10 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8002EC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 08:30:09 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s11so8062346edd.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=lWZi59XScjXJ80MDC5jcujdInKKUzRF+AceVZxJZy/4=;
 b=Pl93p40mRr8ZVgXAZEBtmxL0RVPcWJvjmkqG8a948yFu/ef/W2+raIBtyhHGdWm09s
 nU6ic8dp1mnqm5/vjmuSHXbsApqkyjH8ItftqqFupeIyM9/DD0XnM8OYLB73hvXTbU22
 cK+rXh91VdHklECBq3ziG39pN/2/+f7GjRiMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=lWZi59XScjXJ80MDC5jcujdInKKUzRF+AceVZxJZy/4=;
 b=maD86eQbM2IeIH+P0qKegCRKT309rNOpoQwyIES+xjICvq9z+YQFKuEU2gKBkk0e0e
 Tnoboi5aW/8YuFo6fhUAMZdMkdz8EKnFxkr3rimD9bg3zPUeQhY3Z2gi9ku0pmEuq9CY
 CTx8oB9V0fF/QgLfOHW0g78rEv8k3d7THSyEu/N32qXLqnkQ9QPyS665Xi89PI3KT/g2
 13Hpt8Hn8yZxbxng7XelVLhteQyPA3jkjsUvMje9XL6i/90+czVZZzS5B9ivW4VtD/vR
 Uz+aiqcoL5u5Yrn+wUun0jUeB6OK6cqdPSTqPhYYJ/8fyT9YoPDXBF/UbTLf/zbFH352
 UQ9A==
X-Gm-Message-State: ACgBeo3y+9fVoSB9Vkdt1poDEEOswVr/GIWkBBlTz/qFeaJNbTFhV23w
 EOp/jEppBHT7SsKnifzqtgbBAg==
X-Google-Smtp-Source: AA6agR6HoVv6K1JfDzqNlGHyOC7s8UkuUTM/czwKoSt7sLoTofnhIwzulOB9wBrhLPMwFJfWrreqVw==
X-Received: by 2002:a05:6402:3288:b0:446:5d0b:1b26 with SMTP id
 f8-20020a056402328800b004465d0b1b26mr3270132eda.379.1660984209209; 
 Sat, 20 Aug 2022 01:30:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 gx14-20020a1709068a4e00b0072b33e91f96sm3336112ejc.190.2022.08.20.01.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 01:30:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 20 Aug 2022 10:29:35 +0200
Message-Id: <20220820082936.686924-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: [Linux-stm32] [RFC PATCH v2 3/4] ARM: dts: stm32: add pin map for
	CAN controller on stm32f4
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

Add pin configurations for using CAN controller on stm32f469-disco
board. They are located on the Arduino compatible connector CN5 (CAN1)
and on the extension connector CN12 (CAN2).

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Remove a blank line.

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d42..3a9c3180fbf9 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -448,6 +448,37 @@ pins2 {
 					slew-rate = <2>;
 				};
 			};
+
+			can1_pins_a: can1-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 9, AF9)>; /* CAN1_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 8, AF9)>; /* CAN1_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_a: can2-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 5, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
+
+			can2_pins_b: can2-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 12, AF9)>; /* CAN2_RX */
+					bias-pull-up;
+				};
+			};
+
 		};
 	};
 };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
