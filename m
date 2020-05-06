Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C71021C6C7D
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 11:12:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBA6C32EA3;
	Wed,  6 May 2020 09:12:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49D7CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 09:12:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04697Gwn001991; Wed, 6 May 2020 11:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ELImG/KZ21ZmINUzXocTq1UfGpbeAi7O5VA5zgJo2H8=;
 b=ojwkKvsf9Q1wQ6QvGUbGLwdCkFmbKmajE1PoAwpYPPJa6bXPjDdeDQLPoAiUvreIMpVY
 Zqdfpku922bGodNY/Y2MW4DiO+qD5bJWAsM7147t2RlOna1WTde8dGJym3iYWsNGA3c0
 Vxpqwcyp5aku2z0s4dNoDH9+n7OadTSxjhtf4ScwjWSs+jiFtFCk/TcP+vLbkogzCyY5
 fuLmsZeQqZUkCnqK9jhx+cWFTb+laXLsp6RzFHebbWfJLbHfb0ClJjZePhvcLYlgafiA
 uJKaKFXEhmRyNt4vyTtKr0+ascFE/ruZ8PvCvOWOGscjyPLu3XGYCtevcL1mCTwP9Jfr 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb254yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 11:12:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42E9B10002A;
 Wed,  6 May 2020 11:12:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32ACC2AB477;
 Wed,  6 May 2020 11:12:20 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 6 May 2020 11:12:19 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Date: Wed, 6 May 2020 11:11:15 +0200
Message-ID: <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-04,
 2020-05-06 signatures=0
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v4 06/10] dt-bindings: mtd: update STM32 FMC2
	NAND controller documentation
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

These bindings can be used on SOCs where the FMC2 NAND controller is
in standalone. In case that the FMC2 embeds 2 controllers (an external
bus controller and a raw NAND controller), the register base and the
clock will be defined in the parent node. It is the reason why the
register base address and the clock are now optional.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index b059267..68fac1a 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -18,13 +18,15 @@ properties:
 
   reg:
     items:
-      - description: Registers
+      - description: Registers (optional)
       - description: Chip select 0 data
       - description: Chip select 0 command
       - description: Chip select 0 address space
       - description: Chip select 1 data
       - description: Chip select 1 command
       - description: Chip select 1 address space
+    minItems: 6
+    maxItems: 7
 
   interrupts:
     maxItems: 1
@@ -61,7 +63,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
 
 examples:
   - |
@@ -77,13 +78,13 @@ examples:
             <0x81000000 0x1000>,
             <0x89010000 0x1000>,
             <0x89020000 0x1000>;
-            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
-                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
-                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
-            dma-names = "tx", "rx", "ecc";
-            clocks = <&rcc FMC_K>;
-            resets = <&rcc FMC_R>;
+      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+      dma-names = "tx", "rx", "ecc";
+      clocks = <&rcc FMC_K>;
+      resets = <&rcc FMC_R>;
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
