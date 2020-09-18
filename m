Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02826FB7C
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Sep 2020 13:31:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF597C32EB6;
	Fri, 18 Sep 2020 11:31:07 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCF49C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 08:32:35 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 43E1D56B5A0EC57846F3;
 Fri, 18 Sep 2020 16:32:28 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 16:32:17 +0800
From: Wang ShaoBo <bobo.shaobowang@huawei.com>
To: 
Date: Fri, 18 Sep 2020 16:31:42 +0800
Message-ID: <20200918083142.32816-1-bobo.shaobowang@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Sep 2020 11:31:07 +0000
Cc: cj.chengjian@huawei.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, huawei.libin@huawei.com,
 Jonathan.Cameron@huawei.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH -next] iio: adc: stm32-dfsdm: Use
	devm_platform_get_and_ioremap_resource()
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

Make use of devm_platform_get_and_ioremap_resource() provided by
driver core platform instead of duplicated analogue, dev_err() is
removed because it has been done in devm_ioremap_resource().

Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
---
 drivers/iio/adc/stm32-dfsdm-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
index 0b8bea88b011..42a7377704a4 100644
--- a/drivers/iio/adc/stm32-dfsdm-core.c
+++ b/drivers/iio/adc/stm32-dfsdm-core.c
@@ -226,16 +226,13 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
 	if (!node)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "Failed to get memory resource\n");
-		return -ENODEV;
-	}
-	priv->dfsdm.phys_base = res->start;
-	priv->dfsdm.base = devm_ioremap_resource(&pdev->dev, res);
+	priv->dfsdm.base = devm_platform_get_and_ioremap_resource(pdev, 0,
+							&res);
 	if (IS_ERR(priv->dfsdm.base))
 		return PTR_ERR(priv->dfsdm.base);
 
+	priv->dfsdm.phys_base = res->start;
+
 	/*
 	 * "dfsdm" clock is mandatory for DFSDM peripheral clocking.
 	 * "dfsdm" or "audio" clocks can be used as source clock for
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
