Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E171253210
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 16:52:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 121E5C32E90;
	Wed, 26 Aug 2020 14:52:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2D07C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CE2B21741;
 Wed, 26 Aug 2020 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453528;
 bh=lwcapEqh1mnH2bnwZTOp+jWQ1z3sGCNA5lWoA1rbyV4=;
 h=From:To:Subject:Date:From;
 b=W5poQ48UfnSWvBecbti9ouY3yxhCPYG7lJ2YWTWVuAvPzu89EU7+uxyv8YXTofPQB
 3gXzjtXyB8/4Ngg7w+SKJToYcj5ZxCKpk+/tsTswwQXNhHScaZm2HPq2MnZV/thjFq
 k/Zgr1eJS8cgJ8XzHei6NU7DBymAvV//O1xoQWec=
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
Date: Wed, 26 Aug 2020 16:51:38 +0200
Message-Id: <20200826145153.10444-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Subject: [Linux-stm32] [PATCH 01/16] iio: accel: bma180: Simplify with
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
 drivers/iio/accel/bma180.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 5b7a467c7b27..448faed001fd 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
 		return ret;
 
 	data->vdd_supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(data->vdd_supply)) {
-		if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vdd regulator %d\n",
-				(int)PTR_ERR(data->vdd_supply));
-		return PTR_ERR(data->vdd_supply);
-	}
+	if (IS_ERR(data->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
+				     "Failed to get vdd regulator\n");
+
 	data->vddio_supply = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(data->vddio_supply)) {
-		if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vddio regulator %d\n",
-				(int)PTR_ERR(data->vddio_supply));
-		return PTR_ERR(data->vddio_supply);
-	}
+	if (IS_ERR(data->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
+				     "Failed to get vddio regulator\n");
+
 	/* Typical voltage 2.4V these are min and max */
 	ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
 	if (ret)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
