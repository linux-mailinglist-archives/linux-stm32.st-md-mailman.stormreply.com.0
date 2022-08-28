Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDA5A3DBE
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 15:33:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86712C640FF;
	Sun, 28 Aug 2022 13:33:41 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1690BC640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 13:33:41 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b16so7292101edd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RJr2H0obYN3pbdXZsdt8e1JbQn4d3baYnjPncxC8Sds=;
 b=J46e2leNHzPU4TQrl7M2tfofAsrAQ/U9ei/aP9tvHa5eHX1ABsGsXCprvYYIAGt+/S
 RLg1sDK21NULsyjqqNbkPTRCFdCxlXxSad2gXYyJ4hfNyEQk67PEb41jERPh/zgG/ZVo
 f88xaaVo36j8JDCJqp+4IJbtf+VZnvmG1hgzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RJr2H0obYN3pbdXZsdt8e1JbQn4d3baYnjPncxC8Sds=;
 b=PlU6tHgIc/LzEwRLVgyt5Y9soZROtpE4eSBV1VoRq2WJjasqhuC1SZEk+ytU55g8jd
 AtoYWZeQ9IsEq5wB0A/en26TdI1m9fjSpVZM799Nid9e9lkClvp0v1q/h5th7gcE6OlR
 f7sI+/90w1gp3FngVTZ+6r/QPsfLTqM9uH64XMko0KWja+HWmXKtR0V90JWC3eXKI3fK
 N18kDljPYc9AZgYawDdGSdoTnDyfM+6L4btIG0iNikmrs1azHb2d3ZxnB7PbIOC3A3Nf
 TFAOD1dAsHiqNNA7w3ECfrzVjywY1Yo4nFrv4WJDWnxJe0xuOn9bbtwD7odaUXUjMG+I
 rDJg==
X-Gm-Message-State: ACgBeo049w9S+7eIr1WFtJ2CSBd6VVrd52HqBriz55qwTft9llldLXlk
 PfLasgTae2vYbuH42LbEi0uoaA==
X-Google-Smtp-Source: AA6agR6pEdfi+YcBAUXSwmbacRCfYOgXN1othTOfvrhzGRq2bayOsuG5Mnhl9CV1tJrsk8vlN3hMNA==
X-Received: by 2002:aa7:cfcb:0:b0:447:b4e5:22fb with SMTP id
 r11-20020aa7cfcb000000b00447b4e522fbmr12466111edy.190.1661693620710; 
 Sun, 28 Aug 2022 06:33:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a1709064ada00b007313a25e56esm3247669ejt.29.2022.08.28.06.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 06:33:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Aug 2022 15:33:27 +0200
Message-Id: <20220828133329.793324-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
References: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v3 2/4] ARM: dts: stm32: add CAN support
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add "clocks" to can@0 node.

 arch/arm/boot/dts/stm32f429.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c31ceb821231..e04cf73a8caa 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -362,6 +362,37 @@ i2c3: i2c@40005c00 {
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
+				clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
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
