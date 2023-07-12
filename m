Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8BF74FF2F
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21583C6B45B;
	Wed, 12 Jul 2023 06:29:27 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9F1CC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:29:25 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so103016641fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689143365; x=1691735365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jaFWUw9gKjfe3Ukcvgb1jp0d6hB2t/eCpjIsrYyKWTo=;
 b=fQehUMh02IXnUqs11ZSMB8+hM0rieOkvTmwEQVLV8VBy3v5+bd5MX5ualkxI3PNskM
 YmZxZCcv5uoER6qjccIz/NAoGEl+hVnbQpOq7L4mVnC8PUe7QVoEleBQoItSZpn6PlVL
 jhPthpmFJZOUGriG/kDZ6YRm5qlB2pkrK7IHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689143365; x=1691735365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jaFWUw9gKjfe3Ukcvgb1jp0d6hB2t/eCpjIsrYyKWTo=;
 b=A8ah7MqM94kZV7qqrgyRzALTuAyQie71MBK5DPVuNcZDRTMmoI+Eadi2Lum0RVvp1x
 M0sVCaBDBL/hqmB88bo1DOm/E1jGYdrGZgU0vfqAIqU0CAQXy2ghxB0IblG62vCc4AMT
 Y2sNrO3jaI7Kwj9YRNyhJnmSkGBEHZ4trR/4Cq2/rlvWjrhEzDxy4+qUYI8iX24Ais78
 kiMoKDysPHHiPVEc3SBgLrTtOamSiNgQhcLxPbspbq3UQfqLC1QWv3ZMJJD++nbvNj9g
 opfeXlULQthtM3MvKiT/10SEHXeYd18Y+5ibXX8llW3SeeArXzpLMaNvce4GIQz1uVe4
 aq3A==
X-Gm-Message-State: ABy/qLaDmDVSpE7cOHZ9kbiFe8SIcEjibzt1HAzl3dXFeTPqp/i5j5GJ
 eFEJr+kYjFDWHhc0W3U10Ho41g==
X-Google-Smtp-Source: APBJJlFddfjiNpXl3v97FZcNWYumrgBFlgTdW/il742NBF7QIBsu0Cys8eDGmBLoo0Jnlw0299DeFA==
X-Received: by 2002:a2e:8699:0:b0:2b6:9ebc:daf8 with SMTP id
 l25-20020a2e8699000000b002b69ebcdaf8mr15337445lji.31.1689143364867; 
 Tue, 11 Jul 2023 23:29:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906371500b009890e402a6bsm2065390ejc.221.2023.07.11.23.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 23:29:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 12 Jul 2023 08:29:17 +0200
Message-Id: <20230712062918.2248573-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230712062918.2248573-1-dario.binacchi@amarulasolutions.com>
References: <20230712062918.2248573-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 2/3] ARM: dts: stm32: add pin map for LTDC
	on stm32f7
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

Add pin configurations for using LTDC (LCD-tft Display Controller) on
stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 9f65403295ca..36dad40dd0c7 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -365,6 +365,41 @@ pins2 {
 					bias-pull-up;
 				};
 			};
+
+
+			ltdc_pins_a: ltdc-0 {
+				pins {
+					pinmux = <STM32_PINMUX('E', 4, AF14)>, /* LCD_B0 */
+						 <STM32_PINMUX('G',12, AF9)>,  /* LCD_B4 */
+						 <STM32_PINMUX('I', 9, AF14)>, /* LCD_VSYNC */
+						 <STM32_PINMUX('I',10, AF14)>, /* LCD_HSYNC */
+						 <STM32_PINMUX('I',14, AF14)>, /* LCD_CLK */
+						 <STM32_PINMUX('I',15, AF14)>, /* LCD_R0 */
+						 <STM32_PINMUX('J', 0, AF14)>, /* LCD_R1 */
+						 <STM32_PINMUX('J', 1, AF14)>, /* LCD_R2 */
+						 <STM32_PINMUX('J', 2, AF14)>, /* LCD_R3 */
+						 <STM32_PINMUX('J', 3, AF14)>, /* LCD_R4 */
+						 <STM32_PINMUX('J', 4, AF14)>, /* LCD_R5 */
+						 <STM32_PINMUX('J', 5, AF14)>, /* LCD_R6 */
+						 <STM32_PINMUX('J', 6, AF14)>, /* LCD_R7 */
+						 <STM32_PINMUX('J', 7, AF14)>, /* LCD_G0 */
+						 <STM32_PINMUX('J', 8, AF14)>, /* LCD_G1 */
+						 <STM32_PINMUX('J', 9, AF14)>, /* LCD_G2 */
+						 <STM32_PINMUX('J',10, AF14)>, /* LCD_G3 */
+						 <STM32_PINMUX('J',11, AF14)>, /* LCD_G4 */
+						 <STM32_PINMUX('J',13, AF14)>, /* LCD_B1 */
+						 <STM32_PINMUX('J',14, AF14)>, /* LCD_B2 */
+						 <STM32_PINMUX('J',15, AF14)>, /* LCD_B3 */
+						 <STM32_PINMUX('K', 0, AF14)>, /* LCD_G5 */
+						 <STM32_PINMUX('K', 1, AF14)>, /* LCD_G6 */
+						 <STM32_PINMUX('K', 2, AF14)>, /* LCD_G7 */
+						 <STM32_PINMUX('K', 4, AF14)>, /* LCD_B5 */
+						 <STM32_PINMUX('K', 5, AF14)>, /* LCD_B6 */
+						 <STM32_PINMUX('K', 6, AF14)>, /* LCD_B7 */
+						 <STM32_PINMUX('K', 7, AF14)>; /* LCD_DE */
+					slew-rate = <2>;
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
