Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE185AE7F
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 23:35:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D309C6C820;
	Mon, 19 Feb 2024 22:35:01 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E572C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 22:34:59 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6e2f0d6c82eso1492946a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708382098; x=1708986898;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXFb+RtnzRHPAv3WrnV5x/KjkLxl12244GFTo5rtzY0=;
 b=NRdW5BXBTt0m7QQ/gT4VKEBwHmn0QBaLQnlVCTkbGTSx/Hox8DN+D8lnDCks2+ODqc
 Z4aceiNShU71DeeJu+1zspUTWuY1HDv7BsNU/kHjIPEqw34lellxFiIm+17BhB4HU9yw
 jeEd1B8fTg8QrDoz85R/fCmd4lxA1ldq8s9JxCP2Gfj5TrYXNW2XYP9dFT1fJL77g34G
 KHBuF+QoXIfC3Va4sIjAOtF0ssfCp98hQaGDAsvSp/yFGRALxvd+dpp6cROogOjb1TjK
 HuH4Gl9ulanP1CN/K1T4ycMKf0AJ9B+sURyWKsC0TOZYEXRNn9X5l9rMr6uyR/AhHFsE
 F3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382098; x=1708986898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXFb+RtnzRHPAv3WrnV5x/KjkLxl12244GFTo5rtzY0=;
 b=S42DsW8Xk5e774AJKkBUysYQ89x847F0rJhNz/I/VnQqxERoLZnQAsZmXlf4Ghh/L7
 pI6AXeQMT+oso2e43Gb3nydLO1+cY+MSP5TZ/Nb/FYdPKc6RslJl0wsM85ryjttTCp7H
 EpdDN52XjVrQ6ts1879qAdX4zc4TupadEmPJ9prbanoloM4TVX9bu5jlRyGgLp7NqFoW
 qB10JBi4Xdnsem4t5NI5OZyj8elYFMjrckohpbDsMomWKmKsAbstIs75n83+iXFiU4wj
 tKsXQqHVhKxdE09q2UhPXarOpmm9EYto3Y12+HpK4fbwcbckbQLZoejdLAbGzsifiUqB
 ad1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+LmJ4fFVQ1rzsW9NGV+8SvwA5rXb5zxlLOLvbpiAlw0tCOCl9CA10S400vPsoIpe8m1d3wPBcqh7gp3/qCoxhrU17il5euubgB+k/hZRHg5YK4a/T9eYX
X-Gm-Message-State: AOJu0YwCxocGtSHKOGwkhUBErkYcf04fTPdAhUhP83C2ZLZte3mbg0Qu
 2hwtBYPvInyiq4EUD6Nt4+OwIGcUmvI20ZeYCTPkbGK7Nl6AsS4RXBCO+lEFyhs=
X-Google-Smtp-Source: AGHT+IEFkkxLySZnOBcfOYTfpNBs3VIAZU4Mxx2UeYvP3zZ6LpsOgC1Myzlo2DfzDOHPf+MMrMbTmA==
X-Received: by 2002:a05:6830:1355:b0:6e2:dd64:c53e with SMTP id
 r21-20020a056830135500b006e2dd64c53emr12780325otq.2.1708382098245; 
 Mon, 19 Feb 2024 14:34:58 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6419000000b006e45a5f0a70sm171776otl.49.2024.02.19.14.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 14:34:57 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Feb 2024 16:33:19 -0600
Message-ID: <20240219-mainline-spi-precook-message-v2-2-4a762c6701b9@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-spi@vger.kernel.org,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 2/5] spi: move splitting transfers to
	spi_optimize_message()
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

Splitting transfers is an expensive operation so we can potentially
optimize it by doing it only once per optimization of the message
instead of repeating each time the message is transferred.

The transfer splitting functions are currently the only user of
spi_res_alloc() so spi_res_release() can be safely moved at this time
from spi_finalize_current_message() to spi_unoptimize_message().

