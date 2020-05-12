Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DE1CEE46
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 09:37:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DECCBC35E2B;
	Tue, 12 May 2020 07:37:01 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 909C9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 07:37:00 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id t9so9129224pjw.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1+50jpOtQ+yabtvOjIxdeqHbLW4bp1NAnAuKLsw1+do=;
 b=G47sGn4TN89HEfDHIlpV4L/1OTdbO4A512abcr2Q6siKyVvi03Bex0c/ELQlwJIxeC
 tIZpjUJVEe7tdocPqLpuCIdwP37zsuHnu0unHBL/9tyMyfq1xvzsfWMgamvXnH+oueZR
 0oOt/MwLxV7aWWjGONudiPRNYxzkoYYoEw0jmndA2AKTJIZZ7i0UYciPrlJjdTGNVwX8
 L4fm20sFG926zL5N7wAcGAXpX5Ix5B/lirLwhzDXmd8U3B1P/u9toWrSxuaOZ1KI5/gJ
 +rv5oc7F+faxwweAeljXXxhEzJY90igkfcWkaPenQrTaS+0UzDx86i9KAACaGvXOCFo7
 BRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1+50jpOtQ+yabtvOjIxdeqHbLW4bp1NAnAuKLsw1+do=;
 b=E7Ak0g/i4KbeQmAHlgtm7WrRfud7SOS5/cYfWMEZfc7QijROMwsZWqbwFjw7MF5G+d
 zsjEQdkOnWM33tbVaGDTQQrwIumK92Gnm7lAIuEgDv4X8ZO4nwR9wpi6DgNWJ1j+CCxo
 BX2SwzWSIqHkwfM3mgT5iNe0bOwgYBXLrv7J9VhjxJL3a7lmMLqdfzQKpP4Uhrblt2Dn
 +MOiN3Yv/JCjDTkN87tPd1UsA/2cPF0RxSmkQL3GbpWQI0aTRFYKAlurpt6AOp6RpTXB
 n4pQLy4BjtY8NOEe7atRh+0/J2+p/pVx3JfG9u9nbQOyih4TxLPQ64Wg9ShVMntGlkUB
 +msg==
X-Gm-Message-State: AGi0Pub3w32H8n/eGFYnHgI/XzM1t0uN/8RrYc97uqWTn1y0ZAd4J+cy
 JwlV8QLKfUPZy7K15ScQDBc=
X-Google-Smtp-Source: APiQypIro3QqgqzACddslZcezZZ3teK8Kwq4T65hw26DXUKtwZPMtU58nk+jjImORx23aPyHjnHRfg==
X-Received: by 2002:a17:90a:7046:: with SMTP id
 f64mr24142240pjk.205.1589269019133; 
 Tue, 12 May 2020 00:36:59 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 5sm11732471pjf.19.2020.05.12.00.36.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:36:58 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 broonie@kernel.org, p.zabel@pengutronix.de
Date: Tue, 12 May 2020 15:36:48 +0800
Message-Id: <1589269010-18472-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
References: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dillon.minfei@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] ARM: dts: stm32: Add pin map for spi5
	on stm32f429-disco board
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

This patch adds the pin configuration for ltdc, spi5 controller
on stm32f429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..54c1b27 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,23 @@
 				};
 			};
 
+			spi5_pins: spi5-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('F', 7, AF5)>,
+						/* SPI5_CLK */
+						 <STM32_PINMUX('F', 9, AF5)>;
+						/* SPI5_MOSI */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('F', 8, AF5)>;
+						/* SPI5_MISO */
+					bias-disable;
+				};
+			};
+
 			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
