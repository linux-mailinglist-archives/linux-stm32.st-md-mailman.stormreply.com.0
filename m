Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3B49C772
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 11:26:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D7BC5F1D6;
	Wed, 26 Jan 2022 10:26:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65BACC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yIXj+GnFuO9Y0oDa9eYMnuwIkI/j3llfYS7PwlkKWdA=; b=QWsR7JenKa4cwKDcL52FPcOuHy
 GIMTS8LiTf0TPqzYtdViG0Pk2vEepp3urj/NFlKrZ9zAKuySrqzZs8t4i1m3CryUzBQszqF3muNG4
 opnkZWq1TnBqDpJSo53782u2Pup9WoNgXgU+NJBWrfBoze+mtRBQ3JbQM/XaeA7GIZepEiJCEYSgx
 LE4gqexUMDX6inmav5P0YBhNHLPzDUvZz8CBSDyAUTYHEH3Xnr7CiohxCChSHM8jAHHhvkIqV0ZbF
 GZOtDydgu0jafpFUSdPfW+c7Bq27tbXXwzUQk2eWMhD3nCcwMOBGMmHr+FAYoQ6QasRFwUs6/vzrj
 3yblm9aQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35164 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nCfVS-0003A4-Cc; Wed, 26 Jan 2022 10:26:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nCfVR-005Rdd-Pq; Wed, 26 Jan 2022 10:26:25 +0000
In-Reply-To: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nCfVR-005Rdd-Pq@rmk-PC.armlinux.org.uk>
Date: Wed, 26 Jan 2022 10:26:25 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next v2 7/7] net: stmmac: use
	.mac_select_pcs() interface
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

Convert stmmac to use the mac_select_pcs() interface rather than using
phylink_set_pcs(). The intention here is to unify the approach for PCS
and eventually to remove phylink_set_pcs().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0fd96a98f489..e4381e13dae5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -936,6 +936,17 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 			priv->pause, tx_cnt);
 }
 
+static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
+						 phy_interface_t interface)
+{
+	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
+
+	if (!priv->hw->xpcs)
+		return NULL;
+
+	return &priv->hw->xpcs->pcs;
+}
+
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 			      const struct phylink_link_state *state)
 {
@@ -1073,6 +1084,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.validate = phylink_generic_validate,
+	.mac_select_pcs = stmmac_mac_select_pcs,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
@@ -1209,9 +1221,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (IS_ERR(phylink))
 		return PTR_ERR(phylink);
 
-	if (priv->hw->xpcs)
-		phylink_set_pcs(phylink, &priv->hw->xpcs->pcs);
-
 	priv->phylink = phylink;
 	return 0;
 }
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
