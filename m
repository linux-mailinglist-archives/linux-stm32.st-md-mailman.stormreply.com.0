Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55F70F7E3
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 15:41:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8B29C6B456;
	Wed, 24 May 2023 13:41:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29B4CC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 13:41:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ODABHs017492; Wed, 24 May 2023 15:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=R65kAiFBwFlbJ1i90X8uxO7VwNFCvDFlboVO+PjmHGY=;
 b=wn5A4SN5ZzUd4ND9wvgmiYyf/4STGsNAPMIZW5DZG5yLcw0MB26vQI8WzEoEIRjFfGj1
 jwzoMtl8gcPq2WCCFp/z2tJMvsDt5Q13K7HyP0JBCwScvEdBHWT3U0EMbx6FyieHvyiT
 rEdRxdLgfcmygalzNqkl1npZrGMICnvJlzfevMUSxWtBtXVhOJiInZxLYY1EmNjJkfPu
 VwgjfnK8KFUjKb8akPt3npsjS3WAT0wA3dikFXdkr+BO+Rq21XnSSZc26mfzuDjiHcpd
 MaKemfD6a+onRXqY1Ff4b40HdUC92BwOmzaOJsF1mIRI9n0W+yPj/G6fxVFoPvRgfE+C yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qrspnsaqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 May 2023 15:40:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB64810002A;
 Wed, 24 May 2023 15:40:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3173229A88;
 Wed, 24 May 2023 15:40:54 +0200 (CEST)
Received: from localhost (10.252.20.36) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 24 May
 2023 15:40:54 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 24 May 2023 15:39:16 +0200
Message-ID: <20230524133918.1439516-8-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
References: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.20.36]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_09,2023-05-24_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: adopt generic iio
	bindings for adc channels on dhcor-drc
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

Use STM32 ADC generic bindings instead of legacy bindings on
DHCOR DRC Compact board.

The STM32 ADC specific binding to declare channels has been deprecated,
hence adopt the generic IIO channels bindings, instead.
The STM32MP151 device tree now exposes internal channels using the
generic binding. This makes the change mandatory here to avoid a mixed
use of legacy and generic binding, which is not supported by the driver.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 .../dts/stm32mp15xx-dhcor-drc-compact.dtsi    | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
index 39af79dc654c..92d906bfd5d7 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-drc-compact.dtsi
@@ -57,15 +57,35 @@ &adc {	/* X11 ADC inputs */
 	status = "okay";
 
 	adc1: adc@0 {
-		st,adc-channels = <0 1 6>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@6 {
+			reg = <6>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 
 	adc2: adc@100 {
-		st,adc-channels = <0 1 2>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		channel@0 {
+			reg = <0>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@1 {
+			reg = <1>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@2 {
+			reg = <2>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
