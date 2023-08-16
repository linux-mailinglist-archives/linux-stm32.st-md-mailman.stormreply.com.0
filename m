Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B477E17D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 14:25:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D01E7C6C826;
	Wed, 16 Aug 2023 12:25:22 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D795FC6C823
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=HLDMsghpnw66dVGozGoVM7O7yXEfpJtkxJJsW2ConuQ=; b=SE5ILUjE5BWyEpZgseEuUzLLFu
 v84lmpwj5VIqp+oAkeyIHbKU94ToWXNp/YJh14Mj69gVlXpVNt9tKvVrXmVzaXWenmFOHibyQqTf+
 HvKwU0IkPHS5lfkyu+9fKK4xMdBbbvVAexufZnVun7VHQyKOJVA8yVkp+UYiI2YXylJ+4u7mbohqO
 oNSddsBfu+mBZTgxqE8QBCJvo5DkYLB3ztmMR2IaCf/RFWsTt+QsRkOKqf8zOSpq76fBprbUfU1fB
 oSS0Njo5zidM1OWyk1aZ8IJh49XYHRutWpPDdbzW/WoE5XuoC/B63tRIJQo2kpNVaOkllB9z6Mwsq
 CEgrMuDA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWFaG-000NAw-HO; Wed, 16 Aug 2023 14:25:08 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qWFaF-000HIl-L1; Wed, 16 Aug 2023 14:25:07 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: l.goehrs@pengutronix.de, a.fatoum@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 16 Aug 2023 14:24:22 +0200
Message-ID: <20230816122435.3153513-2-sean@geanix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816122435.3153513-1-sean@geanix.com>
References: <20230816122435.3153513-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27002/Wed Aug 16 09:38:26 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 2/9] ARM: dts: stm32: Add alternate pinmux
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
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 92726ad7285f..5de4ec547411 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -1080,6 +1080,81 @@ pins {
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
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
