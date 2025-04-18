Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374FA93E85
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 22:00:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DC58C7802C;
	Fri, 18 Apr 2025 20:00:09 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9867DC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 20:00:07 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2d540239367so105948fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006406; x=1745611206;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
 b=FxB5Q4iDD410AdlMjtMMXDsZAPBER2qb7WaeilQZDN7/FNA+ec0j9B2nffJzPzoG2F
 LrF76O5H054I5IZTBuIAUNLXYQZHHy+nWzBAQBiXrHOXE5ABPVjojGJQBpPYrWuZ4Jky
 Lhjg/rI2BuRRhvzLr/ThxOEluGniELG3lY+casUbuSGA7ynYFflCdjg1jon/ALITBGjl
 iGOeD344TOZe/DFqWJUTqJWhsFNfbq++p/IUdNITezUGh0t6fkYZxRK+GOdOdEALAIKH
 C2Geltl0esCBUuDHd9WLuNd4V3FP9mdajVJmQ9HTKcBlsVss4KjoxhA2QZXMFv1PDmtU
 YEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006406; x=1745611206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDqqSLn17t5025nkyBHLLdQZLsyBrfKDeHjL9m8bNdc=;
 b=LD2ASS2r6nz0XbDWmZb0mSNq5eZX2ytkHG90AYCkz2FjevFCuDYzvvzLaZucjSWdbM
 dOfnA6rck8lB/gSUyO9cFM45YJqch3hF9N2hbfdel4j6eTd/dHVhvGy+CPISKGcYdIPU
 nQMn0s+a+y6gJQJ7LF2MlKVJ6l/GJwQFU9OLYMU9eKLKhUxRfytVIr9heCvqIcybZp8D
 lldYmG5Vsf2JBT7K3r5Bx3+3Y9dIEC+4WGlEUMy7lskgJNt8itdMwQy+BoDoWJYLkUNb
 RMFDa5HkN3aT62YFpMfXsdm1TW1ScuvxtuWkdca7vHzSFUtGtsGsnDlsBKanrzBQ6HyN
 bkIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv2T1DGuiJEjJhmGvLDeW321jH9MWIv7RQjImjrvK+SSye/4GK2C+AJ/5GRW2aNV+BjZHgBqrp7SG40Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2m1dRXwyh4vNMJxiRcet+AZT+PTSfT2TQLxBYSj5z7W86S0np
 3gJYaJiPUls772hIhE3j39e6hFpHlOQ1fj8ikMeDofY6y/rcZvowqQ/H467xCi4=
X-Gm-Gg: ASbGncusuywuTvBn35OhrtAjj+/xCS2Nx0udeb7d629H6IhF8tBM16UHpn5p/BInbQE
 F4k77pTRnRjqJQrmQvIAsK3qRFiinNrm+cZowtHwZGPlzIpORTmIIz5a/Juk5dMRMM9SqtPkTQg
 GAHHFc6RonkAzXQFU0qdKwI+kr4m/rYpGlZbCasEQOyzBemIlfN7DFS5MgugDt9D4hX63gytGrc
 8bq2CY90gqgeIAz6jM+f1fqrxtG3MJ0C4r/5kI/l3hdhaOAzEmzJy+qR/zcTui8YK0vcyGUx6fh
 CavZ3THuw412WcPFgks8Ko2gY1Qa65JrFMN4FL4tPEGPQBGOXkJaN1WymA==
X-Google-Smtp-Source: AGHT+IGyvAhFlRCsX12Lhwr22tKkpHolc2Tt6LGi5+wwx4p3gTPOGLhHmLju7HF0T94FQvgvVlBiHw==
X-Received: by 2002:a05:6870:4413:b0:29e:6547:bffa with SMTP id
 586e51a60fabf-2d526af61c3mr1982271fac.21.1745006406486; 
 Fri, 18 Apr 2025 13:00:06 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 13:00:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:28 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-9-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=ARIVPfAYjojNb4iBMLsUhX2LD/OFISQyTpJFmR/jUmA=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8gnMqNGtdNT2ZIPYnYVdyTTiuNmSwk6ytsh
 TVb3PrODfaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvIAAKCRDCzCAB/wGP
 wBNxCACdVaOqC9XUOO3XNtkEYvq9VgXfioFD1KTARQagGK8F4RZ52Ql+vvMTIfwlpvJZ2gt1C6p
 2H95DFKR9LUWM73Oc2uor9X8qIw+B85vCeAZAV4Ux5UDRP16K0Q7Ick+F/d72GPdBKSM3cnPUAq
 wNHPB/7otHliUHUsABIkKUC45xghvbM3+0JbwXMEuLAcC0xgu3XU2XGzKcuqbj39kBioJKPOLje
 7uhR6CGsgbp8xEjN+n3V/Q9CdEC0y1JBy7RPnbUXTJkQiccRgPr7kgv7T+7V2Qm3YGDkxz7YnDa
 0zhX+IsfH+cnM/RBIpCAFz6Fa+Uz/hbt5JnBiJfw2/EJvSyj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/10] iio: adc: ti-ads8688: use struct with
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

Changed from struct initializer to memset() in case the size ever
changes and there could be holes in the struct. The compiler generally
optimizes calls to memset() anyway.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads8688.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads8688.c b/drivers/iio/adc/ti-ads8688.c
index b0bf46cae0b69eb1fe8d7734c8a32ac642c5d0cd..2a9cb7d9bbfae4b282682d755992acd47fb88b99 100644
--- a/drivers/iio/adc/ti-ads8688.c
+++ b/drivers/iio/adc/ti-ads8688.c
@@ -380,16 +380,20 @@ static irqreturn_t ads8688_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
-	/* Ensure naturally aligned timestamp */
-	u16 buffer[ADS8688_MAX_CHANNELS + sizeof(s64)/sizeof(u16)] __aligned(8) = { };
+	struct {
+		u16 data[ADS8688_MAX_CHANNELS];
+		aligned_s64 timestamp;
+	} buffer;
 	int i, j = 0;
 
+	memset(&buffer, 0, sizeof(buffer));
+
 	iio_for_each_active_channel(indio_dev, i) {
-		buffer[j] = ads8688_read(indio_dev, i);
+		buffer.data[j] = ads8688_read(indio_dev, i);
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, buffer, sizeof(buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &buffer, sizeof(buffer),
 				    iio_get_time_ns(indio_dev));
 
 	iio_trigger_notify_done(indio_dev->trig);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
