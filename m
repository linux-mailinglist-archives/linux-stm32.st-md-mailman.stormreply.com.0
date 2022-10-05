Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9A5F559F
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Oct 2022 15:37:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 569B5C65046;
	Wed,  5 Oct 2022 13:37:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AECCC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Oct 2022 13:37:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295Cs6GY029397;
 Wed, 5 Oct 2022 15:37:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=yc8TFrk/Tb/1WdSjthFD7CUlEtaWtaDiWSfbevdc6vw=;
 b=pAoRtSBpBvCEGimVBe8d1lX29BHrxBk6sBv1uSOgIeFornxXIze1scdpTrCz9x5U0gBa
 itmlTwNyOorpTMKthEPiiP0J62S+fmf4UzHdRXMUTvr3WPTYOY/XVO+hTNOuCIPOPEjT
 U/GWfKwcoTUC1vkpVcT/pJbKXOZalc+CDOc/kyCp4pMpQ9zWYjnoSGPHZLBGMvpRokSV
 YCpHWBLRy1rxpLNUweIWsBi6JIpnmnC/q0MZJ6xYlZ5PXtq1rN1MM5C/cO1h9BuPIhmP
 AGTAXafeOsT5sxrGAZclDXA4q/1ktfQxdukNvRkMgTx+3l014hCRvR3l8lnPciM6fdUT DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k16ds1w63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:37:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E432910003A;
 Wed,  5 Oct 2022 15:37:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE516229A9F;
 Wed,  5 Oct 2022 15:37:07 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 5 Oct
 2022 15:37:07 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <nuno.sa@analog.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Wan Jiabing
 <wanjiabing@vivo.com>, Yannick Brosseau <yannick.brosseau@gmail.com>
Date: Wed, 5 Oct 2022 15:31:18 +0200
Message-ID: <20221005133120.50483-7-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005133120.50483-1-olivier.moysan@foss.st.com>
References: <20221005133120.50483-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 6/8] ARM: dts: stm32: add adc pins muxing
	on stm32mp135f-dk
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

Define pins muxing that can be used for ADC on stm32mp135f-dk board
(USB Type-C CC1 & CC2 pins).

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
index d2472cd8f1d0..9cd58bf54ac8 100644
--- a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
@@ -6,6 +6,13 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	adc1_usb_cc_pins_a: adc1-usb-cc-pins-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 12, ANALOG)>, /* ADC1 in6 */
+				 <STM32_PINMUX('A', 3, ANALOG)>; /* ADC1 in12 */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
