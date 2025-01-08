Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AABDA0627B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:48:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB640C78F67;
	Wed,  8 Jan 2025 16:48:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1A70C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 16:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e7kSuOJ4GV6ndaTIagWvNA4y/FeBjhFoyB+/jci08qE=; b=TXUGWN+obuJNW5/WvbUOhCQV8b
 3k8FK1xEB60dMPHaK21NY4OO+B4IMSVy1uaoyIyl4aP+8Et9y3DHhYuaI75mo5udwwIjUhGO5mY90
 Kgb/dLbfkEmmmYsLW3HB/lAIl1An0msJt48WMJlLWOR9cZMZusa22Nif6i4BmQ+xrBGGPvlVRL56p
 BQw/0ZLGYbPGeDzPh4VSm8b9QxXSXtJleyf5C7UOEgfhlJq310zAT1UYWXJbTEE340X0fwJjphx1T
 KFgSlCTFc+wBTHP2mXUW6s0+5GBQELGXy3KOlOa85uwG6wGrOE7bj3Ali9OtNxpAQGFW6NmLZm2aS
 7Eph86Ow==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59812 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVZDp-0000ua-2i;
 Wed, 08 Jan 2025 16:47:57 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVZDW-0002Jr-W3; Wed, 08 Jan 2025 16:47:39 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVZDW-0002Jr-W3@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:47:38 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 02/18] net: stmmac: move
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

As stmmac_eee_init() is no longer called outside of stmmac_main.c, make
it static.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 14 +------------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++++++-----
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b8d631e559c0..df386fc948ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -406,7 +406,6 @@ int stmmac_dvr_probe(struct device *device,
 		     struct plat_stmmacenet_data *plat_dat,
 		     struct stmmac_resources *res);
 void stmmac_disable_eee_mode(struct stmmac_priv *priv);
-bool stmmac_eee_init(struct stmmac_priv *priv);
 int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt);
 int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size);
 int stmmac_bus_clks_config(struct stmmac_priv *priv, bool enabled);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 16b4d8c21c90..0429a99a8114 100644
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
index 70c8f60d34f2..e80ac74538d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -469,7 +469,7 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
  *  can also manage EEE, this function enable the LPI state and start related
  *  timer.
  */
-bool stmmac_eee_init(struct stmmac_priv *priv)
+static bool stmmac_eee_init(struct stmmac_priv *priv)
 {
 	int eee_tw_timer = priv->eee_tw_timer;
 
@@ -1088,6 +1088,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 		priv->eee_active =
 			phy_init_eee(phy, !(priv->plat->flags &
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
+		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
@@ -1187,6 +1188,16 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
 	}
 
+	if (ret == 0) {
+		struct ethtool_keee eee;
+
+		/* Configure phylib's copy of the LPI timer */
+		if (!phylink_ethtool_get_eee(priv->phylink, &eee)) {
+			eee.tx_lpi_timer = priv->tx_lpi_timer;
+			phylink_ethtool_set_eee(priv->phylink, &eee);
+		}
+	}
+
 	if (!priv->plat->pmt) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
@@ -3446,10 +3457,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
 
-	/* Convert the timer from msec to usec */
-	if (!priv->tx_lpi_timer)
-		priv->tx_lpi_timer = eee_timer * 1000;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
@@ -3916,6 +3923,10 @@ static int __stmmac_open(struct net_device *dev,
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
