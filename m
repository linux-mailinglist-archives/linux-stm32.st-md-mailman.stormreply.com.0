Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA91C8584
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 11:16:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D564BC3F932;
	Thu,  7 May 2020 09:16:29 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D5E8C3F932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 09:16:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id fu13so2361710pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L4sM3AW3j6UIA7E8JtPyZaEOpo7L03/nH/zacWPyyAQ=;
 b=O+Eco3yTtSm5e3+ZZJEPQW7LYANk0ENsvTeGBvwhhxBe6+m53DXNgfqZ7KlDwc6zBf
 JCLRKcMxF6PEn50vbF+FNy9Ca9UdLt6ezVQyaiKWh8VK0EgLC+PocTQ/yPrm4+Do8wgf
 gNfYp2QPEOrvfTN3DnPJs5bycglTABJG+XJTlYpq1c+CQNHVVQcPLw8Y4+Ky6rXVAby3
 W4DbHEUaWenVwfWH88cdIn6tORbxYxpxeMuQxL6bfTI03XS2cSePVcvcab8cBgW5hFwB
 RPaIqLbrsfy9qwYdbvRIb21IB5r0QTfkx0wwZo5F6TEjBsFiD2XMmrhlYNbRyyISdZ5E
 5LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L4sM3AW3j6UIA7E8JtPyZaEOpo7L03/nH/zacWPyyAQ=;
 b=aYl7yJAlMY1tB4ewDJZ/8jmabu2GK9jQzaXkZaUrWuo9oINfTamndUeNV7FvP81x6Z
 bHusRseJxi5V1gb6zZCXAt2a7OGYTP6IFB3Mzmpd04PvPg/x3jzWNZ9q6hfCXnSqkJn3
 g39O951KtgzAZoWx1x1pMjvnkB5nUXssjUaM2UfSphKV4Y9iKMdSOTScBS8dl2eCk1qg
 FpgLldrJ/Qm0WfIYAvXgB0JSJZTVm0PcYq5naxnX4pEWVfI0GWeXnXK3/SzwZ06XT/rt
 m2wYd4Tot3gS17nutB+sRtP4PLxUlxuw/EBdr9cHuP1gmBYNFEa0szFjnFKJnPcfo5eO
 F3pQ==
X-Gm-Message-State: AGi0Pub53NEIAmC81tDlJR5Xke3d4f3HFkd4DmV91ibf4ZFUQPtpSP4a
 Rbkpq+wiFUGVvWq00kh0e/A=
X-Google-Smtp-Source: APiQypLbcwB9R3OvqJ1MZo4353PGHtm6f1Og5xJlUP4Dg+wBN0WjbeLkBl8G7D4+ObVPV5HAMXpj6g==
X-Received: by 2002:a17:902:b711:: with SMTP id
 d17mr12427536pls.333.1588842986055; 
 Thu, 07 May 2020 02:16:26 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id m8sm660100pjz.27.2020.05.07.02.16.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 02:16:25 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 17:16:11 +0800
Message-Id: <1588842971-20495-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588842971-20495-1-git-send-email-dillon.minfei@gmail.com>
References: <philippe.schenker@toradex.com>
 <1588842971-20495-1-git-send-email-dillon.minfei@gmail.com>
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
