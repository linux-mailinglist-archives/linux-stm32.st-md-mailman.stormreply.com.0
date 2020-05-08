Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C5B1CA1DB
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 06:13:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9103FC3FACE;
	Fri,  8 May 2020 04:13:33 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E36F3C3FACE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 04:13:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t11so280861pgg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 21:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FwcBHEkgpi816HDa38k8dH6l9iAu/nO4Zhpk53Krt/4=;
 b=HcozJuektBhBGZGzSb6NtiZUXW+vXKMz+tmI9HpmNvc6WneM4GYTXNr8Z9jNyMKaqU
 dBp5dsPXy/FmQHQQa7/6hcGuKWjHXY+cS+0YcnQzvypM5GvJJ53YaxVfhPYQDZ0wMFTi
 K5G1Klp0fpWZmr5uy/5ziRvjbmpIEEzRldIjRVMrHGjbvCQ2SWIz3Lfe6jpPKyScPOEI
 n/F+Bh6qLaN4YVt1Btx61eEJlmLn3xN2UnNrjpiNOZ75aWOdPboleRsRNObFS4D4ejpx
 EWXHrFGCsgQdna0sMAdu06UzueA+PnpdEz/A9tNfKOFLDL9Y5Ea3RWq9nhabQeiz5Y6H
 MtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FwcBHEkgpi816HDa38k8dH6l9iAu/nO4Zhpk53Krt/4=;
 b=Z8Dv71SYW2kEhRLWTDfAZjzsq+COkxkkt1upsDMjKsVU3gnHWQRQBNZkM1UttwyXWs
 m5QCEAIxce9zgqtCW5LF6fa4sf5hgw3CnDZ/NLpCpnny4lGIneBs+cBrr6UwZfVXYjFT
 vHK3/Kb3NN27oCg+QuyBvRnmLgxjvcYiJN7BTFWI2eto37l3SdAkkPNj9NIzwz2Nq7Y5
 v8HdlEPE4ZA6De6v69S4fven+kjjY2qbCpyJJwR6GAZLA80864QccQziGelP7ZOVeO4/
 8zW1RYufLf3V6rE0EsHZ/gNlfJPTJJoH5qjr4wA81RNRSBR+Jbrpfw4N7uvfv6Wlek1K
 iSOg==
X-Gm-Message-State: AGi0Puaxmzj/yOI/6pIXST46MIqRVYcxLUr0lz6BhLzz7jXE0vNnnrQa
 0j5iqHKjlaBbu/4gyKS5xx8=
X-Google-Smtp-Source: APiQypLfzmDOwklw5AJIU1r5uLkQQrj0GcfwrLA3v2Q59+LXy/BZRcluqTxvpGbaYdlSHWH1dJyzWA==
X-Received: by 2002:a62:f941:: with SMTP id g1mr763602pfm.118.1588911209459;
 Thu, 07 May 2020 21:13:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:29 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Fri,  8 May 2020 12:13:11 +0800
Message-Id: <1588911194-12433-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
References: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] ARM: dts: stm32: enable ltdc binding
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
 arch/arm/boot/dts/stm32f429-disco.dts | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..2d9637a 100644
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
@@ -127,3 +129,41 @@
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
+	cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
+	dmas = <&dma2 3 2 0x400 0x0>,
+	       <&dma2 4 2 0x400 0x0>;
+	dma-names = "rx", "tx";
+	display: display@0{
+		/* Connect panel-ilitek-9341 to ltdc */
+		compatible = "stm32f429,ltdc-panel", "ilitek,ili9341";
+		reg = <0>;
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
+
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
