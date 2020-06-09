Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAD1F3C52
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 15:27:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB15AC36B21;
	Tue,  9 Jun 2020 13:27:02 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5C53C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:27:00 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n23so10272599pgb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 06:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aYMF8YUhot7LiLw3oFS3/mzi/UrWf4Gg+68yZs/PTjs=;
 b=sgGbqRUkyDWUtzzQdzNZIOrKXN8s30ddQ1jDBSWTsBSz8ST1UW2xY9er013Keh0tkb
 bbVb0EAZmz2FcjOg0tY1AtsIZtW6tCFJhZMb40jRIq7cTqJyhRgeg1/rIt13DaBrDOKd
 0PEEey68luuZLlZB/zCUTuNcmeAm0R/8loPKH+3lOODVmw2CAmdfA/uM2yNnfhQwAe5o
 anOSKZzUJ5moWHDDQ7UxW5LdFo9iz2Q3Ksg90oBDa0q565HCN57RA1oo+Jc6SlZNAnv6
 HMi59cFDI7fajeJCX6zy9/VDju2JIaa5Fzyx+FrW+BGjsRTkk7o8yov5/DHzX+SF2h7m
 ZZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aYMF8YUhot7LiLw3oFS3/mzi/UrWf4Gg+68yZs/PTjs=;
 b=c6sSdudMrvxPQ+9tFpwMIMpUD6DVvM31cuSfbuxx6EJaH8v3ClkB10lX4/b7W1Bkc9
 QvjdPz+FR1S/bus3CmbRGTHt8BEz8lPK3txc+NDueNFy7Sd8fMwrRBcw1Ml6pmtpWG4V
 t/PFNCJhSjppCWGrcnxnABPWOkJ/hlPiYH+q1TPU6qyNtaDlYz9h8vF/sciWsVEiMQDe
 EHOtPPjzjRW8Ck1Ooz5YVeZ400oAXWSXvTuQZSRNXXy+C7S4OO+Y9F6yksjpaVCbXKYW
 p8CuaQzmzcgTn73bkePGmIFxzt3TSRQLBREZAFtVyBf/hH0x1YePIy+PKn8hSSrgFOgz
 Mp0Q==
X-Gm-Message-State: AOAM531fyG5HKrOAsGhulyxjC+vdMzOtM2h860gF5a8H3iZdtUoJXFIY
 nszlHIqH1rTy4o6GrRG4Yzo=
X-Google-Smtp-Source: ABdhPJw7afLAjpJsItQsnX3qt0rEIAvvOvZk+nKKPPFz9OcVyn+axZGQ/zVVsYCjoQRpV5oByTFdOg==
X-Received: by 2002:a65:46cc:: with SMTP id n12mr24887487pgr.80.1591709219129; 
 Tue, 09 Jun 2020 06:26:59 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:26:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
 philippe.schenker@toradex.com
Date: Tue,  9 Jun 2020 21:26:42 +0800
Message-Id: <1591709203-12106-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/4] ARM: dts: stm32: enable stmpe811 on
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
 arch/arm/boot/dts/stm32f429-disco.dts | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f6717871..fad1ec10efb6 100644
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
