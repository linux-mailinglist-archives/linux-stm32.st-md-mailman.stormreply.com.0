Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0411424F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 15:08:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1AA3C36B0B;
	Thu,  5 Dec 2019 14:08:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AD75C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 14:08:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5DvoKD026399; Thu, 5 Dec 2019 15:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ZunBs5XNBGkzdynuEgHyci3GLZOhq0qbk3yNCy97EIA=;
 b=cpTsspLdKyQwhA+MWFENbPsldOdIketC9u9kVm8fQl7+LCNhXWy4CgpMOuhjYTmPYX19
 qGd3Ple5TB0eIsGW4c+6FkKLK7EA48eBNKb0ooHeR4OAXZSUwqtN69kr4KwjoZRWA2l2
 x4bk3z/XYandsjXaQG7J/RQUD0iPzQOMefc9WPzUMm2+0r3YA1rSWSZ7e1yjADswDyS4
 Wi7XgiUF6PnbqXG3J493N3M35nmKP6+h75aTIJC3UZ0/ylK5ONhqVKhd37pPPjLzekbm
 iN2mvqcZxPXC3Wxw23yPOKruNtnDMJOHhoAgGTJ7k6aUuES1Rkbz0M7qBN9jTsRrRnxL hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6ku5yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 15:08:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C89F10002A;
 Thu,  5 Dec 2019 15:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 521C42A89F9;
 Thu,  5 Dec 2019 15:08:10 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Thu, 5 Dec 2019 15:08:09 +0100
From: Pascal Paillet <p.paillet@st.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 5 Dec 2019 15:08:09 +0100
Message-ID: <20191205140809.19413-1-p.paillet@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_03:2019-12-04,2019-12-05 signatures=0
Cc: p.paillet@st.com
Subject: [Linux-stm32] [PATCH v2] regulator: Convert stm32-pwr regulator to
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

Convert the stm32-pwr regulator binding to DT schema format using
json-schema.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
Changes since v1:
- remove a regulator.yaml reference
- add /schemas/types.yaml#/definitions/phandle-array for supply
- fix indent below required

 .../regulator/st,stm32mp1-pwr-reg.txt         | 43 ------------
 .../regulator/st,stm32mp1-pwr-reg.yaml        | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
deleted file mode 100644
index e372dd3f0c8a..000000000000
--- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-STM32MP1 PWR Regulators
------------------------
-
-Available Regulators in STM32MP1 PWR block are:
-  - reg11 for regulator 1V1
-  - reg18 for regulator 1V8
-  - usb33 for the swtich USB3V3
-
-Required properties:
-- compatible: Must be "st,stm32mp1,pwr-reg"
-- list of child nodes that specify the regulator reg11, reg18 or usb33
-  initialization data for defined regulators. The definition for each of
-  these nodes is defined using the standard binding for regulators found at
-  Documentation/devicetree/bindings/regulator/regulator.txt.
-- vdd-supply: phandle to the parent supply/regulator node for vdd input
-- vdd_3v3_usbfs-supply: phandle to the parent supply/regulator node for usb33
-
-Example:
-
-pwr_regulators: pwr@50001000 {
-	compatible = "st,stm32mp1,pwr-reg";
-	reg = <0x50001000 0x10>;
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-
-	reg11: reg11 {
-		regulator-name = "reg11";
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-	};
-
-	reg18: reg18 {
-		regulator-name = "reg18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	usb33: usb33 {
-		regulator-name = "usb33";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
new file mode 100644
index 000000000000..cc66a7c91260
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/st,stm32mp1-pwr-reg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32MP1 PWR voltage regulators
+
+maintainers:
+  - Pascal Paillet <p.paillet@st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp1,pwr-reg
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Input supply phandle(s) for vdd input
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  vdd_3v3_usbfs-supply:
+    description: Input supply phandle(s) for vdd_3v3_usbfs input
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+patternProperties:
+  "^(reg11|reg18|usb33)$":
+    type: object
+
+    allOf:
+      - $ref: "regulator.yaml#"
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pwr@50001000 {
+      compatible = "st,stm32mp1,pwr-reg";
+      reg = <0x50001000 0x10>;
+      vdd-supply = <&vdd>;
+      vdd_3v3_usbfs-supply = <&vdd_usb>;
+
+      reg11 {
+        regulator-name = "reg11";
+        regulator-min-microvolt = <1100000>;
+        regulator-max-microvolt = <1100000>;
+      };
+
+      reg18 {
+        regulator-name = "reg18";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+      };
+
+      usb33 {
+        regulator-name = "usb33";
+        regulator-min-microvolt = <3300000>;
+        regulator-max-microvolt = <3300000>;
+      };
+    };
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
