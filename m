Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61268A9E083
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A6D3C78F94;
	Sun, 27 Apr 2025 07:44:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50F54C78F90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so24287475e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739860; x=1746344660;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
 b=nAACX7BP9doRiWfHnUDQfVXk3SvAC5hz/bI2kfKUBZAnZkRlLPs5ZxH0ggsM38rs9U
 En4QrE1SH8btyIG5ezcyNcuaucbZkD6InWStRYnj0Ovm8SF33NO9cOK/ihfySaGweUKs
 YeTh2eHBxdA4OzKzF6fAEo/dk4gn2wYdD1jdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739860; x=1746344660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
 b=M5GEcfBfLLOBzULUISz0oKbn9Nff6tpcQ5uq8jIiVVREOdcTBkmzv/Aa0wC12TlsDy
 b4iMxvmmxZ+B3xpDzNZZdqY6gGmoLW2KLjhEwzk51uw301/kOpN6p4edQowvtrZVEmdY
 A43V/2svFU7OXhrvlmMsvxChAL3wOjrmWj2hHzdz2D1vgHWMsgOExax8fkKpTxwUSqAQ
 gxSDj2sNJdkoxQVqRSt2zCCR5m58HnzD3yN82hoeUiNYzu+zwuwNn8dQMTF4ol8/21Ys
 NrjgS3q/Bw4vb2KauQpLSDp44fajnmirGolwjPxoGKQkHU7YhMzlBUJpbTy/ZNo5u+DL
 7Gyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzlGMZiL7WGQv7FIbS8IxeqckqSf9gu76nCjKGHd8MT0dI8zjSaDwe0Hptlv8xfl7+5Gv4gFdTLV/3IQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwgFYlClUWMi3tG71w2qMqZgQh3R07p3nsMRBy3vHxpAiC/2Z+9
 MyuQku2DWEgJfRT12yNPECEcMd/IyIsUmDftF0n/vhhdKcSH7HI6ldYmavo33ME=
X-Gm-Gg: ASbGncsNpk/qawgavMKxIaY3+l9aWCNP//aCfn7Gv5jYBn7iXPA2K3mNA+B2rY+ftew
 2LV3bvKbxaQ94nDg7FeZ33WaaP0SZ7U0dcKUvB2rdYm7NGR4/mV9bQZGT59qDhL7S6smHRI0IU2
 yc7dfLk1QKGQ+8mj+o7BIZBpKxo2IHPOerRzko2FvaxicUCqn991zC0ADb49NSqxGe9mwUPTJ2d
 f2VALOkBoIwmhdCVvkg4LBBU88xda2Ys/suvGxpeqViKHztF6L153kXK0v9PQFGL9N64D42svE/
 dkOxJVj7hrJWG9zjpiALg+jjgHUy/tcmiMKWMgPN8p85sEJgF5LNqQnAqB9zeRJpmdYGgzHtI3R
 YQfjiDQ==
X-Google-Smtp-Source: AGHT+IEL/lT85jIG57Q0JOnH775/lJ5IzNoIu0Chk+nAgHGI/dfLdbqsRa7ZO7X6xN8mOHy3m7EIgA==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id
 5b1f17b1804b1-4409c52a44dmr92109645e9.16.1745739859798; 
 Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:27 +0200
Message-ID: <20250427074404.3278732-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 devicetree@vger.kernel.org, Roan van Dijk <roan@protonic.nl>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/8] ARM: dts: stm32: support STM32h747i-disco
	board
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/Makefile             |   1 +
 arch/arm/boot/dts/st/stm32h747i-disco.dts | 136 ++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 60d55516f723..c66959edac12 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
+	stm32h747i-disco.dtb \
 	stm32h750i-art-pi.dtb \
 	stm32mp133c-prihmb.dtb \
 	stm32mp135f-dhcor-dhsbc.dtb \
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
new file mode 100644
index 000000000000..99f0255dae8e
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+#include "stm32h743.dtsi"
+#include "stm32h7-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "STMicroelectronics STM32H747i-Discovery board";
+	compatible = "st,stm32h747i-disco", "st,stm32h747";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@d0000000 {
+		device_type = "memory";
+		reg = <0xd0000000 0x2000000>;
+	};
+
+	aliases {
+		serial0 = &usart1;
+		serial1 = &uart8;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green {
+			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		led-orange {
+			gpios = <&gpioi 13 GPIO_ACTIVE_LOW>;
+		};
+		led-red {
+			gpios = <&gpioi 14 GPIO_ACTIVE_LOW>;
+		};
+		led-blue {
+			gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
+		};
+		button-1 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpiok 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-2 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpiok 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-3 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			gpios = <&gpiok 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-4 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpiok 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-5 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&usart1 {
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
