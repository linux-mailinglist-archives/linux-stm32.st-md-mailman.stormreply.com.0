Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0AD5E9514
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Sep 2022 19:52:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D6A7C63326;
	Sun, 25 Sep 2022 17:52:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE767C63324
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 17:52:22 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id hy2so9832669ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=HnihT0YSNz6xIyoJu2aFjZSjBQ0FEbSxs59ATuv5Ra1/tL44+b8p5ztPFWXSqLXReZ
 NE8XVJ6hsvCY5AP8ZJEl5/kOeAnitpitF0bAh63bDRpabZAzfutAiyYKnt3d0ZVj0vAh
 jZO0QooNBqd11esq0FCm9sXbvEAuERve5hxcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=q3v9D8aRDQ+Zk9rbgbLRZKfTASsm+cD1XrYMqdfJ8+iZ8jmr59FxnZ3sm1ud7xxjeF
 JwfxEmCKGvKgWgc7jMzlfpHKLlDBJh43zyrgnNiCjrvTYntYklW4LLAXIVmOR+ayi6e1
 fJcWc36aYmC9Pvms12v4XmQQFfB5/8rDnYWImJ54nOhYKM9GM7h9Kg+bOK1tKsXQmwYn
 SE+2BKSbnDUdZqXiktlq7buBGfPRlDikdq7PFQNdvburITk6359gQvpgtOT51dUYOkSj
 GrAYLqV5u+HFgg/2X8PaWww9RbxadbKmz/OE1EDsnqpLOD8LezzWSTogilpXGUbGfbpD
 ZFHQ==
X-Gm-Message-State: ACrzQf0+4gc3FQibAUHRhjbJ9TGwjgHUSGKLM/0X2l/qRlfFwFM+mlJ2
 TnhAU5QuvREO6o1NTti44948/w==
X-Google-Smtp-Source: AMsMyM5acRXX+ssw3njDDsVVdiOmCWOdz34aX9SwVevoL6aHYNwmlHMLUX4UDcyl1CRcECbsv/GM3w==
X-Received: by 2002:a17:907:2d09:b0:781:d793:f51e with SMTP id
 gs9-20020a1709072d0900b00781d793f51emr15050921ejc.628.1664128342518; 
 Sun, 25 Sep 2022 10:52:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-92-192.retail.telecomitalia.it. [95.232.92.192])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a056402161700b0045703d699b9sm3252594edv.78.2022.09.25.10.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 10:52:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 25 Sep 2022 19:52:08 +0200
Message-Id: <20220925175209.1528960-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
References: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v4 4/5] ARM: dts: stm32: add pin map for
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Remove a blank line.

Changes in v2:
- Remove a blank line.

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d42..8a4d51f97248 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -448,6 +448,36 @@ pins2 {
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
 		};
 	};
 };
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
