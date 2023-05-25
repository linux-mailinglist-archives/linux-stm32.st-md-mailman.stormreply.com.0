Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BEB711511
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 20:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D8F5C6B444;
	Thu, 25 May 2023 18:44:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E48DC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 18:44:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71BA661A0A;
 Thu, 25 May 2023 18:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B5EC433D2;
 Thu, 25 May 2023 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685040293;
 bh=vORvJDqEG/SDq1MMtO0s5opX29bxJWLYHH31w8o0Hb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iIM82MrMqkoqWpKVLtMrzEer5alY4IQL2ZwVGZObe4s5QuT/7U9CvUKiqJ0XkNSoF
 0sWhWvBUI8d7D4dLkl7WwTdMCnbIPFo0r595GkCqxHwweCcdLKes4GuPdFv1QqP8hk
 Pms2LV18KDR0IWQ0Fiv1wBwSriB5tVKIglOBc1cIqkp/jZxBiz/GcG/zClpBX0y8PK
 +9WUic6n6Ng9mV6Qqj6uRpa5BWNjvnCnlLcFth+9oHdnFBadfFnh0yRcbPwTGNaJ6V
 wZ3wiVdfg2WOR7+on3uIMltl4rdycrYIoZZ6X5PmcsoDHFZ4uuFsIXjitnZXproDQp
 5hGgsLe/M4yyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 25 May 2023 14:43:46 -0400
Message-Id: <20230525184356.1974216-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525184356.1974216-1-sashal@kernel.org>
References: <20230525184356.1974216-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, robh+dt@kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, krzysztof.kozlowski+dt@linaro.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 20/27] ARM: dts: stm32: add CAN
	support on stm32f746
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

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

[ Upstream commit 0920ccdf41e3078a4dd2567eb905ea154bc826e6 ]

Add support for bxcan (Basic eXtended CAN controller) to STM32F746. The
chip contains three CAN peripherals, CAN1 and CAN2 in dual peripheral
configuration and CAN3 in single peripheral configuration:
- Dual CAN peripheral configuration:
  * CAN1: Primary bxCAN for managing the communication between a secondary
    bxCAN and the 512-byte SRAM memory.
  * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
  This means that the two bxCAN cells share the 512-byte SRAM memory and
  CAN2 can't be used without enabling CAN1.
- Single CAN peripheral configuration:
  * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
    512-byte SRAM memory.

 -------------------------------------------------------------------------
| features | CAN1              | CAN2               | CAN 3               |
 -------------------------------------------------------------------------
| SRAM     | 512-byte shared between CAN1 & CAN2    | 512-byte            |
 -------------------------------------------------------------------------
| Filters  | 26 filters shared between CAN1 & CAN2  | 14 filters          |
 -------------------------------------------------------------------------

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Link: https://lore.kernel.org/all/20230427204540.3126234-6-dario.binacchi@amarulasolutions.com
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32f746.dtsi | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index be62d9091e038..724bc7c88685f 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -297,6 +297,23 @@ rtc: rtc@40002800 {
 			status = "disabled";
 		};
 
+		can3: can@40003400 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40003400 0x200>;
+			interrupts = <104>, <105>, <106>, <107>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F7_APB1_RESET(CAN3)>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
+			st,gcan = <&gcan3>;
+			status = "disabled";
+		};
+
+		gcan3: gcan@40003600 {
+			compatible = "st,stm32f4-gcan", "syscon";
+			reg = <0x40003600 0x200>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN3)>;
+		};
+
 		usart2: serial@40004400 {
 			compatible = "st,stm32f7-uart";
 			reg = <0x40004400 0x400>;
@@ -377,6 +394,36 @@ i2c4: i2c@40006000 {
 			status = "disabled";
 		};
 
+		can1: can@40006400 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006400 0x200>;
+			interrupts = <19>, <20>, <21>, <22>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F7_APB1_RESET(CAN1)>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
+			st,can-primary;
+			st,gcan = <&gcan1>;
+			status = "disabled";
+		};
+
+		gcan1: gcan@40006600 {
+			compatible = "st,stm32f4-gcan", "syscon";
+			reg = <0x40006600 0x200>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN1)>;
+		};
+
+		can2: can@40006800 {
+			compatible = "st,stm32f4-bxcan";
+			reg = <0x40006800 0x200>;
+			interrupts = <63>, <64>, <65>, <66>;
+			interrupt-names = "tx", "rx0", "rx1", "sce";
+			resets = <&rcc STM32F7_APB1_RESET(CAN2)>;
+			clocks = <&rcc 0 STM32F7_APB1_CLOCK(CAN2)>;
+			st,can-secondary;
+			st,gcan = <&gcan1>;
+			status = "disabled";
+		};
+
 		cec: cec@40006c00 {
 			compatible = "st,stm32-cec";
 			reg = <0x40006C00 0x400>;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
