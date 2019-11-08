Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E22F4C1D
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 13:53:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4B6C36B0E;
	Fri,  8 Nov 2019 12:53:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B042CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 12:53:17 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8CqEI6015196; Fri, 8 Nov 2019 13:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7H2L6p4aMQZbG5XB4uxu8UBuL7eVs48hwy7HAKSmpAI=;
 b=VaPfpgUzleU4vIJLQLhDtt8Ru6nOJFUlWfMyb4whxfGjnJowJF9m5pcIE9wcTmdEgJu3
 VQCrNFlcxjheF5fi1WPMzY9hYErFA8IGHVpVMYT0OYPLIw3bIMFHVm0blhgvhZpWj6Zs
 fQ3io09Zee3s7wMCZub1Zdu8D2qSJekfkH9oOcI50VxPrnXSvZi/q4TNBuIIjmyeRSWW
 tuwZ8b5RvYm9gdxKsOwWHpOxOFiUqqGw5XdF2KEE7m0jHnwbUfwJfYlo9N+2VmoRz4fm
 aOm3cJEbLf92QCps+1peqCCSrTDS71nVWzgTW6Gt0edq0vOb1X9ofQlNxODIluzEegjD 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41ve3m4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 13:52:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E89F100039;
 Fri,  8 Nov 2019 13:52:49 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EB8A2B6A0F;
 Fri,  8 Nov 2019 13:52:49 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 13:52:49 +0100
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 13:52:48
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>, <lionel.debieve@st.com>
Date: Fri, 8 Nov 2019 13:52:43 +0100
Message-ID: <20191108125244.23001-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20191108125244.23001-1-benjamin.gaignard@st.com>
References: <20191108125244.23001-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_03:2019-11-08,2019-11-08 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: crypto: Convert stm32 CRYP
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

Convert the STM32 CRYP binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/crypto/st,stm32-cryp.txt   | 19 --------
 .../devicetree/bindings/crypto/st,stm32-cryp.yaml  | 51 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-cryp.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.txt b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.txt
deleted file mode 100644
index 970487fa40b8..000000000000
--- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* STMicroelectronics STM32 CRYP
-
-Required properties:
-- compatible: Should be "st,stm32f756-cryp".
-- reg: The address and length of the peripheral registers space
-- clocks: The input clock of the CRYP instance
-- interrupts: The CRYP interrupt
-
-Optional properties:
-- resets: The input reset of the CRYP instance
-
-Example:
-crypto@50060000 {
-	compatible = "st,stm32f756-cryp";
-	reg = <0x50060000 0x400>;
-	interrupts = <79>;
-	clocks = <&rcc 0 STM32F7_AHB2_CLOCK(CRYP)>;
-	resets = <&rcc STM32F7_AHB2_RESET(CRYP)>;
-};
diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
new file mode 100644
index 000000000000..a4574552502a
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/st,stm32-cryp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CRYP bindings
+
+maintainers:
+  - Lionel Debieve <lionel.debieve@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32f756-cryp
+      - st,stm32mp1-cryp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    cryp@54001000 {
+      compatible = "st,stm32mp1-cryp";
+      reg = <0x54001000 0x400>;
+      interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&rcc CRYP1>;
+      resets = <&rcc CRYP1_R>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
