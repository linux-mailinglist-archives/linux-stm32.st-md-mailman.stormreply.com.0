Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 411B7104FAB
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 10:53:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09BDCC36B0B;
	Thu, 21 Nov 2019 09:53:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85F72C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 09:53:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL9lSHh027654; Thu, 21 Nov 2019 10:53:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WbtwwDT3nWx9hLJ3/dJjwMMjxpPXL7VD+gsWmcpdC3o=;
 b=u65R19szElJQq90oIOlasfp8pyb/ecYhA3tO1KIU2If2FEjhqsexava9kMOAzzmRIGpx
 OAn1Uq0JKDpBlhx5Y5vY6aArNkQS7IK/DtIvA0Qx7a4uQJoB25g2MOGH8Lcq8sfA/7M0
 guW8TEEmQ8ZkTbyR2P3Glz4mXq9GTb9w0ALH5recdW8FjkZu+MDBGFmlJNHSoFZfCfHh
 2orZHscb7Y7EcfJmzx+mu1tZbEXUI02T8kLx+grudI5jZAQ5L8XXqsMlJZ2AmVAy37sR
 d7Tt98kcMSFbO/FF8gFHr+bCz6IT4cm2G30KVOI2MNpJLT5H7l8Zc5sUFmHd1bfLm4nR 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9ujagqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 10:53:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BF3E100039;
 Thu, 21 Nov 2019 10:52:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C1C92B05D9;
 Thu, 21 Nov 2019 10:52:58 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov 2019 10:52:57
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu, 21 Nov 2019 10:52:25 +0100
Message-ID: <20191121095225.26775-1-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_01:2019-11-21,2019-11-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: remoteproc: convert
	stm32-rproc to json-schema
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

Convert the STM32 remoteproc bindings to DT schema format using
json-schema

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 131 ++++++++++++++++++
 .../bindings/remoteproc/stm32-rproc.txt       |  63 ---------
 2 files changed, 131 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
