Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB59210C18
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 15:25:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A94EC36B27;
	Wed,  1 Jul 2020 13:25:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91B27C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 13:25:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061DOnul002514; Wed, 1 Jul 2020 15:25:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Qtjkenp1luntosfDrmrcRmxaJE1CtXuduIjGsuWvcRw=;
 b=NHxw0mcWRvblCnPSjL29QFflxIzogQjOY3CRadoxfCsSaugUO13kTwuiWRqJZ+YmqbNT
 PTB0e5wviT5x/IZ7sbdffYV3n8w3UsQ0WQKY84Snikji6R3yGdDhKPCXmJxTRaaqok1W
 v+Wv9rwG0A29AjksOePPVIHqQRcRwqdOkCwVXspu8xPfr0Dj2WIo2PCJVFnXwbZsqFkj
 gQ0z+8C248zKH+K/FijLWz8mHd2uHhkBMX2CEl38pHer6Cu+hm5VAeQaHaWWR3fZ/QE5
 iA7nwOuldeU7/rYLVfStWxAsPwJwlMu1Dd7a+LxPQSXy9SbpfphDcFAHFmchRrgfRS/Y iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwa835-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 15:25:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8517C10002A;
 Wed,  1 Jul 2020 15:25:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76E682B6DD8;
 Wed,  1 Jul 2020 15:25:31 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul 2020 15:25:30
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 1 Jul 2020 15:25:21 +0200
Message-ID: <20200701132523.32533-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200701132523.32533-1-benjamin.gaignard@st.com>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_08:2020-07-01,
 2020-07-01 signatures=0
Cc: devicetree@vger.kernel.org, tomase@xilinx.com, linux-kernel@vger.kernel.org,
 stefano.stabellini@xilinx.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/5] dt-bindings: bus: Add STM32 ETZPC
	firewall controller
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

Document STM32 ETZPC firewall controller bindings

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../bindings/bus/stm32/st,stm32-etzpc.yaml         | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml

diff --git a/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
new file mode 100644
index 000000000000..d92865fda40c
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/stm32/st,stm32-etzpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Extended TrustZone Protection controller
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+
+description: STMicroelectronics's STM32 firewall bus controller implementation
+
+allOf:
+  - $ref: "firewall-provider.yaml#"
+  - $ref: /schemas/simple-bus.yaml#
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - st,stm32-etzpc-bus
+
+  reg:
+   maxItems: 1
+
+  '#firewall-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - '#firewall-cells'
+
+examples:
+  - |
+    soc@5c007000 {
+      compatible = "st,stm32-etzpc-bus", "simple-bus";
+      reg = <0x5c007000 0x400>;
+      #firewall-cells = <2>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+    };
+
+...
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
