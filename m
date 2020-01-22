Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E81451B4
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 10:56:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EE72C36B0E;
	Wed, 22 Jan 2020 09:56:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FA88C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 09:56:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00M9sCjs016045; Wed, 22 Jan 2020 10:56:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4Zw+r/mcuIQdGav3Gfbbdj8AtLqPaIWXCkURYNpxfY4=;
 b=jovkYIDF5w42n6yi9h5hqtYgncgDMBFtXMDqDAKoZWG5gk/amI0xeFx7zKKaAPavLGPY
 gMivTPoH9IuaAbh3JiNmEZqJssrE7n5YFraGuy0ba9BerZGNMtHUZUAm+9MBUQG6rUrc
 CDo+9y6I4cdzx6ANYGq17BBoPsDIokpN261FYFrEa9XEJE3aBM39ULnvYZP6fMdaUH6U
 U7d0zD8bFb//IRQ4P8aeIR9F7uw+IfrQeTCqdJbDDWibfoBld5i6OWBtR7PK8FMZM49j
 MMg4y/F6i5SJGsyowSHfr9vVd968H25TOrPPQtYTbPPPcBanpAnFpKc2lpfGCZyw3u2t Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1e3rmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2020 10:56:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2B6A100034;
 Wed, 22 Jan 2020 10:56:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C61982AD14D;
 Wed, 22 Jan 2020 10:56:01 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan 2020 10:56:01
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
Date: Wed, 22 Jan 2020 10:55:58 +0100
Message-ID: <20200122095558.22553-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200122095558.22553-1-benjamin.gaignard@st.com>
References: <20200122095558.22553-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: serial: Convert STM32
	UART to json-schema
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

Convert STM32 UART bindings to json-schema.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml  | 80 ++++++++++++++++++++++
 .../devicetree/bindings/serial/st,stm32-usart.txt  | 57 ---------------
 2 files changed, 80 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/st,stm32-usart.txt

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
new file mode 100644
index 000000000000..238c44192d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+maintainers:
+  - Erwan Le Ray <erwan.leray@st.com>
+
+title: STMicroelectronics STM32 USART bindings
+
+allOf:
+  - $ref: rs485.yaml
+
+properties:
+  compatible:
+    enum:
+      - st,stm32-uart
+      - st,stm32f7-uart
+      - st,stm32h7-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  label:
+    description: label associated with this uart
+
+  st,hw-flow-ctrl:
+    description: enable hardware flow control
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    items:
+      enum: [ rx, tx ]
+    minItems: 1
+    maxItems: 2
+
+  wakeup-source: true
+
+  rs485-rts-delay: true
+  rs485-rts-active-low: true
+  linux,rs485-enabled-at-boot-time: true
+  rs485-rx-during-tx: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+    usart1: serial@40011000 {
+      compatible = "st,stm32-uart";
+      reg = <0x40011000 0x400>;
+      interrupts = <37>;
+      clocks = <&rcc 0 164>;
+      dmas = <&dma2 2 4 0x414 0x0>,
+             <&dma2 7 4 0x414 0x0>;
+      dma-names = "rx", "tx";
+      rs485-rts-active-low;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/serial/st,stm32-usart.txt b/Documentation/devicetree/bindings/serial/st,stm32-usart.txt
deleted file mode 100644
index 8620f7fcbd50..000000000000
--- a/Documentation/devicetree/bindings/serial/st,stm32-usart.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-* STMicroelectronics STM32 USART
-
-Required properties:
-- compatible: can be either:
-  - "st,stm32-uart",
-  - "st,stm32f7-uart",
-  - "st,stm32h7-uart".
-  depending is compatible with stm32(f4), stm32f7 or stm32h7.
-- reg: The address and length of the peripheral registers space
-- interrupts:
-  - The interrupt line for the USART instance,
-  - An optional wake-up interrupt.
-- clocks: The input clock of the USART instance
-
-Optional properties:
-- resets: Must contain the phandle to the reset controller.
-- pinctrl: The reference on the pins configuration
-- st,hw-flow-ctrl: bool flag to enable hardware flow control.
-- rs485-rts-delay, rs485-rx-during-tx, rs485-rts-active-low,
-  linux,rs485-enabled-at-boot-time: see rs485.txt.
-- dmas: phandle(s) to DMA controller node(s). Refer to stm32-dma.txt
-- dma-names: "rx" and/or "tx"
-- wakeup-source: bool flag to indicate this device has wakeup capabilities
-- interrupt-names, if optional wake-up interrupt is used, should be:
-  - "event": the name for the interrupt line of the USART instance
-  - "wakeup" the name for the optional wake-up interrupt
-
-
-Examples:
-usart4: serial@40004c00 {
-	compatible = "st,stm32-uart";
-	reg = <0x40004c00 0x400>;
-	interrupts = <52>;
-	clocks = <&clk_pclk1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usart4>;
-};
-
-usart2: serial@40004400 {
-	compatible = "st,stm32-uart";
-	reg = <0x40004400 0x400>;
-	interrupts = <38>;
-	clocks = <&clk_pclk1>;
-	st,hw-flow-ctrl;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usart2 &pinctrl_usart2_rtscts>;
-};
-
-usart1: serial@40011000 {
-	compatible = "st,stm32-uart";
-	reg = <0x40011000 0x400>;
-	interrupts = <37>;
-	clocks = <&rcc 0 164>;
-	dmas = <&dma2 2 4 0x414 0x0>,
-	       <&dma2 7 4 0x414 0x0>;
-	dma-names = "rx", "tx";
-};
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
