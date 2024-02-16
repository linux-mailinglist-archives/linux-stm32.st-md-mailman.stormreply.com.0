Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC31857944
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 10:50:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14FDAC71287;
	Fri, 16 Feb 2024 09:50:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F1F4C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 09:50:25 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G4qPtY015733; Fri, 16 Feb 2024 10:50:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=+fxKXdkROzT3M+/iRky170lOst61Y8+W0nzGBLi971o=; b=Ap
 pw7fH4IJUX/c324kbwir6nOnL40h6y/qP0alnLqfIszOFG6JHz0jdTTMMWti158G
 eyMC/7WlUIbWn94woIe321T3IRDy/9LlI88eFJyeoszxvvI+JfbJhvTb6HMMCDL1
 AKckjOk3AyUPsVkWr28a73agH8PAvJ5ZnWDZYB4Iv0/PQ0wD01RBBT4I85BrpYRE
 nwnfcLVIB/61fBBlKm8Lt//WBC+Sjy1Bas5TLH7V8PJOTjcNPtjQgKKYvzb33h/q
 2aN3YNBTed9GJL5bChevjfKRSBU6O6tifA0Pfm3wqS0xdX7GdICOIiMAssudN90J
 G3j6Mj/uf+8yPSllASgA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa124gy88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 10:50:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B33D840048;
 Fri, 16 Feb 2024 10:50:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13158237D7B;
 Fri, 16 Feb 2024 10:49:24 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 16 Feb
 2024 10:49:23 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Fri, 16 Feb 2024 10:47:53 +0100
Message-ID: <20240216094758.916722-9-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216094758.916722-1-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/12] ARM: dts: stm32: Use exti interrupt-map
	on stm32mp151
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

Stop using the internal table of the exti driver and use the more
flexible interrupt-map feature in DT.

Convert the driver's table for stm32mp151 to the interrupt-map
property in DT.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index fa4cbd312e5a..33c460cacb04 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -1223,7 +1223,58 @@ exti: interrupt-controller@5000d000 {
 			compatible = "st,stm32mp1-exti", "syscon";
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			#address-cells = <0>;
 			reg = <0x5000d000 0x400>;
+
+			exti-interrupt-map {
+				#address-cells = <0>;
+				#interrupt-cells = <2>;
+				interrupt-map-mask = <0xffffffff 0>;
+				interrupt-map =
+					<0  0 &intc GIC_SPI 6   IRQ_TYPE_LEVEL_HIGH>,
+					<1  0 &intc GIC_SPI 7   IRQ_TYPE_LEVEL_HIGH>,
+					<2  0 &intc GIC_SPI 8   IRQ_TYPE_LEVEL_HIGH>,
+					<3  0 &intc GIC_SPI 9   IRQ_TYPE_LEVEL_HIGH>,
+					<4  0 &intc GIC_SPI 10  IRQ_TYPE_LEVEL_HIGH>,
+					<5  0 &intc GIC_SPI 23  IRQ_TYPE_LEVEL_HIGH>,
+					<6  0 &intc GIC_SPI 64  IRQ_TYPE_LEVEL_HIGH>,
+					<7  0 &intc GIC_SPI 65  IRQ_TYPE_LEVEL_HIGH>,
+					<8  0 &intc GIC_SPI 66  IRQ_TYPE_LEVEL_HIGH>,
+					<9  0 &intc GIC_SPI 67  IRQ_TYPE_LEVEL_HIGH>,
+					<10 0 &intc GIC_SPI 40  IRQ_TYPE_LEVEL_HIGH>,
+					<11 0 &intc GIC_SPI 42  IRQ_TYPE_LEVEL_HIGH>,
+					<12 0 &intc GIC_SPI 76  IRQ_TYPE_LEVEL_HIGH>,
+					<13 0 &intc GIC_SPI 77  IRQ_TYPE_LEVEL_HIGH>,
+					<14 0 &intc GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+					<15 0 &intc GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+					<16 0 &intc GIC_SPI 1   IRQ_TYPE_LEVEL_HIGH>,
+					<19 0 &intc GIC_SPI 3   IRQ_TYPE_LEVEL_HIGH>,
+					<21 0 &intc GIC_SPI 31  IRQ_TYPE_LEVEL_HIGH>,
+					<22 0 &intc GIC_SPI 33  IRQ_TYPE_LEVEL_HIGH>,
+					<23 0 &intc GIC_SPI 72  IRQ_TYPE_LEVEL_HIGH>,
+					<24 0 &intc GIC_SPI 95  IRQ_TYPE_LEVEL_HIGH>,
+					<25 0 &intc GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<26 0 &intc GIC_SPI 37  IRQ_TYPE_LEVEL_HIGH>,
+					<27 0 &intc GIC_SPI 38  IRQ_TYPE_LEVEL_HIGH>,
+					<28 0 &intc GIC_SPI 39  IRQ_TYPE_LEVEL_HIGH>,
+					<29 0 &intc GIC_SPI 71  IRQ_TYPE_LEVEL_HIGH>,
+					<30 0 &intc GIC_SPI 52  IRQ_TYPE_LEVEL_HIGH>,
+					<31 0 &intc GIC_SPI 53  IRQ_TYPE_LEVEL_HIGH>,
+					<32 0 &intc GIC_SPI 82  IRQ_TYPE_LEVEL_HIGH>,
+					<33 0 &intc GIC_SPI 83  IRQ_TYPE_LEVEL_HIGH>,
+					<46 0 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+					<47 0 &intc GIC_SPI 93  IRQ_TYPE_LEVEL_HIGH>,
+					<48 0 &intc GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+					<50 0 &intc GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+					<52 0 &intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+					<53 0 &intc GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+					<54 0 &intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					<61 0 &intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<65 0 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+					<68 0 &intc GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+					<70 0 &intc GIC_SPI 62  IRQ_TYPE_LEVEL_HIGH>,
+					<73 0 &intc GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		syscfg: syscon@50020000 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
