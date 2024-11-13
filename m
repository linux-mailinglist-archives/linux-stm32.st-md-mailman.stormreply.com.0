Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8D9C6B65
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 10:24:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 097EAC78F89;
	Wed, 13 Nov 2024 09:24:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C23DC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 09:24:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD5AamK009447;
 Wed, 13 Nov 2024 10:24:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=tWem1+VZpRRVw2nNHuZzPC
 AAiDrwTfkRP+sJH8abNTU=; b=mAigHaUZKSOAFQJ20DbThMD8THYFI3xyq6MtUx
 LFxoaxDf/o/NFrzEKge/COH4NzTt5sZHr5TWJ9y1atEbc6cBqLRFE77IorAd00E/
 6o+CLsX2+M91bDhJLxcmYK7hFtCiWhXr8ZHqO/q9ABO9vuMH+t2zg9qfXXwpj0wh
 +XDtViTqO//ivb7CusIN49OGen4ZsGpTkHnXHqZZqxJ+YZGfblsGGuGV5Da8nF3k
 nm5AP3/oF6zCJUsZOID2O/VM15xm/EoWHvxZqDfCz3ygazqYqOZOuuKHwhsQU1I2
 x5dDo5VnHTkKF4N56MHC1n0+XPYvwQbTrxSwei55YFLZCQTw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42swr912xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2024 10:24:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 810CB4005A;
 Wed, 13 Nov 2024 10:23:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9C7A289640;
 Wed, 13 Nov 2024 10:20:57 +0100 (CET)
Received: from localhost (10.252.5.106) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 13 Nov
 2024 10:20:57 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 13 Nov 2024 10:20:46 +0100
Message-ID: <20241113092047.2359487-1-olivier.moysan@foss.st.com>
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
Subject: [Linux-stm32] [PATCH] arm64: dts: st: add sai support on stm32mp251
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

Add SAI support to STM32MP25 SoC family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 136 +++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 6fe12e3bd7dd..e9db486b988a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -484,6 +484,108 @@ spi5: spi@40280000 {
 				status = "disabled";
 			};
 
+			sai1: sai@40290000 {
+				compatible = "st,stm32mp25-sai";
+				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
+				ranges = <0 0x40290000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				clocks = <&rcc CK_BUS_SAI1>;
+				clock-names = "pclk";
+				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc SAI1_R>;
+				access-controllers = <&rifsc 49>;
+				status = "disabled";
+
+				sai1a: audio-controller@40290004 {
+					compatible = "st,stm32-sai-sub-a";
+					reg = <0x4 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI1>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 73 0x43 0x21>;
+					status = "disabled";
+				};
+
+				sai1b: audio-controller@40290024 {
+					compatible = "st,stm32-sai-sub-b";
+					reg = <0x24 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI1>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 74 0x43 0x12>;
+					status = "disabled";
+				};
+			};
+
+			sai2: sai@402a0000 {
+				compatible = "st,stm32mp25-sai";
+				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
+				ranges = <0 0x402a0000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				clocks = <&rcc CK_BUS_SAI2>;
+				clock-names = "pclk";
+				interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc SAI2_R>;
+				access-controllers = <&rifsc 50>;
+				status = "disabled";
+
+				sai2a: audio-controller@402a0004 {
+					compatible = "st,stm32-sai-sub-a";
+					reg = <0x4 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI2>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 75 0x43 0x21>;
+					status = "disabled";
+				};
+
+				sai2b: audio-controller@402a0024 {
+					compatible = "st,stm32-sai-sub-b";
+					reg = <0x24 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI2>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 76 0x43 0x12>;
+					status = "disabled";
+				};
+			};
+
+			sai3: sai@402b0000 {
+				compatible = "st,stm32mp25-sai";
+				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
+				ranges = <0 0x402b0000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				clocks = <&rcc CK_BUS_SAI3>;
+				clock-names = "pclk";
+				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc SAI3_R>;
+				access-controllers = <&rifsc 51>;
+				status = "disabled";
+
+				sai3a: audio-controller@402b0004 {
+					compatible = "st,stm32-sai-sub-a";
+					reg = <0x4 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI3>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 77 0x43 0x21>;
+					status = "disabled";
+				};
+
+				sai3b: audio-controller@502b0024 {
+					compatible = "st,stm32-sai-sub-b";
+					reg = <0x24 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI3>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 78 0x43 0x12>;
+					status = "disabled";
+				};
+			};
+
 			uart9: serial@402c0000 {
 				compatible = "st,stm32h7-uart";
 				reg = <0x402c0000 0x400>;
@@ -508,6 +610,40 @@ usart1: serial@40330000 {
 				status = "disabled";
 			};
 
+			sai4: sai@40340000 {
+				compatible = "st,stm32mp25-sai";
+				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
+				ranges = <0 0x40340000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				clocks = <&rcc CK_BUS_SAI4>;
+				clock-names = "pclk";
+				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc SAI4_R>;
+				access-controllers = <&rifsc 52>;
+				status = "disabled";
+
+				sai4a: audio-controller@40340004 {
+					compatible = "st,stm32-sai-sub-a";
+					reg = <0x4 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI4>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 79 0x63 0x21>;
+					status = "disabled";
+				};
+
+				sai4b: audio-controller@40340024 {
+					compatible = "st,stm32-sai-sub-b";
+					reg = <0x24 0x20>;
+					#sound-dai-cells = <0>;
+					clocks = <&rcc CK_KER_SAI4>;
+					clock-names = "sai_ck";
+					dmas = <&hpdma 80 0x43 0x12>;
+					status = "disabled";
+				};
+			};
+
 			spi6: spi@40350000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
