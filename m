Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E52B4C73
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 18:19:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22D19C3FAD7;
	Mon, 16 Nov 2020 17:19:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 387B4C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 17:19:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGH7VEo003557; Mon, 16 Nov 2020 18:19:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fSRa7RfA0XanyYGJn+p+EMlajUNjG8dZjZ4HGQmdNeU=;
 b=euepazcS/D5ocEKwqFFWxY8GmuEtZMU1wJrQmlzOwDbai7OddC7GTVm94eSnA0CGIfGX
 eSu/VBJAvxHHa2XGO+m1Cnm6zeDaHqQ2mgiLTz2vSKzU7lUsxKzAw81Y4o+Tkt2687QC
 Z4UCuROZMKAxsQS9DU+7gHz3afPn032vNYoHU0v05mJWdB329Fi1Z1rlCmoFg3X94j02
 jB8sR4ris+UtQsUDL1/UPW2AkekGhjTvU/5xAo3G4Cuk97FeP4ecv7p2RZoRcUnAKbL1
 cIKI8g+Md8ch/JfVA101fXM3N/6oJEekFl/0KM8mMxfoqGT5GKFG+TB1QXVloNZakkAb zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t70gc6h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 18:19:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4182810002A;
 Mon, 16 Nov 2020 18:19:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E9CE22FFB9;
 Mon, 16 Nov 2020 18:19:20 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Nov 2020 18:19:19
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Vinod Koul <vkoul@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 16 Nov 2020 18:19:17 +0100
Message-ID: <20201116171917.10447-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_09:2020-11-13,
 2020-11-16 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/1] dt-bindings: phy: phy-stm32-usbphyc:
	convert bindings to json-schema
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

Convert the STM32 USB PHY Controller (USBPHYC) bindings to DT schema format
using json-schema.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2: add additionalProperties also for child nodes and Rob's Reviewed-by
---
 .../bindings/phy/phy-stm32-usbphyc.txt        |  73 ---------
 .../bindings/phy/phy-stm32-usbphyc.yaml       | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
deleted file mode 100644
index 725ae71ae653..000000000000
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-STMicroelectronics STM32 USB HS PHY controller
-
-The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
-switch. It controls PHY configuration and status, and the UTMI+ switch that
-selects either OTG or HOST controller for the second PHY port. It also sets
-PLL configuration.
-
-USBPHYC
-      |_ PLL
-      |
-      |_ PHY port#1 _________________ HOST controller
-      |                    _                 |
-      |                  / 1|________________|
-      |_ PHY port#2 ----|   |________________
-      |                  \_0|                |
-      |_ UTMI switch_______|          OTG controller
-
-
-Phy provider node
-=================
-
-Required properties:
-- compatible: must be "st,stm32mp1-usbphyc"
-- reg: address and length of the usb phy control register set
-- clocks: phandle + clock specifier for the PLL phy clock
-- #address-cells: number of address cells for phys sub-nodes, must be <1>
-- #size-cells: number of size cells for phys sub-nodes, must be <0>
-
-Optional properties:
-- assigned-clocks: phandle + clock specifier for the PLL phy clock
-- assigned-clock-parents: the PLL phy clock parent
-- resets: phandle + reset specifier
-
-Required nodes: one sub-node per port the controller provides.
-
-Phy sub-nodes
-==============
-
-Required properties:
-- reg: phy port index
-- phy-supply: phandle to the regulator providing 3V3 power to the PHY,
-	      see phy-bindings.txt in the same directory.
-- vdda1v1-supply: phandle to the regulator providing 1V1 power to the PHY
-- vdda1v8-supply: phandle to the regulator providing 1V8 power to the PHY
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0> for PHY
-  port#1 and must be <1> for PHY port#2, to select USB controller
-
-
-Example:
-		usbphyc: usb-phy@5a006000 {
-			compatible = "st,stm32mp1-usbphyc";
-			reg = <0x5a006000 0x1000>;
-			clocks = <&rcc_clk USBPHY_K>;
-			resets = <&rcc_rst USBPHY_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			usbphyc_port0: usb-phy@0 {
-				reg = <0>;
-				phy-supply = <&vdd_usb>;
-				vdda1v1-supply = <&reg11>;
-				vdda1v8-supply = <&reg18>
-				#phy-cells = <0>;
-			};
-
-			usbphyc_port1: usb-phy@1 {
-				reg = <1>;
-				phy-supply = <&vdd_usb>;
-				vdda1v1-supply = <&reg11>;
-				vdda1v8-supply = <&reg18>
-				#phy-cells = <1>;
-			};
-		};
diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
new file mode 100644
index 000000000000..0ba61979b970
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/phy-stm32-usbphyc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 USB HS PHY controller binding
+
+description:
+
+  The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
+  switch. It controls PHY configuration and status, and the UTMI+ switch that
+  selects either OTG or HOST controller for the second PHY port. It also sets
+  PLL configuration.
+
+  USBPHYC
+  |_ PLL
+  |
+  |_ PHY port#1 _________________ HOST controller
+  |                   __                 |
+  |                  / 1|________________|
+  |_ PHY port#2 ----|   |________________
+  |                  \_0|                |
+  |_ UTMI switch_______|          OTG controller
+
+maintainers:
+  - Amelie Delaunay <amelie.delaunay@st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp1-usbphyc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+#Required child nodes:
+
+patternProperties:
+  "^usb-phy@[0|1]$":
+    type: object
+    description:
+      Each port the controller provides must be represented as a sub-node.
+
+    properties:
+      reg:
+        description: phy port index.
+        maxItems: 1
+
+      phy-supply:
+        description: regulator providing 3V3 power supply to the PHY.
+
+      vdda1v1-supply:
+        description: regulator providing 1V1 power supply to the PLL block
+
+      vdda1v8-supply:
+        description: regulator providing 1V8 power supply to the PLL block
+
+      "#phy-cells":
+        enum: [ 0x0, 0x1 ]
+
+    allOf:
+      - if:
+          properties:
+            reg:
+              const: 0
+        then:
+          properties:
+            "#phy-cells":
+              const: 0
+        else:
+          properties:
+            "#phy-cells":
+              const: 1
+              description:
+                The value is used to select UTMI switch output.
+                0 for OTG controller and 1 for Host controller.
+
+    required:
+      - reg
+      - phy-supply
+      - vdda1v1-supply
+      - vdda1v8-supply
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - usb-phy@0
+  - usb-phy@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    usbphyc: usbphyc@5a006000 {
+        compatible = "st,stm32mp1-usbphyc";
+        reg = <0x5a006000 0x1000>;
+        clocks = <&rcc USBPHY_K>;
+        resets = <&rcc USBPHY_R>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usbphyc_port0: usb-phy@0 {
+            reg = <0>;
+            phy-supply = <&vdd_usb>;
+            vdda1v1-supply = <&reg11>;
+            vdda1v8-supply = <&reg18>;
+            #phy-cells = <0>;
+        };
+
+        usbphyc_port1: usb-phy@1 {
+            reg = <1>;
+            phy-supply = <&vdd_usb>;
+            vdda1v1-supply = <&reg11>;
+            vdda1v8-supply = <&reg18>;
+            #phy-cells = <1>;
+        };
+    };
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
