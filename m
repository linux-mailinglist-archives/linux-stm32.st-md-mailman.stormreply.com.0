Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3B7A68E3
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 18:30:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 537F2C6C822;
	Tue, 19 Sep 2023 16:30:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F516C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 16:30:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38JCackI026620; Tue, 19 Sep 2023 18:30:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=6iKl5m3VTE4MFywY3FePq9e1gGc7GeLBCcA6aIZ4wWI=; b=T1
 +J1qP8bGXvMu+4CcYS4CGyVJ/tl5waTHAcKtwFpgkfriOu8O8Rgt+sjHxrkEiVbi
 RNNQvjnt4QnHIxMsBVnpDdpZ7gr+4tFGWeaDIo8XkKGBrKSGBZ2y1/noL/tVYUGj
 1nnqjLhv522ZyyqCDKl4JS4TwYoMs61KGl6CkaTsTKlHAavQz8NISJZkLrZyNFnT
 E6dqdyTdLGPsS9cRtEkRsLs9IJqcLxaS6UKAfhXakJaj0MY3lgLNiAwMCmTBY3tT
 Y5MxS6yFOWH/qhvWR4Dq/oun/0DrcnJcfHCtt62dV786WvB5uGJUmsu6srf5qxqH
 iFCYzPluTeoknKLMM2dw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t53pwuj9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 18:30:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4FB3C100059;
 Tue, 19 Sep 2023 18:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48219268467;
 Tue, 19 Sep 2023 18:30:40 +0200 (CEST)
Received: from localhost (10.252.1.15) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 18:30:40 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 19 Sep 2023 18:30:08 +0200
Message-ID: <20230919163009.203752-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919163009.203752-1-olivier.moysan@foss.st.com>
References: <20230919163009.203752-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.1.15]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_08,2023-09-19_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add pins muxing for sai1
	on stm32mp13
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

These pins are used for SAI1 on STM32MP13 Disco boards expansion
connector.
Pins mapping:
- EXP_GPIO18	SAI1_SCKA (PA4)
- EXP_GPIO19	SAI1_FSA  (PF11)
- EXP_GPIO20	SAI1_SDA  (PA5)
- EXP_GPIO21	SAI1_SDB  (PA0)

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 27e0c3826789..5e3e627ceb54 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -114,6 +114,27 @@ pins {
 		};
 	};
 
+	sai1a_pins_a: sai1a-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, AF12)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('A', 0, AF6)>, /* SAI1_SD_B */
+				 <STM32_PINMUX('A', 5, AF6)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('F', 11, AF6)>; /* SAI1_FS_A */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('A', 0, ANALOG)>, /* SAI1_SD_B */
+				 <STM32_PINMUX('A', 5, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('F', 11, ANALOG)>; /* SAI1_FS_A */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
