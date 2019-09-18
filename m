Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C53B6926
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 19:32:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E149C35E01;
	Wed, 18 Sep 2019 17:32:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08BECC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 17:32:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C63B821907;
 Wed, 18 Sep 2019 17:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568827945;
 bh=PpVGfmbQUMan+CEI3W/iEi0A42O/v6szcQ9dLYD6us0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=urz9lZOdJFxt+2VRjRLmtSMTeQ1d4Jy9u76x7VlvtwoYzmIbeDlEEGw81w8mx/0h4
 LF8vtSFKa7DlJuwnsTz3I5nITsyzHmKwB2Tlwz6T7PH/6U/CmGjhnO5eCH4I53nymK
 BJi93q9qF9RgqdKxkf3GSlDFcoSD9jDwY0RTZqQM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org
Date: Wed, 18 Sep 2019 19:31:36 +0200
Message-Id: <20190918173141.4314-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918173141.4314-1-krzk@kernel.org>
References: <20190918173141.4314-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 3/8] dt-bindings: sram: Convert Samsung
	Exynos SYSRAM bindings to json-schema
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Convert Samsung Exynos SYSRAM bindings to DT schema format using
json-schema.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

TODO:
The node naming should be probably fixed (sysram->sram)

Changes since v1:
1. Indent example with four spaces (more readable).
---
 .../devicetree/bindings/sram/samsung-sram.txt | 38 ------------
 .../bindings/sram/samsung-sram.yaml           | 58 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 59 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.txt
 create mode 100644 Documentation/devicetree/bindings/sram/samsung-sram.yaml

diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.txt b/Documentation/devicetree/bindings/sram/samsung-sram.txt
deleted file mode 100644
index 61a9bbed303d..000000000000
--- a/Documentation/devicetree/bindings/sram/samsung-sram.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Samsung Exynos SYSRAM for SMP bringup:
-------------------------------------
-
-Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
-of the secondary cores. Once the core gets powered up it executes the
-code that is residing at some specific location of the SYSRAM.
-
-Therefore reserved section sub-nodes have to be added to the mmio-sram
-declaration. These nodes are of two types depending upon secure or
-non-secure execution environment.
-
-Required sub-node properties:
-- compatible : depending upon boot mode, should be
-		"samsung,exynos4210-sysram" : for Secure SYSRAM
-		"samsung,exynos4210-sysram-ns" : for Non-secure SYSRAM
-
-The rest of the properties should follow the generic mmio-sram discription
-found in Documentation/devicetree/bindings/sram/sram.txt
-
-Example:
-
-	sysram@2020000 {
-		compatible = "mmio-sram";
-		reg = <0x02020000 0x54000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x02020000 0x54000>;
-
-		smp-sysram@0 {
-			compatible = "samsung,exynos4210-sysram";
-			reg = <0x0 0x1000>;
-		};
-
-		smp-sysram@53000 {
-			compatible = "samsung,exynos4210-sysram-ns";
-			reg = <0x53000 0x1000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.yaml b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
new file mode 100644
index 000000000000..f49b3b58eb5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/samsung-sram.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/samsung-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC SYSRAM for SMP bringup
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |+
+  Samsung SMP-capable Exynos SoCs use part of the SYSRAM for the bringup
+  of the secondary cores. Once the core gets powered up it executes the
+  code that is residing at some specific location of the SYSRAM.
+
+  Therefore reserved section sub-nodes have to be added to the mmio-sram
+  declaration. These nodes are of two types depending upon secure or
+  non-secure execution environment.
+
+allOf:
+  - $ref: "sram.yaml#"
+
+properties:
+  $nodename:
+    pattern: "^sysram(@.*)?"
+
+patternProperties:
+  "^([a-z]*-)?sysram@[a-f0-9]$":
+    type: object
+
+    properties:
+      compatible:
+        description:
+          Depending upon boot mode
+        enum:
+          - samsung,exynos4210-sysram                 # for Secure SYSRAM
+          - samsung,exynos4210-sysram-ns              # for Non-secure SYSRAM
+
+examples:
+  - |
+    sysram@2020000 {
+        compatible = "mmio-sram";
+        reg = <0x02020000 0x54000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x02020000 0x54000>;
+
+        smp-sysram@0 {
+            compatible = "samsung,exynos4210-sysram";
+            reg = <0x0 0x1000>;
+        };
+
+        smp-sysram@53000 {
+            compatible = "samsung,exynos4210-sysram-ns";
+            reg = <0x53000 0x1000>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cec4494b9a8..c49d35dce088 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2225,7 +2225,7 @@ F:	drivers/soc/samsung/
 F:	include/linux/soc/samsung/
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
-F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
+F:	Documentation/devicetree/bindings/sram/samsung-sram.yaml
 F:	Documentation/devicetree/bindings/power/pd-samsung.txt
 N:	exynos
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
