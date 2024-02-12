Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CE85226D
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:27:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E7AC6DD69;
	Mon, 12 Feb 2024 23:27:58 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E51F4C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3c031c2501bso399213b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780476; x=1708385276;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLX74Fa9d90V9VkLwpCR7m/vmZr63zncboWNam9EPB0=;
 b=f2ovlzWQb8v3iRfLg4G2CeUsRnZlnVhVTy8Av8JubjDwZvZ9t2wNPkTKA2Wu+MRbEl
 GZT1lU6Z6pSvThuxaiKR0Z2Do479oZ9GGCmSxR+7JueuYuMVicXXSK2dke4sJMyKOOSf
 AfUPXysImQGg1z/tgI/aLW6ELpFAHM3NIWQgILdFv7d9o74nrn+HOJdzRhmidLv55Ax7
 OJwuKELUOq2/GdARxMCPxbf9J9oaq9yrlZq2HQBgnLQcC9K8MiyRkJjbh8qgYErzw8Cx
 +W/Edvarg220w1uW65akKhUOlTzriGnU8kaahuhby7HnzRCpZygnyTuwX+M9Pa47qzmQ
 HBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780476; x=1708385276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLX74Fa9d90V9VkLwpCR7m/vmZr63zncboWNam9EPB0=;
 b=DP8055gLzKO266xjPNUGGpRTc0lJa4LdVPl0ORWJkeZIcw1EhpjCu1WVbpCnsE19Hp
 UwhxCdaDrEfp2XGrNBeUQ+UHj8e0mJI7ADjLN+l/6+v4XgOc6lg8IpffrX0PbsoWiZ4Y
 lqNmbT31KEx2iynIsfdDRMNsCNUrNgHuIGiwsmAUEcks7pt2iIllFV4yhapIpolzQJGi
 sDToYUfeS3FQzyBwq4w0MQnNkT7Nr7qII8fTuoTXpAq1m17+7Lg9KGE+Bg/QrjTEwkR1
 SPmr7wfE/kw//XS6HW7Lsj5VPVwPHna5ZH5bG5015RRBYorQ+hqNRowMtBX5jnMRVOxh
 kDnQ==
X-Gm-Message-State: AOJu0YytnQJXmk2Z8DvXcfm52idOylOTMyIg+XdVjL2oJiwnSFd4dy5a
 zP6/hq3VMbxhw5wW0wamT8pXjcWYjBnS5xzkr4bSEEN5YYwTeC/d07/zC23omaY=
X-Google-Smtp-Source: AGHT+IENcG0sbm+FxGSeKQ32xuud3iecYncceHk8taz1sm4Yg2pNVJ8oAzK4Wiliu88pFCNfDotmDQ==
X-Received: by 2002:a05:6808:4396:b0:3c0:370c:69ea with SMTP id
 dz22-20020a056808439600b003c0370c69eamr307850oib.21.1707780475807; 
 Mon, 12 Feb 2024 15:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWi+s6AcBtZ0faJKmtDS0VKFmvby7nAC38w75GOULRX0y9EwEx7+1J4H9ouW6lZvgCfSXJzdPrc7yhgO3q+HjZI/gPHESEeDPCRuQ/REyCrDkMkJv6LRwKg8Uo1Z/VP7UB+maV2po+cRkt1zHUDomud4hHTEjSVKo1VkbhcHLieCmVmF2Kqam/A9G7dQDDYuHW3eZu0brg+uTKK5AOlNYmeZqIkCCWu/Ru3v84yl6XJsbYnZIzbE/3z1ezjezL0f3AVzKT0610T2R7bCmORiIn8vdONSIM4qGQPMyXP2+xGeKXDtJmU3qIhddqUByKFCCmhPITsVmEHZTV0ZSu8DVluKLVxz1yE5CfaNKZvbiXWUs23Kk2xX6o8l7x0L0Qd833OSHTRbjkeyEpqTy4qxYTtzlOeYpDvj2A4mdKBAdNI1R54Zt5oK87Z4zOTALUFtihDq2C6VC2RX68xgia+zTecW9/zY1uVG4ALoFCXhgqXknkJMDkVxR86w/jjgiv2Vy35XT8Hk8V4JXrFtvGU82GTiScVHa4=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:55 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:42 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-2-a2373cd72d36@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
References: <20240212-mainline-spi-precook-message-v1-0-a2373cd72d36@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-spi@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 2/5] spi: move splitting transfers to
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

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi.c | 110 +++++++++++++++++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5bac215d7009..8a21fa5bd4b9 100644
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
 
+/**
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
+	if ((msg->spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
+					       spi_is_csgpiod(msg->spi))) {
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
 /**
  * __spi_optimize_message - shared implementation for spi_optimize_message()
  *                          and spi_maybe_optimize_message()
@@ -4256,10 +4276,16 @@ static int __spi_optimize_message(struct spi_device *spi,
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
 
 	msg->pre_optimized = pre_optimized;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
