Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C09960D05
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 16:06:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 897C7C78021;
	Tue, 27 Aug 2024 14:06:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88953C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 14:06:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RBUMZg022307;
 Tue, 27 Aug 2024 16:06:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 JPuWythXlb2aVY0RmOdTDjEvW63AoOtJU+vMJ9SxB/M=; b=MqxKSR+pBAirOdE+
 oZ9E/nB499gvXdxFNx1SY5sBjIhwie9+Ea0MPjr5KSIcyaLYbKr9MA744KQ01fIL
 SOGTE+LTXD6vd5YtdaONDLBd5p5efX3a0Q++rYqXAyHutXgBc9qJ+fdrz804NIsb
 OwRaMro4pDWMo9O+HvyLiq+MkilQIwWgFxoagofFOAe8+Y7pGerRLH8kQLYYuZpZ
 is1tbhAYdqAZthuXpdBdUTYTJZZpriXl3Boz3zPjDiUAIxM2wqdF8QdnnaYudrf6
 ODoBq1Kgf6oKxEqPWwIzWj+/r3oQfzwdnuisKmCNkiNJvqf3/Zyv0tRBg6w+2+dW
 XAJ6XQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419e00rmp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Aug 2024 16:06:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C1B0F40050;
 Tue, 27 Aug 2024 16:05:44 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7462426C461;
 Tue, 27 Aug 2024 16:05:15 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:15 +0200
Received: from localhost (10.48.86.111) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 27 Aug
 2024 16:05:15 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Date: Tue, 27 Aug 2024 16:04:52 +0200
Message-ID: <20240827140455.345086-7-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827140455.345086-1-valentin.caron@foss.st.com>
References: <20240827140455.345086-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_08,2024-08-27_01,2024-05-17_01
Cc: devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/9] ARM: dts: stm32: add support of WLAN/BT
	on stm32mp135f-dk
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

From: Christophe Roullier <christophe.roullier@foss.st.com>

Add support of WLAN/BT Murata Type 1DX module:
- usart2 is used for Bluetooth interface
- sdmmc2 is used for WLAN (sdio) interface

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index ef33cbf3e601c..3a276589fef79 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -121,6 +121,19 @@ panel_in_rgb: endpoint {
 			};
 		};
 	};
+
+	v3v3_ao: v3v3-ao {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3_ao";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&mcp23017 11 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &adc_1 {
@@ -392,6 +405,30 @@ &sdmmc1 {
 	status = "okay";
 };
 
+/* Wifi */
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_clk_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_clk_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
+	non-removable;
+	cap-sdio-irq;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3_ao>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_lsco_pins_a>;
+	};
+};
+
 &spi5 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi5_pins_a>;
@@ -498,6 +535,14 @@ &usart2 {
 	pinctrl-2 = <&usart2_idle_pins_a>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		shutdown-gpios = <&mcp23017 13 GPIO_ACTIVE_HIGH>;
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+		vbat-supply = <&v3v3_ao>;
+		vddio-supply = <&v3v3_ao>;
+	};
 };
 
 &usbh_ehci {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
