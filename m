Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C83852270
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 00:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8783BC71285;
	Mon, 12 Feb 2024 23:28:01 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E582C6DD97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:27:59 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-21920f89441so2592888fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707780478; x=1708385278;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPDb6hVtEhiljZHBpIuJ6/eQfkiQhhMGNrzlPsHzoEA=;
 b=D27OxPknWQlzXhoL8k6bqUAqMnqcnm1Sk876l+zsHUisogHUol9xjC3fZNhIgxlW+1
 h0nM7kp0iq5rVH0Pl6UbYsaJ2cLjW58GtHfGdAdCiJ6pR1BXofTsdAGvMO7kTl4M4nQ9
 tK2ICBcxSR9h5DTDhcKJsk7/TVfgmWvRYsbku7HOoXmaWKE5fp0B7aSsIjYNGC3lSZ1I
 rvS+J6OvrgK+fQ6jkmsc/PMejo885avG2WyIDdcm4ekxhfqQjtff7vRRNfqS4xhH+c64
 QVDMvOizSZfNA1G1TUdMZzhjhCN0JDmCOu53fsgT9lqjWBe85eaCEsPKKuHCKvk5YDPS
 xdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707780478; x=1708385278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPDb6hVtEhiljZHBpIuJ6/eQfkiQhhMGNrzlPsHzoEA=;
 b=TjayaL482us7pMdbSi32aTg1Jxar2VSTgai5b529scKGgTDJLOPdQZy9K+6NFomcd2
 MVsF8Qzpom/DWyrU69IZwmzVKkUIYY7lFSU6G9ZYQCtujXOz5iQGACmUsbOqXIXZPjGr
 rF6A3WYlmzwX2qlAnhp0abvfLRNUd5r0nrEY+JWlSvcEXbUCS/cF73vEqQlHGIfvOGSA
 IkmHQnk5m7qwou1EHLZuHj4dudNCJDni2wmcWQly99+yie4pACkzteqNUd8sWQMZY9MJ
 ZkR1pJ/UXDWCdvcDQSvE1llAExWq0mhpWZltr4H1N08Q9oXowkR4+/Zug5Df4eMFNvtw
 rzVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1mCMSv08niTVjw656ck0lXh2D/V61N7vLNT6VLgZoLz2OPqWuQAHFM17E3oczFDhft6Q7q3IFIaxLtDLNZq2lhL5E5pX5ZuPqzVxg9ODQ2Zvleje6IpKa
X-Gm-Message-State: AOJu0YwtqixhLP55McOHwqzhT2cOCp9zQ2pUSTk/Wa3HWJMkDhETzLI4
 Ux8wm3Tv1Rbx8crIknIxk8jXJcrl+MGnPIn9rQxosDj84kQXgFdgi/9tNZRwY7A=
X-Google-Smtp-Source: AGHT+IH9erOJCDaYbmQDWF2K81JN0GKgiq54irJeN5yLR/tg4FUJhNIMhrIkifdGOu4oAL5TJZcC0Q==
X-Received: by 2002:a05:6871:5c48:b0:219:c8ea:ecfd with SMTP id
 os8-20020a0568715c4800b00219c8eaecfdmr10850888oac.15.1707780478627; 
 Mon, 12 Feb 2024 15:27:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/sChhyo7/S+ePAw+fUTZa4Fa+c+iizdHVFXCth9k0UVOZs5C2WlgRtbyufn7EOEddQq5CkoNbtZtOlCdXpnzPXFGf760G/g1P4jT3D2BZM851R0PtrDuAkl06AR06eLUGEITPtV1UK0F65cIlm7ccxGgZLoQPiwMwsyuL5+SNLnL+D8pJj8ktyPxbGY2KEjPfVcWo3aru0369a6RMQJWdab/0ibpad8aRXTQjKE2CY2ZgZKHfkTlJl+JJ28mwL2pNejLLTSSa4B9k3zuc4nDciUgdcuwoMeHfxozDYXDiKfMYPfC3BEJVdK3sFLpvz5Z2Y6K087Zk6+hLDN3ceLH0IZuGlif8dpiVSs2aw4qqhk80aOpu703oSYX2fa2Zy04rdtzhykVvL9yVQLic9YrrrC+2SmVp0ygbRulhgWff+wuEJGaDvt46o+YtUGYq2F+yoofZRk2mrtpYLyyJ/fhAMTQctHXdcSryftOnYMqxIPwVdTitM4q3WhWgmLLWBe+3CCel/7DU5WydgyihQ23lXKvMWqg=
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net.
 [98.183.112.25]) by smtp.gmail.com with ESMTPSA id
 pk17-20020a0568704c1100b0021a7a45e0b1sm330141oab.35.2024.02.12.15.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 15:27:58 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 12 Feb 2024 17:26:45 -0600
Message-ID: <20240212-mainline-spi-precook-message-v1-5-a2373cd72d36@baylibre.com>
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
Subject: [Linux-stm32] [PATCH 5/5] iio: adc: ad7380: use
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
 drivers/iio/adc/ad7380.c | 52 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index abd746aef868..5c5d2642a474 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -133,6 +133,7 @@ struct ad7380_state {
 	struct spi_device *spi;
 	struct regulator *vref;
 	struct regmap *regmap;
+	struct spi_message *msg;
 	/*
 	 * DMA (thus cache coherency maintenance) requires the
 	 * transfer buffers to live in their own cache lines.
@@ -231,19 +232,55 @@ static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
 	return ret;
 }
 
+static int ad7380_buffer_preenable(struct iio_dev *indio_dev)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+	struct spi_transfer *xfer;
+	int ret;
+
+	st->msg = spi_message_alloc(1, GFP_KERNEL);
+	if (!st->msg)
+		return -ENOMEM;
+
+	xfer = list_first_entry(&st->msg->transfers, struct spi_transfer,
+				transfer_list);
+
+	xfer->bits_per_word = st->chip_info->channels[0].scan_type.realbits;
+	xfer->len = 4;
+	xfer->rx_buf = st->scan_data.raw;
+
+	ret = spi_optimize_message(st->spi, st->msg);
+	if (ret) {
+		spi_message_free(st->msg);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ad7380_buffer_postdisable(struct iio_dev *indio_dev)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+
+	spi_unoptimize_message(st->msg);
+	spi_message_free(st->msg);
+
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops ad7380_buffer_setup_ops = {
+	.preenable = ad7380_buffer_preenable,
+	.postdisable = ad7380_buffer_postdisable,
+};
+
 static irqreturn_t ad7380_trigger_handler(int irq, void *p)
 {
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
+	ret = spi_sync(st->spi, st->msg);
 	if (ret)
 		goto out;
 
@@ -420,7 +457,8 @@ static int ad7380_probe(struct spi_device *spi)
 
 	ret = devm_iio_triggered_buffer_setup(&spi->dev, indio_dev,
 					      iio_pollfunc_store_time,
-					      ad7380_trigger_handler, NULL);
+					      ad7380_trigger_handler,
+					      &ad7380_buffer_setup_ops);
 	if (ret)
 		return ret;
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
