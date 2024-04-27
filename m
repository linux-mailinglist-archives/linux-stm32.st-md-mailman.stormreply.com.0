Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21F8B4862
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2024 23:52:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBA95C71296;
	Sat, 27 Apr 2024 21:52:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D47D2C71294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 21:51:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B09148824B;
 Sat, 27 Apr 2024 23:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714254715;
 bh=StyUzSRnyvg8PGSr9aP4LPEI4PN2nTZYd6wXi3dQh/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NHWIzub3aRPtNWgrRrEu3S7ggzjERGfdQ79K3q3UvcRh/m40Y6StFrLGQ+dgAcJRC
 xYxNOwlgKVxKb7BLk0o7w+k/O1h8XynOxRVXRyfakTvPg1BuR+M68ReDAbuD+M5Czx
 5Im2wgwmNknWmGUE0b30CZMU+BPErFt3ZBaHbdPFNT2MqkCu7fB1iu3n0Wy8oCXOd6
 unY5E5sjUvoYcx8kAUWjEoROxmCESYnBCwv5dS1OPUe5mw7CmiiatcZ18ITw8kAiBA
 yQ6S/+PN/51T2M/+BdRb7Em1bX0X0/GlIODTPZRRW/ou88gGRS4MNKs90ouyyWBXno
 EE9XEJ2B9DaZQ==
From: Marek Vasut <marex@denx.de>
To: netdev@vger.kernel.org
Date: Sat, 27 Apr 2024 23:50:43 +0200
Message-ID: <20240427215113.57548-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427215113.57548-1-marex@denx.de>
References: <20240427215113.57548-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next, RFC,
	PATCH 4/5] net: stmmac: dwmac-stm32: Clean up the debug prints
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

Use dev_err()/dev_dbg() and phy_modes() to print PHY mode instead of
pr_debug() and hand-written PHY mode decoding. This way, each debug
print has associated device with it and duplicated mode decoding is
removed.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 3fedb447970a6..91e1a540616d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -231,19 +231,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = SYSCFG_PMCR_ETH_SEL_MII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_GMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_PMCR_ETH_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -252,15 +249,16 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 		val = SYSCFG_PMCR_ETH_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RGMII\n");
 		break;
 	default:
-		pr_debug("SYSCFG init :  Do not manage %d interface\n",
-			 plat_dat->mac_interface);
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+
 	/* Need to update PMCCLRR (clear register) */
 	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
 		     dwmac->ops->syscfg_eth_mask);
@@ -294,19 +292,19 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = SYSCFG_MCU_ETH_SEL_MII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_MCU_ETH_SEL_RMII;
-		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_RMII\n");
 		break;
 	default:
-		pr_debug("SYSCFG init :  Do not manage %d interface\n",
-			 plat_dat->mac_interface);
+		dev_err(dwmac->dev, "Mode %s not supported",
+			phy_modes(plat_dat->mac_interface));
 		/* Do not manage others interfaces */
 		return -EINVAL;
 	}
 
+	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
+
 	return regmap_update_bits(dwmac->regmap, reg,
 				 dwmac->ops->syscfg_eth_mask, val << 23);
 }
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
