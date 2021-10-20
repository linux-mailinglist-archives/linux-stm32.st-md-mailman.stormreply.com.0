Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20F434E81
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Oct 2021 17:03:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62282C5C856;
	Wed, 20 Oct 2021 15:03:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D6EBC597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Oct 2021 15:03:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KE4S9J029447; 
 Wed, 20 Oct 2021 17:03:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=nJXuhyQXitFXtPIaUWe8n59j2UiZ2FPRgTXRkj7zWl8=;
 b=ZdcKgVHNu9yk/H5h1Qcx/aFzEgBOR2FdkMonbXXwMtEGepiAn/n94+nErEV5IErzoJa4
 5PKb8gu0l0IF+2EtC+Wu8udIBtaLytGVIUvdpatRs9TDvG9BPaVNXvqY3+NuPwuIwAC0
 /2yEacD+r/5im+iqFV9JQBOFTwSAnxynPTmlgEZICw7AjLZMiLU95ZfOTKB4Sne8/cwb
 FJljuI/qCrxi3Agw68yk6wGg83edD7rqOknhMnSk1mvpt1VWks5h4sVY7W+wvoVqAbrR
 ND2RT+vlsDNO367HtAAnIP2OJ8Y4PA8SBafcS+GzuFE51n7WK2iKcVf5eW7MbfUcZhYj Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btfvstbkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:03:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED175100034;
 Wed, 20 Oct 2021 17:03:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E603622A6E6;
 Wed, 20 Oct 2021 17:03:14 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 20 Oct 2021 17:03:14
 +0200
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 20 Oct 2021 17:03:11 +0200
Message-ID: <20211020150311.10101-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: add pull-up to USART3
	and UART7 RX pins on DKx boards
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

Add pull-up to USART3 and UART7 RX pins to allow loop tests between USART3
and UART7 on stm32mp15 DKx boards.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index e13c2a9762b8..fe6e6f50151d 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1816,7 +1816,7 @@
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -1826,7 +1826,7 @@
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('E', 7, AF7)>; /* UART7_RX */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -1971,7 +1971,7 @@
 		pins2 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
 				 <STM32_PINMUX('I', 10, AF8)>; /* USART3_CTS_NSS */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -1988,7 +1988,7 @@
 		};
 		pins3 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -2012,7 +2012,7 @@
 		pins2 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>, /* USART3_RX */
 				 <STM32_PINMUX('B', 13, AF7)>; /* USART3_CTS_NSS */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -2029,7 +2029,7 @@
 		};
 		pins3 {
 			pinmux = <STM32_PINMUX('B', 12, AF8)>; /* USART3_RX */
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
