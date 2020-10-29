Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5329E74C
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 10:30:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52602C3FAD5;
	Thu, 29 Oct 2020 09:30:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E1FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 09:30:03 +0000 (UTC)
IronPort-SDR: X0EvwOb6xM8JZ8Y+ftb6T8l0qrdAiMUt9w4JjL4Xa54Szwvc8nCAV6AD+Dhf0wHP0M8W8LDN1W
 4su2jkjiXOFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="186186284"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="186186284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 02:30:02 -0700
IronPort-SDR: 9oMmPxJXPcUFT7rZNSb9AZfddF6HpV8s3RhFRzTKzoNHY2ikDC5AYif1R0PrcA7xx3FCUthsSV
 Ude9/FVyp/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; d="scan'208";a="424996821"
Received: from glass.png.intel.com ([172.30.181.98])
 by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2020 02:29:59 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 29 Oct 2020 17:32:28 +0800
Message-Id: <20201029093228.1741-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] stmmac: intel: Fix kernel panic on
	pci probe
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

The commit "stmmac: intel: Adding ref clock 1us tic for LPI cntr"
introduced a regression which leads to the kernel panic duing loading
of the dwmac_intel module.

Move the code block after pci resources is obtained.

Fixes: b4c5f83ae3f3 ("stmmac: intel: Adding ref clock 1us tic for LPI cntr")
Cc: Voon Weifeng <weifeng.voon@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index b6e5e3e36b63..81ee0a071b4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -625,13 +625,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	if (plat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
-	}
-
 	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (ret < 0)
 		return ret;
@@ -641,6 +634,13 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	res.wol_irq = pci_irq_vector(pdev, 0);
 	res.irq = pci_irq_vector(pdev, 0);
 
+	if (plat->eee_usecs_rate > 0) {
+		u32 tx_lpi_usec;
+
+		tx_lpi_usec = (plat->eee_usecs_rate / 1000000) - 1;
+		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
+	}
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret) {
 		pci_free_irq_vectors(pdev);
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
