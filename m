Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04626408C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 10:52:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 428D8C424BA;
	Thu, 10 Sep 2020 08:52:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA2CC424B8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:52:22 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F13E02078B;
 Thu, 10 Sep 2020 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599727940;
 bh=pKJBC1J8nO1JEn2di9prUMv7XinIJkYYcTXmoZZ2/b4=;
 h=From:To:Cc:Subject:Date:From;
 b=ADmQP41qeWq2CTNwYYPujfGLaqoHNF418+olBQVBGZIKE4kER5nR8Zk4YrhHM155I
 u+FhKUiqNCdL8l+5umFN5vVzQ7+/Kq64246MGKMj5xLeaBLH3RZdI/qe9EJTKgFPWa
 1MmA+vIZFHPHUVxvj5Kirz2dkF4AnMOrCn1t0CyE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2020 10:52:07 +0200
Message-Id: <1599727927-7776-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Subject: [Linux-stm32] [PATCH] iio: adc: stm32: Fix missing return in
	booster error path
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

Conversion of error paths to dev_err_probe() dropped one return
statement.  The driver will continue to probe if getting booster
regulator fails.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: ce30eeb613cb ("iio: adc: stm32: Simplify with dev_err_probe()")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Commit sha from linux-next.
---
 drivers/iio/adc/stm32-adc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 3f27b4817a42..6a0338d33bd8 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -595,7 +595,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 		if (IS_ERR(priv->booster)) {
 			ret = PTR_ERR(priv->booster);
 			if (ret != -ENODEV)
-				dev_err_probe(dev, ret, "can't get booster\n");
+				return dev_err_probe(dev, ret, "can't get booster\n");
 
 			priv->booster = NULL;
 		}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
