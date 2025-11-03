Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E023DC2B833
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:51:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA804C62D36;
	Mon,  3 Nov 2025 11:51:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D0A1C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okBTt2dNUP6FihBBbCP6ZKAhHbkxHeLb6qWCrp67ut0=; b=qhfkoLKSZwTgec07OjcdenMOVo
 34zjbYTik7uh+2+KeeCRyxZCS1hYSDX2s7FqQbGZbnFrzk6viwP0gIgI1Stkw7YXb+H00n0R1tVSZ
 +4VluEEOp4rBu1kiA1ydsH8dS8FcnA+J4x5XaUzxEDa842+t9W5GF3E52yWEEqVacxPYFH19KOErL
 XUo2ks+sFKvXv7guXiSDkgp7JBIsdKvsupEKVZCqOuxQZiO8PYiGGaEjfPXTy77k6S0D/P0AMxZOi
 Ye0gIvHHrr1+jOmWeMizEtWVIe5pQ9vxMQtsxfkT+bOj5fyr1lk1p5WY+a+pIGep2e/V+tBHYqGm/
 PtLg4acg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35368 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt5D-000000000i5-3Ftu;
 Mon, 03 Nov 2025 11:50:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt57-0000000ChpL-25kS; Mon, 03 Nov 2025 11:50:41 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt57-0000000ChpL-25kS@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:41 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: imx: cleanup
 arguments for set_intf_mode() method
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

Pass the imx_priv_data instead of the plat_stmmacenet_data into the
set_intf_mode() SoC specific methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 22 +++++++------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index d69be9de4468..ae1b73e1bcb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -39,14 +39,15 @@
 #define RMII_RESET_SPEED		(0x3 << 14)
 #define CTRL_SPEED_MASK			GENMASK(15, 14)
 
+struct imx_priv_data;
+
 struct imx_dwmac_ops {
 	u32 addr_width;
 	u32 flags;
 	bool mac_rgmii_txclk_auto_adj;
 
 	int (*fix_soc_reset)(struct stmmac_priv *priv, void __iomem *ioaddr);
-	int (*set_intf_mode)(struct plat_stmmacenet_data *plat_dat,
-			     u8 phy_intf_sel);
+	int (*set_intf_mode)(struct imx_priv_data *dwmac, u8 phy_intf_sel);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 };
 
@@ -63,10 +64,8 @@ struct imx_priv_data {
 	struct plat_stmmacenet_data *plat_dat;
 };
 
-static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
-				u8 phy_intf_sel)
+static int imx8mp_set_intf_mode(struct imx_priv_data *dwmac, u8 phy_intf_sel)
 {
-	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
 	unsigned int val;
 
 	val = FIELD_PREP(GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
@@ -82,17 +81,14 @@ static int imx8mp_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
 };
 
 static int
-imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
-		      u8 phy_intf_sel)
+imx8dxl_set_intf_mode(struct imx_priv_data *dwmac, u8 phy_intf_sel)
 {
 	/* TBD: depends on imx8dxl scu interfaces to be upstreamed */
 	return 0;
 }
 
-static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat,
-			       u8 phy_intf_sel)
+static int imx93_set_intf_mode(struct imx_priv_data *dwmac, u8 phy_intf_sel)
 {
-	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
 	unsigned int val;
 	int ret;
 
@@ -140,14 +136,12 @@ static int imx_dwmac_clks_config(void *priv, bool enabled)
 
 static int imx_dwmac_init(struct platform_device *pdev, void *priv)
 {
-	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
 	phy_interface_t interface;
 	int phy_intf_sel, ret;
 
 	if (dwmac->ops->set_intf_mode) {
-		plat_dat = dwmac->plat_dat;
-		interface = plat_dat->phy_interface;
+		interface = dwmac->plat_dat->phy_interface;
 
 		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
 		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
@@ -159,7 +153,7 @@ static int imx_dwmac_init(struct platform_device *pdev, void *priv)
 			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 		}
 
-		ret = dwmac->ops->set_intf_mode(plat_dat, phy_intf_sel);
+		ret = dwmac->ops->set_intf_mode(dwmac, phy_intf_sel);
 		if (ret)
 			return ret;
 	}
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
