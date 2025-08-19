Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2117B2C50F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 15:17:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 202BBC3F945;
	Tue, 19 Aug 2025 13:17:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAB57C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 13:17:13 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6188b67a951so818089a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755609433; x=1756214233;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JKZOwRgVgk/u0KdrUt1cAkiGVJS+RKkMWzXrX75b1m0=;
 b=dRzHfE4yLnt8M/x6mgh7JFG1RuVVM0G8JISePA6tjqqL40vnUXUbhkR8w2bF5ZqHQY
 fBXxf4pXo1iu6ZdX3dUa3/N4P4Jkcr77A74wzhjp+azvGM0Yehj1SqYTLZkUBvGtGoMc
 CHWA4FEcWT0VEbwynqmUReZROW1zltRPfF3407Tr3XmvRJCflDdZnmMwyOFoQe1sQXCM
 3NE53DzPpuOHAX6FY30GrgbMg8nRuPLIEfiRiDKjzU/q6ABazE9hSC3yIeGcPdmXgZrg
 bI4aoUeyXY6NCujdjoKtRoZtaT3xWReZAHmEmTkSYwRmdgJVG56GogU1+I9KHVKYpn63
 w5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755609433; x=1756214233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JKZOwRgVgk/u0KdrUt1cAkiGVJS+RKkMWzXrX75b1m0=;
 b=pEqGXZKlLqPDPJOzzxguIZpHZSIe8zVxwrcWQC/TvfN+1kP8ZBJhtmhrrh45YBDAVX
 FgkLvPWO9px6LSCauIhL2/hz3NVy0VLwprf/saC+DpLPIFXFDW6Mu56XlPEBmb4ARXpu
 MNgHthpzgEBllLft6Y5xhVV3FHPTISIfUnJCI+LWstCggJQoeJucOfeTmgTurra2veC7
 YrDyHCSrrDuzf+/RIhpX4z4zBRiUyTTUJkvNtu9zC6mdygzZRgdmvHSWtPZWv+q5Awuu
 h5PMbRCkFHdFleVeaPEihY88vBoMZHAZbmMBcDO3XTCX4LU83lWeKxphSSibdZedq13N
 9IuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlxvC/1hK5aGuM4ioZalddqwUn7BWIWPFp1BQ+U7ZUppUTE+/lmUwxh9ItQ0aJi1c4aVd/Aj1iAJeUsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBCo2UxCTh8fHGZdOGwUWSen7Fk00dSrjWvYVs7dOH7a6N47O+
 8Ol7urRTrgaKByvXRuqtIIbQNLR817/JcgoK42Qnp+86SSAXQkGUkwWrAlTNUvZpTx4=
X-Gm-Gg: ASbGnct00TevD65CrjbN5eJhfVQURjLWtF2EFCDo9l9OxFIeLmJQV8tVeVI+wD+14UZ
 H2WBU6quoHPpRLyuMiRfrmNgMIY/64c62lD8cWNcVQ0p/uPxLAbFTdyIrLkf5/4nMHzVUuHtPFf
 OKHBxmNRNZbcBsNjDaDYajUNiyrh2XiGg5S3TLG1Lb/sCWfiwXJTL8dCIAfbPK5/kR65eBtjj7m
 c5pceGieVzIS0miXxjFscf9LMYDPySzhJxNAj+BcGnodliRfC3/JCSurkGb6zvM/TxU0GgtUX+S
 1H7VFvHQ22PKWXMxPuPWlLgHR+ReoFANhIXP3Ik7bVPnJvypmEyJjaJ2jdGcWz/xWuD5xc1yQCz
 O+OGcgFyjC8VX+IOvUyi7kU1I5vpqEDUnMw==
X-Google-Smtp-Source: AGHT+IE/vAUGvaFZ7UmmcB7vUKiiYyvdlgsGn3EINffXwUbDoJ0n2eu7BMJecMYq+4729BjHVfjv/w==
X-Received: by 2002:a05:6402:13c7:b0:612:e258:33e2 with SMTP id
 4fb4d7f45d1cf-61a7e768851mr1075178a12.4.1755609432667; 
 Tue, 19 Aug 2025 06:17:12 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a92678f45sm129674a12.18.2025.08.19.06.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 06:17:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
 =?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 19 Aug 2025 15:17:08 +0200
Message-ID: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=B3zj8kIxlI6NNxjczKCH38wkItfXZHU2cc6N45nCziM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlTkXi33JJKHIMfKBoPhPxIx908F+l6S81a7
 m1fzcytzaeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5UwAKCRDBN2bmhouD
 1346EACYQWFZHMhc9Q28PrXrM2zH4iKyydMy43eCV8WTv37Msn65uyxgguJ7kyC7hc5MaL4HKOa
 d0JKgl4tyaTwoIkCHUvT5ZewBrP+RHxyq7mTQqTfVHCIwKXtFf8liWHQ1noXqVcWnsy0I1sbcw5
 MMU25nXzXQvz4Aqiv/BIDN0C5N2e4znVVzQcaoHiSjB2Fzdrgi4d3UKDrMCK5gZKfDE8cbFVIbf
 GksfXa95bREav2g46bo/xcVRDYQhRp5Hfk1zyG2Dr3ck7eqQ3AVOxp4tVT9/Hwxgz0bykWSIxCV
 qA0chuos9BWz/JF2cwNxHR27T+R9ezSXbSjMoVf6tjFnZkJXuXKlrRWa3WZ57CRAPFZnnSNH/d5
 lPVdiZiTTBEEw1oySG4+ukrMqs6VEJdNa6ZnSeFclm1PGWhmRyfrRGCJWOf+SZ0YF6tkbbSJUmU
 0sHwyexaVYtKSrY3polDkTaDIU8gPZkHYBIfW7dwPd8bojdX5ghigh+k14+ZGDnSINFI4dJZVKy
 kITbrPn1Udz5I2aRC2GSFK4c75IxREqD4ZxqgKjgakZoc2eY8zLdzJNgY+ps4sHu6GWPhxaam1f
 VRpB5DfQ4FaAdxO7awxj+qtl9dsqEsRQBSoMxHLrpuW7ZYfe+kBEy4aEquCc7+hIY3redt+aRdS
 E6E7i24wVw2SGxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Minor whitespace cleanup
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

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts        | 2 +-
 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts | 2 +-
 arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
index 39a3211c6133..b886aa91bb86 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
@@ -255,7 +255,7 @@ &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
 		 <&scmi_reset RST_SCMI_MCU_HOLD_BOOT>;
-	reset-names =  "mcu_rst", "hold_boot";
+	reset-names = "mcu_rst", "hold_boot";
 };
 
 &mdma1 {
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
index ac42d462d449..2531f4bc8ca4 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
@@ -92,7 +92,7 @@ gpu_reserved: gpu@f8000000 {
 	leds: leds {
 		compatible = "gpio-leds";
 
-		led0{
+		led0 {
 			label = "buzzer";
 			gpios = <&gpiof 2 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
diff --git a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
index be0c355d3105..154698f87b0e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi
@@ -262,7 +262,7 @@ &i2c5 {
 	status = "okay";
 
 	usbhub: usbhub@2c {
-		compatible ="microchip,usb2514b";
+		compatible = "microchip,usb2514b";
 		reg = <0x2c>;
 		vdd-supply = <&v3v3>;
 		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
