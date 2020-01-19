Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260D1424A6
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jan 2020 09:01:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E90F6C36B0F;
	Mon, 20 Jan 2020 08:01:00 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51CFCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Jan 2020 19:11:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4814DG6j6Jz1rghX;
 Sun, 19 Jan 2020 20:11:58 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4814DG60Ctz1qwyZ;
 Sun, 19 Jan 2020 20:11:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id US30GIvdsmM7; Sun, 19 Jan 2020 20:11:57 +0100 (CET)
X-Auth-Info: Xhvpg4TcWhz+PoLu784cV+9ULGAG4ZzsSuSIaHhsJww=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 19 Jan 2020 20:11:57 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 19 Jan 2020 20:11:39 +0100
Message-Id: <20200119191143.50033-2-marex@denx.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200119191143.50033-1-marex@denx.de>
References: <20200119191143.50033-1-marex@denx.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:00:59 +0000
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2 2/6] ARM: dts: stm32: Add SAI2A pins B
	pinmux entry on stm32mp1
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

Add pinmux entry for SAI2A with alternative pin configuration.
This is useful in combination with sai2b_pins_b e.g. for codecs
like SGTL5000.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: New patch
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index f40f66a692a1..2927a812bb26 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -719,6 +719,26 @@ pins {
 		};
 	};
 
+
+	sai2a_pins_b: sai2a-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/* SAI2_SD_A */
+				 <STM32_PINMUX('I', 7, AF10)>,	/* SAI2_FS_A */
+				 <STM32_PINMUX('D', 13, AF10)>;	/* SAI2_SCK_A */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
+
+	sai2a_sleep_pins_b: sai2a-sleep-3 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, ANALOG)>,  /* SAI2_SD_A */
+				 <STM32_PINMUX('I', 7, ANALOG)>,  /* SAI2_FS_A */
+				 <STM32_PINMUX('D', 13, ANALOG)>; /* SAI2_SCK_A */
+		};
+	};
+
 	sai2b_pins_a: sai2b-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 12, AF10)>, /* SAI2_SCK_B */
-- 
2.24.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
