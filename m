Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D424150B1C4
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Apr 2022 09:39:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E4C6C6049A;
	Fri, 22 Apr 2022 07:39:37 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4338AC6049A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650613176; x=1682149176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6GcMHH6yUqex4pWxo8BLj/3zpi1O7XDEvvpDjCDkD0s=;
 b=TFn2bTIe/cUBE+BIyJnoE3JAQgbwQLM+nGCdcMSSZniqJ3Xo9io0wihu
 hR4eXm3nKeSziM9OCFV1z/XfzttWwPUY5iTVHK3ZPtbiZ0ocTKQwC/M6J
 stzN+quJmLxreoJZSpk38w3V5DR5MAjnZ1FkYNL2/fa+iI1bM4DMoKWMr
 5Xz6quCCO6t9ixKQK6HaXs7zdyH7NHE8XAF0WnwqGItmIbkJzne5clvUL
 HhpJklA9q6UQAPzETLFUmtemAvc2L9b/1m5CZfm7ts6YJOR4OlggkQ5Mf
 KylXGRuKE5E7uJGVzSA2rtdd50qmCRUoUwHoheo5JRDHOOiawbqzCVRBM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289724688"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="289724688"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="648516336"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2022 00:39:32 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Apr 2022 15:35:03 +0800
Message-Id: <20220422073505.810084-3-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422073505.810084-1-boon.leong.ong@intel.com>
References: <20220422073505.810084-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 2/4] net: stmmac: introduce PHY-less
	setup support
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

Certain platform uses PHY-less configuration whereby the MAC controller
is connected to network switch chip directly over SGMII or 1000BASE-X.

This patch prepares the stmmac driver to support PHY-less configuration
described above.

Tested-by: Emilio Riva <emilio.riva@ericsson.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  2 +-
 include/linux/stmmac.h                            |  1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 57cb11abec8..4d39387bc48 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1142,11 +1142,18 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 static int stmmac_init_phy(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
+	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *node;
-	int ret;
+	int ret = 0;
 
+	mdio_bus_data = priv->plat->mdio_bus_data;
 	node = priv->plat->phylink_node;
 
+	if (mdio_bus_data->phyless) {
+		netdev_info(priv->dev, "using PHY-less setup\n");
+		goto phyless_setup;
+	}
+
 	if (node)
 		ret = phylink_of_phy_connect(priv->phylink, node, 0);
 
@@ -1166,6 +1173,7 @@ static int stmmac_init_phy(struct net_device *dev)
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	}
 
+phyless_setup:
 	if (!priv->plat->pmt) {
 		struct ethtool_wolinfo wol = { .cmd = ETHTOOL_GWOL };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 9bc625fccca..16ce188697e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -490,7 +490,7 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (priv->plat->has_xgmac)
 		stmmac_xgmac2_mdio_read(new_bus, 0, MII_ADDR_C45);
 
-	if (priv->plat->phy_node || mdio_node)
+	if (priv->plat->phy_node || mdio_node || mdio_bus_data->phyless)
 		goto bus_register_done;
 
 	found = 0;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f8e8df25098..238d452ef43 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -82,6 +82,7 @@ struct stmmac_mdio_bus_data {
 	unsigned int phy_mask;
 	unsigned int has_xpcs;
 	unsigned int xpcs_an_inband;
+	unsigned int phyless;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
