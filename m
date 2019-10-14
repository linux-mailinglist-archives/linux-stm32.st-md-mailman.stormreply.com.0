Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27600D5EA4
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Oct 2019 11:22:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E35E9C36B0B;
	Mon, 14 Oct 2019 09:22:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE91C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 09:22:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E9AxtX005158; Mon, 14 Oct 2019 11:22:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+UdmFryc7CqLY9wR1in6JPCFjzpSqhmUkouJfW3L6Tc=;
 b=B0IQWFkN09Qp9sLv2p8XbH4n/Z3MiF4vRyzUS1kjQaFoKyO5WhRB3hTs0hyG6ykISRF1
 d28rasJuSu7mUC3pNU7NenEv3i+uFjUApdi0okgZuiuBLeCwSbgRxEJr+ogwevrXka0o
 YAHcyzylkfp0f5Rt1oj/MwKmf0asJD46tkuvOQb9A9NEF6PxdDdbsdr+pgS+5b7d/2jb
 xLcpLS3MV57MIwKu5K/kzufDTIoRh4crgq764XdSvJHgVgKL/pipMJr59dP+Rmf1OUzi
 Tkj17XJBotfocHrM/2qOcn6aRX5tJktI4fJk4YK8mmK2vFGH18HcpwOa1DC4J5UsmjGy xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk5qj1ck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 11:22:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FCA9100034;
 Mon, 14 Oct 2019 11:22:03 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21C752B8C63;
 Mon, 14 Oct 2019 11:22:03 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 11:22:03 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 11:22:02
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rui.zhang@intel.com>, <edubezval@gmail.com>, <daniel.lezcano@linaro.org>, 
 <amit.kucheria@verdurent.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <alexandre.torgue@st.com>
Date: Mon, 14 Oct 2019 11:22:00 +0200
Message-ID: <20191014092200.24179-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] dt-bindings: thermal: Convert stm32
	thermal bindings to json-schema
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

Convert the STM32 thermal binding to DT schema format using json-schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
changes in v3:
- use (GPL-2.0-only OR BSD-2-Clause) license
- fix indentation
- add additionalProperties: false
- add #thermal-sensor-cells property 

 .../bindings/thermal/st,stm32-thermal.yaml         | 79 ++++++++++++++++++++++
 .../devicetree/bindings/thermal/stm32-thermal.txt  | 61 -----------------
 2 files changed, 79 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/stm32-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
new file mode 100644
index 000000000000..c0f59c56003d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/st,stm32-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 digital thermal sensor (DTS) binding
+
+maintainers:
+  - David Hernandez Sanchez <david.hernandezsanchez@st.com>
+
+properties:
+  compatible:
+    const: st,stm32-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: pclk
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - "#thermal-sensor-cells"
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
+    dts: thermal@50028000 {
+        compatible = "st,stm32-thermal";
+        reg = <0x50028000 0x100>;
+        clocks = <&rcc TMPSENS>;
+        clock-names = "pclk";
+        #thermal-sensor-cells = <0>;
+        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    thermal-zones {
+        cpu_thermal: cpu-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <0>;
+
+            thermal-sensors = <&dts>;
+            trips {
+                cpu_alert1: cpu-alert1 {
+                    temperature = <85000>;
+                    hysteresis = <0>;
+                    type = "passive";
+                };
+
+                cpu_crit: cpu-crit {
+                    temperature = <120000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
+
+            cooling-maps {
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/thermal/stm32-thermal.txt b/Documentation/devicetree/bindings/thermal/stm32-thermal.txt
deleted file mode 100644
index 8c0d5a4d8031..000000000000
--- a/Documentation/devicetree/bindings/thermal/stm32-thermal.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-Binding for Thermal Sensor for STMicroelectronics STM32 series of SoCs.
-
-On STM32 SoCs, the Digital Temperature Sensor (DTS) is in charge of managing an
-analog block which delivers a frequency depending on the internal SoC's
-temperature. By using a reference frequency, DTS is able to provide a sample
-number which can be translated into a temperature by the user.
-
-DTS provides interrupt notification mechanism by threshold. This mechanism
-offers two temperature trip points: passive and critical. The first is intended
-for passive cooling notification while the second is used for over-temperature
-reset.
-
-Required parameters:
--------------------
-
-compatible: 	Should be "st,stm32-thermal"
-reg: 		This should be the physical base address and length of the
-		sensor's registers.
-clocks: 	Phandle of the clock used by the thermal sensor.
-		  See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-clock-names: 	Should be "pclk" for register access clock and reference clock.
-		  See: Documentation/devicetree/bindings/resource-names.txt
-#thermal-sensor-cells: Should be 0. See ./thermal.txt for a description.
-interrupts:	Standard way to define interrupt number.
-
-Example:
-
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
-			thermal-sensors = <&thermal>;
-
-			trips {
-				cpu_alert1: cpu-alert1 {
-					temperature = <85000>;
-					hysteresis = <0>;
-					type = "passive";
-				};
-
-				cpu-crit: cpu-crit {
-					temperature = <120000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-			};
-		};
-	};
-
-	thermal: thermal@50028000 {
-		compatible = "st,stm32-thermal";
-		reg = <0x50028000 0x100>;
-		clocks = <&rcc TMPSENS>;
-		clock-names = "pclk";
-		#thermal-sensor-cells = <0>;
-		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-	};
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
