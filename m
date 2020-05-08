Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C001CA03C
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 03:46:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43769C3FACB;
	Fri,  8 May 2020 01:46:44 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9985EC3FACA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:46:42 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mq3so3513962pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g21VM0N/xeIa/BHhtzwrufGFeXAe+t8tpDwjYGOH/p4=;
 b=rgetU6OpAMU4D1kkUKoI+J0pdPOpRA+4I02nwC0ZKFmz2pAXs3HVpNB+cB0o0V6Y5L
 W9Lw+p9mZueptmpC3Wo+pKScnSNvsDmzqUG/B4EmIqu5P1wAs9VnyX4ghEhjmMHCO7U8
 q/L0cgAR6S+qEMyzSa7uvyyvNz3CxRxQqsx2nKz71RXv9J3oEh3wFGrpWEsyfD+hhpNG
 D2BWRyWos3AiKBo/5eZwaysxRCJ/8c8X4QAapIWbMpM+jHRiURiw26YlLqmr4wbuDT5r
 tWyNuMGMhfYCu/XcHQtVWT0dW0YwGZwp5OM80nkNhajmM/Nsls0yeAeQq/ST1LtjfaQ3
 blQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g21VM0N/xeIa/BHhtzwrufGFeXAe+t8tpDwjYGOH/p4=;
 b=YCp0hZpu0zG2QlD1Xc3yEEMCpfHw7VS07Pyoz4nNqbrpF/yaHSQ2FLXhjZLR0zcC2s
 +vM+bUN2fBui6yaSZ2fF8tOR1oqWQmSbQQY/egx4S+8mdjIkiUR1tw2hNLSjeVCDmGiG
 aF1LwGqvoNiU1s1jb6bGUdWCdhK0NX+caJLjYxTPPkrVkdp9wB04gfIEbidEboAHgjGZ
 /Hhw62aPBEMfoPmX14TQH/u5G1RczxAGUIfHGH2R6LSe30iN4kXJAa50HACSTFDeZYiO
 uWnd9znis9EWQPwn4DkdJ3tELdScC3aA0bfJQ4ffYhhRgHdO3d4GWI32ID+S8aFKwRMY
 8fTA==
X-Gm-Message-State: AGi0PubT1oA4Qr1QVtwDluPfXK+G7tIKKHr0vZJiJ2bqvLB1aiH8eFB7
 QJzrWxL2pD9F1cOv3P9OXFM=
X-Google-Smtp-Source: APiQypI7IDVKxcFmHkJ4Xm0Fi0OGTuWgWHi+XPxKF9hO8yv4yELTdrT+trWL0uEpQEME++1N51EJtQ==
X-Received: by 2002:a17:90a:414e:: with SMTP id
 m14mr3414310pjg.227.1588902401207; 
 Thu, 07 May 2020 18:46:41 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id f74sm9270816pje.3.2020.05.07.18.46.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 18:46:40 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Fri,  8 May 2020 09:46:27 +0800
Message-Id: <1588902388-4596-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
References: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 3/4] ARM: dts: stm32: enable stmpe811 on
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

Hi, Philippe Schenker, Alexandre Torgue

compare to [patch v1 3/4], this patch remove id, blocks, irq-trigger from
stmpe811 dts, as they not used by driver anymore.

thanks.

dillon,

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
