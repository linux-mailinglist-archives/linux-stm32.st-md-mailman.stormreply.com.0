Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C91EF326
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 10:34:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9635C36B2A;
	Fri,  5 Jun 2020 08:34:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF359C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 08:34:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0558Wf3B029843; Fri, 5 Jun 2020 10:33:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7+MnleNJkiEaO/P1tUZdrf9rpTSD5jzSpmCxlBfmTnI=;
 b=giXx+qn2MJVw97M8A3ITV3iPXJykZsf/gyxFedRPDkio8UuQ3+jj59T43IW3jIUSsuUm
 QMrH51YrYRMMbNPr9IaFKq0uUj7JUvqXLezzmvwiltic2Ad9wrL/1EhBParyMZuBUc/E
 /GVrMJVbj+HTaKAntn3RoAKZO9oOMrLERnefxSngfrOu2M2bXpyH3cZN0E98EdTrMDt+
 YT99L6Al9dQjyHnTolgtbfZe+CQ12MzKXO1zlE+GaM6gzzGcbRwMMZpOY1Qg1ziwL5V8
 GpFiBqFq7ko+hEBhSg8cuUzP5EXMDUhQMW+i1jLOHURzCQn/4hMGZwhWJCw8AKG4CKU5 /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasma4ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 10:33:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D65010002A;
 Fri,  5 Jun 2020 10:33:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C5852B21C0;
 Fri,  5 Jun 2020 10:33:52 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jun 2020 10:33:51
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Fri, 5 Jun 2020 10:33:44 +0200
Message-ID: <20200605083348.13880-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200605083348.13880-1-benjamin.gaignard@st.com>
References: <20200605083348.13880-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: tomase@xilinx.com, linux-kernel@vger.kernel.org,
 stefano.stabellini@xilinx.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/5] dt-bindings: bus: Add firewall bindings
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

Add schemas for firewall consumer and provider.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/bus/stm32/firewall-consumer.yaml      | 36 ++++++++++++++++++++++
 .../bindings/bus/stm32/firewall-provider.yaml      | 18 +++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml

diff --git a/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
new file mode 100644
index 000000000000..d3d76f99b38d
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Bus Firewall consumer binding
+
+description: |
+  Firewall properties provide the possible firewall bus controller
+  configurations for a device.
+  Bus firewall controllers are typically used to control if a hardware
+  block can perform read or write operations on bus.
+  The contents of the firewall bus configuration properties are defined by
+  the binding for the individual firewall controller device.
+
+  The first configuration 'firewall-0' or the one named 'default' is
+  applied before probing the device itself.
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+
+# always select the core schema
+select: true
+
+properties:
+  firewall-0: true
+
+  firewall-names: true
+
+patternProperties:
+  "firewall-[0-9]":
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+dependencies:
+  firewall-names: [ firewall-0 ]
diff --git a/Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml b/Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml
new file mode 100644
index 000000000000..299824c620ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/stm32/firewall-provider.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Bus Firewall provider binding
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@st.com>
+
+properties:
+  '#firewall-cells':
+     $ref: /schemas/types.yaml#/definitions/uint32
+     description: Number of cells in a bus firewall specifier
+
+required:
+  - '#firewall-cells'
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
