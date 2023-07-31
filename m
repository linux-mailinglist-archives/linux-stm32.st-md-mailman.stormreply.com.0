Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C4769540
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 13:51:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB8CDC6B46E;
	Mon, 31 Jul 2023 11:51:10 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CBBEC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690804269; x=1722340269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tb8UcV3JNO0OnfuujH03nYZbaEtctQ46lfuTXXi+SFA=;
 b=Q4pIgpkCCHPMYqGzJ2PYX0x840tGWZFaGbU00OEhTPilYxsy0uNQ99DI
 bfma4mDl0Cz+nYAFh9aJjwhGl5Ez4uuiO2Uv1Nqoks6zuZmLduHgVJ5rP
 wGTQEXtuQ/omw3TWiPfukX2XBwdAviUcceCQmStT+Vc9M8mxdoss/5S5V
 c132NCl5o8bx9aRjEp4Vh2rKFjBvaebLncCIT7V4tKCpSYd2056S93jmj
 bliPf6iggSRsI8SNyAV5Bew1LGSBAdq7BuQ4P+7d6/01xg+RE4R5Oafhg
 TegAWH+eZt77PSp8AnO8GbjzaEdFcFmryH8dHj9lyGzuNWhHt1KCvyFSm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367889850"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="367889850"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 04:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="731571981"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="731571981"
Received: from pglc1085.png.intel.com ([10.221.100.47])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2023 04:51:03 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 31 Jul 2023 19:50:41 +0800
Message-Id: <20230731115041.13893-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: XGMAC support for mdio
	C22 addr > 3
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

For XGMAC versions < 2.2 number of supported mdio C22 addresses is
restricted to 3. From XGMAC version 2.2 there are no restrictions on
the C22 addresses, it supports all valid mdio addresses(0 to 31).

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 36 ++++++++++++-------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 57f2137bbe9d..c67171975d5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -35,6 +35,7 @@
 #define DWMAC_CORE_5_10		0x51
 #define DWMAC_CORE_5_20		0x52
 #define DWXGMAC_CORE_2_10	0x21
+#define DWXGMAC_CORE_2_20	0x22
 #define DWXLGMAC_CORE_2_00	0x20
 
 /* Device ID */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 3db1cb0fd160..dd9e2fec5328 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -62,11 +62,16 @@ static void stmmac_xgmac2_c45_format(struct stmmac_priv *priv, int phyaddr,
 static void stmmac_xgmac2_c22_format(struct stmmac_priv *priv, int phyaddr,
 				     int phyreg, u32 *hw_addr)
 {
-	u32 tmp;
+	u32 tmp = 0;
 
+	if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+		/* Until ver 2.20 XGMAC does not support C22 addr >= 4. Those
+		 * bits above bit 3 of XGMAC_MDIO_C22P register are reserved.
+		 */
+		tmp = readl(priv->ioaddr + XGMAC_MDIO_C22P);
+		tmp &= ~MII_XGMAC_C22P_MASK;
+	}
 	/* Set port as Clause 22 */
-	tmp = readl(priv->ioaddr + XGMAC_MDIO_C22P);
-	tmp &= ~MII_XGMAC_C22P_MASK;
 	tmp |= BIT(phyaddr);
 	writel(tmp, priv->ioaddr + XGMAC_MDIO_C22P);
 
@@ -132,8 +137,9 @@ static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
 
 	priv = netdev_priv(ndev);
 
-	/* HW does not support C22 addr >= 4 */
-	if (phyaddr > MII_XGMAC_MAX_C22ADDR)
+	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
+	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
 	stmmac_xgmac2_c22_format(priv, phyaddr, phyreg, &addr);
@@ -209,8 +215,9 @@ static int stmmac_xgmac2_mdio_write_c22(struct mii_bus *bus, int phyaddr,
 
 	priv = netdev_priv(ndev);
 
-	/* HW does not support C22 addr >= 4 */
-	if (phyaddr > MII_XGMAC_MAX_C22ADDR)
+	/* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
+	if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
+	    phyaddr > MII_XGMAC_MAX_C22ADDR)
 		return -ENODEV;
 
 	stmmac_xgmac2_c22_format(priv, phyaddr, phyreg, &addr);
@@ -551,13 +558,18 @@ int stmmac_mdio_register(struct net_device *ndev)
 		new_bus->read_c45 = &stmmac_xgmac2_mdio_read_c45;
 		new_bus->write_c45 = &stmmac_xgmac2_mdio_write_c45;
 
-		/* Right now only C22 phys are supported */
-		max_addr = MII_XGMAC_MAX_C22ADDR + 1;
+		if (priv->synopsys_id < DWXGMAC_CORE_2_20) {
+			/* Right now only C22 phys are supported */
+			max_addr = MII_XGMAC_MAX_C22ADDR + 1;
 
-		/* Check if DT specified an unsupported phy addr */
-		if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
-			dev_err(dev, "Unsupported phy_addr (max=%d)\n",
+			/* Check if DT specified an unsupported phy addr */
+			if (priv->plat->phy_addr > MII_XGMAC_MAX_C22ADDR)
+				dev_err(dev, "Unsupported phy_addr (max=%d)\n",
 					MII_XGMAC_MAX_C22ADDR);
+		} else {
+			/* XGMAC version 2.20 onwards support 32 phy addr */
+			max_addr = PHY_MAX_ADDR;
+		}
 	} else {
 		new_bus->read = &stmmac_mdio_read_c22;
 		new_bus->write = &stmmac_mdio_write_c22;
-- 
2.19.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
