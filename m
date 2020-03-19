Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11E18BEA9
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 18:47:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514ADC36B0B;
	Thu, 19 Mar 2020 17:47:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDC94C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 17:47:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JHd8Pr016532; Thu, 19 Mar 2020 18:46:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=oXNrCInOKbWks9uJELVsod6DJLx4EuXuc92666BUHsg=;
 b=joiRPfWQ3YTPizPjgewsnfWMlRMJgf9xM2g+O10bOzXQkut+CiKD/ghpy0SX4W/0hFNs
 6SPcYpUfV6hTd1HC1Jh585SCZafcNzTqjGqgAvHy0K4ZcxWsGgwPK06ScXR0WZiLkgWh
 P8asSmh/YZ+6RVlKkE9DSTW2XVUEw48aLNeO/Mmxtvqd3mAHaN1/ssSpjgBu/LhfbIW2
 a+vlC5d/y9jeXCp5AuwaCIR7DTRsxbzDNz1MsDeWaiNixgkicUIssL4HcL+l6SYDW52G
 PndouZu3/uGfmA4ROdoSrP7D23gbdWeI1VodeKkKxrkVYyzr/hXwtFMAYLiwXNnI+q6f bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95uu1ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 18:46:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D2E010002A;
 Thu, 19 Mar 2020 18:46:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C88F42B4D56;
 Thu, 19 Mar 2020 18:46:40 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 19 Mar 2020 18:46:40 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <robh+dt@kernel.org>, <jic23@kernel.org>
Date: Thu, 19 Mar 2020 18:46:23 +0100
Message-ID: <1584639983-31098-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_06:2020-03-19,
 2020-03-19 signatures=0
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: iio: dac: stm32-dac: convert
	bindings to json-schema
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

Convert the STM32 DAC binding to DT schema format using json-schema

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
Changes in v2:
- Fix id relative path/filename as detected by Rob's bot
---
 .../devicetree/bindings/iio/dac/st,stm32-dac.txt   |  63 ------------
 .../devicetree/bindings/iio/dac/st,stm32-dac.yaml  | 110 +++++++++++++++++++++
 2 files changed, 110 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
 create mode 100644 Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml

diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
deleted file mode 100644
index bf2925c..00000000
--- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-STMicroelectronics STM32 DAC
-
-The STM32 DAC is a 12-bit voltage output digital-to-analog converter. The DAC
-may be configured in 8 or 12-bit mode. It has two output channels, each with
-its own converter.
-It has built-in noise and triangle waveform generator and supports external
-triggers for conversions. The DAC's output buffer allows a high drive output
-current.
-
-Contents of a stm32 dac root node:
------------------------------------
-Required properties:
-- compatible: Should be one of:
-  "st,stm32f4-dac-core"
-  "st,stm32h7-dac-core"
-- reg: Offset and length of the device's register set.
-- clocks: Must contain an entry for pclk (which feeds the peripheral bus
-  interface)
-- clock-names: Must be "pclk".
-- vref-supply: Phandle to the vref+ input analog reference supply.
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- resets: Must contain the phandle to the reset controller.
-- A pinctrl state named "default" for each DAC channel may be defined to set
-  DAC_OUTx pin in mode of operation for analog output on external pin.
-
-Contents of a stm32 dac child node:
------------------------------------
-DAC core node should contain at least one subnode, representing a
-DAC instance/channel available on the machine.
-
-Required properties:
-- compatible: Must be "st,stm32-dac".
-- reg: Must be either 1 or 2, to define (single) channel in use
-- #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
-  Documentation/devicetree/bindings/iio/iio-bindings.txt
-
-Example:
-	dac: dac@40007400 {
-		compatible = "st,stm32h7-dac-core";
-		reg = <0x40007400 0x400>;
-		clocks = <&clk>;
-		clock-names = "pclk";
-		vref-supply = <&reg_vref>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&dac_out1 &dac_out2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dac1: dac@1 {
-			compatible = "st,stm32-dac";
-			#io-channels-cells = <1>;
-			reg = <1>;
-		};
-
-		dac2: dac@2 {
-			compatible = "st,stm32-dac";
-			#io-channels-cells = <1>;
-			reg = <2>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
new file mode 100644
index 00000000..393f700
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: STMicroelectronics STM32 DAC bindings
+
+description: |
+  The STM32 DAC is a 12-bit voltage output digital-to-analog converter. The DAC
+  may be configured in 8 or 12-bit mode. It has two output channels, each with
+  its own converter.
+  It has built-in noise and triangle waveform generator and supports external
+  triggers for conversions. The DAC's output buffer allows a high drive output
+  current.
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f4-dac-core
+      - st,stm32h7-dac-core
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  vref-supply:
+    description: Phandle to the vref input analog reference voltage.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - vref-supply
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^dac@[1-2]+$":
+    type: object
+    description:
+      A DAC block node should contain at least one subnode, representing an
+      DAC instance/channel available on the machine.
+
+    properties:
+      compatible:
+        const: st,stm32-dac
+
+      reg:
+        description: Must be either 1 or 2, to define (single) channel in use
+        enum: [1, 2]
+
+      '#io-channel-cells':
+        const: 1
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - '#io-channel-cells'
+
+examples:
+  - |
+    // Example on stm32mp157c
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    dac: dac@40017000 {
+      compatible = "st,stm32h7-dac-core";
+      reg = <0x40017000 0x400>;
+      clocks = <&rcc DAC12>;
+      clock-names = "pclk";
+      vref-supply = <&vref>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dac@1 {
+        compatible = "st,stm32-dac";
+        #io-channel-cells = <1>;
+        reg = <1>;
+      };
+
+      dac@2 {
+        compatible = "st,stm32-dac";
+        #io-channel-cells = <1>;
+        reg = <2>;
+      };
+    };
+
+...
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
