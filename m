Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AEDA3B311
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 09:03:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2DEDC78F99;
	Wed, 19 Feb 2025 08:03:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFAB9C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 08:03:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J4sOoV025662;
 Wed, 19 Feb 2025 09:03:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vt89S6pzijLj7oWLrPzmzdiGrX2lA3/klO9FWSjgKdY=; b=ayGEBCbPex0KsWbM
 eSk/mLZgXLfLsgxA7nJCjE01ShXtuBxxz8ruOrlOIckev9J75nW5NfeWsRwLV9+1
 JjepdrY+x6YRy+XeFPshfdxOqDQ2rVYHlqOgYcv6EGj9VBLfpJd4k/uFL7VOOb61
 kWCnzeoxuQ91YDJn5NesmrAWgy46rp1SjAn+WZxwg8hNN8wK2gSIFAUkJwXlPPDS
 ZHeotr9gfXUEUcSYqFU6UQdSUsjLY9Kxu6cN88m8QTh1AAp/RpKOBcGvA7ydFP5f
 OJBlRB5mWzqDzQbQuOOmUxnPodOhkitSjyn88UZXlRC/QkzVXanQiKFph+PZVcp0
 TjkuYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44vyyna8re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 09:03:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7A55540049;
 Wed, 19 Feb 2025 09:02:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17FC043E477;
 Wed, 19 Feb 2025 09:01:17 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 09:01:16 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Wed, 19 Feb 2025 09:00:57 +0100
Message-ID: <20250219080059.367045-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250219080059.367045-1-patrice.chotard@foss.st.com>
References: <20250219080059.367045-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 6/8] arm64: dts: st: Add ospi port1 pinctrl
	entries in stm32mp25-pinctrl.dtsi
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add pinctrl entry related to OSPI's port1 in stm32mp25-pinctrl.dtsi

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 8fdd5f020425..cf5be316de26 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -101,6 +101,57 @@ pins2 {
 		};
 	};
 
+	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	ospi_port1_clk_sleep_pins_a: ospi-port1-clk-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 0, ANALOG)>; /* OSPI1_CLK */
+		};
+	};
+
+	ospi_port1_cs0_pins_a: ospi-port1-cs0-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, AF10)>; /* OSPI_NCS0 */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	ospi_port1_cs0_sleep_pins_a: ospi-port1-cs0-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, ANALOG)>; /* OSPI_NCS0 */
+		};
+	};
+
+	ospi_port1_io03_pins_a: ospi-port1-io03-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF10)>, /* OSPI_IO0 */
+				 <STM32_PINMUX('D', 5, AF10)>, /* OSPI_IO1 */
+				 <STM32_PINMUX('D', 6, AF10)>, /* OSPI_IO2 */
+				 <STM32_PINMUX('D', 7, AF10)>; /* OSPI_IO3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	ospi_port1_io03_sleep_pins_a: ospi-port1-io03-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>, /* OSPI_IO0 */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* OSPI_IO1 */
+				 <STM32_PINMUX('D', 6, ANALOG)>, /* OSPI_IO2 */
+				 <STM32_PINMUX('D', 7, ANALOG)>; /* OSPI_IO3 */
+		};
+	};
+
 	sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
