Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D869989A5
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 16:31:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B01FC7801F;
	Thu, 10 Oct 2024 14:31:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC3EAC7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 14:31:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AE6oNQ014652;
 Thu, 10 Oct 2024 16:31:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vnJlgTm1gqjidTDkTZlQIM7j52C6ZHciLLrj+JNiIVA=; b=hNiHo6ohz4knEUA5
 +lLys73HhEupdjBrG49ArXSFWBR9lj8wnkQN9qGyY/RkbhuuqCNy/jI8tY110o3i
 k5ziWSN1xTrZRqD7r9Oin5OFVVgMl5ujn95AzpGadC6JUj3xUfFS0spEgJmrjPX0
 JJg/oULv1kTeZURerzNnAU2Utl5VQCOoft3Accw6QW5rq5vCfV31Lpbq2RgTOo74
 vM5IXqGMQsUA5jjmV9DIsdMiDvR8wzATvhQwVXMqvbxSNRbfut0iKyZgbOZMoDyE
 2OrIqfqdvT/GvARh0NDI7k0f0mnn3APJaGOvqCylTQfFAdJvQyfwZrn1U8/8Kb7u
 hoM1BQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425w9xcvjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 16:31:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5D11240092;
 Thu, 10 Oct 2024 16:30:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01BB42A2FE3;
 Thu, 10 Oct 2024 16:28:15 +0200 (CEST)
Received: from localhost (10.252.31.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 10 Oct
 2024 16:28:14 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 10 Oct 2024 16:28:01 +0200
MIME-Version: 1.0
Message-ID: <20241010-dma3-mp25-updates-v1-11-adf0633981ea@foss.st.com>
References: <20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com>
In-Reply-To: <20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.31.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 11/11] arm64: dts: st: add DMA support on SPI
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
index 033da03d05a72c557dd81547fffa54eefed1e9cd..0d3a736d4a77c7c02b1e4d0846682e3d2039cb2c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -248,6 +248,9 @@ spi2: spi@400b0000 {
 				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI2>;
 				resets = <&rcc SPI2_R>;
+				dmas = <&hpdma 51 0x20 0x3012>,
+				       <&hpdma 52 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 23>;
 				status = "disabled";
 			};
@@ -260,6 +263,9 @@ spi3: spi@400c0000 {
 				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI3>;
 				resets = <&rcc SPI3_R>;
+				dmas = <&hpdma 53 0x20 0x3012>,
+				       <&hpdma 54 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 24>;
 				status = "disabled";
 			};
@@ -444,6 +450,9 @@ spi1: spi@40230000 {
 				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI1>;
 				resets = <&rcc SPI1_R>;
+				dmas = <&hpdma 49 0x20 0x3012>,
+				       <&hpdma 50 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 22>;
 				status = "disabled";
 			};
@@ -456,6 +465,9 @@ spi4: spi@40240000 {
 				interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI4>;
 				resets = <&rcc SPI4_R>;
+				dmas = <&hpdma 55 0x20 0x3012>,
+				       <&hpdma 56 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 25>;
 				status = "disabled";
 			};
@@ -468,6 +480,9 @@ spi5: spi@40280000 {
 				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI5>;
 				resets = <&rcc SPI5_R>;
+				dmas = <&hpdma 57 0x20 0x3012>,
+				       <&hpdma 58 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 26>;
 				status = "disabled";
 			};
@@ -504,6 +519,9 @@ spi6: spi@40350000 {
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI6>;
 				resets = <&rcc SPI6_R>;
+				dmas = <&hpdma 59 0x20 0x3012>,
+				       <&hpdma 60 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 27>;
 				status = "disabled";
 			};
@@ -516,6 +534,9 @@ spi7: spi@40360000 {
 				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_SPI7>;
 				resets = <&rcc SPI7_R>;
+				dmas = <&hpdma 61 0x20 0x3012>,
+				       <&hpdma 62 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 28>;
 				status = "disabled";
 			};
@@ -552,6 +573,9 @@ spi8: spi@46020000 {
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
