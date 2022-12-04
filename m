Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B65641EAE
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Dec 2022 19:29:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE0BFC65E63;
	Sun,  4 Dec 2022 18:29:29 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19BBEC65E69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Dec 2022 18:29:29 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id l8so11148870ljh.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Dec 2022 10:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8C4yM6JfnWx+5c88oEZ/S1AWqRyQREMQSAfJIbG/3I=;
 b=tPr2OkoerVnmmuJLJeMOIqxvFCUhWxS09ZTSbuWN5MsRcNRMPdkV1xT8YAf5pzvxgz
 17DlGft1khgQo+qM2doi/jk03v4D1jjU53wvJW0rRBhwG8rCo2mvmSCPH8H+4MSzQ3Yh
 Vdh7S7JngzP1RAvaGls/aDG/ibwJSi5v4fq1WBVi9/Q4RoFzHHtaRBoY/6tBLDZGihmw
 tUoS0inrQc2CPP0ge1uXDfd0kMYZhMaCpA22YQnmJjNePpLezGbXjTjMb6gIjcs+Qk8M
 /bNVEK0Tslz4DwipoPzYJcY5tvtNWVuywJD/Jn1kqtYOHu2lyKMMHa5ihMx6IWoAY+0s
 vrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8C4yM6JfnWx+5c88oEZ/S1AWqRyQREMQSAfJIbG/3I=;
 b=yzpXgxKO0+yj6G7SWXnuIf7YNo6INPx0/uY9dUy8rtiKjL9rkA6ixyrKiEZZ7C9O2Y
 In23Bgc87Vi6kfbGbz22JalKsv1AowI9rVsUvAwuX0HC5HgUCvsAO7kveud130k3fwMN
 yL6U/Kmzzj/r6R3VcwiLurwqc2TRsEkoGAoi7KKZmat8034alKmL52QAzS5HVlznXeTS
 W+aVoEYcMPziJflqHN3DJZFS73NgtOejNN6RI4OZwZRNRmZHeV+DlXelr9UPYIDkGBN6
 /mM72UsRxSJxTRphu7oqr9NPPmShCTB1u8KnLPECMNFJW/bs4Vm47xaeCceO98zUyq8i
 q/GQ==
X-Gm-Message-State: ANoB5pnxBHI2fLp06Mq1smWlR+1fq0Lxv6mXFyUnCtqYduGA8EQkTTf+
 +XQKrqRQEa7pnej0kYY2zIAaXQ==
X-Google-Smtp-Source: AA0mqf60Aq3IxvaAxHTeIBYUQDsQGUBZtlBfGiTOlFu5VSPKTafkz2xHBYrn9vQuBe5Xlm6FpOpqWw==
X-Received: by 2002:a2e:a274:0:b0:278:eef5:8d07 with SMTP id
 k20-20020a2ea274000000b00278eef58d07mr23643995ljm.61.1670178568547; 
 Sun, 04 Dec 2022 10:29:28 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 10:29:28 -0800 (PST)
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
Date: Sun,  4 Dec 2022 19:29:07 +0100
Message-Id: <20221204182908.138910-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 8/9] media: dt-bindings: nvidia,
	tegra-cec: convert to DT schema
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

Convert Nvidia Tegra HDMI CEC bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
 .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
new file mode 100644
index 000000000000..9a4025ff7fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvidia Tegra HDMI CEC
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
