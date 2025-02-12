Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CFA34094
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 14:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55555C7A832;
	Thu, 13 Feb 2025 13:43:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9CEAC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 14:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 214095C5F24;
 Wed, 12 Feb 2025 14:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C524C4CEDF;
 Wed, 12 Feb 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739372353;
 bh=oCvq9gSavJWl2kDBTfPs3YD8zX+/lohqwlywSoG+xkQ=;
 h=From:To:Cc:Subject:Date:From;
 b=hHVQnH6CNr1DzWYc7ti8auIZ/FJHzitoE4i/mpGQgFTAleKGfwLoybhM9Pyoop3SW
 qEwgOvKAQvnZm1sJliTrLgmB74tMM1OGMmzzm/+KuOfYCjKCHFMZBkC49DPz5eoC7o
 3q6hox23kgW2BrozBC5dt0lXhATKjuMUwfnkR0utm9dwqq5hPKRxlaHXKMAPGCzzWc
 d/5D1MW5Vf+NBRv7b2xL0TQs2Ib7FRaJhrWTQhV0Jkrq34z9bNgUYWy7MPdeN//8qa
 sMprTgrL6hVlfF50Ut2YlltyO+xk0b2JZyZoclBGdPliHjbfAVGWTelTS8U+GbGLgU
 T1DYxD/Orn1PA==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>, Yanteng Si <si.yanteng@linux.dev>,
 Philipp Stanner <pstanner@redhat.com>
Date: Wed, 12 Feb 2025 15:58:32 +0100
Message-ID: <20250212145831.101719-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2025 13:43:39 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] stmmac: Replace deprecated PCI functions
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

From: Philipp Stanner <pstanner@redhat.com>

The PCI functions
  - pcim_iomap_regions()
  - pcim_iomap_table() and
  - pcim_iounmap_regions()
have been deprecated.

The usage of pcim_* cleanup functions in the driver detach path (remove
callback) is actually not necessary, since they perform that cleanup
automatically.

Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 28 ++++++-------------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 24 ++++------------
 2 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index bfe6e2d631bd..19b16df864dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -11,6 +11,8 @@
 #include "dwmac_dma.h"
 #include "dwmac1000.h"
 
+#define DRIVER_NAME "dwmac-loongson-pci"
+
 /* Normal Loongson Tx Summary */
 #define DMA_INTR_ENA_NIE_TX_LOONGSON	0x00040000
 /* Normal Loongson Rx Summary */
@@ -520,7 +522,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 {
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_pci_info *info;
-	struct stmmac_resources res;
+	struct stmmac_resources res = {};
 	struct loongson_data *ld;
 	int ret, i;
 
@@ -552,17 +554,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	pci_set_master(pdev);
 
 	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
-		if (ret)
-			goto err_disable_device;
-		break;
-	}
-
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[0];
+	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	ret = PTR_ERR_OR_ZERO(res.addr);
+	if (ret)
+		goto err_disable_device;
 
 	plat->bsp_priv = ld;
 	plat->setup = loongson_dwmac_setup;
@@ -617,13 +612,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
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
 
@@ -673,7 +661,7 @@ static const struct pci_device_id loongson_dwmac_id_table[] = {
 MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
 
 static struct pci_driver loongson_dwmac_driver = {
-	.name = "dwmac-loongson-pci",
+	.name = DRIVER_NAME,
 	.id_table = loongson_dwmac_id_table,
 	.probe = loongson_dwmac_probe,
 	.remove = loongson_dwmac_remove,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 352b01678c22..f3279c4387c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -155,7 +155,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 {
 	struct stmmac_pci_info *info = (struct stmmac_pci_info *)id->driver_data;
 	struct plat_stmmacenet_data *plat;
-	struct stmmac_resources res;
+	struct stmmac_resources res = {};
 	int i;
 	int ret;
 
@@ -188,13 +188,13 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return ret;
 	}
 
-	/* Get the base address of device */
+	/* The first BAR > 0 is the base IO addr of our device. */
 	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		if (pci_resource_len(pdev, i) == 0)
 			continue;
-		ret = pcim_iomap_regions(pdev, BIT(i), pci_name(pdev));
-		if (ret)
-			return ret;
+		res.addr = pcim_iomap_region(pdev, i, STMMAC_RESOURCE_NAME);
+		if (IS_ERR(res.addr))
+			return PTR_ERR(res.addr)
 		break;
 	}
 
@@ -204,8 +204,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	memset(&res, 0, sizeof(res));
-	res.addr = pcim_iomap_table(pdev)[i];
 	res.wol_irq = pdev->irq;
 	res.irq = pdev->irq;
 
@@ -226,21 +224,11 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  * stmmac_pci_remove
  *
  * @pdev: platform device pointer
- * Description: this function calls the main to free the net resources
- * and releases the PCI resources.
+ * Description: Main driver resource release function
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
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
