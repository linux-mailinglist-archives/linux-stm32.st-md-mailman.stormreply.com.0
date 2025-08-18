Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D6B2AADD
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 16:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A8E9C3F93B;
	Mon, 18 Aug 2025 14:37:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 793BBC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 14:37:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afcb78fd0c2so56784066b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755527854; x=1756132654;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YMsmT8h0+DT9fjYWadJv14KoJwGukly6TmVYhBOPfZo=;
 b=KbiVwPiHHBsXHWjjpOXG6emgqyr2PEN7nU99VKoeWvTvKgcvM+rLaLyB0wK+/PY4ez
 SyNnSXR8N9zIjsdmbK4gtyyGqzphRfak7JKfiAWY3rnexXr/5ehExufRAjaPDl7igYAu
 Wm0AXaL+cATgxa9Q8ObbDhn7OXqHbmTtyQ6eGNd1o7mmfctJFBqVvM2dXTBzQ/FcyJc3
 38wE6v/rPNF0jmm3MdVauMYaD7maGs1HzGvTv1zWjKx8YmgUtn0ZA+N6Uov7bUjE4pPa
 0CCqDcbbaP+WWIGYwRIUHG/IRP32NRCx2Yx9BsaWBfgUmvAlPut4ZcjiX/JonXIgDsTs
 rl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755527854; x=1756132654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMsmT8h0+DT9fjYWadJv14KoJwGukly6TmVYhBOPfZo=;
 b=Lpim0IPTy4JVPwMYw87AF77d9K8vyLW5EN4n4Sg4//QlScTYyfuzZdCHOKW/irvw6J
 r+lIlEngccJU1pj9+hH1brkgnrGigVzNZWCq1cme96tjliabTBT5MDWzz6bnKGmt7vTt
 KiKn0zzfNhPRUYbhen0hk1Pf8d/8lMGkdPZYVcyF6nLGsmhd/Z8shopqCR6kGSKmP8Yt
 dbkCOoxLtpFqdnwQBSND7UdxojNMK0yKkK5I1XDK1qBCVHSBS5mOnxjace+KkuJ7KU8/
 Av/g5aU0dgiiOxs/7rm8DaZ8S6y85J/Iy9CAs7pkZFilexsqTPW+qvkhDTJYlW4Tg5TP
 6t5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIIAMiMkmRIyGhL90WaFSEnQ24wR66cInsig3kLnlh3fb+syQBJff5bE8frPzkaff+05QwHNF5cf3ykg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxqYKsYnwGIl5eZwuwiLG5StXb0kjPDcfqxZPPGHFVokFFogu1b
 FwJQcjluNL0HDqkmwFKyaQrZx7xnwYtOt+wNKvDBipa/DDEn+BT4BFzVwr8gkaWOBXY=
X-Gm-Gg: ASbGncsZH8HF1ABwb8qc9WmWT4bKFG58jVkHnD+Fu26Yo9mlwzLqpmD95pK2UG/9rCf
 CuXRltbvyZK5IpOSvk7pDKlndsSYluCv+arwknJyWa5tU7Z5AUdCJy8BvbdUfSqIW+3sDb8arPD
 URQKt8t8Oz8PBWHM0EXtz2MwIO4eNoMoamY8N/HJ2JwHjmUHpVPtq6Qep34nILdSQHItM1it5gT
 5ZDSJsWwVhXBXswfjEwZAmZ6P5NNvd6eqe2LcS2g6ohKkT8Pr2N8J69a2fFPBPHEaZd7/pSeHl9
 p4twJmNkfmLLDcyukzFkWQdR1kQgKqz1J+VyXAdRu5LQdBjzHhMb19pp6ZFJCTd2tbp8poNAwU3
 IopiCSaTit3M1WmRo4mL47+oI6F4IVkBGfA==
X-Google-Smtp-Source: AGHT+IGEt3nsu4aHRovyycnvzxGKQTMOhKdYlCUCXv7/JvtZLGn3dwu1jc2cK5FnprCTehHbYLnZyQ==
X-Received: by 2002:a17:906:40cc:b0:afc:ebfd:c285 with SMTP id
 a640c23a62f3a-afcebfdc45cmr327163366b.1.1755527853856; 
 Mon, 18 Aug 2025 07:37:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53f37sm816752166b.21.2025.08.18.07.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 07:37:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com
