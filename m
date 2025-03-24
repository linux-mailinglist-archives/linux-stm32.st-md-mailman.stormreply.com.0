Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8CA6DA5F
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 13:53:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639C7C7802F;
	Mon, 24 Mar 2025 12:53:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CC4EC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 12:53:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf861f936so5976415e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742820797; x=1743425597;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DhkKbL6Pj56pOT19f4sCe0HKXFmoTLO1O69IhcGdyYM=;
 b=n7ZPj4bgKzUjJD0DEJ4wE2BTLAucLwIDD8nQrtffRwT6N/ZXMjPDSSKGg8tDBSFZaH
 EvtSlX+DSNimcX/iul7wVRLytQ+p8ZEiXu1WszOm4H9Ga5odFOERDltfA/e5tC2DuPzQ
 dZmBM0B/pYZ9xtnZZt+tZoau3eKutJNJ0d3kf1FzvcdKsxTVdALvwkGGL72qPDtekHsL
 CDraiw88/g1So5mY28ResKwLbyriJ7FQqHwT67HM3bQXxhU76V+zgjHh/bP/3NyvZcbt
 lZncS9PPHlIiUTUBKxrsspTNTID5V/QG9X7w0AP5Itjkr3Bd596oZ5Ry4FRYaOPxKJGQ
 cPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742820797; x=1743425597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhkKbL6Pj56pOT19f4sCe0HKXFmoTLO1O69IhcGdyYM=;
 b=BgOdj6B6LDT2Olwy07AFFWhZ8dt1cy1XDG6cAGjdVWejpqFpEqHPK0k6fAQ9u/YN4P
 WMSd+GiNZxzgkkDCMfd2V7oQdmOq7immHxelE6ONuMzpbDHdkvu1XZ26smq98XYrTGWH
 WRH76ntwaPG6xMiyKfcHxw00raGAAzkKBQCU7MtE7fstoJ327fQdRTt6V3brOp0yDZE4
 Zk1qbnSfNfucMHXT3nVEy2SRk8s+9OkradiIOOCjWYdGCWJeE+O3ljAET9sCzYcLY4Fq
 3Z4s8JBDR1oK5cvCVl6YohTb1cMMD5tz/ROHtsqr8sDdd6moUcICGgl4JwejldatpGvT
 Jbhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUof0OGs/PxgJh7mmPjPEJM6PKPRKvQYi0mP9ZMHp+J8KqFf4l1bsKQ/DfIHi8kL2+qdQgVnVaByQ1E6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7HlIZtOaonFfK6qxdf9ShoCfzJtP3Xw2Bx2zEemYPx3i6mOgj
 /ehZ8ROUjtah+3Ra7Hf9qCnFxn1b4uIO8evS1GeyRu1SLGyj/8EMAtXsaMvFC8I=
X-Gm-Gg: ASbGncsndQr8Xu224XKbRA8z2oTpWTbLKusv8rVEfUYhTj++37DASV5X9rh9ByWARlu
 R53/BEGZQIxJEs95nbG5EIEL8gx/eW+1HrD2F+XqiLqNzY8dTcpBJn1tI/WP+rj8G/DT+8u8n/1
 ppmf1K+Zb7NCwunUp1T2YDCwMBZLCTTl6TL2MQaQfFOG7m10aIv+8FGAm9T1FA/01iUGQ0dKVgP
 XZnJXe4Dz1Jeb3shkEPmAZ4Ed1ol7zupqo1zk7Zq7X0gElMrFJPZWBM9inRaJa6jfC9lpZYdE57
 eKrFNCckckjco7gayT9V4SkoSN9aEep/S1UI/Etb2NdUq3rANY4c9iY/nYuGp6hZUK4S
X-Google-Smtp-Source: AGHT+IELSRnS6+jDcoXD4ACf2eotZaDufAhTgDfQtnO8l4nSz1FNdFEmD6wP6RQaXMoBJDuTs30T2A==
X-Received: by 2002:a05:6000:1842:b0:391:2f03:4cb9 with SMTP id
 ffacd0b85a97d-3997f8f9c98mr4498820f8f.1.1742820796672; 
 Mon, 24 Mar 2025 05:53:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efd61sm11017167f8f.91.2025.03.24.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 05:53:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Robert Budai <robert.budai@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>,
 Andreas Klinger <ak@it-klinger.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 24 Mar 2025 13:53:12 +0100
