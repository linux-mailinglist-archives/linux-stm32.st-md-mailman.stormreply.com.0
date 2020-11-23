Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A02C112A
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 18:01:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01879C56631;
	Mon, 23 Nov 2020 17:01:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0E5FC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 17:01:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ANGwQCA011899; Mon, 23 Nov 2020 18:01:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=dG1tpxHhRJSdwPiI2DQtRyVQF0gjpmujYixEbX4KxaE=;
 b=xyKx4pM5G4m2ojPJBRiG/BTR139O3+gg32YGdd71ski1ZBB0EHPSUadv0eqV8EDc4mvf
 5lXDfXDqu3BrKN6urWZBzbHxHzNcEYB+qSH+HVU0HY6+zoxMLucEBl2vE4a3BxjbCi9r
 MabUmYNXcCgOeCMxZeg482/MFg9Zup9ZR/jDVRQaz1S2vRZL8ZuV1YBsEBZi368d61/G
 sWbE7BSIw2wa+XteQBxOVuHs/Soz+c+FAyIrkb8ltBcxSdJsxA5JsX39XiTHct0qN+Ao
 SlbJkvp6ee1sRkXA9Ay5vcE/u5+c3vkSpsujSBRLYEcTgg+fClwvbh0/FqLzwmB1dUzN QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgkmks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 18:01:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5703100039;
 Mon, 23 Nov 2020 18:01:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B11E62BA2D8;
 Mon, 23 Nov 2020 18:01:36 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 18:01:36
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 23 Nov 2020 18:01:27 +0100
Message-ID: <20201123170132.17859-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123170132.17859-1-amelie.delaunay@st.com>
References: <20201123170132.17859-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_14:2020-11-23,
 2020-11-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/6] dt-bindings: phy: phy-stm32-usbphyc: move
	PLL supplies to parent node
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

PLL block requires to be powered with 1v1 and 1v8 supplies to catch ENABLE
signal.
Currently, supplies are managed through phy_ops .power_on/off, and PLL
activation/deactivation is managed through phy_ops .init/exit.
The sequence of phy_ops .power_on/.phy_init, .power_off/.exit is USB
drivers dependent.
To ensure a good behavior of the PLL, supplies have to be managed at PLL
activation/deactivation. That means the supplies need to be put in usbphyc
parent node and not in phy children nodes.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
Note that even with bindings change, it doesn't break the backward
compatibility: old device trees are still compatible, USB is still
functional. Device trees will be updated with this new bindings
when approved.
---
 .../bindings/phy/phy-stm32-usbphyc.yaml       | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 0ba61979b970..46df6786727a 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -45,6 +45,12 @@ properties:
   "#size-cells":
     const: 0
 
+  vdda1v1-supply:
+    description: regulator providing 1V1 power supply to the PLL block
+
+  vdda1v8-supply:
+    description: regulator providing 1V8 power supply to the PLL block
+
 #Required child nodes:
 
 patternProperties:
@@ -61,12 +67,6 @@ patternProperties:
       phy-supply:
         description: regulator providing 3V3 power supply to the PHY.
 
-      vdda1v1-supply:
-        description: regulator providing 1V1 power supply to the PLL block
-
-      vdda1v8-supply:
-        description: regulator providing 1V8 power supply to the PLL block
-
       "#phy-cells":
         enum: [ 0x0, 0x1 ]
 
@@ -90,8 +90,6 @@ patternProperties:
     required:
       - reg
       - phy-supply
-      - vdda1v1-supply
-      - vdda1v8-supply
       - "#phy-cells"
 
     additionalProperties: false
@@ -102,6 +100,8 @@ required:
   - clocks
   - "#address-cells"
   - "#size-cells"
+  - vdda1v1-supply
+  - vdda1v8-supply
   - usb-phy@0
   - usb-phy@1
 
@@ -116,22 +116,20 @@ examples:
         reg = <0x5a006000 0x1000>;
         clocks = <&rcc USBPHY_K>;
         resets = <&rcc USBPHY_R>;
+        vdda1v1-supply = <&reg11>;
+        vdda1v8-supply = <&reg18>;
         #address-cells = <1>;
         #size-cells = <0>;
 
         usbphyc_port0: usb-phy@0 {
             reg = <0>;
             phy-supply = <&vdd_usb>;
-            vdda1v1-supply = <&reg11>;
-            vdda1v8-supply = <&reg18>;
             #phy-cells = <0>;
         };
 
         usbphyc_port1: usb-phy@1 {
             reg = <1>;
             phy-supply = <&vdd_usb>;
-            vdda1v1-supply = <&reg11>;
-            vdda1v8-supply = <&reg18>;
             #phy-cells = <1>;
         };
     };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
