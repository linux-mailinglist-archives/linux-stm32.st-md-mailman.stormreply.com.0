Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD59B41AAF
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:54:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57AA6C3FAD0;
	Wed,  3 Sep 2025 09:54:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D95FFC3F95F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:54:39 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5839j0hu017831;
 Wed, 3 Sep 2025 11:54:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zCAA24aLVQ5UCYBRXPQVDGjfntLRUibp0ZLGnQkGxKE=; b=GCTJxlivJZPLuLp7
 EXwKH9yLkzlTnqoMuX8htzGgM3tbXpv0MmStcP+WXp+1Wii6y/3RhdceufXeBoCm
 i0gOW7RuKzCnDyd5gDV8Mu/k4EqSjREBhPvxlYgN5rH0L8jHHHb6gvdQCVE1hgfO
 JPk5wmpMzInaVutthCcwzHsdA9FT9ykfeWWNwwcM0ugAKuGZsrYYxSG8vcPreL1T
 XGNKAjZM2FKt/Z+VjgaMM0nu1GdVZ9DKCKiul+cDvlIqO05lTC+ySC+lGnqLVzi/
 g/lebYtQkOepkvNAlX254oJE0/h4BypuOrySxUQfKIaMXC4VCXUZbPOwFsAL6PQy
 dGyh3Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vc8m5hxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 11:54:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1ED9140049;
 Wed,  3 Sep 2025 11:53:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00EC8373227;
 Wed,  3 Sep 2025 11:53:13 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 11:53:12 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 3 Sep 2025 11:53:02 +0200
MIME-Version: 1.0
Message-ID: <20250903-mp2_ethernet-v1-1-4105b0ad2344@foss.st.com>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
In-Reply-To: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/4] arm64: dts: st: add eth1 pins for
	stm32mp2x platforms
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

Eth1 ethernet controller is present on every stm32mp2x vendor boards.
Describe the pinctrl of eth1 for each of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 126 ++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 5ac9e72478dddb82be0ef7432d7e728932b2f4d6..3a2a82de48536ef4fe625b69a61e91f746b0d53f 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -6,6 +6,132 @@
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 
 &pinctrl {
+	eth1_mdio_pins_a: eth1-mdio-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 2, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	eth1_mdio_sleep_pins_a: eth1-mdio-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 0, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('F', 2, ANALOG)>; /* ETH_MDIO */
+		};
+	};
+
+	eth1_rgmii_pins_a: eth1-rgmii-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>; /* ETH_RGMII_GTX_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, ANALOG)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
+	eth1_rgmii_pins_b: eth1-rgmii-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF10)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, AF10)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, AF10)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, AF10)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, AF10)>; /* ETH_RGMII_TX_CTL */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, AF12)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, AF10)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, AF10)>; /* ETH_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('F', 1, AF10)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, AF10)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, AF10)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
+			bias-disable;
+		};
+		pins4 {
+			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+			bias-disable;
+		};
+	};
+
+	eth1_rgmii_sleep_pins_b: eth1-rgmii-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* ETH_RGMII_TXD0 */
+				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_TXD1 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('H', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('A', 13, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('H', 9, ANALOG)>, /* ETH_RGMII_CLK125 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* ETH_MDC */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('F', 1, ANALOG)>, /* ETH_RGMII_RXD0 */
+				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('A', 11, ANALOG)>, /* ETH_RGMII_RX_CTL */
+				 <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */
+		};
+	};
+
 	eth2_rgmii_pins_a: eth2-rgmii-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('C', 7, AF10)>, /* ETH_RGMII_TXD0 */

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
