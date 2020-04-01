Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5309D19ACB5
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 15:23:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C5B7C36B0C;
	Wed,  1 Apr 2020 13:23:21 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A869C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:23:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sn2G17v8z1qs0H;
 Wed,  1 Apr 2020 15:23:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sn2G0rgVz1r0cV;
 Wed,  1 Apr 2020 15:23:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id IDV8ZoDYn8BP; Wed,  1 Apr 2020 15:23:17 +0200 (CEST)
X-Auth-Info: vx04MeeKdr7iZcb9l+WF5NBIRh+MGbJjzkahgixaHyU=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 15:23:16 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  1 Apr 2020 15:22:29 +0200
Message-Id: <20200401132237.60880-15-marex@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401132237.60880-1-marex@denx.de>
References: <20200401132237.60880-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V4 14/22] ARM: dts: stm32: Enable WiFi on AV96
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

The WiFi/Bluetooth SDIO chip is attached to SDMMC3 on AV96, describe it
in DT to make it available. Remove WiFi LED and turn it into a regulator,
because it is a GPIO controlling the WL_REG_ON input of the WiFi chip.
The LED is just an indicator connected to the same line, but not the
primary function.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: No change
V3: No change
V4: Rebase on stm32-next
---
 arch/arm/boot/dts/stm32mp157a-avenger96.dts | 38 +++++++++++++++++----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-avenger96.dts b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
index b29e26eedbea..bf21480b255e 100644
--- a/arch/arm/boot/dts/stm32mp157a-avenger96.dts
+++ b/arch/arm/boot/dts/stm32mp157a-avenger96.dts
@@ -65,13 +65,6 @@ led4 {
 		};
 
 		led5 {
-			label = "yellow:wifi";
-			gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "phy0tx";
-			default-state = "off";
-		};
-
-		led6 {
 			label = "blue:bt";
 			gpios = <&gpioz 6 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "bluetooth-power";
@@ -103,6 +96,17 @@ vdd_io: regulator-buck-io {
 		regulator-boot-on;
 		vin-supply = <&vdd>;
 	};
+
+	wlan_pwr: regulator-wlan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "wl-reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpios = <&gpioz 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &ethernet0 {
@@ -378,6 +382,26 @@ &sdmmc2 {
 	status = "okay";
 };
 
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_b>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_b>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_b>;
+	broken-cd;
+	non-removable;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&wlan_pwr>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
 &uart4 {
 	/* On Low speed expansion header */
 	label = "LS-UART1";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
