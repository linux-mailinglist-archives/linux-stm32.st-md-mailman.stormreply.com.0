Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E6A1936D
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 15:13:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3592BC78F80;
	Wed, 22 Jan 2025 14:13:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF8ABC78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 14:13:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9W6H5016234;
 Wed, 22 Jan 2025 15:12:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YQE3o1iSMsyRh6GI7p4Oi8ZB/WlqbduMpe1M16ID35M=; b=S1YN808OfoeNLuD2
 tG9DL+UJkovOI3z48QUHkcygsZQBpojtYOypRMM0YD3IFrUnpC3izNTE4Pratpo9
 DaNMVuff2Qpzgm5V7gqYxjhEYERLaPwzmfljdq0/wEnSdoH8KjpUFJjGAhPzTM+C
 1+fkZjBf2/SKCJO51ZHtvPA1ra6/yWaU4BGlXDJqHSpwWyqCzix+KFTRkVoU1Of6
 SSCAgyyxuEizPd8yRDeS9R/y1rm4KwkLkfxRm7Cig4dfF4+BUEPFIwH0UX01IUba
 ikd+CPGV7uoOpMYmG4Qbbr1jAtXXqIRfXKt7LRZ+NYFO26wYN8QCAC6UYe7e+8Oi
 GzM5Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44arn2t5qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jan 2025 15:12:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7D18E40046;
 Wed, 22 Jan 2025 15:11:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AE69299A63;
 Wed, 22 Jan 2025 15:10:43 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 22 Jan
 2025 15:10:42 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Wed, 22 Jan 2025 15:10:33 +0100
Message-ID: <20250122141037.953934-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122141037.953934-1-patrice.chotard@foss.st.com>
References: <20250122141037.953934-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_06,2025-01-22_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/9] arm64: dts: st: Add OMM node on stm32mp251
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add Octo Memory Manager (OMM) entry on stm32mp251 and its two
OSPI instance.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..7d23a0beb154 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -768,6 +768,54 @@ rng: rng@42020000 {
 				status = "disabled";
 			};
 
+			ommanager: ommanager@40500000 {
+				compatible = "st,stm32mp25-omm";
+				reg = <0x40500000 0x400>, <0x60000000 0x10000000>;
+				reg-names = "omm", "omm_mm";
+				ranges = <0 0 0x40430000 0x400>,
+					 <1 0 0x40440000 0x400>;
+				clocks = <&rcc CK_BUS_OSPIIOM>;
+				resets = <&rcc OSPIIOM_R>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
+				access-controllers = <&rifsc 111>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+
+				ospi1: spi@40430000 {
+					compatible = "st,stm32mp25-ospi";
+					reg = <0 0 0x400>;
+					interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&hpdma 2 0x62 0x00003121>,
+					       <&hpdma 2 0x42 0x00003112>;
+					dma-names = "tx", "rx";
+					st,syscfg-dlyb = <&syscfg 0x1000>;
+					clocks = <&scmi_clk CK_SCMI_OSPI1>;
+					resets = <&scmi_reset RST_SCMI_OSPI1>,
+						 <&scmi_reset RST_SCMI_OSPI1DLL>;
+					access-controllers = <&rifsc 74>;
+					power-domains = <&CLUSTER_PD>;
+					status = "disabled";
+				};
+
+				ospi2: spi@40440000 {
+					compatible = "st,stm32mp25-ospi";
+					reg = <1 0 0x400>;
+					interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&hpdma 3 0x62 0x00003121>,
+					       <&hpdma 3 0x42 0x00003112>;
+					dma-names = "tx", "rx";
+					st,syscfg-dlyb = <&syscfg 0x1400>;
+					clocks = <&scmi_clk CK_SCMI_OSPI2>;
+					resets = <&scmi_reset RST_SCMI_OSPI2>,
+						 <&scmi_reset RST_SCMI_OSPI2DLL>;
+					access-controllers = <&rifsc 75>;
+					power-domains = <&CLUSTER_PD>;
+					status = "disabled";
+				};
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
