Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA41BE1B0
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 16:52:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02447C36B0E;
	Wed, 29 Apr 2020 14:52:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52199C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 14:52:39 +0000 (UTC)
IronPort-SDR: JL8BvAtXIgbjVg2WcZht+eZJ9pod/iyK+PFTfgRenohrZqbAZqlQRQqgYGNxUJP/WKXhL0ciDw
 sckl7/8nbCwQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 07:52:37 -0700
IronPort-SDR: hCdv5P4609QFduh+pTZm2pBMPJIYdIkC4Fbf1suvkSy5fODcwG7gVHHaUBi38D4wHaq67TeoQ2
 E0Rj8si1cPTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="367828365"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 29 Apr 2020 07:52:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 85662166; Wed, 29 Apr 2020 17:52:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Date: Wed, 29 Apr 2020 17:52:30 +0300
Message-Id: <20200429145233.81943-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429145233.81943-1-andriy.shevchenko@linux.intel.com>
References: <20200429145233.81943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH v2 3/6] stmmac: intel: Convert to use
	pci_alloc_irq_vectors() API
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

pci_enable_msi() is deprecated API, thus, switch to modern
pci_alloc_irq_vectors().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebase on updated patch 1 (no changes in the content, though)
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index e9f94855949959..bb8bf31c1259ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -649,15 +649,18 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	pci_enable_msi(pdev);
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
 
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
-	res.wol_irq = pdev->irq;
-	res.irq = pdev->irq;
+	res.wol_irq = pci_irq_vector(pdev, 0);
+	res.irq = pci_irq_vector(pdev, 0);
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret) {
+		pci_free_irq_vectors(pdev);
 		clk_disable_unprepare(plat->stmmac_clk);
 		clk_unregister_fixed_rate(plat->stmmac_clk);
 	}
@@ -679,6 +682,8 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
+	pci_free_irq_vectors(pdev);
+
 	clk_disable_unprepare(priv->plat->stmmac_clk);
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
