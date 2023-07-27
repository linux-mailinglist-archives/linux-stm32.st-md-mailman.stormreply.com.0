Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 565457656F0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 17:07:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18E5EC6B463;
	Thu, 27 Jul 2023 15:07:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF748C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 15:07:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RAGCGk027809; Thu, 27 Jul 2023 17:06:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=cHJNhS5VpKNo5Y4bSY2x6zUc/+E49ZZVtd0aUR299gM=;
 b=ve2AIh0qTQh8YWjBZD9RLiywztDKv6ciGlP7kjkD4DhKWNfj0l7SeS3tqY4PYr83bift
 /oWSNgEw8v1B/OZCH9yEHbO6A97N/4T2MgAscuGF9IBohhHb75XHhCdL8vx7iY3iNecg
 p7FLQB5a6etgQxJBt/wuzi/u3wIgJkrMZcSZjX8LHu/DCwDapvsqwfZKSpmEGcXjiN2Z
 DueUSzVd8qgcuxEJo6t+Ihx76bh/tGVRtFnYzWxUFm8PVRKctGm2J5usA8e4mwZvJuBs
 bWYckD7nTC4/xHTQjrW0Q2FKDl4qD/QVYe9V3T3GdxE9/a9+ybZfewAO+53RX10ZIK16 Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s3kn2b2ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 17:06:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE1A6100049;
 Thu, 27 Jul 2023 17:06:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B663E209BA8;
 Thu, 27 Jul 2023 17:06:47 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Jul
 2023 17:06:47 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Thu, 27 Jul 2023 17:03:20 +0200
Message-ID: <20230727150324.1157933-10-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727150324.1157933-1-olivier.moysan@foss.st.com>
References: <20230727150324.1157933-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [RFC v2 09/11] ARM: dts: stm32: adopt new dfsdm
	bindings on stm32mp151
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

Adapt STM32MP151 device tree to match DFSDM new bindings.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 61508917521c..338457357248 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -970,7 +970,8 @@ dfsdm: dfsdm@4400d000 {
 
 			dfsdm0: filter@0 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0>;
 				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 101 0x400 0x01>;
@@ -980,7 +981,8 @@ dfsdm0: filter@0 {
 
 			dfsdm1: filter@1 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <1>;
 				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 102 0x400 0x01>;
@@ -990,7 +992,8 @@ dfsdm1: filter@1 {
 
 			dfsdm2: filter@2 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <2>;
 				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 103 0x400 0x01>;
@@ -1000,7 +1003,8 @@ dfsdm2: filter@2 {
 
 			dfsdm3: filter@3 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <3>;
 				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 104 0x400 0x01>;
@@ -1010,7 +1014,8 @@ dfsdm3: filter@3 {
 
 			dfsdm4: filter@4 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <4>;
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 91 0x400 0x01>;
@@ -1020,7 +1025,8 @@ dfsdm4: filter@4 {
 
 			dfsdm5: filter@5 {
 				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <5>;
 				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 92 0x400 0x01>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
