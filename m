Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5A350E99
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 07:58:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2476C57B54;
	Thu,  1 Apr 2021 05:58:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FE9EC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 05:58:34 +0000 (UTC)
IronPort-SDR: td35nDFrYSXlP3l6Q+qGR0haaJjYlyEsmg7qqgT99boy3OxgForXMqEmDi+5Bh97NUiB2Ge+k5
 oRJ/bOgB6s3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192183834"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192183834"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 22:58:32 -0700
IronPort-SDR: gGck3JOSqyN3h8KmFVKd+VeDv/XjVplRu1cjb6DmIr3euSou4z/Xxpd0v3/TZLaE0xDmLc73eB
 2Rw4P3Atcgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="412516712"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2021 22:58:31 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
 by linux.intel.com (Postfix) with ESMTP id 62D0F580932;
 Wed, 31 Mar 2021 22:58:29 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  1 Apr 2021 14:02:50 +0800
Message-Id: <20210401060250.24109-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: use managed PCI
	function on probe and resume
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

Update dwmac-intel to use managed function, i.e. pcim_enable_device().

This will allow devres framework to call resource free function for us.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 3d9a57043af2..add95e20548d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -924,7 +924,7 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	/* Enable pci device */
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
 			__func__);
@@ -1006,13 +1006,9 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
-	pci_free_irq_vectors(pdev);
-
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 
 	pcim_iounmap_regions(pdev, BIT(0));
-
-	pci_disable_device(pdev);
 }
 
 static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
@@ -1028,7 +1024,6 @@ static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	pci_disable_device(pdev);
 	pci_wake_from_d3(pdev, true);
 	return 0;
 }
@@ -1041,7 +1036,7 @@ static int __maybe_unused intel_eth_pci_resume(struct device *dev)
 	pci_restore_state(pdev);
 	pci_set_power_state(pdev, PCI_D0);
 
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