Date: Mon, 18 Aug 2025 16:37:31 +0200
Message-ID: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3879;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=yyS1Kqa6YjNQyzYaGdt68e52WccpJuLwtYCRzw/J6gI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoozqqlSZHPCX1JVOLnWGeDyGAz2oBjWeBgmsSm
 mPxRUw6D7+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKM6qgAKCRDBN2bmhouD
 15tTD/4mYTyNavHV0cMsp4HUZQUgzwJDBkUxjibEQCPqdYAlZ3NfPN78IOtHpB+1ICSA7AiHwEH
 XvD146rmBVwaVVI5I6RXrgFaAkImu6dSgjJJWxV/BZThEmkTRymxGhKHyIV2HFnfIV41pFnoh+s
 PA8Upx+IRiWcVcu+qS+sM8S7wrIUCsqNUCvPkkeDottSR2MHnF+ZbvjVFJ3H2NJ0MbDPrHtyZph
 Xc3+G3uZ/SZy5jAcHnsv4K7yenlUZdmNZbgFoyMcMttEnl9X743L7lgSNRe0x2Pj1KhzAaL/0vG
 iLLK2TjN7HUP6sw5ZmGkaM+05WXJuIGilYbNgt893aVnr1/4He9FZbch1b4IRFdeUI9ypSKMl+V
 zfDNDUXI+0OQ5CPRVxTP0g8Ny7YGIWPd3nNN9Ocu8Gr/dprYPv8xUj4kDTb4JZcttvFq/O41ZB7
 ffc/qQ33grySJOHKqJ+nez6upL5iPbi6VnELUc3Std1p/a2IkiEyDQpd4MQ+VNnY9Hz4kHyTz8V
 obVltkt0ZtSDFhwfL+/DIIcF5fJVptbNeOrNqFneWzSXSAlHw00SHLa8mKwXTcvNzHU7Ml18qEb
 +/U7ijgJ90xxbKJD+UJnnXqqr284UWIaqf5j3gBpqLXLyqcEUqrMkh1D7E0nAaoIrFxZ9VSKCPv
 zKQDgBrudjsJvCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] arm: dts: stm32: Drop redundant status=okay
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

Device nodes are enabled by default, so remove confusing or duplicated
enabling of few nodes.  No practical impact, verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts          | 2 --
 arch/arm/boot/dts/st/stm32mp157f-dk2.dts          | 2 --
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi | 1 -
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi  | 3 ---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi   | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 1b34fbe10b4f..78165c7865e1 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -45,7 +45,6 @@ panel@0 {
 		reg = <0>;
 		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
 		power-supply = <&v3v3>;
-		status = "okay";
 
 		port {
 			panel_in: endpoint {
@@ -71,7 +70,6 @@ touchscreen@38 {
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
index 43375c4d62a3..8fa61e54d026 100644
--- a/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157f-dk2.dts
@@ -51,7 +51,6 @@ panel@0 {
 		reg = <0>;
 		reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
 		power-supply = <&scmi_v3v3>;
-		status = "okay";
 
 		port {
 			panel_in: endpoint {
@@ -77,7 +76,6 @@ touchscreen@38 {
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-		status = "okay";
 	};
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
index abe2dfe70636..52c4e69597a4 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
@@ -62,7 +62,6 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index 0fb4e55843b9..5c77202ee196 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -20,7 +20,6 @@ display_bl: display-bl {
 		default-brightness-level = <8>;
 		enable-gpios = <&gpioi 0 GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_panel_bl>;
-		status = "okay";
 	};
 
 	gpio-keys-polled {
@@ -135,7 +134,6 @@ sound {
 			  "MIC_IN", "Microphone Jack",
 			  "Microphone Jack", "Mic Bias";
 		dais = <&sai2a_port &sai2b_port>;
-		status = "okay";
 	};
 };
 
@@ -150,7 +148,6 @@ &i2c2 {	/* Header X22 */
 	pinctrl-0 = <&i2c2_pins_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
 	/delete-property/dma-names;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 142d4a8731f8..4cc633683c6b 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -269,7 +269,6 @@ pmic: stpmic@33 {
 		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		status = "okay";
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
@@ -388,7 +387,6 @@ onkey {
 			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
 			interrupt-names = "onkey-falling", "onkey-rising";
 			power-off-time-sec = <10>;
-			status = "okay";
 		};
 
 		watchdog {
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
