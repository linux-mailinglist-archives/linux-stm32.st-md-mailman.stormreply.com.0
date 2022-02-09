Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069554AF34D
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Feb 2022 14:53:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3863C5E2CC;
	Wed,  9 Feb 2022 13:53:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67795C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Feb 2022 13:53:11 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219AGhci019376;
 Wed, 9 Feb 2022 14:52:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=zTbBOG3VpWriIQMZnJIyEOLDYHNl10TRR8gRrC2+qE0=;
 b=QUZ8Brfbsc5mhKYfNfDxzxzG32ZEA1SYOoPLoVzGph7jvEDr/vK5cd9TgKqIEsjEhJms
 Kyh2mBfGZIeJomRg6ng19HcKFQ9Oa6iy6kTeNzIiF0S2++gVFYzU/H19bPDrvP0nwVGv
 SZKz2bicI3AZATZ/3qzMRQkIY0bREprAL20MIDnQs4oPvE7BtXSkhksEAta5vL3Up5hg
 hUGsgL3rG+X/t07s/K59lQ+0l13D4XcP4OGfyZ5+YXV663+ZJ1cruZ5UqJ9K3D7PQnNg
 sQ1HzvN5X181b392g4RQupOIqC+4wwS9qYj8Kan9NywBJD/kjP2WKTUS4FuYDxdF5y8+ PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e467w2wvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 14:52:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58E9210002A;
 Wed,  9 Feb 2022 14:52:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CC0B222C95;
 Wed,  9 Feb 2022 14:52:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 9 Feb 2022 14:52:47
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <daniel.lezcano@linaro.org>, <robh+dt@kernel.org>,
 <alexandre.torgue@foss.st.com>
Date: Wed, 9 Feb 2022 14:52:27 +0100
Message-ID: <1644414747-22159-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_07,2022-02-09_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: armv7m-systick: convert
	to dtschema
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

Convert the ARMv7-M system timer bindings to DT schema format.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
---
 .../bindings/timer/arm,armv7m-systick.txt          | 26 -----------
 .../bindings/timer/arm,armv7m-systick.yaml         | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,armv7m-systick.txt
 create mode 100644 Documentation/devicetree/bindings/timer/arm,armv7m-systick.yaml

diff --git a/Documentation/devicetree/bindings/timer/arm,armv7m-systick.txt b/Documentation/devicetree/bindings/timer/arm,armv7m-systick.txt
deleted file mode 100644
index 7cf4a24..00000000
--- a/Documentation/devicetree/bindings/timer/arm,armv7m-systick.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* ARMv7M System Timer
-
-ARMv7-M includes a system timer, known as SysTick. Current driver only
-implements the clocksource feature.
-
-Required properties:
-- compatible	  : Should be "arm,armv7m-systick"
-- reg		  : The address range of the timer
-
-Required clocking property, have to be one of:
-- clocks	  : The input clock of the timer
-- clock-frequency : The rate in HZ in input of the ARM SysTick
-
-Examples:
-
-systick: timer@e000e010 {
-	compatible = "arm,armv7m-systick";
-	reg = <0xe000e010 0x10>;
-	clocks = <&clk_systick>;
-};
-
-systick: timer@e000e010 {
-	compatible = "arm,armv7m-systick";
-	reg = <0xe000e010 0x10>;
-	clock-frequency = <90000000>;
-};
diff --git a/Documentation/devicetree/bindings/timer/arm,armv7m-systick.yaml b/Documentation/devicetree/bindings/timer/arm,armv7m-systick.yaml
new file mode 100644
index 00000000..2bcade5
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/arm,armv7m-systick.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/arm,armv7m-systick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARMv7M System Timer
+
+maintainers:
+  - Alexandre Torgue <alexandre.torgue@foss.st.com>
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+
+description: ARMv7-M includes a system timer, known as SysTick.
+
+properties:
+  compatible:
+    const: arm,armv7m-systick
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency: true
+
+oneOf:
+  - required:
+      - clocks
+  - required:
+      - clock-frequency
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@e000e010 {
+        compatible = "arm,armv7m-systick";
+        reg = <0xe000e010 0x10>;
+        clocks = <&clk_systick>;
+    };
+
+  - |
+    timer@e000e010 {
+        compatible = "arm,armv7m-systick";
+        reg = <0xe000e010 0x10>;
+        clock-frequency = <90000000>;
+    };
+
+...
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