Message-ID: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: iio: Correct indentation and
	style in DTS example
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

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/iio/adc/st,stm32-adc.yaml        | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index ef9dcc365eab..17bb60e18a1c 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -498,7 +498,7 @@ patternProperties:
 examples:
   - |
     // Example 1: with stm32f429, ADC1, single-ended channel 8
-      adc123: adc@40012000 {
+    adc123: adc@40012000 {
         compatible = "st,stm32f4-adc-core";
         reg = <0x40012000 0x400>;
         interrupts = <18>;
@@ -512,28 +512,28 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@0 {
-          compatible = "st,stm32f4-adc";
-          #io-channel-cells = <1>;
-          reg = <0x0>;
-          clocks = <&rcc 0 168>;
-          interrupt-parent = <&adc123>;
-          interrupts = <0>;
-          st,adc-channels = <8>;
-          dmas = <&dma2 0 0 0x400 0x0>;
-          dma-names = "rx";
-          assigned-resolution-bits = <8>;
+            compatible = "st,stm32f4-adc";
+            #io-channel-cells = <1>;
+            reg = <0x0>;
+            clocks = <&rcc 0 168>;
+            interrupt-parent = <&adc123>;
+            interrupts = <0>;
+            st,adc-channels = <8>;
+            dmas = <&dma2 0 0 0x400 0x0>;
+            dma-names = "rx";
+            assigned-resolution-bits = <8>;
         };
         // ...
         // other adc child nodes follow...
-      };
+    };
 
   - |
     // Example 2: with stm32mp157c to setup ADC1 with:
     // - channels 0 & 1 as single-ended
     // - channels 2 & 3 as differential (with resp. 6 & 7 negative inputs)
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
-      #include <dt-bindings/clock/stm32mp1-clks.h>
-      adc12: adc@48003000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    adc12: adc@48003000 {
         compatible = "st,stm32mp1-adc-core";
         reg = <0x48003000 0x400>;
         interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -550,27 +550,27 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@0 {
-          compatible = "st,stm32mp1-adc";
-          #io-channel-cells = <1>;
-          reg = <0x0>;
-          interrupt-parent = <&adc12>;
-          interrupts = <0>;
-          st,adc-channels = <0 1>;
-          st,adc-diff-channels = <2 6>, <3 7>;
-          st,min-sample-time-nsecs = <5000>;
-          dmas = <&dmamux1 9 0x400 0x05>;
-          dma-names = "rx";
+            compatible = "st,stm32mp1-adc";
+            #io-channel-cells = <1>;
+            reg = <0x0>;
+            interrupt-parent = <&adc12>;
+            interrupts = <0>;
+            st,adc-channels = <0 1>;
+            st,adc-diff-channels = <2 6>, <3 7>;
+            st,min-sample-time-nsecs = <5000>;
+            dmas = <&dmamux1 9 0x400 0x05>;
+            dma-names = "rx";
         };
         // ...
         // other adc child node follow...
-      };
+    };
 
   - |
     // Example 3: with stm32mp157c to setup ADC2 with:
     // - internal channels 13, 14, 15.
-      #include <dt-bindings/interrupt-controller/arm-gic.h>
-      #include <dt-bindings/clock/stm32mp1-clks.h>
-      adc122: adc@48003000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    adc122: adc@48003000 {
         compatible = "st,stm32mp1-adc-core";
         reg = <0x48003000 0x400>;
         interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -587,28 +587,28 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         adc@100 {
-          compatible = "st,stm32mp1-adc";
-          #io-channel-cells = <1>;
-          reg = <0x100>;
-          interrupts = <1>;
-          #address-cells = <1>;
-          #size-cells = <0>;
-          channel@13 {
-            reg = <13>;
-            label = "vrefint";
-            st,min-sample-time-ns = <9000>;
-          };
-          channel@14 {
-            reg = <14>;
-            label = "vddcore";
-            st,min-sample-time-ns = <9000>;
-          };
-          channel@15 {
-            reg = <15>;
-            label = "vbat";
-            st,min-sample-time-ns = <9000>;
-          };
+            compatible = "st,stm32mp1-adc";
+            #io-channel-cells = <1>;
+            reg = <0x100>;
+            interrupts = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@13 {
+                reg = <13>;
+                label = "vrefint";
+                st,min-sample-time-ns = <9000>;
+            };
+            channel@14 {
+                reg = <14>;
+                label = "vddcore";
+                st,min-sample-time-ns = <9000>;
+            };
+            channel@15 {
+                reg = <15>;
+                label = "vbat";
+                st,min-sample-time-ns = <9000>;
+            };
         };
-      };
+    };
 
 ...
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
