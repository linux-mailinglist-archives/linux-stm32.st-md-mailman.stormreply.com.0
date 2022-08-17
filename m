Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A995459813C
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 12:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31B52C640FD;
	Thu, 18 Aug 2022 10:04:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 450F3C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 14:36:45 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id w19so24901318ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Y2S6KTpUrSCMwTgBob27SzJraLan/JemfvDuj7xYqWU=;
 b=LkqmS/nuTe4L0Rkupi4DsAJtXZkFTQdISkC/iyB9PtyA61yMaF4nlGSkeusqWlMUnt
 r1fpeENu4q1L+v9eZWbahHChXADG73IE+n1pKrNirWQ4scowLEMgKA/qBgXHSlaHne82
 OKYe7NbnNB/MHuqRv+fgyiTrnHazfpqINvQTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Y2S6KTpUrSCMwTgBob27SzJraLan/JemfvDuj7xYqWU=;
 b=h51nepcAzy2zv6j0xRy2IwOUwq9x8M8XaWjuU1jt+3amHF+JgTmg6adnaIre0Tep5d
 2JVi3b3mI5hBzP6AvOaS2C2/l/P/WLBEkvBuxutTyFSR9BJ9SH6+utHVYH+AcmcmbNI8
 4w/HE/N0dS6glqKHQBwGnwrhArkE2PZ/mtFbpSi2JQfLSW6KXM8348rFGdWd9bBc7AUJ
 /BBfrZ7lHPCiBU862WFlq8e5zlygBAmZs9cKscNXIClKCopEO/wT2LsVmw8u0VA5cTNR
 ChO/W+AvWzCQxlww4sMdGO1WlMA55HSYsCZmp0bE8Acb4F2o0gp43K7dymZFQknv3uDk
 dEjw==
X-Gm-Message-State: ACgBeo3U8MtcoH6aN2iIothu+PVdEIMj1xlkCWBxg96bCOXRiFv0w7By
 tgSG/xKELAqTKsS3z0wPf1LP2A==
X-Google-Smtp-Source: AA6agR5QoDhPcIJQaxJ2yFbqnXDQ3RBBK8iLVB4b1GWGJHjhlhrI9ZiYMXiQ8QwQXSapwkM9ekdeuA==
X-Received: by 2002:a17:907:2e0b:b0:730:8aee:d674 with SMTP id
 ig11-20020a1709072e0b00b007308aeed674mr17258033ejc.104.1660747004949; 
 Wed, 17 Aug 2022 07:36:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa7c7c9000000b0043cab10f702sm10711982eds.90.2022.08.17.07.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 07:36:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 17 Aug 2022 16:35:28 +0200
Message-Id: <20220817143529.257908-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
References: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Aug 2022 10:04:14 +0000
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: [Linux-stm32] [RFC PATCH 3/4] ARM: dts: stm32: add pin map for CAN
	controller on stm32f4
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

 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d42..a8709363898a 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -448,6 +448,38 @@ pins2 {
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
+
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
