Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB167366BE
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jun 2023 10:57:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 146ECC6B455;
	Tue, 20 Jun 2023 08:57:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEF74C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jun 2023 08:57:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35K8P91s025129; Tue, 20 Jun 2023 10:57:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BuuKOnOm8Z2Mpwb61kJNl/g5ahSF1GNjc4okmHDiako=;
 b=kbubHx1UunA+l0URDgzF0o9PpjLHDIFohkzMiEddTEKjbZD/bHDmdx8G0eLqhIVmuQVi
 q88N7F8T/gtD/XRTXZIPnFfiIsq5J81pqbV4vgHKmWq0T/l5P54JLWNGBIuVtk/TzW64
 16jhxl8R5jZ5AfdMIX+cVBad1EHBqAc0uIRwnZBcSic35XHEmdBrsrw0WsHU5pT5nLPt
 zCJUn1TvzSs+UNsciTOPZxVl0RO3bV+vEvSegN7XCxiHABihI8s6zj7l8QSdqMRWmvFE
 BVfFOHMxWTepu24+7iHcVVhY23TVCCxSdw2Br3aOwEE1Y5e1+x8UIJ5MDG4FsRnwtdM3 CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rb8k8r83r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jun 2023 10:57:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45D79100071;
 Tue, 20 Jun 2023 10:57:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EA6621A22B;
 Tue, 20 Jun 2023 10:57:13 +0200 (CEST)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 20 Jun
 2023 10:57:12 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>
Date: Tue, 20 Jun 2023 10:56:33 +0200
Message-ID: <20230620085633.533187-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_05,2023-06-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: connector: usb: allow a single
	HS port
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

Allow a single HS port to be used e.g. without reg property and a unit
address. OF graph allows a single port node, without 'reg' property.

This removes a couple of Warnings or errors on STM32MP boards.
When using single HS port currently, when doing building with W=1:
arch/arm/boot/dts/stm32mp157c-dk2.dtb: stusb1600@28: connector:
Unevaluated properties are not allowed ('port' was unexpected)

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Notes: Other attempts seem to lead to a dead end. Ex: by updating the
relevant dts files, to use ports, and port@0, make W=1 shows
...connector/ports: graph node has single child node
'port@0', #address-cells/#size-cells are not necessary.
But not adding them lead to another "Warning (avoid_default_addr_size)"
---
 .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index ae515651fc6b..1c4d3eb87763 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -168,6 +168,13 @@ properties:
       offer the power, Capability Mismatch is set. Required for power sink and
       power dual role.
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: OF graph bindings modeling a data bus to the connector, e.g.
+      there is a single High Speed (HS) port present in this connector. If there
+      is more than one bus (several port, with 'reg' property), they can be grouped
+      under 'ports'.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: OF graph bindings modeling any data bus to the connector
@@ -322,6 +329,19 @@ examples:
         };
     };
 
+  # USB-C connector attached to SoC with a single High-Speed controller
+  - |
+    connector {
+        compatible = "usb-c-connector";
+        label = "USB-C";
+
+        port {
+            high_speed_ep: endpoint {
+                remote-endpoint = <&usb_hs_ep>;
+            };
+        };
+    };
+
   # USB-C connector attached to SoC and USB3 typec port controller(hd3ss3220)
   # with SS 2:1 MUX. HS lines routed to SoC, SS lines routed to the MUX and
   # the output of MUX is connected to the SoC.
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
