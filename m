Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4791646CD1
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 11:31:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65B99C65E71;
	Thu,  8 Dec 2022 10:31:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A45C6C65E71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 10:31:42 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 1so1378575lfz.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 02:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOenoxBAkNYKXtwJphgPxrD71eAFNMzynp+gZ1XToN8=;
 b=o8XngGocPIidvkgu1fvEeMsGR11tSM/kYyqUqKm7FpJQJ66qrn3pqm+bYgclP5ofk+
 TNmKnBzMOk4TwnRyzP2jmoJZku7RjbAvM88wzsS8+QB5sylMOkdkvaYLNdi1Noz/fYOP
 zTl0P+Q1wY3I7pSmhYzJwaeza5idzjZkWEANuEtUwxsyes8RoRMbGd0O4bN9x2zvjW0S
 5GL8YXAfRtvGM5BVvTofghv6RUF1GLUQ5lmDguLlinFoA6I1UosPgqMdDOnkKdflgL51
 jJyllTWEoCsEJEYj/eYw8KdWdugJrpL2ua1EAxclSWCLUS1uXQICMaSAVTwXpkWbcRn1
 0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOenoxBAkNYKXtwJphgPxrD71eAFNMzynp+gZ1XToN8=;
 b=dFjvjvAm/qVW00LLaupVbKQZ58WcREfVHB/50VPWneH+bV3SG++0pFtQMyjFOLt8oD
 YgVhorz+xmWl6RKLvBg3UUaiFq5CC1Y8TK5XxETHEZ7dNn5RRJijvdkBon2myAFDmoWy
 LluOFZoJYXC9ED1fsIw/syxfJyByDCG4oDQ/zqz5SUVqHDoypH5vmyCjpN3eeUrmasi9
 RehvhB2BMTpjbZShpFoNVr3Jilf/evkuSG7ia6bkguDt7yFTPhJVWzx22/hDdj3r0yR2
 Gq2YkNQzw4HQwndcB9WhHdeHRP6jHnJY3EAKRxU24oTdPTjnS0yGv4rstjV8N9Ywqisv
 oHUw==
X-Gm-Message-State: ANoB5pkovU8Idu7FR9H3ZZ0KAHbjAdDcDj38tWM6AAIU53E7+9tcHvfT
 3JxmjMGED/PRcNZiLRUZEx5DNw==
X-Google-Smtp-Source: AA0mqf5Y2tquohXS7bzsUue4GL0BjG+LX0Iq+Q1kZ6k810S5E2OSvWojoqn8UWHdEWQhan3K4yYo1w==
X-Received: by 2002:a05:6512:acc:b0:4b4:bab7:d5a8 with SMTP id
 n12-20020a0565120acc00b004b4bab7d5a8mr25682371lfu.404.1670495502030; 
 Thu, 08 Dec 2022 02:31:42 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 02:31:41 -0800 (PST)
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
Date: Thu,  8 Dec 2022 11:31:14 +0100
Message-Id: <20221208103115.25512-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <treding@nvidia.com>
Subject: [Linux-stm32] [PATCH v4 8/9] media: dt-bindings: nvidia,
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

Changes since v3:
1. Correct path in maintainers.

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
index 197351d3bb57..5c2593f346f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-tegra@vger.kernel.org
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/tegra-cec.txt
+F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 F:	drivers/media/cec/platform/tegra/
 
 ARM/TESLA FSD SoC SUPPORT
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
