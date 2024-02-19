Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B1E85AE82
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 23:35:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AD69C6C83C;
	Mon, 19 Feb 2024 22:35:04 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D33C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 22:35:02 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6e2d83d2568so3376377a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 14:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708382101; x=1708986901;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nguAE7f5YcWI/h5umYjj7eHdUyvOtkK6QQpK6mXXbx4=;
 b=ovGSApSWUvKxOfiBy/SEZSKvP8AfF1AM4A1a/KdM7g42sxLSafvw88OfTwkh+hvG0/
 f1KkOcWSEhQBpw6wpEnwZXmlccWoe4FeAchuZ6Dglye/HRbsvMVq2Zj1BgmxvyPwWU/u
 t7dUJ0NxjpNvlXg68FswQ5KuhBzWy5+o1vcxhvMABEGrKQ5A9MeKST9y+7TP7CXAGX2w
 ORw/OzqfoQml64VVDoJJ96fkQA30HDqpEXbr6ig0uPsa6U9iAYvJKa5HaGJNEMcGGJCa
 Ha4jfQL8WcUZkpuiZo/9bHJuJ2vMOcAZkPraWq8GChJfV2tZNNzMmSoeondfKtXF7Di0
 qF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708382101; x=1708986901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nguAE7f5YcWI/h5umYjj7eHdUyvOtkK6QQpK6mXXbx4=;
 b=aieYUUfI3js6fyI0Vs774E7G9P4KXmXTrA0/h1ONz3VKUJw8Sn2DLte76D0Ve5WHWj
 8/dKEbM3KOM41dE9V84iilbVK2eGQRslWRRzRT6FGO82nIZmM3xB6IMTyVokZj0rHxyq
 Jy7mNjuted5nKeaR/zsmCU4L1AFHv37WKescqMHqwqwbqkLft2ZwI7FBhNswoDlKWCCr
 +ZLHXcZdcctORpJm6FYYnoKlikOFTcaL6NUZjCVqlvJ0nztg2xXKYCZB8bw9VM+Pcn/G
 JoGQlAzbE1nrZm66MEdZOa6aGoz3eraExMevsPj1pwDdPB3q15vlE31v9kBimlQeVkP3
 Yfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnExd9g1gpDU9GbQlhZZCtO9eri37KcTGaRoS3+Dqh+M3D0vSnKTkRskEs2m7575jDa8wPf51C3ocaJaMOyy92lqO57+JWXsw9FCbBeXlF9Ltb+l/f3KgX
X-Gm-Message-State: AOJu0YyC/5IgRGZsM35H1l6sDKudEhrH1f7OSK5IQ1PLoniDmKEJIyRh
 gFRFDKy/f4BGg7elMACDZ5qESh33EgrHy6G3senzyZjIw0Ip/zF2btlmlOVCU6Q=
X-Google-Smtp-Source: AGHT+IEKk7jzI/qkme4zk/gFRVTVBf/1nLdJFY+y7tiRySbZb046arGF15DJiOZ4ycZjN+0TNGVe+A==
X-Received: by 2002:a9d:7494:0:b0:6e2:e5a3:1732 with SMTP id
 t20-20020a9d7494000000b006e2e5a31732mr3221609otk.37.1708382101127; 
 Mon, 19 Feb 2024 14:35:01 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 h25-20020a9d6419000000b006e45a5f0a70sm171776otl.49.2024.02.19.14.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 14:35:00 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 19 Feb 2024 16:33:22 -0600
Message-ID: <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.12.4
Cc: linux-kernel@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>, linux-spi@vger.kernel.org,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 5/5] iio: adc: ad7380: use
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

This modifies the ad7380 ADC driver to use spi_optimize_message() to
optimize the SPI message for the buffered read operation. Since buffered
reads reuse the same SPI message for each read, this can improve
performance by reducing the overhead of setting up some parts the SPI
message in each spi_sync() call.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v2 changes:
- Removed dynamic allocation of spi xfer/msg
- Moved spi message optimization to probe function
- Dropped buffer pre/post callbacks

 drivers/iio/adc/ad7380.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index abd746aef868..6b3fd20c8f1f 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -133,6 +133,9 @@ struct ad7380_state {
 	struct spi_device *spi;
 	struct regulator *vref;
 	struct regmap *regmap;
+	/* xfer and msg for buffer reads */
+	struct spi_transfer xfer;
+	struct spi_message msg;
 	/*
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
@@ -236,14 +239,9 @@ static irqreturn_t ad7380_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct ad7380_state *st = iio_priv(indio_dev);
-	struct spi_transfer xfer = {
-		.bits_per_word = st->chip_info->channels[0].scan_type.realbits,
-		.len = 4,
-		.rx_buf = st->scan_data.raw,
-	};
 	int ret;
 
-	ret = spi_sync_transfer(st->spi, &xfer, 1);
+	ret = spi_sync(st->spi, &st->msg);
 	if (ret)
 		goto out;
 
@@ -335,6 +333,28 @@ static const struct iio_info ad7380_info = {
 	.debugfs_reg_access = &ad7380_debugfs_reg_access,
 };
 
+static void ad7380_unoptimize_spi_msg(void *msg)
+{
+	spi_unoptimize_message(msg);
+}
+
+static int devm_ad7380_setup_spi_msg(struct device *dev, struct ad7380_state *st)
+{
+	int ret;
+
+	st->xfer.bits_per_word = st->chip_info->channels[0].scan_type.realbits;
+	st->xfer.len = 4;
+	st->xfer.rx_buf = st->scan_data.raw;
+
+	spi_message_init_with_transfers(&st->msg, &st->xfer, 1);
+
+	ret = spi_optimize_message(st->spi, &st->msg);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to optimize message\n");
+
+	return devm_add_action_or_reset(dev, ad7380_unoptimize_spi_msg, &st->msg);
+}
+
 static int ad7380_init(struct ad7380_state *st)
 {
 	int ret;
@@ -411,6 +431,10 @@ static int ad7380_probe(struct spi_device *spi)
 		return dev_err_probe(&spi->dev, PTR_ERR(st->regmap),
 				     "failed to allocate register map\n");
 
+	ret = devm_ad7380_setup_spi_msg(&spi->dev, st);
+	if (ret)
+		return ret;
+
 	indio_dev->channels = st->chip_info->channels;
 	indio_dev->num_channels = st->chip_info->num_channels;
 	indio_dev->name = st->chip_info->name;

-- 
2.43.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
