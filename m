Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC70289A2F
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 23:08:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DC59C32EA8;
	Fri,  9 Oct 2020 21:08:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 506B5C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 21:08:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C7LJp1f4Hz1qsZn;
 Fri,  9 Oct 2020 23:08:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C7LJp14lCz1qrF1;
 Fri,  9 Oct 2020 23:08:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3M80byR1GlP6; Fri,  9 Oct 2020 23:08:24 +0200 (CEST)
X-Auth-Info: P4wFYCl4tBxSLbTT3X7wTD2x4/hhNUrnAqhx0AkMZs4=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz
 [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  9 Oct 2020 23:08:24 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri,  9 Oct 2020 23:08:20 +0200
Message-Id: <20201009210820.243659-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable internal
	pull-ups for SD bus
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

The default state of SD bus and clock line is logical HI. SD card IO is
open-drain and pulls the bus lines LO. Always enable the SD bus pull ups
to guarantee this behavior. Note that on systems with bus voltage level
shifter on the SD bus, the pull ups might also be built into the level
shifter, however that should have no negative impact.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index b2d19583450c..73d9a5b7f5ba 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1291,13 +1291,13 @@ pins1 {
 				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
 			slew-rate = <1>;
 			drive-push-pull;
-			bias-disable;
+			bias-pull-up;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
 			slew-rate = <2>;
 			drive-push-pull;
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -1447,13 +1447,13 @@ pins1 {
 				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
 			slew-rate = <1>;
 			drive-push-pull;
-			bias-disable;
+			bias-pull-up;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
 			slew-rate = <2>;
 			drive-push-pull;
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
@@ -1510,7 +1510,7 @@ pins {
 				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
 			slew-rate = <1>;
 			drive-push-pull;
-			bias-disable;
+			bias-pull-up;
 		};
 	};
 
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
