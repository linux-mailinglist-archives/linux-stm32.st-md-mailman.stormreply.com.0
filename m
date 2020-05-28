Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 147611E58E7
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 09:39:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BD63C36B22;
	Thu, 28 May 2020 07:39:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 076EFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 07:39:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S7cADv017154; Thu, 28 May 2020 09:38:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FyALCO26XOK/eTghSitDe78wV/WFP/smeKrrxGId2ww=;
 b=NmJ2qJkn17QCml/rYDd4AFiblCGOHQE0qWl+vPK6MjS8E4XGLvOaVNMO99/ya7hNDMg3
 Cc58IHsouAkarRzVO5hc1/4txwJ4t/dMHLJgaryR4tPh4xRyTpwK2iMDB2U/DEPhcDXz
 uKH4WduGbT7zDHyJT2EADtBEoGim43jfEo2NYhnZG8J/yFMLh8uwRGMvA0yrd3tOy/bB
 B+mP1SqCRuD61bAf0WAi/YAu+hu4IOx1PJw2Dem7Gdb0p/uOrV0b0n0lzwlso6TmibrL
 Eui0REwZoAbZrc4ECz5wwjC5TfE6YkuFE+/hlxvCJRjrsfcK6BYnkqlpn4ZTI1ldFK5K VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa29wn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 09:38:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 549A3100034;
 Thu, 28 May 2020 09:38:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42BE32B187F;
 Thu, 28 May 2020 09:38:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 May 2020 09:38:57
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 28 May 2020 09:38:51 +0200
Message-ID: <20200528073853.24759-2-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528073853.24759-1-erwan.leray@st.com>
References: <20200528073853.24759-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: update uart4 pin
	configuration for low power on stm32mp157
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

Sleep pin configuration is refined for low power modes:
- "sleep" (no wakeup & console suspend enabled): put pins in analog state
  to optimize power
- "idle" (wakeup capability): keep Rx pin in alternate function

Signed-off-by: Bich Hemon <bich.hemon@st.com>
Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 7eb858732d6d..7cf535dc05f5 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1648,6 +1648,23 @@
 		};
 	};
 
+	uart4_idle_pins_a: uart4-idle-0 {
+		   pins1 {
+			 pinmux = <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
+		   };
+		   pins2 {
+			 pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			 bias-disable;
+		   };
+	};
+
+	uart4_sleep_pins_a: uart4-sleep-0 {
+		   pins {
+			pinmux = <STM32_PINMUX('G', 11, ANALOG)>, /* UART4_TX */
+				 <STM32_PINMUX('B', 2, ANALOG)>; /* UART4_RX */
+		    };
+	};
+
 	uart4_pins_b: uart4-1 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
