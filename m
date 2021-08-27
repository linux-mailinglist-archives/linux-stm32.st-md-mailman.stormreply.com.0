Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621E3F97B2
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Aug 2021 11:53:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A18C597B3;
	Fri, 27 Aug 2021 09:53:44 +0000 (UTC)
Received: from smtpbg516.qq.com (smtpbg516.qq.com [203.205.250.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C08EAC5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Aug 2021 08:56:03 +0000 (UTC)
X-QQ-mid: bizesmtp45t1630054554txi14380
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 27 Aug 2021 16:55:51 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: 2NShQxXslJ80ztGdYiIwKJI2vknkXTv63LXb/bw/s+X3HP0lDGrw8HmTEgotg
 K3SAgXsqbAzrvemBm5NRhmo6Xvl6QZb0LPyvnsXYdGtVNMBELz54P4NX0i5Ach3T3u2nOlw
 LVlSSIFlFHQ58vylw2cXpabc1utlTAJbZ7nPlSbDf5/ZtOmBJ47VBZLEdXagzHVvC2KiUub
 EK7r714h9wdmcQ4MlqL26JYpMFIREL8idXQpX78arNRiAXCDeDP/N5tZhVTGLj8Vxfc56nw
 WIKkGAFy0vCMkiFCqUfvDffEeJR+1D0HQGNSfPawlnjXMAu+Hy6Itp015Y2seydmVhT5h7Z
 TvS2g2HGAgQ/9cLtMY=
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com
Date: Fri, 27 Aug 2021 16:55:50 +0800
Message-Id: <20210827085550.13519-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Fri, 27 Aug 2021 09:53:43 +0000
Cc: zhaoxiao <zhaoxiao@uniontech.com>, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmmac: dwmac-loongson: change the pr_info()
	to dev_err() in loongson_dwmac_probe()
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

- Change the pr_info/dev_info to dev_err.
- Add the dev_err to improve readability.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..495c94e7929f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -54,20 +54,21 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	bool mdio = false;
 
 	np = dev_of_node(&pdev->dev);
-
 	if (!np) {
-		pr_info("dwmac_loongson_pci: No OF node\n");
+		dev_err(&pdev->dev, "dwmac_loongson_pci: No OF node\n");
 		return -ENODEV;
 	}
 
 	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
+		dev_err(&pdev->dev, "dwmac_loongson_pci: Incompatible OF node\n");
 		return -ENODEV;
 	}
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
-	if (!plat)
+	if (!plat) {
+		dev_err(&pdev->dev, "memory allocation failed\n");
 		return -ENOMEM;
+	}
 
 	if (plat->mdio_node) {
 		dev_err(&pdev->dev, "Found MDIO subnode\n");
@@ -109,8 +110,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		plat->bus_id = pci_dev_id(pdev);
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
+	if (phy_mode < 0) {
 		dev_err(&pdev->dev, "phy_mode not found\n");
+		return phy_mode;
+	}
 
 	plat->phy_interface = phy_mode;
 	plat->interface = PHY_INTERFACE_MODE_GMII;
@@ -130,7 +133,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 
 	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
 	if (res.wol_irq < 0) {
-		dev_info(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
+		dev_err(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
 		res.wol_irq = res.irq;
 	}
 
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
