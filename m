Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DD9A0A3F
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 14:43:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A48A4C78039;
	Wed, 16 Oct 2024 12:43:08 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12649C78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:43:02 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8o7FK018075;
 Wed, 16 Oct 2024 14:42:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QY3+4yFvEuS+q43fMZ7qPJn6kolc7ne5LyE/5i7vFNg=; b=rCzgGH3rbhpPvAeM
 9Ky4rLWql2K5YYqtqu0JoZnQ8Rp5U1twv1av2IW4gRe4aGrzq+A1J0TqkTDgGCNW
 umYdVobhgxSd62yPzlKUl9xMsZYFU+ZXB+p2zXsc5MBHzECyXKrmLAcDLLB0SJt/
 sDfABUmsndpwo+8GDfNuKr2GMkmAADPx6dAPR8TK8gzQE0x/d4y1WwgtOwkKWa5L
 /3JZCYvlVUy+CaCLqGMuxfBrHNpfWVGwJmWkaV425Wyy8etn0PG0HbBRRPmzFmZE
 MG6hvb0jq//hbFgeGTYBmjhVyh1c6RZeeWm87wPxtmpZVfVmSMrVLcVEyNZ7jWzG
 64867Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42842jfv5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 14:42:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 690A44004F;
 Wed, 16 Oct 2024 14:41:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BC5323D403;
 Wed, 16 Oct 2024 14:40:27 +0200 (CEST)
Received: from localhost (10.252.17.239) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 14:40:27 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 16 Oct 2024 14:40:01 +0200
MIME-Version: 1.0
Message-ID: <20241016-dma3-mp25-updates-v3-9-8311fe6f228d@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v3 9/9] arm64: dts: st: add DMA support on SPI
 instances of stm32mp25
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

Add dmas and dma-names properties in spi nodes of stm32mp251.dtsi to
enable DMA support.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index e166e2f1f1400faf7fb56ed07c5779c26cf80cdd..ed1d778ab441be3ebf2e53dea9fef484d41ab31a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -245,6 +245,9 @@ spi2: spi@400b0000 {
 				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI2>;
 				resets = <&rcc SPI2_R>;
+				dmas = <&hpdma 51 0x20 0x3012>,
+				       <&hpdma 52 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 23>;
 				status = "disabled";
 			};
@@ -257,6 +260,9 @@ spi3: spi@400c0000 {
 				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI3>;
 				resets = <&rcc SPI3_R>;
+				dmas = <&hpdma 53 0x20 0x3012>,
+				       <&hpdma 54 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 24>;
 				status = "disabled";
 			};
@@ -441,6 +447,9 @@ spi1: spi@40230000 {
 				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI1>;
 				resets = <&rcc SPI1_R>;
+				dmas = <&hpdma 49 0x20 0x3012>,
+				       <&hpdma 50 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 22>;
 				status = "disabled";
 			};
@@ -453,6 +462,9 @@ spi4: spi@40240000 {
 				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI4>;
 				resets = <&rcc SPI4_R>;
+				dmas = <&hpdma 55 0x20 0x3012>,
+				       <&hpdma 56 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 25>;
 				status = "disabled";
 			};
@@ -465,6 +477,9 @@ spi5: spi@40280000 {
 				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI5>;
 				resets = <&rcc SPI5_R>;
+				dmas = <&hpdma 57 0x20 0x3012>,
+				       <&hpdma 58 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 26>;
 				status = "disabled";
 			};
@@ -501,6 +516,9 @@ spi6: spi@40350000 {
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI6>;
 				resets = <&rcc SPI6_R>;
+				dmas = <&hpdma 59 0x20 0x3012>,
+				       <&hpdma 60 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 27>;
 				status = "disabled";
 			};
@@ -513,6 +531,9 @@ spi7: spi@40360000 {
 				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI7>;
 				resets = <&rcc SPI7_R>;
+				dmas = <&hpdma 61 0x20 0x3012>,
+				       <&hpdma 62 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 28>;
 				status = "disabled";
 			};
@@ -549,6 +570,9 @@ spi8: spi@46020000 {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI8>;
 				resets = <&rcc SPI8_R>;
+				dmas = <&hpdma 171 0x20 0x3012>,
+				       <&hpdma 172 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 29>;
 				status = "disabled";
 			};

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
