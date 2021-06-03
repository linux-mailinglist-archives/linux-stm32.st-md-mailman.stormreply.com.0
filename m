Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABE39A058
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 13:55:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF10C57B78;
	Thu,  3 Jun 2021 11:55:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E3DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 11:55:16 +0000 (UTC)
IronPort-SDR: lG/ow2MUZxDOvXz6un5Ju75kafngxRyHarKmvH4J+xelQjPk0Y3FALSLXxBFJc6gXFsgYqEBkL
 7jqT+qX4WKtA==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="202167267"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="202167267"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 04:55:14 -0700
IronPort-SDR: igZcwlBfAfW/PThawsifuGZgcbqkFFKRAyKRwPUkxAkFGZOOjmX1iy3TAd1rJd1mtDkVZHkPRn
 9i2vY7l/pGbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="446263154"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2021 04:55:08 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu,  3 Jun 2021 19:50:30 +0800
Message-Id: <20210603115032.2470-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
References: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [RESEND PATCH net-next v4 1/3] net: stmmac: split
	xPCS setup from mdio register
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Voon Weifeng <weifeng.voon@intel.com>

This patch is a preparation patch for the enabling of Intel mGbE 2.5Gbps
link speed. The Intel mGbR link speed configuration (1G/2.5G) is depends on
a mdio ADHOC register which can be configured in the bios menu.
As PHY interface might be different for 1G and 2.5G, the mdio bus need be
ready to check the link speed and select the PHY interface before probing
the xPCS.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 73 ++++++++++---------
 3 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b6cd43eda7ac..fd7212afc543 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -311,6 +311,7 @@ enum stmmac_state {
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
+int stmmac_xpcs_setup(struct mii_bus *mii);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
 void stmmac_ptp_register(struct stmmac_priv *priv);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13720bf6f6ff..eb81baeb13b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7002,6 +7002,12 @@ int stmmac_dvr_probe(struct device *device,
 		}
 	}
 
+	if (priv->plat->mdio_bus_data->has_xpcs) {
+		ret = stmmac_xpcs_setup(priv->mii);
+		if (ret)
+			goto error_xpcs_setup;
+	}
+
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
@@ -7038,6 +7044,7 @@ int stmmac_dvr_probe(struct device *device,
 	unregister_netdev(ndev);
 error_netdev_register:
 	phylink_destroy(priv->phylink);
+error_xpcs_setup:
 error_phy_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index e293bf1ce9f3..3bb0a787f136 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -397,6 +397,44 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
+int stmmac_xpcs_setup(struct mii_bus *bus)
+{
+	int mode, max_addr, addr, found, ret;
+	struct net_device *ndev = bus->priv;
+	struct mdio_xpcs_args *xpcs;
+	struct stmmac_priv *priv;
+
+	priv = netdev_priv(ndev);
+	xpcs = &priv->hw->xpcs_args;
+	mode = priv->plat->phy_interface;
+	max_addr = PHY_MAX_ADDR;
+
+	priv->hw->xpcs = mdio_xpcs_get_ops();
+	if (!priv->hw->xpcs)
+		return -ENODEV;
+
+	/* Try to probe the XPCS by scanning all addresses. */
+	xpcs->bus = bus;
+	found = 0;
+
+	for (addr = 0; addr < max_addr; addr++) {
+		xpcs->addr = addr;
+
+		ret = stmmac_xpcs_probe(priv, xpcs, mode);
+		if (!ret) {
+			found = 1;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_warn(priv->device, "No xPCS found\n");
+		return -ENODEV;
+	}
+
+	return ret;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -444,14 +482,6 @@ int stmmac_mdio_register(struct net_device *ndev)
 		max_addr = PHY_MAX_ADDR;
 	}
 
-	if (mdio_bus_data->has_xpcs) {
-		priv->hw->xpcs = mdio_xpcs_get_ops();
-		if (!priv->hw->xpcs) {
-			err = -ENODEV;
-			goto bus_register_fail;
-		}
-	}
-
 	if (mdio_bus_data->needs_reset)
 		new_bus->reset = &stmmac_mdio_reset;
 
@@ -509,38 +539,11 @@ int stmmac_mdio_register(struct net_device *ndev)
 		goto no_phy_found;
 	}
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	if (priv->hw->xpcs) {
-		struct mdio_xpcs_args *xpcs = &priv->hw->xpcs_args;
-		int ret, mode = priv->plat->phy_interface;
-		max_addr = PHY_MAX_ADDR;
-
-		xpcs->bus = new_bus;
-
-		found = 0;
-		for (addr = 0; addr < max_addr; addr++) {
-			xpcs->addr = addr;
-
-			ret = stmmac_xpcs_probe(priv, xpcs, mode);
-			if (!ret) {
-				found = 1;
-				break;
-			}
-		}
-
-		if (!found && !mdio_node) {
-			dev_warn(dev, "No XPCS found\n");
-			err = -ENODEV;
-			goto no_xpcs_found;
-		}
-	}
-
 bus_register_done:
 	priv->mii = new_bus;
 
 	return 0;
 
-no_xpcs_found:
 no_phy_found:
 	mdiobus_unregister(new_bus);
 bus_register_fail:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
