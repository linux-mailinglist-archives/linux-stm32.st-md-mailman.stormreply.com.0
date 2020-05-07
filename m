Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A35801C87D4
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:15:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F845C3F93C;
	Thu,  7 May 2020 11:15:33 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E21DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:15:30 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z6so1932035plk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dzZv5l46H3vCVPERauYX1uGZ7zgOzPk4wkpAl/BDozc=;
 b=tSbG7BME/8vv5wmI/sQc+zwSPUoEoKgUp4LNjaY+Qkz0zVVKE0Rc1qtVsZEaOJLq+D
 T7zYpqzmNEPG8PPe3sDzQmIBrVsQ3YdZHaWVxolM7OaCc04AJ72uDYD8xMTigC8YZ73O
 DtHhv6NGLxThEGqUri6YXrisZZkQWhZux89L9reZ1ZM0TXb1FDtClGLs5Cn3ZioT6Iql
 HIsRp4uVK4sDNELmcnS2ni7fPUOeRRhGs0TKaajJ3SZlCaquvsun27EVEgONBnuQeCmM
 OwD+kegqJKmB4tqYRmpgHMdVurC9Ap7GZ9ZpV5TuKaJJXeD5aDbo5AIsWc3ulXRZ8dwr
 x4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dzZv5l46H3vCVPERauYX1uGZ7zgOzPk4wkpAl/BDozc=;
 b=Xnl/m+6jKvcbHLxJJNy69rsBUkMucvqHspMA/sls/x2a2ju7Gi/afFYm4r1GzvGSba
 y39njG6RDcdGX47Fj1rZ36yldUyWUXDrzw31hUKS+W76vdj/lXiEzG9LKH3Fino6qymh
 +yKDlMR5gWyqZUV1tt2TMdA7mAkgLGjO1VfcPdAopVIiSGid6gI+x46eqR4EAPndfRS1
 j/sNPtjD3RlkctrK9TyRjxjL8400EZLrdTlQkgoZqR26qnvCeo/Wml1sAoCZk3DGO8WJ
 vh31F99VEPb5iYHErpIkS/6aeaIWE2DQbetLzDKczokv1KWn0EtFaupzYxGm76J2pTEE
 aR2Q==
X-Gm-Message-State: AGi0PuYsqjmm0MlCwbBjiWJhR1OmcXLu7p4olfi58ImFg6LSegy5oTAK
 SRdsEsufwxW7JZapB0723AESDT7Kcs0=
X-Google-Smtp-Source: APiQypL0XwlSVSsL32FDaZck9swez03mevirdkbAAk25JZBdWGaET1BAU4+vusLEr5Iw20yBXb3YQA==
X-Received: by 2002:a17:90a:1f8f:: with SMTP id
 x15mr14723323pja.76.1588850129146; 
 Thu, 07 May 2020 04:15:29 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id z1sm7056388pjn.43.2020.05.07.04.15.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:15:28 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 19:15:25 +0800
Message-Id: <1588850125-24344-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 3/4] ARM: dts: stm32: enable stmpe811 on
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

[PATCH 3/4]: ARM: dts: stm32: enable stmpe811 on stm32429-disco

V2:
patch 3: remove unused id, blocks, irq-trigger

V1:
patch 4: fix read touch screen xyz timeout bug
patch 3: enable stmpe_touchscreen on stm32f429-disco board
patch 2: add i2c3 pin mux for stm32f4
patch 1: add i2c3 controller interface for stm32f4

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429-disco.dts | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..fad1ec1 100644
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
@@ -127,3 +129,48 @@
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
