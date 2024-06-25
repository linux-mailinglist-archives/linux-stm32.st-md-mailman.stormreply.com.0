Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0E91786E
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 08:01:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF7DC78017;
	Wed, 26 Jun 2024 06:01:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33990C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 21:33:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-36701e6c6e8so552097f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2024 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719351196; x=1719955996;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VUkVIkbscryFzLdHAGkO+1ya2/2312ktRzQgqWxaXtI=;
 b=ZVBWOobKKtqKZDXtqgYv2lfJnhkJRAvkfxAl8jd8l53u1fDCiLXQswLspZpxIeBs27
 AUk36oyNG+h0Wxmp/t2om3QqWJM7bb08lRnVjayiaUsDaJo77qNReJJu0rvh3gFiEckJ
 Vm8UTZSXYZhYbOegYzgUh7jFaJhKqL/3FGbR8WBXZhlWPl3AQt/ibHkZME4PwIdV+CMS
 k0fQdIm6t+SgNGJ9cRrTSaJ0Dfc/2zwhoLoOn5uyYYdnKiSKLrw4dBXn4NWyCEAts1/O
 E6n+qP1EUiE8KoZDYXJrcXbbh8KPK6zyvxodeUuwuMmWqu/PVtX9Bg3nB5t6dzOfm9qF
 eziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719351196; x=1719955996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUkVIkbscryFzLdHAGkO+1ya2/2312ktRzQgqWxaXtI=;
 b=wVh6gm9AHvA8nNCP0+7llvwMwVW8b+wZtDzflh55XmiE8s0Yaj7PuI1umuJLoTlUux
 I4GNJIQM/SHgOa2Luh1qYogE930OSh0ReVzK6kYO6agEZ5SUfwMv/WuYd/rlj8GVJ4Ve
 d3XYORMGwaJtZ8yg1cIhLe/yXTWTEuTu7i8KBlpN6zV5igDTWI2hbNv+fV7zhapBwUEy
 QzCN+OKK0PCwLdr3qeqFdvyIqynyQXT2J6duqbQgz6qKLiwPDap45PT4qFPqOSK8ygXq
 HmwO7kLEkVCEpReDvQ6DPsZodtrBpPBign5wq1rXy4cMxWToAnY0nL7EWyaGlcXiG+n4
 ApCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxEjYEs5+ZEry5PzAp8qZqBC6LmtHGXLYVkOXqK3yE7g7xFaZfUC2rUEXGOUK6avcRJwd1f+W+g7FfsbEHy44lB03OGZV/5q+CFtyX7qAE7LIMfDoXa4rL
X-Gm-Message-State: AOJu0YyOqvhH5VHRM1MtE0UvccTKDl/zeKstNALLZdpwRprH3QKW4Ew1
 nXn/hCl0Dsz/6FnCNuV0JcUjdpBYd2XOU/FGsXMYwhqv0RQmdHQI
X-Google-Smtp-Source: AGHT+IF1vNOVtlSl9cFErkZZ3gZeIrjKfVDkNDpF40NXHmyTCzK4OuWl8NqNcyOSM/LpMW3SCCIssA==
X-Received: by 2002:adf:fa4c:0:b0:35d:c106:2db8 with SMTP id
 ffacd0b85a97d-366e7a63802mr7040004f8f.57.1719351195202; 
 Tue, 25 Jun 2024 14:33:15 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36647e7eb4fsm13959262f8f.18.2024.06.25.14.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:33:15 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 25 Jun 2024 23:32:42 +0200
MIME-Version: 1.0
Message-Id: <20240625-thermal-v2-3-bf8354ed51ee@gmail.com>
References: <20240625-thermal-v2-0-bf8354ed51ee@gmail.com>
In-Reply-To: <20240625-thermal-v2-0-bf8354ed51ee@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.0
X-Mailman-Approved-At: Wed, 26 Jun 2024 06:01:46 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 3/3] ARM: dts: sti: add thermal-zones
	support on stih418
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
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
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
