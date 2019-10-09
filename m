Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC982D11F6
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 17:02:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AFDBC36B0C;
	Wed,  9 Oct 2019 15:02:00 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B32BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:01:58 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E83F1711AE79D2A87657;
 Wed,  9 Oct 2019 23:01:53 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 23:01:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <mcoquelin.stm32@gmail.com>, 
 <alexandre.torgue@st.com>
Date: Wed, 9 Oct 2019 23:01:38 +0800
Message-ID: <20191009150138.11640-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH -next] regulator: stm32-vrefbuf: use
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
 drivers/regulator/stm32-vrefbuf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index 8919a51..bdfaf7e 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -181,7 +181,6 @@ static const struct regulator_desc stm32_vrefbuf_regu = {
 
 static int stm32_vrefbuf_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct stm32_vrefbuf *priv;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
@@ -192,8 +191,7 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	priv->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