new file mode 100644
index 000000000000..13c2d06c2e0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: STMicroelectronics STM32 remote processor controller bindings
+
+description:
+  This document defines the binding for the remoteproc component that loads and
+  boots firmwares on the ST32MP family chipset.
+
+maintainers:
+  - Fabien Dessenne <fabien.dessenne@st.com>
+  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+
+
+allOf:
+  - $ref: /schemas/mbox/mbox-consumer.yaml#
+
+properties:
+  compatible:
+    const: st,stm32mp1-m4
+
+  reg:
+    description:
+      Address ranges of the RETRAM and MCU SRAM memories used by the remote
+      processor.
+    maxItems: 3
+
+  resets:
+     maxItems: 1
+
+  st,syscfg-holdboot:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: remote processor reset hold boot
+      - Phandle of syscon block.
+      - The offset of the hold boot setting register.
+      - The field mask of the hold boot.
+    maxItems: 1
+
+  st,syscfg-tz:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Reference to the system configuration which holds the RCC trust zone mode
+      - Phandle of syscon block.
+      - The offset of the RCC trust zone mode register.
+      - The field mask of the RCC trust zone mode.
+    maxItems: 1
+
+  interrupts:
+    description: Should contain the WWDG1 watchdog reset interrupt
+    maxItems: 1
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+    items:
+      - description: |
+          A channel (a) used to communicate through virtqueues with the
+          remote proc.
+          Bi-directional channel:
+            - from local to remote = send message
+            - from remote to local = send message ack
+      - description: |
+          A channel (b) working the opposite direction of channel (a)
+      - description: |
+          A channel (c) used by the local proc to notify the remote proc that it
+          is about to be shut down.
+          Unidirectional channel:
+            - from local to remote, where ACK from the remote means that it is
+              ready for shutdown
+    maxItems: 3
+
+  mbox-names:
+    items:
+      - const: vq0
+      - const: vq1
+      - const: shutdown
+    minItems: 1
+    maxItems: 3
+
+  memory-region:
+    description:
+      List of phandles to the reserved memory regions associated with the
+      remoteproc device. This is variable and describes the memories shared with
+      the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
+      vrings, ...).
+      (see ../reserved-memory/reserved-memory.txt)
+
+  st,syscfg-pdds:
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the system configuration which holds the remote
+        1st cell: phandle to syscon block
+        2nd cell: register offset containing the deep sleep setting
+        3rd cell: register bitmask for the deep sleep bit
+    maxItems: 1
+
+  st,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If defined, when remoteproc is probed, it loads the default firmware and
+      starts the remote processor.
+
+required:
+  - compatible
+  - reg
+  - resets
+  - st,syscfg-holdboot
+  - st,syscfg-tz
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/stm32mp1-resets.h>
+    m4_rproc: m4@10000000 {
+      compatible = "st,stm32mp1-m4";
+      reg = <0x10000000 0x40000>,
+            <0x30000000 0x40000>,
+            <0x38000000 0x10000>;
+      resets = <&rcc MCU_R>;
+      st,syscfg-holdboot = <&rcc 0x10C 0x1>;
+      st,syscfg-tz = <&rcc 0x000 0x1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
deleted file mode 100644
index 5fa915a4b736..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-STMicroelectronics STM32 Remoteproc
------------------------------------
-This document defines the binding for the remoteproc component that loads and
-boots firmwares on the ST32MP family chipset.
-
-Required properties:
-- compatible:	Must be "st,stm32mp1-m4"
-- reg:		Address ranges of the RETRAM and MCU SRAM memories used by the
-		remote processor.
-- resets:	Reference to a reset controller asserting the remote processor.
-- st,syscfg-holdboot: Reference to the system configuration which holds the
-		remote processor reset hold boot
-	1st cell: phandle of syscon block
-	2nd cell: register offset containing the hold boot setting
-	3rd cell: register bitmask for the hold boot field
-- st,syscfg-tz: Reference to the system configuration which holds the RCC trust
-		zone mode
-	1st cell: phandle to syscon block
-	2nd cell: register offset containing the RCC trust zone mode setting
-	3rd cell: register bitmask for the RCC trust zone mode bit
-
-Optional properties:
-- interrupts:	Should contain the watchdog interrupt
-- mboxes:	This property is required only if the rpmsg/virtio functionality
-		is used. List of phandle and mailbox channel specifiers:
-		- a channel (a) used to communicate through virtqueues with the
-		  remote proc.
-		  Bi-directional channel:
-		      - from local to remote = send message
-		      - from remote to local = send message ack
-		- a channel (b) working the opposite direction of channel (a)
-		- a channel (c) used by the local proc to notify the remote proc
-		  that it is about to be shut down.
-		  Unidirectional channel:
-		      - from local to remote, where ACK from the remote means
-		        that it is ready for shutdown
-- mbox-names:	This property is required if the mboxes property is used.
-		- must be "vq0" for channel (a)
-		- must be "vq1" for channel (b)
-		- must be "shutdown" for channel (c)
-- memory-region: List of phandles to the reserved memory regions associated with
-		the remoteproc device. This is variable and describes the
-		memories shared with the remote processor (eg: remoteproc
-		firmware and carveouts, rpmsg vrings, ...).
-		(see ../reserved-memory/reserved-memory.txt)
-- st,syscfg-pdds: Reference to the system configuration which holds the remote
-		processor deep sleep setting
-	1st cell: phandle to syscon block
-	2nd cell: register offset containing the deep sleep setting
-	3rd cell: register bitmask for the deep sleep bit
-- st,auto-boot:	If defined, when remoteproc is probed, it loads the default
-		firmware and starts the remote processor.
-
-Example:
-	m4_rproc: m4@10000000 {
-		compatible = "st,stm32mp1-m4";
-		reg = <0x10000000 0x40000>,
-		      <0x30000000 0x40000>,
-		      <0x38000000 0x10000>;
-		resets = <&rcc MCU_R>;
-		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
-		st,syscfg-tz = <&rcc 0x000 0x1>;
-	};
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
