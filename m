Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEF3F910A
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 01:46:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BD2AC597B3;
	Thu, 26 Aug 2021 23:46:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 585ADC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 23:46:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="198101897"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="198101897"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="426956294"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2021 16:45:57 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id 5BA635808BB;
 Thu, 26 Aug 2021 16:45:53 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Fri, 27 Aug 2021 07:51:32 +0800
Message-Id: <20210826235134.4051310-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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

Unlike any other platforms, Intel AlderLake-S uses Synopsys SerDes where
all the SerDes PLL configurations are controlled by the xPCS at the BIOS
level. If the driver perform a xPCS soft reset on initialization, these
settings will be switched back to the power on reset values.

This patch introduced a new xpcs_reset() function for drivers such as
sja1105 and stmmac to decide whether or not to perform a xPCS soft
reset.

Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/dsa/sja1105/sja1105_mdio.c        |  6 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 15 +++++++-
 drivers/net/pcs/pcs-xpcs.c                    | 37 ++++++++++---------
 include/linux/pcs/pcs-xpcs.h                  |  4 +-
 include/linux/stmmac.h                        |  1 +
 5 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_mdio.c b/drivers/net/dsa/sja1105/sja1105_mdio.c
index 705d3900e43a..6f8cc1358ac0 100644
--- a/drivers/net/dsa/sja1105/sja1105_mdio.c
+++ b/drivers/net/dsa/sja1105/sja1105_mdio.c
@@ -435,13 +435,17 @@ static int sja1105_mdiobus_pcs_register(struct sja1105_private *priv)
 			goto out_pcs_free;
 		}
 
-		xpcs = xpcs_create(mdiodev, priv->phy_mode[port]);
+		xpcs = xpcs_create(mdiodev);
 		if (IS_ERR(xpcs)) {
 			rc = PTR_ERR(xpcs);
 			goto out_pcs_free;
 		}
 
 		priv->xpcs[port] = xpcs;
+
+		rc = xpcs_reset(xpcs, priv->phy_mode[port]);
+		if (rc)
+			goto out_pcs_free;
 	}
 
 	priv->mdio_pcs = bus;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index a5d150c5f3d8..50f0e6dccb85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -401,12 +401,15 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 {
 	struct net_device *ndev = bus->priv;
 	struct mdio_device *mdiodev;
+	bool skip_xpcs_soft_reset;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
 	int mode, addr;
+	int err;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
+	skip_xpcs_soft_reset = priv->plat->skip_xpcs_soft_reset;
 
 	/* Try to probe the XPCS by scanning all addresses. */
 	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
@@ -414,12 +417,20 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
 		if (IS_ERR(mdiodev))
 			continue;
 
-		xpcs = xpcs_create(mdiodev, mode);
-		if (IS_ERR_OR_NULL(xpcs)) {
+		xpcs = xpcs_create(mdiodev);
+		if (IS_ERR(xpcs)) {
 			mdio_device_free(mdiodev);
 			continue;
 		}
 
+		if (!skip_xpcs_soft_reset) {
+			err = xpcs_reset(xpcs, mode);
+			if (err) {
+				mdio_device_free(mdiodev);
+				continue;
+			}
+		}
+
 		priv->hw->xpcs = xpcs;
 		break;
 	}
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index fb0a83dc09ac..e4961884dd96 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -252,6 +252,18 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
 	return xpcs_poll_reset(xpcs, dev);
 }
 
+int xpcs_reset(struct dw_xpcs *xpcs, phy_interface_t interface)
+{
+	const struct xpcs_compat *compat;
+
+	compat = xpcs_find_compat(xpcs->id, interface);
+	if (!compat)
+		return -ENODEV;
+
+	return xpcs_soft_reset(xpcs, compat);
+}
+EXPORT_SYMBOL_GPL(xpcs_reset);
+
 #define xpcs_warn(__xpcs, __state, __args...) \
 ({ \
 	if ((__state)->link) \
@@ -1084,12 +1096,11 @@ static const struct phylink_pcs_ops xpcs_phylink_ops = {
 	.pcs_link_up = xpcs_link_up,
 };
 
-struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-			    phy_interface_t interface)
+struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 {
 	struct dw_xpcs *xpcs;
 	u32 xpcs_id;
-	int i, ret;
+	int i;
 
 	xpcs = kzalloc(sizeof(*xpcs), GFP_KERNEL);
 	if (!xpcs)
@@ -1099,37 +1110,27 @@ struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
 
 	xpcs_id = xpcs_get_id(xpcs);
 
+	/* If Device ID are all ones, there is no device found */
+	if (xpcs_id == 0xffffffff)
+		goto out;
+
 	for (i = 0; i < ARRAY_SIZE(xpcs_id_list); i++) {
 		const struct xpcs_id *entry = &xpcs_id_list[i];
-		const struct xpcs_compat *compat;
 
 		if ((xpcs_id & entry->mask) != entry->id)
 			continue;
 
 		xpcs->id = entry;
-
-		compat = xpcs_find_compat(entry, interface);
-		if (!compat) {
-			ret = -ENODEV;
-			goto out;
-		}
-
 		xpcs->pcs.ops = &xpcs_phylink_ops;
 		xpcs->pcs.poll = true;
 
-		ret = xpcs_soft_reset(xpcs, compat);
-		if (ret)
-			goto out;
-
 		return xpcs;
 	}
 
-	ret = -ENODEV;
-
 out:
 	kfree(xpcs);
 
-	return ERR_PTR(ret);
+	return ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_GPL(xpcs_create);
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index add077a81b21..d841f55f12cc 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -35,8 +35,8 @@ void xpcs_validate(struct dw_xpcs *xpcs, unsigned long *supported,
 		   struct phylink_link_state *state);
 int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		    int enable);
-struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
-			    phy_interface_t interface);
+int xpcs_reset(struct dw_xpcs *xpcs, phy_interface_t interface);
+struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev);
 void xpcs_destroy(struct dw_xpcs *xpcs);
 
 #endif /* __LINUX_PCS_XPCS_H */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a6f03b36fc4f..0f901773c5e4 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -268,5 +268,6 @@ struct plat_stmmacenet_data {
 	int msi_rx_base_vec;
 	int msi_tx_base_vec;
 	bool use_phy_wol;
+	bool skip_xpcs_soft_reset;
 };
 #endif
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
