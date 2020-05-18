Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B52811D7619
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2020 13:09:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FA93C36B22;
	Mon, 18 May 2020 11:09:55 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD0E8C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 11:09:54 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u22so4078326plq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2020 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eu8Y+3kRQM/USnH5yzkkCNIQbKXjIgArtceSXqO2K04=;
 b=SYCy2JXfMKollyID3Ho5YgxpSh0LrBqOCbp1W+NTv8ArKSBhVfYnQQb5iD59P6vNKf
 bydaSGrCkSIlhCtG4x087JQUpKyomjDGQsbkpt0QSZ55xcfyAdHNQWceSUghV7umH8ZF
 HICfOfpfRpe3el3WU62lDKmnXkRVAHxvEZAvv7ITQraEgZxhcAtAaA4bQrtYRWMLDNLA
 aGoZ/PsT9bWgY97v+7hzdu8CgXroeqSNVd1AqcuRXc/AIW834eIp55svDvNoaHfMnac5
 0kCEu2FPZ1ZSQAFyUlRgvUgnAyWrPGGoEIjihvBARV62OLS+Q6pyz5q+W/gKlz2zN02l
 dQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eu8Y+3kRQM/USnH5yzkkCNIQbKXjIgArtceSXqO2K04=;
 b=fFl3rofjzf8q044oyOp5BcP0IimlBRuPpdPjDLixTdGpzs8zGdTLVZHtNS9sUWJu/T
 vwwTepiu39MSdDxG4/xr36aGIEQdHKxZzOK8Vb/BrM2H1BQL+AeKXLFgTA/a3cEFER3g
 jU2KM4ehuVMrxK6YKc4P/K+QFZL2hRkakul3MgEmj5fnoN7TNZa4cTshMHeexbNPI5Lw
 /HG1eHRQ+vKP7BfKINzfiK6Df4mAu8z8rsAA8+3K0lyMEtUtPspOC4jegfb/LXLUOu9i
 x+PxkpW8zsq/+9WRzrcpR5UJaUqSeYcS0pD8s/a2fUk+zxor1aqFKMf3x8hVUR+JRjzI
 KAOg==
X-Gm-Message-State: AOAM532xDUv+b+VIUuXm2EAT9NfenvdAS6CVRvvATtIjqXbbmF8Y+Z07
 SwKR0r8KF0CucVGovioaJ/s=
X-Google-Smtp-Source: ABdhPJxZv32MXI2NS/zMY/o4Uo1RotZrCRnG98wKQmtgtBkpDu5mj+G3hzWv/6hhWrtYNHG+vIHrag==
X-Received: by 2002:a17:90a:8c01:: with SMTP id
 a1mr8944191pjo.127.1589800193350; 
 Mon, 18 May 2020 04:09:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:53 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Date: Mon, 18 May 2020 19:09:21 +0800
Message-Id: <1589800165-3271-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 4/8] ARM: dts: stm32: Add pin map for ltdc
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

This patch adds the pin configuration for ltdc controller
on stm32f429-disco board.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 54c1b27..0eb107f 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,56 @@
 				};
 			};
 
+			ltdc_pins_f429_disco: ltdc-1 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 6,  AF14)>,
+						/* LCD_HSYNC */
+						 <STM32_PINMUX('A', 4,  AF14)>,
+						 /* LCD_VSYNC */
+						 <STM32_PINMUX('G', 7,  AF14)>,
+						 /* LCD_CLK */
+						 <STM32_PINMUX('C', 10, AF14)>,
+						 /* LCD_R2 */
+						 <STM32_PINMUX('B', 0,  AF9)>,
+						 /* LCD_R3 */
+						 <STM32_PINMUX('A', 11, AF14)>,
+						 /* LCD_R4 */
+						 <STM32_PINMUX('A', 12, AF14)>,
+						 /* LCD_R5 */
+						 <STM32_PINMUX('B', 1,  AF9)>,
+						 /* LCD_R6*/
+						 <STM32_PINMUX('G', 6,  AF14)>,
+						 /* LCD_R7 */
+						 <STM32_PINMUX('A', 6,  AF14)>,
+						 /* LCD_G2 */
+						 <STM32_PINMUX('G', 10, AF9)>,
+						 /* LCD_G3 */
+						 <STM32_PINMUX('B', 10, AF14)>,
+						 /* LCD_G4 */
+						 <STM32_PINMUX('D', 6,  AF14)>,
+						 /* LCD_B2 */
+						 <STM32_PINMUX('G', 11, AF14)>,
+						 /* LCD_B3*/
+						 <STM32_PINMUX('B', 11, AF14)>,
+						 /* LCD_G5 */
+						 <STM32_PINMUX('C', 7,  AF14)>,
+						 /* LCD_G6 */
+						 <STM32_PINMUX('D', 3,  AF14)>,
+						 /* LCD_G7 */
+						 <STM32_PINMUX('G', 12, AF9)>,
+						 /* LCD_B4 */
+						 <STM32_PINMUX('A', 3,  AF14)>,
+						 /* LCD_B5 */
+						 <STM32_PINMUX('B', 8,  AF14)>,
+						 /* LCD_B6 */
+						 <STM32_PINMUX('B', 9,  AF14)>,
+						 /* LCD_B7 */
+						 <STM32_PINMUX('F', 10, AF14)>;
+						 /* LCD_DE */
+					slew-rate = <2>;
+				};
+			};
+
 			spi5_pins: spi5-0 {
 				pins1 {
 					pinmux = <STM32_PINMUX('F', 7, AF5)>,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
