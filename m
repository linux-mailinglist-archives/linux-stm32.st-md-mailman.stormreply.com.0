Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA84821454
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jan 2024 17:16:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3C02C6DD6E;
	Mon,  1 Jan 2024 16:16:12 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A279C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jan 2024 16:16:12 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5559bb6b29dso3274962a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jan 2024 08:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704125772; x=1704730572;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6lTYGwOZkH/q3mVT10Wfxgf2APvMbHICMTqCuHaYlQ=;
 b=Mi2m3GgTFkEtTTtcs0ZVV5KAH52sBI2jw4s5T9RLOByAx9zcaejtPkHkM7Djx1qnD/
 cztvBlHm5reoeXSdYl6k/znqIp0ssfI7W9wSQAEYHgsg8aNwIfQ5OeOj2GZ4LsbnGBrl
 5Mt0co1xwqdYU5rub+dPkv+GDkShdbUwj8juM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704125772; x=1704730572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6lTYGwOZkH/q3mVT10Wfxgf2APvMbHICMTqCuHaYlQ=;
 b=XhY083KZDE3AAcR4dlSXEHiGMRidpuWfgHZe4alfA4SMp5OF63nziVLgt5IMFrPDtq
 OOtw2pBN1OHbEznNwVqY8K2NSvoxslTq/C0fBe2YGMxZTDm4/mBLsr5rMoLiZAAY3M2R
 DBjotRBsYsxvmC7y/n0ICMk/5nFBFCp71KQoAdR2a/W42OghV1VL6eL1OQuEfxVQnIA9
 b+K+SUXa9uhOODnzQa/b+f0mZ4tanTWMY1Vb1ZxWucroTIJp6OlsQyx2Hwe9fvJG+4Ma
 cYDl/+eRaU8OeJMVQc+7vGsaSezwYiMU19TiHTVfAqWia8Zm4Mf5ALDPkT2wWFlcJd/q
 vmAQ==
X-Gm-Message-State: AOJu0YxMLYcClsS9jxWITARcaM7j2jlZ335NBv+60mRi4NYUOjUH7yDI
 QgIQztWf0R8rTHk54/cS1ZTdSeD692dNrA==
X-Google-Smtp-Source: AGHT+IEMIdfKPv7AANgzmLHeFMXWyp4ZTojZGgPoeZui8eKAfzSNM3rMNXIJoZ1KdYBJ3jBUxiw1oQ==
X-Received: by 2002:a17:906:4090:b0:a27:fdc1:593f with SMTP id
 u16-20020a170906409000b00a27fdc1593fmr790479ejj.67.1704125772195; 
 Mon, 01 Jan 2024 08:16:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-44-179.retail.telecomitalia.it. [82.48.44.179])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm1897857ejc.105.2024.01.01.08.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 08:16:11 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jan 2024 17:15:47 +0100
Message-ID: <20240101161601.2232247-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/8] ARM: dts: stm32: add display support
	on stm32f769-disco
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

The patch adds display support on the stm32f769-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/st/stm32f769-disco.dts | 72 +++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index 8632bd866272..d1eb5f9c78bf 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -41,7 +41,7 @@
  */
 
 /dts-v1/;
-#include "stm32f746.dtsi"
+#include "stm32f769.dtsi"
 #include "stm32f769-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -60,6 +60,19 @@ memory@c0000000 {
 		reg = <0xC0000000 0x1000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,dma {
+			compatible = "shared-dma-pool";
+			linux,dma-default;
+			no-map;
+			size = <0x100000>;
+		};
+	};
+
 	aliases {
 		serial0 = &usart1;
 	};
@@ -85,6 +98,13 @@ button-0 {
 		};
 	};
 
+	panel_backlight: panel-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 14 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
+
 	usbotg_hs_phy: usb-phy {
 		#phy-cells = <0>;
 		compatible = "usb-nop-xceiv";
@@ -114,6 +134,46 @@ &clk_hse {
 	clock-frequency = <25000000>;
 };
 
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+
+	panel0: panel-dsi@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>; /* dsi virtual channel (0..3) */
+		reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
+		power-supply = <&vcc_3v3>;
+		backlight = <&panel_backlight>;
+		status = "okay";
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins_b>;
 	pinctrl-names = "default";
@@ -122,6 +182,16 @@ &i2c1 {
 	status = "okay";
 };
 
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint@0 {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
