Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F583928353
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 09:59:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6AEAC78013;
	Fri,  5 Jul 2024 07:59:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DEE6C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 07:59:35 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5AB7488582;
 Fri,  5 Jul 2024 09:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720166374;
 bh=LUMN2EorVK9ZKjl3nYk8pUQwq1AjgjHL4pNrj0IYSJw=;
 h=From:To:Cc:Subject:Date:From;
 b=JZcAVWx0EAJd042yS0KXafKStaPIkXd11HVdsa+14pkHeP0Mgx+nkkGu4gf8x95I2
 VByYH7+UQriML715NLCPSbOVlSji1cKmujUYFzu0k3QrQJWiGyfdksMp80LTgxvabu
 OEBobzv/5MINoNxVYmg324G5/Ikhtr3argMQ6t5tTUNNosfSTuIrtryfiR0vkGYBsh
 qQUJTeHITexGPp0nyFcmNEl5upHXL9/nReHQoeuiqimD+5jN4TNpXKq2b8EZJ9uerF
 e4X1NRGoag6GfLIm/acYymsC/xVAqfEph2TaXfNG98mTTbSXLzrUZ0E69A6rUbcNsD
 4qGNfH+IGQkKA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri,  5 Jul 2024 09:59:10 +0200
Message-ID: <20240705075918.41213-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Keep MDIO bus in AF
	across suspend DH STM32MP13xx DHCOR DHSBC board
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

The RTL8211F PHY gets confused when the MDIO bus lines get switched
to ANALOG during suspend/resume cycle. Keep the MDIO and MDC lines
in AF during suspend/resume to avoid confusing the PHY. The PHY can
be brought out of the confused state by restarting auto-negotiation
too, but that seems like an odd workaround and shouldn't be in the
PHY driver.

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
V2: Fixup the eth2_rgmii_sleep_pins_a into AF as well
---
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index ca19c8c6b6771..62c64e9c2b9f0 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -94,14 +94,20 @@ pins2 {
 	/omit-if-no-ref/
 	eth1_rgmii_sleep_pins_a: eth1-rgmii-sleep-0 {
 		pins1 {
+			pinmux = <STM32_PINMUX('A', 2, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 2, AF11)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+
+		pins2 {
 			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
 				 <STM32_PINMUX('E', 5, ANALOG)>, /* ETH_RGMII_TXD3 */
 				 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH_RGMII_TX_CTL */
 				 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-				 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH_MDIO */
-				 <STM32_PINMUX('G', 2, ANALOG)>, /* ETH_MDC */
 				 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
 				 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH_RGMII_RXD1 */
 				 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH_RGMII_RXD1 */
@@ -178,14 +184,20 @@ pins2 {
 	/omit-if-no-ref/
 	eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
 		pins1 {
+			pinmux = <STM32_PINMUX('B', 6, AF11)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 5, AF10)>; /* ETH_MDC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+
+		pins2 {
 			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('G', 1, ANALOG)>, /* ETH_RGMII_TXD2 */
 				 <STM32_PINMUX('E', 6, ANALOG)>, /* ETH_RGMII_TXD3 */
 				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_TX_CTL */
 				 <STM32_PINMUX('G', 3, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-				 <STM32_PINMUX('B', 6, ANALOG)>, /* ETH_MDIO */
-				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
 				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
 				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
 				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
