Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A735E529
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 19:40:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E2FC58D5D;
	Tue, 13 Apr 2021 17:40:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57304C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 17:40:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DHWlJQ030006; Tue, 13 Apr 2021 19:40:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ucB3CVxc2CXLlVUhuCLgH9jvWKI0aTetNckwSiVPEHk=;
 b=rC8bNEdoDjA7K1+DjJzIQbFY86/LAjahikChrqSFEiufmkPNjSK8OlG6mvTf/JnWWzlx
 OFF8LaPWe5E9SqEBzppPkM49ictFRjLUPf6Te/PHR+bqm1FU4JQsNV8h5mD26C2BFMNw
 knNzPE8Hs6nSXkTQZGS2GBJL1RTZNeo60uRJggPs7RTD1SW14KR++2DuBQi2t2b0H5dv
 NHYEsPakat1TYO2nosF3YUan6CYZJ30+Yv705a4sTFZxPv7PXvdPxXl3WeXl4xAYstvb
 mypdmXwE1vG6SPKCNLj7Nz5rluCkJP+W2PvspZX2hjfmP7Xh3STcUFqIwwX3uwEgwmsO cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp5f39c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:40:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8C1D100038;
 Tue, 13 Apr 2021 19:40:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA8342159E9;
 Tue, 13 Apr 2021 19:40:21 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 19:40:21
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 13 Apr 2021 19:40:13 +0200
Message-ID: <20210413174015.23011-3-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413174015.23011-1-erwan.leray@foss.st.com>
References: <20210413174015.23011-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] dt-bindings: serial: stm32: override
	FIFO threshold properties
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

Override rx-threshold and tx-threshold properties:
- extend description
- provide default and expected values

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

Changes in v2:
Change added properties naming and factorize it in serial.yaml as proposed
by Rob Herring.

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index c69f8464cdf3..71a6426bc558 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -65,6 +65,18 @@ properties:
   linux,rs485-enabled-at-boot-time: true
   rs485-rx-during-tx: true
 
+  rx-threshold:
+    description:
+      If value is set to 1, RX FIFO threshold is disabled.
+    enum: [1, 2, 4, 8, 12, 14, 16]
+    default: 8
+
+  tx-threshold:
+    description:
+      If value is set to 1, TX FIFO threshold is disabled.
+    enum: [1, 2, 4, 8, 12, 14, 16]
+    default: 8
+
 allOf:
   - $ref: rs485.yaml#
   - $ref: serial.yaml#
@@ -82,6 +94,17 @@ allOf:
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
+        rx-threshold: false
+        tx-threshold: false
 
 required:
   - compatible
@@ -96,13 +119,15 @@ examples:
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
+      rx-threshold = <4>;
+      tx-threshold = <4>;
       rs485-rts-active-low;
     };
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
