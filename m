Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391B1649E6
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2020 17:18:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08413C36B0B;
	Wed, 19 Feb 2020 16:18:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9265C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 16:18:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JGCh9U031765; Wed, 19 Feb 2020 17:17:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9NamLGhs1g5nnm8A0MBVlS+ZYEhBZEt4VSnOcM6QmqY=;
 b=QH9+HyeVbVNWVK5fp53HuhGwzhf6GG20PkI37SxmrAuUbYpQ9BskBOEirw7zc5sWAk3l
 oyiUOVC+hRCzM+N8z5q36dNApzXbshQf0BX2dflNnGnNAFAvb3+9UaO+XSP1HbiRg6fg
 KwgbCPuLz55kvRTb82qHrzaf0ymnGeJhhVWEWjApFeNKo5/DuDYYlFfWqDQuZmoFg6hh
 N334lc0SfBU/SxK5/zXYk1/gONIVThL4KbaVnOr/2mp/irL/+Z2B7Xigt84cbcE4VzTr
 K1WANXI8z2MqHpud67o5DvVLv5yg0ib96amV9LQlZGBLSWfTlcIOeNAWGcGM4j1Y4GXC JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8uafm22d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 17:17:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 85A5110002A;
 Wed, 19 Feb 2020 17:17:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E6D62D7CC0;
 Wed, 19 Feb 2020 17:17:46 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 19 Feb 2020 17:17:45 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>
Date: Wed, 19 Feb 2020 17:17:33 +0100
Message-ID: <20200219161733.9317-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_04:2020-02-19,
 2020-02-19 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert sai to
	json-schema
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

Convert the STM32 SAI bindings to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
Changes in v2:
- use pattern for compatible of child nodes
- rework dmas and clocks properties
- add "additionalProperties"

Changes in v3:
- move clocks properties for st,stm32h7-sai compatible, to 'else' clause
---
 .../bindings/sound/st,stm32-sai.txt           | 107 ----------
 .../bindings/sound/st,stm32-sai.yaml          | 193 ++++++++++++++++++
 2 files changed, 193 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
