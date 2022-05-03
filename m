Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F651809F
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 11:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8823AC60462;
	Tue,  3 May 2022 09:06:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ECA5C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 09:06:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2432SaD0005468;
 Tue, 3 May 2022 11:06:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Lch5kxrVurXyYkJZk2nr1V3CBhH5QtpWiVNCuZn3dzM=;
 b=qfAS0MxjOuQQCoIKmHoNKcGLTkoNaMUNO9w6hedNVBHEHSHPOaeKgDhZQXxxEG1Aukpr
 YMmKGkYE8JwzC5D3PLw7c3cfigAWEcl5PNxco3RIiUIwCZGnZD53EF+a/Q2SARhWFY23
 hkLEo1aHt1PwSSNJsRrF+g+CIZA8LVgpmylFe/phsGaFmPSiAiTggtbqD7AFo/aC9H2k
 IKytMxUC/5+zOKsck5XiC4iLlSqWP2YTKivfTXw7O8MFuro2rGDmiKzQypS5ifz/Umlc
 I7TKCPAVf3LLahHcpm8qOiyvAU+NQEUL+D5h1EwZnDDEQBu/SGAEYOmKM8oiRl6TMg1V JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0cxft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 11:06:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFBC710002A;
 Tue,  3 May 2022 11:06:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8892214D19;
 Tue,  3 May 2022 11:06:28 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May 2022 11:06:27
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 3 May 2022 11:06:21 +0200
Message-ID: <20220503090621.483567-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_03,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add EXTI interrupt-parent to
	pinctrl node on stm32mp131
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

Add interrupt-parent property in pinctrl node to use GPIO as IRQ.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 58647396704f..f9ebc47e6421 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -259,6 +259,8 @@ pinctrl: pinctrl@50002000 {
 			#size-cells = <1>;
 			compatible = "st,stm32mp135-pinctrl";
 			ranges = <0 0x50002000 0x8400>;
+			interrupt-parent = <&exti>;
+			st,syscfg = <&exti 0x60 0xff>;
 			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
