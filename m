Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D8984B3DA
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 12:46:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A010C6B463;
	Tue,  6 Feb 2024 11:46:17 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E350C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 11:46:15 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4168VZdG008417; Tue, 6 Feb 2024 12:45:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=selector1; bh=Gr3Tm1cvgWpp9H76HqmGx1JB+xMWrkmfBLfelp2wWfs
 =; b=60tWZOcjEyqPUeZBS3sxV+0AP7PgbGN2qhIClt0NO/O+xCKssKBEi/HO030
 GUAKLgtH3YmvZzq+687ewq5/ZGEQGRiLeq0AsQhr0+RSPIKcD43rdv0MUz31fFpE
 Di6sgLfGZBnEiosf8hvwrgPjKRiGD1CM+K5ajEAkMXhDQKmNtgZwyy+T9PWJe5hx
 g6DtTzMkpnO6rMTovgis8oUbycJP/zhYXh6hUV/o9mksTSzcimR++DSK7F8oQImE
 +rH8cC6FtwAsZhoLLpp7BnvOQChqsa2y/6k6g/uS9gPEcKAsKRIZvIVNbM0B/N8U
 BC+Q/3U42GozzOYuvXIaTbxtnjQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w21ap0r7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 12:45:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B146210005A;
 Tue,  6 Feb 2024 12:45:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7FE523D408;
 Tue,  6 Feb 2024 12:45:54 +0100 (CET)
Received: from localhost (10.129.178.155) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 6 Feb
 2024 12:45:54 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 6 Feb 2024 12:45:34 +0100
MIME-Version: 1.0
Message-ID: <20240206-lvds-v5-1-bd16797b0f09@foss.st.com>
References: <20240206-lvds-v5-0-bd16797b0f09@foss.st.com>
In-Reply-To: <20240206-lvds-v5-0-bd16797b0f09@foss.st.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
X-Mailer: b4 0.12.4
X-Originating-IP: [10.129.178.155]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_04,2024-01-31_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/3] dt-bindings: display: add STM32 LVDS
	device
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

Add "st,stm32mp25-lvds" compatible.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Depends on: "dt-bindings: stm32: add clocks and reset binding for
	    stm32mp25 platform" by Gabriel Fernandez

Changes in v5:
	- Fixed path in MAINTAINERS

Changes in v4:
	- Align filename to compatible
	- Fix compatible in the example
	- Remove redundant word in the subject

Changes in v3:
	- Clarify commit dependency
	- Fix includes in the example
	- Fix YAML
	- Add "clock-cells" description
	- s/regroups/is composed of/
	- Changed compatible to show SoC specificity

Changes in v2:
	- Switch compatible and clock-cells related areas
	- Remove faulty #include in the example.
	- Add entry in MAINTAINERS
---
 .../bindings/display/st,stm32mp25-lvds.yaml        | 119 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
new file mode 100644
index 000000000000..6736f93256b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/st,stm32mp25-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 LVDS Display Interface Transmitter
+
+maintainers:
+  - Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
+  - Yannick Fertre <yannick.fertre@foss.st.com>
+
+description: |
+  The STMicroelectronics STM32 LVDS Display Interface Transmitter handles the
+  LVDS protocol: it maps the pixels received from the upstream Pixel-DMA (LTDC)
+  onto the LVDS PHY.
+
+  It is composed of three sub blocks:
+    - LVDS host: handles the LVDS protocol (FPD / OpenLDI) and maps its input
+      pixels onto the data lanes of the PHY
+    - LVDS PHY: parallelize the data and drives the LVDS data lanes
+    - LVDS wrapper: handles top-level settings
+
+  The LVDS controller driver supports the following high-level features:
+    - FDP-Link-I and OpenLDI (v0.95) protocols
+    - Single-Link or Dual-Link operation
+    - Single-Display or Double-Display (with the same content duplicated on both)
+    - Flexible Bit-Mapping, including JEIDA and VESA
+    - RGB888 or RGB666 output
+    - Synchronous design, with one input pixel per clock cycle
+
+properties:
+  compatible:
+    const: st,stm32mp25-lvds
+
+  "#clock-cells":
+    const: 0
+    description:
+      Provides the internal LVDS PHY clock to the framework.
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB peripheral clock
+      - description: Reference clock for the internal PLL
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          LVDS input port node, connected to the LTDC RGB output port.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          LVDS output port node, connected to a panel or bridge input port.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
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
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    lvds: lvds@48060000 {
+        compatible = "st,stm32mp25-lvds";
+        reg = <0x48060000 0x2000>;
+        #clock-cells = <0>;
+        clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+        clock-names = "pclk", "ref";
+        resets = <&rcc LVDS_R>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                lvds_in: endpoint {
+                   remote-endpoint = <&ltdc_ep1_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                lvds_out0: endpoint {
+                   remote-endpoint = <&lvds_panel_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 59b3da17debc..225e8ae75eee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7231,6 +7231,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+F:	Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
 F:	drivers/gpu/drm/stm
 
 DRM DRIVERS FOR TI KEYSTONE

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
