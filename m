Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D99BC757
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 08:52:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB63C7801A;
	Tue,  5 Nov 2024 07:52:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4E5C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 07:52:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A52iEOw028085;
 Tue, 5 Nov 2024 08:51:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7Nnxla3UOXbGveUOQ2wYAl4yXcze3QodV3rJ6QQi4dk=; b=sv76dPRE3yuQSR//
 YJq+3qrrc+RITjDfS7CXlVj0Kzlj1WF0Z6kRg4OwMDHJ4vSbqih2zXewxPoGZ6wy
 0izqYwxQ344vo/5D7UaFWFTQ+klpzZpX+R9mJ8THOYg1xKBN0z8Sqd0dSyIO/pht
 PF+p/NZOeGXRHF8ikj84drHLuin0XIXMgqa4eOeIiBlQ7W7mfEg39/sWtcngC19z
 h7gdQYJ8gaS2dkfIuFGftPLfK8pcXMEISTpUfoabNoap2qo8wz3Fibr7cRYhCFH2
 Uu7n6YucKV3pIiUV2/yotBtWdXFUITxFUeWFdbg1+WD/IOwFfUN9mD83YeMmg/sj
 69/i7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nd00jdff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 08:51:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 66F894002D;
 Tue,  5 Nov 2024 08:50:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB02924FE55;
 Tue,  5 Nov 2024 08:49:29 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:05 +0100
MIME-Version: 1.0
Message-ID: <20241105-csi_dcmipp_mp25-v2-2-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 02/15] dt-bindings: media: add description
	of stm32 csi
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

Add the stm32 csi controller description.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2:
  - rename into st,stm32mp25-csi.yaml to match compatible
  - correct port / data-lanes (remove useless lines &
    use data-lanes 1 and 2 instead of 0 and 1)
  - correct commit log
---
 .../bindings/media/st,stm32mp25-csi.yaml           | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..33bedfe419244e12dbb98b358821bbc39ea6facf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/st,stm32mp25-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 CSI controller
+
+description:
+  The STM32 CSI controller allows connecting a CSI based
+  camera to the DCMIPP camera pipeline.
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp25-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: txesc
+      - const: csi2phy
+
+  resets:
+    maxItems: 1
+
+  vdd-supply:
+    description: Digital core power supply (0.91V)
+
+  vdda18-supply:
+    description: System analog power supply (1.8V)
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+    csi@48020000 {
+        compatible = "st,stm32mp25-csi";
+        reg = <0x48020000 0x2000>;
+        interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rcc CSI_R>;
+        clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>, <&rcc CK_KER_CSIPHY>;
+        clock-names = "pclk", "txesc", "csi2phy";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&imx335_ep>;
+                    data-lanes = <1 2>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dcmipp_0>;
+                };
+            };
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
