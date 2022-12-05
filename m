Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9466642B43
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 16:19:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADEDFC65E62;
	Mon,  5 Dec 2022 15:19:03 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F14BC65E63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 15:19:02 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id cf42so13313540lfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
 b=ckoG7YLE4dTbKyEPRu6WUdAh9sc6sQyo5v4/rMvhZOfAIgvcJ5/MVrGBrf/DiDf8x4
 XHYc5us7TZZOzmFOtgLsqPXSqWfxoE6zcD1artGeDOn81+0Jq8a689uNAvPey+6H7HLq
 w6h/zkl/RjjKWAOa17u7skBBEoJrnXn2wkeA3766gnNbR6kaxqMxWqR21ZN7LsYOxdWL
 k6JrlVLjcZZF41LwGnOXc2nKZjOSbPVgxRutjviPUIJaqB3kt4FMkHZAwIYKtENCwFc7
 FOaJPmARm0f6wHeHMj4aj0Z0QQgIlBAF+xFgSaQA7TSFS9vAScvCXifGNieQ4oP0ASxm
 yOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9aazsYiCUK+hhkaN7DSb9BXLEifN4Vj66BPeUPEEPTM=;
 b=Z2byA414M1SS1pNN4KPtQn+p1cuaZoTN4eQ+z4Jg2f+vjAA2VOpITJaYWGMdn7lNIO
 LEeD8QSkSNjv1CSii30ZqCa+mLoP6RDW7lwKWKzm3vq667NZCyH6Shl7x0GfSLgyZ4VR
 tip3cXfAtql6uZGFIhhDM0H1fWW1iRhOCUvrBKk7H3LaRCZdjqGDmm47EfYf9GIVWBlj
 Jqpyn5FQueJsB8LaM7rls9vYgw+AGDu/YmrHVIH69MiFsS9yJF2/vTqYsKIr9qhh5GeK
 HOyyfO8Xbh4qWuhqhcPRxKYjB6VU1D0MATsO523+SoVX2NBYZknN7pWfvYHFabKEzP0N
 GQXA==
X-Gm-Message-State: ANoB5pkveWgfqCl54itNQONmpWWipMwZpCWMVzDznfa6ffHZMek8cph3
 gmH7BK1P2f3dIpvCXmHTzXO8Sg==
X-Google-Smtp-Source: AA0mqf5etfZUUwBnmi2OzAxBRb101NGrpAQYXEdDklkcv44ujx+sqOk4y4+zled7jnxr64dMaIx3NA==
X-Received: by 2002:ac2:5fcc:0:b0:4b0:2675:110d with SMTP id
 q12-20020ac25fcc000000b004b02675110dmr24041887lfg.295.1670253541635; 
 Mon, 05 Dec 2022 07:19:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 07:19:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Joe Tessler <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon,  5 Dec 2022 16:18:45 +0100
Message-Id: <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 9/9] media: dt-bindings: st,
	stih-cec: convert to DT schema
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

Convert ST STIH4xx HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/media/stih-cec.txt    | 27 --------
 MAINTAINERS                                   |  2 +-
 3 files changed, 67 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
new file mode 100644
index 000000000000..aeddf16ed339
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/st,stih-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STIH4xx HDMI CEC
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    const: st,stih-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec-clk
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: cec-irq
+
+  resets:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - hdmi-phandle
+  - interrupts
+  - resets
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/stih407-resets.h>
+
+    cec@94a087c {
+        compatible = "st,stih-cec";
+        reg = <0x94a087c 0x64>;
+
+        clocks = <&clk_sysin>;
+        clock-names = "cec-clk";
+        hdmi-phandle = <&sti_hdmi>;
+        interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "cec-irq";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_cec0_default>;
+        resets = <&softreset STIH407_LPM_SOFTRESET>;
+    };
diff --git a/Documentation/devicetree/bindings/media/stih-cec.txt b/Documentation/devicetree/bindings/media/stih-cec.txt
deleted file mode 100644
index ece0832fdeaf..000000000000
--- a/Documentation/devicetree/bindings/media/stih-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-STMicroelectronics STIH4xx HDMI CEC driver
-
-Required properties:
- - compatible : value should be "st,stih-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to HDMI CEC clock
- - interrupts : HDMI CEC interrupt number to the CPU.
- - pinctrl-names: Contains only one value - "default"
- - pinctrl-0: Specifies the pin control groups used for CEC hardware.
- - resets: Reference to a reset controller
- - hdmi-phandle: Phandle to the HDMI controller, see also cec.txt.
-
-Example for STIH407:
-
-sti-cec@94a087c {
-	compatible = "st,stih-cec";
-	reg = <0x94a087c 0x64>;
-	clocks = <&clk_sysin>;
-	clock-names = "cec-clk";
-	interrupts = <GIC_SPI 140 IRQ_TYPE_NONE>;
-	interrupt-names = "cec-irq";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_cec0_default>;
-	resets = <&softreset STIH407_LPM_SOFTRESET>;
-	hdmi-phandle = <&hdmi>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index dee3f776be32..5bf8879b4a59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19924,7 +19924,7 @@ F:	sound/soc/sti/
 STI CEC DRIVER
 M:	Alain Volmat <alain.volmat@foss.st.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/stih-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 F:	drivers/media/cec/platform/sti/
 
 STK1160 USB VIDEO CAPTURE DRIVER
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
