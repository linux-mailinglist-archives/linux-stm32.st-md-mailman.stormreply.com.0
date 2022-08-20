Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2FE59AC94
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Aug 2022 10:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9E3C64102;
	Sat, 20 Aug 2022 08:30:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35CB6C640FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 08:30:08 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id t5so8078502edc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nx1RKbMsizbVSq8+ylCW9JB51IkfG+D4F3ijLXe6P6M=;
 b=GV/gDBX5HvPzHyu9Zsc8RdMfDQlo0FHjGGb+Mcsoq3z0kRRQTnrFYX20EeoG2lz97P
 dDL48H2CB1tQLOUalco/1fgcBMsWIgIvFoxfgWZyJY/qPNHcXurEO0FfQrUPDiasbatF
 2QlUM53CNt+JRSdMP+zkMoE6T4lJtJbIX/HgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nx1RKbMsizbVSq8+ylCW9JB51IkfG+D4F3ijLXe6P6M=;
 b=BcwhQC1nFPS79+7UgyRuz52ky5G7WPTfBIZDwQrLesrUwUNslzCvY6MQz4qjAAWzCA
 BZG/icLLpSn6T4LJY3vvC6yZWZ1HKjs/12tV4Z2bL90/zNRIJIMWl0ymWxzf8tpAPuyN
 md47coWnb07P28YUAVBzq6YQBgAcIR5UO8nWQm0O+/8vyzK1hVWpPTkWSe8u5u9k16iv
 i9mvT6U1vffKkB1E69/HUkMWBzWJoKhHTl6L8IcDWRTIIncFCvX8jpI5v4Wwf3TKUwpu
 b+UEdSy4SYHc0Vd9qiO48siCb6i6Kx0yaV2XgXzwuYaPqb27YoqfoUAvvJxYaniZYIe/
 +zEw==
X-Gm-Message-State: ACgBeo1oxIXWKVfBznCCYJQJINeqTa4s9yJMUaPHxyvm+n7UaFn+ugNG
 +mCCCQR99/cD0zl1m5DZEzw09g==
X-Google-Smtp-Source: AA6agR7v51mT41Dg8/amu63uXwTPDbEapJMLdnkaqwWUDzIhJtimgGroEloCmS/m+JLyAdhmUyqtqA==
X-Received: by 2002:a05:6402:5249:b0:43c:cb3e:d7f8 with SMTP id
 t9-20020a056402524900b0043ccb3ed7f8mr9073398edd.56.1660984207889; 
 Sat, 20 Aug 2022 01:30:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 gx14-20020a1709068a4e00b0072b33e91f96sm3336112ejc.190.2022.08.20.01.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 01:30:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 20 Aug 2022 10:29:34 +0200
Message-Id: <20220820082936.686924-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
References: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: [Linux-stm32] [RFC PATCH v2 2/4] ARM: dts: stm32: add CAN support
	on stm32f429
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add support for bxcan (Basic eXtended CAN controller) to STM32F429. The
chip contains two CAN peripherals, CAN1 the master and CAN2 the slave,
that share some of the required logic like clock and filters. This means
that the slave CAN can't be used without the master CAN.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f429.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c31ceb821231..da46d13e7ad4 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -362,6 +362,36 @@ i2c3: i2c@40005c00 {
 			status = "disabled";
 		};
 
+		can: can@40006400 {
+			compatible = "st,stm32f4-bxcan-core";
+			reg = <0x40006400 0x800>;
+			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			can1: can@0 {
+				compatible = "st,stm32f4-bxcan";
+				reg = <0x0>;
+				interrupts = <19>, <20>, <21>, <22>;
+				interrupt-names = "tx", "rx0", "rx1", "sce";
+				resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+				st,can-master;
+				status = "disabled";
+			};
+
+			can2: can@400 {
+				compatible = "st,stm32f4-bxcan";
+				reg = <0x400>;
+				interrupts = <63>, <64>, <65>, <66>;
+				interrupt-names = "tx", "rx0", "rx1", "sce";
+				resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
+				clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+				status = "disabled";
+			};
+		};
+
 		dac: dac@40007400 {
 			compatible = "st,stm32f4-dac-core";
 			reg = <0x40007400 0x400>;
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
