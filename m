Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E56971CFC85
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 19:46:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2685DC349C6;
	Tue, 12 May 2020 17:46:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED964C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 17:46:00 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49M4wS1fZ7z1s0fW;
 Tue, 12 May 2020 19:46:00 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49M4wS0xKNz1qv84;
 Tue, 12 May 2020 19:46:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zg315hq3s0QV; Tue, 12 May 2020 19:45:58 +0200 (CEST)
X-Auth-Info: rp4/88SRJoT5dsI2XEL9rigtA3kQrgX6q+BZu0xFLPo=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 12 May 2020 19:45:58 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Tue, 12 May 2020 19:45:41 +0200
Message-Id: <20200512174544.381706-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH V2 1/4] ARM: dts: stm32: Add GPIO keys for
	STM32MP1 DHCOM PDK2
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

Add bindings for the four GPIO keys on DH PDK2 board. Note that TA1
key is polled because it's IRQ line conflicts with ethernet IRQ, the
rest of the GPIO keys, TA2, TA3, TA4, are interrupt-driven and wake
up sources.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: No change
---
 arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts | 43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
index 13b1586d4a8f..e5036c9b9e92 100644
--- a/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
@@ -4,6 +4,7 @@
  */
 
 #include "stm32mp157c-dhcom-som.dtsi"
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pwm/pwm.h>
 
 / {
@@ -46,6 +47,48 @@ ethernet_vio: vioregulator {
 		regulator-boot-on;
 	};
 
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		/*
+		 * The EXTi IRQ line 3 is shared with touchscreen and ethernet,
+		 * so mark this as polled GPIO key.
+		 */
+		button-0 {
+			label = "TA1-GPIO-A";
+			linux,code = <KEY_A>;
+			gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#size-cells = <0>;
+
+		button-1 {
+			label = "TA2-GPIO-B";
+			linux,code = <KEY_B>;
+			gpios = <&gpiod 6 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-2 {
+			label = "TA3-GPIO-C";
+			linux,code = <KEY_C>;
+			gpios = <&gpioi 11 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+
+		button-3 {
+			label = "TA4-GPIO-D";
+			linux,code = <KEY_D>;
+			gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	panel {
 		compatible = "edt,etm0700g0edh6";
 		backlight = <&display_bl>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
