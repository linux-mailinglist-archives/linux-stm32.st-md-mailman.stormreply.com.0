Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C73707B0468
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 14:40:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86EF4C6A60C;
	Wed, 27 Sep 2023 12:40:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC4A6C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:40:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RArI9p025344; Wed, 27 Sep 2023 14:40:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=SgomDZ4n8rij0Ku1C1HWR5BqnMLcC05vUVKWOJcNk4M=; b=s2
 Eew1PFCSEHeOy3wDJIwE+Bs8Oi9RFMdqkoXLDLlMsdYKfAUDBK1Bx+ydR/1O/gsy
 Qvidxx+bHfR/B1lxXn74HY6ZB/wnZJaCHy0WxbmyXaBUaggkDNPa+auC3QHz5c04
 FXd6V7InX2RSDWBzuH/6b2XoV4sHbkzu0gwF92KnqsRzUUtzBaBug434eqAtrm3X
 f0f0Pb3uxIz3R2vm3wMWISF/T9GGiOXkv1FVyhvjHkQukAg21jeD8MWyqSoSjGR2
 pSZXMv9WNWAMjxzmXm5PdSFxkmNVVCXU1n9UfhX+kdeeFCEu710cKHHfCn47wA/I
 lLh1yZZUa/tKGJ4Fxl8w==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9n54jd4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 14:40:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D0B810005A;
 Wed, 27 Sep 2023 14:40:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0159F23C6A5;
 Wed, 27 Sep 2023 14:40:36 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 14:40:35 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 27 Sep 2023 14:38:30 +0200
Message-ID: <20230927123842.944025-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927123842.944025-1-alain.volmat@foss.st.com>
References: <20230927123842.944025-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_06,2023-09-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 1/5] dt-bindings: media: add bindings for
	stm32 dcmipp
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

Add the yaml binding for the ST Microelectronics STM32 DCMIPP
(Digital Camera Memory Interface Pixel Processor)

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/st,stm32-dcmipp.yaml       | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
new file mode 100644
index 000000000000..87731f3ce7bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32-dcmipp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 DCMIPP Digital Camera Memory Interface Pixel Processor
+
+maintainers:
+  - Hugues Fruchet <hugues.fruchet@foss.st.com>
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+properties:
+  compatible:
+    const: st,stm32mp13-dcmipp
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
+  resets:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      DCMIPP supports a single port node with parallel bus.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            enum: [5, 6]
+            default: 5
+
+          bus-width:
+            enum: [8, 10, 12, 14]
+            default: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - pclk-sample
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/stm32mp13-clks.h>
+    #include <dt-bindings/reset/stm32mp13-resets.h>
+    dcmipp@5a000000 {
+        compatible = "st,stm32mp13-dcmipp";
+        reg = <0x5a000000 0x400>;
+        interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rcc DCMIPP_R>;
+        clocks = <&rcc DCMIPP_K>;
+
+        port {
+             endpoint {
+                   remote-endpoint = <&mipid02_2>;
+                   bus-width = <8>;
+                   hsync-active = <0>;
+                   vsync-active = <0>;
+                   pclk-sample = <0>;
+             };
+        };
+    };
+
+...
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
