Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B31B0913
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 14:16:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67F6C36B0F;
	Mon, 20 Apr 2020 12:16:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEF1FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 12:16:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KBrrvo025502; Mon, 20 Apr 2020 14:16:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=QP2tbu5dwpD9e8Zu7LVjrUW0dMsgcQdi5gD98XyB37I=;
 b=muDi0CJDJC4idzu8cGs0J+9H+sWwe9jbbsL7PUL7A/EqjQw9LaycchW0MHcWuUZxNfLc
 ZVag80+fWXsOABm4+l6wXCJPBus3y55/iXS7NbNUk4a6Ek7ny5VN8sQo+ojDl69nxTWQ
 4XBWs/yK6cRwiMQ0q4FCnIagFH90VPzi8oQ6dDy7KOXqZJGGCvN1zgx4OC8aHTEhirgh
 nB11cEdiHzX9g2I0tPqo1U7tBuaIwHvfGq/r1eT1FSS2XrnIa4gQ6WD7gooLcimzYZxa
 VBp7ptw4Dai9iFoUZmp7dJVvmaDZ53hwNhnREIKn5dfyThtYsB5LryyXARDm8xnj8gZP eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11a66j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 14:16:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 315DA10002A;
 Mon, 20 Apr 2020 14:16:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4C8F20FA76;
 Mon, 20 Apr 2020 14:16:26 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr 2020 14:16:25
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <fabrice.gasnier@st.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <daniel.lezcano@linaro.org>,
 <tglx@linutronix.de>
Date: Mon, 20 Apr 2020 14:16:15 +0200
Message-ID: <20200420121620.2099-2-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200420121620.2099-1-benjamin.gaignard@st.com>
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-20,
 2020-04-20 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 1/6] dt-bindings: mfd: Document STM32 low
	power timer bindings
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

Add a subnode to STM low power timer bindings to support timer driver

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index ddf190cb800b..2a99b2296d2b 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -33,6 +33,9 @@ properties:
     items:
       - const: mux
 
+  interrupts:
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
@@ -106,11 +109,13 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
     timer@40002400 {
       compatible = "st,stm32-lptimer";
       reg = <0x40002400 0x400>;
       clocks = <&timer_clk>;
       clock-names = "mux";
+      interrupts-extended = <&exti 47 IRQ_TYPE_LEVEL_HIGH>;
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
