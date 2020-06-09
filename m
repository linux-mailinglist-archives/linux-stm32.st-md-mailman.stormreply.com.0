Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 983971F3C4C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 15:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60F3DC36B22;
	Tue,  9 Jun 2020 13:26:59 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E1F9C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 13:26:57 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id s88so1400123pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ILMp3Me4a0Jm6IXnxt02gFbANgGUJCet44DEGXP16Yk=;
 b=gspW10yeD3Ig3PPYkYAVOZpbqMtWXRLVN0T31UeUe73zINPZZIkp2J90gD4VRGZHRZ
 iei35GZ+L/HjWrOg5uE4kxF6UzLLPvgeKkmc/wuMMP6SbKRkjMN+lroR5GRS6HDFOC3M
 GILf2G94TsrTC6KaJtoRlQ5nCSgq8s+IOThlYfIaLcIG0Tle9BHjkS1aUtyWY0j2qUBI
 jjrZIyqlBdTXNeP4nOt59d+yhBLTVJEw5Q8fAf98w0bMEa0bNtU7uNHKQAHjJxOVYyFb
 4P8UBdyM6effNFMGY3mv0tzNh08zuFrIOV1LFj//LcHmqyXGRqK+MHsyybWBW7FSfcTP
 T+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ILMp3Me4a0Jm6IXnxt02gFbANgGUJCet44DEGXP16Yk=;
 b=t4R945pJmnuGgEyuNmYJpE0Z39xze+uxNiR8OBdSvPrxHyrG0V3hStFu8VbTcPwpP/
 b8Soh9l5EndL3bT0AEVfmAG1Upv7LoldbSIS9Igjg4DmMoANk7kQikA6xRrVQMnI7BU5
 rx6QJ01oecDSmMIs4Ut+HKitPnr58WFwuVGBswpEQRT+Kx+88mNqVLKIxn5uWFcNurhk
 9v+hO6GZAngd7RH+TeYcH63Bu1PBgwXKqUXXCciOFoqtd24WFZpBTxSrFwNK8lJYj7h3
 kJ+F6c3Ybf/9+Ua76i/3jK+V65x25FyEH1yXiy993jRwjuOytcjC17ei0nKLwFDkorYi
 U6rw==
X-Gm-Message-State: AOAM53385MVtFDgm3+5bCgI4JSD/PID0Xkta9Jolevn2ZjNnR89y9IKc
 5rWEqzFUTbIUJIDXU1v8BAuVmM0DxzQ=
X-Google-Smtp-Source: ABdhPJyhL/LlvJFTDaH4V0AA0HNsugFg+Z3y3YeifkPG4RFoaxYuVgLw6vdy/MZ9yTGT+92M7VrQQw==
X-Received: by 2002:a17:90a:c70d:: with SMTP id
 o13mr4775927pjt.73.1591709215755; 
 Tue, 09 Jun 2020 06:26:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id b5sm2624348pjz.34.2020.06.09.06.26.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 06:26:55 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
 philippe.schenker@toradex.com
Date: Tue,  9 Jun 2020 21:26:41 +0800
Message-Id: <1591709203-12106-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/4] ARM: dts: stm32: Add pin map for I2C3
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
index 392fa143ce07..051f33627e15 100644
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
