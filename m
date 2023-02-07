Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4C68D575
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 12:30:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D9A6C6A5E6;
	Tue,  7 Feb 2023 11:30:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5325C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 11:30:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12943409wma.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Feb 2023 03:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=PmQjSqc2eo0bO85LD0FWqEcnKXTUWseHi0CKZvgjE3BxNv8yr81bHxTNHFuWjcvj5G
 LrWP+BZZqWwC9XT6hH3SefMuhhMax5ThFQQLAH+2ymUgSvot0FNl6b5QvJAo+s9rhNys
 ovaq0vtOPc8vr12TUIFYy73lxwOFH0gCpOGbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfErmyZAWFClEhl0ayKENaiIcOOkglWFws7K0nbLI8s=;
 b=3dXHgpGSpXRA2D1NB2/gYlgNqsKy5VV2Ac0InaEtRB6N0MA1CnquCWVoXVjtpHoJVy
 FsZVBjnJqtozaLPoLdSAMKWU975DmnL6h7W0xspIwqAGGC9qBfjQDiuTu0+5RyhAwOal
 clPhPlIfu4lfgk1KgsZB2sEKZQDGfFJsySpF5RFci99Dug9oOkWcF7oou+Si/YGtQ1hY
 6hrcD55z8ldBi8n25IR0ykpMQ84gQqcoGWkibY3JqwBm8BeMa6ikbAxD+Vru0ITYqyCB
 +aeIO9iPogjNoNe/O1zeViNe99t+7f7HjjASCN/pWjUSjBzMxyHCEushSr9HomZjuJdv
 gP6Q==
X-Gm-Message-State: AO0yUKVN0cKc8+Uh98AUHPlXADd1oZoeWMqiWbRhFkMIY0NkDB9w0vn/
 DfvgkVtMqxuTJ6p4huY3ygGWug==
X-Google-Smtp-Source: AK7set+X0SuZ9Z8NHEx4eYmZi7vfXUh6rnqA9Df2ynWg95UYbPmGMjxLmg94xV0mLVUkh/2lKBCkbA==
X-Received: by 2002:a05:600c:4485:b0:3db:887:8c8c with SMTP id
 e5-20020a05600c448500b003db08878c8cmr2882940wmo.27.1675769400595; 
 Tue, 07 Feb 2023 03:30:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-193-20.net.vodafone.it. [5.90.193.20])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db012d49b7sm2020827wmb.2.2023.02.07.03.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:30:00 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 Feb 2023 12:29:25 +0100
Message-Id: <20230207112926.664773-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230207112926.664773-1-dario.binacchi@amarulasolutions.com>
References: <20230207112926.664773-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RESEND PATCH v7 4/5] ARM: dts: stm32: add pin map
	for CAN controller on stm32f4
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
