Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C411BDFFE
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 16:05:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D122C36B0D;
	Wed, 29 Apr 2020 14:05:11 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6525BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 14:05:09 +0000 (UTC)
IronPort-SDR: iAYGB3snxmYLyMxDDDsT3NgNttgF3LiItKh5J7SNtRPrlOeeEHAon9BuNwSyDEm9tXV22jNib2
 1u7HXskFMbTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 07:04:52 -0700
IronPort-SDR: hjWhcEhqGrqrJTscULvpQVBhMT0bQfWXlg6xJ2eRyDeM/MHiwMVZ4vYqchY/6A+NxUcMi1Ejpd
 rNlW5mq/qTXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="257970234"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2020 07:04:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CE6F5425; Wed, 29 Apr 2020 17:04:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Wed, 29 Apr 2020 17:04:49 +0300
Message-Id: <20200429140449.9484-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429140449.9484-1-andriy.shevchenko@linux.intel.com>
References: <20200429140449.9484-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH v1 5/5] stmmac: intel: Fix indentation to put
	on one line affected code
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

There is no competition to get more LOCs into the kernel, and driver can look
better and have improved readability without those additional line breaks.

While at it, shorten info structures that they are all PCI, at the end it's
a PCI driver for Intel hardware.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 92 +++++++------------
 1 file changed, 32 insertions(+), 60 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index c6154b6347a41f..4710b8e3a22f89 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -83,13 +83,9 @@ static int intel_serdes_powerup(struct net_device *ndev, void *priv_data)
 	serdes_phy_addr = intel_priv->mdio_adhoc_addr;
 
 	/* assert clk_req */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
-
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 	data |= SERDES_PLL_CLK;
-
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* check for clk_ack assertion */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -103,13 +99,9 @@ static int intel_serdes_powerup(struct net_device *ndev, void *priv_data)
 	}
 
 	/* assert lane reset */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
-
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 	data |= SERDES_RST;
-
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* check for assert lane reset reflection */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -123,14 +115,12 @@ static int intel_serdes_powerup(struct net_device *ndev, void *priv_data)
 	}
 
 	/*  move power state to P0 */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 
 	data &= ~SERDES_PWR_ST_MASK;
 	data |= SERDES_PWR_ST_P0 << SERDES_PWR_ST_SHIFT;
 
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* Check for P0 state */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -159,14 +149,12 @@ static void intel_serdes_powerdown(struct net_device *ndev, void *intel_data)
 	serdes_phy_addr = intel_priv->mdio_adhoc_addr;
 
 	/*  move power state to P3 */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 
 	data &= ~SERDES_PWR_ST_MASK;
 	data |= SERDES_PWR_ST_P3 << SERDES_PWR_ST_SHIFT;
 
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* Check for P3 state */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -180,13 +168,9 @@ static void intel_serdes_powerdown(struct net_device *ndev, void *intel_data)
 	}
 
 	/* de-assert clk_req */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
-
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 	data &= ~SERDES_PLL_CLK;
-
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* check for clk_ack de-assert */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -200,13 +184,9 @@ static void intel_serdes_powerdown(struct net_device *ndev, void *intel_data)
 	}
 
 	/* de-assert lane reset */
-	data = mdiobus_read(priv->mii, serdes_phy_addr,
-			    SERDES_GCR0);
-
+	data = mdiobus_read(priv->mii, serdes_phy_addr, SERDES_GCR0);
 	data &= ~SERDES_RST;
