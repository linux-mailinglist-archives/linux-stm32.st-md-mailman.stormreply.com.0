Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C73104FA5
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 10:51:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB0FBC36B0B;
	Thu, 21 Nov 2019 09:51:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC7FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 09:51:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL9loLB020234; Thu, 21 Nov 2019 10:51:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vMVqWdMgq7XcfSmbVIKes0Z7/ha4OWc9hvpq/0ZosUY=;
 b=DEcaXk8blgP51AcF+Pf7BM2f17zgZW885nmJLBc1+B/N4GkpHQNuF64fo6l4D1MmgxZb
 lUFtgX4K52DiM3D25p/8d9PgPvbWXfLyk0oa0I2bwOV2bUPs4UTu4C8br1tkU1Erbkp4
 wjnPewiILzwQGc8W4ZIlYy+Wcc3navPadpKxlfSGokP+nLO4k9uGldy+BNxPBz4GxMsl
 QB/lwX81Q12Q8PrWS1TPhnDNt8fVxXi7bwKtwC+RQvef7ydiRm0qcgkW6DeI3uaGwqim
 Q+EoPF5l6cfGqtf0m9OwkDC+T2t5o2PMKJ9UyWnf5I+5MaRNx23NPM+ypUSCMzeq2oAt XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usjgv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 10:51:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C7CF10002A;
 Thu, 21 Nov 2019 10:51:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14AD32B41D3;
 Thu, 21 Nov 2019 10:51:15 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov 2019 10:51:14
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jassi Brar
 <jassisinghbrar@gmail.com>
Date: Thu, 21 Nov 2019 10:51:02 +0100
Message-ID: <20191121095102.26693-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_01:2019-11-21,2019-11-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] dt-bindings: mailbox: convert stm32-ipcc
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

Convert the STM32 IPCC bindings to DT schema format using
json-schema

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/mailbox/st,stm32-ipcc.yaml       | 84 +++++++++++++++++++
 .../bindings/mailbox/stm32-ipcc.txt           | 47 -----------
 2 files changed, 84 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt

diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
new file mode 100644
index 000000000000..5b13d6672996
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: STMicroelectronics STM32 IPC controller bindings
+
+description:
+  The IPCC block provides a non blocking signaling mechanism to post and
+  retrieve messages in an atomic way between two processors.
+  It provides the signaling for N bidirectionnal channels. The number of
+  channels (N) can be read from a dedicated register.
+
+maintainers:
+  - Fabien Dessenne <fabien.dessenne@st.com>
+  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp1-ipcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+     maxItems: 1
+
+  interrupts:
+    items:
+      - description: rx channel occupied
+      - description: tx channel free
+      - description: wakeup source
+    minItems: 2
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: rx
+      - const: tx
+      - const: wakeup
+    minItems: 2
+    maxItems: 3
+
+  wakeup-source: true
+
+  "#mbox-cells":
+    const: 1
+
+  st,proc-id:
+    description: Processor id using the mailbox (0 or 1)
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - st,proc-id
+  - clocks
+  - interrupt-names
+  - "#mbox-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    ipcc: mailbox@4c001000 {
+      compatible = "st,stm32mp1-ipcc";
+      #mbox-cells = <1>;
+      reg = <0x4c001000 0x400>;
+      st,proc-id = <0>;
+      interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
+      		      <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
+      		      <&aiec 62 1>;
+      interrupt-names = "rx", "tx", "wakeup";
+      clocks = <&rcc_clk IPCC>;
+      wakeup-source;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt b/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
deleted file mode 100644
index 1d2b7fee7b85..000000000000
--- a/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* STMicroelectronics STM32 IPCC (Inter-Processor Communication Controller)
-
-The IPCC block provides a non blocking signaling mechanism to post and
-retrieve messages in an atomic way between two processors.
-It provides the signaling for N bidirectionnal channels. The number of channels
-(N) can be read from a dedicated register.
-
-Required properties:
-- compatible:   Must be "st,stm32mp1-ipcc"
-- reg:          Register address range (base address and length)
-- st,proc-id:   Processor id using the mailbox (0 or 1)
-- clocks:       Input clock
-- interrupt-names: List of names for the interrupts described by the interrupt
-                   property. Must contain the following entries:
-                   - "rx"
-                   - "tx"
-                   - "wakeup"
-- interrupts:   Interrupt specifiers for "rx channel occupied", "tx channel
-                free" and "system wakeup".
-- #mbox-cells:  Number of cells required for the mailbox specifier. Must be 1.
-                The data contained in the mbox specifier of the "mboxes"
-                property in the client node is the mailbox channel index.
-
-Optional properties:
-- wakeup-source: Flag to indicate whether this device can wake up the system
-
-
-
-Example:
-	ipcc: mailbox@4c001000 {
-		compatible = "st,stm32mp1-ipcc";
-		#mbox-cells = <1>;
-		reg = <0x4c001000 0x400>;
-		st,proc-id = <0>;
-		interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
-				      <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
-				      <&aiec 62 1>;
-		interrupt-names = "rx", "tx", "wakeup";
-		clocks = <&rcc_clk IPCC>;
-		wakeup-source;
-	}
-
-Client:
-	mbox_test {
-		...
-		mboxes = <&ipcc 0>, <&ipcc 1>;
-	};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
