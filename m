Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B059989A0
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 16:31:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1231C71290;
	Thu, 10 Oct 2024 14:31:36 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35872C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 14:31:33 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A92Fas006182;
 Thu, 10 Oct 2024 16:31:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KH8nP8o/qes/Z0lwN5BroWJF926mtTX7phjDCx9kS2E=; b=nSA93HAXkZWV5JM1
 mT/sIvf83NaqDEfXZwfXkVlaS0VPBAAKgM5b6C49KNzrJxGIusadiCktEkkNXnnG
 oWYdBhSmLFhGFQdveS1QRQroHWa5jsvVivsa4mkWr5reUZPyjAdQk4YSr+P3E+sQ
 q851FJWbc7A4cK80EChr5i0L+R9zPKuqK80aKafNpWIIQMPEl1j/NtMWAjvrTU+g
 lWETU+iRKgaYsCNFcrEkmRw/yqSUI1x18/rsaCqU2lChgT+4UNFkTR7LmSj8cjXk
 b4mJVjwGvAyBuvCBY02weTTxZ65mZpo6SE7q3icvbKgZ/Rr/EHXqjtowEsO95tGv
 N7yx/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425w7xmw4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2024 16:31:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 570244005B;
 Thu, 10 Oct 2024 16:30:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36FC12A2FDD;
 Thu, 10 Oct 2024 16:28:14 +0200 (CEST)
Received: from localhost (10.252.31.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 10 Oct
 2024 16:28:13 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 10 Oct 2024 16:28:00 +0200
MIME-Version: 1.0
Message-ID: <20241010-dma3-mp25-updates-v1-10-adf0633981ea@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 10/11] arm64: dts: st: add DMA support on I2C
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

Add dmas and dma-names properties in i2c nodes of stm32mp251.dtsi to
enable DMA support.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 02fcb9fcff87ba9d5c1ecab0385e3a57cde31e2e..033da03d05a72c557dd81547fffa54eefed1e9cd 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -321,6 +321,9 @@ i2c1: i2c@40120000 {
 				resets = <&rcc I2C1_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 27 0x20 0x3012>,
+				       <&hpdma 28 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
 				status = "disabled";
 			};
@@ -334,6 +337,9 @@ i2c2: i2c@40130000 {
 				resets = <&rcc I2C2_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 30 0x20 0x3012>,
+				       <&hpdma 31 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
 				status = "disabled";
 			};
@@ -347,6 +353,9 @@ i2c3: i2c@40140000 {
 				resets = <&rcc I2C3_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 33 0x20 0x3012>,
+				       <&hpdma 34 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 43>;
 				status = "disabled";
 			};
@@ -360,6 +369,9 @@ i2c4: i2c@40150000 {
 				resets = <&rcc I2C4_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 36 0x20 0x3012>,
+				       <&hpdma 37 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 44>;
 				status = "disabled";
 			};
@@ -373,6 +385,9 @@ i2c5: i2c@40160000 {
 				resets = <&rcc I2C5_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 39 0x20 0x3012>,
+				       <&hpdma 40 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 45>;
 				status = "disabled";
 			};
@@ -386,6 +401,9 @@ i2c6: i2c@40170000 {
 				resets = <&rcc I2C6_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 42 0x20 0x3012>,
+				       <&hpdma 43 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 46>;
 				status = "disabled";
 			};
@@ -399,6 +417,9 @@ i2c7: i2c@40180000 {
 				resets = <&rcc I2C7_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 45 0x20 0x3012>,
+				       <&hpdma 46 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
 				status = "disabled";
 			};
@@ -544,6 +565,9 @@ i2c8: i2c@46040000 {
 				resets = <&rcc I2C8_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&hpdma 168 0x20 0x3012>,
+				       <&hpdma 169 0x20 0x3021>;
+				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
 				status = "disabled";
 			};

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
