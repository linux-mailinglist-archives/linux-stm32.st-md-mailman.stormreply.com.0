Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE321BFF80
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 17:03:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F885C36B24;
	Thu, 30 Apr 2020 15:03:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 659ABC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 15:03:02 +0000 (UTC)
IronPort-SDR: smaAZaQFPrZmDrqINwn+QF01c6racXRjmR/XoSO7/49vcFqjoUA0Oi9tyZ6JZTovtty/IXwrnV
 KPvFIVlCIrsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 08:03:00 -0700
IronPort-SDR: zSrDZcbfmQWN3MSIEGtd8GZH/6BJBvhn6L17FP96YH9hGrAkZT/pHv9IH0oLHq/rxdJWbIlbpI
 g6qV+TOoZxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="459967121"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2020 08:02:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 85F4E402; Thu, 30 Apr 2020 18:02:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Thu, 30 Apr 2020 18:02:52 +0300
Message-Id: <20200430150254.34565-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200430150254.34565-1-andriy.shevchenko@linux.intel.com>
References: <20200430150254.34565-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH v3 5/7] stmmac: intel: Eliminate useless
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
index bb8bf31c1259ef..b0d735e4c13ce2 100644
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
