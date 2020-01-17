Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 222AB140F98
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 18:04:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7D04C36B0F;
	Fri, 17 Jan 2020 17:04:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31BD0C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 17:04:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HH2uJ1009670; Fri, 17 Jan 2020 18:04:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2SUWeiNhV6oNErDN+s1Xmml+Kuc8NdnwiZ6aj9UFf4U=;
 b=W3mHfGceOea4n98Lrzj+LiyDzCa5aICL0+rhY58p2pPGmoqJmfPKKcMB5xhmUchZv7iq
 gFaq0hzj99NyKri4GS2528mFiW276I63t3w/afiKtkJQIdksHayrbQoQpNW1ICPDXpLd
 rTesoHPFq4t7UeBbP2/Ze+0rYfcdYH0IksMbLKUGRbZBNcErU1LWRWWzsqz3BkPzNmyR
 IStn8Ya2fQwQikP3SOxe9NUgsiXSPHWxyFibcXiZq+xgJ+p+mhHPDPnclzLM3o+9Px4z
 xIRgfX2YW3WuZn/iX5aYidKR1LbsX754+/b1MMwYOmzU8LpW9dCutLHP4c7JVQKSmjkN gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0qy4kcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 18:04:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C198100038;
 Fri, 17 Jan 2020 18:04:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C93BE22168E;
 Fri, 17 Jan 2020 18:04:02 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 17 Jan 2020 18:04:02 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <robh@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Fri, 17 Jan 2020 18:03:52 +0100
Message-ID: <20200117170352.16040-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_04:2020-01-16,
 2020-01-17 signatures=0
Subject: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert spdfirx
	to json-schema
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

Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
Changes in v2:
- Add "additionalProperties: false"
- Also change minItems to 2 for dmas property, as both DMAs are required.

Changes in v3:
- Drop minItems/maxItems for dmas property, remove ref to stm32-dma.txt.
---
 .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
 .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
 create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
deleted file mode 100644
index 33826f2459fa..000000000000
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-STMicroelectronics STM32 S/PDIF receiver (SPDIFRX).
-
-The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
-IEC-60958 and IEC-61937.
-
-Required properties:
-  - compatible: should be "st,stm32h7-spdifrx"
-  - reg: cpu DAI IP base address and size
-  - clocks: must contain an entry for kclk (used as S/PDIF signal reference)
-  - clock-names: must contain "kclk"
-  - interrupts: cpu DAI interrupt line
-  - dmas: DMA specifiers for audio data DMA and iec control flow DMA
-    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt
-  - dma-names: two dmas have to be defined, "rx" and "rx-ctrl"
-
-Optional properties:
-  - resets: Reference to a reset controller asserting the SPDIFRX
-
-The device node should contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in Documentation/devicetree/bindings/
-graph.txt.
-
-Example:
-spdifrx: spdifrx@40004000 {
-	compatible = "st,stm32h7-spdifrx";
-	reg = <0x40004000 0x400>;
-	clocks = <&rcc SPDIFRX_CK>;
-	clock-names = "kclk";
-	interrupts = <97>;
-	dmas = <&dmamux1 2 93 0x400 0x0>,
-	       <&dmamux1 3 94 0x400 0x0>;
-	dma-names = "rx", "rx-ctrl";
-	pinctrl-0 = <&spdifrx_pins>;
-	pinctrl-names = "default";
-
-	spdifrx_port: port {
-		cpu_endpoint: endpoint {
-			remote-endpoint = <&codec_endpoint>;
-		};
-	};
-};
-
-spdif_in: spdif-in {
-	compatible = "linux,spdif-dir";
-
-	codec_port: port {
-		codec_endpoint: endpoint {
-			remote-endpoint = <&cpu_endpoint>;
-		};
-	};
-};
-
-soundcard {
-	compatible = "audio-graph-card";
-	dais = <&spdifrx_port>;
-};
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
new file mode 100644
index 000000000000..b7f7dc452231
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/st,stm32-spdifrx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 S/PDIF receiver (SPDIFRX)
+
+maintainers:
+  - Olivier Moysan <olivier.moysan@st.com>
+
+description: |
+  The SPDIFRX peripheral, is designed to receive an S/PDIF flow compliant with
+  IEC-60958 and IEC-61937.
+
+properties:
+  compatible:
+    enum:
+      - st,stm32h7-spdifrx
+
+  "#sound-dai-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: kclk
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: audio data capture DMA
+      - description: IEC status bits capture DMA
+
+  dma-names:
+    items:
+      - const: rx
+      - const: rx-ctrl
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
+    spdifrx: spdifrx@40004000 {
+        compatible = "st,stm32h7-spdifrx";
+        #sound-dai-cells = <0>;
+        reg = <0x40004000 0x400>;
+        clocks = <&rcc SPDIF_K>;
+        clock-names = "kclk";
+        interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&dmamux1 2 93 0x400 0x0>,
+               <&dmamux1 3 94 0x400 0x0>;
+        dma-names = "rx", "rx-ctrl";
+        pinctrl-0 = <&spdifrx_pins>;
+        pinctrl-names = "default";
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
