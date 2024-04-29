Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56C8B56B5
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 13:33:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06CFC71285;
	Mon, 29 Apr 2024 11:33:21 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F250C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=pTKgsnnnR48vpHuUZSyQHs6dIzn04ZSLBe3TZUJ9DSQ=; b=F+YIfN
 Bef5N4igD5o5TLEi7in+MbPhNF4xKt/4L64LuUaivoLegMLsYx21WYKMJpVQXS8N
 xztANF5xlZYEGF6INXjo6SVzlo3gMugtaLATPejPkpSmVSoiv4EkXSkLlIm+7fLF
 1LdKYizTB17AxiZCPlg/HoQeHNFjHum05AyhfdRyoVgZ8qet5sSEAjRj/6lnstwD
 xXAUXhdY1mFrBhm1ver1Vge5hEi+k/7p75uzpVlFNAccMS+G5/Z8qZ72p6NYhXvZ
 5YGUpS5aJgGkF1Df5NWC0slsoWWrNPZPRPKR5YfhOHMU0GAy0JPkLOHEmB9cBkg9
 P8+GchupFvv2TaCg==
Received: (qmail 2281145 invoked from network); 29 Apr 2024 13:33:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Apr 2024 13:33:19 +0200
X-UD-Smtp-Session: l3s3148p1@Z+u2njoXhihtKPB4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-iio@vger.kernel.org
Date: Mon, 29 Apr 2024 13:33:08 +0200
Message-ID: <20240429113313.68359-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
References: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 5/8] iio: adc: stm32-adc: use 'time_left'
	variable with wait_for_completion_interruptible_timeout()
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_interruptible_timeout() causing patterns like:

	timeout = wait_for_completion_interruptible_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/iio/adc/stm32-adc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index b5d3c9cea5c4..7cad0ce1d9b9 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1408,7 +1408,7 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 	struct stm32_adc *adc = iio_priv(indio_dev);
 	struct device *dev = indio_dev->dev.parent;
 	const struct stm32_adc_regspec *regs = adc->cfg->regs;
-	long timeout;
+	long time_left;
 	u32 val;
 	int ret;
 
@@ -1440,12 +1440,12 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 
 	adc->cfg->start_conv(indio_dev, false);
 
-	timeout = wait_for_completion_interruptible_timeout(
+	time_left = wait_for_completion_interruptible_timeout(
 					&adc->completion, STM32_ADC_TIMEOUT);
-	if (timeout == 0) {
+	if (time_left == 0) {
 		ret = -ETIMEDOUT;
-	} else if (timeout < 0) {
-		ret = timeout;
+	} else if (time_left < 0) {
+		ret = time_left;
 	} else {
 		*res = adc->buffer[0];
 		ret = IIO_VAL_INT;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
