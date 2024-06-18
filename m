Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308190C56F
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 11:39:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A959C78006;
	Tue, 18 Jun 2024 09:39:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B2EC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 09:39:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I6hfVY011275;
 Tue, 18 Jun 2024 11:37:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 w65QGBULGaCNhn/1VSBB1a/kt6/SrVicqQc8LXdTK3k=; b=NeZpzrUcL/QrYbdy
 iflO2+gLzMTAuw7sT2IC8mRDb48LOStKUofD5K4SWiOQSZsA8kQRmoGnRL4H0WBJ
 bXQi+xMKvdcXRnl0M5e3jq4Y0yOPlzbZ1jdbJbPNk/QLfeNVZjhAVqu55r4T6YXM
 WHdbjdtpiCj5p2gnQr0y4Ub/W176HQaseu/2JUlQTZA+VfocxvJHAX4gzy9jvnYc
 Kf5r2AMVjQcGfBRd5JRaI9R1hbSquYQMXHAhSKcwdBf7pzwbcDev+axt1WDvtni3
 5utFKNTzV2WbHGlFN85IKS9JGVLHB57+smuUUOfVf4kHUDHwWB/oZFNQ2gOy64b5
 WRlpeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys035jeea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 11:37:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C145740044;
 Tue, 18 Jun 2024 11:36:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F0EE2138E2;
 Tue, 18 Jun 2024 11:35:40 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 18 Jun
 2024 11:35:37 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Tue, 18 Jun 2024 11:35:26 +0200
Message-ID: <20240618093527.318239-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618093527.318239-1-christophe.roullier@foss.st.com>
References: <20240618093527.318239-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] arm64: dts: st: add eth2 pinctrl entries
	in stm32mp25-pinctrl.dtsi
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

Add pinctrl entry related to ETH2 in stm32mp25-pinctrl.dtsi
ethernet2: RGMII with crystal.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 7a82896dcbf6..9b2512ad197f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,65 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	eth2_rgmii_pins_a: eth2-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 8, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 9, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('C', 10, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('C', 4, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('F', 7, AF10)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('C', 6, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('C', 5, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('G', 0, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 12, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('F', 9, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins5 {
+			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 8, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('C', 9, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('F', 8, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('C', 6, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 0, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 12, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('F', 9, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('C', 3, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('F', 6, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
 	i2c2_pins_a: i2c2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('B', 5, AF9)>, /* I2C2_SCL */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
