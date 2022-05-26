Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDF2535483
	for <lists+linux-stm32@lfdr.de>; Thu, 26 May 2022 22:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED3A5C0D2C0;
	Thu, 26 May 2022 20:36:51 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8487C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 May 2022 20:36:50 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o28so3158605edi.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 May 2022 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0xCGQvvUGQaE5nD3AhNgDDTCkjpXLMHYug+OugGhLH0=;
 b=Twyo2Su5UAgxeN7qKIrQ1vclQVUGHHVefW54I++4vRwJK4H6KWuuy9suuHEq58XgQO
 8U5a1P6Fgg4qunOy5D7v5am1del8uVkfl1j7RBIZ32TWYuskIV+Z02licFV0tcTUq7G1
 C2k5R/JPSypSJr9S23eeTizw9keKK6DhIECQJIBBEceEa1S9dZ/qswMr5K9HdielElkq
 6YtNDqlnzvzlY/lkQtRhtabUd4cySk8AqV8iEc0cs4V5pH8VSXvke6gcFbNrL7mdLjS/
 tdn/tj+3Hic7PWveY3O0y3AqvP9PYKCdnrmvCE3PwjlCoR5j92RD1OA2zXYcJ1TfpBTT
 LamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xCGQvvUGQaE5nD3AhNgDDTCkjpXLMHYug+OugGhLH0=;
 b=eoIA4l2UN7bgPhJquXyqX0Sb0C7dbFezu5k1vztH8UnP2Is7XnefY4baO10Whj2ie+
 9ikB+Ft35nK3KJ8CYlIBNMvdOWwdfmsQBEgyT3WLiYVboMfiu2IwKU81XiFjPn/UwtW9
 x+oKB4/deSraOY05u62xnNxcP0d9jdyTLwUjgHhfs5b4ELoaDdQ71UvDc7lt9iIy7+85
 EU1ii98T0FjeWCO1b1+ysif8j2SLHjVsZO5heEiEdGUfpyaMfW5U1o2T/Cl5VE9GYu0L
 6WEH1Xk1ZdR/USj2FQy7l5uPTmmBufweoK/VIzb+bZ8yaIgGoGm01R0EzN6BqQnNzzEp
 FbUw==
X-Gm-Message-State: AOAM531xUZgiBzLFuYVliFbbozCf6gVoOrE6bCQvpa6O9AgAl5LIMu43
 1UlTg5eUZi/fZWkLJlYlRDQANA==
X-Google-Smtp-Source: ABdhPJyGbdQkLhMKqhKy+9Q0m93KwcBPYZYVxQ9WwPptqaaBghy4mJi2ZYCq6XT+edUFXgi0KT6qrQ==
X-Received: by 2002:aa7:cd4b:0:b0:42b:cd71:5e85 with SMTP id
 v11-20020aa7cd4b000000b0042bcd715e85mr9387536edw.207.1653597410345; 
 Thu, 26 May 2022 13:36:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u28-20020a50c05c000000b0042ac43be19dsm1211304edd.3.2022.05.26.13.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 13:36:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 May 2022 22:36:32 +0200
Message-Id: <20220526203632.831039-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526203632.831039-1-krzysztof.kozlowski@linaro.org>
References: <20220526203632.831039-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm: adjust whitespace around
	'='
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

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/stm32429i-eval.dts    | 8 ++++----
 arch/arm/boot/dts/stm32h743.dtsi        | 4 ++--
 arch/arm/boot/dts/stm32h743i-disco.dts  | 8 ++++----
 arch/arm/boot/dts/stm32h743i-eval.dts   | 8 ++++----
 arch/arm/boot/dts/stm32h750i-art-pi.dts | 8 ++++----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 0d98aca01736..3de0e9dbe030 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -251,10 +251,10 @@ ltdc_out_rgb: endpoint {
 
 &mac {
 	status = "okay";
-	pinctrl-0	= <&ethernet_mii>;
-	pinctrl-names	= "default";
-	phy-mode	= "mii";
-	phy-handle	= <&phy1>;
+	pinctrl-0 = <&ethernet_mii>;
+	pinctrl-names = "default";
+	phy-mode = "mii";
+	phy-handle = <&phy1>;
 	mdio0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 91dde07a38ba..2059593da21d 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -375,7 +375,7 @@ sdmmc1: mmc@52007000 {
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x52007000 0x1000>;
 			interrupts = <49>;
-			interrupt-names	= "cmd_irq";
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC1_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB3_RESET(SDMMC1)>;
@@ -389,7 +389,7 @@ sdmmc2: mmc@48022400 {
 			arm,primecell-periphid = <0x10153180>;
 			reg = <0x48022400 0x400>;
 			interrupts = <124>;
-			interrupt-names	= "cmd_irq";
+			interrupt-names = "cmd_irq";
 			clocks = <&rcc SDMMC2_CK>;
 			clock-names = "apb_pclk";
 			resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
index 59e01ce10318..2b452883a708 100644
--- a/arch/arm/boot/dts/stm32h743i-disco.dts
+++ b/arch/arm/boot/dts/stm32h743i-disco.dts
@@ -77,10 +77,10 @@ &clk_hse {
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index 38cc7faf6884..5c5d8059bdc7 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -115,10 +115,10 @@ &rtc {
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
index 9bb73bb61901..f3e70d3b65ac 100644
--- a/arch/arm/boot/dts/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
@@ -126,10 +126,10 @@ &dma2 {
 
 &mac {
 	status = "disabled";
-	pinctrl-0	= <&ethernet_rmii>;
-	pinctrl-names	= "default";
-	phy-mode	= "rmii";
-	phy-handle	= <&phy0>;
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
 
 	mdio0 {
 		#address-cells = <1>;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
