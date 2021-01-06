Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B50A52EC552
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 21:44:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72491C57195;
	Wed,  6 Jan 2021 20:44:07 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A618C56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 20:44:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DB1Yf0HlNz1qs0Z;
 Wed,  6 Jan 2021 21:44:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DB1Yf033Tz1sFWf;
 Wed,  6 Jan 2021 21:44:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wB5LB0z7pRoK; Wed,  6 Jan 2021 21:44:04 +0100 (CET)
X-Auth-Info: SX+YpYpFai9fqf0Jl2Q3r21T+zy/SZ45RThMnmv+264=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  6 Jan 2021 21:44:04 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed,  6 Jan 2021 21:43:46 +0100
Message-Id: <20210106204347.475920-3-marex@denx.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106204347.475920-1-marex@denx.de>
References: <20210106204347.475920-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/4] [RFC] ARM: dts: stm32: Add mux for ETHRX
	clock
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

The implementation of ETH_RX_CLK/ETH_REF_CLK handling currently does not
permit selecting the clock input from SoC pad. To make things worse, the
implementation of this is partly present and is split between the clock
driver and dwmac4 driver. Moreover, the ETHRX clock parent is incorrect.

First, the ETHRX clock in clk-stm32mp1.c only represents the ETHRXEN gate,
however it should represent also ETH_REF_CLK_SEL mux. The problem is that
the ETH_REF_CLK_SEL mux is currently configured in the DWMAC4 driver and
the ETH_REF_CLK_SEL bit is part of SYSCFG block, not the DWMAC4 or the
clock block.

Second, the ETHRX parent clock is either eth_clk_fb (ETHCK_K) or external
ETH_RX_CLK/ETH_REF_CLK_SEL, it is never CK_AXI.

This patch attempts to address the clock selection by adding fixed factor
clock to DT, which allows the user to select its upstream clock.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp151.dtsi | 8 ++++++++
 drivers/clk/clk-stm32mp1.c        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 32875eabd357..8c2a5d0875d8 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -82,6 +82,14 @@ clk_csi: clk-csi {
 			compatible = "fixed-clock";
 			clock-frequency = <4000000>;
 		};
+
+		clk_eth_rx: eth-rx-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&rcc ETHCK_K>;
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+		};
 	};
 
 	thermal-zones {
diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a875649df8b8..63971d40f15c 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1892,7 +1892,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PCLK(MDMA, "mdma", "ck_axi", 0, G_MDMA),
 	PCLK(GPU, "gpu", "ck_axi", 0, G_GPU),
 	PCLK(ETHTX, "ethtx", "ck_axi", 0, G_ETHTX),
-	PCLK(ETHRX, "ethrx", "ck_axi", 0, G_ETHRX),
+	PCLK(ETHRX, "ethrx", "eth-rx-clk", 0, G_ETHRX),
 	PCLK(ETHMAC, "ethmac", "ck_axi", 0, G_ETHMAC),
 	PCLK(FMC, "fmc", "ck_axi", CLK_IGNORE_UNUSED, G_FMC),
 	PCLK(QSPI, "qspi", "ck_axi", CLK_IGNORE_UNUSED, G_QSPI),
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
