Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D29D97A1
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 13:53:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E825C78023;
	Tue, 26 Nov 2024 12:53:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 791EFC78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jnlk8pgjtpSm97dX6ohrXw6e5+wjuRHBrA+ATzZX3UM=; b=l38OLZFXhmNmWByOF/I8WEVWJy
 FgVeNPP90JOJEwnXTwgK5l1FP9eeLclbvVxme5Fx3vPkTIh1xMClDqxx47irbqPOHFeaCLOOpTfzI
 5qoVZwYcQupV9Y96QsXspzaOL1WWUadrp+b/13XLqNXqORRYzKIUV4xAhH6B8dg/X7KFOSxx8lDa2
 TzBFNn+wlszRg8SiNlW2HuQ8zi9CrenhcPVLzM7G06SAIlNE78fvgZdUDsKGePluD71p4uhAZZ9H4
 s1klZ2+/lQgauTavjMO5NyocNPR73kv8IsJZPXldVBNKVHdQ694gNEsrBm7jeK2xcU2coLMaf7XP+
 hF00yiHA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38222 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tFv4V-0006wo-0Q;
 Tue, 26 Nov 2024 12:53:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tFv4U-005yj2-0F; Tue, 26 Nov 2024 12:53:38 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tFv4U-005yj2-0F@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:38 +0000
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next 17/23] net: stmmac: move
 tx_lpi_timer tracking to phylib
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

When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
and tx_lpi_enabled members, and then calls into phylink and thus phylib.
phylib overwrites these members.

phylib will also cause a link down/link up transition when settings
that impact the MAC have been changed.

Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
updating priv->tx_lpi_timer each time when the link comes up, rather
than trying to maintain this user setting itself. We initialise the
phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
with the last known priv->tx_lpi_timer value. In order for this to work
correctly, we also need this member to be initialised earlier.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c   | 14 +-------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 1d77389ce953..5ce095a62feb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -898,7 +898,6 @@ static int stmmac_ethtool_op_get_eee(struct net_device *dev,
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
 
-	edata->tx_lpi_timer = priv->tx_lpi_timer;
 	edata->tx_lpi_enabled = priv->tx_lpi_enabled;
 
 	return phylink_ethtool_get_eee(priv->phylink, edata);
@@ -908,7 +907,6 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 				     struct ethtool_keee *edata)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int ret;
 
 	if (!priv->dma_cap.eee)
 		return -EOPNOTSUPP;
@@ -920,17 +918,7 @@ static int stmmac_ethtool_op_set_eee(struct net_device *dev,
 	if (!edata->eee_enabled)
 		stmmac_disable_eee_mode(priv);
 
-	ret = phylink_ethtool_set_eee(priv->phylink, edata);
-	if (ret)
-		return ret;
-
-	if (edata->eee_enabled &&
-	    priv->tx_lpi_timer != edata->tx_lpi_timer) {
-		priv->tx_lpi_timer = edata->tx_lpi_timer;
-		stmmac_eee_init(priv);
-	}
-
-	return 0;
+	return phylink_ethtool_set_eee(priv->phylink, edata);
 }
 
 static u32 stmmac_usec2riwt(u32 usec, struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3cdc3910f3a0..61d85281d75b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1088,6 +1088,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 			phy_init_eee(phy, !(priv->plat->flags &
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
+		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
@@ -1183,6 +1184,15 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
+	if (ret == 0) {
+		struct ethtool_keee eee;
+
+		if (phylink_ethtool_get_eee(priv->phylink, &eee)) {
+			eee.tx_lpi_timer = priv->tx_lpi_timer;
+			phylink_ethtool_set_eee(priv->phylink, &eee);
+		}
+	}
+
 	if (!priv->plat->pmt) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
@@ -3435,10 +3445,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
 
-	/* Convert the timer from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -3905,6 +3911,10 @@ static int __stmmac_open(struct net_device *dev,
 	u32 chan;
 	int ret;
 
+	/* Initialise the tx lpi timer, converting from msec to usec */
+	if (!priv->tx_lpi_timer)
+		priv->tx_lpi_timer = eee_timer * 1000;
+
 	ret = pm_runtime_resume_and_get(priv->device);
 	if (ret < 0)
 		return ret;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
