Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A125A106B90
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2019 11:45:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E123C36B0C;
	Fri, 22 Nov 2019 10:45:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1512C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2019 10:45:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMAhMJr011963; Fri, 22 Nov 2019 11:45:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3uvMaCvyj8tNBEVETH0tKEXxb92y41/JsxGMzqMtSM0=;
 b=Lh7tB1R1ohJKj4m7G9Csue4E8s4QAaeKoV/JqDc4YtKTvf3p0z4hbVAhT7Bw04eZJAyZ
 vHxWUxlrDUgcQ+lOdWA+0fSThIFxPTO5kvnC9q11E1pcDf999mHebtt/JVehGb7RvPDn
 7JaJSN8NIMln40R12+4BQLEbyIQqmtMDb+0SCYSUFUvhEoVLcqSrBa8mMv+VRpJBg9X5
 p+E2k2WIhiAcQvJQD8HWFoQQBeJ6J3Sz/mMMfw0UUF9IZ094ubNcB4Ercoxw7rkOmvRM
 ZuuPXe7dB//xFr6QqvLAxdbVTsGOqJcWxayp7ET9cLpmrzWaetamDgaGGrKh2ixkgru2 kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usrayx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 11:45:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31F6710002A;
 Fri, 22 Nov 2019 11:45:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 166482B56BD;
 Fri, 22 Nov 2019 11:45:40 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 22 Nov 2019 11:45:39
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Fri, 22 Nov 2019 11:45:36 +0100
Message-ID: <20191122104536.20283-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191122104536.20283-1-benjamin.gaignard@st.com>
References: <20191122104536.20283-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_02:2019-11-21,2019-11-22 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: regulator: Convert stm32 vrefbuf
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

Convert the STM32 regulator vrefbuf binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
CC: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../bindings/regulator/st,stm32-vrefbuf.txt        | 20 ---------
 .../bindings/regulator/st,stm32-vrefbuf.yaml       | 52 ++++++++++++++++++++++
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
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
