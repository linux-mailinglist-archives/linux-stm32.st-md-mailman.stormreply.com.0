Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2717D40B0
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 15:12:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9F46C36B0C;
	Fri, 11 Oct 2019 13:12:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E89AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 13:12:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9BD6HRY025650; Fri, 11 Oct 2019 15:12:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PWduPs3pmXgoDQ3rhQPq+MwH5Bty4MTM7xJsS5IAIeM=;
 b=ejGC399U6Tnz8nmHJ9yJotwtZtlPXZUDPGRyrPGLzyYfIRdlGjCTsGimeyuXs77gDxoJ
 xdtGKejSWEYJnO3R7v2aue1+oP5r2/jPkyI9kAg+PkQB1QnAYthQTYH5uyvfKGTFAtSl
 ypSuaQ/92dVytI8/bJ9EzDWPljmexR+Pg+9agla8XHPMZfKJ4rt8rj8cBAYpdujAyqTe
 pZ2FJH68iPBc1eIJiQ6WZQayre4WZuuyOz13zNHW1AR5lK9dEmd94eOzLmLKftoqtszi
 jySfOAh//e2UM5L+fvw07VqRHEem7jpswLb2zrhdXKA77uN2NnjoIEKU69ZYDGKGZOH9 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2ptd96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 15:12:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBDFF10002A;
 Fri, 11 Oct 2019 15:12:37 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8EF02BEC5E;
 Fri, 11 Oct 2019 15:12:37 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct
 2019 15:12:37 +0200
Received: from localhost (10.201.20.122) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 11 Oct 2019 15:12:37
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <alexandre.torgue@st.com>, <hverkuil-cisco@xs4all.nl>,
 <hugues.fruchet@st.com>
Date: Fri, 11 Oct 2019 15:12:33 +0200
Message-ID: <20191011131234.24290-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_08:2019-10-10,2019-10-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: media: Convert stm32 cec
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

Convert the STM32 cec binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in v2:
- use BSD-2-Clause license
- add additionalProperties: false
- remove pinctrl-names and pinctrl-[0-9]

 .../devicetree/bindings/media/st,stm32-cec.txt     | 19 --------
 .../devicetree/bindings/media/st,stm32-cec.yaml    | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
deleted file mode 100644
index 6be2381c180d..000000000000
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-STMicroelectronics STM32 CEC driver
-
-Required properties:
- - compatible : value should be "st,stm32-cec"
- - reg : Physical base address of the IP registers and length of memory
-	 mapped region.
- - clocks : from common clock binding: handle to CEC clocks
- - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
- - interrupts : CEC interrupt number to the CPU.
-
-Example for stm32f746:
-
-cec: cec@40006c00 {
-	compatible = "st,stm32-cec";
-	reg = <0x40006C00 0x400>;
-	interrupts = <94>;
-	clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
-	clock-names = "cec", "hdmi-cec";
-};
diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
new file mode 100644
index 000000000000..e3ff7b077ff6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CEC bindings
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+  - Yannick Fertre <yannick.fertre@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-cec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Module Clock
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: cec
+      - const: hdmi-cec
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    cec: cec@40006c00 {
+        compatible = "st,stm32-cec";
+        reg = <0x40006c00 0x400>;
+        interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rcc CEC_K>, <&clk_lse>;
+        clock-names = "cec", "hdmi-cec";
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
