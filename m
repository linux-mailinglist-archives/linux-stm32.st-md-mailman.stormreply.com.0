Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFF25A72F
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Sep 2020 09:58:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6133CC32EA8;
	Wed,  2 Sep 2020 07:58:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 848F2C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Sep 2020 07:58:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0827ldTB002930; Wed, 2 Sep 2020 09:57:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jmfCrpD7iRQhB8zV3oMdul3HfOkcvL9AiInxyBT3bBE=;
 b=oSi7JJH+juyI0L0PAxPJzmo71a5DPIFjaHKMVlZfF5icmR4ubrmwUp2cm6h9izrGySSi
 qlBcZA+TLL7a4Fqkm1iXVknCcmD4Hr+kKXrnoTNWjq/3FgXaNMKx/l5/D9ncHKNVXpw9
 Fobd6jJmE1Ir4wQSflifS8MqF5rM/nroIThhW8gWHDhBwZir5G6MPjyVL02oMo+cPdTD
 Vwn2XXv6EphmkTMjefi2gflpw4KO0w7u46LbFs2ipTr1TRrOKk+3WCKT99SsYsvxQz5c
 Sqp6949VtypCRx1BDzxem44hbQ0RcQ29v3Yj/dEBIxtBEJBtKYxtoGCf618R3ny3bnol gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 337csvv4tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 09:57:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BCBF10002A;
 Wed,  2 Sep 2020 09:57:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AA4D212FB9;
 Wed,  2 Sep 2020 09:57:18 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep 2020 09:57:17
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Wed, 2 Sep 2020 09:57:04 +0200
Message-ID: <20200902075707.9052-4-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902075707.9052-1-amelie.delaunay@st.com>
References: <20200902075707.9052-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 3/6] dt-bindings: usb: Add DT
	bindings for STUSB160x Type-C controller
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

Add binding documentation for the STMicroelectronics STUSB160x Type-C port
controller.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
No changes in v2.
---
 .../devicetree/bindings/usb/st,stusb160x.yaml | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stusb160x.yaml b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
new file mode 100644
index 000000000000..12a996cd9405
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/st,stusb160x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: STMicroelectronics STUSB160x Type-C controller bindings
+
+maintainers:
+  - Amelie Delaunay <amelie.delaunay@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stusb1600
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description: main power supply (4.1V-22V)
+
+  vsys-supply:
+    description: low power supply (3.0V-5.5V)
+
+  vconn-supply:
+    description: power supply (2.7V-5.5V) used to supply VConn on CC pin in
+      source or dual power role
+
+  connector:
+    type: object
+
+    allOf:
+      - $ref: ../connector/usb-connector.yaml
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      power-role: true
+
+      power-opmode: true
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - connector
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c4 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec: stusb1600@28 {
+            compatible = "st,stusb1600";
+            reg = <0x28>;
+            vdd-supply = <&vbus_drd>;
+            vsys-supply = <&vdd_usb>;
+            interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-parent = <&gpioi>;
+
+            typec_con: connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                power-role = "dual";
+                power-opmode = "default";
+                data-role = "dual";
+
+                port {
+                    typec_con_ep: endpoint {
+                        remote-endpoint = <&usbotg_hs_ep>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
