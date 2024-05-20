Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A290F8C9E86
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2024 16:01:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67954C6C83D;
	Mon, 20 May 2024 14:01:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC2C0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2024 14:01:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KDtKnQ018364;
 Mon, 20 May 2024 16:01:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=QWCIxA9lCG4qboAz9wBvUd0tdgL05MyE0JN6AVl1/YU=; b=GS
 eyGr3vVPDy9kCyCZWd5o9sN9BtMeWbnvSezK9QlhQDa3htw+cuzfRf34erC2XH+V
 5Epi2U6WLD/mBariAsg/k/wqEVvY+IhRbKEu+YuJaziwJXNv/gGhJUdgmilMuuMA
 7aDgbOPaRkzJQ1r/QsghxXViVgSQrj79vpq4dp0o2y023Htx7rOfLoHrI0uprc9/
 JaBEARxRz1LSpKco26OFHDK+tFrbhlvXMMvqL/65fBBllmouw9uokOsD0d+4ATu9
 rlY1zsjLGWbjkr6apPfw232R/DeI0W74JCyAaVWAN6iSKuKOnFUFTAUT/9y0eVt4
 wfDUoReVEW+wniI3dE8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n337bnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 16:01:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E5454004D;
 Mon, 20 May 2024 16:01:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1B29222C87;
 Mon, 20 May 2024 16:00:36 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 16:00:36 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 May 2024 16:00:22 +0200
Message-ID: <20240520140024.3711080-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520140024.3711080-1-valentin.caron@foss.st.com>
References: <20240520140024.3711080-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] arm64: dts: st: add usart nodes on
	stm32mp25
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

Update device-tree stm32mp251.dtsi to add some USART features.

Add u(s)art 1, 3, 4, 5, 6, 7, 8, 9 nodes and compatible, interrupts,
clocks, access-controllers properties.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 4b48e4ed2d284..ca60b6bc7834c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -148,6 +148,33 @@ usart2: serial@400e0000 {
 				status = "disabled";
 			};
 
+			usart3: serial@400f0000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x400f0000 0x400>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_USART3>;
+				access-controllers = <&rifsc 33>;
+				status = "disabled";
+			};
+
+			uart4: serial@40100000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40100000 0x400>;
+				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_UART4>;
+				access-controllers = <&rifsc 34>;
+				status = "disabled";
+			};
+
+			uart5: serial@40110000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40110000 0x400>;
+				interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_UART5>;
+				access-controllers = <&rifsc 35>;
+				status = "disabled";
+			};
+
 			i2c1: i2c@40120000 {
 				compatible = "st,stm32mp25-i2c";
 				reg = <0x40120000 0x400>;
@@ -239,6 +266,15 @@ i2c7: i2c@40180000 {
 				status = "disabled";
 			};
 
+			usart6: serial@40220000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40220000 0x400>;
+				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_USART6>;
+				access-controllers = <&rifsc 36>;
+				status = "disabled";
+			};
+
 			spi1: spi@40230000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -275,6 +311,24 @@ spi5: spi@40280000 {
 				status = "disabled";
 			};
 
+			uart9: serial@402c0000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x402c0000 0x400>;
+				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_UART9>;
+				access-controllers = <&rifsc 39>;
+				status = "disabled";
+			};
+
+			usart1: serial@40330000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40330000 0x400>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_USART1>;
+				access-controllers = <&rifsc 31>;
+				status = "disabled";
+			};
+
 			spi6: spi@40350000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -299,6 +353,24 @@ spi7: spi@40360000 {
 				status = "disabled";
 			};
 
+			uart7: serial@40370000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40370000 0x400>;
+				interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_UART7>;
+				access-controllers = <&rifsc 37>;
+				status = "disabled";
+			};
+
+			uart8: serial@40380000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x40380000 0x400>;
+				interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_UART8>;
+				access-controllers = <&rifsc 38>;
+				status = "disabled";
+			};
+
 			spi8: spi@46020000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
