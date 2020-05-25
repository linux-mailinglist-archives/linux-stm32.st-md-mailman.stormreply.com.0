Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C451E0572
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:46:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C61C36B24;
	Mon, 25 May 2020 03:46:05 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20BCFC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:46:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z64so3766323pfb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TecVBwOuGZ/BbCjVyBAZuzQGGC9DlsbNm1sr3li0idE=;
 b=oOnEvJIc5RIC+XycPQbNKIOqu3rZrB9GkscAVQFQ0bIPFUXhXArjacXi2Bv9R8irzo
 xJ4obbevslcs+GawkyTJuMZcaQxb8t70SgchuEOmzRv9VmCoagv+xoE3hH8+uxrGu+u7
 Tr/nTMpuhzI8FeOPEYF4CiVdLMO4Yo+CU/rEyl2ZyF/zXXNC8cydBxXGjcTypHEmgeax
 OY8v4Xebai1cj4X0S4d58nwAtcOIGFv4+K0Qo3tuY/twGNB5zfVMY5LFwteks12B1qoP
 WJ2FZXvTm78wjDBDexzekBDJehJ6XUiQNlj1HScpmMzEEio3Xpd63nu3vsmTHMjSstN4
 gkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TecVBwOuGZ/BbCjVyBAZuzQGGC9DlsbNm1sr3li0idE=;
 b=cpPtaNXUDepwSRfYpGU+naKsVtVK3Pkvh7ykYsNqdTTimTwHOzDhOmCNsXLNiuPS6Z
 NSSNFjEmOE+DBCy4Jc/0FRvWCsvX8kYGYRGGq1fj6+yFV6r59em2D4zG+5SXDIq3EQjk
 kDC/ER0IsA35BM2rdDt7fpNo5vPM+wx4GvaKYFAcS4SZqcRsODmE9LOgLotYcp5yD3T5
 SJTXX1wXp4Kn2Qjd+xosz0ePw6ytsugrGxl97bxbt3gOdXShgBAE6ufHQ7hHZBZIZDyf
 qTSWcfXiBco+1Yv91UHgwxjrqAEjyNPDNSwOJKLUUW3RxgObEcK1qR8dWYMtnbdFBBuc
 2Ljw==
X-Gm-Message-State: AOAM532swg6G5/bqCO3gC/sbgat0A64e/ib3zkfl6tpGlsF3LnipLCqg
 TndIPDEa1EoZGYVAoV0dI2o=
X-Google-Smtp-Source: ABdhPJzcQZcr90XePIuYsKAB+iyE3OReyvFJzMWSlexKfctfg9uLTc3FLbdM/Zb/mh6AWJtg+8RtAA==
X-Received: by 2002:a62:e305:: with SMTP id g5mr15607365pfh.144.1590378362742; 
 Sun, 24 May 2020 20:46:02 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id i98sm12152831pje.37.2020.05.24.20.45.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:46:02 -0700 (PDT)
From: dillon.minfei@gmail.com
To: linus.walleij@linaro.org,
	broonie@kernel.org
Date: Mon, 25 May 2020 11:45:43 +0800
Message-Id: <1590378348-8115-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 3/8] ARM: dts: stm32: enable ltdc binding
	with ili9341, gyro l3gd20 on stm32429-disco board
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

Enable the ltdc & ili9341, gyro l3gd20 on stm32429-disco board.

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
