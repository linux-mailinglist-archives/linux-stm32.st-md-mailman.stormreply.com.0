Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 712626CAFBC
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 22:17:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EFC0C6A5FB;
	Mon, 27 Mar 2023 20:17:04 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F98CC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 20:17:02 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id d14so4421980ion.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679948221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QV3iGa8KiUlr1LClhXl1D1BGw0maVF3hcUmABXx2qKM=;
 b=frMVCmupB0FHFKpyJU1n8GWHF7S/mmcD8SbntDNhdLvpLXdVvkU+eukIa0ls1L0X0W
 wLYN8A1kbmvq1MQP2phYVMnEd914VROkeQ0Hc1bSE7gC1cF6LCcKK3ISj2xUz+hVgjyC
 cRbX1fk1iNd5tidmkIQSv3bsqGIS451XJr64A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679948221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QV3iGa8KiUlr1LClhXl1D1BGw0maVF3hcUmABXx2qKM=;
 b=phF1N+17fhegnYVfi5vkkwEcRNuuibkmFCEjXK0opxVLDUjaIrk0fGYLYGeCLGnbgY
 EQNPHp2ZrqyFmakwa+QtyIY/aXODkVYkFX7/XwXEHqeXFjprm9uucd08ehDyb/Y2vfLp
 km7P8NjdUO7/FeYNCpVS0z5Kg4URIZ/rSTR7b8/KGTVNEBTepeRjKFU+xsvniL+Peedb
 9+2bKkKi8iW8xqrdnhq5AxHcvsWcG1IYns5/XM5TY2TMJYe3e6gXt2IUg9kC7vJB+GA7
 ULrtV/gbtPN6NOvd393/ldwbeut+Z49AH5/dZd7S5oQfC5BEqaRRRT7NMskiLLq8vHmZ
 ab2g==
X-Gm-Message-State: AAQBX9fTnDmLyVfGdwdBSQFuuBOdzU6MKBPYTgvjU2+hnyS60f1mQ9yn
 phC8y1xbt/eOGiQDmjSHdxl95A==
X-Google-Smtp-Source: AKy350YJ8bkQ9g33O6WbkXo24i23Qsh/9clE8FLxMP+MDsv7aHOF/KaKoAsvEO/Fpuide3NpVJCCCA==
X-Received: by 2002:a6b:c90d:0:b0:75c:90f1:4622 with SMTP id
 z13-20020a6bc90d000000b0075c90f14622mr195013iof.0.1679948220980; 
 Mon, 27 Mar 2023 13:17:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-87-0-102-254.retail.telecomitalia.it. [87.0.102.254])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a02b1da000000b003a958f51423sm5594759jah.167.2023.03.27.13.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:17:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 27 Mar 2023 22:16:29 +0200
Message-Id: <20230327201630.3874028-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230327201630.3874028-1-dario.binacchi@amarulasolutions.com>
References: <20230327201630.3874028-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v9 4/5] ARM: dts: stm32: add pin map for CAN
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
