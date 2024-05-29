Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B88D37A1
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 15:29:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B30AC62EFE;
	Wed, 29 May 2024 13:29:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88A57C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYvO95PpEcMgA0q270dluXDRCbFClCEyBXdlLNYYlFI=; b=mDTJgtoKsm6r/eWRMv1Rnumsm/
 KZs0wqYzrpBzm30CFWHTdUQFlUp0xg8GhDXKHFu8h/U/noXD/jcfJB/zXcXPTJVSeFQfSS9zEEYUm
 cmmtk8syO2XxnrPXnw2cIlOQuT+QykirkGNKDg/LsrMqs8VZyDDBeXiukQIdu4UCD9R/91hjfY0jF
 qhT2oRxoMLcoz3CDqb/DhlRis2Q0pWBIPzUG3gAEbwtkey3kqE6i7nT35SoL/qnwe2WDp7nOEK/R5
 xkVxbxy3z75NjsUM6qhigatMlba9OyxDWBhzAJ+tfF5GHBs9KeNE3Qo+NPuq3TG+CmeRTaytaV3dZ
 D6Sil+5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44826 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sCJN3-0006Ak-1x;
 Wed, 29 May 2024 14:29:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sCJN6-00EcrD-43; Wed, 29 May 2024 14:29:40 +0100
In-Reply-To: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
References: <ZlctinnTT8Xhemsm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sCJN6-00EcrD-43@rmk-PC.armlinux.org.uk>
Date: Wed, 29 May 2024 14:29:40 +0100
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: rename
 xpcs_an_inband to default_an_inband
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

Rename xpcs_an_inband to default_an_inband to reflect the change in
phylink and its changed functionality.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 60283543ffc8..5e96146b8bd9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -248,7 +248,7 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 		dev_info(priv->device, "Link Speed Mode: 2.5Gbps\n");
 		priv->plat->max_speed = 2500;
 		priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
-		priv->plat->mdio_bus_data->xpcs_an_inband = false;
+		priv->plat->mdio_bus_data->default_an_inband = false;
 	} else {
 		priv->plat->max_speed = 1000;
 	}
@@ -586,16 +586,16 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->has_xpcs = true;
-		plat->mdio_bus_data->xpcs_an_inband = true;
+		plat->mdio_bus_data->default_an_inband = true;
 	}
 
-	/* For fixed-link setup, we clear xpcs_an_inband */
+	/* For fixed-link setup, we clear default_an_inband */
 	if (fwnode) {
 		struct fwnode_handle *fixed_node;
 
 		fixed_node = fwnode_get_named_child_node(fwnode, "fixed-link");
 		if (fixed_node)
-			plat->mdio_bus_data->xpcs_an_inband = false;
+			plat->mdio_bus_data->default_an_inband = false;
 
 		fwnode_handle_put(fixed_node);
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 488b2fd2349c..bbedf2a8c60f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1222,7 +1222,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.default_an_inband =
-			mdio_bus_data->xpcs_an_inband;
+			mdio_bus_data->default_an_inband;
 
 	/* Set the platform/firmware specified interface mode. Note, phylink
 	 * deals with the PHY interface mode, not the MAC interface mode.
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f92c195c76ed..8f0f156d50d3 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -83,7 +83,7 @@ struct stmmac_priv;
 struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
 	unsigned int has_xpcs;
-	unsigned int xpcs_an_inband;
+	unsigned int default_an_inband;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
