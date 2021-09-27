Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3424190B8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Sep 2021 10:26:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37530C5AB63;
	Mon, 27 Sep 2021 08:26:25 +0000 (UTC)
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A477C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Sep 2021 08:26:22 +0000 (UTC)
Received: from BC-Mail-Ex16.internal.baidu.com (unknown [172.31.51.56])
 by Forcepoint Email with ESMTPS id 513225E8B226CE5ED1B8;
 Mon, 27 Sep 2021 16:26:19 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex16.internal.baidu.com (172.31.51.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 27 Sep 2021 16:26:18 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 27 Sep 2021 16:26:18 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Date: Mon, 27 Sep 2021 16:26:00 +0800
Message-ID: <20210927082608.859-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 1/8] iio: dac: ad8801: Make use of the helper
	function dev_err_probe()
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
 drivers/iio/dac/ad8801.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/dac/ad8801.c b/drivers/iio/dac/ad8801.c
index 6354b7c8f052..8acb9fee273c 100644
--- a/drivers/iio/dac/ad8801.c
+++ b/drivers/iio/dac/ad8801.c
@@ -123,10 +123,9 @@ static int ad8801_probe(struct spi_device *spi)
 	id = spi_get_device_id(spi);
 
 	state->vrefh_reg = devm_regulator_get(&spi->dev, "vrefh");
-	if (IS_ERR(state->vrefh_reg)) {
-		dev_err(&spi->dev, "Vrefh regulator not specified\n");
-		return PTR_ERR(state->vrefh_reg);
-	}
+	if (IS_ERR(state->vrefh_reg))
+		return dev_err_probe(&spi->dev, PTR_ERR(state->vrefh_reg),
+				     "Vrefh regulator not specified\n");
 
 	ret = regulator_enable(state->vrefh_reg);
 	if (ret) {
@@ -146,15 +145,15 @@ static int ad8801_probe(struct spi_device *spi)
 	if (id->driver_data == ID_AD8803) {
 		state->vrefl_reg = devm_regulator_get(&spi->dev, "vrefl");
 		if (IS_ERR(state->vrefl_reg)) {
-			dev_err(&spi->dev, "Vrefl regulator not specified\n");
-			ret = PTR_ERR(state->vrefl_reg);
+			ret = dev_err_probe(&spi->dev, PTR_ERR(state->vrefl_reg),
+					    "Vrefl regulator not specified\n");
 			goto error_disable_vrefh_reg;
 		}
 
 		ret = regulator_enable(state->vrefl_reg);
 		if (ret) {
-			dev_err(&spi->dev, "Failed to enable vrefl regulator: %d\n",
-					ret);
+			dev_err(&spi->dev,
+				"Failed to enable vrefl regulator: %d\n", ret);
 			goto error_disable_vrefh_reg;
 		}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
