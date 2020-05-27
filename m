Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD51E3A5C
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:28:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34EBFC36B21;
	Wed, 27 May 2020 07:28:01 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A22FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:27:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v63so11447754pfb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Onz0m4658GcwNr7+Ki8b+efZhD5UwVfFPAClpApbxu0=;
 b=qzfCjtCaNGhfLciJD54Qh0tr4HfhlWRrFOV4JqFKlMpPdMNiyfoPVd6vh8IKAjR6+w
 C3AxBzG4tFG5AdOMu96Ur6YY/V4j6KirRzrwgdy+q8SsNNRhQfzTBZoCGK0nKcuEH6jf
 Y/1G+YUZWV57/XbaDHtNSoP/ya1KgxF23wSVZw1hqxBtOWbPFu+RM6v7DXRgrfPD1r8W
 egyo5asIcWN8twWGCbqUEZlLLLsGpR65xSoNRDxh/XVqIUb9qytoVqhE11VAR5QECjzV
 gXBuGjBHyEzOYijY7L1lKKXkAOwdAVLV4/NtmD2MMusXDm23palSzGptNSoAQQiEXOQE
 VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Onz0m4658GcwNr7+Ki8b+efZhD5UwVfFPAClpApbxu0=;
 b=FduN9dPQTw7fGScHBPu2YxCbJ8BMZddUAiA7HjAfj8/YvPQhZf3JeD73sIXhQrnfOw
 sEIo87hAK3VvTl7+UCmpEjuu9jIUhTEoNiReEExz/ByP7cnV8iHcoEzOlBAFvpP3Wwiq
 939NokuL4Xud/3kpg/GsOc56xkyiCeKdm3JAXZ1zLKNDimx+K8liWEjqFaE3g5z0k3PA
 lPhGDDSQ9EiAt/S+7xQhV2Kjwl37NYPmv8hmDOzZHGlTNdknnCeBSJOPQHofCjIoBitC
 1BkU3IrfMnkLTq0BY6iEx73yuIz19ojq8x5lVaCtFAMmlw/+AG/H7OGJ8hkVdO4oOwZv
 hh2A==
X-Gm-Message-State: AOAM5335HHVadXESeLdwpKTVA3TqdXif7f9dLxh8zgWV4EkyVV34VLBy
 8J+ieqZhxHXyY0jONp9cxWw=
X-Google-Smtp-Source: ABdhPJxrq6LGGhU2T5g5A4vxN18i9oicAGxndDihLIS9MQThMQYthUtoVFwyJepniaGtO+w8ZQMX1g==
X-Received: by 2002:a63:dc44:: with SMTP id f4mr2832593pgj.442.1590564476259; 
 Wed, 27 May 2020 00:27:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.27.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:27:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:27 +0800
Message-Id: <1590564453-24499-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 3/9] ARM: dts: stm32: enable ltdc binding
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
index 30c0f6717871..365d16fd3934 100644
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
