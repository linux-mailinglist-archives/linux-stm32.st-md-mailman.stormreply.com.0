Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AEC9BD9BB
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 00:30:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2350C71292;
	Tue,  5 Nov 2024 23:30:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39BF3C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 23:30:45 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4330888EBB;
 Wed,  6 Nov 2024 00:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730849444;
 bh=GL0GAPR6jFPg/XAdj5ZTtn6Z4oNSGAhsnvnHgYMD92k=;
 h=From:To:Cc:Subject:Date:From;
 b=onB7/sx4/0zM8uccNeK5wlWG6kul7jeNj8h6l8EJPVXIU2aKXw0/FtBPaXOc/zaxW
 DdK2RD2y94KJckIJ/X3DXO2vVUK7B358aT6XyA8rrwsFzw1+faKVvjZ3cRagapzEMu
 ymKgp7Ls5sn4jtsvybw3rxSkFiWHOkm1A1M81HcwmRHDs3vYLxLP1Nb7CfclKSYmod
 asg9mm7fIh6JABMWpFxFykXIBqAUreUfkM/f8o+R3l2RP7BhEEmV9SXgYbdfobBlmU
 g5CCt6e3ONlUtqdpT9/Pncy1qhXyNzh1WnYGvKEfSGCdlE5+gs6E6ikpbtSNeOt3Qr
 oWWek9ufzpIDA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  6 Nov 2024 00:29:44 +0100
Message-ID: <20241105233026.161463-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate serial aliases
	and chosen node for STM32MP15xx DHCOM SoM
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

Deduplicate /aliases { serialN = ... } and /chosen node into
stm32mp15xx-dhcom-som.dtsi , since the content is identical
on all carrier boards using the STM32MP15xx DHCOM SoM. No
functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi   | 12 ------------
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi    | 10 ----------
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi | 10 ----------
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi     |  7 +++++++
 4 files changed, 7 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
index bb4f8a0b937f3..abe2dfe706364 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi
@@ -6,18 +6,6 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pwm/pwm.h>
 
-/ {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
 &adc {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
index 171d7c7658fa8..0fb4e55843b9d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi
@@ -7,16 +7,6 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	clk_ext_audio_codec: clock-codec {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
index b5bc53accd6b2..01c693cc03446 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-picoitx.dtsi
@@ -7,16 +7,6 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
-	aliases {
-		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart8;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
 	led {
 		compatible = "gpio-leds";
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 74a11ccc5333f..086d3a60ccce2 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -14,6 +14,13 @@ aliases {
 		ethernet1 = &ksz8851;
 		rtc0 = &hwrtc;
 		rtc1 = &rtc;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart8;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@c0000000 {
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
