Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EB74FF51
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:31:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC949C6B459;
	Wed, 12 Jul 2023 06:31:23 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 430C0C6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=2CrDY7R+Zqndz7jiijGinHpgv4VdmR4fNUdaajMT4/0=; b=ugsClXrOs2Jq8aOhW/ZNsplrCV
 ajlNlk5LcCPxEGCkQm1sQPRf7tYxGbAk0qQ18FnMvvvVsk18NiDdQ8zqE0chX1WHalBemICncDxZj
 X5LepyrwSXlixRF1wjF8H1LJx81rxnEk8gL15/MUaSxpzIVDzu9fISzwrn7SLaoWXzneg/2IyUt8X
 A/W/Wl8uklPLkxdWRMPlLqCo94fB3+2mhCgbajiYMvCMvMLmPFgmWUGhgh+73pQ5XAe6OOTGPTbxD
 CftWBpPDrwX3is4V1Z1iiEQO/WlqG6zw6V/Ljx5TFz5VUwMp1DHYjDEct8zD0W388NwTXU+Lw9s9a
 aYaapImw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJTN1-000AMn-3y; Wed, 12 Jul 2023 08:30:39 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qJTN0-00020e-Gz; Wed, 12 Jul 2023 08:30:38 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: a.fatoum@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 08:29:47 +0200
Message-Id: <20230712062954.2194505-2-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230712062954.2194505-1-sean@geanix.com>
References: <20230712062954.2194505-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26966/Tue Jul 11 09:28:31 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/8] ARM: dts: stm32: Add alternate pinmux
	for ldtc pins
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

Add another mux option for ltdc pins, this is used on Octavo OSD32MP1-RED
board.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index d79f89f37bc7..422db6dd466c 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -979,6 +979,81 @@ pins {
 		};
 	};
 
+	ltdc_pins_e: ltdc-4 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H',  2, AF14)>, /* LTDC_R0 */
+				 <STM32_PINMUX('H',  3, AF14)>, /* LTDC_R1 */
+				 <STM32_PINMUX('H',  8, AF14)>, /* LTDC_R2 */
+				 <STM32_PINMUX('H',  9, AF14)>, /* LTDC_R3 */
+				 <STM32_PINMUX('H', 10, AF14)>, /* LTDC_R4 */
+				 <STM32_PINMUX('C',  0, AF14)>, /* LTDC_R5 */
+				 <STM32_PINMUX('H', 12, AF14)>, /* LTDC_R6 */
+				 <STM32_PINMUX('E', 15, AF14)>, /* LTDC_R7 */
+				 <STM32_PINMUX('E', 14, AF13)>, /* LTDC_G0 */
+				 <STM32_PINMUX('E',  6, AF14)>, /* LTDC_G1 */
+				 <STM32_PINMUX('H', 13, AF14)>, /* LTDC_G2 */
+				 <STM32_PINMUX('H', 14, AF14)>, /* LTDC_G3 */
+				 <STM32_PINMUX('H',  4, AF14)>, /* LTDC_G4 */
+				 <STM32_PINMUX('I',  0, AF14)>, /* LTDC_G5 */
+				 <STM32_PINMUX('I',  1, AF14)>, /* LTDC_G6 */
+				 <STM32_PINMUX('I',  2, AF14)>, /* LTDC_G7 */
+				 <STM32_PINMUX('D',  9, AF14)>, /* LTDC_B0 */
+				 <STM32_PINMUX('G', 12, AF14)>, /* LTDC_B1 */
+				 <STM32_PINMUX('G', 10, AF14)>, /* LTDC_B2 */
+				 <STM32_PINMUX('D', 10, AF14)>, /* LTDC_B3 */
+				 <STM32_PINMUX('E', 12, AF14)>, /* LTDC_B4 */
+				 <STM32_PINMUX('A',  3, AF14)>, /* LTDC_B5 */
+				 <STM32_PINMUX('B',  8, AF14)>, /* LTDC_B6 */
+				 <STM32_PINMUX('D',  8, AF14)>, /* LTDC_B7 */
+				 <STM32_PINMUX('F', 10, AF14)>, /* LTDC_DE */
+				 <STM32_PINMUX('I',  9, AF14)>, /* LTDC_VSYNC */
+				 <STM32_PINMUX('I', 10, AF14)>; /* LTDC_HSYNC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 7, AF14)>; /* LTDC_CLK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	ltdc_sleep_pins_e: ltdc-sleep-4 {
+		pins {
+			pinmux = <STM32_PINMUX('H',  2, ANALOG)>, /* LTDC_R0 */
+				 <STM32_PINMUX('H',  3, ANALOG)>, /* LTDC_R1 */
+				 <STM32_PINMUX('H',  8, ANALOG)>, /* LTDC_R2 */
+				 <STM32_PINMUX('H',  9, ANALOG)>, /* LTDC_R3 */
+				 <STM32_PINMUX('H', 10, ANALOG)>, /* LTDC_R4 */
+				 <STM32_PINMUX('C',  0, ANALOG)>, /* LTDC_R5 */
+				 <STM32_PINMUX('H', 12, ANALOG)>, /* LTDC_R6 */
+				 <STM32_PINMUX('E', 15, ANALOG)>, /* LTDC_R7 */
+				 <STM32_PINMUX('D',  9, ANALOG)>, /* LTDC_B0 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LTDC_B1 */
+				 <STM32_PINMUX('G', 10, ANALOG)>, /* LTDC_B2 */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* LTDC_B3 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* LTDC_B4 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LTDC_B5 */
+				 <STM32_PINMUX('B',  8, ANALOG)>, /* LTDC_B6 */
+				 <STM32_PINMUX('D',  8, ANALOG)>, /* LTDC_B7 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* LTDC_G0 */
+				 <STM32_PINMUX('E',  6, ANALOG)>, /* LTDC_G1 */
+				 <STM32_PINMUX('H', 13, ANALOG)>, /* LTDC_G2 */
+				 <STM32_PINMUX('H', 14, ANALOG)>, /* LTDC_G3 */
+				 <STM32_PINMUX('H',  4, ANALOG)>, /* LTDC_G4 */
+				 <STM32_PINMUX('I',  0, ANALOG)>, /* LTDC_G5 */
+				 <STM32_PINMUX('I',  1, ANALOG)>, /* LTDC_G6 */
+				 <STM32_PINMUX('I',  2, ANALOG)>, /* LTDC_G7 */
+				 <STM32_PINMUX('F', 10, ANALOG)>, /* LTDC_DE */
+				 <STM32_PINMUX('I',  9, ANALOG)>, /* LTDC_VSYNC */
+				 <STM32_PINMUX('I', 10, ANALOG)>, /* LTDC_HSYNC */
+				 <STM32_PINMUX('G',  7, ANALOG)>; /* LTDC_CLK */
+		};
+	};
+
 	mco1_pins_a: mco1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 13, AF2)>; /* MCO1 */
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
