Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF497C2B830
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:51:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 976ACC62D32;
	Mon,  3 Nov 2025 11:51:10 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18DA2C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+x67xrOfs+NtjduqtRJxZD8HBELV2D7qvud2IndiqU4=; b=eDlTZltoetN3Hk1dXyigbldu0u
 gLYRDBWpaj8VhWcsanGsGMOEUnFEmvC66Nj4x1QtyF9BH1Qc/u73b7jubrIw5ZWPWmoKzk3GSGmtL
 xJ9VYkHMSdMM42Dt1mcLxJSlD11vWe+IaORHyBYfRrUznWsbnT5Hyy7U7dB07Z7+qFT+pT95V8b0G
 XWTfellsJlbbkChSQwSejkGFdESfUc9XW1T0/bSPpZgSgo6LMOMRm7sDvUaOFtMzQNbTnJWGkGbZz
 FjQGf64JAQ9Xj87x8/+0Fzjt3KRvSmN7HSRkQXrWz0SxaznipsaFpnMXTXOx7CdEYBEMhIlYm9jnl
 sc2ueNDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35376 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt5G-000000000iL-006H;
 Mon, 03 Nov 2025 11:50:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt5C-0000000ChpR-2kAB; Mon, 03 Nov 2025 11:50:46 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt5C-0000000ChpR-2kAB@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:46 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac: imx: use
	->set_phy_intf_sel()
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

Rather than placing the phy_intf_sel() setup in the ->init() method,
move it to the new ->set_phy_intf_sel() method.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 38 +++++--------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ae1b73e1bcb2..db288fbd5a4d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -134,36 +134,19 @@ static int imx_dwmac_clks_config(void *priv, bool enabled)
 	return ret;
 }
 
-static int imx_dwmac_init(struct platform_device *pdev, void *priv)
+static int imx_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
 {
-	struct imx_priv_data *dwmac = priv;
-	phy_interface_t interface;
-	int phy_intf_sel, ret;
-
-	if (dwmac->ops->set_intf_mode) {
-		interface = dwmac->plat_dat->phy_interface;
-
-		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
-		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
-		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
-		    phy_intf_sel != PHY_INTF_SEL_RMII) {
-			dev_dbg(dwmac->dev,
-				"imx dwmac doesn't support %s interface\n",
-				phy_modes(interface));
-			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
-		}
+	struct imx_priv_data *dwmac = bsp_priv;
 
-		ret = dwmac->ops->set_intf_mode(dwmac, phy_intf_sel);
-		if (ret)
-			return ret;
-	}
+	if (!dwmac->ops->set_intf_mode)
+		return 0;
 
-	return 0;
-}
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII)
+		return -EINVAL;
 
-static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
-{
-	/* nothing to do now */
+	return dwmac->ops->set_intf_mode(dwmac, phy_intf_sel);
 }
 
 static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
@@ -342,8 +325,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
 
 	plat_dat->host_dma_width = dwmac->ops->addr_width;
-	plat_dat->init = imx_dwmac_init;
-	plat_dat->exit = imx_dwmac_exit;
+	plat_dat->set_phy_intf_sel = imx_set_phy_intf_sel;
 	plat_dat->clks_config = imx_dwmac_clks_config;
 	plat_dat->bsp_priv = dwmac;
 	dwmac->plat_dat = plat_dat;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
