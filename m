Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F07A9E079
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F56CC7802E;
	Sun, 27 Apr 2025 07:44:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C271C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso33797525e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739849; x=1746344649;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
 b=kQ83fG83fYwCmOrF/h/pHrFLQH5f1hgBTaAmTCR/p31cJ3pY5uFWJY1no5RTXvntis
 s4S2jAHKOTQgdInn/CA4Z3K4e3aVOiza5k0E3Jeql7eu8aIld9kGp5tbnW6pM3P6aMGK
 YYSgCsVu2fQZRkgGGyc+OlBXdS5zD2d9uL77w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739849; x=1746344649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=noNFGyMHn+G12oU3fMyt85bZyrL7/rnSlw7jXK1JU9I=;
 b=uc+7vrn55hocdD4MDfc2Yl55FI2JpA0pWmsaaHDJnmnBlXEpVoqCtaedInhZE0mo+a
 Zmgqp1HD2j9X/I7MQYQK6/xeyUhurjjauBXR+x5PGi+9pRyS7tNTlzDP4Ed6HclJq21b
 HysmsrnAoCVGHWb+Wqq08kzJtl5OGV88LdRwh8OZGx9GNnbTWP4KegFhKdAuHxnCQ27q
 Vc+Q0dG/joo+HGZOJ0LkgjsvxbmiXppmj52kq4VN1zoqThbB3bbHhxo4i0S5mw8/vktJ
 riqF8j4mTYunZh9DsWfgeVOA78bqlStdoLOCelFKS3mw50rnIMtCQMMqbL45CiEpYxxl
 tsug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeZD7cWn4QNYuzw+g2gKrZx0/zA+zyfgiRH3RMotw6CTiZoJSvzUauboL9eXb8peym76Da4Fkfla7bSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymPxILMW1bHtFR4JzoE95SyFJI5gZqEmrMCEin7CjkK09j44Ql
 sM2lnkhI6dvf9BqdRfdHdwBFTXWDFBLN5IX49NEIqdpU7saaFKI5853RIK57UG4=
X-Gm-Gg: ASbGnct5S2YY9uXkfSOI6mmvYPbFiOUZ2GuK/0v/flV2mY+dcII+eLLkpegVEQXw6qA
 Oqh+xLbrEaUAVEHB+CBhXAN8Yc/xXn5ChT/RH69+g7Vfddd4ZTTjll1tracvtsExghhkS3Ts5lR
 1ARbW8me7lzO1iR92V6dIskdfJpqeUEPKC5E4FRVbSq0aWKSl6qi++MLqEg1YBRR53CLvT3ai4h
 9f8vZKXUNZJrg33+/5+XgGPZr2eFT9sNiNW8/6RqwyhCnYYfdgEL8G/0xRHv3grErGIWQHbYJ3k
 0p/OcJ4OOUPMmPCEW0fJVOx+9ygZlVnpHAyQIQN2R5tf3nmvy+YbgjidMeRJQbz6N3vtD17rvPA
 YYXhghYIPUMag7VdN
X-Google-Smtp-Source: AGHT+IH4VnwQA0G2EjuoChB3GFw2EN00/9sNtBiR6r7qJ1qzu/LcPcmBTKtOPPgOwsnIXhXKwnF/jA==
X-Received: by 2002:a05:600c:524a:b0:43c:fbe2:df3c with SMTP id
 5b1f17b1804b1-440ab845dfemr33087695e9.26.1745739849570; 
 Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:20 +0200
Message-ID: <20250427074404.3278732-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] ARM: dts: stm32h7-pinctrl: add _a suffix
	to u[s]art_pins phandles
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

Allow expanding possible configurations for the same peripheral,
consistent with the scheme adopted in Linux.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi  | 8 ++++----
 arch/arm/boot/dts/st/stm32h743i-disco.dts  | 2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts   | 2 +-
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts | 6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
index 7f1d234e1024..ad00c1080a96 100644
--- a/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi
@@ -198,7 +198,7 @@ pins2 {
 		};
 	};
 
-	uart4_pins: uart4-0 {
+	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
 			bias-disable;
@@ -211,7 +211,7 @@ pins2 {
 		};
 	};
 
-	usart1_pins: usart1-0 {
+	usart1_pins_a: usart1-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
 			bias-disable;
@@ -224,7 +224,7 @@ pins2 {
 		};
 	};
 
-	usart2_pins: usart2-0 {
+	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 			bias-disable;
@@ -237,7 +237,7 @@ pins2 {
 		};
 	};
 
-	usart3_pins: usart3-0 {
+	usart3_pins_a: usart3-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
 				 <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
diff --git a/arch/arm/boot/dts/st/stm32h743i-disco.dts b/arch/arm/boot/dts/st/stm32h743i-disco.dts
index 2b452883a708..8451a54a9a08 100644
--- a/arch/arm/boot/dts/st/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-disco.dts
@@ -105,7 +105,7 @@ &sdmmc1 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h743i-eval.dts b/arch/arm/boot/dts/st/stm32h743i-eval.dts
index 5c5d8059bdc7..4b0ced27b80e 100644
--- a/arch/arm/boot/dts/st/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32h743i-eval.dts
@@ -145,7 +145,7 @@ &sdmmc1 {
 };
 
 &usart1 {
-	pinctrl-0 = <&usart1_pins>;
+	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..00d195d52a45 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -197,14 +197,14 @@ partition@0 {
 };
 
 &usart2 {
-	pinctrl-0 = <&usart2_pins>;
+	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-names = "default";
 	status = "disabled";
 };
 
 &usart3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&usart3_pins>;
+	pinctrl-0 = <&usart3_pins_a>;
 	dmas = <&dmamux1 45 0x400 0x05>,
 	       <&dmamux1 46 0x400 0x05>;
 	dma-names = "rx", "tx";
@@ -221,7 +221,7 @@ bluetooth {
 };
 
 &uart4 {
-	pinctrl-0 = <&uart4_pins>;
+	pinctrl-0 = <&uart4_pins_a>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
