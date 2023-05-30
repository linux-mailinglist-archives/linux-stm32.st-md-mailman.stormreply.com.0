Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD171604C
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:46:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D184CC6A616;
	Tue, 30 May 2023 12:46:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C522C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:46:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U9eCAR001514; Tue, 30 May 2023 14:46:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=FN/jL3ZpxnraHfsa8vk35518WADwt4pWVusBTGPVWUU=;
 b=HDHpvLmzqfBxQ8bmGwt/k3Aa4A6uY1kdBtGfzAxzJ64mTdMzKn0W5+m3MVdeXjNB7Opc
 o32PlkDc8Kymi8UmLOYW5E/l74sB1I0GrBfNH2n1E85bkLo0CzMMO5WS0G46GQUTtxca
 0yPEA85lgwgYFt736LvQSwal27F5o+3dPIfu7Nws/Y4odX7s2yaYLf+ovQ2wGqZwGj06
 3bH3b/u9vbql12y7mYlxNoibsYinQFE+mD8l9hAND1Tt/ttX4uO2iSS0kuUFmNi+nplZ
 +wpeWNZ5rymkmtVmZQ4mkDcG9jKnsgRPccQbfQjOPJvIAISyj1jsyY6sLJkixhfAW1Un zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqe13m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 14:46:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32269100034;
 Tue, 30 May 2023 14:46:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BB912248D8;
 Tue, 30 May 2023 14:46:13 +0200 (CEST)
Received: from localhost (10.201.20.178) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 14:46:12 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 30 May 2023 14:45:29 +0200
Message-ID: <20230530124538.621760-2-olivier.moysan@foss.st.com>
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
Subject: [Linux-stm32] [PATCH v2 1/9] ARM: dts: stm32: add adc internal
	channels to stm32mp15
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

Add STM32 ADC2 internal channels VREFINT and VDDCORE to STM32MP15x SoCs.
VBAT internal channel is not defined by default in SoC DT, and
has be defined in board DT when needed, instead. This avoids unwanted
current consumption on battery, when ADC conversions are performed
on any other channels.

The internal channels are defined in STM32MP15 SoC DT according to the
generic IIO channel bindings. The STM32 driver does not support a mixed
use of legacy and generic channels. When generic channels are defined,
legacy channels are ignored. This involves that the board device trees
using legacy bindings for ADC2, have to be reworked.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bf3830dca742..7b360ee1ba2b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1093,6 +1093,8 @@ adc: adc@48003000 {
 			adc1: adc@0 {
 				compatible = "st,stm32mp1-adc";
 				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x0>;
 				interrupt-parent = <&adc>;
 				interrupts = <0>;
@@ -1104,12 +1106,22 @@ adc1: adc@0 {
 			adc2: adc@100 {
 				compatible = "st,stm32mp1-adc";
 				#io-channel-cells = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x100>;
 				interrupt-parent = <&adc>;
 				interrupts = <1>;
 				dmas = <&dmamux1 10 0x400 0x01>;
 				dma-names = "rx";
 				status = "disabled";
+				channel@13 {
+					reg = <13>;
+					label = "vrefint";
+				};
+				channel@14 {
+					reg = <14>;
+					label = "vddcore";
+				};
 			};
 		};
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
