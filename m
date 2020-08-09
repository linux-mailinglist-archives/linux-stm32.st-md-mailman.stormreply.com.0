Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4351E23FF4C
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 18:45:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 092B3C3FAD8;
	Sun,  9 Aug 2020 16:45:08 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41B78C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 16:45:07 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id kq25so7070122ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Aug 2020 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6GceXpV/IHfaJaRQd7xDBG5y4ojnE6AoHD31OqAqtA=;
 b=OTGomXpCHuuP4cJikykUt9HwkJ1qH/DYmiroDHoq79GuH2nYaC6VWSwlmPs6A7IcqQ
 NkAijzPA8TWdAjiW1nxx+XfNrq/ne/NmRj4RMxUeU4nGL+Lz+qHd1/Ylcw976OYJW9Ki
 HxVUA0/4lOm6zpMdf7p8G3xSex3M+XEO66SInaspMKIA4kbkk/Otm3DJsO0MqXE7C7R9
 nay6ZFl1tYQy77y1VMbT/kTDXQyaktoz12wPv0wodzcL1mxIz1YO50hI5teX2lzNM+RX
 M910zlR0wWkg2flqFyYtMQPvpv6n1Gzm2EoWUBFEab08SiFo0K+vBNjLpNdPsCtvqgsS
 Vypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6GceXpV/IHfaJaRQd7xDBG5y4ojnE6AoHD31OqAqtA=;
 b=OHmlapnOtDo/t0g/jjaeerOT9QZst/yaTVXayX6ZwUGKLNKk06SVMIcISu4McLUs+y
 Bcd6Z3ncshZy3Hr/k+DGZVERXteFOpr3PnbIfbp8McPncTmAmedRk0Yoy+Cd94wA91NO
 1pW+dsi7WGq3+EdTkOFeJGN1OWNWXvsHQJU35DOvRfsdzzuZy3c6iocWHNCvFe82Onrq
 Fpy2KZIK3nFtjScAdscBYOtrMytWuWsBeiHxEZezMGBWYcG5QrLKGOIhSLQ058ujn2cf
 SJT/W8tEG31NU859e68DiKU5gx3pbbaDg4NfAHu/BpKYYfxnY8lFYqIWe2h14J1ti4JY
 VomA==
X-Gm-Message-State: AOAM530Rwex2A5eXmNfmYEarQFXGvDqaInpdofc/LXKxHwoFpPF6XpSQ
 H0Pvd17sXkYKy/9wLD1z6tU=
X-Google-Smtp-Source: ABdhPJx638U9XwWalUsNbYtRix3dPdDZEnx9jVudX1ISGnEDPEQfCQSIgLL42eJdfbiPHZNQd9aYIQ==
X-Received: by 2002:a17:906:a84f:: with SMTP id
 dx15mr17924296ejb.377.1596991506778; 
 Sun, 09 Aug 2020 09:45:06 -0700 (PDT)
Received: from blackhead.home ([2a01:112f:a1c:7900:7316:ce1e:7b0b:6bd7])
 by smtp.gmail.com with ESMTPSA id b24sm10423215edn.33.2020.08.09.09.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 09:45:06 -0700 (PDT)
From: Marcin Sloniewski <marcin.sloniewski@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sun,  9 Aug 2020 18:44:50 +0200
Message-Id: <20200809164450.289731-3-marcin.sloniewski@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
References: <20200809164450.289731-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Cc: robh@kernel.org, kuninori.morimoto.gx@renesas.com, arnd@arndb.de,
 mani@kernel.org, allen.chen@ite.com.tw, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 marcin.sloniewski@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 mcoquelin.stm32@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 3/3] ARM: dts: stm32: add initial support
	for stm32mp157-odyssey board
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

Add support for Seeed Studio's stm32mp157c odyssey board.
Board consists of SoM with stm32mp157c with 4GB eMMC and 512 MB DDR3 RAM
and carrier board with USB and ETH interfaces, SD card connector,
wifi and BT chip AP6236.

