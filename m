Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E735151A056
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 15:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACFF8C628AB;
	Wed,  4 May 2022 13:06:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 562A7C628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 13:06:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244AF0hI016186;
 Wed, 4 May 2022 15:06:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ebGEldA3FSxzjKP+0IoEsgqVdV2j6ezCK0sWg/HoQHE=;
 b=zJyiiAF94Zf8uKa13IiCR5sv9lvl9c2skYQ+DuNSw2ClfzCkR9pptSzSJwCJP/ljmOnF
 1xefXURZaa4NReuCEF4lzx95XlK6PL1A/bovCLXTTBQeQhyJ/030MOnPVvW2CPojlpwo
 Qi+O8m5Il95Bv1giY0D7JxJmiKnH/25/jwu9GfHuR0uun6JVdxape9PPeP8i03TuqsVZ
 XU44lt5bNhZ6lNa47axe4rQbA57/4itbUoyaGApMJrFQj2CZ3xcx6YDNDefyIltnPflR
 Ye2Xjx1rBShrXqhLhvLoMXe4NN8nfLhfqk39zI3zumHZS8LCAs+s1fbeDOVp29ik/xWu kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0m5a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 15:06:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5A8810002A;
 Wed,  4 May 2022 15:06:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEEE121FEAA;
 Wed,  4 May 2022 15:06:39 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May 2022 15:06:39
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Wed, 4 May 2022 15:06:17 +0200
Message-ID: <20220504130617.331290-5-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504130233.330983-1-valentin.caron@foss.st.com>
References: <20220504130233.330983-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_01,2022-02-23_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] ARM: dts: stm32: add RTC LSCO support on
	stm32mp135f-dk
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Add LSCO support on stm32mp135f-dk board. LSCO output is mapped on
RTC_OUT2_RMP (PI1), directly routed on LPO_IN pin of Wifi/Bluetooth
module.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 6 ++++++
 arch/arm/boot/dts/stm32mp135f-dk.dts     | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
index d2472cd8f1d0..0aaafd529404 100644
--- a/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp13-pinctrl.dtsi
@@ -6,6 +6,12 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	rtc_out2_rmp_pins_a: rtc-out2-rmp-pins-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 1, ANALOG)>; /* RTC_OUT2_RMP */
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins {
 			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index 09d6226d598f..de9fd89fce5c 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -12,6 +12,7 @@
 #include "stm32mp135.dtsi"
 #include "stm32mp13xf.dtsi"
 #include "stm32mp13-pinctrl.dtsi"
+#include <dt-bindings/rtc/rtc-stm32.h>
 
 / {
 	model = "STMicroelectronics STM32MP135F-DK Discovery Board";
@@ -63,6 +64,9 @@ &iwdg2 {
 };
 
 &rtc {
+	st,lsco = <RTC_OUT2_RMP>;
+	pinctrl-0 = <&rtc_out2_rmp_pins_a>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
