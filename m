Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 775FA67EF70
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jan 2023 21:20:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29474C65E4B;
	Fri, 27 Jan 2023 20:20:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B35C6507E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 20:20:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id m15so4216198wms.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 12:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MQJZG/xKcCJsVsFDHrDpLNHly5wPWcC1lO6W1/tImAQ=;
 b=XLswvSn0iWJEiVX86b3AojUKI6gFD+xJfDL0WBc+eU64CJKFU/9zPdXobp2My2DRdM
 qY792thqiotAKFM+YmxxS1AievxqjzritonPJ9vyD5RVNPW8QsNK9/bnYCMPFgYGQIPZ
 SgOLFmJr1a+jhEFFCISU1l/G5+HrMaL+nf2FoQSyUlicGwJmjOFy/3qFDXCXJJcZ+yw0
 IOf1Sf76AUWDCEu0hyxRIfL2Iv3E1jn5Zf/q1ALJYV/gamGrUad5eK6eeEyDE+qIGscb
 tA0Z3USSOxPo8ThdS8K4e+CaEZizIxxSwiyYQvd26m9e6VliSuaHPjKitpiLhGHMc8vZ
 IUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQJZG/xKcCJsVsFDHrDpLNHly5wPWcC1lO6W1/tImAQ=;
 b=XMO36UcxMJEnP3yIA/4Ys7jkvdKUFhc1OyJecqELmzY5XtkoG3jVfjYNQ6DMYeBcZX
 J+gq5cknl7+arlGhCtbOKjsCFpPA7xG1rXWXG8XZSzdXuI0ru2Rt1iBLALvg1vu3H+7C
 6/27NOu55HCyNbDFjU1zRqV9XFicQ8EAUtcc+Ae2S3TDFCjLEuaanKMlV82oLUC9vcmD
 BqwUciN/cVYMDRdTnQOU0pR8vtM3bVPWY3e6ib2C2O3ssguiiD0RI6geIwyQgSi5v16c
 66UY5hnl7RkHjbdAG7FIIGEbp/4IVowjv7A+W2B6qHwwR4Sjblg639vppDX7ku0+ylCq
 /ujg==
X-Gm-Message-State: AFqh2kra6FlTaAdGolhjIAo7RyeSvrOAedtpU7rMdEsGbVMTgUyvdJqF
 6nmH3nl/kIdoOExtMSn3GNSXjA==
X-Google-Smtp-Source: AMrXdXuNRILKOhT1cKmkeLlOlAI5U7DaEFjqsMn3TViTMRmv1RGPuc0oBtcBH0u3ppdFai6vxu/YCA==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id
 he13-20020a05600c540d00b003d9fb59c16bmr37938172wmb.36.1674850843204; 
 Fri, 27 Jan 2023 12:20:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b002bfd524255esm2116881wrm.43.2023.01.27.12.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 12:20:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jan 2023 21:20:40 +0100
Message-Id: <20230127202040.196411-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] dt-bindings: input: touchscreen: st,
	stmfts: convert to dtschema
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

Convert the ST-Microelectronics FingerTip touchscreen controller
bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/touchscreen/st,stmfts.txt  | 41 -----------
 .../bindings/input/touchscreen/st,stmfts.yaml | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.txt b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.txt
deleted file mode 100644
index 0a5d0cb4a280..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* ST-Microelectronics FingerTip touchscreen controller
-
-The ST-Microelectronics FingerTip device provides a basic touchscreen
-functionality. Along with it the user can enable the touchkey which can work as
-a basic HOME and BACK key for phones.
-
-The driver supports also hovering as an absolute single touch event with x, y, z
-coordinates.
-
-Required properties:
-- compatible		: must be "st,stmfts"
-- reg			: I2C slave address, (e.g. 0x49)
-- interrupts		: interrupt specification
-- avdd-supply		: analogic power supply
-- vdd-supply		: power supply
-- touchscreen-size-x	: see touchscreen.txt
-- touchscreen-size-y	: see touchscreen.txt
-
-Optional properties:
-- touch-key-connected	: specifies whether the touchkey feature is connected
-- ledvdd-supply		: power supply to the touch key leds
-
-Example:
-
-i2c@00000000 {
-
-	/* ... */
-
-	touchscreen@49 {
-		compatible = "st,stmfts";
-		reg = <0x49>;
-		interrupt-parent = <&gpa1>;
-		interrupts = <1 IRQ_TYPE_NONE>;
-		touchscreen-size-x = <1599>;
-		touchscreen-size-y = <2559>;
-		touch-key-connected;
-		avdd-supply = <&ldo30_reg>;
-		vdd-supply = <&ldo31_reg>;
-		ledvdd-supply = <&ldo33_reg>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
new file mode 100644
index 000000000000..c593ae63d0ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/st,stmfts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Microelectronics FingerTip touchscreen controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  The ST-Microelectronics FingerTip device provides a basic touchscreen
+  functionality. Along with it the user can enable the touchkey which can work
+  as a basic HOME and BACK key for phones.
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: st,stmfts
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogic power supply
+
+  interrupts:
+    maxItems: 1
+
+  ledvdd-supply:
+    description: Power supply to the touch key leds
+
+  touch-key-connected:
+    type: boolean
+    description: The touchkey feature is connected
+
+  vdd-supply:
+    description: Power supply
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+  - interrupts
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@49 {
+            compatible = "st,stmfts";
+            reg = <0x49>;
+            interrupt-parent = <&gpa1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+            touchscreen-size-x = <1599>;
+            touchscreen-size-y = <2559>;
+            touch-key-connected;
+            avdd-supply = <&ldo30_reg>;
+            vdd-supply = <&ldo31_reg>;
+            ledvdd-supply = <&ldo33_reg>;
+        };
+    };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
