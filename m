Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4858B98C22F
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 18:05:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC0DC78019;
	Tue,  1 Oct 2024 16:05:00 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2B93C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBQg8iUatrT2W3rStQmlCCxs5xcguBlj+g8lo2alq5A=; b=SmSNZOGlt9coDSY4yvwTuCZfoG
 ImRttdLP1Xl+iJn+Fhi51YvXXM/dbQlvRiXVEawxvZOkebpVoyMf5PWiA9Zyoqi1ASrv1huMKrckY
 v41bteRjqNtJttKJa8Jb1YOqWEaQqPEWmzc37kcY7EfplYbB3xad1g45wCyKx+4i7wGiYcMTE9+wx
 yx2jo/OK/J4d7ktSSQABHVsxcVDuNf1uZ0hk8UIEhjvI34frX6wjhW80uVondXWdPjgIvJPc9KR76
 JoAMOUIWyx/+nfPWfY4lKUFaIkAT/xtNUhwgo9NQuMBDHvsc7fHfHHjfWfxHR3L93Mo1wHW80MRQe
 8ia1Icdw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42610 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1svfMm-000674-2I;
 Tue, 01 Oct 2024 17:04:48 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1svfMk-005ZIj-R3; Tue, 01 Oct 2024 17:04:46 +0100
In-Reply-To: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
References: <ZvwdKIp3oYSenGdH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1svfMk-005ZIj-R3@rmk-PC.armlinux.org.uk>
Date: Tue, 01 Oct 2024 17:04:46 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 08/10] net: dsa: sja1105: use
	phylink_pcs internally
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

Use xpcs_create_pcs_mdiodev() to create the XPCS instance, storing
and using the phylink_pcs pointer internally, rather than dw_xpcs.
Use xpcs_destroy_pcs() to destroy the XPCS instance when we've
finished with it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/sja1105/sja1105.h      |  2 +-
 drivers/net/dsa/sja1105/sja1105_main.c | 16 ++++-----------
 drivers/net/dsa/sja1105/sja1105_mdio.c | 28 ++++++++++++--------------
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105.h b/drivers/net/dsa/sja1105/sja1105.h
index 8c66d3bf61f0..dceb96ae9c83 100644
--- a/drivers/net/dsa/sja1105/sja1105.h
+++ b/drivers/net/dsa/sja1105/sja1105.h
@@ -278,7 +278,7 @@ struct sja1105_private {
 	struct mii_bus *mdio_base_t1;
 	struct mii_bus *mdio_base_tx;
 	struct mii_bus *mdio_pcs;
-	struct dw_xpcs *xpcs[SJA1105_MAX_NUM_PORTS];
+	struct phylink_pcs *pcs[SJA1105_MAX_NUM_PORTS];
 	struct sja1105_ptp_data ptp_data;
 	struct sja1105_tas_data tas_data;
 };
diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index e5918ac862eb..af38b8959d8d 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
-#include <linux/pcs/pcs-xpcs.h>
 #include <linux/netdev_features.h>
 #include <linux/netdevice.h>
 #include <linux/if_bridge.h>
@@ -1358,12 +1357,8 @@ sja1105_mac_select_pcs(struct phylink_config *config, phy_interface_t iface)
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct sja1105_private *priv = dp->ds->priv;
-	struct dw_xpcs *xpcs = priv->xpcs[dp->index];
 
-	if (xpcs)
-		return &xpcs->pcs;
-
-	return NULL;
+	return priv->pcs[dp->index];
 }
 
 static void sja1105_mac_config(struct phylink_config *config,
@@ -2319,7 +2314,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 		mac_speed[i] = mac[i].speed;
 		mac[i].speed = priv->info->port_speed[SJA1105_SPEED_AUTO];
 
-		if (priv->xpcs[i])
+		if (priv->pcs[i])
 			bmcr[i] = mdiobus_c45_read(priv->mdio_pcs, i,
 						   MDIO_MMD_VEND2, MDIO_CTRL1);
 	}
@@ -2376,8 +2371,7 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 	}
 
 	for (i = 0; i < ds->num_ports; i++) {
-		struct dw_xpcs *xpcs = priv->xpcs[i];
-		struct phylink_pcs *pcs;
+		struct phylink_pcs *pcs = priv->pcs[i];
 		unsigned int neg_mode;
 
 		mac[i].speed = mac_speed[i];
@@ -2385,11 +2379,9 @@ int sja1105_static_config_reload(struct sja1105_private *priv,
 		if (rc < 0)
 			goto out;
 
-		if (!xpcs)
+		if (!pcs)
 			continue;
 
-		pcs = &xpcs->pcs;
-
 		if (bmcr[i] & BMCR_ANENABLE)
 			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
 		else
diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 52ddb4ef259e..84b7169f2974 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -400,7 +400,7 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 	}
 
 	for (port = 0; port < ds->num_ports; port++) {
-		struct dw_xpcs *xpcs;
+		struct phylink_pcs *pcs;
 
 		if (dsa_is_unused_port(ds, port))
 			continue;
@@ -409,13 +409,13 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 		    priv->phy_mode[port] != PHY_INTERFACE_MODE_2500BASEX)
 			continue;
 
-		xpcs = xpcs_create_mdiodev(bus, port, priv->phy_mode[port]);
-		if (IS_ERR(xpcs)) {
-			rc = PTR_ERR(xpcs);
+		pcs = xpcs_create_pcs_mdiodev(bus, port);
+		if (IS_ERR(pcs)) {
+			rc = PTR_ERR(pcs);
 			goto out_pcs_free;
 		}
 
-		priv->xpcs[port] = xpcs;
+		priv->pcs[port] = pcs;
 	}
 
 	priv->mdio_pcs = bus;
@@ -424,11 +424,10 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 
 out_pcs_free:
 	for (port = 0; port < ds->num_ports; port++) {
-		if (!priv->xpcs[port])
-			continue;
-
-		xpcs_destroy(priv->xpcs[port]);
-		priv->xpcs[port] = NULL;
+		if (priv->pcs[port]) {
+			xpcs_destroy_pcs(priv->pcs[port]);
+			priv->pcs[port] = NULL;
+		}
 	}
 
 	mdiobus_unregister(bus);
@@ -446,11 +445,10 @@ static void sja1105_mdiobus_pcs_unregister(struct sja1105_private *priv)
 		return;
 
 	for (port = 0; port < ds->num_ports; port++) {
-		if (!priv->xpcs[port])
-			continue;
-
-		xpcs_destroy(priv->xpcs[port]);
-		priv->xpcs[port] = NULL;
+		if (priv->pcs[port]) {
+			xpcs_destroy_pcs(priv->pcs[port]);
+			priv->pcs[port] = NULL;
+		}
 	}
 
 	mdiobus_unregister(priv->mdio_pcs);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
