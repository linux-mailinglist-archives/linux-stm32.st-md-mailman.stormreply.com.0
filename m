Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AA1CA03B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 May 2020 03:46:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 386B7C3FAC8;
	Fri,  8 May 2020 01:46:42 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24BB2C3FACA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 01:46:40 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s20so11215plp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 18:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=CB43zfc2JYiMsXGaSfTcH60amDf/MlsHLRAtdfJB6P3Q9cjb8wAwYz3Wxj+tzXlJgu
 Y9EJg471fUeOK+LCx7qu1DkbWDuqG4s8TMbTtJC/bMJrVB0PgIBLj4JWa7Khlgb5kE5M
 KZuRsnDmcE2eD1/3+8fXOnaK4Rnywz8jRQ0L6iUptOcl7WwPHUsodGf5kFOFGs1jT6Py
 qZEmC2hBoCYrGNj0XZ7738p3mkFAi4xA1epozT3LauHL8sFWCBZ0+TsYgk2nFZB1gAhd
 znKq3vheicxRnTbwT6rUHTrg3+9g2n2ab+vvL8dX2oPLXCzi4PspUcHp5SjkoUeeSUWe
 VIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=e7vFpD/IGSu7vfMWslD0XnGnOKsg4CnGDWrX3gul4JgsJ7gqDl46NXFxvIWdmsTJ1U
 NUCqo/fSom9EEu0M4v5B+UrrrJMu/CjX7R6L2UGomfnG3Vb+F2bOAdlLkYvMuEZGCKjf
 RUpuhZO0U2j8f8T+j9GYaXgEJzh/EEAxmpL3jHePHL5RrCIzQfE5M3ga8eozq6NAicGW
 MQlGLbMfz9hEgs2cFvZHzZZyXIT9fU7VYaICnZrvlogiowNZfia+gyxIKtr64LFABAQG
 Si0y2bW3Cj1Fl7BBGRRCR8DVAdFyNab0BZVDkoHjyMnlktxnQDmSgqhEgXsXf0rWR8HF
 9DHA==
X-Gm-Message-State: AGi0PuaxvArmjWvzk1Gc/DIsbeJuVkokoMQRYdJ38Bq8wxx+9ae+N6/j
 zBcNMUFYD4S8QPM5e20lP7w=
X-Google-Smtp-Source: APiQypKYtnjt5BuwWJAO7lMyWZ0afQw2+8ef6ewM9hR/2/Pg0xHZin/kH71U7koFCWmmamMtdbYD6w==
X-Received: by 2002:a17:90a:e596:: with SMTP id
 g22mr3235874pjz.201.1588902398711; 
 Thu, 07 May 2020 18:46:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id f74sm9270816pje.3.2020.05.07.18.46.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 18:46:38 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Fri,  8 May 2020 09:46:26 +0800
Message-Id: <1588902388-4596-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
References: <1588902388-4596-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 2/4] ARM: dts: stm32: Add pin map for I2C3
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
