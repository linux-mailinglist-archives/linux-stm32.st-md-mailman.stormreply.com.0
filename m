Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A804A39A36
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:15:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D218C78F87;
	Tue, 18 Feb 2025 11:15:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4CE2C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ZH1bVksmCx0plQEMgCUt60mErOEDPQEJF+dciIer4w=; b=mMsS565BSOMEGYOhTy8coteI7H
 zXwIWtFNm0MvmcZVzpD+jAe66mi/w59zeijL3/EsJbdlgdMYcPursaxV9e7LdvSyw0zEzxds6x41U
 fv0HweRrjDM0J0PPQnApZCK7F4cppq6OFlsB4RxDE2tpqouFWlVPj+9ZmcSoBFWS9YNj1m2A6owR6
 fWNAUzsdHlyHJvq8YOXdQ4vuEK2DkTb3fG6+cgDaFedYNLg4+VT1y/fEi0hPZUxz330WkFmSavAHp
 1Xy6nP+2w3jlQ8xBM3mqpliVx6JqIKVxpwvX7DC2EbCzMfob2ROcsQySWxq1Y+xWOrby97FZX52JL
 KVnlHfkw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51354 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tkLZ5-0001hg-1A;
 Tue, 18 Feb 2025 11:14:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tkLYl-004RYv-Gz; Tue, 18 Feb 2025 11:14:39 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tkLYl-004RYv-Gz@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:14:39 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH RFC net-next 1/7] net: stmmac: provide generic
 transmit clock configuration hook
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

Several stmmac sub-drivers which support RGMII follow the same pattern.
They calculate the transmit clock, and then call the clk API to set a
clock to that rate.

Analysis of documentation suggests that the platform is responsible for
providing the transmit clock to the DWMAC core (clk_tx_i). The expected
rates are:

	10Mbps	100Mbps	1Gbps
MII	2.5MHz	25MHz
GMII			125MHz
RGMI	2.5MHz	25MHz	125MHz
RMII	2.5MHz	25MHz

It seems some platforms require this clock to be manually configured,
but there are outputs from the MAC core that indicate the speed, so a
platform may use these to automatically configure the clock. Thus, we
can't just provide one solution to configuring the clock.

Moreover, the clock may need to be derived from one of several sources
depending on the interface mode.

Provide a platform hook that is passed the interface mode, speed, and
transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++++
 include/linux/stmmac.h                            |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4d542f482ecb..f7ff94a09da2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -928,6 +928,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 	unsigned int flow_ctrl;
 	u32 old_ctrl, ctrl;
+	int ret;
 
 	if ((priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP) &&
 	    priv->plat->serdes_powerup)
@@ -1000,6 +1001,16 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (priv->plat->fix_mac_speed)
 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
 
+	if (priv->plat->set_clk_tx_rate) {
+		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
+						priv->plat->clk_tx_i,
+						interface, speed);
+		if (ret < 0)
+			netdev_err(priv->dev,
+				   "failed to configure transmit clock for %dMbps: %pe\n",
+				   speed, ERR_PTR(ret));
+	}
+
 	if (!duplex)
 		ctrl &= ~priv->hw->link.duplex;
 	else
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 6d2aa77ea963..cd0d1383df87 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -78,6 +78,7 @@
 			| DMA_AXI_BLEN_32 | DMA_AXI_BLEN_64 \
 			| DMA_AXI_BLEN_128 | DMA_AXI_BLEN_256)
 
+struct clk;
 struct stmmac_priv;
 
 /* Platfrom data for platform device structure's platform_data field */
@@ -231,6 +232,8 @@ struct plat_stmmacenet_data {
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
+	int (*set_clk_tx_rate)(void *priv, struct clk *clk_tx_i,
+			       phy_interface_t interface, int speed);
 	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
@@ -252,6 +255,7 @@ struct plat_stmmacenet_data {
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
+	struct clk *clk_tx_i;		/* clk_tx_i to MAC core */
 	unsigned long clk_ptp_rate;
 	unsigned long clk_ref_rate;
 	struct clk_bulk_data *clks;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
