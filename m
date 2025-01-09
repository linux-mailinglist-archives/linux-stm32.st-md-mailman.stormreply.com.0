Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFFFA07FC3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 19:25:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82958C71292;
	Thu,  9 Jan 2025 18:25:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 692DDC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 18:25:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32C7B5C5CCC;
 Thu,  9 Jan 2025 18:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C514C4CED2;
 Thu,  9 Jan 2025 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736447137;
 bh=jJYLqX1Wvzo50KTj3seMVu0AOOohiMA4zPktn26hf9k=;
 h=From:To:Cc:Subject:Date:From;
 b=a8kj6GN5ah6Hv3gjYu1tvtcReuujhZfGlMSBObitDYHC8gfHsvGi/yQkBJ9MXohgE
 p/+5qpU5zP/dIfd3cyq9CUr5gFlAJIxdglh7t2VJrJh6RaKT+HXyE9oxr52xnU3TCc
 QWqQNPznHsPTFHiQiB9isVnxuRVQcjNCXFjA2Oyh2XumqP1B5VK1A7HKLIsLUznGvZ
 YONUf5mG2zwf2i6oDh6RFE9DjfiKR/iuCkqB3yfiH1m/BYuFr9b9PRIYHvCnBYDRXl
 yBn+29hzva82f9CFRA/CtSk/RSeGyeL9bfGO9Sh5nl5hoZwXLiXccaW+FTXnXjrsi4
 Yo1jPThexw+yA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu,  9 Jan 2025 12:23:25 -0600
Message-ID: <20250109182325.3973684-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32: Drop unnecessary DT property
	presence check
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

There's no reason to check for regulator supply property presence before
calling devm_regulator_get_optional() as that will return -ENODEV if
the supply is not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
The diff context doesn't show it, but the next line returns on error 
other than -ENODEV.

 drivers/iio/adc/stm32-adc-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 2201ee9987ae..0914148d1a22 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -615,8 +615,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 	}
 
 	/* Booster can be used to supply analog switches (optional) */
-	if (priv->cfg->has_syscfg & HAS_VBOOSTER &&
-	    of_property_read_bool(np, "booster-supply")) {
+	if (priv->cfg->has_syscfg & HAS_VBOOSTER) {
 		priv->booster = devm_regulator_get_optional(dev, "booster");
 		if (IS_ERR(priv->booster)) {
 			ret = PTR_ERR(priv->booster);
@@ -628,8 +627,7 @@ static int stm32_adc_core_switches_probe(struct device *dev,
 	}
 
 	/* Vdd can be used to supply analog switches (optional) */
-	if (priv->cfg->has_syscfg & HAS_ANASWVDD &&
-	    of_property_read_bool(np, "vdd-supply")) {
+	if (priv->cfg->has_syscfg & HAS_ANASWVDD) {
 		priv->vdd = devm_regulator_get_optional(dev, "vdd");
 		if (IS_ERR(priv->vdd)) {
 			ret = PTR_ERR(priv->vdd);
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
