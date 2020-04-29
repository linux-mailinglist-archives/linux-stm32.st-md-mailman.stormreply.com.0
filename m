Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E261BDFFB
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 16:04:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376E9C36B11;
	Wed, 29 Apr 2020 14:04:56 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D355C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 14:04:55 +0000 (UTC)
IronPort-SDR: r/Z73LAPaBw7DihY+dL/8x05+R9521W1VP3VpnkUg7DpolQboANUPDuSHUanI1q46ufQxVdUYZ
 t83SwjDq+l/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 07:04:52 -0700
IronPort-SDR: PS2yhgsUeNq86wBlEX//fAh+InLNymgHjlSHiU9YzXQohtuoAZgMleG55c/luN5aHXKm+izro4
 ZyXqjk8OuK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="459205137"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2020 07:04:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C04D5402; Wed, 29 Apr 2020 17:04:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Wed, 29 Apr 2020 17:04:48 +0300
Message-Id: <20200429140449.9484-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429140449.9484-1-andriy.shevchenko@linux.intel.com>
References: <20200429140449.9484-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH v1 4/5] stmmac: intel: Eliminate useless
	conditions and variables
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

There are useless conditions like

	func()
	{
		...
		int ret;
		...
		ret = foo();
		if (ret)
			return ret;

		return 0;
	}

which may be replaced with direct return statement, what we have done here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 46e3e4d6a34ac8..c6154b6347a41f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -347,16 +347,11 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 static int ehl_common_data(struct pci_dev *pdev,
 			   struct plat_stmmacenet_data *plat)
 {
-	int ret;
-
 	plat->rx_queues_to_use = 8;
 	plat->tx_queues_to_use = 8;
 	plat->clk_ptp_rate = 200000000;
-	ret = intel_mgbe_common_data(pdev, plat);
-	if (ret)
-		return ret;
 
-	return 0;
+	return intel_mgbe_common_data(pdev, plat);
 }
 
 static int ehl_sgmii_data(struct pci_dev *pdev,
@@ -457,16 +452,11 @@ static struct stmmac_pci_info ehl_pse1_sgmii1g_pci_info = {
 static int tgl_common_data(struct pci_dev *pdev,
 			   struct plat_stmmacenet_data *plat)
 {
-	int ret;
-
 	plat->rx_queues_to_use = 6;
 	plat->tx_queues_to_use = 4;
 	plat->clk_ptp_rate = 200000000;
-	ret = intel_mgbe_common_data(pdev, plat);
-	if (ret)
-		return ret;
 
-	return 0;
+	return intel_mgbe_common_data(pdev, plat);
 }
 
 static int tgl_sgmii_data(struct pci_dev *pdev,
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
