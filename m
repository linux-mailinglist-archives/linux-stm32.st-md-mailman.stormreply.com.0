Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21042359015
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Apr 2021 01:00:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8598C5718B;
	Thu,  8 Apr 2021 23:00:08 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 886C6C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 23:00:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FGcD66CYvz1qsjt;
 Fri,  9 Apr 2021 01:00:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FGcD65KxVz1sP73;
 Fri,  9 Apr 2021 01:00:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CcvGKUwzhNQf; Fri,  9 Apr 2021 01:00:05 +0200 (CEST)
X-Auth-Info: ZueXRJFGZl/M/RKQYVlX26+qhHR+c1BwMfCUIe+0Bqo=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  9 Apr 2021 01:00:05 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri,  9 Apr 2021 01:00:01 +0200
Message-Id: <20210408230001.310215-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Rework LAN8710Ai PHY reset
	on DHCOM SoM
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

The Microchip LAN8710Ai PHY requires XTAL1/CLKIN external clock to be
enabled when the nRST is toggled according to datasheet Microchip
LAN8710A/LAN8710Ai DS00002164B page 35 section 3.8.5.1 Hardware Reset:
  "
  A Hardware reset is asserted by driving the nRST input pin low. When
  driven, nRST should be held low for the minimum time detailed in
  Section 5.5.3, "Power-On nRST & Configuration Strap Timing," on page
  59 to ensure a proper transceiver reset. During a Hardware reset, an
  external clock must be supplied to the XTAL1/CLKIN signal.
  "
This is accidentally fulfilled in the current setup, where ETHCK_K is used
to supply both PHY XTAL1/CLKIN and is also fed back through eth_clk_fb to
supply ETHRX clock of the DWMAC. Hence, the DWMAC enables ETHRX clock,
that has ETHCK_K as parent, so ETHCK_K clock are also enabled, and then
the PHY reset toggles.

However, this is not always the case, e.g. in case the PHY XTAL1/CLKIN
clock are supplied by some other clock source than ETHCK_K or in case
ETHRX clock are not supplied by ETHCK_K. In the later case, ETHCK_K would
be kept disabled, while ETHRX clock would be enabled, so the PHY would
not be receiving XTAL1/CLKIN clock and the reset would fail.

Improve the DT by adding the PHY clock phandle into the PHY node, which
then also requires moving the PHY reset GPIO specifier in the same place
and that then also requires correct PHY reset GPIO timing, so add that
too.

A brief note regarding the timing, the datasheet says the reset should
stay asserted for at least 100uS and software should wait at least 200nS
after deassertion. Set both delays to 500uS which should be plenty.

Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 272a1a67a9ad..31d08423a32f 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -123,7 +123,6 @@ &ethernet0 {
 	max-speed = <100>;
 	phy-handle = <&phy0>;
 	st,eth-ref-clk-sel;
-	phy-reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 
 	mdio0 {
 		#address-cells = <1>;
@@ -132,6 +131,13 @@ mdio0 {
 
 		phy0: ethernet-phy@1 {
 			reg = <1>;
+			/* LAN8710Ai */
+			compatible = "ethernet-phy-id0007.c0f0",
+				     "ethernet-phy-ieee802.3-c22";
+			clocks = <&rcc ETHCK_K>;
+			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <500>;
+			reset-deassert-us = <500>;
 			interrupt-parent = <&gpioi>;
 			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		};
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
