Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D684C63C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6671C78009;
	Wed,  7 Feb 2024 08:26:39 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34B0EC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 20:07:12 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3bd72353d9fso4473334b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 12:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707250031; x=1707854831;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UeBXYxW5TvJCXcyEazsNfsDYcAc2yu/IZuUSf2VlU18=;
 b=sJ6a3c85bLFxzv0h6Cy/sKopCK0nESzDNPqBnyxJ69hE99TTkY/gD4GP8hZog3qEhB
 eQ78E4TLOomE0r1xX1bb24BpJdLiV+iBxvnhon6k7FkQubjDuJoqj//EwtUO/iYFO9kI
 NYSnDiDqFTXomIsqND9kHg9lMQwiEfIlBwTtxAsanNdP7e3q6ph2wS3i6u9lVKDd83BR
 4Ajt/iCsRJ6PIid3163obtTG/W9z7Eq3qYfa7xnCNN0wh1WYXO3/SvSSI5NzVBuXqqXK
 3J3+1sCbCe+wTIEAoZLqlewyon8nvr+lKU/XUmqAb1AGF1AeZc/wAPZ++HDjQI91F/xL
 eJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707250031; x=1707854831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UeBXYxW5TvJCXcyEazsNfsDYcAc2yu/IZuUSf2VlU18=;
 b=P/CEiQMPJBDHLqVktHBsHD0wxDHgOGDwzeJMDMmOgYnreamgGyW/PndPz1RT6E0am/
 TIxA3uzZv96Sc5GNky3Y8+9VlLI7pONf0X0N20wxZe8wf/L4rKCmNFfzI2uzsQkIk7ZV
 9ff7gnmNaxzQx4OMQpqZw8/7miZYz2CECSQusHQIH72d1jzAoDIKxtkytrG1bRyoK5Ii
 C+NbK26u6BuTLO0Sf5dn3d/06eXRXYlRVZH1rTnRuu7qQNvF+CZlMESBaj6l8/Bj7YS6
 G/m6b1t6fmye7IiIp4k7ToF0ZxYh1dSzKIZ39Nny0VggnIEPbbU6TEimQCsBFr8AOF0p
 Hj5w==
X-Gm-Message-State: AOJu0Yypzp1iqUbKtqUYe1shq3f5m/LI0gpU0XAS1xgNAKHUTGtGyP4D
 ijrmeOd0f5Kzv/RgLLZo4+5eQROSxh5SLdMgIzAaCkD/p7iFdF7AIkJuVGSYqzc=
X-Google-Smtp-Source: AGHT+IFuObE8RLCSG43YjDz974IG8KvcqthwJ6ZAtRS/7qVGeo9TWZtH9h3WHQTkX8/5LS2tCw/m3g==
X-Received: by 2002:a05:6808:120a:b0:3bf:d0ee:9873 with SMTP id
 a10-20020a056808120a00b003bfd0ee9873mr4046929oil.3.1707250030989; 
 Tue, 06 Feb 2024 12:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUgm87u0rmtYgY+Ov2zo4VlVzmeu0wG5JizNIBPlgh5Bf7BAFdYDvI+RFde/tAq5xWofsF7uOew748xJKgCzQyl+bTcdTLnB7e0eAE6hYKfADHxi57ahCz9mwH/AA26br44wDxgQc5mi8xtPgrNBzf6kFbXrxD+YGw/KvreBaU+fMAeJ+6jpNTBY+Fem+CJiXj+LBqUxrfG6D7nLzodMiwLeaTGbf/i5DGTth1jDk+hpnrdNAShFleA7sf7dbxRq2O/Av1qxzrBPubouWZ9KLojd7++ld+j7gyBE6azUh1Ga7e+83X0TVb6TBBc5IAWmznP0br1WFGiNphDaX27chNx4FCo
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 cg6-20020a056808328600b003beb12430basm421579oib.26.2024.02.06.12.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 12:07:10 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: linux-spi@vger.kernel.org
Date: Tue,  6 Feb 2024 14:06:46 -0600
Message-ID: <20240206200648.1782234-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: drop gpf arg from
	__spi_split_transfer_maxsize()
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

The __spi_split_transfer_maxsize() function has a gpf argument to allow
callers to specify the type of memory allocation that needs to be used.
However, this function only allocates struct spi_transfer and is not
intended to be used from atomic contexts so this type should always be
GFP_KERNEL, so we can just drop the argument.

