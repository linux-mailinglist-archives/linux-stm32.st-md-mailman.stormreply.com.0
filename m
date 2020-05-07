Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C651A1C83C1
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 09:47:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EF1CC3089E;
	Thu,  7 May 2020 07:47:22 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6BBFC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 07:47:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 145so2590689pfw.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=AR5Zu3h0zYcp2CjYSCzPv5BOBji1VqKwGPKlVLR0QF5Uo3TGwx7XJKWyLDyI+su6CY
 WEcR6iVRdAJGvmCgEY6pKJ0Cm2D5yWjW4ZfyIILIu5rBLKHNaeCZ+DRzxu3SRQzF/Yvc
 L8umyfpq2yFYf7Lm2HACE/KCjlW+4Ecg24dueY4O74JKLhJU/x+51Q8JVyg/QOiDbgcd
 I5ChzDJ4tg1lm6D6yTvW9vLUJSLCLYy3rh5ZaMhCcr35nRL/HfOsYF9+8hG8JotvzWoF
 kiK/LwSbnYfA5bY+jk8irL/cDe82nl9Y8WxllKjEzJcJHgeu0sYQCrIuO0aFyWYpdHAI
 R5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=Umt13Ljtnbb0+eAkMOJgV36z2pVymHGJQqgrqWX/OABwMkoOlz7roUZXEBv/pSz/c/
 pYl+C6yY6awJ1z5qCGmo/CUOykObb/uizd5kAO5NP9pDdeHdWmA7iafUmeBwCyclrmU6
 QGAPBBrfxF8SgQJxAaLbpT7VqK1TxHyoKAHIdQfIiyLLtbCut+nTRIgsjnAaF5ei4cl3
 90hEeOrPOnllpJ/xQ/fHCqvf8RcxogCPvVkerxaKNthhx5PcAapDLaq5EukMzbN+1szx
 64+cIqC8LtSURV7yfuaRumq4PkG9DVvROy5kLIQVfVutlIzbkYRPOi7WkUWJDYrlJ9UZ
 HKvw==
X-Gm-Message-State: AGi0PuZW0ljEewIbYDKc41R8KWbTEiJprrzxV7c+fDmeMf7uWeZYen8Q
 1FVeo40h0Pj9KwwmRLZJVK4=
X-Google-Smtp-Source: APiQypJSPQuY+csp6bCCGwKD3ZC1sC7/TB05ndt59XXU0LqPCVDPgfV81xHWnSNnl5MlKhMSWxCOMQ==
X-Received: by 2002:a63:6cf:: with SMTP id 198mr3353646pgg.59.1588837639579;
 Thu, 07 May 2020 00:47:19 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id x12sm4011292pfo.62.2020.05.07.00.47.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:47:19 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 15:47:15 +0800
Message-Id: <1588837635-14267-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/4] ARM: dts: stm32: Add pin map for I2C3
	controller on stm32f4
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

This patch adds the pin configuration for I2C3 controller on
stm32f4.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..051f336 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,18 @@
 				};
 			};
 
+			i2c3_pins: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 9, AF4)>,
+						/* I2C3_SDA */
+						 <STM32_PINMUX('A', 8, AF4)>;
+						/* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <3>;
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
