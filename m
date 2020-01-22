Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AEA1451B3
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 10:56:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12721C36B0F;
	Wed, 22 Jan 2020 09:56:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC0B6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 09:56:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M9rrMZ005275; Wed, 22 Jan 2020 10:56:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=s07sRjVZ0SVXOOYoRmcEc515pUwV9NcjWvaQS3FOy84=;
 b=sfHOOtVmej9FNBH0/4QDl+9r+JJjgdbv0ooNUsKuMJOwawF4z2WQqLUoeZgRisIbVuV4
 W9cBblYni1ydi4KncnV/uwJDJOz60gRT2V6Jueule0/M9YnATlsSnL7VAUuoSj3BUxTN
 3+DsOW+tPqjKJcytQYo+SZsi8be77tCsm8CZI233OsSQUPun5SM5M0EynZ9wIVBrPGox
 5vr4z5aA659FQ5oRTQYKQLC7GkSEJiX+200cPDgDGlwQVbcc7JxPzm/SfwkMmOU/XQzn
 34WGrHgTT6PT7t0miDHVrwbBfXgW29Rx5e4z/qPWLPGXvZqw5vq0fGMTSc0Ni21dfDKN 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkssp3dmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 10:56:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 337A310002A;
 Wed, 22 Jan 2020 10:56:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EC392AD14D;
 Wed, 22 Jan 2020 10:56:01 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan 2020 10:56:00
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Wed, 22 Jan 2020 10:55:57 +0100
Message-ID: <20200122095558.22553-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200122095558.22553-1-benjamin.gaignard@st.com>
References: <20200122095558.22553-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: serial: Convert rs485
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
version 2:
- remove types inside rs485-rts-delay property and add a maximum for delay
  values

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
index 000000000000..d4beaf11222d
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
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          items:
+            - description:
+                Delay between rts signal and beginning of data sent in milliseconds.
+                It corresponds to the delay before sending data.
+              default: 0
+              maximum: 1000
+            - description:
+                Delay between end of data sent and rts signal in milliseconds.
+                It corresponds to the delay after sending data and actual release of the line.
+              default: 0
+              maximum: 1000
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
