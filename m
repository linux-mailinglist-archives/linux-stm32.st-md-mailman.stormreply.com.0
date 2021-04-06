Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC6A354DBA
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 09:21:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7A68C57B6A;
	Tue,  6 Apr 2021 07:21:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 530F4C57A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 07:21:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367IBQ1000736; Tue, 6 Apr 2021 09:21:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5m8iNHh1Xkwb/lEJlSeS971+rODlB5eDg71J/qYZ9QM=;
 b=6L8NjngpEj4dg80Aia7psHpmnbm/0Bai5ztANuAXL9rEZcmzYs657NPaj/nV/W1+rDDL
 M5H65bjM5kjUVLz30SQz+Qj6FQNWfqyg7wQMKQ2cXLBYx9/bXEIS/lvSCwBet4mzr1ta
 eKyik76OWFfNYN025fYV4HsyfhfIVMji9rjZxHsLNOrCKbuLtFuYKofzwKiaKEmtOxM8
 81ok5VQj2F1rS/7O6LUuNBy7MiQUOEnp5oX4snuHJ0S4B01vNFj007E48Ax4MZeCju6i
 vMyH0BzKwJ/dBCOKc1gUDbWTq2gQsKXYgd9UaRlS/U8fqfcgZi7P4WFTMWlz3SJzZnl3 tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37r3d23us1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 09:21:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6961A100038;
 Tue,  6 Apr 2021 09:21:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42FCC21E667;
 Tue,  6 Apr 2021 09:21:27 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 6 Apr 2021 09:21:26
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 6 Apr 2021 09:21:21 +0200
Message-ID: <20210406072122.27384-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406072122.27384-1-erwan.leray@foss.st.com>
References: <20210406072122.27384-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: stm32: add fifo
	threshold configuration
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

Add two optional DT properties, to configure RX and TX fifo threshold:
- st,rx-fifo-threshold-bytes
- st,tx-fifo-threshold-bytes

This patch depends on patch ("dt-bindings: serial: Add rx-tx-swap to stm32-usart").

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index c69f8464cdf3..e163449bf39e 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -65,6 +65,22 @@ properties:
   linux,rs485-enabled-at-boot-time: true
   rs485-rx-during-tx: true
 
+  st,rx-fifo-threshold-bytes:
+    description:
+      RX FIFO threshold configuration in bytes.
+      If value is set to 1, RX FIFO threshold is disabled.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 12, 14, 16]
+    default: 8
+
+  st,tx-fifo-threshold-bytes:
+    description:
+      TX FIFO threshold configuration in bytes.
+      If value is set to 1, TX FIFO threshold is disabled.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 12, 14, 16]
+    default: 8
+
 allOf:
   - $ref: rs485.yaml#
   - $ref: serial.yaml#
@@ -82,6 +98,17 @@ allOf:
     then:
       properties:
         rx-tx-swap: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32-uart
+              - st,stm32f7-uart
+    then:
+      properties:
+        st,rx-fifo-threshold-bytes: false
+        st,tx-fifo-threshold-bytes: false
 
 required:
   - compatible
@@ -96,13 +123,15 @@ examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
     usart1: serial@40011000 {
-      compatible = "st,stm32-uart";
+      compatible = "st,stm32h7-uart";
       reg = <0x40011000 0x400>;
       interrupts = <37>;
       clocks = <&rcc 0 164>;
       dmas = <&dma2 2 4 0x414 0x0>,
              <&dma2 7 4 0x414 0x0>;
       dma-names = "rx", "tx";
+      st,rx-fifo-threshold-bytes = <4>;
+      st,tx-fifo-threshold-bytes = <4>;
       rs485-rts-active-low;
     };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
