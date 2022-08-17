Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE559813B
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 12:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 222ADC640FA;
	Thu, 18 Aug 2022 10:04:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8939EC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 14:36:37 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y3so17763890eda.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=44iy7ssOSOFDHgG+aTzhL/TF56VP+7fbMIq0O0tw95M=;
 b=kNgAFIpeBNzIEIzbFVEhGVNc7KO9HKliCbkHTpz445TVm6Yny6hJV+Wih/0fAv4Bqj
 KuH7uUi42qxCwJIZBJVlADidAlLgT3c6Air0Y6H/EOzGU6fHZvTmVRGluRGRFCZ3fWVb
 R1IyQ33PnDOl9yt+WqeiOkgpjILvoB8gy5kc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=44iy7ssOSOFDHgG+aTzhL/TF56VP+7fbMIq0O0tw95M=;
 b=3EpLvjvTFCQsYsrQK0Yj30GqGzGLdHosUxZrKtgIAwf0f1/eUduiPfEswTRbf9SBhw
 Cyaun6RT/99XrGRsxz7Q2t2LDvyBrDH/RrqVO2PbwwoUkEDomcmPKqx/zJoi+bRheUVu
 W86UddeuaNk2BkEhNXs/bZocYdq2iIlqPZi2NTxO+v/fxQfrY9/FlHvqZ2OzKnEPFn/B
 fZPBbY0jXO/cfAToXKruToZhEPfBr/rgAc8BhsmDkwjlN0/iOn/lVhBR96Cltu5EgWIR
 ajXps96J5/OiGkspCsDr5g/wM9JTEIuq289O36bZiEsRpna9hxUYD6e/gmiPOei2DLR+
 hI9w==
X-Gm-Message-State: ACgBeo09cDxzvOGxG3unIaFWa15AaH1b+Ta7G9+uuWXrn0eJLpC9vdJr
 uhksgpzSbRe7EqSPCMc9Qofhgw==
X-Google-Smtp-Source: AA6agR5dD/OGPPqsyDoIs+k9yiUHOrfw19O6SnqvGaolDfVmzq9NpxN/wYeQERg8C3RzotAFaDH/cg==
X-Received: by 2002:a05:6402:10d2:b0:445:d9ee:fc19 with SMTP id
 p18-20020a05640210d200b00445d9eefc19mr2920832edu.81.1660746997217; 
 Wed, 17 Aug 2022 07:36:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa7c7c9000000b0043cab10f702sm10711982eds.90.2022.08.17.07.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 07:36:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 17 Aug 2022 16:35:27 +0200
Message-Id: <20220817143529.257908-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
References: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Aug 2022 10:04:14 +0000
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, Dario Binacchi <dariobin@libero.it>
Subject: [Linux-stm32] [RFC PATCH 2/4] ARM: dts: stm32: add CAN support on
	stm32f429
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

 arch/arm/boot/dts/stm32f429.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c31ceb821231..28db387ad5e8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -362,6 +362,36 @@ i2c3: i2c@40005c00 {
 			status = "disabled";
 		};
 
+		can: can@40006400 {
+			compatible = "st,stm32-bxcan-core";
+			reg = <0x40006400 0x800>;
+			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			can1: can@0 {
+				compatible = "st,stm32-bxcan";
+				reg = <0x0>;
+				interrupts = <19>, <20>, <21>, <22>;
+				interrupt-names = "tx", "rx0", "rx1", "sce";
+				resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+				master;
+				status = "disabled";
+			};
+
+			can2: can@400 {
+				compatible = "st,stm32-bxcan";
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
