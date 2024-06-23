Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA9913DCA
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 21:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6558C71287;
	Sun, 23 Jun 2024 19:52:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4F32C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 19:52:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DDB09866F6;
 Sun, 23 Jun 2024 21:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719172367;
 bh=XALLwSMwLcHJcTRX6dGhf2yozSIuQndpw7MNCg30264=;
 h=From:To:Cc:Subject:Date:From;
 b=KADIVKLTbNsLKcxr7J7wteQwem77OZdAR1IRUkidugSa2H7YHeO1ilCqKCqzriqs9
 nN41YiG5DVCKhBGT1jgzQl7Av3DG79zaJxj9gRGx/ZI89UTGvKiQZXKNBHYMvEZwjL
 iuzpbP/j1WRZELATVvj/Bv+SDk6eAuujCoyy1GAwIoxb/7kROUfgl7BQvmmzUipmpi
 zsgR/U3r7+zhj+ZnuG6Tj778hY7a7Zn4VfQbseVjCYp/cNWd+JjDJZKJTVoFM2H70f
 2XBTTSecDmq5YTyffgZIldgcNwGc+hNaFhbuqyMS218QRoh2uwTw8aBoOcoPzBNPik
 NaGHopIg0lHzg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 23 Jun 2024 21:51:56 +0200
Message-ID: <20240623195233.81550-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet support for DH
	STM32MP13xx DHCOR DHSBC board
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

Add ethernet support for the DH STM32MP13xx DHCOR DHSBC carrier board.
This carrier board is populated with two gigabit ethernet ports and two
Realtek RTL8211F PHYs, both are described in this DT patch.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../boot/dts/st/stm32mp135f-dhcor-dhsbc.dts   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 5f4f6b6e427a5..bacb70b4256bc 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -22,6 +22,8 @@ / {
 		     "st,stm32mp135";
 
 	aliases {
+		ethernet0 = &ethernet1;
+		ethernet1 = &ethernet2;
 		serial2 = &usart1;
 		serial3 = &usart2;
 	};
@@ -72,6 +74,60 @@ channel@12 {
 	};
 };
 
+&ethernet1 {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&eth1_rgmii_pins_a>;
+	pinctrl-1 = <&eth1_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		ethphy1: ethernet-phy@1 {
+			/* RTL8211F */
+			compatible = "ethernet-phy-id001c.c916";
+			interrupt-parent = <&gpiog>;
+			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+			reg = <1>;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <55000>;
+			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ethernet2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&eth2_rgmii_pins_a>;
+	pinctrl-1 = <&eth2_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		ethphy2: ethernet-phy@1 {
+			/* RTL8211F */
+			compatible = "ethernet-phy-id001c.c916";
+			interrupt-parent = <&gpiog>;
+			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+			reg = <1>;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <55000>;
+			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
 &gpioa {
 	gpio-line-names = "", "", "", "",
 			  "", "DHSBC_USB_PWR_CC1", "", "",
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
