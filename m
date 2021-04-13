Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B1735E185
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 16:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69A4AC58D5D;
	Tue, 13 Apr 2021 14:32:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99815C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:32:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DEWM2J010080; Tue, 13 Apr 2021 16:32:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=6iYZAF1/Vkdy0FjL5VVkFCS8auvkDLWr+RYeFeOCiXE=;
 b=j8FYMo56x90Zcosuc6Ro8E1d7ChzXvz0xjd4XzM2ns3qPeYKqjVeLUaca/QXC8hcqo+k
 Y8ttq5v6dIpzxp2Hqu6moTU3AdDccNUOij7TJfUwUP8tebIVjRbS2so6dtcIiV1e5upT
 8PCnIpigGvkcCstA+uOczXHRKWFKUygzygDT//AMDX7RXPnyjUYACEYI0W0DhHH0NpTu
 v6rQUFJD4h4BCXhFW74z5hd0G63BGQUK8zjWWI+dZFdu+akJqIaxeSHD2toFYmpmCiFD
 R50UCb7neqGdxdo7w6iZO/5YKji3AoNIrsqtDr1RNbmkBGdvRZNPJIk8eDOwo64BTG8V Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp5e7eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:32:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 292B510002A;
 Tue, 13 Apr 2021 16:32:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19702246F3E;
 Tue, 13 Apr 2021 16:32:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 16:32:15
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 13 Apr 2021 16:31:40 +0200
Message-ID: <20210413143141.12919-2-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
References: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_08:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: phy: add vbus-supply
	optional property to phy-stm32-usbphyc
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

This patch adds vbus-supply optional property to phy sub-nodes using
connector node.
A regulator for USB VBUS may be needed for host mode.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- add connector vbus-supply property as suggested by Rob
---
 .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
index 018cc1246ee1..3329f1d33a4f 100644
--- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
@@ -74,6 +74,13 @@ patternProperties:
       "#phy-cells":
         enum: [ 0x0, 0x1 ]
 
+      connector:
+        type: object
+        allOf:
+          - $ref: ../connector/usb-connector.yaml
+        properties:
+          vbus-supply: true
+
     allOf:
       - if:
           properties:
@@ -130,6 +137,10 @@ examples:
             reg = <0>;
             phy-supply = <&vdd_usb>;
             #phy-cells = <0>;
+            connector {
+                compatible = "usb-a-connector";
+                vbus-supply = <&vbus_sw>;
+            };
         };
 
         usbphyc_port1: usb-phy@1 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
