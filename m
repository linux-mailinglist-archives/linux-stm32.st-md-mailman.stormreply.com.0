Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81C358D18
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Apr 2021 20:57:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E73AFC57B6C;
	Thu,  8 Apr 2021 18:57:57 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7341BC57B69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 18:57:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrg0wR0z1s0tQ;
 Thu,  8 Apr 2021 20:57:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FGVrg0QdYz1sP6L;
 Thu,  8 Apr 2021 20:57:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3IhKjxWABGys; Thu,  8 Apr 2021 20:57:53 +0200 (CEST)
X-Auth-Info: Y+oWh5Z/E83ZtGFhjgYSHn1lsHThtGGRawrfe9BsR4U=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  8 Apr 2021 20:57:53 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu,  8 Apr 2021 20:57:31 +0200
Message-Id: <20210408185731.135511-8-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: [Linux-stm32] [PATCH 7/7] ARM: dts: stm32: Switch DWMAC RMII clock
	to MCO2 on DHCOM
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

The DHCOM SoM has two options for supplying ETHRX clock to the DWMAC
block and PHY. Either (1) ETHCK_K generates 50 MHz clock on ETH_CLK
pad for the PHY and the same 50 MHz clock are fed back to ETHRX via
internal eth_clk_fb clock connection OR (2) ETH_CLK is not used at
all, MCO2 generates 50 MHz clock on MCO2 output pad for the PHY and
the same MCO2 clock are fed back into ETHRX via ETH_RX_CLK input pad
using external pad-to-pad connection.

Option (1) has two downsides. ETHCK_K is supplied directly from either
PLL3_Q or PLL4_P, hence the PLL output is limited to exactly 50 MHz and
since the same PLL output is also used to supply SDMMC blocks, the
performance of SD and eMMC access is affected. The second downside is
that using this option, the EMI of the SoM is higher.

Option (2) solves both of those problems, so implement it here. In this
case, the PLL4_P is no longer limited and can be operated faster, at
100 MHz, which improves SDMMC performance (read performance is improved
from ~41 MiB/s to ~57 MiB/s with dd if=/dev/mmcblk1 of=/dev/null bs=64M
count=1). The EMI interference also decreases.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 272a1a67a9ad..4c7c06a7aea0 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -114,15 +114,29 @@ &dts {
 	status = "okay";
 };
 
+&rcc {
+	/* Connect MCO2 output to ETH_RX_CLK input via pad-pad connection */
+	clocks = <&rcc CK_MCO2>;
+	clock-names = "ETH_RX_CLK/ETH_REF_CLK";
+
+	/*
+	 * Set PLL4P output to 100 MHz to supply SDMMC with faster clock,
+	 * set MCO2 output to 50 MHz to supply ETHRX clock with PLL4P/2,
+	 * so that MCO2 behaves as a divider for the ETHRX clock here.
+	 */
+	assigned-clocks = <&rcc CK_MCO2>, <&rcc PLL4_P>;
+	assigned-clock-parents = <&rcc PLL4_P>;
+	assigned-clock-rates = <50000000>, <100000000>;
+};
+
 &ethernet0 {
 	status = "okay";
-	pinctrl-0 = <&ethernet0_rmii_pins_a>;
-	pinctrl-1 = <&ethernet0_rmii_sleep_pins_a>;
+	pinctrl-0 = <&ethernet0_rmii_pins_b &mco2_pins_a>;
+	pinctrl-1 = <&ethernet0_rmii_sleep_pins_b &mco2_sleep_pins_a>;
 	pinctrl-names = "default", "sleep";
 	phy-mode = "rmii";
 	max-speed = <100>;
 	phy-handle = <&phy0>;
-	st,eth-ref-clk-sel;
 	phy-reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 
 	mdio0 {
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
