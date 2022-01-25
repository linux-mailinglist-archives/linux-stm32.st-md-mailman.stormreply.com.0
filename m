Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DD49B8EB
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jan 2022 17:40:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B2BEC5F1D6;
	Tue, 25 Jan 2022 16:40:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F332AC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jan 2022 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fBB/QfS0K9U0yWzlB/E4bnFyIn3IzXToqUH6Bf3SaIM=; b=fQalIxu8cOPUKfrbwpMp0hLOnu
 tRav/ncRLV67WmwLZBrKGhBGOzjfOJdoOvAeoWCxq7F/PG//mOHmst8NTIEhMfzYlkG1nsMbG3ZOm
 qPi4lxRHsmaUgTN1wiO6uJmp/0GtVgvKc1E8zLCxSYiB3UEQMD23EZaUZ4YccZZLvskEbs1ueYx2F
 giWsmfgCmtZe8mlb4At5uculdLrzmkiV2qu5zuko/HNhS5qoTmcy/3FaMYr9JKYLWhoUBHTFq42/R
 cGpUMECNOQ/K+1LlosVrs5y4SBPNxRF5v/qHKssu9Mf/Q0Ok4mMXit4eCRuqmWO+Z6ZNQpifCLQOc
 29djsrEA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57422 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nCOsF-0002CH-Ab; Tue, 25 Jan 2022 16:40:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nCOsE-005LT5-NU; Tue, 25 Jan 2022 16:40:50 +0000
In-Reply-To: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
References: <YfAnkuhiMoeFcVnb@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nCOsE-005LT5-NU@rmk-PC.armlinux.org.uk>
Date: Tue, 25 Jan 2022 16:40:50 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next 6/7] net: stmmac: convert to
 phylink_generic_validate()
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

Convert stmmac to use phylink_generic_validate() now that we have the
MAC capabilities and supported interfaces filled in, and we have the
PCS validation handled via the PCS operations.

Tested-by: Wong Vee Khee <vee.khee.wong@linux.intel.com> # Intel EHL            Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 243016400aba..0fd96a98f489 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -936,30 +936,6 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 			priv->pause, tx_cnt);
 }
 
-static void stmmac_validate(struct phylink_config *config,
-			    unsigned long *supported,
-			    struct phylink_link_state *state)
-{
-	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(mac_supported) = { 0, };
-
-	/* This is very similar to phylink_generic_validate() except that
-	 * we always use PHY_INTERFACE_MODE_INTERNAL to get all capabilities.
-	 * This is because we don't always have config->supported_interfaces
-	 * populated (only when we have the XPCS.)
-	 *
-	 * When we do have an XPCS, we could pass state->interface, as XPCS
-	 * limits to a subset of the ethtool link modes allowed here.
-	 */
-	phylink_set(mac_supported, Autoneg);
-	phylink_set_port_modes(mac_supported);
-	phylink_get_linkmodes(mac_supported, PHY_INTERFACE_MODE_INTERNAL,
-			      config->mac_capabilities);
-
-	linkmode_and(supported, supported, mac_supported);
-	linkmode_and(state->advertising, state->advertising, mac_supported);
-}
-
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
 			      const struct phylink_link_state *state)
 {
@@ -1096,7 +1072,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 }
 
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
-	.validate = stmmac_validate,
+	.validate = phylink_generic_validate,
 	.mac_config = stmmac_mac_config,
 	.mac_link_down = stmmac_mac_link_down,
 	.mac_link_up = stmmac_mac_link_up,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
