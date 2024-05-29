Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF7D8D379E
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 15:29:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61A88C62EFE;
	Wed, 29 May 2024 13:29:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB74C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l0pFAlm4Nwz8WL1ywZPHC0jQLmXTQV0ET0gfIHEZ+0M=; b=UNNy/UmCiV3jL3duQZXmB3Lwtk
 172fmHguXii0dlSnIazA/S8nu/DIQs6qHUNPPfa7RgjXBuV4T8rughjAtnI1+pkwdnyLkxIS+Dw3/
 N0HOT5jXG2xGdPFfiF3xsVaNa9nV86OVqsaFFLdS8J10mYzeY13nGnfG6XjjPYKhCNlEHJsVFpUcQ
 T2hltlosRe9YEk6kFSiW0MqqMKT28yLU+A1gSvkLST+O88h5yx/eC93wgxshTWrhCYmG1ILvmuG79
 iBP+kw/6R9jyUG19wJLP41rlw7HtCTMrwEF4RsRClUZOsBn1ZgZNK4tdvRxPT6FWr9ygREKX2h3+g
 ++yuaQ6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42256 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sCJMt-0006AI-0n;
 Wed, 29 May 2024 14:29:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sCJMv-00Ecr1-Sk; Wed, 29 May 2024 14:29:29 +0100
In-Reply-To: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
References: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sCJMv-00Ecr1-Sk@rmk-PC.armlinux.org.uk>
Date: Wed, 29 May 2024 14:29:29 +0100
Cc: Madalin Bucur <madalin.bucur@nxp.com>,
 Sean Anderson <sean.anderson@seco.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 3/6] net: phylink: rename
 ovr_an_inband to default_an_inband
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

Since ovr_an_inband no longer overrides every MLO_AN_xxx mode, rename
it to reflect what it now does - it changes the default mode from
MLO_AN_PHY to MLO_AN_INBAND. Fix up the two users of this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/freescale/fman/fman_memac.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/phy/phylink.c                         | 2 +-
 include/linux/phylink.h                           | 5 +++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman_memac.c b/drivers/net/ethernet/freescale/fman/fman_memac.c
index 92b8f4ab26f1..9c44a3581950 100644
--- a/drivers/net/ethernet/freescale/fman/fman_memac.c
+++ b/drivers/net/ethernet/freescale/fman/fman_memac.c
@@ -1232,7 +1232,7 @@ int memac_initialization(struct mac_device *mac_dev,
 	    !of_property_read_bool(mac_node, "managed") &&
 	    mac_dev->phy_if != PHY_INTERFACE_MODE_MII &&
 	    !phy_interface_mode_is_rgmii(mac_dev->phy_if))
-		mac_dev->phylink_config.ovr_an_inband = true;
+		mac_dev->phylink_config.default_an_inband = true;
 	of_node_put(fixed);
 
 	err = memac_init(mac_dev->fman_mac);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca19b232431a..488b2fd2349c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1221,7 +1221,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
-		priv->phylink_config.ovr_an_inband =
+		priv->phylink_config.default_an_inband =
 			mdio_bus_data->xpcs_an_inband;
 
 	/* Set the platform/firmware specified interface mode. Note, phylink
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index c81f1c1ee675..02427378acfd 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -885,7 +885,7 @@ static int phylink_parse_mode(struct phylink *pl,
 	const char *managed;
 	unsigned long caps;
 
-	if (pl->config->ovr_an_inband)
+	if (pl->config->default_an_inband)
 		pl->cfg_link_an_mode = MLO_AN_INBAND;
 
 	dn = fwnode_get_named_child_node(fwnode, "fixed-link");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 5ea6b2ad2396..a30a692acc32 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -141,7 +141,8 @@ enum phylink_op_type {
  * @mac_requires_rxc: if true, the MAC always requires a receive clock from PHY.
  *                    The PHY driver should start the clock signal as soon as
  *                    possible and avoid stopping it during suspend events.
- * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
+ * @default_an_inband: if true, defaults to MLO_AN_INBAND rather than
+ *		       MLO_AN_PHY. A fixed-link specification will override.
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
@@ -154,7 +155,7 @@ struct phylink_config {
 	bool poll_fixed_state;
 	bool mac_managed_pm;
 	bool mac_requires_rxc;
-	bool ovr_an_inband;
+	bool default_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
