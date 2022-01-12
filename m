Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8648C859
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 17:32:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D26EC6046A;
	Wed, 12 Jan 2022 16:32:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13EA1C60460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 16:32:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CB7KT5019065;
 Wed, 12 Jan 2022 17:32:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=RLix70hBzYvu61S76fUm2ZmEwhtXGBOMK8Sbh+qyL2s=;
 b=CQvbac4rdWmYP5Bzg/b/91CIGnb9tP6H/xy4ckg0dCaa4975fEybjh4X2SP5AJknEk1Y
 akdeYt+pHjq4cSbXzdUpiH/7Hzv7HL6wXdhcd9vJlZSdYfEQyBYNkLY2LrkgU3apw3YD
 o0ye6jwYHZfgJ/gNIdTCY9zZ53rCLTQNMWckFbO8CjRm23gn0uumNeiH+wS59yGSafjE
 O5mdRAPgvzScndaCuW3KwemtFlsUMSn8RrJKZ/Q5VS8p9hH2xckpMt1pe7ax/ZxXbojP
 WMpJkxG/eOZu6Dkxwnf01eCa8tn8M8jQciBL3bkSlm0YseH2SlHLNAwqTb/Rr0a7wXHp pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9u815-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 17:32:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC094100038;
 Wed, 12 Jan 2022 17:32:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D38D824B8B1;
 Wed, 12 Jan 2022 17:32:35 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 17:32:35
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 12 Jan 2022 17:32:20 +0100
Message-ID: <20220112163226.25384-5-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112163226.25384-1-yann.gautier@foss.st.com>
References: <20220112163226.25384-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
Cc: Gerald Baeza <gerald.baeza@foss.st.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 04/10] ARM: dts: stm32: update sdmmc slew-rate
	in stm32mp13 pinctrl
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

From: Gerald Baeza <gerald.baeza@foss.st.com>

SDMMC1/2 CK <= 50 MHz so slew-rate = <1>
A new node sdmmc1-clk-0 is added to manage the new clock pin slew-rate.

Signed-off-by: Gerald Baeza <gerald.baeza@foss.st.com>
Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
index 069f95f2b628..ebb83c56c350 100644
--- a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
@@ -7,7 +7,7 @@
 
 &pinctrl {
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
-		pins1 {
+		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
 				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
 				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
@@ -17,12 +17,6 @@
 			drive-push-pull;
 			bias-disable;
 		};
-		pins2 {
-			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
 	};
 
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
@@ -36,12 +30,6 @@
 			bias-disable;
 		};
 		pins2 {
-			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-			slew-rate = <2>;
-			drive-push-pull;
-			bias-disable;
-		};
-		pins3 {
 			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
 			slew-rate = <1>;
 			drive-open-drain;
@@ -49,6 +37,15 @@
 		};
 	};
 
+	sdmmc1_clk_pins_a: sdmmc1-clk-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 6, AF8)>; /* UART4_TX */
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
