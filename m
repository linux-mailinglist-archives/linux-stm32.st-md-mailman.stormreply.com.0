Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B634190BF
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Sep 2021 10:26:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AB71C5AB64;
	Mon, 27 Sep 2021 08:26:33 +0000 (UTC)
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABEEEC5AB62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Sep 2021 08:26:29 +0000 (UTC)
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
 by Forcepoint Email with ESMTPS id 42B7D2C1A4CE0750EF77;
 Mon, 27 Sep 2021 16:26:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 27 Sep 2021 16:26:27 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 27 Sep 2021 16:26:27 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
Date: Mon, 27 Sep 2021 16:26:03 +0800
Message-ID: <20210927082608.859-4-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927082608.859-1-caihuoqing@baidu.com>
References: <20210927082608.859-1-caihuoqing@baidu.com>
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
Subject: [Linux-stm32] [PATCH 4/8] iio: dac: ds4424: Make use of the helper
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
 drivers/iio/dac/ds4424.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index 79527fbc250a..5a5e967b0be4 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -232,12 +232,9 @@ static int ds4424_probe(struct i2c_client *client,
 	indio_dev->name = id->name;
 
 	data->vcc_reg = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(data->vcc_reg)) {
-		dev_err(&client->dev,
-			"Failed to get vcc-supply regulator. err: %ld\n",
-				PTR_ERR(data->vcc_reg));
-		return PTR_ERR(data->vcc_reg);
-	}
+	if (IS_ERR(data->vcc_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(data->vcc_reg),
+				     "Failed to get vcc-supply regulator.\n");
 
 	mutex_init(&data->lock);
 	ret = regulator_enable(data->vcc_reg);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
