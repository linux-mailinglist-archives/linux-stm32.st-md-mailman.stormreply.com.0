Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66116254E6B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 21:28:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EC72C32EA6;
	Thu, 27 Aug 2020 19:28:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3EFBC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 19:28:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12F0122B4D;
 Thu, 27 Aug 2020 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556523;
 bh=T5xvC4E4MsMwGEUX1i7xJJFIfrS9fUuZLYOkjgS9wJs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=em6vO2OwZSB6kKK/S2ezhIGI2mfeS6rsgTIRju9Qabve7CfOTbj7wTG8NQXHDrhoB
 LJi16xE4xrJLYdEiSC9v+RYNMd4jSluKkFZBGuNEkYZ1BN/UB7qokxNWc0Fd4y6XZ+
 Tdy6RbrclSrZxz3+tGvj5p2iOfiCxYtAjmLOesFI=
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
Date: Thu, 27 Aug 2020 21:26:36 +0200
Message-Id: <20200827192642.1725-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v2 12/18] iio: dac: dpot-dac: Simplify with
	dev_err_probe()
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
 drivers/iio/dac/dpot-dac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/dac/dpot-dac.c b/drivers/iio/dac/dpot-dac.c
index be61c3b01e8b..2258535b8a42 100644
--- a/drivers/iio/dac/dpot-dac.c
+++ b/drivers/iio/dac/dpot-dac.c
@@ -183,18 +183,14 @@ static int dpot_dac_probe(struct platform_device *pdev)
 	indio_dev->num_channels = 1;
 
 	dac->vref = devm_regulator_get(dev, "vref");
-	if (IS_ERR(dac->vref)) {
-		if (PTR_ERR(dac->vref) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get vref regulator\n");
-		return PTR_ERR(dac->vref);
-	}
+	if (IS_ERR(dac->vref))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->vref),
+				     "failed to get vref regulator\n");
 
 	dac->dpot = devm_iio_channel_get(dev, "dpot");
-	if (IS_ERR(dac->dpot)) {
-		if (PTR_ERR(dac->dpot) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dpot input channel\n");
-		return PTR_ERR(dac->dpot);
-	}
+	if (IS_ERR(dac->dpot))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dac->dpot),
+				     "failed to get dpot input channel\n");
 
 	ret = iio_get_channel_type(dac->dpot, &type);
 	if (ret < 0)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