deleted file mode 100644
index 944743dd9212..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-STMicroelectronics STM32 Serial Audio Interface (SAI).
-
-The SAI interface (Serial Audio Interface) offers a wide set of audio protocols
-as I2S standards, LSB or MSB-justified, PCM/DSP, TDM, and AC'97.
-The SAI contains two independent audio sub-blocks. Each sub-block has
-its own clock generator and I/O lines controller.
-
-Required properties:
-  - compatible: Should be "st,stm32f4-sai" or "st,stm32h7-sai"
-  - reg: Base address and size of SAI common register set.
-  - clocks: Must contain phandle and clock specifier pairs for each entry
-	in clock-names.
-  - clock-names: Must contain "pclk" "x8k" and "x11k"
-	"pclk": Clock which feeds the peripheral bus interface.
-	        Mandatory for "st,stm32h7-sai" compatible.
-	        Not used for "st,stm32f4-sai" compatible.
-	"x8k": SAI parent clock for sampling rates multiple of 8kHz.
-	"x11k": SAI parent clock for sampling rates multiple of 11.025kHz.
-  - interrupts: cpu DAI interrupt line shared by SAI sub-blocks
-
-Optional properties:
-  - resets: Reference to a reset controller asserting the SAI
-
-SAI subnodes:
-Two subnodes corresponding to SAI sub-block instances A et B can be defined.
-Subnode can be omitted for unsused sub-block.
-
-SAI subnodes required properties:
-  - compatible: Should be "st,stm32-sai-sub-a" or "st,stm32-sai-sub-b"
-	for SAI sub-block A or B respectively.
-  - reg: Base address and size of SAI sub-block register set.
-  - clocks: Must contain one phandle and clock specifier pair
-	for sai_ck which feeds the internal clock generator.
-	If the SAI shares a master clock, with another SAI set as MCLK
-	clock provider, SAI provider phandle must be specified here.
-  - clock-names: Must contain "sai_ck".
-	Must also contain "MCLK", if SAI shares a master clock,
-	with a SAI set as MCLK clock provider.
-  - dmas: see Documentation/devicetree/bindings/dma/stm32-dma.txt
-  - dma-names: identifier string for each DMA request line
-	"tx": if sai sub-block is configured as playback DAI
-	"rx": if sai sub-block is configured as capture DAI
-  - pinctrl-names: should contain only value "default"
-  - pinctrl-0: see Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
-
-SAI subnodes Optional properties:
-  - st,sync: specify synchronization mode.
-	By default SAI sub-block is in asynchronous mode.
-	This property sets SAI sub-block as slave of another SAI sub-block.
-	Must contain the phandle and index of the sai sub-block providing
-	the synchronization.
-  - st,iec60958: support S/PDIF IEC6958 protocol for playback
-	IEC60958 protocol is not available for capture.
-	By default, custom protocol is assumed, meaning that protocol is
-	configured according to protocol defined in related DAI link node,
-	such as i2s, left justified, right justified, dsp and pdm protocols.
-	Note: ac97 protocol is not supported by SAI driver
-   - #clock-cells: should be 0. This property must be present if the SAI device
-	is a master clock provider, according to clocks bindings, described in
-	Documentation/devicetree/bindings/clock/clock-bindings.txt.
-
-The device node should contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in Documentation/devicetree/bindings/
-graph.txt.
-
-Example:
-sound_card {
-	compatible = "audio-graph-card";
-	dais = <&sai1b_port>;
-};
-
-sai1: sai1@40015800 {
-	compatible = "st,stm32h7-sai";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges = <0 0x40015800 0x400>;
-	reg = <0x40015800 0x4>;
-	clocks = <&rcc SAI1_CK>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
-	clock-names = "pclk", "x8k", "x11k";
-	interrupts = <87>;
-
-	sai1a: audio-controller@40015804 {
-		compatible = "st,stm32-sai-sub-a";
-		reg = <0x4 0x1C>;
-		clocks = <&rcc SAI1_CK>;
-		clock-names = "sai_ck";
-		dmas = <&dmamux1 1 87 0x400 0x0>;
-		dma-names = "tx";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sai1a>;
-
-		sai1b_port: port {
-			cpu_endpoint: endpoint {
-				remote-endpoint = <&codec_endpoint>;
-				format = "i2s";
-			};
-		};
-	};
-};
-
-audio-codec {
-	codec_port: port {
-		codec_endpoint: endpoint {
-			remote-endpoint = <&cpu_endpoint>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
new file mode 100644
index 000000000000..cdea20150c1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/st,stm32-sai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Serial Audio Interface (SAI)
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+description:
+  The SAI interface (Serial Audio Interface) offers a wide set of audio
+  protocols as I2S standards, LSB or MSB-justified, PCM/DSP, TDM, and AC'97.
+  The SAI contains two independent audio sub-blocks. Each sub-block has
+  its own clock generator and I/O lines controller.
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f4-sai
+      - st,stm32h7-sai
+
+  reg:
+    items:
+      - description: Base address and size of SAI common register set.
+      - description: Base address and size of SAI identification register set.
+    minItems: 1
+    maxItems: 2
+
+  ranges:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+  - clocks
+  - clock-names
+
+patternProperties:
+  "^audio-controller@[0-9a-f]+$":
+    type: object
+    description:
+      Two subnodes corresponding to SAI sub-block instances A et B
+      can be defined. Subnode can be omitted for unsused sub-block.
+
+    properties:
+      compatible:
+        description: Compatible for SAI sub-block A or B.
+        pattern: "st,stm32-sai-sub-[ab]"
+
+      "#sound-dai-cells":
+        const: 0
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        items:
+          - description: sai_ck clock feeding the internal clock generator.
+          - description: MCLK clock from a SAI set as master clock provider.
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: sai_ck
+          - const: MCLK
+        minItems: 1
+        maxItems: 2
+
+      dmas:
+        maxItems: 1
+
+      dma-names:
+        description: |
+          rx: SAI sub-block is configured as a capture DAI.
+          tx: SAI sub-block is configured as a playback DAI.
+        enum: [ rx, tx ]
+
+      st,sync:
+        description:
+          Configure the SAI sub-block as slave of another SAI sub-block.
+          By default SAI sub-block is in asynchronous mode.
+          Must contain the phandle and index of the SAI sub-block providing
+          the synchronization.
+        allOf:
+          - $ref: /schemas/types.yaml#definitions/phandle-array
+          - maxItems: 1
+
+      st,iec60958:
+        description:
+          If set, support S/PDIF IEC6958 protocol for playback.
+          IEC60958 protocol is not available for capture.
+          By default, custom protocol is assumed, meaning that protocol is
+          configured according to protocol defined in related DAI link node,
+          such as i2s, left justified, right justified, dsp and pdm protocols.
+        allOf:
+          - $ref: /schemas/types.yaml#definitions/flag
+
+      "#clock-cells":
+        description: Configure the SAI device as master clock provider.
+        const: 0
+
+    required:
+      - compatible
+      - "#sound-dai-cells"
+      - reg
+      - clocks
+      - clock-names
+      - dmas
+      - dma-names
+
+    additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32f4-sai
+
+  - then:
+      properties:
+        clocks:
+          items:
+            - description: x8k, SAI parent clock for sampling rates multiple of 8kHz.
+            - description: x11k, SAI parent clock for sampling rates multiple of 11.025kHz.        
+
+        clock-names:
+          items:
+            - const: x8k
+            - const: x11k
+
+  - else:
+      properties:
+        clocks:
+          items:
+            - description: pclk feeds the peripheral bus interface.
+            - description: x8k, SAI parent clock for sampling rates multiple of 8kHz.
+            - description: x11k, SAI parent clock for sampling rates multiple of 11.025kHz.
+
+        clock-names:
+          items:
+            - const: pclk
+            - const: x8k
+            - const: x11k
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    sai1: sai@4400a000 {
+      compatible = "st,stm32h7-sai";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0 0x4400a000 0x400>;
+      reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
+      interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&rcc SAI1>, <&rcc PLL1_Q>, <&rcc PLL2_P>;
+      clock-names = "pclk", "x8k", "x11k";
+      resets = <&rcc SAI1_R>;
+
+      sai1a: audio-controller@4400a004 {
+        compatible = "st,stm32-sai-sub-a";
+        #sound-dai-cells = <0>;
+        reg = <0x4 0x1c>;
+        clocks = <&rcc SAI1_K>;
+        clock-names = "sai_ck";
+        dmas = <&dmamux1 87 0x400 0x01>;
+        dma-names = "tx";
+      };
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
