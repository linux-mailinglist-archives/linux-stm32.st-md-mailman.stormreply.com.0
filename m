Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5AAD62BF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 00:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E781DC36B24;
	Wed, 11 Jun 2025 22:43:11 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF537C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 22:43:10 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-4079f80ff0fso864969b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681789; x=1750286589;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sIUkxS3NJlxCBqe+Jr2tfFFp8ENb+E8Z8dAwWew1sZ4=;
 b=n0RtQ6QByqD6VdMXD49NLUGqiVMk86Jgl5Ds8340GfViEAUFs/nuI6WxFX3uIJU5vi
 BiUchrpjDvAC7ALANL2L/dO0t08GswLkMxy5cq4ogrRLK2dKIuYYh7sK4njp6GMPZlAu
 VKCiS193WKMafv9CgdO7rxofK8OAsEpfo/H+buF/vljvDrcsBFGRacMIcBj9j6aQvBcv
 VPGKNEM+BQ/IrysARINqsjXeVzbq7bqQ6Iouq9wzSvN+unN9ipDi+mWtVswqQ4FgSnQo
 oeL2iIPos4YQPab4Kb2RL9Z3k0dYE1DV+qRnixZqXywI/FI7rjujsV4SqRHUWoBM7//H
 Rq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749681789; x=1750286589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sIUkxS3NJlxCBqe+Jr2tfFFp8ENb+E8Z8dAwWew1sZ4=;
 b=rs8Cv1eOYA5Q8/CHFSMyNdgZh3pi4R+wmq2GN38vNRezh29FrVoBplWW5VHqZXQch0
 Blqmya9ReFkFsVQLt62ViLApsXIKFmok2GItMRqW/8sRpXki0MEK2mwuGbOSsQWfb+6S
 7hzUrLdzXcsC12GddOoJwn6L6NdNuxdYagU0KIiFHkHQjkw4tJVf7/2rv3h/LFYhdWJh
 ZKnVMl/lR9LyvB//RZ9UGzN8i27WSuleqiYUJMGsugO0c4qHTFWRQRE6akDzlQBB4ta3
 zxE4TyBMxu81nBP7uV3qlsnHUfqMGsohen1v/aRYulcZSEYqcWCD+KH8Ww60hm0VcPsK
 e3Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5NIpy9wqflFtGyvzt2WrW7iep3xuWQNt1M3YYyVPaxM2JrkMcgQmLPuV49cgX94PvdZMaZPqqpgipQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwytKnb+rPZeelNBXjfQRokWNB6GSiUQvTelx3OEJQXa4gMhX+n
 vTRVL6qvyWBtd5VpWhosJKQZ8WIo6+BrxaYNtogdktvSIxPVn3zBvF48mBUEvKjAz6M=
X-Gm-Gg: ASbGncssCBz+RKPRfhPBnUP05Yl80gmTg35aY3pa0yefFbqztCGi+5JLQ4m4I2wMvoF
 S8a6v+rAa33E/scmv4FR/D1JpWV2cp2fH2IBPci2BsZ9brI7KiSUI2R1wAXd3ztW4dXfaf3Xhvx
 2QnIs5dLajWDFioR7REVntMxfe8nt8Y/adVTvvhUesp10JCmiE2Hyhbg3pZnEbK/bzlOHMr7y7C
 8QZsM9iw0gy7mQOQD8a27zeQLFR1ihcSWXDSeP0lmvOB28svKnvfWf891TJ5eZiFD5JFcGQbm/b
 D8sQeZT8E8G5e6+0YN53LIzNbMp+4rolgcn7Tt+sL+SrMJY3d5j4UebmzhHr0rGiBAJV
X-Google-Smtp-Source: AGHT+IEnYQuuP7+Ed1yUnqPwBXcm60N0HbHjFFI1Q30n3CnvRs0c1N7PubAsOKk34Bxp6isS1gHJpw==
X-Received: by 2002:a05:6808:181e:b0:408:fef8:9c91 with SMTP id
 5614622812f47-40a65fee5edmr1014965b6e.5.1749681789569; 
 Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 15:43:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:20 -0500
MIME-Version: 1.0
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-28-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=PE+CsjhnIQN3X+3KjjOXuO9jk19Iju+HayM9vpAuU1M=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgY9GS1AXDDpXtL3P/xEFQ0nsgDvgF6m8S2Ri
 XNCmUul8aiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGPQAKCRDCzCAB/wGP
 wPyqB/9hXsNHRRXkGxsp4YsM2uNtCavgRRTmB64f/KIXhTDYL1RBaHe1kfKU8iu4OLH+gBGaKt6
 aamU7fhFYq9DAZMXKztJTGp4Bn5UPjmsyGKezfM1KqyY5wXinyUHqiDAa6WFesxPAWSYBW4YhuL
 jjsA4pN6Yl0BLbsYRN061SYdEaoiVyNw5oLsxaeCRQCpjdYZ5kEyewIQcC9SYSb8m8YhpDprTXv
 WqEiMd/n7RM4kkOE1jWOSNJ+od1fajr5bI6tF+f2LNjMT5hE/qs1NYFOOBiY+WfrvFrl3aPqZc7
 060EeNImTcoO1iHforX5lOBvZ5p77oTZs6uZ7OSYFtt07WgK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 28/28] iio: temperature: tmp006: use = { }
 instead of memset()
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/temperature/tmp006.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/tmp006.c b/drivers/iio/temperature/tmp006.c
index 29bff9d8859d017e1b59536c531f732a2d749631..10bd3f221929d1b58b7e6a6bd9a75d5d068edf84 100644
--- a/drivers/iio/temperature/tmp006.c
+++ b/drivers/iio/temperature/tmp006.c
@@ -254,11 +254,9 @@ static irqreturn_t tmp006_trigger_handler(int irq, void *p)
 	struct {
 		s16 channels[2];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	s32 ret;
 
-	memset(&scan, 0, sizeof(scan));
-
 	ret = i2c_smbus_read_word_data(data->client, TMP006_VOBJECT);
 	if (ret < 0)
 		goto err;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
