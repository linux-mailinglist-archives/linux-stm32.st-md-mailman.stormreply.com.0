Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B621DC405B1
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:29:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F069C60468;
	Fri,  7 Nov 2025 14:29:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D30B0C60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=mUh+PqO/42Lq4W0yI56eLnB7Cc
 qQYVjtem/VcvMPqciPOVyqDQeM0f72dRfNFFiT/vOuMxfw1KKtIEDw5sAsPJqVkM7W9h8TivB/v7L
 YSwZwRCmWvWaLv4A0PSth2CHtY8JXln8CGDrdsjMvMrZyXo8Z5cxZa1A/ybwuQkHVEKMSPZLegXYX
 fGUpGRuuVKT9e9x/8bhwAevOxpCeokZa/Ltk68/E3q/Wce5caGe7xvdgMTSd05g9xMabuPRVF5ZFl
 RaG28mPSMlvs+ec6RepJ3uK+EaqmsIOgerdyeUZocWTZMEIipqgSBgwIEIC+HguWC1b00SO0JFUVL
 InW0hLAw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47696 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNSa-000000006ik-3X6d;
 Fri, 07 Nov 2025 14:29:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNSW-0000000DkSz-1TB4; Fri, 07 Nov 2025 14:29:00 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSW-0000000DkSz-1TB4@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:00 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next 12/16] net: stmmac: stm32: use
 PHY_INTF_SEL_x to select PHY interface
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

Convert dwmac-stm32 to use the PHY_INTF_SEL_x definitions.

For stm32mp1, the original definitions used constant 0 (GMII, 0 << 21),
BIT(21) (RGMII, 1 << 21) and BIT(23) (RMII, 4 << 21) to define these,
but from the values it can be clearly seen that these are the
PHY_INTF_SEL_x inputs to the dwmac.

For stm32mp2, the original definitions cover a bitfield 6:4 in the
SYSCFG Ethernet1 control register (according to documentation) and use
the PHY_INTF_SEL_x values.

Use the common dwmac definitions for the PHY interface selection field
by adding the bitfield mask, and using FIELD_PREP() for the bitfield
values.

This removes this incorrect use of BIT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 6c179911ef3f..1545772419d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -47,9 +47,13 @@
  *------------------------------------------
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	BIT(21)
-#define SYSCFG_PMCR_ETH_SEL_RMII	BIT(23)
-#define SYSCFG_PMCR_ETH_SEL_GMII	0
+#define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
+#define SYSCFG_PMCR_ETH_SEL_RGMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
+#define SYSCFG_PMCR_ETH_SEL_RMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
+#define SYSCFG_PMCR_ETH_SEL_GMII	\
+	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
@@ -60,9 +64,13 @@
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MII	0
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	BIT(4)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	BIT(6)
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
+#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_GMII_MII)
+#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RGMII)
+#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
+						   PHY_INTF_SEL_RMII)
 
 /* STM32MPx register definitions
  *
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
