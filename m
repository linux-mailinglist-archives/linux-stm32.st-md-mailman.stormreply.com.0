Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 405BC6CC6AB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 17:37:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09C37C6A5F6;
	Tue, 28 Mar 2023 15:37:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2D15C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 15:37:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SDwn90013765; Tue, 28 Mar 2023 17:37:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=WPEjXayWT+uWOiON+cXyIPwk9fPuwbN+4snzQyUm7ac=;
 b=TB/i2lBCP1h5is8mzTZh+EtEjoHbJQkf2BzEJ+GFpAiI6QnWcwagrRbk7S1dBnOjispA
 C+AG1mV0DlHPjVBfZoxP1LgMTw7VcLHX4rA6cR6cy4X01lCFprQ+w4M5+ZWbmMG/JPKh
 2Bkg2SqcGH3kJetSJvt8dwtuxgCQhwTVO5BSSSD3CIsXCT2VvgbydEx+mfpJuzwgS36R
 ivQEe/6iNMsxN+cIQFwXDKJB3LH9ULoY/Np+jo2+uGS+vAti/jeolCdRM8fLxkh/yrEn
 TmIZi9shn+siWwWF85j/1kZhxcD+8zwMqbBUADuO8mjf+txTl6c3rqOqaamu1XcrTfBz Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsqwk6jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:37:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 298FE10002A;
 Tue, 28 Mar 2023 17:37:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 231532194FA;
 Tue, 28 Mar 2023 17:37:39 +0200 (CEST)
Received: from localhost (10.201.20.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 17:37:38 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 28 Mar 2023 17:37:21 +0200
Message-ID: <20230328153723.498672-5-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230328153723.498672-1-valentin.caron@foss.st.com>
References: <20230328153723.498672-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/6] ARM: dts: stm32: add uart nodes on
	stm32mp13
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

Update device-tree stm32mp131.dtsi to add some uart features.

On uart 1, 2, 3, 5, 6, 7, 8 nodes, add compabible, exti interrupts, clock,
reset properties, dma config.

On uart 4 node, only add dma configuration and use exti interrupt.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 97 ++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index 5949473cbbfd..9ea61687f023 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -397,12 +397,42 @@ spdifrx: audio-controller@4000d000 {
 			status = "disabled";
 		};
 
+		usart3: serial@4000f000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4000f000 0x400>;
+			interrupts-extended = <&exti 28 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART3_K>;
+			resets = <&rcc USART3_R>;
+			wakeup-source;
+			dmas = <&dmamux1 45 0x400 0x5>,
+			       <&dmamux1 46 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		uart4: serial@40010000 {
 			compatible = "st,stm32h7-uart";
 			reg = <0x40010000 0x400>;
-			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 30 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc UART4_K>;
 			resets = <&rcc UART4_R>;
+			wakeup-source;
+			dmas = <&dmamux1 63 0x400 0x5>,
+			       <&dmamux1 64 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart5: serial@40011000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40011000 0x400>;
+			interrupts-extended = <&exti 31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART5_K>;
+			resets = <&rcc UART5_R>;
+			wakeup-source;
+			dmas = <&dmamux1 65 0x400 0x5>,
+			       <&dmamux1 66 0x400 0x1>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
@@ -442,6 +472,32 @@ i2c2: i2c@40013000 {
 			status = "disabled";
 		};
 
+		uart7: serial@40018000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40018000 0x400>;
+			interrupts-extended = <&exti 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART7_K>;
+			resets = <&rcc UART7_R>;
+			wakeup-source;
+			dmas = <&dmamux1 79 0x400 0x5>,
+			       <&dmamux1 80 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart8: serial@40019000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40019000 0x400>;
+			interrupts-extended = <&exti 33 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc UART8_K>;
+			resets = <&rcc UART8_R>;
+			wakeup-source;
+			dmas = <&dmamux1 81 0x400 0x5>,
+			       <&dmamux1 82 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		timers1: timer@44000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -524,6 +580,19 @@ counter {
 			};
 		};
 
+		usart6: serial@44003000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x44003000 0x400>;
+			interrupts-extended = <&exti 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART6_K>;
+			resets = <&rcc USART6_R>;
+			wakeup-source;
+			dmas = <&dmamux1 71 0x400 0x5>,
+			       <&dmamux1 72 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		i2s1: audio-controller@44004000 {
 			compatible = "st,stm32h7-i2s";
 			reg = <0x44004000 0x400>;
@@ -748,6 +817,32 @@ usbotg_hs: usb@49000000 {
 			status = "disabled";
 		};
 
+		usart1: serial@4c000000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4c000000 0x400>;
+			interrupts-extended = <&exti 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART1_K>;
+			resets = <&rcc USART1_R>;
+			wakeup-source;
+			dmas = <&dmamux1 41 0x400 0x5>,
+			       <&dmamux1 42 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		usart2: serial@4c001000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4c001000 0x400>;
+			interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc USART2_K>;
+			resets = <&rcc USART2_R>;
+			wakeup-source;
+			dmas = <&dmamux1 43 0x400 0x5>,
+			       <&dmamux1 44 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		i2s4: audio-controller@4c002000 {
 			compatible = "st,stm32h7-i2s";
 			reg = <0x4c002000 0x400>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
