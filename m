Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A307B6C6E
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E2E1C6C831;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 977B8C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 17:14:12 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4542d7e9bcfso11780137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 10:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696266851; x=1696871651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Mtj4NCPRxZ6VOa3hAfKfXCzeZnGQjZkkPegFeXl3ak=;
 b=UjWHSKAfjp9cLVaqLpUM9dmoxi19HG6IrGAiCtS70cA+9I8Dh3s6cssp/EQS/CJREA
 zohbfw0FqXJDswD+GTG6oH2pLDi4dL9xN+7pGv3n2NxLGCWNAH7T+Wp1QRIiBuLZdCiA
 b4vyi4WlwpsrRS8K05/+tYVrB6/Os2tX0PigctmqeNIIse0oHXvcrORO3l5BL/bv1r2k
 Rru4Nl/5stBgVrdcHDMSsBC+llDdjITG0ZbO4+as9s1Hf5Y566nUo0zRwY/OQ4l8rn21
 cfLNtDmb5AJFKnRMoxFmorifrSrwxGQiUh4UaNU11ufbmFzocrzCa4xnzsIJJ2bAHxNh
 fjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696266851; x=1696871651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Mtj4NCPRxZ6VOa3hAfKfXCzeZnGQjZkkPegFeXl3ak=;
 b=MDHgFRIDDjz/XbVI0Nx6akMn1G0PltHL45vVcjMQgxbWHfFsEKb4c0kYrejjWJldxq
 +X0dCFk94j3nFhvlE5eURL5ugZD66aDMu1rV3rawRDAiYUWToT6tsiwS63mFepQ/otsy
 xNHZQOl/YbJ4BNnzC6xSbrs2nqDfsaTxNXZRQhI/meG/jd0jrh5zgrTNeuNCXcYqr6sF
 za6IBnZbtJiHO8ltUK8Zv7bnjUK/hZfUq6eBKAsPyoYmXclgwobypUQb98chsqBYtfxC
 SCwxvmJy7uyk0ATUWqJLA3h7vBVlvFstJCnCD8Pz0SHvUrnz5N7H8/H9NCfk4PNJ/4mp
 B/qw==
X-Gm-Message-State: AOJu0YyOHZfEYyrestrNQl+KdYm0RXlkZ5XBlvPPbBJ+lUDoqzsL++BR
 tZQfrj/7YcFI2oDq/P6PFX/pbkyhceJTfQJV8b7eOw==
X-Google-Smtp-Source: AGHT+IH3XNpYfmGvb7OL9Qkhu2zYZC2IvCPU6H6n+N4txNDekG4/DSCJW9S/TxcZ4yyvcTicsIFB7Q==
X-Received: by 2002:a67:e8d0:0:b0:452:8717:1fa3 with SMTP id
 y16-20020a67e8d0000000b0045287171fa3mr10481368vsn.3.1696266850932; 
 Mon, 02 Oct 2023 10:14:10 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dy52-20020a05620a60f400b007678973eaa1sm9132660qkb.127.2023.10.02.10.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:14:10 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon,  2 Oct 2023 13:13:38 -0400
Message-ID: <20231002171339.1594470-2-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
References: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add stm32f7 SDIO sleep
	pins
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

Add SDIO sleep pin definitions that place the pins in analog mode to
save power.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 9f65403295ca..26f91ca0d458 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -253,6 +253,17 @@ pins2 {
 				};
 			};
 
+			sdio_pins_sleep_a: sdio-pins-sleep-a-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1 D0 */
+						 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1 D1 */
+						 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1 D2 */
+						 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1 D3 */
+						 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1 CLK */
+						 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1 CMD */
+				};
+			};
+
 			sdio_pins_b: sdio-pins-b-0 {
 				pins {
 					pinmux = <STM32_PINMUX('G', 9, AF11)>, /* SDMMC2 D0 */
@@ -284,6 +295,17 @@ pins2 {
 				};
 			};
 
+			sdio_pins_sleep_b: sdio-pins-sleep-b-0 {
+				pins {
+					pinmux = <STM32_PINMUX('G', 9, ANALOG)>, /* SDMMC2 D0 */
+						 <STM32_PINMUX('G', 10, ANALOG)>, /* SDMMC2 D1 */
+						 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2 D2 */
+						 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2 D3 */
+						 <STM32_PINMUX('D', 6, ANALOG)>, /* SDMMC2 CLK */
+						 <STM32_PINMUX('D', 7, ANALOG)>; /* SDMMC2 CMD */
+				};
+			};
+
 			can1_pins_a: can1-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('A', 12, AF9)>; /* CAN1_TX */
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
