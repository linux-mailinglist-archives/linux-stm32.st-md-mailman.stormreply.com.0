Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BBD9BC761
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 08:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648F3C78020;
	Tue,  5 Nov 2024 07:52:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEC1C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 07:52:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A549V48025479;
 Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 XnAbYm4VWUKZ0F1ePtL5cGK91Okpi3RKOo0VHnxT3ak=; b=AcmwMSynS2cZtSqX
 TJVEsdn86r9uuFsyt5bwqAuKA6eYiWjgAOVfMgvxnFfzjRIP8ZrWBtAp1vQfpKSG
 8Gtiy+06sRCuPSlE6TzCvrksd4ohbFRY/hoYZJ/cLfWAlGHmTro32+wdUhIPG+Dn
 6O5DA8Bv2erZBoZfKnn6HblXPNyX/38TCs/y1OmW5UGBeQUomZd4HAtY5PUCl1ai
 tjR37UNjcJngxsxG9yXO+8GdUw8boCcwu5ZbbZVS7UWiU/g28FPycM3/tF4S5uIH
 98N68fD+p/V2oFqS2IlHHz6XwQPCZX4MQOFcv5TXw5SzY6TiePr/DZDnWLn960rr
 +Zeqcg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtucu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE4F040050;
 Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 088E72513C1;
 Tue,  5 Nov 2024 08:49:37 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:17 +0100
MIME-Version: 1.0
Message-ID: <20241105-csi_dcmipp_mp25-v2-14-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 14/15] arm64: dts: st: add csi & dcmipp
 node in stm32mp25
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

Add nodes describing the csi and dcmipp controllers handling the
camera pipeline on the stm32mp25x.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 1167cf63d7e87aaa15c5c1ed70a9f6511fd818d4..6f8cabf2c5985f358689f15296300de24e9d9b25 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -518,6 +518,29 @@ i2c8: i2c@46040000 {
 				status = "disabled";
 			};
 
+			csi: csi@48020000 {
+				compatible = "st,stm32mp25-csi";
+				reg = <0x48020000 0x2000>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc CSI_R>;
+				clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>,
+					 <&rcc CK_KER_CSIPHY>;
+				clock-names = "pclk", "txesc", "csi2phy";
+				access-controllers = <&rifsc 86>;
+				status = "disabled";
+			};
+
+			dcmipp: dcmipp@48030000 {
+				compatible = "st,stm32mp25-dcmipp";
+				reg = <0x48030000 0x1000>;
+				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc DCMIPP_R>;
+				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
+				clock-names = "kclk", "mclk";
+				access-controllers = <&rifsc 87>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00353180>;

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
