Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A43C5E9512
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Sep 2022 19:52:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 417B4C63326;
	Sun, 25 Sep 2022 17:52:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EE13C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 17:52:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id hy2so9832617ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 10:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dOPE1L7q5E7QdZRAYhm0K2Z1Q5vapQyABM0Y6Kwo/zE=;
 b=rpXllgi1ui0C+7mDAPG3UTMJMKX3GqJkXwVqkF+rT3uGpiGSLf62ihJPuG3CrAO29p
 cRw4A0eLtVJGfsdxFTl89+sNm9OMd/yJTYiqKk2U84orUKiBk2K4xlK7gzMbcEOTARY/
 56WOCSemX4jGl5BmH2khUUmFEpCsQmBUAM/ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dOPE1L7q5E7QdZRAYhm0K2Z1Q5vapQyABM0Y6Kwo/zE=;
 b=ggeRA4NUGKCCJoYk870j1+DDQWsU+tqosSIHiYJdzlMH7iT3PEzOori77JpPdG39hV
 6hoD1U87HMAkC967dLoeg/DowvQz7MdIMlTT4jUNvRKywhm4hxJICm7xlwYWaZ3fZ6C+
 mB/XqLHTHK9f3Gz/moS28BHgu3nlxb2ld8RFls1aSS1YfC4/mfknlAsLl8ykZa4bLuTf
 w/D2XjFAph5hdZvGSNwH3kNsnADBpjwyOXbvPb2bWIFWU/O6qpsiK0rlBUYX/zTqMTsl
 ZCZdZzDilrUGgWaxnCzTx554soaZpwDLxoXF4hb8qutEVBsa2duY9tcvfUD8GJD+ZkpQ
 lMiA==
X-Gm-Message-State: ACrzQf0hWYxz41l6TwfPlubY6sZSZ6Vkx5549dhjrGvpw69Jn5nVv6uz
 EtOTPqedky4ZzV8VyHGFd0gedg==
X-Google-Smtp-Source: AMsMyM7aJJDiFqfcUqHoW3X3EVzo65dZxU25xJIKTVawhR1ThjMIQqAHd5wMOFH5AhT+XV1BFlOEPw==
X-Received: by 2002:a17:907:6e17:b0:783:7839:ff3f with SMTP id
 sd23-20020a1709076e1700b007837839ff3fmr1778971ejc.300.1664128341028; 
 Sun, 25 Sep 2022 10:52:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-92-192.retail.telecomitalia.it. [95.232.92.192])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a056402161700b0045703d699b9sm3252594edv.78.2022.09.25.10.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 10:52:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 25 Sep 2022 19:52:07 +0200
Message-Id: <20220925175209.1528960-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
References: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RFC PATCH v4 3/5] ARM: dts: stm32: add CAN support
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

Changes in v4:
- Replace the node can@40006400 (compatible "st,stm32f4-bxcan-core")
  with the gcan@40006600 node ("sysnode" compatible). The gcan node
  contains clocks and memory addresses shared by the two can nodes
  of which it's no longer the parent.
- Add to can nodes the "st,gcan" property (global can memory) which
  references the gcan@40006600 node ("sysnode compatibble).

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add "clocks" to can@0 node.

 arch/arm/boot/dts/stm32f429.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c31ceb821231..ce08872109b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -362,6 +362,35 @@ i2c3: i2c@40005c00 {
 			status = "disabled";
 		};
 
+		gcan: gcan@40006600 {
+			compatible = "st,stm32f4-gcan", "syscon";
+			reg = <0x40006600 0x200>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+		};
+
+		can1: can@40006400 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006400 0x200>;
+			interrupts = <19>, <20>, <21>, <22>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN1)>;
+			st,can-master;
+			st,gcan = <&gcan>;
+			status = "disabled";
+		};
+
+		can2: can@40006800 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006800 0x200>;
+			interrupts = <63>, <64>, <65>, <66>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
+			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+			st,gcan = <&gcan>;
+			status = "disabled";
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
