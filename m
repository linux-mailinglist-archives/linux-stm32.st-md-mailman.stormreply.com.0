Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF513A95B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 13:33:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BF90C36B10;
	Tue, 14 Jan 2020 12:33:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E04C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 12:33:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00ECXKVn004923; Tue, 14 Jan 2020 13:33:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0nqgUqSxwdpUconxF/xpmwGAMX5ggOvyFookkeKhb74=;
 b=w7ctkzxw2QhKmJRgqIQxoTLSOCVG+jjPHx9ZENhkAoaaAiy9a7Q8HynLFI9UwLGrQF6+
 CWUTqjjZaZ9peAAztdw189x9bv2pm+91yxLXVOJoq2YFMN6zZlaQ+l0mEqzrKP05TyTC
 bTl5SCd3HtXBsCs18kH4R9O27goWE1UWPcr8z1Gl7cfx1jmVeKlq9dbkbWzSK/SvhEtO
 qKmR3RRjePEToNFzkFDsxpREKkELGXvdc5TzDjeSj31eDykNJzg/5A31ZElRaPxHgei7
 JYfX1aeKP63FXtYvrpIOxAjG0e95S9ThGraK6U/tau6hAutY4nWo5JT/OZpv2ZXJpl3G qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78s5f00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 13:33:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09EA510003A;
 Tue, 14 Jan 2020 13:33:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB2632AD9EC;
 Tue, 14 Jan 2020 13:33:33 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Jan 2020 13:33:33
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Tue, 14 Jan 2020 13:33:28 +0100
Message-ID: <20200114123329.3792-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200114123329.3792-1-benjamin.gaignard@st.com>
References: <20200114123329.3792-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_03:2020-01-13,
 2020-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: Convert rs485
	bindings to json-schema
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

Convert rs485 binding to yaml style file.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/serial/rs485.txt | 32 +--------------
 .../devicetree/bindings/serial/rs485.yaml          | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/rs485.yaml

diff --git a/Documentation/devicetree/bindings/serial/rs485.txt b/Documentation/devicetree/bindings/serial/rs485.txt
index b92592dff6dd..a7fe93efc4a5 100644
--- a/Documentation/devicetree/bindings/serial/rs485.txt
+++ b/Documentation/devicetree/bindings/serial/rs485.txt
@@ -1,31 +1 @@
-* RS485 serial communications
-
-The RTS signal is capable of automatically controlling line direction for
-the built-in half-duplex mode.
-The properties described hereafter shall be given to a half-duplex capable
-UART node.
-
-Optional properties:
-- rs485-rts-delay: prop-encoded-array <a b> where:
-  * a is the delay between rts signal and beginning of data sent in milliseconds.
-      it corresponds to the delay before sending data.
-  * b is the delay between end of data sent and rts signal in milliseconds
-      it corresponds to the delay after sending data and actual release of the line.
-  If this property is not specified, <0 0> is assumed.
-- rs485-rts-active-low: drive RTS low when sending (default is high).
-- linux,rs485-enabled-at-boot-time: empty property telling to enable the rs485
-  feature at boot time. It can be disabled later with proper ioctl.
-- rs485-rx-during-tx: empty property that enables the receiving of data even
-  while sending data.
-
-RS485 example for Atmel USART:
-	usart0: serial@fff8c000 {
-		compatible = "atmel,at91sam9260-usart";
-		reg = <0xfff8c000 0x4000>;
-		interrupts = <7>;
-		atmel,use-dma-rx;
-		atmel,use-dma-tx;
-		linux,rs485-enabled-at-boot-time;
-		rs485-rts-delay = <0 200>;		// in milliseconds
-	};
-
+See rs485.yaml
diff --git a/Documentation/devicetree/bindings/serial/rs485.yaml b/Documentation/devicetree/bindings/serial/rs485.yaml
new file mode 100644
index 000000000000..65c6a98969a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/rs485.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/rs485.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RS485 serial communications Bindings
+
+description: The RTS signal is capable of automatically controlling
+             line direction for the built-in half-duplex mode.
+             The properties described hereafter shall be given to a
+             half-duplex capable UART node.
+
+maintainers:
+  -  Rob Herring <robh@kernel.org>
+
+properties:
+  rs485-rts-delay:
+    description: prop-encoded-array <a b>
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      - items:
+          items:
+            - description:
+                Delay between rts signal and beginning of data sent in milliseconds.
+                It corresponds to the delay before sending data.
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+              default: 0
+            - description:
+                Delay between end of data sent and rts signal in milliseconds.
+                It corresponds to the delay after sending data and actual release of the line.
+              $ref: "/schemas/types.yaml#/definitions/uint32"
+              default: 0
+
+  rs485-rts-active-low:
+    description: drive RTS low when sending (default is high).
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  linux,rs485-enabled-at-boot-time:
+    description: enables the rs485 feature at boot time. It can be disabled later with proper ioctl.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  rs485-rx-during-tx:
+   description: enables the receiving of data even while sending data.
+   $ref: /schemas/types.yaml#/definitions/flag
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
