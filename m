Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7265646CD2
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 11:31:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C5C6C65E72;
	Thu,  8 Dec 2022 10:31:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 924A5C65E73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 10:31:44 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id l8so1059766ljh.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 02:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdMCi41BRhoRVn7tJmgZDPG+60TkiWedqCw4ysK9tk0=;
 b=lRIiBy6pSMLBYxynao/nIi1eDsNXlLTyCPFstwfxAluBEIsM6LiU7Plqhn1aJ02Yq6
 2YJdwZYqtp5SUDN3HjG8GhAdVu762AjwFrIhiLmMDo+/00U1QEUfrdxnnY8+JxFp2uPJ
 2UYDhpLJAL6B/y+H9+VzKsi7aadEJjjhvkzC/UHQ1EBYgTJOCwfCibi7quEmPArd3F+X
 FAysDVc0mFhSzNCGA+sXa3nJM2+nODtpkXx2XWAXTSyOLjOiD/4fwSGhvQfbsosyBohS
 xJncVnJWk1EZGOlLaEax8AtfdXsmnjE6ZV3mzb8dI2Z23PrpJYC8Rr45WQYiVPutyQen
 y1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdMCi41BRhoRVn7tJmgZDPG+60TkiWedqCw4ysK9tk0=;
 b=zsB0QY2R1ZRCx8eL77yW+lMQXUia+RfFrxumsVnYl9uV6mk2ux4X7i+o0OyXwT+iQf
 J2xpIgxXzZkJOFPwYL+PszLNn4AUDm+9lVL1KGS7DhtXK/ZI3633wGc3f4chhRzJ4G5U
 CB+mDSomaUydMX8Q8GceU8uUG61qcW7vifpndy0qQ+Oc79sHBmaljvmydznMiP646bKh
 NOZAKEiMbjLTHVFZw/9oN0OBImcrZnEc5KSCIk3GR++LUIESLMvXT2wzBa/9nB/2J4pU
 suVbotyxgQ1M0iD9MJ+YYeN2qmSqnQpIqzHFf/moOpWA3S1ea2MXy3BnRk8kA9KsXVHX
 IvWQ==
X-Gm-Message-State: ANoB5pkYxps5hMowJT//BsPX38lHjFahmpv03Tu10vO7JtFC6Mb6OyNS
 dt6KWfBSFaK0Lt3D5y95JUVdxQ==
X-Google-Smtp-Source: AA0mqf7PxHyaFqnbm9AneVRfDtcor/UK1px7NfgtBLnuUx3d7/tdOhjSb70zTR6W11rGcy5bWMAsRg==
X-Received: by 2002:a05:651c:2328:b0:27a:eae:9ecc with SMTP id
 bi40-20020a05651c232800b0027a0eae9eccmr3403499ljb.248.1670495503950; 
 Thu, 08 Dec 2022 02:31:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 02:31:43 -0800 (PST)
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
Date: Thu,  8 Dec 2022 11:31:15 +0100
Message-Id: <20221208103115.25512-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v4 9/9] media: dt-bindings: st,
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
index 5c2593f346f8..b110c6d5133e 100644
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
