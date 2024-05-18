Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 782AA8CAE64
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:35:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24F59C6B47A;
	Tue, 21 May 2024 12:35:54 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FB5AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 12:12:52 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso3444254e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 May 2024 05:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716034371; x=1716639171;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c+CcrlNbsHEM5IbBF+aEvbweCw5RwAqEr0nCDuf0P80=;
 b=MNHsHvAogyjckqGvE4nSHJrnSRg/aUv0GuL700+vM+etK2bTTUUT6KqbLeSY8oH7q4
 4lkeWEeacSPmkOFEmdsqH2c8yj961kocHKkonkVWrbCInphzDCAJMaiupeqP1SSzDrEF
 ymPzCtLeOE7ybMdwGHw9dskpMyzSx/eXo9qg9XDMqM5eu1LU/vEOvuQrdEHWrbr44Mbg
 wF8SrZQxa+36o6kJy0nq1C7x6ijE9rSWAn0RF9n1eVtDGP6k2z6PQPj3eRlSqtyO1skI
 s5cRV1Vrk6NnajpYW97dBXNo7aIyAXIvfDXvEIPvJO+ZmaGrwhg817iuC68g0907hdBs
 W53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716034371; x=1716639171;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+CcrlNbsHEM5IbBF+aEvbweCw5RwAqEr0nCDuf0P80=;
 b=NeGiHKrNJP0ElF0Qm313hiDkI87Kgas6Pl1i+uIZHwZo2blW2dLrXjbQUHIANwQUe1
 Z6yTuoKCiRiG/79eO62PuUG9Ajtv7/YZn2210nSJ+bMOREiH5IZH4gq2nPuI4X79R4BW
 0d50/gdab+HZy3/H+M0cTGwZ41P7zFsmyXbVOHdzCoDRUGVhNi8gPDI1oil9OeYpSlBg
 KGrpNuLszK2dpPtR7qTTtF9Bj08GCXUlDXQqb3xHJlHxy6Qu+J51mMyVEahO4WP/8rZi
 zHkizMTUYcwkFci14lIeg/SpCsxhAOoxYjaXCrH3xt/JOGbc0Oy8w3t/pNnFppZvUudQ
 ViHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKsPUAtcw81oQ6K2FzMw2WsSWuQtIaq9TD0v3Cu97VpTniXuPQsv6FLHWzYDEZyMqaUgpzJNDtH0tQlwqHhcacWLXK9ux9Kw2kcK/5wgwoftQPE0szAlaM
X-Gm-Message-State: AOJu0YwIQBjxKF8bqvwKHNv8aERRftO0XULPQ1Jns/8Hw7tTgQqVHSCk
 ZMYTxkQY+mnm+q3UXvvcY9+cJZ2Wz1MNcdUzVjP6Caful8NceNulrl/4Jg==
X-Google-Smtp-Source: AGHT+IGCqom0f/JiQFDnaCldSas0fyciwxHluc+scNBqYPHfPb0Rl7baW0X6/IEtd7zm1t+AwIBO0A==
X-Received: by 2002:a05:6512:1304:b0:51c:5171:bbed with SMTP id
 2adb3069b0e04-5221006e625mr19978831e87.15.1716034371324; 
 Sat, 18 May 2024 05:12:51 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8688sm3543568e87.213.2024.05.18.05.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 05:12:51 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Sat, 18 May 2024 14:12:06 +0200
MIME-Version: 1.0
Message-Id: <20240518-thermal-v1-3-7dfca3ed454b@gmail.com>
References: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
In-Reply-To: <20240518-thermal-v1-0-7dfca3ed454b@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Tue, 21 May 2024 12:35:52 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: sti: add thermal-zones support
	on stih418
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

Add a 'thermal-zones' node for stih418.

A thermal-zone needs three components:
  - thermal sensors, described in an earlier commit[1]
  - cooling devices, specified for each CPU
  - a thermal zone, describing the overall behavior.

The thermal zone needs references to both CPUs and thermal sensors,
which phandle are also added. The thermal management will then be
achieved on CPUs using the cpufreq framework.

[1] https://lore.kernel.org/lkml/20240320-thermal-v3-2-700296694c4a@gmail.com/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 arch/arm/boot/dts/st/stih407-family.dtsi |  6 +++--
 arch/arm/boot/dts/st/stih418.dtsi        | 41 +++++++++++++++++++++++++++++---
 2 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
index 29302e74aa1d..35a55aef7f4b 100644
--- a/arch/arm/boot/dts/st/stih407-family.dtsi
+++ b/arch/arm/boot/dts/st/stih407-family.dtsi
@@ -33,7 +33,7 @@ delta_reserved: rproc@44000000 {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
@@ -52,8 +52,9 @@ cpu@0 {
 			clock-latency = <100000>;
 			cpu0-supply = <&pwm_regulator>;
 			st,syscfg = <&syscfg_core 0x8e0>;
+			#cooling-cells = <2>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
@@ -66,6 +67,7 @@ cpu@1 {
 					    1200000 0
 					    800000  0
 					    500000  0>;
+			#cooling-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/st/stih418.dtsi b/arch/arm/boot/dts/st/stih418.dtsi
index b35b9b7a7ccc..6622ffa8ecfa 100644
--- a/arch/arm/boot/dts/st/stih418.dtsi
+++ b/arch/arm/boot/dts/st/stih418.dtsi
@@ -6,23 +6,26 @@
 #include "stih418-clock.dtsi"
 #include "stih407-family.dtsi"
 #include "stih410-pinctrl.dtsi"
+#include <dt-bindings/thermal/thermal.h>
 / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <2>;
 			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
 			cpu-release-addr = <0x94100A4>;
+			#cooling-cells = <2>;
 		};
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <3>;
 			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
 			cpu-release-addr = <0x94100A4>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -44,6 +47,38 @@ usb2_picophy2: phy3 {
 		reset-names = "global", "port";
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <250>;  /* 250ms */
+			polling-delay = <1000>;         /* 1000ms */
+
+			thermal-sensors = <&thermal>;
+
+			trips {
+				cpu_crit: cpu-crit {
+					temperature = <95000>;  /* 95C */
+					hysteresis = <2000>;
+					type = "critical";
+				};
+				cpu_alert: cpu-alert {
+					temperature = <85000>;  /* 85C */
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	soc {
 		rng11: rng@8a8a000 {
 			status = "disabled";
@@ -107,7 +142,7 @@ mmc0: sdhci@9060000 {
 			assigned-clock-rates = <200000000>;
 		};
 
-		thermal@91a0000 {
+		thermal: thermal@91a0000 {
 			compatible = "st,stih407-thermal";
 			reg = <0x91a0000 0x28>;
 			clock-names = "thermal";

-- 
2.45.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
