Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6F16505B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2020 21:56:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC0ACC36B0B;
	Wed, 19 Feb 2020 20:56:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D08F5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 20:56:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491D61FB;
 Wed, 19 Feb 2020 12:56:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C17EF3F68F;
 Wed, 19 Feb 2020 12:56:45 -0800 (PST)
Date: Wed, 19 Feb 2020 20:56:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200207120345.24672-1-olivier.moysan@st.com>
Message-Id: <applied-20200207120345.24672-1-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Applied "ASoC: dt-bindings: stm32: convert i2s to
	json-schema" to the asoc tree
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

   ASoC: dt-bindings: stm32: convert i2s to json-schema

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 95e9e205fcbe34d003c558e0a98e6ae6f9ab3a61 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Fri, 7 Feb 2020 13:03:45 +0100
Subject: [PATCH] ASoC: dt-bindings: stm32: convert i2s to json-schema

Convert the STM32 I2S bindings to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20200207120345.24672-1-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/st,stm32-i2s.txt           | 62 -------------
 .../bindings/sound/st,stm32-i2s.yaml          | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt b/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
deleted file mode 100644
index cbf24bcd1b8d..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-STMicroelectronics STM32 SPI/I2S Controller
-
-The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
-Only some SPI instances support I2S.
-
-Required properties:
-  - compatible: Must be "st,stm32h7-i2s"
-  - reg: Offset and length of the device's register set.
-  - interrupts: Must contain the interrupt line id.
-  - clocks: Must contain phandle and clock specifier pairs for each entry
-	in clock-names.
-  - clock-names: Must contain "i2sclk", "pclk", "x8k" and "x11k".
-	"i2sclk": clock which feeds the internal clock generator
-	"pclk": clock which feeds the peripheral bus interface
-	"x8k": I2S parent clock for sampling rates multiple of 8kHz.
-	"x11k": I2S parent clock for sampling rates multiple of 11.025kHz.
-  - dmas: DMA specifiers for tx and rx dma.
-    See Documentation/devicetree/bindings/dma/stm32-dma.txt.
-  - dma-names: Identifier for each DMA request line. Must be "tx" and "rx".
-  - pinctrl-names: should contain only value "default"
-  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
-
-Optional properties:
-  - resets: Reference to a reset controller asserting the reset controller
-
-The device node should contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in Documentation/devicetree/bindings/
-graph.txt.
-
-Example:
-sound_card {
-	compatible = "audio-graph-card";
-	dais = <&i2s2_port>;
-};
-
-i2s2: audio-controller@40003800 {
-	compatible = "st,stm32h7-i2s";
-	reg = <0x40003800 0x400>;
-	interrupts = <36>;
-	clocks = <&rcc PCLK1>, <&rcc SPI2_CK>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
-	clock-names = "pclk", "i2sclk",  "x8k", "x11k";
-	dmas = <&dmamux2 2 39 0x400 0x1>,
-           <&dmamux2 3 40 0x400 0x1>;
-	dma-names = "rx", "tx";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2s2>;
-
-	i2s2_port: port@0 {
-		cpu_endpoint: endpoint {
-			remote-endpoint = <&codec_endpoint>;
-			format = "i2s";
-		};
-	};
-};
-
-audio-codec {
-	codec_port: port@0 {
-		codec_endpoint: endpoint {
-			remote-endpoint = <&cpu_endpoint>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
new file mode 100644
index 000000000000..f32410890589
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 SPI/I2S Controller
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+description:
+  The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
+  Only some SPI instances support I2S.
+
+properties:
+  compatible:
+    enum:
+      - st,stm32h7-i2s
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock feeding the peripheral bus interface.
+      - description: clock feeding the internal clock generator.
+      - description: I2S parent clock for sampling rates multiple of 8kHz.
+      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: i2sclk
+      - const: x8k
+      - const: x11k
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: audio capture DMA.
+      - description: audio playback DMA.
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    i2s2: audio-controller@4000b000 {
+        compatible = "st,stm32h7-i2s";
+        #sound-dai-cells = <0>;
+        reg = <0x4000b000 0x400>;
+        clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+        clock-names = "pclk", "i2sclk", "x8k", "x11k";
+        interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dmamux1 39 0x400 0x01>,
+               <&dmamux1 40 0x400 0x01>;
+        dma-names = "rx", "tx";
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2s2_pins_a>;
+    };
+
+...
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
