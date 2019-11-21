Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A322F104E3D
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 09:43:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65AC4C36B0B;
	Thu, 21 Nov 2019 08:43:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F54FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 08:43:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL8ggaE025989; Thu, 21 Nov 2019 09:43:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=GwWBHQ9N4yig6Dd7KbgCOG6gB1C+OQALGmmDk+pmewM=;
 b=BuQcLUSpXyNlazcUbw/2qq1STEtvc9EVxz3578cIOrRiF7FaZNl22wur2C0JSlbMs++k
 rUacF6+CS6E+wgGwiE4IMuUj4dWlGh5oWbNlf2XZ0AjPW7N/g8IPE7kUuH7wL7kE2hv9
 c1s6MsW+gL3BZ5nmp9wspcig3wx1n31U8GjTw+fv/G/+qTt51Z23tndGIwrgBsboyh88
 hJXutr759jifbXnE1kw0jDYwBOI+GGaZcY7UJhFREHwzj9NSBrVvU2UWFTAfIfwRhPD9
 1/UYGw47HZJOZg42z+1H7KJQzwjCVP8c4V6hZ4pmxFi4LtSOI6QWqn5RlnQqKB7/5USp 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9uvjg7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 09:43:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD8B100038;
 Thu, 21 Nov 2019 09:43:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2A4F2B05DD;
 Thu, 21 Nov 2019 09:43:20 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 09:43:20
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Thu, 21 Nov 2019 09:43:16 +0100
Message-ID: <20191121084316.13839-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_01:2019-11-20,2019-11-21 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] dt-bindings: watchdog: Convert stm32
	watchdog bindings to json-schema
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

Convert the STM32 watchdog binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in version 2:
- remove trailer space
- add Christophe in the maintainers list
  
 .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------
 .../bindings/watchdog/st,stm32-iwdg.yaml           | 55 ++++++++++++++++++++++
 2 files changed, 55 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
deleted file mode 100644
index d8f4430b0a13..000000000000
--- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-STM32 Independent WatchDoG (IWDG)
----------------------------------
-
-Required properties:
-- compatible: Should be either:
-  - "st,stm32-iwdg"
-  - "st,stm32mp1-iwdg"
-- reg: Physical base address and length of the registers set for the device
-- clocks: Reference to the clock entry lsi. Additional pclk clock entry
-  is required only for st,stm32mp1-iwdg.
-- clock-names: Name of the clocks used.
-  "lsi" for st,stm32-iwdg
-  "lsi", "pclk" for st,stm32mp1-iwdg
-
-Optional Properties:
-- timeout-sec: Watchdog timeout value in seconds.
-
-Example:
-
-iwdg: watchdog@40003000 {
-	compatible = "st,stm32-iwdg";
-	reg = <0x40003000 0x400>;
-	clocks = <&clk_lsi>;
-	clock-names = "lsi";
-	timeout-sec = <32>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
new file mode 100644
index 000000000000..975b697930a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
+
+maintainers:
+  - Yannick Fertre <yannick.fertre@st.com>
+  - Christophe Roullier <christophe.roullier@st.com>
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - st,stm32-iwdg
+      - st,stm32mp1-iwdg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Low speed clock
+      - description: Optional peripheral clock
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      enums: [ lsi, pclk ]
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    watchdog@5a002000 {
+      compatible = "st,stm32mp1-iwdg";
+      reg = <0x5a002000 0x400>;
+      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+      clock-names = "pclk", "lsi";
+      timeout-sec = <32>;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
