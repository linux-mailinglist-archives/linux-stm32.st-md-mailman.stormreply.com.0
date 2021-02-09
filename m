Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778C3160F1
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 09:27:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2150C57B52;
	Wed, 10 Feb 2021 08:27:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F59C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:05:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119A3J5D013945; Tue, 9 Feb 2021 11:04:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Zj/l8ff2MIZmWBD3LcqbfDM/Ef46Cl4XOGv3ADgIyNc=;
 b=PWfDQFPyU4OuTbue0ooJSSoXsO8IztiRA3CedEem0X8kEpS4ERcnDyauK8Nuqkr7SBUr
 ftkj86/VVHQaExX6iXMvdWn4B5NpTIHWThwgZsdyAth8YzP+OV6HbmfK0O08UkeahC2s
 01SYWhpKizqsqraniYg0fdQpBIua/DNWPtLmTyGdGRC54zYrPzf1r2dWCZ3u4MA+yENs
 oWZYujdLgg5Deo4Sfb7SkF/h4TR7qcuC1N8v0zkGNj+9niF/zVBK+U39uori/8Mb8McL
 Zyg1uEP/Z3iKVOFhzOmaNQ105TeflBzQTsNbCPrjVKr8m3XMqgk+9shKO+jBb9W+f9w0 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr31frb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:04:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 885E110002A;
 Tue,  9 Feb 2021 11:04:49 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72E9B22453E;
 Tue,  9 Feb 2021 11:04:49 +0100 (CET)
Received: from localhost (10.75.127.122) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:04:48 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 9 Feb 2021 10:59:48 +0100
Message-ID: <20210209095948.15889-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG1NODE5.st.com (10.75.127.66) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
X-Mailman-Approved-At: Wed, 10 Feb 2021 08:27:55 +0000
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: serial: stm32: add examples
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

From: Valentin Caron <valentin.caron@st.com>

Add examples to show more use cases :
 - uart2 with hardware flow control
 - uart4 without flow control

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 .../bindings/serial/st,stm32-uart.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 06d5f251ec88..3a4aab5d1862 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -82,6 +82,26 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    usart4: serial@40004c00 {
+      compatible = "st,stm32-uart";
+      reg = <0x40004c00 0x400>;
+      interrupts = <52>;
+      clocks = <&clk_pclk1>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_usart4>;
+    };
+
+    usart2: serial@40004400 {
+      compatible = "st,stm32-uart";
+      reg = <0x40004400 0x400>;
+      interrupts = <38>;
+      clocks = <&clk_pclk1>;
+      st,hw-flow-ctrl;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_usart2 &pinctrl_usart2_rtscts>;
+    };
+
     usart1: serial@40011000 {
       compatible = "st,stm32-uart";
       reg = <0x40011000 0x400>;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
