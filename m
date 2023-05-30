Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EB71605A
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:47:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18ADDC6A613;
	Tue, 30 May 2023 12:47:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1866C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:47:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U9eA8k001487; Tue, 30 May 2023 14:47:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=cO/FJ+AZFp2lr5ucdDhnQHBCcBeeC19QRXJP3967DQE=;
 b=fmJr4z0L8/dwUgCjtegBSjgwX4cJv4dQcMDTNCg/X7YsCuPK704zE7ox3fZ7lzLKIkjW
 a2xDcdLiGTsSpiyuxJrbmvzupdk/4aNNNAVTLIHeIVb0jv1vYNJb9FlgNtWMxtKxKvmx
 P2ezOtCsWpyBXG+WheTiwYzADfxouVczkDGzy5FiR2VTMFtRKWH6upwJyqeCjTHHc+zg
 517um7tAEcog0mDbChOC80YaJs9V0+j2YeTUPaRUsREb/aPN/bL2Vo9TwSO6I7OjsKQh
 APHwRJnGSwkU8rdNyqZslxs+CRBlNwsoBMRf0v6fZnnieDCldzDsPmjrPbeyFkcxjjVt Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqe13t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 14:47:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 192F110002A;
 Tue, 30 May 2023 14:47:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 118192248D6;
 Tue, 30 May 2023 14:47:17 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 14:47:16 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 30 May 2023 14:45:32 +0200
Message-ID: <20230530124538.621760-5-olivier.moysan@foss.st.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 4/9] ARM: dts: stm32: enable adc on
	stm32mp15xx-dkx boards
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

U-Boot enables ADC1&2 to support USB power measurement and ADC
calibration on STM32MP15x Disco boards.
When leaving U-boot the ADCs do not return to power down state
to keep ADC linear calibration available for kernel.
Enable ADC1&2 by default on STM32MP15xx-DKx boards to align kernel
DT with Uboot. This avoids to shutdown the ADCs VDDA, while the
ADCs are not in power down.

Use STM32 ADC generic bindings instead of legacy bindings on
STM32MP15xx-DKx boards.

The ADC pins on Arduino connector are not set by default.
These pins are added in A7 Disco example DTs only.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 29 ++++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index a6e2e20f12fa..e78ba956b9d0 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -93,28 +93,39 @@ vin: vin {
 
 &adc {
 	pinctrl-names = "default";
-	pinctrl-0 = <&adc12_ain_pins_a>, <&adc12_usb_cc_pins_a>;
+	pinctrl-0 = <&adc12_usb_cc_pins_a>;
 	vdd-supply = <&vdd>;
 	vdda-supply = <&vdd>;
 	vref-supply = <&vrefbuf>;
-	status = "disabled";
+	status = "okay";
 	adc1: adc@0 {
+		status = "okay";
 		/*
 		 * Type-C USB_PWR_CC1 & USB_PWR_CC2 on in18 & in19.
 		 * Use at least 5 * RC time, e.g. 5 * (Rp + Rd) * C:
 		 * 5 * (56 + 47kOhms) * 5pF => 2.5us.
 		 * Use arbitrary margin here (e.g. 5us).
 		 */
-		st,min-sample-time-nsecs = <5000>;
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 6 13 18 19>;
-		status = "okay";
+		channel@18 {
+			reg = <18>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@19 {
+			reg = <19>;
+			st,min-sample-time-ns = <5000>;
+		};
 	};
 	adc2: adc@100 {
-		/* AIN connector, USB Type-C CC1 & CC2 */
-		st,adc-channels = <0 1 2 6 18 19>;
-		st,min-sample-time-nsecs = <5000>;
 		status = "okay";
+		/* USB Type-C CC1 & CC2 */
+		channel@18 {
+			reg = <18>;
+			st,min-sample-time-ns = <5000>;
+		};
+		channel@19 {
+			reg = <19>;
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
