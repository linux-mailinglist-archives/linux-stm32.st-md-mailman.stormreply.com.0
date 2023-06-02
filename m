Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97F71FEE2
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 12:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8631CC6B44C;
	Fri,  2 Jun 2023 10:21:38 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C26DC6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 10:21:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5151934a4e3so2809369a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701296; x=1688293296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3QAQ0RCZfE4mrNQglSUgy3WeBMWWHrgZHNbJHgr6400=;
 b=MohSPCp+T2mvCwQJQkXDSr2pIIK7LMXED1x0wnhAoFrmm4pioP8C9Fn/ocKRM3MupC
 CI02i28lY02RqSnH2OZzpjdZoABhhGFzddmg8/goVFhG3mOlahW4m4iYu0WbNNGk/zvF
 iXyX4uwTIOY1CoqxTc9D+oePxqtntHmlW+ZS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701296; x=1688293296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3QAQ0RCZfE4mrNQglSUgy3WeBMWWHrgZHNbJHgr6400=;
 b=dNCY9eaT2qEZOmHFZtCd3f0Vxhw6dBUBzKstufihbX54Tt6lMJWulvy3iS1Lx8S3sx
 Ln3lNGkFKWjOL2N1wJ8CbT4XrPgBPve3QMG9h6vB9H/uJbW7AEN5G9M+GwsomPn7AZNz
 +azMgAcFEvzQqNy84ePRo4a+R0HbIjjODJbdkVDp+D8dnvpRgm+RVebMv0KlFrcopZLp
 eoVSG9P8U84tb9+OnkLyEzTOcNLmzrhH3CIx9Bod1g9jwyM/Ws+8eiqyD08Rb+45ZQDr
 OKOGULIfDCPJCAdlrM+VFQxy3qFrMDW672yqE+N3GVSd8hTbBnyc1e4rTVwne0zhsi1L
 WFUw==
X-Gm-Message-State: AC+VfDwy3B6hzsGx3ENRBY4qcPqZkRINhI+sakN2XHwbjFdHpuPYqlNX
 Lqm0QozZUDsId2Di/wchH57ZgQ==
X-Google-Smtp-Source: ACHHUZ4mSRyVJK7TLliTH0Gn8nnXNMMpX1PS+2bDrpqL11esL61U/z7qzKi946JmTQmikDOsCKgz4g==
X-Received: by 2002:aa7:d441:0:b0:514:9e3c:d82e with SMTP id
 q1-20020aa7d441000000b005149e3cd82emr1755208edr.14.1685701296176; 
 Fri, 02 Jun 2023 03:21:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  2 Jun 2023 12:21:18 +0200
Message-Id: <20230602102123.3345587-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
References: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/6] ARM: dts: stm32: add pin map for LTDC
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

(no changes since v1)

 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index 9f65403295ca..f3f90b9bcd61 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -365,6 +365,41 @@ pins2 {
 					bias-pull-up;
 				};
 			};
+
+
+			ltdc_pins_a: ltdc-pins-a-0 {
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
