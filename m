Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D641954AF6
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 15:22:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013ACC712A1;
	Fri, 16 Aug 2024 13:22:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B1AC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 13:22:44 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GB3NO3012880;
 Fri, 16 Aug 2024 15:22:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 wSK3k5PikKH9JfovTMYikLFrCprcR7fiaiwNM15sijg=; b=Up7Pp9aroA3nPXnp
 P8jiTH1+Tz07UXL0qRm9EiYUwIy4TGgONDZ5srP/uoIxON3cg9r1RRbOfwGddMcS
 Qj7lU4K4QfQIBsniS4xapdh3eDRMEaQzlNJfdCTBy5VZ3QRKV4DCcPPP4GFcM3Kx
 NEOaYqMh0ezyOixQfPxFtxSMQ3glJIR/hTpcvtztM8WVf3Jt3Kcem4ky3IvzoZDc
 mXCWjU2z2FtxltQWAWY0TxXLW0V/i2KvizWeATRi8vSmYxcTO7FvKYHGwLUdOSN3
 fGDB+Z1I2VrkeGwBU/IAUvu4eYS6Yhh6E92Cn7vTttKJLgtppuXPUljkzNbTtJQV
 HxiIVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 410y2472rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2024 15:22:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id ED7BF4002D;
 Fri, 16 Aug 2024 15:22:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30ACC24D96E;
 Fri, 16 Aug 2024 15:21:33 +0200 (CEST)
Received: from localhost (10.129.178.198) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 16 Aug
 2024 15:21:32 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>
Date: Fri, 16 Aug 2024 15:20:54 +0200
Message-ID: <20240816132058.920870-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816132058.920870-1-christian.bruel@foss.st.com>
References: <20240816132058.920870-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.198]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_05,2024-08-16_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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

Document the bindings for STM32 COMBOPHY interface, used to support
the PCIe and USB3 stm32mp25 drivers.
Following entries can be used to tune caracterisation parameters
 - st,output-micro-ohms and st,output-vswing-microvolt bindings entries
to tune the impedance and voltage swing using discrete simulation results
 - st,rx-equalizer register to set the internal rx equalizer filter value.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 .../bindings/phy/st,stm32-combophy.yaml       | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml

diff --git a/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
new file mode 100644
index 000000000000..c33a843b83a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,stm32-combophy.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/st,stm32-combophy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP25 USB3/PCIe COMBOPHY
+
+maintainers:
+  - Christian Bruel <christian.bruel@foss.st.com>
+
+description:
+  Single lane PHY shared (exclusive) between the USB3 and PCIe controllers.
+  Supports 5Gbit/s for USB3 and PCIe gen2 or 2.5Gbit/s for PCIe gen1.
+
+properties:
+  compatible:
+    const: st,stm32mp25-combophy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description: |
+      The cells contain the following arguments.
+
+      - description: The PHY type
+          enum:
+            - PHY_TYPE_USB3
+            - PHY_TYPE_PCIE
+
+  clocks:
+    minItems: 2
+    items:
+      - description: apb Bus clock mandatory to access registers.
+      - description: ker Internal RCC reference clock for USB3 or PCIe
+      - description: pad Optional on board clock input for PCIe only. Typically an
+                     external 100Mhz oscillator wired on dedicated CLKIN pad. Used as reference
+                     clock input instead of the ker
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: apb
+      - const: ker
+      - const: pad
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: phy
+
+  power-domains:
+    maxItems: 1
+
+  wakeup-source: true
+
+  interrupts:
+    maxItems: 1
+    description: interrupt used for wakeup
+
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the SYSCON entry required for configuring PCIe
+      or USB3.
+
+  st,ssc-on:
+    type: boolean
+    description:
+      A boolean property whose presence indicates that the SSC for common clock
+      needs to be set.
+
+  st,rx-equalizer:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 2
+    description:
+      A 3 bit value to tune the RX fixed equalizer setting for optimal eye compliance
+
+  st,output-micro-ohms:
+    minimum: 3999000
+    maximum: 6090000
+    default: 4968000
+    description:
+      A value property to tune the Single Ended Output Impedance, simulations results
+      at 25C for a VDDP=0.8V. The hardware accepts discrete values in this range.
+
+  st,output-vswing-microvolt:
+    minimum: 442000
+    maximum: 803000
+    default: 803000
+    description:
+      A value property in microvolt to tune the Single Ended Output Voltage Swing to change the
+      Vlo, Vhi for a VDDP = 0.8V. The hardware accepts discrete values in this range.
+
+required:
+  - compatible
+  - reg
+  - st,syscfg
+  - '#phy-cells'
+  - resets
+  - reset-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      required:
+        - wakeup-source
+    then:
+      anyOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    combophy: phy@480c0000 {
+        compatible = "st,stm32mp25-combophy";
+        reg = <0x480c0000 0x1000>;
+        #phy-cells = <1>;
+        clocks = <&rcc CK_BUS_USB3PCIEPHY>, <&rcc CK_KER_USB3PCIEPHY>;
+        clock-names = "apb", "ker";
+        resets = <&rcc USB3PCIEPHY_R>;
+        reset-names = "phy";
+        st,syscfg = <&syscfg>;
+        access-controllers = <&rifsc 67>;
+        power-domains = <&CLUSTER_PD>;
+        wakeup-source;
+        interrupts-extended = <&exti1 45 IRQ_TYPE_EDGE_FALLING>;
+    };
+...
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
