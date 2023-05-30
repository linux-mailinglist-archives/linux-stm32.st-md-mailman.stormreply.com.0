Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F3716079
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:49:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97D53C6A616;
	Tue, 30 May 2023 12:49:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 552D4C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:49:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UC4pcC018239; Tue, 30 May 2023 14:49:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=8v+0p59Typ3U3+A0Vdhp+6kA+itNhaM4lGhf6lg8Pug=;
 b=Q7cTmlKkkqwCgBvzhU5C/8I9Svhejus3dbXQlCIYD+iYNkc8EstyY4GdrF71Gg1gT2UG
 J/2yKSPLzcQ6MfmFQ/jRkSgOOd9LTF86iSonWucCIEbmsTFGhHaTjsahfk1+/BhHjxd/
 EM4jKQj0zrO3ZbSclkmPb/HhjYdTl3mS/Xp2v9hGvFN7w8m9iJiuddlaGrx3vKFnSn43
 1s9JSyFsl2vzWIB1Y8lVQO7JtoG6EkauEJ7O2zSJf81r6GgWSWSzp5z6ZaJRfSlZ8EH+
 wS+k7WZ6Fubw01qWqm6FfVgojSgh3FCPOMv0Kim1aSF/5RHV1nWVnMxtmaQ5iFQjI7iw LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qwdm5hsgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 14:49:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4172710002A;
 Tue, 30 May 2023 14:49:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 390622248D6;
 Tue, 30 May 2023 14:49:21 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 14:49:20 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 30 May 2023 14:45:37 +0200
Message-ID: <20230530124538.621760-10-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530124538.621760-1-olivier.moysan@foss.st.com>
References: <20230530124538.621760-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_09,2023-05-30_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 9/9] ARM: dts: stm32: Update to generic ADC
	channel binding on DHSOM systems
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

From: Marek Vasut <marex@denx.de>

The generic ADC channel binding is recommended over legacy one, update the
DT to the modern binding. No functional change. For further details, see
commit which adds the generic binding to STM32 ADC binding document:
'664b9879f56e ("dt-bindings: iio: stm32-adc: add generic channel binding")'

Signed-off-by: Marek Vasut <marex@denx.de>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  | 18 +++++----
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 38 +++++++++++++++----
 2 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index c06edd2eacb0..e61df23d361a 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -80,17 +80,19 @@ &adc {
 	vdda-supply = <&vdda>;
 	vref-supply = <&vdda>;
 	status = "okay";
+};
 
-	adc1: adc@0 {
-		st,min-sample-time-nsecs = <5000>;
-		st,adc-channels = <0>;
-		status = "okay";
+&adc1 {
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
 	};
+};
 
-	adc2: adc@100 {
-		st,adc-channels = <1>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+&adc2 {
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index cdd4902b59a9..0069ad75d55e 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -111,17 +111,39 @@ &adc {
 	vdda-supply = <&vdda>;
 	vref-supply = <&vdda>;
 	status = "okay";
+};
 
-	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+&adc1 {
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
 	};
 
-	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
-		status = "okay";
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@6 {
+		reg = <6>;
+		st,min-sample-time-ns = <5000>;
+	};
+};
+
+&adc2 {
+	channel@0 {
+		reg = <0>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@1 {
+		reg = <1>;
+		st,min-sample-time-ns = <5000>;
+	};
+
+	channel@2 {
+		reg = <2>;
+		st,min-sample-time-ns = <5000>;
 	};
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
