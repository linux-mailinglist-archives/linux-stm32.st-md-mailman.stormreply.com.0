Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9091F2283
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 01:09:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8AADC36B22;
	Mon,  8 Jun 2020 23:09:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BD4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2020 23:09:22 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E61020890;
 Mon,  8 Jun 2020 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657761;
 bh=KO1X9m7NPmmKUMWAX5wnckaZR418zjtg/BYnrfIAY3Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QqJSJyLYdeazMZgOuSNTXYwUYrKmWGWKaCrGRUbyA1EjimHD+sQxUJAUBVMj0D7kn
 1l4d9OwSHu9nUNTeOVO44HQSkpgQS84oJPzFG2nfWtaDdRNxH/uL8Acs+Q0xAqrR3C
 orVKFegMt+z0dieZWpMpcPIBxXxOsUqitUTiCdT4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  8 Jun 2020 19:03:59 -0400
Message-Id: <20200608230607.3361041-146-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.7 146/274] stmmac: intel: Fix clock
	handling on error and remove paths
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit 09f012e64e4b8126ed6f02d0a85a57c3a0465cf9 ]

clk_prepare_enable() might fail, we have to check its returned value.
Besides that we have to call clk_disable_unprepare() on the error and
remove paths. Do above in the dwmac-intel driver.

While at it, remove leftover in stmmac_pci and remove unneeded condition
for NULL-aware clk_unregister_fixed_rate() call.

Fixes: 58da0cfa6cf1 ("net: stmmac: create dwmac-intel.c to contain all Intel platform")
Cc: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 20 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  5 -----
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 2e4aaedb93f5..d163c4b43da0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -252,6 +252,7 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 static int intel_mgbe_common_data(struct pci_dev *pdev,
 				  struct plat_stmmacenet_data *plat)
 {
+	int ret;
 	int i;
 
 	plat->clk_csr = 5;
@@ -324,7 +325,12 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 		dev_warn(&pdev->dev, "Fail to register stmmac-clk\n");
 		plat->stmmac_clk = NULL;
 	}
-	clk_prepare_enable(plat->stmmac_clk);
+
+	ret = clk_prepare_enable(plat->stmmac_clk);
+	if (ret) {
+		clk_unregister_fixed_rate(plat->stmmac_clk);
+		return ret;
+	}
 
 	/* Set default value for multicast hash bins */
 	plat->multicast_filter_bins = HASH_TABLE_SIZE;
@@ -657,7 +663,13 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
-	return stmmac_dvr_probe(&pdev->dev, plat, &res);
+	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
+	if (ret) {
+		clk_disable_unprepare(plat->stmmac_clk);
+		clk_unregister_fixed_rate(plat->stmmac_clk);
+	}
+
+	return ret;
 }
 
 /**
@@ -675,8 +687,8 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
-	if (priv->plat->stmmac_clk)
-		clk_unregister_fixed_rate(priv->plat->stmmac_clk);
+	clk_disable_unprepare(priv->plat->stmmac_clk);
+	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 3fb21f7ac9fb..272cb47af9f2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -217,15 +217,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  */
 static void stmmac_pci_remove(struct pci_dev *pdev)
 {
-	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
 	int i;
 
 	stmmac_dvr_remove(&pdev->dev);
 
-	if (priv->plat->stmmac_clk)
-		clk_unregister_fixed_rate(priv->plat->stmmac_clk);
-
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
