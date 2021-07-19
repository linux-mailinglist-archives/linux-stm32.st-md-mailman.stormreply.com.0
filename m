Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B786A3CE39E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 18:28:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CFA5C57B6B;
	Mon, 19 Jul 2021 16:28:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA631C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 16:28:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E3D1613F7;
 Mon, 19 Jul 2021 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626712087;
 bh=5wk83Sjp3WuftAL9eBfzYogS71sDOFsek0kSjaa2dFo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XHb+y0J2EUbWtrmHYCyxCt3jlWKdOjCMcPU4JBr/9aVupuAd1eLMgqZ8uwlXWaxbA
 /HZyCYF+HNLiz8u+ZopGBGOQictRF0oPM/cRARAHrgfKrW/UvWCVqzFsEjvehGUcfk
 fvM81DpR79034XfaU5kpmluosjbsQ5UQtGuWLjrI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 19 Jul 2021 16:55:07 +0200
Message-Id: <20210719144951.009019565@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719144942.514164272@linuxfoundation.org>
References: <20210719144942.514164272@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 5.12 245/292] ARM: dts: stm32: Rework
	LAN8710Ai PHY reset on DHCOM SoM
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 1cebcf9932ab76102e8cfc555879574693ba8956 ]

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
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 2617815e42a6..30e4d990c5a3 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -119,7 +119,6 @@
 	max-speed = <100>;
 	phy-handle = <&phy0>;
 	st,eth-ref-clk-sel;
-	phy-reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 
 	mdio0 {
 		#address-cells = <1>;
@@ -128,6 +127,13 @@
 
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
