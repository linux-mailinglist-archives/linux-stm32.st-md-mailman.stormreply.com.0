Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAD9C6A8E
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 09:30:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C48C78F88;
	Wed, 13 Nov 2024 08:30:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A1ACC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 08:29:59 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD5T69K030186;
 Wed, 13 Nov 2024 09:29:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=BytviIzCjIdHXac0v0yYt/
 +vzHuitYQuY7Dt5RQLAyA=; b=NPlX+dHe4tkFVGYvQyBFxbOeihUyOIsMD0W3B3
 zxhlb+jFIsLoku5BEdmI7yFUDNBVwmu4PwTGvHNNVrfIrCwvsQ7F7gchmbteQjYz
 g5LaJItd7ihkizkFL0k4Uo1i+69o3Py2Pv4GPuk9Mq8reWFjOq/ug68WvUtnDNLn
 JXlC1dx5oTZQUMOC3pjEfad3J26cHL3ge4EHSaOTVxE0ft3slybsdGvnGnl77zBX
 Io+ao/8RQ1F9QmmWDx/i9I71KZ5xkSaiyplf0aRs2z62nSIj8T/FlIEiizywI0l+
 c7JlTumbHzhC9QZPWYXVr7gIthn47kGIbGkLRjTHNc+yYPSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr90r7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2024 09:29:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 61D61400A1;
 Wed, 13 Nov 2024 09:28:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23DCE26FCFA;
 Wed, 13 Nov 2024 09:25:19 +0100 (CET)
Received: from localhost (10.252.5.106) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 13 Nov
 2024 09:25:18 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 13 Nov 2024 09:25:09 +0100
Message-ID: <20241113082510.2354924-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.5.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] arm64: dts: st: add i2s support to stm32mp251
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

Add I2S support to STM32MP25 SoCs.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6fe12e3bd7dd..8cc0b64e6a16 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -237,6 +237,21 @@ rifsc: bus@42080000 {
 			#access-controller-cells = <1>;
 			ranges;
 
+			i2s2: audio-controller@400b0000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x400b0000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI2>, <&rcc CK_KER_SPI2>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI2_R>;
+				dmas = <&hpdma 51 0x43 0x12>,
+				       <&hpdma 52 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 23>;
+				status = "disabled";
+			};
+
 			spi2: spi@400b0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -252,6 +267,21 @@ spi2: spi@400b0000 {
 				status = "disabled";
 			};
 
+			i2s3: audio-controller@400c0000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x400c0000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI3>, <&rcc CK_KER_SPI3>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI3_R>;
+				dmas = <&hpdma 53 0x43 0x12>,
+				       <&hpdma 54 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 24>;
+				status = "disabled";
+			};
+
 			spi3: spi@400c0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -439,6 +469,21 @@ usart6: serial@40220000 {
 				status = "disabled";
 			};
 
+			i2s1: audio-controller@40230000 {
+				compatible = "st,stm32mp25-i2s";
+				reg = <0x40230000 0x400>;
+				#sound-dai-cells = <0>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_BUS_SPI1>, <&rcc CK_KER_SPI1>;
+				clock-names = "pclk", "i2sclk";
+				resets = <&rcc SPI1_R>;
+				dmas = <&hpdma 49 0x43 0x12>,
+				       <&hpdma 50 0x43 0x21>;
+				dma-names = "rx", "tx";
+				access-controllers = <&rifsc 22>;
+				status = "disabled";
+			};
+
 			spi1: spi@40230000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
