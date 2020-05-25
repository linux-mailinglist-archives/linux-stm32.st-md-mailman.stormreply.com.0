Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D141E0542
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 05:41:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20BC5C36B24;
	Mon, 25 May 2020 03:41:28 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0E12C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 03:41:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 124so1913823pgi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 20:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TecVBwOuGZ/BbCjVyBAZuzQGGC9DlsbNm1sr3li0idE=;
 b=QvwUoGSuDZI63M9mn4vBZYR6xz8xAH3VHV5RbxNhdUbFv/U8Ov8jfGdflulavz+0WZ
 qn68Vk0lu71CEX9OGs4+MKvbDf/Ar+ANm9y5umPi9zmijBjN/L9m7TPJC2x8GEpBrLTx
 MtAmyIwYQmGgE8wW1oyErjZhXBE3+4RW5rSQVe19dvn6zXpHN5xM6gCLNw3e5ShOIePL
 EBfhSGztPSl4/o2NB8WyTY+Hpmg/imm0D5l7FPJJVQ++7BrB5tsfdiZzzGcbRuK/rQDh
 gSgGSXEVBQc+l2Aj8p4zMIZ9pgJTISpwslah9WeJImGDSfyMAnK0aABmjeZDfYJkxjwo
 yx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TecVBwOuGZ/BbCjVyBAZuzQGGC9DlsbNm1sr3li0idE=;
 b=fVyOpVGvssEpEdiPke3u2+EJD1F8Ddrqu39nUnpakQK66j0X2NBE6XMkmn21GyCsHR
 SMKaJdqkyPzVDI5Aux11SVhTDAYMdgAJ93z+T3qML8UP402FwBHB/LaqTsJ/avErQ/qa
 RRH1ZTk24PwqIeybV4Z39fI1FyWOdmuj3wd9mieA9aMCv8DCmVN9IIN/y4F/olm+CFL3
 aVfNRdytpEtoyEI6MQ/J/2J4Mv26ZINuEXUMsbvsTaucMTXrPd1IVu9ZFgPS3gHjEV25
 l68ZF3wst8+L4q/BR9YBCOVspcPjo/Qky5/mrp3vG+tcnX6U591wZ6qXnehofmhbB4ap
 zAXw==
X-Gm-Message-State: AOAM531ON6Bbk0jVNDsDLAAbGAHGIyWpYXtr6d/6pDVN48JY1xgGSXJS
 ALJKfA8DlfA0xK2dcYmEJ0Q=
X-Google-Smtp-Source: ABdhPJy5ws0szZe0UGhHCEkCIdbOEeMkcDKZOuy9zGQFq2wn8JF4wLX/np8i7COUtqGKNVkzvHrg1w==
X-Received: by 2002:a63:3609:: with SMTP id d9mr24436404pga.354.1590378084548; 
 Sun, 24 May 2020 20:41:24 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id 7sm11981695pfc.203.2020.05.24.20.41.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 20:41:24 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org
Date: Mon, 25 May 2020 11:40:57 +0800
Message-Id: <1590378062-7965-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
References: <broonie@kernel.org>
 <1590378062-7965-1-git-send-email-dillon.minfei@gmail.com>
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
