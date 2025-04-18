Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFCA93E84
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 22:00:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 249FDC7802C;
	Fri, 18 Apr 2025 20:00:06 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F9F3C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 20:00:04 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-603f3d42ae8so1117320eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006403; x=1745611203;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
 b=ubTEvoFNgbxqdnj5x5JJ8XC2IqjuVEqyUvx6tDGAekqTRffbeb4EXBcfKNjq0Beqy3
 ukZJFSrcx6GDf4dy8ezn31LQ9Wam+YStDgmAg5fb9n8KoelHgKz7qEFLqdz7QjIWMoua
 ntTNcFyBYx8xmrroEXeZRczpm9tLu7YClpJi+pnFRxPfY1RXwL1S+PNQ4NVC4B/Zb5hu
 W2AJOXVYsmwG7hOrSx9w2sQlsavSut/ZRbGKI8y+S4dQUdWz5rOh+4x/TOxinQgIjfAO
 9UksKISz+PYzavFIh3Fd8rFF54Ty3WoALQMakCY0484ug3pFfdVDH+2qyGaf9axTJUlH
 uckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006403; x=1745611203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwEV6MZFJIchPoMNTCpHkxpHxz93usoOxoRUm2ZA0bk=;
 b=ttEuu49CpcaRC+dBHhX9WWQoGyhO+IgoO7ZcVT178g6kNjWJ7xRJyGu73hb5kuSi10
 GI/giJOfV+lHIa0bXZclp8FixqrQa3OIH6LZNSXLHxm0UKos/d9bLARzmkyg4aS1bThe
 qa6RDESJx4HGPt1m4bYJs/90+4Tii7xE7ZC7Y7+j6yVIzm9ZNPKFlBvtKC32TT7KQX5E
 SjDVQ0I1OYTm1zSHSIE0A0YsKC5+NKVEMeD7/KdVcr8cHjPfOMWmpeYr84LvVXYtm4Jf
 L7nfDNJRQ5arWrMWycrUA768P6xlWa0GsA+bcZN5lcyXtnPustP4hauzYwuGrsvNIApI
 N2Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeMMn6GNJNPXi341ITJYDeKRIZvSPc0ZNXfHXsiPtp4KPNNQTA9T4nGwOU0IoiqR/I9OrEneeER4X0cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuJr2hJDj+k8qI9doDogG2yJBbjUyux1BnXfecr7JgOBUOjvDM
 170LRRUDfFa75xAVxzkmZcSy8Nt/OwdhRnX2/BlPkrEk7A70g6fRQ2ctTY1i49s=
X-Gm-Gg: ASbGncvPmO7MhuRDklR7EoWSRuyX/4LbG5ZOgo7nFvJf1ABBtm8/S6a9wZHkcdhrstM
 WdANuN8PZGGUhIuC+xZXfVG8RJP4JsjSTgPn7nYpSjNUMrkmo581NtKCtzRBNqpLQEKcdUN65M0
 hNYXkq6tRxq7dj6poSB3bbGNPukuNB5KT+f7M98V1Bl9uBpqj8tfFJ8zb8PPY9BFI/LLpdQNsAd
 TSIN+m5Iltqx9l98c58OA783ajLWus5/syWcN2yArvWePuUbb/WWIkOakbqsPc/96YHiGUMwEGj
 HC8/30JwMw0fs5jLkLp6/EH8WmrWz3rEaQASdCUMfd1bNMo=
X-Google-Smtp-Source: AGHT+IGOnbfbgHvkykmuoWWumpe/zQvoKx6ZttBWLA1bqT+37tvAXi4z2gJDa6nDw9JVR42V4KG3Zg==
X-Received: by 2002:a05:6870:aa9a:b0:2c1:44a9:fc16 with SMTP id
 586e51a60fabf-2d526ec9824mr2328947fac.38.1745006403477; 
 Fri, 18 Apr 2025 13:00:03 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 13:00:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:27 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-8-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=SKCpF0rSJSY06g0qoJ4XgXpVJV0JPJb8oLvnwY1CUvQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8ZpjC92ceussgPgpBKBLXA1tO4DdY6Pfv+q
 jbN1Cv80eqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvGQAKCRDCzCAB/wGP
 wNhbB/419+xS1/MlezzwDnTGWqQSMnAh1Q2CLkNfdMRF68px0+3K710C9xuAgCWfWqc+HY4d/gd
 0Z6Ek4aSyCx9NVF+d9REpdeTCbkAjzL0yt1UBHDq7hsMFQOylHBCYJFxtxStm16dSE9AByAHWcp
 ztS2vlc/Dgu77OXzBjdmjGD0dhTrhCxBJHEAVudLPfh/WAoVrFRmc5QXkl5E57hP1EQoHD1p8CV
 iob437dhuhV1doZeSuFDEMRKbhsa1awJs7IRtPIZywjnzRwZ9s4wgjSYJSr0o+bYCyQ6Y1y1JLq
 bo67Oufp7S8gpeHG7/yyq/tHcStfArgOiFqPlRhGWaoDoT8L
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/10] iio: adc: ti-ads124s08: use struct with
 aligned_s64 timestamp
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads124s08.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
index 8ea1269f74db09427a4a8d434ba1d63e7c63d038..ecaffe83fcc911f99afbeae7ef51440d150bef73 100644
--- a/drivers/iio/adc/ti-ads124s08.c
+++ b/drivers/iio/adc/ti-ads124s08.c
@@ -98,14 +98,10 @@ struct ads124s_private {
 	struct gpio_desc *reset_gpio;
 	struct spi_device *spi;
 	struct mutex lock;
-	/*
-	 * Used to correctly align data.
-	 * Ensure timestamp is naturally aligned.
-	 * Note that the full buffer length may not be needed if not
-	 * all channels are enabled, as long as the alignment of the
-	 * timestamp is maintained.
-	 */
-	u32 buffer[ADS124S08_MAX_CHANNELS + sizeof(s64)/sizeof(u32)] __aligned(8);
+	struct {
+		u32 data[ADS124S08_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 data[5] __aligned(IIO_DMA_MINALIGN);
 };
 
@@ -289,7 +285,7 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		if (ret)
 			dev_err(&priv->spi->dev, "Start ADC conversions failed\n");
 
-		priv->buffer[j] = ads124s_read(indio_dev);
+		priv->buffer.data[j] = ads124s_read(indio_dev);
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
 		if (ret)
 			dev_err(&priv->spi->dev, "Stop ADC conversions failed\n");
@@ -297,8 +293,8 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, priv->buffer, sizeof(priv->buffer),
-				    pf->timestamp);
+	iio_push_to_buffers_with_ts(indio_dev, &priv->buffer,
+				    sizeof(priv->buffer), pf->timestamp);
 
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
