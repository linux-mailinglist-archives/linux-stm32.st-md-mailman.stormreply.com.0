Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333D14A42C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 13:55:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C853EC36B0B;
	Mon, 27 Jan 2020 12:55:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94EE3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 12:55:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RCrMMq032677; Mon, 27 Jan 2020 13:54:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BQqFihzOu6OsZNMVZCsZXlFqbDZYuOBiwOANKZ7+MbA=;
 b=tmgGe7xcCO1B+kOEgBvUyuPew3fEovjC9Ghjj7iKB+1Oc4eJbOM5TPGivLKppyoawE6R
 2Uu73m8iEKK3P5Dce3Xf00Rf4UH43avHkhvbuLS8Gf3NccxHLtnWjT4Zrtp9bkzRv2qJ
 +g7yOvjh6jQNmngcoqOV08QpoeAFHGuPc+HgigdRI+hUuMN4XrKONape3YDVGMdT5e7i
 QGMc/sf05LHykqBPzlLBlQHw31zBzNOZUulYTQmXd1Ff/wCg3kKXnOfHSN41Tt5wj15r
 IvANcas2/S7SZ+w7PPuoy+oIb3NwJXCT22ZlpMBE9CRgX40G74aLo5UHfm6LZhfMNCuc dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpas3p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 13:54:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CEA0100034;
 Mon, 27 Jan 2020 13:54:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14E542AD147;
 Mon, 27 Jan 2020 13:54:27 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 27 Jan 2020 13:54:26 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <robh@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 27 Jan 2020 13:54:20 +0100
Message-ID: <20200127125420.29827-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Subject: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: convert i2s to
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

Convert the STM32 I2S bindings to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
The items for dma-names and clock-names properties are all
mandatory, but may be provided in any order.
The syntax used for these properties allows to avoid order constraint.
---
 .../bindings/sound/st,stm32-i2s.txt           | 62 -------------
 .../bindings/sound/st,stm32-i2s.yaml          | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 62 deletions(-)
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
index 000000000000..cdfb375c7a14
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
@@ -0,0 +1,91 @@
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
+      - enum: [ pclk, i2sclk, x8k, x11k ]
+      - enum: [ pclk, i2sclk, x8k, x11k ]
+      - enum: [ pclk, i2sclk, x8k, x11k ]
+      - enum: [ pclk, i2sclk, x8k, x11k ]
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string-array
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
+      - enum: [ rx, tx ]
+      - enum: [ rx, tx ]
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/string-array
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
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
