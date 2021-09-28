Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B341A4C8
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Sep 2021 03:39:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D78EC5AB63;
	Tue, 28 Sep 2021 01:39:18 +0000 (UTC)
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 434D9C5AB63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 01:39:17 +0000 (UTC)
Received: from BC-Mail-Ex11.internal.baidu.com (unknown [172.31.51.51])
 by Forcepoint Email with ESMTPS id 6AC286F5AA31CB919241;
 Tue, 28 Sep 2021 09:39:15 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex11.internal.baidu.com (172.31.51.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 28 Sep 2021 09:39:14 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 28 Sep 2021 09:39:14 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Date: Tue, 28 Sep 2021 09:38:55 +0800
Message-ID: <20210928013902.1341-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928013902.1341-1-caihuoqing@baidu.com>
References: <20210928013902.1341-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex24.internal.baidu.com (172.31.51.18) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 2/8] iio: dac: lpc18xx_dac: Make use of the
	helper function dev_err_probe()
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Remove the separate line of PTR_ERR().

 drivers/iio/dac/lpc18xx_dac.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/dac/lpc18xx_dac.c b/drivers/iio/dac/lpc18xx_dac.c
index 9e38607a189e..afb37647b035 100644
--- a/drivers/iio/dac/lpc18xx_dac.c
+++ b/drivers/iio/dac/lpc18xx_dac.c
@@ -121,16 +121,14 @@ static int lpc18xx_dac_probe(struct platform_device *pdev)
 		return PTR_ERR(dac->base);
 
 	dac->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dac->clk)) {
-		dev_err(&pdev->dev, "error getting clock\n");
-		return PTR_ERR(dac->clk);
-	}
+	if (IS_ERR(dac->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->clk),
+				     "error getting clock\n");
 
 	dac->vref = devm_regulator_get(&pdev->dev, "vref");
-	if (IS_ERR(dac->vref)) {
-		dev_err(&pdev->dev, "error getting regulator\n");
-		return PTR_ERR(dac->vref);
-	}
+	if (IS_ERR(dac->vref))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->vref),
+				     "error getting regulator\n");
 
 	indio_dev->name = dev_name(&pdev->dev);
 	indio_dev->info = &lpc18xx_dac_info;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