-
-	mdiobus_write(priv->mii, serdes_phy_addr,
-		      SERDES_GCR0, data);
+	mdiobus_write(priv->mii, serdes_phy_addr, SERDES_GCR0, data);
 
 	/* check for de-assert lane reset reflection */
 	data = serdes_status_poll(priv, serdes_phy_addr,
@@ -367,7 +347,7 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 	return ehl_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_sgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_sgmii1g_info = {
 	.setup = ehl_sgmii_data,
 };
 
@@ -381,7 +361,7 @@ static int ehl_rgmii_data(struct pci_dev *pdev,
 	return ehl_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_rgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_rgmii1g_info = {
 	.setup = ehl_rgmii_data,
 };
 
@@ -400,7 +380,7 @@ static int ehl_pse0_rgmii1g_data(struct pci_dev *pdev,
 	return ehl_pse0_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_pse0_rgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_pse0_rgmii1g_info = {
 	.setup = ehl_pse0_rgmii1g_data,
 };
 
@@ -413,7 +393,7 @@ static int ehl_pse0_sgmii1g_data(struct pci_dev *pdev,
 	return ehl_pse0_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_pse0_sgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_pse0_sgmii1g_info = {
 	.setup = ehl_pse0_sgmii1g_data,
 };
 
@@ -432,7 +412,7 @@ static int ehl_pse1_rgmii1g_data(struct pci_dev *pdev,
 	return ehl_pse1_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_pse1_rgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_pse1_rgmii1g_info = {
 	.setup = ehl_pse1_rgmii1g_data,
 };
 
@@ -445,7 +425,7 @@ static int ehl_pse1_sgmii1g_data(struct pci_dev *pdev,
 	return ehl_pse1_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info ehl_pse1_sgmii1g_pci_info = {
+static struct stmmac_pci_info ehl_pse1_sgmii1g_info = {
 	.setup = ehl_pse1_sgmii1g_data,
 };
 
@@ -470,7 +450,7 @@ static int tgl_sgmii_data(struct pci_dev *pdev,
 	return tgl_common_data(pdev, plat);
 }
 
-static struct stmmac_pci_info tgl_sgmii1g_pci_info = {
+static struct stmmac_pci_info tgl_sgmii1g_info = {
 	.setup = tgl_sgmii_data,
 };
 
@@ -573,7 +553,7 @@ static int quark_default_data(struct pci_dev *pdev,
 	return 0;
 }
 
-static const struct stmmac_pci_info quark_pci_info = {
+static const struct stmmac_pci_info quark_info = {
 	.setup = quark_default_data,
 };
 
@@ -598,8 +578,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	struct stmmac_resources res;
 	int ret;
 
-	intel_priv = devm_kzalloc(&pdev->dev, sizeof(*intel_priv),
-				  GFP_KERNEL);
+	intel_priv = devm_kzalloc(&pdev->dev, sizeof(*intel_priv), GFP_KERNEL);
 	if (!intel_priv)
 		return -ENOMEM;
 
@@ -734,26 +713,19 @@ static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
 #define PCI_DEVICE_ID_INTEL_TGL_SGMII1G_ID		0xa0ac
 
 static const struct pci_device_id intel_eth_pci_id_table[] = {
-	{ PCI_DEVICE_DATA(INTEL, QUARK_ID, &quark_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_RGMII1G_ID, &ehl_rgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII1G_ID, &ehl_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII2G5_ID, &ehl_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_RGMII1G_ID,
-			  &ehl_pse0_rgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII1G_ID,
-			  &ehl_pse0_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII2G5_ID,
-			  &ehl_pse0_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_RGMII1G_ID,
-			  &ehl_pse1_rgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII1G_ID,
-			  &ehl_pse1_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII2G5_ID,
-			  &ehl_pse1_sgmii1g_pci_info) },
-	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G_ID, &tgl_sgmii1g_pci_info) },
+	{ PCI_DEVICE_DATA(INTEL, QUARK_ID, &quark_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_RGMII1G_ID, &ehl_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII1G_ID, &ehl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_SGMII2G5_ID, &ehl_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_RGMII1G_ID, &ehl_pse0_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII1G_ID, &ehl_pse0_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE0_SGMII2G5_ID, &ehl_pse0_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_RGMII1G_ID, &ehl_pse1_rgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII1G_ID, &ehl_pse1_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, EHL_PSE1_SGMII2G5_ID, &ehl_pse1_sgmii1g_info) },
+	{ PCI_DEVICE_DATA(INTEL, TGL_SGMII1G_ID, &tgl_sgmii1g_info) },
 	{}
 };
-
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
 
 static struct pci_driver intel_eth_pci_driver = {
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