In this patch only basic kernel boot is supported and interfacing
SD card and on-board eMMC.

Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
---

Changes in v7:
- fix eth: added clock assignement for phy.
  It gets clock from PLL4_P which must be configured
  in u-boot/ATF as stmicroelectronics suggests.

Changes in v6:
- add reset pin for eth phy
- move pinctrl for sdmmc2 to stm32mp15-pinctrl.dtsi

Changes in v5:
- fix schema for board's dts

Changes in v4:
- add seeed,stm32mp157c-odyssey-som in compatible
  for carrier board
- fix sdmmc2 interface by changing one of the pins
  to use
- change eth phy address to 7

Changes in v3:
- fix compilation on tip of stm32-next
  due to change in names for pinctrl
- fix deprecated binding for led node
- fix redundant "okay" statuses
- add phy part number for eth in comment

Changes in v2:
- add new odyssey dts to Makefile

 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  18 ++
 .../arm/boot/dts/stm32mp157c-odyssey-som.dtsi | 276 ++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-odyssey.dts     |  80 +++++
 4 files changed, 376 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
 create mode 100644 arch/arm/boot/dts/stm32mp157c-odyssey.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..f4a43a9420f1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1056,7 +1056,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp157c-dk2.dtb \
 	stm32mp157c-ed1.dtb \
 	stm32mp157c-ev1.dtb \
-	stm32mp157c-lxa-mc1.dtb
+	stm32mp157c-lxa-mc1.dtb \
+	stm32mp157c-odyssey.dtb
 dtb-$(CONFIG_MACH_SUN4I) += \
 	sun4i-a10-a1000.dtb \
 	sun4i-a10-ba10-tvbox.dtb \
diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index b5a66429670c..a47eaecbde42 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1437,6 +1437,24 @@ pins {
 		};
 	};
 
+	sdmmc2_d47_pins_d: sdmmc2-d47-3 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
+		};
+	};
+
+	sdmmc2_d47_sleep_pins_d: sdmmc2-d47-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('C', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	sdmmc3_b4_pins_a: sdmmc3-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
new file mode 100644
index 000000000000..6cf49a0a9e69
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+	model = "Seeed Studio Odyssey-STM32MP157C SOM";
+	compatible = "seeed,stm32mp157c-odyssey-som", "st,stm32mp157";
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+	};
+
+	led {
+		compatible = "gpio-leds";
+		led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpiog 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+			ldo1-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo6-supply = <&v3v3>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_audio: ldo1 {
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+			};
+
+			v3v3_hdmi: ldo2 {
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+			vdda: ldo5 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v2_hdmi: ldo6 {
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			 bst_out: boost {
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			 };
+
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+			 };
+
+			 vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge;
+			 };
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_d>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_d>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_d>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&v3v3>;
+	mmc-ddr-3_3v;
+	status = "okay";
+};
+
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
new file mode 100644
index 000000000000..a7ffec8f1516
--- /dev/null
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 Marcin Sloniewski <marcin.sloniewski@gmail.com>.
+ */
+
+/dts-v1/;
+
+#include "stm32mp157c-odyssey-som.dtsi"
+
+/ {
+	model = "Seeed Studio Odyssey-STM32MP157C Board";
+	compatible = "seeed,stm32mp157c-odyssey",
+		     "seeed,stm32mp157c-odyssey-som", "st,stm32mp157";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+	assigned-clocks = <&rcc ETHCK_K>, <&rcc PLL4_P>;
+	assigned-clock-parents = <&rcc PLL4_P>;
+	assigned-clock-rates = <125000000>; /* Clock PLL4 to 750Mhz in ATF/U-Boot */
+	st,eth-clk-sel;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@7 { /* KSZ9031RN */
+			reg = <7>;
+			reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>; /* ETH_RST# */
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
+
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
