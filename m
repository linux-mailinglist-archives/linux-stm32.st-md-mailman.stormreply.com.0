Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F86BBE93
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 22:11:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC9BC69053;
	Wed, 15 Mar 2023 21:11:07 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89F0CC69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 21:11:06 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ek18so49568476edb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678914666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QV3iGa8KiUlr1LClhXl1D1BGw0maVF3hcUmABXx2qKM=;
 b=ohOAJfTr7KdZGoWacsyDi1q2g6iQWcxDkyS31OPkkLXWzu65VmmNVOAW2rrfOba+OK
 nZKj634RL1nZLy3BUnbpqDGxSIiO1KiFLIoFwqDfXRBVtiG3pbeoJW5R341asYxjydba
 HbJ/YHH9KBOMgap+SHjm8iAaiFMqZ+Ufz8pPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678914666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QV3iGa8KiUlr1LClhXl1D1BGw0maVF3hcUmABXx2qKM=;
 b=PRQmK9HYauM/V+KECSC6OQehq0227iFytPRpI/jhLqst/XD8hJdRCKooFBhEKth5/5
 dT9LQAbhPUvcchOFRcjS4hWpJFpbJ50qN59Cvah5eeR4fq6z9CmY03e2e2ZkqneV9dQU
 uDFvLXg1L9obeW26faLj72fJC19lR+UMcjlpi5OgYV2fkGo4Y0ww0iZReJmyVuwmBokh
 7x693BtgZPnS1r4vQoIpvfVKH6WC61jxBj45QKNGjh8EM4UBK+H8eNFqButgEb3ICNwY
 vleCUmBe0qxorAF0hj8XzO0zo53Aj+mGFb2lUkNQ5/UivJcMgKymmnkJ+IzeMc7l3U/i
 S6OA==
X-Gm-Message-State: AO0yUKWgv7vgFLGmRgyjqJZVrvShqsLGJ2vGI0EyxsnxRJk2fh1mDOsw
 DJmtEhA6cAswDJ1ShJcFE3wyTA==
X-Google-Smtp-Source: AK7set+7qbhTZf0gnRIKNdrZ64AhZR6PoCD9a/ttHDAz8LZ5/kkhFKxcBjVJTkOpXjg9hsXiTU+qog==
X-Received: by 2002:a17:907:b021:b0:92f:b8d0:746c with SMTP id
 fu33-20020a170907b02100b0092fb8d0746cmr1467931ejc.20.1678914666235; 
 Wed, 15 Mar 2023 14:11:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-0-96-89.retail.telecomitalia.it. [87.0.96.89])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170906600f00b0092b5384d6desm2965366ejj.153.2023.03.15.14.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 14:11:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Mar 2023 22:10:39 +0100
Message-Id: <20230315211040.2455855-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230315211040.2455855-1-dario.binacchi@amarulasolutions.com>
References: <20230315211040.2455855-1-dario.binacchi@amarulasolutions.com>
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
index 4523c63475e4..3bb812d6399e 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -447,6 +447,36 @@ pins2 {
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
