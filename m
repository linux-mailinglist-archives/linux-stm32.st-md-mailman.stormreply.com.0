Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 314E85305D8
	for <lists+linux-stm32@lfdr.de>; Sun, 22 May 2022 22:24:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBC2BC0C920;
	Sun, 22 May 2022 20:24:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78BF9C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 May 2022 20:24:21 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BC14D83D7F;
 Sun, 22 May 2022 22:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653251061;
 bh=Ic8/w3OOtXb7iCcg9t7Ekaeii7bOHkgfirgA95/l6mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FN12WRNLlIp6gZZhM/O6Ch3f/rmOdNJgxShdLsHRt0HREiYdckK9ll91bPKt0er2X
 V7qorTv30f8Cg9u576CvhjZZAPZjn+bX1a5fzfYUAhxKL36K+SK2M/nlWEF34P2SMz
 xoY+fHXpKXcyOaEAXQVy0XtNg+3LyqI6Pf3+oLHILCVAAP4Co6SjXElVmpXfxppT4X
 oUsKnyTIEfB46/3jQAzXzjFiQs3CknXy64eoDl6qP0ekWQkkbEyhMjHbrRIP7mQc+o
 XO9hySPvBzccrBWlPd8Y5SFgUsZKGTYJUYgLyG/EeqOEBKdHv4Xk/dz0mV7Q9rF7/J
 e69zPEK81zONw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 22 May 2022 22:24:04 +0200
Message-Id: <20220522202404.116369-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220522202404.116369-1-marex@denx.de>
References: <20220522202404.116369-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Add ST MIPID02 bindings
	to AV96
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

Add DT bindings for ST MIPID02 and DCMI to Avenger96 base DT.
Both the ST MIPID02 and DCMI are disabled by default, as the
AV96 camera module is optional.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 76c54b006d871..90933077d66de 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -126,6 +126,22 @@ adc2: adc@100 {
 	};
 };
 
+&dcmi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_c>;
+	pinctrl-1 = <&dcmi_sleep_pins_c>;
+	status = "disabled";
+
+	port {
+		dcmi_0: endpoint {
+			remote-endpoint = <&stmipi_2>;
+			bus-type = <5>;
+			bus-width = <8>;
+			pclk-sample = <0>;
+		};
+	};
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_c>;
@@ -219,6 +235,45 @@ &i2c2 {	/* X6 I2C2 */
 };
 
 &i2c4 {
+	stmipi: stmipi@14 {
+		compatible = "st,st-mipid02";
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&mco1_pins_a>;
+		pinctrl-1 = <&mco1_sleep_pins_a>;
+		reg = <0x14>;
+		clocks = <&rcc CK_MCO1>;
+		clock-names = "xclk";
+		assigned-clocks = <&rcc CK_MCO1>;
+		assigned-clock-parents = <&rcc CK_HSE>;
+		assigned-clock-rates = <24000000>;
+		VDDE-supply = <&v1v8>;
+		VDDIN-supply = <&v1v8>;
+		reset-gpios = <&gpioz 0 GPIO_ACTIVE_LOW>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				stmipi_0: endpoint {
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				stmipi_2: endpoint {
+					bus-width = <8>;
+					hsync-active = <0>;
+					vsync-active = <0>;
+					pclk-sample = <0>;
+					remote-endpoint = <&dcmi_0>;
+				};
+			};
+		};
+	};
+
 	hdmi-transmitter@3d {
 		compatible = "adi,adv7513";
 		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
