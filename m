Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E684139ED32
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 05:56:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F2EC59785;
	Tue,  8 Jun 2021 03:56:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F6DEC58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 03:56:36 +0000 (UTC)
IronPort-SDR: F8Ir2M3mIVM1KVcuzeP31EFaDfCyO//SwsMNPtzvSCq0y2u6iQVW+2dVwpEy5j6nxADL3WpDn8
 nZuobo4fIvVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265918186"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265918186"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 20:56:35 -0700
IronPort-SDR: OuQPB/UMaRFZcBFKm4MjV68n54vDFjvHy4Mx0zJeWAg0nbxGat3ndhArlydfPEI30PgDwyZB78
 jJrP19Ei4KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="440308750"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2021 20:56:31 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, tee.min.tan@intel.com,
 vee.khee.wong@linux.intel.com, vee.khee.wong@intel.com,
 michael.wei.hong.sit@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com
Date: Tue,  8 Jun 2021 11:51:56 +0800
Message-Id: <20210608035158.4869-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608035158.4869-1-michael.wei.hong.sit@intel.com>
References: <20210608035158.4869-1-michael.wei.hong.sit@intel.com>
Subject: [Linux-stm32] [PATCH net-next v6 1/3] net: stmmac: split xPCS setup
	from mdio register
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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  9 +++
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 64 ++++++++++---------
 3 files changed, 45 insertions(+), 29 deletions(-)

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
index 0a266fa0af7e..af406ea3dd46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6993,6 +6993,14 @@ int stmmac_dvr_probe(struct device *device,
 		}
 	}
 
+	if (priv->plat->mdio_bus_data) {
+		if (priv->plat->mdio_bus_data->has_xpcs) {
+			ret = stmmac_xpcs_setup(priv->mii);
+			if (ret)
+				goto error_xpcs_setup;
+		}
+	}
+
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
 		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
@@ -7029,6 +7037,7 @@ int stmmac_dvr_probe(struct device *device,
 	unregister_netdev(ndev);
 error_netdev_register:
 	phylink_destroy(priv->phylink);
+error_xpcs_setup:
 error_phy_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 6312a152c8ad..bc900e240da2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -397,6 +397,41 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
+int stmmac_xpcs_setup(struct mii_bus *bus)
+{
+	int mode, addr;
+	struct net_device *ndev = bus->priv;
+	struct mdio_xpcs_args *xpcs;
+	struct stmmac_priv *priv;
+	struct mdio_device *mdiodev;
+
+	priv = netdev_priv(ndev);
+	mode = priv->plat->phy_interface;
+
+	/* Try to probe the XPCS by scanning all addresses. */
+	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+		mdiodev = mdio_device_create(bus, addr);
+		if (IS_ERR(mdiodev))
+			continue;
+
+		xpcs = xpcs_create(mdiodev, mode);
+		if (IS_ERR_OR_NULL(xpcs)) {
+			mdio_device_free(mdiodev);
+			continue;
+		}
+
+		priv->hw->xpcs = xpcs;
+		break;
+	}
+
+	if (!priv->hw->xpcs) {
+		dev_warn(priv->device, "No xPCS found\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /**
  * stmmac_mdio_register
  * @ndev: net device structure
@@ -501,40 +536,11 @@ int stmmac_mdio_register(struct net_device *ndev)
 		goto no_phy_found;
 	}
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	if (mdio_bus_data->has_xpcs) {
-		int mode = priv->plat->phy_interface;
-		struct mdio_device *mdiodev;
-		struct mdio_xpcs_args *xpcs;
-
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			mdiodev = mdio_device_create(new_bus, addr);
-			if (IS_ERR(mdiodev))
-				continue;
-
-			xpcs = xpcs_create(mdiodev, mode);
-			if (IS_ERR_OR_NULL(xpcs)) {
-				mdio_device_free(mdiodev);
-				continue;
-			}
-
-			priv->hw->xpcs = xpcs;
-			break;
-		}
-
-		if (!priv->hw->xpcs) {
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
