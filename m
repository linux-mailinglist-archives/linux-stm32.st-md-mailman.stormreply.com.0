Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8164578E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 11:23:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F338C65E6E;
	Wed,  7 Dec 2022 10:23:12 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB41EC65E69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 10:23:10 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id b3so27951311lfv.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 02:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AUwX2bZWFPRltw54sKVrGy9ss5uTmSF0GAbGdEL1cY=;
 b=XB4U+5ZljqR/bbvMKNFN+vU986ORmhbBYnwpj6Uoaam4TDmCl6l8ew66p5/mQ47Epa
 z0o12IwUwbpEyhZcDHgTqQzPDIE5NrGOBVhdpEKEb0NGLGt/XpOkcGNL3LQRzggQftXp
 Jiha1ZD1+2g9OZZMRkK3JM2Vegm7aRTb3FHLE696vEYIfSgdkIW615VQ8/VnfpnwXnNL
 F9MYW0+YuG1aa3h/KjQ7Qh9jLBaIQAKMX9/DeIqWh5Y8VMIJo5BpBlJ098LdAUCwfGS8
 aBtx7RWJNGRqUD4stzuz9inChA7HS4LowmCH0RW3VGtGv00Gbe+Ft5RQ1BVUiXwbthu0
 o91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AUwX2bZWFPRltw54sKVrGy9ss5uTmSF0GAbGdEL1cY=;
 b=yVfQyxpMfyE/QKRUVffUTWO9eL43/4iJlMsvW04y4ZBjqbZfA7uLxBx5soBWqmQzoE
 8GRzaoH6oHtWmC8yp6ie8MzKH8QbrESRksmTcE7qGScOzBus+DMzao7Bb1TEsSbC9KU8
 aCUNDbDuhDPnj+oFVuE/tJJlUHeeghHZmDPK1Tjyw1pC2Z81kJDJ3Biu4QzRBWDb7mrZ
 aBU3MA9OLPhp3kztWS9h98le/7u/anMjGxlfbGTORDr+GJ3gVOhm67nex9PNqNx+dRAU
 KdqCU+LtOAwvLC2In98RzZSsxXxjYhnUfg1vo7quwXI/b88+n1hKHmkvs2tZIu//Xc5U
 gKcA==
X-Gm-Message-State: ANoB5pmBMNlDJtrJPWrZJXOcbpqIBUCRoUMD/cAHMJl8tgUF7koNEH0N
 NH3wFmz2I787nbgZdCPgQCjAHA==
X-Google-Smtp-Source: AA0mqf4yC5k5Vs4wsmk6nVdssr0tS1Ijg5ULzsObdS7ZFIejpoMI85/cYKftYxb5UoYNwRrKvQ9Ilw==
X-Received: by 2002:a05:6512:1291:b0:4af:eabf:3c57 with SMTP id
 u17-20020a056512129100b004afeabf3c57mr23092457lfs.449.1670408590286; 
 Wed, 07 Dec 2022 02:23:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 02:23:09 -0800 (PST)
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
Date: Wed,  7 Dec 2022 11:22:52 +0100
Message-Id: <20221207102253.26663-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <treding@nvidia.com>
Subject: [Linux-stm32] [PATCH v3 8/9] media: dt-bindings: nvidia,
	tegra114-cec: convert to DT schema
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

Convert NVIDIA Tegra HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>

---

Changes since v2:
1. Rename to nvidia,tegra114-cec.yaml
2. Nvidia->NVIDIA
---
 .../media/cec/nvidia,tegra114-cec.yaml        | 58 +++++++++++++++++++
 .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
new file mode 100644
index 000000000000..369c48fd9bf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDMI CEC
+
+maintainers:
+  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
+
+allOf:
+  - $ref: cec-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra114-cec
+      - nvidia,tegra124-cec
+      - nvidia,tegra210-cec
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: cec
+
+  interrupts:
+    maxItems: 1
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
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cec@70015000 {
+        compatible = "nvidia,tegra124-cec";
+        reg = <0x70015000 0x00001000>;
+        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_CEC>;
+        clock-names = "cec";
+        status = "disabled";
+        hdmi-phandle = <&hdmi>;
+    };
diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
deleted file mode 100644
index c503f06f3b84..000000000000
--- a/Documentation/devicetree/bindings/media/tegra-cec.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-* Tegra HDMI CEC hardware
-
-The HDMI CEC module is present in Tegra SoCs and its purpose is to
-handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be one of the following:
-	"nvidia,tegra114-cec"
-	"nvidia,tegra124-cec"
-	"nvidia,tegra210-cec"
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-  - interrupts : HDMI CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to HDMI CEC clock.
-  - clock-names : from common clock binding: must contain "cec",
-		  corresponding to the entry in the clocks property.
-  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
-
-Example:
-
-cec@70015000 {
-	compatible = "nvidia,tegra124-cec";
-	reg = <0x0 0x70015000 0x0 0x00001000>;
-	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_CEC>;
-	clock-names = "cec";
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 197351d3bb57..dee3f776be32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/tegra-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
 F:	drivers/media/cec/platform/tegra/
 
 ARM/TESLA FSD SoC SUPPORT
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
