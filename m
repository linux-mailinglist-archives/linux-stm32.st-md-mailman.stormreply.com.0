Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C945A3DC1
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 15:33:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D2ADC640FF;
	Sun, 28 Aug 2022 13:33:43 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE891C640FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 13:33:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z8so7329835edb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 06:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=olNapHSIxEXV/j68X2DSb6GA5s0CD+ILvvqYswhlRrM=;
 b=ptcQCXsHLLK3toTiJrVtNK1GifF5qfJRikV8CrxsZ2iTVLvrah6mSolRcQRnLycQ3P
 2dP3PGOipJStLIrORwrRYWysk8kuT3rvjaZt1boB1h/6cJ9L5HimwPp4tZMPDtM5TxOb
 OIRFEAgYPxIOIHEbFztlN6D76NLngRU5Kg8Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=olNapHSIxEXV/j68X2DSb6GA5s0CD+ILvvqYswhlRrM=;
 b=tkc+hi/ap62Y3LDkG0l8nFV1uwymT/X71nKCv+T2hge3foNMgu3Jx2rPYbD7zkt063
 4uPqKMHVfhdldYC/sjMHiCvlnVVCwE4k13wg+eQSgw6U3I0Z0090pEN7OOoJ42W1zFj4
 UCMc1yrE4IVsBwXouOsAjBVfmDmoJqAmwVHINEiClxXx1UiiZcKjXhjwYXb7wATYPA4d
 EoN+/tMZRiYxyD/XmiDr5IuD7euQt6JsBP3HStN1BWBkOVSdNuqAJ5FcXcDyUut19a3X
 4HwcnIxvCR5s1++/ySc2ojaQQ8KAEl8P6DXZ57iXXNRq+viWEAhpXkT0XZ09Ehn+/ASV
 kvZA==
X-Gm-Message-State: ACgBeo0FaAwOgoz8U8JzsaNid6Cu+lGRXJmQpEO5cSs8FE4RkBg9eBkZ
 /9y0FXDnyxZFSSKWufR7jEfJfw==
X-Google-Smtp-Source: AA6agR4C0hyJ+1kxqMtNtBNnuPblwiwNAMjYnzqwkv9YZm3cFwmNajdCri4JsEkrluZM4XKIVzLCfw==
X-Received: by 2002:a05:6402:3596:b0:447:11ea:362d with SMTP id
 y22-20020a056402359600b0044711ea362dmr13480103edc.117.1661693622388; 
 Sun, 28 Aug 2022 06:33:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a1709064ada00b007313a25e56esm3247669ejt.29.2022.08.28.06.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 06:33:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Aug 2022 15:33:28 +0200
Message-Id: <20220828133329.793324-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
References: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RFC PATCH v3 3/4] ARM: dts: stm32: add pin map for
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
