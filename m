Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFF144E46
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2020 10:10:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 743F5C36B0C;
	Wed, 22 Jan 2020 09:10:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F879C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2020 09:10:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 01:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,349,1574150400"; d="scan'208";a="244990551"
Received: from unknown (HELO bong5-HP-Z440.png.intel.com) ([10.221.118.166])
 by orsmga002.jf.intel.com with ESMTP; 22 Jan 2020 01:10:33 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Wed, 22 Jan 2020 17:09:36 +0800
Message-Id: <20200122090936.28555-6-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122090936.28555-1-boon.leong.ong@intel.com>
References: <20200122090936.28555-1-boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Voon Weifeng <weifeng.voon@intel.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 5/5] net: stmmac: update pci platform
	data to use phy_interface
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

The recent patch to support passive mode converter did not take care the
phy interface configuration in PCI platform data. Hence, converting all
the PCI platform data from plat->interface to plat->phy_interface as the
default mode is meant for PHY.

Fixes: 0060c8783330 ("net: stmmac: implement support for passive mode converters via dt")
Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Tested-by: Tan, Tee Min <tee.min.tan@intel.com>
Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 8237dbc3e991..d2bc04dedd7c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -96,7 +96,7 @@ static int stmmac_default_data(struct pci_dev *pdev,
 
 	plat->bus_id = 1;
 	plat->phy_addr = 0;
-	plat->interface = PHY_INTERFACE_MODE_GMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
@@ -220,7 +220,8 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_addr = 0;
-	plat->interface = PHY_INTERFACE_MODE_SGMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -233,7 +234,8 @@ static int ehl_rgmii_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_addr = 0;
-	plat->interface = PHY_INTERFACE_MODE_RGMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+
 	return ehl_common_data(pdev, plat);
 }
 
@@ -261,7 +263,7 @@ static int tgl_sgmii_data(struct pci_dev *pdev,
 {
 	plat->bus_id = 1;
 	plat->phy_addr = 0;
-	plat->interface = PHY_INTERFACE_MODE_SGMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	return tgl_common_data(pdev, plat);
 }
 
@@ -361,7 +363,7 @@ static int quark_default_data(struct pci_dev *pdev,
 
 	plat->bus_id = pci_dev_id(pdev);
 	plat->phy_addr = ret;
-	plat->interface = PHY_INTERFACE_MODE_RMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_RMII;
 
 	plat->dma_cfg->pbl = 16;
 	plat->dma_cfg->pblx8 = true;
@@ -418,7 +420,7 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->bus_id = 1;
 	plat->phy_addr = -1;
-	plat->interface = PHY_INTERFACE_MODE_GMII;
+	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
