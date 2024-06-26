Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 272599176A0
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 05:07:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C604AC71289;
	Wed, 26 Jun 2024 03:07:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C24F0C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 03:07:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D89F288216;
 Wed, 26 Jun 2024 05:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719371267;
 bh=iquN++Ww3GpiBGPHe/kSaalmOfIFnAzuVWpKNxOGuYQ=;
 h=From:To:Cc:Subject:Date:From;
 b=CpTr0UaIgmDq0b/VX7kyrfakp4EMsO/IMzBRsVd4db5r26sEPSKGLeKTlgFkvuFRA
 Fz2hhbogAUTH/4W2NdXDT7CSIsY7rc9P/ZvIBlgJMPZKNfs10TTLapNoX4GfdgPRjf
 cIdKHKqK1LBWCf8PGhGa8nezKk5aQ8w2vM+g57iCsp3YcfxtO+D6Qwy6pU/7OaIt1R
 DRe+iaW+FGFgLhPDBdEifJZSzplx0D1vcExBni4dvUaNYmGo7f+tag41qbXNp58PQN
 SfDJGN34rcXce+cSjS7Icld7YXOZ8JzrtNLemto7HMQq3vbcMpHvvpLSizjOnLOnx5
 V4oojDcgbH5Cg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Jun 2024 05:07:21 +0200
Message-ID: <20240626030736.512113-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP13xx pinmux node
	eth2-rgmii-sleep-0 copy-paste error
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

Fix pin copy-paste error in STM32MP13xx eth2-rgmii-sleep-0 pinmux
node. Clearly the pins like PG11 are not supposed to be duplicated
in the node pinmux property, fix them up to match the hardware pin
assignment.

Fixes: d1193e65647e ("ARM: dts: stm32: Add pinmux nodes for DH electronics STM32MP13xx DHCOR SoM and DHSBC board")
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
 arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
index 42995a8f5034c..9c7cf8f3c3e8b 100644
--- a/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi
@@ -157,16 +157,16 @@ eth2_rgmii_sleep_pins_a: eth2-rgmii-sleep-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD1 */
-				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD2 */
-				 <STM32_PINMUX('G', 11, ANALOG)>, /* ETH_RGMII_TXD3 */
-				 <STM32_PINMUX('G', 8, ANALOG)>, /* ETH_RGMII_TX_CTL */
-				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_GTX_CLK */
-				 <STM32_PINMUX('B', 2, ANALOG)>, /* ETH_MDIO */
+				 <STM32_PINMUX('G', 1, ANALOG)>, /* ETH_RGMII_TXD2 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* ETH_RGMII_TXD3 */
+				 <STM32_PINMUX('F', 6, ANALOG)>, /* ETH_RGMII_TX_CTL */
+				 <STM32_PINMUX('G', 3, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+				 <STM32_PINMUX('B', 6, ANALOG)>, /* ETH_MDIO */
 				 <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_MDC */
 				 <STM32_PINMUX('F', 4, ANALOG)>, /* ETH_RGMII_RXD0 */
 				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD1 */
-				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD2 */
-				 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH_RGMII_RXD3 */
+				 <STM32_PINMUX('H', 6, ANALOG)>, /* ETH_RGMII_RXD2 */
+				 <STM32_PINMUX('A', 8, ANALOG)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('A', 12, ANALOG)>, /* ETH_RGMII_RX_CTL */
 				 <STM32_PINMUX('H', 11, ANALOG)>; /* ETH_RGMII_RX_CLK */
 		};
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
