Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69C518771
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 16:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648C0C60479;
	Tue,  3 May 2022 14:56:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A27C6046B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 14:56:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243ADXlV020818;
 Tue, 3 May 2022 16:56:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=/iK1zldmwN15KsfZJkKuibnGLSI5hr1cQ4CYQxRlMIc=;
 b=RDyFI+Mo9IKJR9Ux68leUxrtgorgZCViX+GVSvkQ0cqg4MXgn6lk7czp3Yzg8In446SI
 f+V7JQiI23sk/GHMiQiZEv7HRvPyK3MX+x2DSxPdYN3ibRqetNPwO5qtQpK6jz6p1QXU
 ftDvXvj0KFoa68nmKJ1GFCeSgUZ5sHEm09B4JQuTYplGY6RUV/fEq+y9ZmorCvbE0Z90
 KbFYxcoc7jfuoiaYiB4pDDL3BdWePOXWEFqyOHoDma9lTVXF72Z8jzOAZRsO241/IXzt
 T10N6sPmGjCRmgc0BObHSa+Q0tvBar+mdj27LqGvN9kYSIhzRbU+bgFadIpFxxFBrBSU eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0eqrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 16:56:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD69610002A;
 Tue,  3 May 2022 16:56:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6E82226FB4;
 Tue,  3 May 2022 16:56:02 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May 2022 16:56:02
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Tue, 3 May 2022 16:55:59 +0200
Message-ID: <20220503145559.525804-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_06,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: mailbox: remove the IPCC
	"wakeup" IRQ
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

The stm32 ipcc mailbox driver supports only two interrupts (rx and tx), so
remove the unsupported "wakeup" one.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 .../devicetree/bindings/mailbox/st,stm32-ipcc.yaml    | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
index 8eb4bf52ea27..2c8b47285aa3 100644
--- a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
@@ -30,15 +30,11 @@ properties:
     items:
       - description: rx channel occupied
       - description: tx channel free
-      - description: wakeup source
-    minItems: 2
 
   interrupt-names:
     items:
       - const: rx
       - const: tx
-      - const: wakeup
-    minItems: 2
 
   wakeup-source: true
 
@@ -70,10 +66,9 @@ examples:
       #mbox-cells = <1>;
       reg = <0x4c001000 0x400>;
       st,proc-id = <0>;
-      interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
-      		      <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
-      		      <&aiec 62 1>;
-      interrupt-names = "rx", "tx", "wakeup";
+      interrupts-extended = <&exti 61 1>,
+                            <&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "rx", "tx";
       clocks = <&rcc_clk IPCC>;
       wakeup-source;
     };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
