Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4922A92F6
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 10:40:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B7F5C3FAD4;
	Fri,  6 Nov 2020 09:40:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9856FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 09:40:49 +0000 (UTC)
IronPort-SDR: +YIqYWUyNEHr8FaqFfldiJzXRzbcIdjjFOs7iMtd3RIPfZ/DIPGd3FDCiJ+XwsLIMwdlsAvsvy
 i5m0CJDcc06g==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="233689717"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="233689717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 01:40:47 -0800
IronPort-SDR: mFsLs/WbQF0CrQWu6INR/ALjXHhz2xqtBvAnYtd2IXKMvL88+duqxlA3zlLJNq3J+CTwO40l8W
 GFvX9a6FlZlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="354673376"
Received: from glass.png.intel.com ([172.30.181.98])
 by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2020 01:40:43 -0800
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri,  6 Nov 2020 17:43:41 +0800
Message-Id: <20201106094341.4241-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: change all
	EHL/TGL to auto detect phy addr
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

Set all EHL/TGL phy_addr to -1 so that the driver will automatically
detect it at run-time by probing all the possible 32 addresses.

Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index b6e5e3e36b63..7c1353f37247 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -236,6 +236,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	int ret;
 	int i;
 
+	plat->phy_addr = -1;
 	plat->clk_csr = 5;
 	plat->has_gmac = 0;
 	plat->has_gmac4 = 1;
@@ -345,7 +346,6 @@ static int ehl_sgmii_data(struct pci_dev *pdev,
 			  struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 1;
-	plat->phy_addr = 0;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 
 	plat->serdes_powerup = intel_serdes_powerup;
@@ -362,7 +362,6 @@ static int ehl_rgmii_data(struct pci_dev *pdev,
 			  struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 1;
-	plat->phy_addr = 0;
 	plat->phy_interface = PHY_INTERFACE_MODE_RGMII;
 
 	return ehl_common_data(pdev, plat);
@@ -376,7 +375,6 @@ static int ehl_pse0_common_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 2;
-	plat->phy_addr = 1;
 	return ehl_common_data(pdev, plat);
 }
 
@@ -408,7 +406,6 @@ static int ehl_pse1_common_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 3;
-	plat->phy_addr = 1;
 	return ehl_common_data(pdev, plat);
 }
 
@@ -450,7 +447,6 @@ static int tgl_sgmii_data(struct pci_dev *pdev,
 			  struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 1;
-	plat->phy_addr = 0;
 	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
