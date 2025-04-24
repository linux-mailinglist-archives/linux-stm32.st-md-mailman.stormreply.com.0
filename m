Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42395A9A6A8
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 10:47:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E489EC7803A;
	Thu, 24 Apr 2025 08:47:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035E1C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:47:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac73228ea73so7199166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745484430; x=1746089230;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
 b=pAbrr/nhqEwy4bPDH4E8G0QRXksMddt7PXTFYB5LKGm9eQqDPdu2LHWmW0zIqMFnkE
 vkNkHSF1bAkrIR3zyc5FRK+a5LzM4KgHTkhc+vlx9MmZlHAHoJjmhP2Ve0eBhLtkXFGL
 JCiWusiMxnxCADj08BnNQeY7ctg1T0B2YDYN0yb3zOwdSGBNSpH62C/mG5Afj0dKVDz4
 QoOw4ivNxoEnW2uD1TsCsNpt/NkAMTxVtc18YKY3wt/MYMFwRPbX3h6NU43fu6ZUgbR6
 Zzj+62zxJaHQOCKjF8S3sl/nvhdZ3gtRUzwsGI+qmwev4UJ+P1sgXSw0xbJie41PnNTW
 t8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745484430; x=1746089230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I07L8B3Ds4E7gZ4sAboS30rVJP9KR1SNOC0M0BEiQyU=;
 b=VnRNATJVPS2bZYAuQkVQDLS/ypphjCky3QAlyeXyoOSdw6uB2ffRBY5VWpFVwHshu1
 YDC4OD+A45IOCnRjR+uT8i9JVI/T8gZeP6LGxitgdfjaEGR9xA7fJdcrCFvIgyOwJcMm
 btXIZrgbdoPpEWW4T+YBIka4FfW2jSdEX/fdAnj/pf2fUIe7h0gIHIzGKGJJUJ8UUeLD
 eFpQ9dJIIptyuKTTSCK+KCa2fkZ0EuX+lV7I8n/BjnWrupjlwBDGmu7ncQTdSTvzP+aN
 TG1NFoiRLxLqPJcz6gM8kGlJ5X2p3I8l+aQkxlcPfnCSjjOvxCH/G9JJUBkIWtUCPIjM
 63NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXggrKfH5I6p22rZqCfdwiSG89OtcxPkg/f1Dtj8/xIJaYTEUvV9ceA2U+j0eOwAgxU1WH7/Mlgtq352g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4PofNoKamjfZZM+TpjsYvmDN5knO5VwTYh9tjVWhc6hLR2W2q
 qezsw0QbbXce4iYigQIXZ2iL75MIGUbn0TtliCPrkQ2MP922fhhKtPL6hls069o=
X-Gm-Gg: ASbGncvMCQha7aTM397qeM25AmKNnqNgbbnoQpIrZ0xthaV65dpki+7SvAbIAoKEvuy
 qtCpjRj8COBG7gAg1/qgNjr3CH83uAgxZjbT3zFSsGlQCTc3VV+GGiVEiLTcJ4cy8d76XCEmBAm
 vcQiXHLyyTEs+8JgidcnY+uXPS364HOsjfVr+0dOEHVrfWRzAOHD8G08O7tlVxz4OnydNbnRQtO
 VZYMomCxTCExNm3QIjg4Z07em3mPx/uVGczldbnHveFj7eurTKgmQMbaw2s7HVYmEV7gZaDcrRS
 WEtR2J4h7hC17d5wMhxpgcnIiG3JRevEni9bjNJA938dM5HaeA==
X-Google-Smtp-Source: AGHT+IG690V/118jVCZXhJGEzeHLok6tjdjixbJjju8hozYkNfl4sz7fKA7GyqSoTyecOpVPS8y/SA==
X-Received: by 2002:a17:907:2d0f:b0:acb:6081:1507 with SMTP id
 a640c23a62f3a-ace573af8d3mr64249266b.10.1745484430243; 
 Thu, 24 Apr 2025 01:47:10 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace59c22d9asm69948066b.124.2025.04.24.01.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 01:47:09 -0700 (PDT)
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
Date: Thu, 24 Apr 2025 10:47:06 +0200
Message-ID: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] ARM: dts: st: stm32: Align wifi node name
	with bindings
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  stm32h750i-art-pi.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts            | 2 +-
 arch/arm/boot/dts/st/stm32mp135f-dk.dts               | 2 +-
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi       | 2 +-
 arch/arm/boot/dts/st/stm32mp157a-iot-box.dts          | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts              | 2 +-
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
index 44c307f8b09c..65975ca10695 100644
--- a/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/st/stm32h750i-art-pi.dts
@@ -167,7 +167,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 19a32f7d4d7d..9764a6bfa5b4 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -421,7 +421,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 6236ce2a6968..c18156807027 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -287,7 +287,7 @@ &sdmmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {	/* muRata 1YN */
+	brcmf: wifi@1 {	/* muRata 1YN */
 		reg = <1>;
 		compatible = "infineon,cyw43439-fmac", "brcm,bcm4329-fmac";
 		interrupt-parent = <&gpioe>;
diff --git a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
index 6a5a4af25bd9..84497026a106 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-iot-box.dts
@@ -46,7 +46,7 @@ &sdmmc2 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 324f7bb988d1..1b34fbe10b4f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -115,7 +115,7 @@ &sdmmc2 {
 	#size-cells = <0>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
index 343a4613dfca..aceeff6c38ba 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi
@@ -435,7 +435,7 @@ &sdmmc3 {
 
 	#address-cells = <1>;
 	#size-cells = <0>;
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
