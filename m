Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC534434E7C
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 17:03:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E40FC5C856;
	Wed, 20 Oct 2021 15:03:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADEB3C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 15:03:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KD3Z97008294; 
 Wed, 20 Oct 2021 17:02:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=mtOAELMMg2FfpdI+Q7BA2qRARYKxutpR06ajPBwwq9Y=;
 b=yQQSQXJ542OSxFmsRHyGX9DTkSXeW3qYEXUypRzpJAigAUdasdc19knryijFmr72fxBX
 LMzO45yBMizMP2Fps3/NA1mU9bhy5ZoHM5XaiMNE4IZymllzKZiBfaci5VTIuRkqQUwP
 X62mdhrQTeyDfg/1xKblJoCnM8FMlPBM2p34U8oNGbZBEg1+52e2S1eiJElW8L/4JgL2
 I4T2DhtksiUDYk/sor3is9KUTKNa1O5+wWfoz57X29v1vXxLGtiIP3Bf1W4EqlTbr67M
 +KW7tvdcQrnJXcxd6m8XorfhrzdL4vrqIdK+dGunS6/wAo1zZyjG7EFh/Rd/whG7z/rP 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btknp8pjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:02:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5136B10002A;
 Wed, 20 Oct 2021 17:02:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48D7922A6E6;
 Wed, 20 Oct 2021 17:02:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 20 Oct 2021 17:02:52
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 20 Oct 2021 17:02:30 +0200
Message-ID: <20211020150230.9939-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: clean useless spaces in
	uart4_idle_pins_a node
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

Clean useless spaces in uart4_idle_pins_a node.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 5b60ecbd718f..e13c2a9762b8 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1737,20 +1737,20 @@
 	};
 
 	uart4_idle_pins_a: uart4-idle-0 {
-		   pins1 {
-			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
-		   };
-		   pins2 {
-			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-			 bias-disable;
-		   };
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
 	};
 
 	uart4_sleep_pins_a: uart4-sleep-0 {
-		   pins {
+		pins {
 			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
 				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
-		    };
+		};
 	};
 
 	uart4_pins_b: uart4-1 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
