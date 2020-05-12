Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C11C1CEE48
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:37:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15992C35E2E;
	Tue, 12 May 2020 07:37:06 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29999C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:37:04 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id n11so5771712pgl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r4ch8j5fUt4KnjnT79HJgzesM349QfaUvm49nNEOTbM=;
 b=liGnZv9V+YlD0rTxwCsrqKX9T7b/uFKEWEmcLhyUVdVM4OLuljhp0H4BIxzOKopWpH
 qD2ZsbfwZ04LJWj410Nwng4Fj9Ivnzfe8nuB/uggi+t82UEiUK9OrHzDBFeHv6X+IgCy
 nP91XfVq24+2of3EHWR5g9MciEg4KN/4Hi7UXzwcIJ8JJKjjYWhxj0wQmjrA7ZCfsJl7
 QsIDHvh8F8md2YbeJHHd6wUlJhmUwiFyJlZxsC2TiBbtqn6qtDtIUAzMhajplC8uB0dx
 cajfYKfQWnF9mJF1n+U0VlcM1/3fYMjkfqOL2LIiUMViyVHWMe2/Ot3Qiy+rmcwbLJfT
 PDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r4ch8j5fUt4KnjnT79HJgzesM349QfaUvm49nNEOTbM=;
 b=rUOltkjJ6nxDqnDucNHR7HkZkfbi3i2OdEP4WGrhCGnSvMsdiQVFI/pQ7B3+Wsmhcj
 hNkG68taKYe8GywiUEJAal+3uIBuD9UHNaT7c6D7TMFOVVJzSy7RIXtOzxWaU/lJ/uNn
 xXxUU4CQZzhX2jT+g06OFlZO5rKS6s+kEQrClotsR1z9qTv9GJHSR0P3wpL4ioOJAj1x
 ZNzcYMP1Fs67GfT0rCwSfvt2RInPyJWP0khweAcPzNNVjJZTU0l4kWZgqPwxgzNnh5hT
 FdoDjuFhQuv0E3VSF4Wv7Y5/jU5oPfBd7MEicQC8lYyWNfzoVVQRGn4Tn0VzlPlMVTsQ
 hZAQ==
X-Gm-Message-State: AGi0PubEpb0gafEjUhL7a8SB6vYRnkA7cn1BqFde6Cm4fh6rN5tgDNjr
 84mMTtB2dIN2sCCpK4JJq1M=
X-Google-Smtp-Source: APiQypKyQ9WN5ToMhvq2wklP3XUxBEgEbvE5+fep2zT8czr9PcuMmduH6S9XdVQSc2xZkkJ2D80wig==
X-Received: by 2002:a62:1657:: with SMTP id 84mr19158275pfw.51.1589269022679; 
 Tue, 12 May 2020 00:37:02 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 5sm11732471pjf.19.2020.05.12.00.36.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:37:02 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Tue, 12 May 2020 15:36:49 +0800
Message-Id: <1589269010-18472-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
References: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon.minfei@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32: enable l3gd20 on
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

L3gd20, st mems motion sensor, 3-axis digital output gyroscope,
connect to stm32f429 via spi5

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi Alexandre,

V2:
    1, insert blank line at stm32f420-disco.dts line 143
    2, add more description about l3gd20 in commit message

V1:
    enable l3gd20 dts binding on stm32f429-disco

thanks.

dillon,

 arch/arm/boot/dts/stm32f429-disco.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 30c0f67..1bfb903 100644
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
@@ -127,3 +129,26 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&spi5 {
+	status = "okay";
+	pinctrl-0 = <&spi5_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>;
+	dmas = <&dma2 3 2 0x400 0x0>,
+	       <&dma2 4 2 0x400 0x0>;
+	dma-names = "rx", "tx";
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
+};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
