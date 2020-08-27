Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9E254E80
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:29:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDE3AC32EA6;
	Thu, 27 Aug 2020 19:29:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6296C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:29:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A112822BF3;
 Thu, 27 Aug 2020 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556562;
 bh=L3YrhCMnqGFLBGZtgx3mmLK0mDFYfcCW33WYEntFHMQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b18cj+z0Suxulc95uK9i05n32lcc+VIW61lcP5GTiE/XgzMhud+9qThtNtVcCD7QV
 iQmafXDgfBvEG+AwEg7tk5KVdZ4gRvlqXA3+WWVuHZFipsvsf5bdy0UJx4oEEdzDxn
 U63gRzoBajElqm7oqvtVNwH8rEe3uW/exDkLjxjg=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 27 Aug 2020 21:26:41 +0200
Message-Id: <20200827192642.1725-17-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 17/18] iio: magnetometer: mag3110: Simplify
	with dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iio/magnetometer/mag3110.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/magnetometer/mag3110.c b/drivers/iio/magnetometer/mag3110.c
index 4d305a21c379..838b13c8bb3d 100644
--- a/drivers/iio/magnetometer/mag3110.c
+++ b/drivers/iio/magnetometer/mag3110.c
@@ -476,22 +476,14 @@ static int mag3110_probe(struct i2c_client *client,
 	data = iio_priv(indio_dev);
 
 	data->vdd_reg = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(data->vdd_reg)) {
-		if (PTR_ERR(data->vdd_reg) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		dev_err(&client->dev, "failed to get VDD regulator!\n");
-		return PTR_ERR(data->vdd_reg);
-	}
+	if (IS_ERR(data->vdd_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(data->vdd_reg),
+				     "failed to get VDD regulator!\n");
 
 	data->vddio_reg = devm_regulator_get(&client->dev, "vddio");
-	if (IS_ERR(data->vddio_reg)) {
-		if (PTR_ERR(data->vddio_reg) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		dev_err(&client->dev, "failed to get VDDIO regulator!\n");
-		return PTR_ERR(data->vddio_reg);
-	}
+	if (IS_ERR(data->vddio_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(data->vddio_reg),
+				     "failed to get VDDIO regulator!\n");
 
 	ret = regulator_enable(data->vdd_reg);
 	if (ret) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
