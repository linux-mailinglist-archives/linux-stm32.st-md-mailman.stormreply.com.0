Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D06225652F
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Aug 2020 08:48:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 246D7C32EA6;
	Sat, 29 Aug 2020 06:48:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB6ACC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 06:48:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F36F21473;
 Sat, 29 Aug 2020 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683692;
 bh=33QUtFhKd3vgFdrs9V7vjN8bhfHfPOFBEs807yqJTy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/KnJ9CCBKHeRoBU9R9NcQBXtGQUvnGSSp/nMljOr+8LyxPl6dyVxWp2EtdN1LJrP
 jBY4dpR7F0VB6pwiBn5q5gTPnff4zZIx/5OHZcqdEJSIlAce1BOGkV3sPhacGPBEtv
 y+8GauNsfHY8duxUSJ274xajuI6MYgGzCLwMIL20=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sat, 29 Aug 2020 08:47:11 +0200
Message-Id: <20200829064726.26268-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH v3 03/18] iio: adc: envelope-detector:
	Simplify with dev_err_probe()
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes since v2:
1. Wrap dev_err_probe() lines at 80 character

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
---
 drivers/iio/adc/envelope-detector.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/envelope-detector.c b/drivers/iio/adc/envelope-detector.c
index 2a4fd3bb64cf..d73eac36153f 100644
--- a/drivers/iio/adc/envelope-detector.c
+++ b/drivers/iio/adc/envelope-detector.c
@@ -348,11 +348,9 @@ static int envelope_detector_probe(struct platform_device *pdev)
 	indio_dev->num_channels = 1;
 
 	env->dac = devm_iio_channel_get(dev, "dac");
-	if (IS_ERR(env->dac)) {
-		if (PTR_ERR(env->dac) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dac input channel\n");
-		return PTR_ERR(env->dac);
-	}
+	if (IS_ERR(env->dac))
+		return dev_err_probe(dev, PTR_ERR(env->dac),
+				     "failed to get dac input channel\n");
 
 	env->comp_irq = platform_get_irq_byname(pdev, "comp");
 	if (env->comp_irq < 0)
@@ -360,11 +358,9 @@ static int envelope_detector_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, env->comp_irq, envelope_detector_comp_isr,
 			       0, "envelope-detector", env);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request interrupt\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request interrupt\n");
+
 	env->comp_irq_trigger = irq_get_trigger_type(env->comp_irq);
 	if (env->comp_irq_trigger & IRQF_TRIGGER_RISING)
 		env->comp_irq_trigger_inv |= IRQF_TRIGGER_FALLING;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
