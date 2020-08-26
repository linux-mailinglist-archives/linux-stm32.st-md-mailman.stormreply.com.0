Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA5253229
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 16:53:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC0E5C32EA7;
	Wed, 26 Aug 2020 14:53:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 919DDC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 14:52:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9E0F21741;
 Wed, 26 Aug 2020 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453578;
 bh=EO6+OrtQUwKwY8gZU4JakHT0nILSB70xFqDRJMkESZY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lp7M6zPOo/NbXV/KmnrIZP2j/7osA6KnrnBkn7shBUFVg2hnnQTzWduD5TiLx0Ht8
 fq7PppS6Qip528k2PlASRjtE6lMvHH0fsQdhFZGue0pxH7GKSotNtOcdL8qHiWjMfG
 CeSJAVZKWw9V3sMB8ZmCdfUUIu/6WJ+KVF8kZqgg=
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
 Jonathan Bakker <xc-racer2@live.ca>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Aug 2020 16:51:47 +0200
Message-Id: <20200826145153.10444-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 10/16] iio: amplifiers: hmc425a: Simplify with
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
 drivers/iio/amplifiers/hmc425a.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 582708924e4f..9efa692151f0 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -201,12 +201,9 @@ static int hmc425a_probe(struct platform_device *pdev)
 	st->gain = st->chip_info->default_gain;
 
 	st->gpios = devm_gpiod_get_array(&pdev->dev, "ctrl", GPIOD_OUT_LOW);
-	if (IS_ERR(st->gpios)) {
-		ret = PTR_ERR(st->gpios);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get gpios\n");
-		return ret;
-	}
+	if (IS_ERR(st->gpios))
+		return dev_err_probe(&pdev->dev, PTR_ERR(st->gpios),
+				     "failed to get gpios\n");
 
 	if (st->gpios->ndescs != st->chip_info->num_gpios) {
 		dev_err(&pdev->dev, "%d GPIOs needed to operate\n",
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
