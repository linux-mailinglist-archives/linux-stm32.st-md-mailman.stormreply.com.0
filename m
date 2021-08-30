Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF433FAF88
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 03:25:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D81CC5A4D5;
	Mon, 30 Aug 2021 01:25:02 +0000 (UTC)
Received: from qq.com (smtpbg551.qq.com [183.3.226.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F45DC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 01:24:58 +0000 (UTC)
X-QQ-mid: bizesmtp46t1630286661to8pa6p1
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 30 Aug 2021 09:24:19 +0800 (CST)
X-QQ-SSF: 0140000000200070D000B00A0000000
X-QQ-FEAT: KrMf3JMLLXNBGie6cqgwm5UBDY6dT7nckKLs6yVHyn3GdTx38fmsxejuRm+3k
 M9rvrjyNm5KqW/wPxPyXsLogH7t1UO3fkkB8ieChemlDysJ7aV9kY9w+G3ClZ1aR8H80oIx
 0PjrlkrKNuwQncKD+CHr4yaX76wodH3CV3JNoVGeeWSalyrWjCimlbhhix8VJ8kaceU4Dsr
 VwDnEo9x5aATgfBBsEOVhslZLPO34dwSrYaDNgxWErKreXLSn02NuOsFDZpJyAias7i9JXK
 3DTlVS2NkLX+8FqUZu3BzDx4DdZMBZHN++Tvl2FJQX7Ml7MP8JIGCF/jzlwXgNuK31tRrac
 JiAsWjJhrqnKMCA1pk=
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com
Date: Mon, 30 Aug 2021 09:24:17 +0800
Message-Id: <20210830012417.14872-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: zhaoxiao <zhaoxiao@uniontech.com>, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] stmmac: dwmac-loongson: change the
	pr_info() to dev_err() in loongson_dwmac_probe()
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

Change the pr_info to dev_err.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
v2: Remove the adding a return. 
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..abcb55f87579 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -54,14 +54,13 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
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
 
@@ -69,6 +68,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (!plat)
 		return -ENOMEM;
 
+
 	if (plat->mdio_node) {
 		dev_err(&pdev->dev, "Found MDIO subnode\n");
 		mdio = true;
@@ -111,6 +111,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	phy_mode = device_get_phy_mode(&pdev->dev);
 	if (phy_mode < 0)
 		dev_err(&pdev->dev, "phy_mode not found\n");
+	
 
 	plat->phy_interface = phy_mode;
 	plat->interface = PHY_INTERFACE_MODE_GMII;
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
