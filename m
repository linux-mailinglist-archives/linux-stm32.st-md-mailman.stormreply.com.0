Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AEA93E7B
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C32EEC78F71;
	Fri, 18 Apr 2025 19:59:51 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3274C78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:50 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2d0e86cd5b1so1186359fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006389; x=1745611189;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rwf2pqYvTfZAKWRzV4AAx6ws0t+3hl5RqCYYJcwd3fg=;
 b=lKD+BhiS5hXObstGRiiJnXDs6bowAT+OPvZT7uRzKqx1AXDy5vfJ6iYTwGDOAjWtxd
 2n9Q8dY1Avi0Fa9a9wuhkoOUCcPzk4QZZfIEaDV5tmgmyCFgVlOXtDLkRCt2ppKvMvtO
 43v7X4AmJVzyKVEvHqYF2H7eMHuQWPvEYSYR3PXeT3m1wl990SJ54WNwnHOIGxLp1Ucx
 9RCzdlpqxp/+GfufaJOkY0Ij5jocuZVQhFwhZYZELzMArAD1jAIU7B7/SZH/r07LKV6R
 nJZ96i2RMxEHPmS6Jda6XXwuiMWYQyQxEopXkaH8xum3CltTUXy+1PhhNQIAa4vJO+f0
 XWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006389; x=1745611189;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwf2pqYvTfZAKWRzV4AAx6ws0t+3hl5RqCYYJcwd3fg=;
 b=fNYmlHf2w9a0W8TDVAaTb/AlG6cufWd7Mi9GYbVKTyDKBOSAsmNizzuL82QwdY2mku
 EHI5903eW5SONu84Pfyvf9u0RE0xGezdUiywyd8cfet/os/6+TnKuPQ/R52R34bYwDLG
 PV6ndZg+IpgQBo/rNZwtifdu978TrT0T5tvC9fL8iuoPyssdRLO9LWAox7qh1eqbfQDN
 Id+ztXcfLmU4eN/pXSrqqtqBPTv0U+qLIALxzj6EzmHlVJul/XXNnR0vQWeOGZpQTo7f
 G5j+pHspqF2pnAPIBVFsbdFJZfMiTPR8+EVyiXKHCdUGY12OljYmpqdMg6KdXOegTHDT
 2spA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBY90R9eviAsCxM7kknRp7XvUGa0WDF7CwoTuhFn1ThIDMZwLjPR6V2qIu31pwOpOy4BKH4Cthibz7aw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxQZguEV8fs0AwX680UHQfxn/CrSxlN1oQBPXZy0xzUTBy3hZVa
 WuhvGkvBU6Y33uvXgpoEzZJ9QWr4lfML5TMbtME2ypY00Ypzz8lPPd8L42MlMlg=
X-Gm-Gg: ASbGnctn7YfPQ2MMrNKMuH68wRAZ2FmOvyYVeJZVnC9HM5i1nSKm4uO896itHOcng7q
 qqFCKNIt8ESBfJ9EV/1S+v4BA9ilM5CCigZzcWCbh9950nJioM+jDvwIbkpITVz2Tcs54pb2blQ
 aOrGlPATyHOPUVW/oIx/rjrQDCidYSv41BgoJrMiQrJfsZeCatiIoi5KeE64CIhBIMF9Tj+BEll
 etxNePg5LtQl+I8eq80xSA7Gl8V2XQ7N7FDFavnxPqhXRPONUYznef0iYOLcqJ1SpPmejrWPzOs
 J3DhUHaIaiQ7X/RaBW4KDb5601CBiMNXTpW9uAytJ8zbXuKDmGMCUhVgRA==
X-Google-Smtp-Source: AGHT+IFwZ3EWj8a1332iU/6yoy+sVrn6yZp+kcyFC3R5X2BbUGWBQCdaSARBWT9nwdH3ywi0Y6UEcg==
X-Received: by 2002:a05:6870:1b11:b0:2d0:4a2c:7c22 with SMTP id
 586e51a60fabf-2d526ae9243mr2222694fac.18.1745006389633; 
 Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:22 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-3-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=lGbQ3dZga8UFYhE2RmKRRSTA6YHIjjV8TI3JBRQo+eI=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq736zDtgasDsEkD9rWkk6FaF1wjLFLYYEylg
 PumkP1NSyGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu9wAKCRDCzCAB/wGP
 wGuVCACVD/U6ho5K+XhYyv2ZNkNciwcFJPn/JPwQupiAbpUPj2JNFkyuR6gPyuLTUVWvVmzG4s9
 FeA62PoeKoiQkB2DMCf/dAnzaaifeKAjLoJ0IrqCYNoyxwMa5JNelAZOuNDyAilVXoH8vdGWVjy
 qpMHWiMGa8zdWFx5cTHLVkqj+fvO4I6AtQvTm4/k2nejdcLCE6Lm/6NF5HnwgrBgP9IZ2jOcMx4
 0RxycD8GgRzI6AiAJv+nN7K1NWEz8zjk/ja29Z347y8KgnYnl5dckBrqu858JTt1s8lEvLS1jml
 BgZmOJfTqI6VwbEvW3F38Hc51xsFx9QMlH2Dhe9oF5v8D+xK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/10] iio: adc: hx711: use struct with
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
 drivers/iio/adc/hx711.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8da0419ecfa3575aa54a93707c681ec8ced28be8..7235fa9e13d57c693751757c5d40e8a799622f17 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -87,7 +87,10 @@ struct hx711_data {
 	 * triggered buffer
 	 * 2x32-bit channel + 64-bit naturally aligned timestamp
 	 */
-	u32			buffer[4] __aligned(8);
+	struct {
+		u32 channel[2];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * delay after a rising edge on SCK until the data is ready DOUT
 	 * this is dependent on the hx711 where the datasheet tells a
@@ -361,15 +364,15 @@ static irqreturn_t hx711_trigger(int irq, void *p)
 
 	mutex_lock(&hx711_data->lock);
 
-	memset(hx711_data->buffer, 0, sizeof(hx711_data->buffer));
+	memset(&hx711_data->buffer, 0, sizeof(hx711_data->buffer));
 
 	iio_for_each_active_channel(indio_dev, i) {
-		hx711_data->buffer[j] = hx711_reset_read(hx711_data,
+		hx711_data->buffer.channel[j] = hx711_reset_read(hx711_data,
 					indio_dev->channels[i].channel);
 		j++;
 	}
 
-	iio_push_to_buffers_with_timestamp(indio_dev, hx711_data->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &hx711_data->buffer,
 							pf->timestamp);
 
 	mutex_unlock(&hx711_data->lock);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
