Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872A9A0A49
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 14:43:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FA23C78F66;
	Wed, 16 Oct 2024 12:43:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB38C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:43:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8U5QK011399;
 Wed, 16 Oct 2024 14:43:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KFc5UtMsTxPLpZ5ZNu4v4Ik5v+Rez2xhUaWk/edfOo0=; b=0f0nPWyqcu1jUB6B
 zeg0yvt51kybMVVKiTe2to/fVM2YA2OI16jIlQS6QTtIJGdAQNaH4nXoP6uHxYh0
 LyTHEwRCMuLlvE1tZceh61irIG47BLdS+WCoz1+2FpenHQZUcxaYPnpdxGK3CxaC
 DYGeupxclJ5d1iLnFSpZCyYIhvl0LRI1iacsS0F5feQ+vHAqtSFWEoAFOs0Hqy+j
 qMaaFfs32pbHYMXo3rY0aoUtyJ/nFh5X1DZdqTTA+scOHUzNqxuwqaDOnJIw5/LW
 0AIWfpj2ENrH6k8IRkPE6DSu0rP14nDeoYHtQiaaIIcFNw185Iwbi3pQeEgNhg3H
 ytP6Kw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 429qybdjcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:43:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C2FAD4004D;
 Wed, 16 Oct 2024 14:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B282723CEB3;
 Wed, 16 Oct 2024 14:40:25 +0200 (CEST)
Received: from localhost (10.252.17.239) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 14:40:25 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 16 Oct 2024 14:39:59 +0200
MIME-Version: 1.0
Message-ID: <20241016-dma3-mp25-updates-v3-7-8311fe6f228d@foss.st.com>
References: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
In-Reply-To: <20241016-dma3-mp25-updates-v3-0-8311fe6f228d@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.17.239]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 7/9] arm64: dts: st: add DMA support on
 U(S)ART instances of stm32mp25
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

Add dmas and dma-names properties in u(s)art nodes of stm32mp251.dtsi to
enable DMA support.
RX channel requires to prevent pack/unpack feature of DMA to avoid losing
bytes when interrupting RX transfer, as it uses a cyclic buffer.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi     | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 1167cf63d7e87aaa15c5c1ed70a9f6511fd818d4..9035fc7ba4857ca98a1a86246d7d0250196b2a13 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -266,6 +266,9 @@ usart2: serial@400e0000 {
 				reg = <0x400e0000 0x400>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_USART2>;
+				dmas = <&hpdma 11 0x20 0x10012>,
+				       <&hpdma 12 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 32>;
 				status = "disabled";
 			};
@@ -275,6 +278,9 @@ usart3: serial@400f0000 {
 				reg = <0x400f0000 0x400>;
 				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_USART3>;
+				dmas = <&hpdma 13 0x20 0x10012>,
+				       <&hpdma 14 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 33>;
 				status = "disabled";
 			};
@@ -284,6 +290,9 @@ uart4: serial@40100000 {
 				reg = <0x40100000 0x400>;
 				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_UART4>;
+				dmas = <&hpdma 15 0x20 0x10012>,
+				       <&hpdma 16 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 34>;
 				status = "disabled";
 			};
@@ -293,6 +302,9 @@ uart5: serial@40110000 {
 				reg = <0x40110000 0x400>;
 				interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_UART5>;
+				dmas = <&hpdma 17 0x20 0x10012>,
+				       <&hpdma 18 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 35>;
 				status = "disabled";
 			};
@@ -393,6 +405,9 @@ usart6: serial@40220000 {
 				reg = <0x40220000 0x400>;
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_USART6>;
+				dmas = <&hpdma 19 0x20 0x10012>,
+				       <&hpdma 20 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 36>;
 				status = "disabled";
 			};
@@ -438,6 +453,9 @@ uart9: serial@402c0000 {
 				reg = <0x402c0000 0x400>;
 				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_UART9>;
+				dmas = <&hpdma 25 0x20 0x10012>,
+				       <&hpdma 26 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 39>;
 				status = "disabled";
 			};
@@ -447,6 +465,9 @@ usart1: serial@40330000 {
 				reg = <0x40330000 0x400>;
 				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_USART1>;
+				dmas = <&hpdma 9 0x20 0x10012>,
+				       <&hpdma 10 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 31>;
 				status = "disabled";
 			};
@@ -480,6 +501,9 @@ uart7: serial@40370000 {
 				reg = <0x40370000 0x400>;
 				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_UART7>;
+				dmas = <&hpdma 21 0x20 0x10012>,
+				       <&hpdma 22 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 37>;
 				status = "disabled";
 			};
@@ -489,6 +513,9 @@ uart8: serial@40380000 {
 				reg = <0x40380000 0x400>;
 				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_UART8>;
+				dmas = <&hpdma 23 0x20 0x10012>,
+				       <&hpdma 24 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 38>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 214191a8322b81e7ae453503863b4465d9b625e0..d468dcbe849680de812a0ddd593f30cbf507f645 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -157,6 +157,8 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
