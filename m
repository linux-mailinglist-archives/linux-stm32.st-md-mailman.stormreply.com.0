Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E834BA6D75C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 10:30:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A73E7C78F65;
	Mon, 24 Mar 2025 09:30:22 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94D14C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 09:30:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7A4CDA48787;
 Mon, 24 Mar 2025 09:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA39C4CEE4;
 Mon, 24 Mar 2025 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742808619;
 bh=psaOY5ZeahrGZpzq30alFkBQeU/NMOJb98eC6ZEqwbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ne+EECTvB01cWO85loW2xuaenERgxUwoB6VUIjmaVrCWD+hvF2ToBYezsihD58Qcz
 5jMvH4hxOZpLf7d9XZF28HUbJwioHic72EsEi2Gn3i3yTwY9m3F9xgj4UNWMHydoM0
 0+7ygZFTa9qhNgqhI/+ZjezQ6AVipjE530KQlChwiNd7qNuKMqmzC2c1NN52kqwdsA
 f1y/8b86HIG7XPexUudNEXhfsOSv6TNI3RtykSGudWvVJEnXjKjcXKLJRsG02RDwDL
 Tx/Nd4G67kakPn0iupwb8vNZ/+P+4/WWDHajxeaz9yDeVH4fx2i3edz79D66GDQZmG
 osauy+8wB6s6w==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Serge Semin <fancer.lancer@gmail.com>, Yinggang Gu <guyinggang@loongson.cn>
Date: Mon, 24 Mar 2025 10:29:29 +0100
Message-ID: <20250324092928.9482-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324092928.9482-2-phasta@kernel.org>
References: <20250324092928.9482-2-phasta@kernel.org>
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Chen <chenx97@aosc.io>, Jacob Keller <jacob.e.keller@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 2/3] stmmac: Remove pcim_*
	functions for driver detach
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

Functions prefixed with "pcim_" are managed devres functions which
perform automatic cleanup once the driver unloads. It is, thus, not
necessary to call any cleanup functions in remove() callbacks.

Remove the pcim_ cleanup function calls in the remove() callbacks.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Tested-by: Henry Chen <chenx97@aosc.io>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  8 --------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 12 +-----------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 7e8495547934..e015e54d9190 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -619,7 +619,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	struct loongson_data *ld;
-	int i;
 
 	ld = priv->plat->bsp_priv;
 	stmmac_dvr_remove(&pdev->dev);
@@ -630,13 +629,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
 	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN)
 		loongson_dwmac_msi_clear(pdev);
 
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
-
 	pci_disable_device(pdev);
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 352b01678c22..1637c8139b9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -226,21 +226,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  * stmmac_pci_remove
  *
  * @pdev: platform device pointer
- * Description: this function calls the main to free the net resources
- * and releases the PCI resources.
+ * Description: this function calls the main to free the net resources.
  */
 static void stmmac_pci_remove(struct pci_dev *pdev)
 {
-	int i;
-
 	stmmac_dvr_remove(&pdev->dev);
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		pcim_iounmap_regions(pdev, BIT(i));
-		break;
-	}
 }
 
 static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
