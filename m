Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A87A91AF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 08:23:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91E55C6B47D;
	Thu, 21 Sep 2023 06:23:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A45BC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 12:05:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1qivxT-0004MG-T3; Wed, 20 Sep 2023 14:05:31 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qivxR-007g38-VX; Wed, 20 Sep 2023 14:05:29 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1qivxR-00BmIp-Ma; Wed, 20 Sep 2023 14:05:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 20 Sep 2023 14:05:20 +0200
Message-Id: <20230920120520.2807275-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Thu, 21 Sep 2023 06:23:20 +0000
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix ethernet pins used on
	phyCORE-STM32MP15
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

On the phyCORE-STM32MP15 the 125MHz clock for the ethernet phy must
be provided on the ETH_RGMII_GTX_CLK. ETH_RGMII_CLK125 is unused though,
so remove the latter pin and add the former.

ethernet0_rgmii_pins_d and ethernet0_rgmii_sleep_pins_d are used by the
phyCORE-STM32MP15 board only, so we can do this change in the generic
pinctrl file without breaking other boards.

Fixes: 303f3fe1d88f ("ARM: dts: stm32: Add alternate pinmux for ethernet for stm32mp15")
Cc: stable@vger.kernel.org
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 098153ee99a3a..5d85bcc8b3a8c 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -354,7 +354,7 @@ pins1 {
 
 	ethernet0_rgmii_pins_d: rgmii-3 {
 		pins1 {
-			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
+			pinmux = <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
 				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
@@ -384,8 +384,7 @@ pins3 {
 
 	ethernet0_rgmii_sleep_pins_d: rgmii-sleep-3 {
 		pins1 {
-			pinmux = <STM32_PINMUX('G', 5, ANALOG)>, /* ETH_RGMII_CLK125 */
-				 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
+			pinmux = <STM32_PINMUX('G', 4, ANALOG)>, /* ETH_RGMII_GTX_CLK */
 				 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH_RGMII_TXD0 */
 				 <STM32_PINMUX('G', 14, ANALOG)>, /* ETH_RGMII_TXD1 */
 				 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH_RGMII_TXD2 */
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
