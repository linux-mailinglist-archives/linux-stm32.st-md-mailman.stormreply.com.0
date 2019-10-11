Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E97D40A5
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 15:10:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 907C7C36B0C;
	Fri, 11 Oct 2019 13:10:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF6AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 13:10:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BD1KxH020165; Fri, 11 Oct 2019 15:10:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=emcJkbiLu3r2aJUJMXuk+JlPciuPhdB5hKbfL02U1Nw=;
 b=f5el+5Dnm2ccge2r0zqzQrevdggKEtx0JSrlGaI42QWQFiPxJMOZb+mqARdTA8Ut8ynW
 IijfneV6zar49/RLjzvLQSzKR4rvYDbKs7vWnU0CBbBMTlRVsPd7G9lZfj6EpyM8HIYd
 Ihl179sBI7mLxs+9mZpkBRJU2LN5OE8QLZrI8kPCjovO86/xSVoegwmf74tdmX+jrGM4
 968JERZuYCRubMIczhNYzyQTt2lJg/JH4od0ccGvcr3FebH9MFnjyiSCcedwBNGbiXQZ
 1EDW84PN7djfoiUwmz9jUh3msBCwbdyjRQTDOH6mwWbbYzGOHyzNw6x/8//srDjdY3z1 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn19yt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 15:10:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7381100034;
 Fri, 11 Oct 2019 15:10:22 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CAB12BEC48;
 Fri, 11 Oct 2019 15:10:22 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:10:22 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct 2019 15:10:21
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Fri, 11 Oct 2019 15:10:18 +0200
Message-ID: <20191011131018.24035-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: hwlock: Convert stm32
	hwspinlock bindings to json-schema
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

Convert the STM32 hwspinlock binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
change in v2:
- use BSD-2-Clause license
- use const for #hwlock-cells
- add additionalProperties: false

 .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 ----------
 .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 50 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
deleted file mode 100644
index adf4f000ea3d..000000000000
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-STM32 Hardware Spinlock Device Binding
--------------------------------------
-
-Required properties :
-- compatible : should be "st,stm32-hwspinlock".
-- reg : the register address of hwspinlock.
-- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
-	hwlock, so the number of cells should be <1> here.
-- clock-names : Must contain "hsem".
-- clocks : Must contain a phandle entry for the clock in clock-names, see the
-	common clock bindings.
-
-Please look at the generic hwlock binding for usage information for consumers,
-"Documentation/devicetree/bindings/hwlock/hwlock.txt"
-
-Example of hwlock provider:
-	hwspinlock@4c000000 {
-		compatible = "st,stm32-hwspinlock";
-		#hwlock-cells = <1>;
-		reg = <0x4c000000 0x400>;
-		clocks = <&rcc HSEM>;
-		clock-names = "hsem";
-	};
diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
new file mode 100644
index 000000000000..da4722bb8c38
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/st,stm32-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Hardware Spinlock bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+  - Fabien Dessenne <fabien.dessenne@st.com>
+
+properties:
+  "#hwlock-cells":
+    const: 1
+
+  compatible:
+    const: st,stm32-hwspinlock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: hsem
+
+required:
+  - "#hwlock-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    hwspinlock@4c000000 {
+        compatible = "st,stm32-hwspinlock";
+        #hwlock-cells = <1>;
+        reg = <0x4c000000 0x400>;
+        clocks = <&rcc HSEM>;
+        clock-names = "hsem";
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