Some callers of these functions also passed GFP_DMA, but since only
struct spi_transfer is allocated and not any tx/rx buffers, this is
not actually necessary and is removed in this commit.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi-stm32.c |  4 +---
 drivers/spi/spi.c       | 22 ++++++++--------------
 include/linux/spi/spi.h |  6 ++----
 3 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index e61302ef3c21..c32e57bb38bd 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1170,9 +1170,7 @@ static int stm32_spi_prepare_msg(struct spi_controller *ctrl,
 	if (spi->cfg->set_number_of_data) {
 		int ret;
 
-		ret = spi_split_transfers_maxwords(ctrl, msg,
-						   spi->t_size_max,
-						   GFP_KERNEL | GFP_DMA);
+		ret = spi_split_transfers_maxwords(ctrl, msg, spi->t_size_max);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a8b8474abc74..99ffc179f77d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1756,7 +1756,7 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 	 */
 	if ((msg->spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits & SPI_CS_WORD) ||
 					       spi_is_csgpiod(msg->spi))) {
-		ret = spi_split_transfers_maxwords(ctlr, msg, 1, GFP_KERNEL);
+		ret = spi_split_transfers_maxwords(ctlr, msg, 1);
 		if (ret) {
 			msg->status = ret;
 			spi_finalize_current_message(ctlr);
@@ -1771,8 +1771,7 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 		}
 	} else {
 		ret = spi_split_transfers_maxsize(ctlr, msg,
-						  spi_max_transfer_size(msg->spi),
-						  GFP_KERNEL | GFP_DMA);
+						  spi_max_transfer_size(msg->spi));
 		if (ret) {
 			msg->status = ret;
 			spi_finalize_current_message(ctlr);
@@ -3711,8 +3710,7 @@ static struct spi_replaced_transfers *spi_replace_transfers(
 static int __spi_split_transfer_maxsize(struct spi_controller *ctlr,
 					struct spi_message *msg,
 					struct spi_transfer **xferp,
-					size_t maxsize,
-					gfp_t gfp)
+					size_t maxsize)
 {
 	struct spi_transfer *xfer = *xferp, *xfers;
 	struct spi_replaced_transfers *srt;
@@ -3723,7 +3721,7 @@ static int __spi_split_transfer_maxsize(struct spi_controller *ctlr,
 	count = DIV_ROUND_UP(xfer->len, maxsize);
 
 	/* Create replacement */
-	srt = spi_replace_transfers(msg, xfer, 1, count, NULL, 0, gfp);
+	srt = spi_replace_transfers(msg, xfer, 1, count, NULL, 0, GFP_KERNEL);
 	if (IS_ERR(srt))
 		return PTR_ERR(srt);
 	xfers = srt->inserted_transfers;
@@ -3783,14 +3781,12 @@ static int __spi_split_transfer_maxsize(struct spi_controller *ctlr,
  * @ctlr:    the @spi_controller for this transfer
  * @msg:   the @spi_message to transform
  * @maxsize:  the maximum when to apply this
- * @gfp: GFP allocation flags
  *
  * Return: status of transformation
  */
 int spi_split_transfers_maxsize(struct spi_controller *ctlr,
 				struct spi_message *msg,
-				size_t maxsize,
-				gfp_t gfp)
+				size_t maxsize)
 {
 	struct spi_transfer *xfer;
 	int ret;
@@ -3805,7 +3801,7 @@ int spi_split_transfers_maxsize(struct spi_controller *ctlr,
 	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
 		if (xfer->len > maxsize) {
 			ret = __spi_split_transfer_maxsize(ctlr, msg, &xfer,
-							   maxsize, gfp);
+							   maxsize);
 			if (ret)
 				return ret;
 		}
@@ -3823,14 +3819,12 @@ EXPORT_SYMBOL_GPL(spi_split_transfers_maxsize);
  * @ctlr:     the @spi_controller for this transfer
  * @msg:      the @spi_message to transform
  * @maxwords: the number of words to limit each transfer to
- * @gfp:      GFP allocation flags
  *
  * Return: status of transformation
  */
 int spi_split_transfers_maxwords(struct spi_controller *ctlr,
 				 struct spi_message *msg,
-				 size_t maxwords,
-				 gfp_t gfp)
+				 size_t maxwords)
 {
 	struct spi_transfer *xfer;
 
@@ -3848,7 +3842,7 @@ int spi_split_transfers_maxwords(struct spi_controller *ctlr,
 		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));
 		if (xfer->len > maxsize) {
 			ret = __spi_split_transfer_maxsize(ctlr, msg, &xfer,
-							   maxsize, gfp);
+							   maxsize);
 			if (ret)
 				return ret;
 		}
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 9e3866809a0e..1ec2c07eb711 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1365,12 +1365,10 @@ struct spi_replaced_transfers {
 
 extern int spi_split_transfers_maxsize(struct spi_controller *ctlr,
 				       struct spi_message *msg,
-				       size_t maxsize,
-				       gfp_t gfp);
+				       size_t maxsize);
 extern int spi_split_transfers_maxwords(struct spi_controller *ctlr,
 					struct spi_message *msg,
-					size_t maxwords,
-					gfp_t gfp);
+					size_t maxwords);
 
 /*---------------------------------------------------------------------------*/
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
