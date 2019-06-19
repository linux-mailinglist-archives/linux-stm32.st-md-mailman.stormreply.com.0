Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637304B554
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:48:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 289F0C593DB
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:48:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B6ADC593D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:48:43 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BA112E000D;
 Wed, 19 Jun 2019 09:48:40 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>
Date: Wed, 19 Jun 2019 11:47:25 +0200
Message-Id: <0afe15465ec548e5ae2304c822267710a678f6c4.1560937626.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 16/16] arm64: dts: allwinner: Switch from
	phy-mode to phy-connection-type
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

The phy-mode device tree property has been deprecated in favor of
phy-connection-type, let's replace it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2:
  - new patch
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts        | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts          | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts           | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts        | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts         | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts              | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts          | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts             | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 208373efee49..2484142f855c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -127,7 +127,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dc1sw>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
index 9b9d9157128c..b8d93c6e9469 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
@@ -102,7 +102,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
index 787ebd805a3b..ba7ba6d1d840 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
@@ -30,7 +30,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dc1sw>;
 	allwinner,tx-delay-ps = <600>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 01a9a52edae4..e3f691b358da 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -102,7 +102,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
 	allwinner,tx-delay-ps = <600>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index 5ef3c62c765e..738497489afd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -129,7 +129,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_gmac_3v3>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
index 24f1aac366d6..234d0e66cbdc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
@@ -52,7 +52,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 409523cb0950..7458469a60f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -103,7 +103,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rmii_pins>;
-	phy-mode = "rmii";
+	phy-connection-type = "rmii";
 	phy-handle = <&ext_rmii_phy1>;
 	phy-supply = <&reg_dc1sw>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index e6fb9683f213..14ba7f4119a3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -115,7 +115,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dc1sw>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 0dc33c90dd60..80916c0e08f2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -64,7 +64,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ext_rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_aldo2>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 9e464d40cbff..8292d944ff7b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -66,7 +66,7 @@
 &emac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ext_rgmii_pins>;
-	phy-mode = "rgmii";
+	phy-connection-type = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_aldo2>;
 	allwinner,rx-delay-ps = <200>;
-- 
git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
