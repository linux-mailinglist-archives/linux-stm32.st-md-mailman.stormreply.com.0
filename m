Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805CA93E80
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 22:00:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BA80C7802C;
	Fri, 18 Apr 2025 20:00:00 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91E55C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:58 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-2cc82edcf49so551638fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006397; x=1745611197;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MggEbc3/wN2+Q2lPVGSfBi5tCxmBAoGp/YWYe65Ys5s=;
 b=rJus99qVpoVuvrW5cIUqqfuD8crxum9TSfZ3r7IIz39Doaj+OZY9l1Bq0FMtTVMQ+p
 gsQtCV2Av6S8tZP1bB2GLwgASQ+cUDSwYw7Dr2Y4J0E44JKrg+CANS6N8YBPGDmvL57d
 IcZ8DrZxoSvyebv+3AuREnTUSxFSdhdBolxGlxxku17FYqC5lAEKsh1s6KOQJteh2y2d
 MAUp70JrkIPofsc1PHkr4z024we766I0GlXYnp0ZIGNiyHFAaDiOTGJiutxaPk+9ieq/
 cl94UwHkLqutgqgIkkIyd/t9IS73JZmUU+51/lzvuYr/JyFHSykcdx765wdOwzDeD1zg
 FA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006397; x=1745611197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MggEbc3/wN2+Q2lPVGSfBi5tCxmBAoGp/YWYe65Ys5s=;
 b=UwrfxGpNnir4OKuTa1v+7PpKez85eflWGC6UkNt7ZtPiRwhYDV9XtmcJh/+uNN5Fs3
 8ORDMj+oyz1AKU+ID0shIVJSh996/v2QM37MSyYaOM8yuUv9HAmICR5bqdRS0X9k42SX
 S5OpO6Y8vbgrY2nLUXFJzjpVMDAxydY384/wRTPuoRCGSktPnRzJ0IOZ31vV8ZddY6fy
 4kCK5W57vRZYSC/O8XLToupEJDqhu9cGpEq40TtMyqSzbGjewMSWMEwd9UB0Bz3skRbe
 lg0YG8fmKK83icWQ+o8aRfnObnxZuJglFLsEZUnxo+tUgpbNV0gEPqT/GEI008SK11xp
 /2Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAGESfYuQGUTF3vaa03+dObHyYtNPO8FSfyw+wdKSlNgQqq5G4fB0pcsq6CCBRlgriw32uv1/mz3v+5w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzdMHqYCUSV596zLM+1bTUEIufxJKwH23cuUAxkYyWOA5DWAgnW
 YR9bK9SwLqLz8sanvAeM2eTKUlFNRtw890CZs0jte0BgnCjBPOECxhSMpFtc/+0=
X-Gm-Gg: ASbGnctZQ7SM6GXEp33T/nHF6ma0OIba/Zaul1n5MjGK+m78hxZK42WvTVjujMyrrjr
 j7YES9EFkgoZyBm6jwVk0j7RfROfMWOS8jQoDxdK2gSlN9M72bArzXrO8Zh/tugWRDxdPHadVPI
 FH9ujVHAu+wCaAVFXOKRaw7YBALTqtn3CCjL8qrxS8LxSVNf7VxxIzgv/G9W+m4ngSRFb8m4r63
 9UTtN1Qxv9sYiHhz7v/QzRvTuJJte+jFrFeJeqRDG4S2rAIfW+sWk5q/gcYEEl/APSEJl1DLCk7
 aQMg0rjpLp14L+/iwluoRFXIgfnSNVvMXg+HOcuHeoSKw+Ma51wibY/LAA==
X-Google-Smtp-Source: AGHT+IG+gejGjhaQSsLs7N1sUMk8COxBQa4oufobNgGcbDF7GP8s42nvoeAVo7lIwRuf8OSEn7c6ww==
X-Received: by 2002:a05:6870:ae84:b0:29e:503a:7ea3 with SMTP id
 586e51a60fabf-2d526f226b0mr2234380fac.36.1745006397466; 
 Fri, 18 Apr 2025 12:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:56 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:25 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-6-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=k5yhrc00lCr8GGuZ0R5nv3Gzs90XuAA6/+QofhTasXU=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8L4xpevGeyh+Cbk2mjcqGgi7fDAYg/NhVII
 IL10PDy+pGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvCwAKCRDCzCAB/wGP
 wOHsB/4y5HpYvODEZLE67Y714oZoOOB72/gk72fvqGQ9uGCnlTWkSz7wnEGxYKbmMkLsb+moj/F
 NBujkX9MGrrHtpAp8TLZsFx98Hcb7jzknjKtpB2htjv9TdDIv9CqKX1yOBA8EVZXwi8XHCeYB93
 3BtqQ9OWhxpnqUwAM6qebZ+ptcjHPFtorYG4nsZpXR6JFv4oH39UENA2/CYzJ9EA1q31gj/VbIt
 LBL0I6QcLgYVzgzg8aDfKEbAB8tuNXT7KJdCRbPUBCzRQkNQITxQ7cbaRf6lJIfRc8O/Xp5MnxT
 rnK9CSmF3wjWUJALvkW2wA+G9QPBXPEI0MzWeOle7GfS6WLA
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 06/10] iio: adc: ti-adc0832: use struct with
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
 drivers/iio/adc/ti-adc0832.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/ti-adc0832.c b/drivers/iio/adc/ti-adc0832.c
index cfcdafbe284b103a069857028886411bc72dea4f..f508f7113faa2610a2889f3c36c5a679fa72264d 100644
--- a/drivers/iio/adc/ti-adc0832.c
+++ b/drivers/iio/adc/ti-adc0832.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/spi/spi.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/iio/buffer.h>
@@ -29,12 +30,10 @@ struct adc0832 {
 	struct regulator *reg;
 	struct mutex lock;
 	u8 mux_bits;
-	/*
-	 * Max size needed: 16x 1 byte ADC data + 8 bytes timestamp
-	 * May be shorter if not all channels are enabled subject
-	 * to the timestamp remaining 8 byte aligned.
-	 */
-	u8 data[24] __aligned(8);
+	struct {
+		u8 data[16];
+		aligned_s64 timestamp;
+	} buffer;
 
 	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
 	u8 rx_buf[2];
@@ -222,10 +221,10 @@ static irqreturn_t adc0832_trigger_handler(int irq, void *p)
 			goto out;
 		}
 
-		adc->data[i] = ret;
+		adc->buffer.data[i] = ret;
 		i++;
 	}
-	iio_push_to_buffers_with_ts(indio_dev, adc->data, sizeof(adc->data),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    iio_get_time_ns(indio_dev));
 out:
 	mutex_unlock(&adc->lock);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
