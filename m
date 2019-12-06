Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A56114E91
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2019 11:01:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3912C36B0B;
	Fri,  6 Dec 2019 10:01:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0725AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 10:01:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB69ue52015177; Fri, 6 Dec 2019 11:01:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JDvwUMe8qpYb+uBxaJVZc0mpCE2XQdvwLFY8XvYg2+A=;
 b=saAwJ+8rZdLkql+hc3b+2cZki1ubgidsBHnPPTgwkt0LPtguj96enegFpl0vkcMIdesK
 GLCA9k6Fq0vcRY/OO7zMpBeAzfNaBHrwVtsd2sHMs4flsy+q84ApYxLhyhhNI8x7fknu
 J3c+5suj50W1o0HwyEdZ8p2JMMx9uccf+Q4q2IdbFHChENtozCWe1IS9HcSDY5f2Lg8N
 8AE6JadYHWKxogwIpS/WfifB3xQJcJtf5x4THqurzL5n/YYJi7L8fAWAj0zc0iTjdUuu
 R4+s/ocJRizUvMWfqqQxhKSebo4ybepLa6zaGajoGmu4+385jaF+dJrknTwVvdog5EsS XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkf2y7tb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 11:01:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF1D7100038;
 Fri,  6 Dec 2019 11:01:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 95E072AD9C8;
 Fri,  6 Dec 2019 11:01:15 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 6 Dec 2019 11:01:14 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <jic23@kernel.org>, <robh+dt@kernel.org>, <olivier.moysan@st.com>
Date: Fri, 6 Dec 2019 11:00:58 +0100
Message-ID: <20191206100058.26767-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-05,2019-12-06 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] dt-bindings: iio: adc: convert sd
	modulator to json-schema
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

Convert the sigma delta modulator bindings
to DT schema format using json-schema.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
Changes since v1:
- add additionalProperties
- remove unit-address in example
---
 .../iio/adc/sigma-delta-modulator.txt         | 13 -------
 .../iio/adc/sigma-delta-modulator.yaml        | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
deleted file mode 100644
index 59b92cd32552..000000000000
--- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Device-Tree bindings for sigma delta modulator
-
-Required properties:
-- compatible: should be "ads1201", "sd-modulator". "sd-modulator" can be use
-	as a generic SD modulator if modulator not specified in compatible list.
-- #io-channel-cells = <0>: See the IIO bindings section "IIO consumers".
-
-Example node:
-
-	ads1202: adc {
-		compatible = "sd-modulator";
-		#io-channel-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
new file mode 100644
index 000000000000..a390343d0c2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/sigma-delta-modulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree bindings for sigma delta modulator
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
+
+properties:
+  compatible:
+    description: |
+      "sd-modulator" can be used as a generic SD modulator,
+      if the modulator is not specified in the compatible list.
+    enum:
+      - sd-modulator
+      - ads1201
+
+  '#io-channel-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    ads1202: adc {
+      compatible = "sd-modulator";
+      #io-channel-cells = <0>;
+    };
+
+...
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
