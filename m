Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D5518774
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 16:56:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 724E3C6046B;
	Tue,  3 May 2022 14:56:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65B06C60462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 14:56:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2439PXHh031550;
 Tue, 3 May 2022 16:56:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RnOyI1mW0pb5E+gAC2iVywTyj2C9lXRi03VkEPxPmr8=;
 b=zwDm6ATx6X16qwwb58yolddYIwQl9FgLrQ4Pm1ioLnEZ6Chu8+OdOADEDw0gRL2Ei4Rc
 qJD2X7zZw6OKkh87EqMAC7BLBq8vX9fHu1GWVYwN8fYpRj6zmKgSlEWhAmidq64G1eZE
 WNaL5bg5Ge0nq6tIEQPonOipo7g4IBlWUx8h+kusm6RHAfGVR5XvVkK/Kmx0+2DE+DKr
 4j21IEaS9MHNbJw0sndVroTw2Q6uabVjpenBTKsltS0Ma8P8qhJQCNsv/N3+A8Rf4OfH
 6HOkuSP0sFgdgMEy8IJgOkk83GavwkJUY9JIb681t4YR2wcG3Nlbm9J8VqAFQkmh5NQx sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjq1ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 16:56:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F66210002A;
 Tue,  3 May 2022 16:56:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 495FF226FA0;
 Tue,  3 May 2022 16:56:08 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May 2022 16:56:07
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Tue, 3 May 2022 16:56:06 +0200
Message-ID: <20220503145606.525875-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_06,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: remove the IPCC "wakeup"
	IRQ on stm32mp151
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
Note that the EXTI interrupt 61 has two roles : it is hierarchically linked
to the GIC IPCC "rx" interrupt, and it acts as a wakeup source.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 7fdc324b3cf9..edc0a1641c7b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1117,10 +1117,9 @@ ipcc: mailbox@4c001000 {
 			reg = <0x4c001000 0x400>;
 			st,proc-id = <0>;
 			interrupts-extended =
-				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				<&exti 61 1>;
-			interrupt-names = "rx", "tx", "wakeup";
+				<&exti 61 1>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "rx", "tx";
 			clocks = <&rcc IPCC>;
 			wakeup-source;
 			status = "disabled";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
