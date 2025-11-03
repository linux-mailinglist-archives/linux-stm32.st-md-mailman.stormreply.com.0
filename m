Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704DC2B81E
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 12:50:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBD0C62D32;
	Mon,  3 Nov 2025 11:50:34 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4504C62D2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5/4C2L52WRh19L+GKh1oHdRlYYwj06G7xm70H4ADUe8=; b=TC9hV9eMJtJD5oJY+VKJfggX1V
 WGpMoM9GZsJL65Oiq1pfSbJlfuaN+6pb+HE0F8v2Ge+YSbobAwmg4iO2C/ktrRLJwXRYk70v0L+Gx
 E/ySypW9ThqEWwgUz0nKCtqJ3nzcJdUveCGfFik1B+asPeKxEVtV/YW0VDmbFRUxXht1pMELVjDoJ
 UhcfqO6mxHjgPUpbA6P/MsVyY4Abiiez0WXdJRjP6lY20bi3ybs32g+5H8AsGnaHfXjbBW5QHP0y4
 Z00VWHKagpd8gS0RYCRJvAvJB6vt+QC0Ka3w05/2e+z/DUVwyELGhBOTRbjGA/XWXZ1ndXa/9XHzI
 /3pwL7oQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56288 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vFt4k-000000000gU-1tMn;
 Mon, 03 Nov 2025 11:50:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vFt4h-0000000Chos-3wxX; Mon, 03 Nov 2025 11:50:15 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vFt4h-0000000Chos-3wxX@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:50:15 +0000
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 05/11] net: stmmac: add support for
 configuring the phy_intf_sel inputs
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

When dwmac is synthesised with support for multiple PHY interfaces, the
core provides phy_intf_sel inputs, sampled on reset, to configure the
PHY facing interface. Use stmmac_get_phy_intf_sel() in core code to
determine the dwmac phy_intf_sel input value, and provide a new
platform method called with this value just before we issue a soft
reset to the dwmac core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 34 +++++++++++++++++++
 include/linux/stmmac.h                        |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 95d2cd020a0c..596995d2bec3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3102,6 +3102,36 @@ int stmmac_get_phy_intf_sel(phy_interface_t interface)
 }
 EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
 
+static int stmmac_prereset_configure(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat_dat = priv->plat;
+	phy_interface_t interface;
+	int phy_intf_sel, ret;
+
+	if (!plat_dat->set_phy_intf_sel)
+		return 0;
+
+	interface = plat_dat->phy_interface;
+	phy_intf_sel = stmmac_get_phy_intf_sel(interface);
+	if (phy_intf_sel < 0) {
+		netdev_err(priv->dev,
+			   "failed to get phy_intf_sel for %s: %pe\n",
+			   phy_modes(interface), ERR_PTR(phy_intf_sel));
+		return phy_intf_sel;
+	}
+
+	ret = plat_dat->set_phy_intf_sel(plat_dat->bsp_priv, phy_intf_sel);
+	if (ret == -EINVAL)
+		netdev_err(priv->dev, "platform does not support %s\n",
+			   phy_modes(interface));
+	else if (ret < 0)
+		netdev_err(priv->dev,
+			   "platform failed to set interface %s: %pe\n",
+			   phy_modes(interface), ERR_PTR(ret));
+
+	return ret;
+}
+
 /**
  * stmmac_init_dma_engine - DMA init.
  * @priv: driver private structure
@@ -3128,6 +3158,10 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
 		priv->plat->dma_cfg->atds = 1;
 
+	ret = stmmac_prereset_configure(priv);
+	if (ret)
+		return ret;
+
 	ret = stmmac_reset(priv, priv->ioaddr);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to reset the dma\n");
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 151c81c560c8..48e9f1d4e17e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -250,6 +250,7 @@ struct plat_stmmacenet_data {
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
 	void (*get_interfaces)(struct stmmac_priv *priv, void *bsp_priv,
 			       unsigned long *interfaces);
+	int (*set_phy_intf_sel)(void *priv, u8 phy_intf_sel);
 	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
 			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
