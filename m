Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A9717D19
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 12:21:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 874ABC6A61A;
	Wed, 31 May 2023 10:21:26 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30A0AC6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 10:21:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1q4IxA-0002GX-QJ; Wed, 31 May 2023 12:21:16 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1q4Ix9-0045I6-Aj; Wed, 31 May 2023 12:21:15 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ore@pengutronix.de>)
 id 1q4Ix8-00E4cr-Jy; Wed, 31 May 2023 12:21:14 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>
Date: Wed, 31 May 2023 12:21:13 +0200
Message-Id: <20230531102113.3353065-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531102113.3353065-1-o.rempel@pengutronix.de>
References: <20230531102113.3353065-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 2/2] ARM: dts: stm32: prtt1c: Add PoDL PSE
	regulator nodes
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

This commit introduces Power over Data Line (PoDL) Power Source
Equipment (PSE) regulator nodes to the PRTT1C devicetree. The addition
of these nodes enables support for PoDL in PRTT1C devices, allowing
power delivery and data transmission over a single twisted pair.

The new PoDL PSE regulator nodes provide voltage capability information
of the current board design, which can be used as a hint for system
administrators when configuring and managing power settings. This update
enhances the versatility and simplifies the power management of PRTT1C
devices while ensuring compatibility with connected Powered Devices
(PDs).

After applying this patch, the power delivery can be controlled from
user space with a patched [1] ethtool version using the following commands:
  ethtool --set-pse t1l2 podl-pse-admin-control enable
to enable power delivery, and
  ethtool --show-pse t1l2
to display the PoDL PSE settings.

By integrating PoDL PSE support into the PRTT1C devicetree, users can
benefit from streamlined power and data connections in their
deployments, improving overall system efficiency and reducing cabling
complexity.

[1] https://lore.kernel.org/all/20230317093024.1051999-1-o.rempel@pengutronix.de/

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/stm32mp151a-prtt1c.dts | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151a-prtt1c.dts b/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
index 58bb05a8c685..ca0d3329cfd7 100644
--- a/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
+++ b/arch/arm/boot/dts/stm32mp151a-prtt1c.dts
@@ -23,6 +23,18 @@ clock_sja1105: clock-sja1105 {
 		clock-frequency = <25000000>;
 	};
 
+	pse_t1l1: ethernet-pse-1 {
+		compatible = "podl-pse-regulator";
+		pse-supply = <&reg_t1l1>;
+		#pse-cells = <0>;
+	};
+
+	pse_t1l2: ethernet-pse-2 {
+		compatible = "podl-pse-regulator";
+		pse-supply = <&reg_t1l2>;
+		#pse-cells = <0>;
+	};
+
 	mdio0: mdio {
 		compatible = "virtual,mdio-gpio";
 		#address-cells = <1>;
@@ -32,6 +44,24 @@ mdio0: mdio {
 
 	};
 
+	reg_t1l1: regulator-pse-t1l1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pse-t1l1";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&gpiog 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_t1l2: regulator-pse-t1l2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pse-t1l2";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		gpio = <&gpiog 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpiod 8 GPIO_ACTIVE_LOW>;
@@ -92,6 +122,7 @@ t1l1_phy: ethernet-phy@7 {
 		reset-gpios = <&gpiog 12 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10>;
 		reset-deassert-us = <35>;
+		pses = <&pse_t1l1>;
 	};
 
 	/* TI DP83TD510E */
@@ -102,6 +133,7 @@ t1l2_phy: ethernet-phy@10 {
 		reset-gpios = <&gpiog 11 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10>;
 		reset-deassert-us = <35>;
+		pses = <&pse_t1l2>;
 	};
 
 	/* Micrel KSZ9031 */
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
