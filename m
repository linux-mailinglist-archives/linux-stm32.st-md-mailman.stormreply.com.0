Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E24900014
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 12:02:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2002C7129F;
	Fri,  7 Jun 2024 10:02:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02D63C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 10:02:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791lAU009506;
 Fri, 7 Jun 2024 12:01:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1Q35dkt89KWo1ea1imWMRpqWMEk/sfn0A6SfaG1T7t4=; b=T73Ux/mMrIsPQ8kA
 cpwacEtniq9kmvZj+gKHQTK17w0fptIdqHw9QZWZILI5kKbcmUuYhW1aFWH790Dm
 SrLW91zyDR3svp/SqTcHwBkZaYqjltjm2Oq0pVF8mPoxQNT1285z9c5Wx1VsfZ+T
 Thn8xG2UUtXRIAdee14/WocOL8gWE3tRfQ1z870y45s+NBRTadr5H1bjZOLcmDcu
 VJ1hQTYkrxdtPu9s/T8yGNkt+s3cNLOdue6rr9RXEn4iB/PZv6PwVxyElOKA2iaF
 gmZgCOhzNsIdurPDQmkBSig3QBLnxLKQxDIZzbl2hiz/mf88NcjHeZ5acQHZKlZ1
 NxIk1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw91swqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2024 12:01:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8AF2240045;
 Fri,  7 Jun 2024 12:01:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4FA9214D0E;
 Fri,  7 Jun 2024 12:00:29 +0200 (CEST)
Received: from localhost (10.252.19.205) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 12:00:28 +0200
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
Date: Fri, 7 Jun 2024 11:57:52 +0200
Message-ID: <20240607095754.265105-11-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607095754.265105-1-christophe.roullier@foss.st.com>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.19.205]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 10/12] ARM: dts: stm32: add ethernet1/2
	RMII pins for STM32MP13F-DK board
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

Those pins are used for Ethernet 1 and 2 on STM32MP13F-DK board.
ethernet1: RMII with crystal.
ethernet2: RMII without crystal.
Add analog gpio pin configuration ("sleep") to manage power mode on
stm32mp13.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 71 +++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 32c5d8a1e06ac..7f72c62da0a64 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -13,6 +13,77 @@ pins {
 		};
 	};
 
+	eth1_rmii_pins_a: eth1-rmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 13, AF11)>, /* ETH_RMII_TXD0 */
+				 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RMII_TXD1 */
+				 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RMII_TX_EN */
+				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RMII_REF_CLK */
+				 <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RMII_RXD0 */
+				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RMII_RXD1 */
+				 <STM32_PINMUX('C', 1, AF10)>; /* ETH_RMII_CRS_DV */
+			bias-disable;
+		};
+
+	};
+
+	eth1_rmii_sleep_pins_a: eth1-rmii-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RMII_TXD0 */
+				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RMII_TXD1 */
+				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RMII_TX_EN */
+				 <STM32_PINMUX('A', 1, ANALOG)>, /* ETH_RMII_REF_CLK */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RMII_RXD0 */
+				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RMII_RXD1 */
+				 <STM32_PINMUX('C', 1, ANALOG)>; /* ETH_RMII_CRS_DV */
+		};
+	};
+
+	eth2_rmii_pins_a: eth2-rmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, AF11)>, /* ETH_RMII_TXD0 */
+				 <STM32_PINMUX('G', 11, AF10)>, /* ETH_RMII_TXD1 */
+				 <STM32_PINMUX('G', 8, AF13)>, /* ETH_RMII_ETHCK */
+				 <STM32_PINMUX('F', 6, AF11)>, /* ETH_RMII_TX_EN */
+				 <STM32_PINMUX('B', 2, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF11)>, /* ETH_RMII_RXD0 */
+				 <STM32_PINMUX('E', 2, AF10)>, /* ETH_RMII_RXD1 */
+				 <STM32_PINMUX('A', 12, AF11)>; /* ETH_RMII_CRS_DV */
+			bias-disable;
+		};
+	};
+
+	eth2_rmii_sleep_pins_a: eth2-rmii-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RMII_TXD0 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RMII_TXD1 */
+				 <STM32_PINMUX('G', 8, ANALOG)>, /* ETH_RMII_ETHCK */
+				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RMII_TX_EN */
+				 <STM32_PINMUX('B', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RMII_RXD0 */
+				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RMII_RXD1 */
+				 <STM32_PINMUX('A', 12, ANALOG)>; /* ETH_RMII_CRS_DV */
+		};
+	};
+
 	i2c1_pins_a: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
