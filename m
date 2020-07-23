Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5C622AE92
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jul 2020 14:06:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2668C36B27;
	Thu, 23 Jul 2020 12:06:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0289C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jul 2020 12:06:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NC3EOc006531; Thu, 23 Jul 2020 14:06:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=E0OlX12Uh1E9X9WriKudw2kH7GGPXD0HUts6bxpjA8Y=;
 b=lcMpuMp0g3YP3uyvIOlMWW/JBxGV0lAwLKnWBEj5xIDiH8SBBlF+PUFSTOjOwLREIymx
 IrjlTTClaq1SOtZ12Sa+giNvMAQ7N9bkDAEviYkAxDrk13ixj9x2m7rn0FXSBBjW1NZc
 O+teh5j0wYk9qY2ywSCyQjqvj5IdTDmfdkR2GOf7M8rHwXADI9eeqEW4IInbW5cQSBJq
 Po1fvMruewISoCCnRC67pieJLRxGkgrXfejK/H9zmZahQkTkuXLId8OzhmNKcu0UMHpk
 +pXAenl/Y2BakNRrM0zueeMGzJLpVhAc1kBayjc1Ukx4ngIUCKCH8TvZVG2fmsWCz+OM vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsahakd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 14:06:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9ACA100034;
 Thu, 23 Jul 2020 14:06:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D216B2AF314;
 Thu, 23 Jul 2020 14:06:35 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jul 2020 14:06:35
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 23 Jul 2020 14:06:19 +0200
Message-ID: <20200723120624.26291-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723120624.26291-1-amelie.delaunay@st.com>
References: <20200723120624.26291-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_05:2020-07-23,
 2020-07-23 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/6] dt-bindings: connector: add
	power-opmode optional property to usb-connector
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

Power operation mode may depends on hardware design, so, add the optional
property power-opmode for usb-c connector to select the power operation
mode capability.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
Changes in v2:
- Add description for possible operation current values
---
 .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 9bd52e63c935..2fd85b9a7e1a 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -88,6 +88,26 @@ properties:
       - device
       - dual
 
+  power-opmode:
+    description: Determines the power operation mode that the Type C connector
+      will support and will advertise through CC pins.
+      - "default" corresponds to default USB voltage and current defined by the
+        USB 2.0 and USB 3.2 specifications, 5V 500mA for USB 2.0 ports and
+        5V 900mA or 1500mA for USB 3.2 ports in single-lane or dual-lane
+        operation respectively.
+      - "1.5A" and "3.0A", 5V 1.5A and 5V 3.0A respectively, as defined in USB
+        Type-C Cable and Connector specification, when Power Delivery is not
+        supported.
+      - "usb_power_delivery" when Power Delivery is supported, as defined in
+        USB Power Delivery specification.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/string
+    enum:
+      - default
+      - 1.5A
+      - 3.0A
+      - usb_power_delivery
+
   # The following are optional properties for "usb-c-connector" with power
   # delivery support.
   source-pdos:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
