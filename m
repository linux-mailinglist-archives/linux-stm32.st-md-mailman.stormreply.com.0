Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9A62F72D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 15:21:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 138D2C65E46;
	Fri, 18 Nov 2022 14:21:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45FC3C65071
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 14:21:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AICNjGF025086; Fri, 18 Nov 2022 15:21:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qXN2qAP31dtQmh4rlvY3AXXbgtD30siuHxhoQeXtBn0=;
 b=MjecWixtmktzYcWvvgIzqY3QwX5pESADYHtoUQo+yYRfObfIo2az/2HrHEABYRcFuO/u
 qTn93b9CVWy8Z6LZs/9hIE/GMP0KJesmdqjLLPrXagvNlK8HjrLD7zvmh/v22WIgWJ9m
 WOj/SdGXJQHU8wttTdl0Up1OKzqimoVcELbY2dIXl/2yDpDHEUH/SFDns1VLuiRY9fLH
 18jU50r3EptMjDQ6srrKsqLI/PuDXKdghDKAlyz0m96SHniMaMlD72eu8cnr30l9RwOp
 56JgbA4nOgwG6sivQkVCDehqlSYLcysifmOcFvkk0nHJuHCTuMczw5bxyMId+PseW0Fp 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kx0my47rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 15:21:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EC4210002A;
 Fri, 18 Nov 2022 15:20:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9E4C231DE0;
 Fri, 18 Nov 2022 15:20:58 +0100 (CET)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 18 Nov
 2022 15:20:58 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Nov 2022 15:20:04 +0100
Message-ID: <20221118142006.479138-3-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118142006.479138-1-olivier.moysan@foss.st.com>
References: <20221118142006.479138-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/4] ARM: dts: stm32: add sai nodes on
	stm32mp131
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

Add SAI1 and SAI2 peripherals support for the STM32MP13 SoC family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Change-Id: I79af484702fa4108c106e6013f82d33638e92e6d
---
 arch/arm/boot/dts/stm32mp131.dtsi | 62 +++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index b8da3844df94..13cf4ee12016 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -241,6 +241,68 @@ spi1: spi@44004000 {
 			status = "disabled";
 		};
 
+		sai1: sai@4400a000 {
+			compatible = "st,stm32h7-sai";
+			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
+			ranges = <0 0x4400a000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI1_R>;
+			status = "disabled";
+
+			sai1a: audio-controller@4400a004 {
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 87 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai1b: audio-controller@4400a024 {
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 88 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai2: sai@4400b000 {
+			compatible = "st,stm32h7-sai";
+			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
+			ranges = <0 0x4400b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI2_R>;
+			status = "disabled";
+
+			sai2a: audio-controller@4400b004 {
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 89 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai2b: audio-controller@4400b024 {
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x20>;
+				#sound-dai-cells = <0>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 90 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
 		dma1: dma-controller@48000000 {
 			compatible = "st,stm32-dma";
 			reg = <0x48000000 0x400>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
