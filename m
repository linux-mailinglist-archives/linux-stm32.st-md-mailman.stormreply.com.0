Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC2253233
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 16:53:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2CBEC32E90;
	Wed, 26 Aug 2020 14:53:25 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8DCAC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 14:53:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DB7921741;
 Wed, 26 Aug 2020 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453602;
 bh=L62NHGTlHRmxfW0UXMzF8rz6Eg4TzDjh28d5OkWRb1E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vP/Bl97+JtTx4OaxuqQf637JfAncWM+cvwXtDyt0M8X8AQGOnemx5q4V2euAPCZtf
 WMttIrtvRRJoKWifKDkfX1+8Lk9eoqJepIe0UPQtCofwtHrOo0FSV5Ulu90tABrKky
 CgwWyQQVxz02bZRXieUrcDYksXCsOiCqHlrCVigs=
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
Date: Wed, 26 Aug 2020 16:51:51 +0200
Message-Id: <20200826145153.10444-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 14/16] iio: light: isl29018: Simplify with
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
 drivers/iio/light/isl29018.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
index ac8ad0f32689..2689867467a8 100644
--- a/drivers/iio/light/isl29018.c
+++ b/drivers/iio/light/isl29018.c
@@ -746,12 +746,9 @@ static int isl29018_probe(struct i2c_client *client,
 	chip->suspended = false;
 
 	chip->vcc_reg = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(chip->vcc_reg)) {
-		err = PTR_ERR(chip->vcc_reg);
-		if (err != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get VCC regulator!\n");
-		return err;
-	}
+	if (IS_ERR(chip->vcc_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->vcc_reg),
+				     "failed to get VCC regulator!\n");
 
 	err = regulator_enable(chip->vcc_reg);
 	if (err) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
