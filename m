Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F447917EE
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 15:22:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B57FC6B455;
	Mon,  4 Sep 2023 13:22:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D70C5C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 13:22:40 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3848S2Sx018205; Mon, 4 Sep 2023 15:22:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=sds2aw8k/eQ1Ow51xrxMHW2Kyecijo2t4QiB+94X3Yc=; b=I/
 f0nqTVamCWX8cx7FVSiZv3r+x4L+uBWd5cAJburKGZujG4iioE11ZN9hxlJKTvbn
 91XInEW17nY6QUICoGChHfaXi4gzlCt1ByaZPxvGnFWrc6Ky8fCWuieAv4IhSb2K
 dmjuE80D4UTS1P94npfMn5q6G1ivrjdoK/3s+emLdN8xLatNiPuglx79o7YLk8er
 hpSVP6KWLDqa6/dYz5xTe2KzQZBD5XV0zgk1KfStlVioxIKMuwbceIlE2Fw+sfId
 F1vzRnv2WmvvAIR5XRkXQDLjhwx5c6xo0qh9+hgAwgUi6j2HCQRrr18xPHiOe4Om
 LxNJvxzWbEZasSVTgHfQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svg0hd7yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Sep 2023 15:22:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E841B100058;
 Mon,  4 Sep 2023 15:22:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCA71229A98;
 Mon,  4 Sep 2023 15:22:32 +0200 (CEST)
Received: from localhost (10.201.20.125) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 4 Sep
 2023 15:22:32 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Date: Mon, 4 Sep 2023 15:22:10 +0200
Message-ID: <20230904132212.157405-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904132212.157405-1-yann.gautier@foss.st.com>
References: <20230904132212.157405-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.125]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] arm64: dts: st: add sdmmc1 node in
	stm32mp251 SoC file
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

The SDMMC1 peripheral is used for SD-cards (default on ST boards), or
eMMC cards. For the moment it uses the fixed clock ck_flexgen_51, until
clock driver is available.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 5268a43218415..d7cb05d534ac9 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -119,6 +119,19 @@ usart2: serial@400e0000 {
 				clocks = <&ck_flexgen_08>;
 				status = "disabled";
 			};
+
+			sdmmc1: mmc@48220000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48220000 0x400>, <0x44230400 0x8>;
+				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ck_flexgen_51>;
+				clock-names = "apb_pclk";
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				status = "disabled";
+			};
 		};
 
 		syscfg: syscon@44230000 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
