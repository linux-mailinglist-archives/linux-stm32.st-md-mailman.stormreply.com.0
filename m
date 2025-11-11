Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A4C4C4A9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 09:12:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61ADDC628AC;
	Tue, 11 Nov 2025 08:12:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B352C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UNUNVWueIqfGuC4q5BrFUll2X9rFfz6vDMrrsI3WK28=; b=D2ueYuFF5SKkwVVuG1ga4EosQ1
 6EOOO3u+JYrBZqJ7CvGeGaTUBB5g4UlR0JvzmxucLjeHI8LIU6+2Og/w+v9bC76/q5d2ES5c5i9xO
 9py7DA4ddKkST+/xe9peRiNsjmMb/31CQF5Usn++QmOaY5NWfd2B07BiqrDjKdsQrKmvVbpsU62cz
 5PTUSfaf9+Y+Je+OuT+hIdwZEIjXo4QEUENAzHyIh5FGemyV9FOSWRhAaC+quhtMzKmuXNw1RiMHl
 K2V7dlm7fW/LX+EAczA7xyu+129AKm5zUtH74d8LmVvDyfcUTvC9PBtrdd4YJCJXJl72oBAKpwwsw
 XMfggluA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50410 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vIjUM-000000002CB-3Vmz;
 Tue, 11 Nov 2025 08:12:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vIjUK-0000000Dqtn-1AyK; Tue, 11 Nov 2025 08:12:28 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vIjUK-0000000Dqtn-1AyK@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:28 +0000
Cc: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next v2 09/13] net: stmmac: stm32: use
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
