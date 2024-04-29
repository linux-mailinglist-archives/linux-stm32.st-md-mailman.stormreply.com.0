Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6B8B56B6
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 13:33:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8BC5C7128C;
	Mon, 29 Apr 2024 11:33:22 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42E67C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=bO1DtnMljUne5cLDZB1KSz1EuNPq+xZvMkPybT2DdrE=; b=ZYN+Xv
 wWeFNBOF4Y8yRRdjLfpuYYiOie4X6UwOAzSuoFW71Fm6/CrsOObdfXp3ZzJ6SeNL
 PFO348ThErNZ/rU+bjEP2bEMd78KMiWNLiwJE4S5jFIe+M0tGYpQr43qG2B83WIo
 98aPenf+xGgbq413oFMgJ/3dQsU9DDWdKDaTcq4L6xRR4z6kjV7NBJa8R0dnNgyo
 CeKLaJXT3Hae7NfDW+lO1wHhYrEaDQmPXTlj9jo7e97NqNUXlpYHXe7eYSNpIfFl
 IBjFj4e4NBgZuraYXNpnOUvZiHJFookG0aIjHvU0hdHF/yNBIhxQ0q29KhzT7rCy
 9skzpGb4Q0ZH7hHw==
Received: (qmail 2281181 invoked from network); 29 Apr 2024 13:33:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 29 Apr 2024 13:33:20 +0200
X-UD-Smtp-Session: l3s3148p1@JvPGnjoXHnRtKPB4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-iio@vger.kernel.org
Date: Mon, 29 Apr 2024 13:33:09 +0200
Message-ID: <20240429113313.68359-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
References: <20240429113313.68359-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 6/8] iio: adc: stm32-dfsdm-adc: use
	'time_left' variable with
	wait_for_completion_interruptible_timeout()
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
 drivers/iio/adc/stm32-dfsdm-adc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index ca08ae3108b2..9a47d2c87f05 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1116,7 +1116,7 @@ static int stm32_dfsdm_single_conv(struct iio_dev *indio_dev,
 				   const struct iio_chan_spec *chan, int *res)
 {
 	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
-	long timeout;
+	long time_left;
 	int ret;
 
 	reinit_completion(&adc->completion);
@@ -1141,17 +1141,17 @@ static int stm32_dfsdm_single_conv(struct iio_dev *indio_dev,
 		goto stop_dfsdm;
 	}
 
-	timeout = wait_for_completion_interruptible_timeout(&adc->completion,
-							    DFSDM_TIMEOUT);
+	time_left = wait_for_completion_interruptible_timeout(&adc->completion,
+							      DFSDM_TIMEOUT);
 
 	/* Mask IRQ for regular conversion achievement*/
 	regmap_update_bits(adc->dfsdm->regmap, DFSDM_CR2(adc->fl_id),
 			   DFSDM_CR2_REOCIE_MASK, DFSDM_CR2_REOCIE(0));
 
-	if (timeout == 0)
+	if (time_left == 0)
 		ret = -ETIMEDOUT;
-	else if (timeout < 0)
-		ret = timeout;
+	else if (time_left < 0)
+		ret = time_left;
 	else
 		ret = IIO_VAL_INT;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
