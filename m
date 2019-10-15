Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC9D787E
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2019 16:29:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95E49C36B0B;
	Tue, 15 Oct 2019 14:29:48 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BF9FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2019 14:29:47 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 604138D21D5FC6320023;
 Tue, 15 Oct 2019 22:29:44 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 15 Oct 2019
 22:29:36 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <peppe.cavallaro@st.com>, <alexandre.torgue@st.com>,
 <joabreu@synopsys.com>, <davem@davemloft.net>, <mcoquelin.stm32@gmail.com>
Date: Tue, 15 Oct 2019 22:28:52 +0800
Message-ID: <20191015142852.17164-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: netdev@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: use
	devm_platform_ioremap_resource() to simplify code
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

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 170c3a0..e65cb93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -645,8 +645,6 @@ EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
-	struct resource *res;
-
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -674,8 +672,7 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	if (stmmac_res->lpi_irq == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	stmmac_res->addr = devm_ioremap_resource(&pdev->dev, res);
+	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
 	return PTR_ERR_OR_ZERO(stmmac_res->addr);
 }
-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
