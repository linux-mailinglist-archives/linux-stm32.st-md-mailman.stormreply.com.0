Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED82B214E6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 20:51:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE858C32E92;
	Mon, 11 Aug 2025 18:51:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 231F2C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+ZWjlAiVXaiMSqihZGqMuzI69Y869sPCzWPUrdL1jM=; b=i+dwIOA2KDyihbulA8F6anitXB
 sfqlks2vOIC857Xg/6Kani+onWeW78iXcjgnIhgXQSUlUeVI0MQQqx5z1EnJ+lc4G04vku/hs8a8M
 /eM4ZNa0yp7hn5k7zd57tBPVqaR6oNBXjzdnyv0RtzYQdOTrUbATuTbvAJVXO9Uied0JaFi90CsRP
 Tan9z4iTsyv4hXIglxTNtPoE2gcr+75ChSM0DGVWOIG7arVDshxhVrAEd1VPSE1yj8k0yb+Qs5rN8
 AJ/X42IWzEbR8BjHob4VktXGZNnucJdoz0PNHBE7Ya056I8v/pNdKNVHUiMISkuXPxgqR/OjGOSS9
 MgmSFqfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41016 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1ulXcW-0003bD-1Q;
 Mon, 11 Aug 2025 19:51:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ulXbm-008gqs-P9; Mon, 11 Aug 2025 19:50:58 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ulXbm-008gqs-P9@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:58 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net-next 4/9] net: stmmac: intel: convert to
 suspend()/resume() methods
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

Convert intel to use the new suspend() and resume() methods rather
than implementing these in custom wrappers around the main driver's
suspend/resume methods. This allows this driver to use the stmmac
simple PM ops structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 74 +++++++++----------
 1 file changed, 35 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ea33ae39be6b..3fac3945cbfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1231,6 +1231,37 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 	return 0;
 }
 
+static int intel_eth_pci_suspend(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	ret = pci_save_state(pdev);
+	if (ret)
+		return ret;
+
+	pci_wake_from_d3(pdev, true);
+	pci_set_power_state(pdev, PCI_D3hot);
+	return 0;
+}
+
+static int intel_eth_pci_resume(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	pci_restore_state(pdev);
+	pci_set_power_state(pdev, PCI_D0);
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	return 0;
+}
+
 /**
  * intel_eth_pci_probe
  *
@@ -1292,6 +1323,9 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	plat->bsp_priv = intel_priv;
+	plat->suspend = intel_eth_pci_suspend;
+	plat->resume = intel_eth_pci_resume;
+
 	intel_priv->mdio_adhoc_addr = INTEL_MGBE_ADHOC_ADDR;
 	intel_priv->crossts_adj = 1;
 
@@ -1355,44 +1389,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 }
 
-static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	ret = stmmac_suspend(dev);
-	if (ret)
-		return ret;
-
-	ret = pci_save_state(pdev);
-	if (ret)
-		return ret;
-
-	pci_wake_from_d3(pdev, true);
-	pci_set_power_state(pdev, PCI_D3hot);
-	return 0;
-}
-
-static int __maybe_unused intel_eth_pci_resume(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	int ret;
-
-	pci_restore_state(pdev);
-	pci_set_power_state(pdev, PCI_D0);
-
-	ret = pcim_enable_device(pdev);
-	if (ret)
-		return ret;
-
-	pci_set_master(pdev);
-
-	return stmmac_resume(dev);
-}
-
-static SIMPLE_DEV_PM_OPS(intel_eth_pm_ops, intel_eth_pci_suspend,
-			 intel_eth_pci_resume);
-
 #define PCI_DEVICE_ID_INTEL_QUARK		0x0937
 #define PCI_DEVICE_ID_INTEL_EHL_RGMII1G		0x4b30
 #define PCI_DEVICE_ID_INTEL_EHL_SGMII1G		0x4b31
@@ -1442,7 +1438,7 @@ static struct pci_driver intel_eth_pci_driver = {
 	.probe = intel_eth_pci_probe,
 	.remove = intel_eth_pci_remove,
 	.driver         = {
-		.pm     = &intel_eth_pm_ops,
+		.pm     = &stmmac_simple_pm_ops,
 	},
 };
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
