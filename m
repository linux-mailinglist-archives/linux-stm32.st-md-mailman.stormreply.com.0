Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3177A645786
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 11:23:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E86BCC65E6B;
	Wed,  7 Dec 2022 10:23:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABF51C65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 10:23:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y25so5758043lfa.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 02:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WOjKBqSX/bJNurWawr9UIxOhCwY9AfTE5WBw0ZvK0s=;
 b=DeQM6xRnfiSdaMP8oukCCK2af0Cj+1aL66olpRw8WNrvnr0qDTHiaN9sD05CbnnvJR
 DWKW0p8T3Lf38kXzN6/v4hUNzHDYTxaXvj9wJQlyHIB6q+jMiJzSHl2iIPlbE3TB/eld
 dVJVqPJ6XRMS7IzUwKlr51M7MTPa4n79Z4TQrW0brbGYHb/b4ennlqJDTkZGHsDI4+he
 3flAQDjvbd+7JJ8Ye1WBAhVN45mV9Pnlk5A0JIEuwvsvkLWZvw6pRv1RRZo34RqnYGDw
 U+Kj70Ga0SIjTKWelk3/apw7gWxk6XBhJKov3cwZzCzAhS/hhtSjjo1UOBAhzPZzKDJO
 TCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WOjKBqSX/bJNurWawr9UIxOhCwY9AfTE5WBw0ZvK0s=;
 b=Aq7xRMGg9ZudApjFLHiVZtEbsmuNEj5QOxXXzDlsNmQEoH8wnIg/oKQQDh5G4GyMF6
 ibTMzOMxdRuyJd844qs2gUyDZkFe3tJSpRvAjL+NaqwB30WW+6eNBKGhQ7Iif+A/HgPG
 4QfpeuQkMC07SsJRISvyCVzREtEz1aEHWq2HoYMWHdptjxITaktePjRyRt5IpUJ6jJa9
 SPxAdyDJbWcJLP7cM+KnvNY/eT4ow3hk8sDxQ9h31sOHIyLT9RHWEz41vaKU9N2Wt3tV
 DSqlrqD0NHiIx/fukGgKQPghrEKrvGLNsr+D9DhFFjDFl353PYa7cYbIEvLKKPN5d4JK
 lAKQ==
X-Gm-Message-State: ANoB5pnE7nZUv60QgikxaRnoP6BVoP3upf8pxZe+A1gDbzNhKQBTM+qq
 7kj7E1D2CrLqw/k82/Kre5j4IA==
X-Google-Smtp-Source: AA0mqf4J0zL0WrlS4LLGj+qa03tSO2qLooF7xgibIAe/OWddv4WibIXv6pH+N3JWoeV4VeyeojNpyg==
X-Received: by 2002:a19:ca15:0:b0:4b5:9845:c89f with SMTP id
 a21-20020a19ca15000000b004b59845c89fmr182758lfg.127.1670408587036; 
 Wed, 07 Dec 2022 02:23:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:23:05 -0800 (PST)
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
Date: Wed,  7 Dec 2022 11:22:50 +0100
Message-Id: <20221207102253.26663-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v3 6/9] media: dt-bindings: samsung,
	s5p-cec: convert to DT schema
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

Convert Samsung S5P HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++++
 .../devicetree/bindings/media/s5p-cec.txt     | 36 ----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 67 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml b/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
new file mode 100644
index 000000000000..016c8a77c1a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/samsung,s5p-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5PV210 and Exynos HDMI CEC
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5p-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: hdmicec
+
+  interrupts:
+    maxItems: 1
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU system controller interface
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - hdmi-phandle
+  - interrupts
+  - samsung,syscon-phandle
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5420.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cec@101b0000 {
+        compatible = "samsung,s5p-cec";
+        reg = <0x101B0000 0x200>;
+
+        clocks = <&clock CLK_HDMI_CEC>;
+        clock-names = "hdmicec";
+        interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+        hdmi-phandle = <&hdmi>;
+        needs-hpd;
+        pinctrl-names = "default";
+        pinctrl-0 = <&hdmi_cec>;
+        samsung,syscon-phandle = <&pmu_system_controller>;
+    };
diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
deleted file mode 100644
index e847291d4aff..000000000000
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* Samsung HDMI CEC driver
-
-The HDMI CEC module is present is Samsung SoCs and its purpose is to
-handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be following
-	"samsung,s5p-cec"
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : HDMI CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to HDMI CEC clock.
-  - clock-names : from common clock binding: must contain "hdmicec",
-		  corresponding to entry in the clocks property.
-  - samsung,syscon-phandle - phandle to the PMU system controller
-  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
-
-Optional:
-  - needs-hpd : if present the CEC support is only available when the HPD
-		is high. See cec.txt for more details.
-
-Example:
-
-hdmicec: cec@100b0000 {
-	compatible = "samsung,s5p-cec";
-	reg = <0x100B0000 0x200>;
-	interrupts = <0 114 0>;
-	clocks = <&clock CLK_HDMI_CEC>;
-	clock-names = "hdmicec";
-	samsung,syscon-phandle = <&pmu_system_controller>;
-	hdmi-phandle = <&hdmi>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&hdmi_cec>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 45402e03cda5..05acbaecef52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2866,7 +2866,7 @@ M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-samsung-soc@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/s5p-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 F:	drivers/media/cec/platform/s5p/
 
 ARM/SAMSUNG S5P SERIES JPEG CODEC SUPPORT
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
