Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04FA4220C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 14:53:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2354AC78F60;
	Mon, 24 Feb 2025 13:53:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3576C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 13:53:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD0685C56B9;
 Mon, 24 Feb 2025 13:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C4C4CED6;
 Mon, 24 Feb 2025 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405225;
 bh=66R0uz0/FSUUTTAMJEGB0eXAz2y8U/eK6OaaeBiTLhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BabkrY7JjObyWNDIIff76h4ZfpwKhiL7zqmu2SsH/j5AYNEodCBdx3wlhrR6trQEX
 zgagR7JRS+zNZb1oDhAi+ew4G8o7tnt7YOleGM2TQmzIysMykrD1hlbvRb/JEY3oob
 KfDHeD69kjHMRg0zcf0qmI2Hlk29vvMxsQrb7TSGtUrJqJVojEP3p7Pb/iZ1pn+Jt7
 WvQQm/XhLmrcxtXhJi8VqZWYVDcTfDeD6MCx9XoSEz6wMSaiZQYshjcQSs1kGXp9Vi
 6F+tMUvOkF1nGT93xcQBmRxPMpIxCKjtXA09hZwgEYEaCc6X5t5t8DQByCk4L2Ne5W
 0NnN7hPHbriCg==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>,
 Philipp Stanner <pstanner@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Date: Mon, 24 Feb 2025 14:53:21 +0100
Message-ID: <20250224135321.36603-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224135321.36603-2-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v3 3/4] stmmac: Remove pcim_*
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
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  7 -------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 10 ----------
 2 files changed, 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index e3cacd085b3f..f3ea6016be68 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -614,13 +614,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
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
index 352b01678c22..91ff6c15f977 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -227,20 +227,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
  *
  * @pdev: platform device pointer
  * Description: this function calls the main to free the net resources
- * and releases the PCI resources.
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