The doc comments of the public functions for splitting transfers are
also updated so that callers will know when it is safe to call them
to ensure proper resource management.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
- Changed line break for multiline if condition
- Removed kernel doc inclusion (/** -> /*) from static members
- Picked up Jonathan's Reviewed-by

 drivers/spi/spi.c | 110 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index f68d92b57543..ba4d3fde2054 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1747,38 +1747,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 
 	trace_spi_message_start(msg);
 
-	/*
-	 * If an SPI controller does not support toggling the CS line on each
-	 * transfer (indicated by the SPI_CS_WORD flag) or we are using a GPIO
-	 * for the CS line, we can emulate the CS-per-word hardware function by
-	 * splitting transfers into one-word transfers and ensuring that
-	 * cs_change is set for each transfer.
-	 */
-	if ((msg->spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
-					       spi_is_csgpiod(msg->spi))) {
-		ret = spi_split_transfers_maxwords(ctlr, msg, 1);
-		if (ret) {
-			msg->status = ret;
-			spi_finalize_current_message(ctlr);
-			return ret;
-		}
-
-		list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-			/* Don't change cs_change on the last entry in the list */
-			if (list_is_last(&xfer->transfer_list, &msg->transfers))
-				break;
-			xfer->cs_change = 1;
-		}
-	} else {
-		ret = spi_split_transfers_maxsize(ctlr, msg,
-						  spi_max_transfer_size(msg->spi));
-		if (ret) {
-			msg->status = ret;
-			spi_finalize_current_message(ctlr);
-			return ret;
-		}
-	}
-
 	if (ctlr->prepare_message) {
 		ret = ctlr->prepare_message(ctlr, msg);
 		if (ret) {
@@ -2124,6 +2092,8 @@ static void __spi_unoptimize_message(struct spi_message *msg)
 	if (ctlr->unoptimize_message)
 		ctlr->unoptimize_message(msg);
 
+	spi_res_release(ctlr, msg);
+
 	msg->optimized = false;
 	msg->opt_state = NULL;
 }
@@ -2169,15 +2139,6 @@ void spi_finalize_current_message(struct spi_controller *ctlr)
 
 	spi_unmap_msg(ctlr, mesg);
 
-	/*
-	 * In the prepare_messages callback the SPI bus has the opportunity
-	 * to split a transfer to smaller chunks.
-	 *
-	 * Release the split transfers here since spi_map_msg() is done on
-	 * the split transfers.
-	 */
-	spi_res_release(ctlr, mesg);
-
 	if (mesg->prepared && ctlr->unprepare_message) {
 		ret = ctlr->unprepare_message(ctlr, mesg);
 		if (ret) {
@@ -3819,6 +3780,10 @@ static int __spi_split_transfer_maxsize(struct spi_controller *ctlr,
  * @msg:   the @spi_message to transform
  * @maxsize:  the maximum when to apply this
  *
+ * This function allocates resources that are automatically freed during the
+ * spi message unoptimize phase so this function should only be called from
+ * optimize_message callbacks.
+ *
  * Return: status of transformation
  */
 int spi_split_transfers_maxsize(struct spi_controller *ctlr,
@@ -3857,6 +3822,10 @@ EXPORT_SYMBOL_GPL(spi_split_transfers_maxsize);
  * @msg:      the @spi_message to transform
  * @maxwords: the number of words to limit each transfer to
  *
+ * This function allocates resources that are automatically freed during the
+ * spi message unoptimize phase so this function should only be called from
+ * optimize_message callbacks.
+ *
  * Return: status of transformation
  */
 int spi_split_transfers_maxwords(struct spi_controller *ctlr,
@@ -4231,6 +4200,57 @@ static int __spi_validate(struct spi_device *spi, struct spi_message *message)
 	return 0;
 }
 
+/*
+ * spi_split_transfers - generic handling of transfer splitting
+ * @msg: the message to split
+ *
+ * Under certain conditions, a SPI controller may not support arbitrary
+ * transfer sizes or other features required by a peripheral. This function
+ * will split the transfers in the message into smaller transfers that are
+ * supported by the controller.
+ *
+ * Controllers with special requirements not covered here can also split
+ * transfers in the optimize_message() callback.
+ *
+ * Context: can sleep
+ * Return: zero on success, else a negative error code
+ */
+static int spi_split_transfers(struct spi_message *msg)
+{
+	struct spi_controller *ctlr = msg->spi->controller;
+	struct spi_transfer *xfer;
+	int ret;
+
+	/*
+	 * If an SPI controller does not support toggling the CS line on each
+	 * transfer (indicated by the SPI_CS_WORD flag) or we are using a GPIO
+	 * for the CS line, we can emulate the CS-per-word hardware function by
+	 * splitting transfers into one-word transfers and ensuring that
+	 * cs_change is set for each transfer.
+	 */
+	if ((msg->spi->mode & SPI_CS_WORD) &&
+	    (!(ctlr->mode_bits & SPI_CS_WORD) || spi_is_csgpiod(msg->spi))) {
+		ret = spi_split_transfers_maxwords(ctlr, msg, 1);
+		if (ret)
+			return ret;
+
+		list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+			/* Don't change cs_change on the last entry in the list */
+			if (list_is_last(&xfer->transfer_list, &msg->transfers))
+				break;
+
+			xfer->cs_change = 1;
+		}
+	} else {
+		ret = spi_split_transfers_maxsize(ctlr, msg,
+						  spi_max_transfer_size(msg->spi));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /*
  * __spi_optimize_message - shared implementation for spi_optimize_message()
  *                          and spi_maybe_optimize_message()
@@ -4254,10 +4274,16 @@ static int __spi_optimize_message(struct spi_device *spi,
 	if (ret)
 		return ret;
 
+	ret = spi_split_transfers(msg);
+	if (ret)
+		return ret;
+
 	if (ctlr->optimize_message) {
 		ret = ctlr->optimize_message(msg);
-		if (ret)
+		if (ret) {
+			spi_res_release(ctlr, msg);
 			return ret;
+		}
 	}
 
 	msg->optimized = true;

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
