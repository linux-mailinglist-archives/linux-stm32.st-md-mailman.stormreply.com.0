Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A048C407B8
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 15:59:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5EFBC6046A;
	Fri,  7 Nov 2025 14:59:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5EA3C60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nxKxjy/C3oPWob4dBvPPL6F8jhZxW9+kJIyvEtBbh7A=; b=CPnkQ/JKGlnhsZP7olTVHXoO56
 ZtNRVW5PrJWImlfI+MZDhkWVn7VIaCAgmep0krm9sBkoCgWXCHbEaUaVR0MT84q98R4L/ghHWUhPs
 FJ+Qh32UwhEcAtJVfgQeT3QJyYTrLQYKJq0lh3PGtuDxsx7qYup3jQM8NM5pnqUc3LJdk44jY4A2M
 wd3t8p7v8gqZNGaBa7g/hSOD1KjSdsbjevxpvO/bY5pg3I4z91TbmxORLGXyJPK9xSCcxClue8hId
 JGfee8ETjXeLLl20zbI0CNPgDMVcS516BVuGcGNn06nujeWe00Oh0hwtjxscycfUACiQFXEsf2rWP
 ZSchN2qA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47708 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vHNSg-000000006j5-2SUq;
 Fri, 07 Nov 2025 14:29:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vHNSb-0000000DkT4-1s8G; Fri, 07 Nov 2025 14:29:05 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSb-0000000DkT4-1s8G@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:05 +0000
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
Subject: [Linux-stm32] [PATCH net-next 13/16] net: stmmac: stm32: use
 PHY_INTF_SEL_x directly
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

Rather than defining separate constants for each, use the
PHY_INTF_SEL_x definitions in the switch()es configuring the
control register, and use one FIELD_PREP() to convert phy_intf_sel
to the register value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1545772419d5..18d26f096f5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -48,30 +48,17 @@
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
 #define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
-#define SYSCFG_PMCR_ETH_SEL_RMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
-#define SYSCFG_PMCR_ETH_SEL_GMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
 /* STM32MP2 register definitions */
 #define SYSCFG_MP2_ETH_MASK		GENMASK(31, 0)
 
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
 #define SYSCFG_ETHCR_ETH_PTP_CLK_SEL	BIT(2)
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
-#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_GMII_MII)
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RGMII)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RMII)
-
 /* STM32MPx register definitions
  *
  * Below table summarizes the clock requirement and clock sources for
@@ -244,10 +231,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	u32 reg = dwmac->mode_reg;
+	u8 phy_intf_sel;
 	int val = 0;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		/*
 		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
 		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
@@ -258,12 +247,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 			val |= SYSCFG_PMCR_ETH_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
-		val = SYSCFG_PMCR_ETH_SEL_GMII;
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_PMCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
 		break;
@@ -271,7 +260,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_PMCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
@@ -284,6 +273,8 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, phy_intf_sel);
+
 	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
 	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
 
@@ -299,6 +290,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	u8 phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	u32 reg = dwmac->mode_reg;
 	int val = 0;
 
@@ -307,7 +299,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 		/* ETH_REF_CLK_SEL bit in SYSCFG register is not applicable in MII mode */
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_ETHCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck) {
 			/* Internal clock ETH_CLK of 50MHz from RCC is used */
 			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
@@ -317,7 +309,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_ETHCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		fallthrough;
 	case PHY_INTERFACE_MODE_GMII:
 		if (dwmac->enable_eth_ck) {
@@ -334,6 +326,8 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, phy_intf_sel);
+
 	/* Select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
 	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
