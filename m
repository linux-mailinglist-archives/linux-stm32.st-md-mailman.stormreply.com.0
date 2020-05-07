Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D51431C83C4
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:47:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D6CDC3F92D;
	Thu,  7 May 2020 07:47:41 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F8C7C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:47:40 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q24so2275016pjd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TqXy+vuqTjO3oqyIdtSWrtx+1Hrshv6ESnu5XJvj/E8=;
 b=NU2GkN1yjcH6u3KT3vkWXG9SlTvbwUqPD9S/3WdLd+Ohg7j9b+XdKAqIZCuUq9mP62
 Ew2ih5yFbth9vRsBaElXi+MSFMhj8P6wa6Tbhc5sMdqV3G91rjC686sIsyzzmwAjlKv2
 9jX6d5ig9dKA1YaCtAnvVWr2gggenToNSNKW2eXyKeTWKdypHml/OjW146/OSFq1CKM9
 BeptFZEPuYszkZ+VaPMa5/4OhRPjiD1pURw8gmUjz/6jQz2B1pggXEezGQF+8qTa+WZD
 lQj/DEU7cmLDm4JFVLl2pmfRhJwGClY1ddK66fM1eISD9suO5WVxP8muL4U2TLUkWPsp
 B5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TqXy+vuqTjO3oqyIdtSWrtx+1Hrshv6ESnu5XJvj/E8=;
 b=n0PHCH0tPycIr4n/qXhNogWKMG8fEkEYu7uy9ZQ9b7vEzljZHh3D0X5CPBeJYR1tF4
 +MjmG8GHN30POrNmMUF6qWaSH3v1GWo+XIg7aIwaxOWwVQ26P0XUmwfWJ5lelgBvzzeU
 nqNF1n+15N4T8kBlIFtYp8F/tIa2vtx2k7hMiANMtLJ5EP5wz7wNseJiPJP6FiM0hupw
 hnNWbzkCNnzKIK3J3S2jFAed1cisaC0t/s0L64++v9fhhOuddCsudSh7LcM6tmu7MnGv
 UnPf2JjknI1GhIM1Nrgb288VklRgeK9/pntI8ugxAALEvwRlPIigvCBak4D/EYRVusvf
 /bCQ==
X-Gm-Message-State: AGi0PuYj1FzTFv02TesGRb2sBLS5dxF1/j51ET4IM0XN+0TscAEwwzrW
 w06ih+4YYbssr79SPtpFGDI=
X-Google-Smtp-Source: APiQypJCZvPn2WgwGdgm7EZr1FrGskXuaTUxgPsHrQygHo0xj1oOe2JLGZscA50x4REpF1O6/1Ky0g==
X-Received: by 2002:a17:902:aa94:: with SMTP id
 d20mr11658129plr.15.1588837658982; 
 Thu, 07 May 2020 00:47:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id s22sm4020610pfd.51.2020.05.07.00.47.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:47:38 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 15:47:34 +0800
Message-Id: <1588837654-14315-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: enable stmpe811 on
	stm32429-disco board
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

Enable the stmpe811 touch screen on stm32429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..f9f21c8 100644
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
@@ -127,3 +129,51 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	stmpe811@41 {
+		compatible = "st,stmpe811";
+		reg = <0x41>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioa>;
+		id = <0>;
+		blocks = <0x5>;
+		irq-trigger = <0x1>;
+		/* 3.25 MHz ADC clock speed */
+		st,adc-freq = <1>;
+		/* 12-bit ADC */
+		st,mod-12b = <1>;
+		/* internal ADC reference */
+		st,ref-sel = <0>;
+		/* ADC converstion time: 80 clocks */
+		st,sample-time = <4>;
+
+		stmpe_touchscreen {
+			compatible = "st,stmpe-ts";
+			/* 8 sample average control */
+			st,ave-ctrl = <3>;
+			/* 7 length fractional part in z */
+			st,fraction-z = <7>;
+			/*
+			 * 50 mA typical 80 mA max touchscreen drivers
+			 * current limit value
+			 */
+			st,i-drive = <1>;
+			/* 1 ms panel driver settling time */
+			st,settling = <3>;
+			/* 5 ms touch detect interrupt delay */
+			st,touch-det-delay = <5>;
+		};
+
+		stmpe_adc {
+			compatible = "st,stmpe-adc";
+			/* forbid to use ADC channels 3-0 (touch) */
+			st,norequest-mask = <0x0F>;
+		};
+	};
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
