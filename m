Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A61D7621
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 13:10:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EA28C36B23;
	Mon, 18 May 2020 11:10:06 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07392C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 11:10:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 23so4790290pfy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 04:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I1T/MSXgatC2plQLGmWEDShQlFTEnK6nXGcY9iM2hHM=;
 b=iLYajPKb4u2/NWaM0uZuIIE0Zgslm6lKb1y7vbs2KEVZmA5magKDWvcJaUjMVGG+Hq
 HtA7x5myFIX4Z4h80DOZFCe/VoYeirGoypijZ4/g7WZ7lvx1ubsUYNofLiJhE1wIPAhS
 3vih8uOhCFix1mDfEuK9yq+iHbVagLjCIBoienMxcwEIl1Lc8SaBOHhbQCmo6UYA0X2K
 nPPIsaiO4+H/UuvWhNm1AEtIIELfckw275sb9XmSEP5HNnY39X5zXHA34nbxGxOeIH5p
 97482nu6JWh6jXjVTCm8W087b5N2UPqd28djYacnRa8xQf8+F9jwruj10kyiX0vGDrp9
 ucag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I1T/MSXgatC2plQLGmWEDShQlFTEnK6nXGcY9iM2hHM=;
 b=oFyBGRSsA7DjSwEEecogZKufdCTCQceaPmXrCclT4Ywr7c/JSyC14tdxh9Hp+bel+i
 b/h3LK3nozzic1KzQItUsp7h1hYW6HHp0ru5cJGwjDkld91tzal0Dka3esQCjnfrCEKc
 Qr9y27KPZXGYOT3kBgoYgvLEW/4EHCxA5jBhewETFDORBydTEgHkn0y4z6nybshinTg0
 9t7j6qjeRnPJRlhR7QnElAsXiCCYrDVGW1RjDZni6iRblh0u/0cwUEQBvusC401O7yrZ
 msn/C0ihrP6PfTXj/tDlvLh0VTlnFeeTIM2Bxh0f9kCZg8hGS0SnOQRcBjG5jwEDhthH
 mBJQ==
X-Gm-Message-State: AOAM532FgpyxQZwVkbm7RFn3J7U5zcAMEjaYf3ZOYth2T+PM5tIdiCj2
 LIjN6GKL4Yzt5GwUBT8eOIM=
X-Google-Smtp-Source: ABdhPJzTp8verXSiF/j8yXN0XwsCs3i8VyAOtQYBHq+u7MVM7vRjm0APUV2Qcp5rZcERI/eLfvhwIg==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr14754996pgb.252.1589800203620; 
 Mon, 18 May 2020 04:10:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:10:03 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Mon, 18 May 2020 19:09:23 +0800
Message-Id: <1589800165-3271-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 6/8] ARM: dts: stm32: enable ltdc binding
	with ili9341 on stm32429-disco board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Enable the ltdc & ili9341 on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..365d16f 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -49,6 +49,8 @@
 #include "stm32f429.dtsi"
 #include "stm32f429-pinctrl.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "STMicroelectronics STM32F429i-DISCO board";
@@ -127,3 +129,49 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&ltdc {
+	status = "okay";
+	pinctrl-0 = <&ltdc_pins_f429_disco>;
+	pinctrl-names = "default";
+
+	port {
+		ltdc_out_rgb: endpoint {
+			remote-endpoint = <&panel_in_rgb>;
+		};
+	};
+};
+
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>, <&gpioc 2 GPIO_ACTIVE_LOW>;
+
+	l3gd20: l3gd20@0 {
+		compatible = "st,l3gd20-gyro";
+		spi-max-frequency = <10000000>;
+		st,drdy-int-pin = <2>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>,
+				<2 IRQ_TYPE_EDGE_RISING>;
+		reg = <0>;
+		status = "okay";
+	};
+
+	display: display@1{
+		/* Connect panel-ilitek-9341 to ltdc */
+		compatible = "st,sf-tc240t-9370-t";
+		reg = <1>;
+		spi-3wire;
+		spi-max-frequency = <10000000>;
+		dc-gpios = <&gpiod 13 0>;
+		port {
+			panel_in_rgb: endpoint {
+			remote-endpoint = <&ltdc_out_rgb>;
+			};
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
