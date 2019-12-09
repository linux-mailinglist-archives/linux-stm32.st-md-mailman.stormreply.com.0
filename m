Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DC11750E
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2019 20:00:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED082C36B0B;
	Mon,  9 Dec 2019 19:00:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF6DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2019 19:00:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89B013FD;
 Mon,  9 Dec 2019 11:00:01 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268113F6CF;
 Mon,  9 Dec 2019 11:00:01 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-Reply-To: <20191122104536.20283-2-benjamin.gaignard@st.com>
Message-Id: <applied-20191122104536.20283-2-benjamin.gaignard@st.com>
X-Patchwork-Hint: ignore
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "dt-bindings: regulator: Convert stm32
	vrefbuf bindings to json-schema" to the regulator tree
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

The patch

   dt-bindings: regulator: Convert stm32 vrefbuf bindings to json-schema

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 21b2c47161449c44e5a70eab646260aaeceb331c Mon Sep 17 00:00:00 2001
From: Benjamin Gaignard <benjamin.gaignard@st.com>
Date: Fri, 22 Nov 2019 11:45:36 +0100
Subject: [PATCH] dt-bindings: regulator: Convert stm32 vrefbuf bindings to
 json-schema

Convert the STM32 regulator vrefbuf binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
CC: Fabrice Gasnier <fabrice.gasnier@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20191122104536.20283-2-benjamin.gaignard@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/st,stm32-vrefbuf.txt   | 20 -------
 .../bindings/regulator/st,stm32-vrefbuf.yaml  | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
deleted file mode 100644
index 5ddb8500a929..000000000000
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-STM32 VREFBUF - Voltage reference buffer
-
-Some STM32 devices embed a voltage reference buffer which can be used as
-voltage reference for ADCs, DACs and also as voltage reference for external
-components through the dedicated VREF+ pin.
-
-Required properties:
-- compatible:		Must be "st,stm32-vrefbuf".
-- reg:			Offset and length of VREFBUF register set.
-- clocks:		Must contain an entry for peripheral clock.
-
-Example:
-	vrefbuf: regulator@58003c00 {
-		compatible = "st,stm32-vrefbuf";
-		reg = <0x58003C00 0x8>;
-		clocks = <&rcc VREF_CK>;
-		regulator-min-microvolt = <1500000>;
-		regulator-max-microvolt = <2500000>;
-		vdda-supply = <&vdda>;
-	};
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
new file mode 100644
index 000000000000..33cdaeb25aee
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/st,stm32-vrefbuf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Voltage reference buffer bindings
+
+description: |
+  Some STM32 devices embed a voltage reference buffer which can be used as
+  voltage reference for ADCs, DACs and also as voltage reference for external
+  components through the dedicated VREF+ pin.
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@st.com>
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: st,stm32-vrefbuf
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdda-supply:
+    description: phandle to the vdda input analog voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    vrefbuf@50025000 {
+      compatible = "st,stm32-vrefbuf";
+      reg = <0x50025000 0x8>;
+      regulator-min-microvolt = <1500000>;
+      regulator-max-microvolt = <2500000>;
+      clocks = <&rcc VREF>;
+      vdda-supply = <&vdda>;
+    };
+
+...
+
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
