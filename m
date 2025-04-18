Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E5A93E79
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4EDAC7802C;
	Fri, 18 Apr 2025 19:59:50 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D96F6C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:49 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-60406de9cbfso751550eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006388; x=1745611188;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
 b=1CA1x6H7vJJxz3R6NSjVQ+spFwkyEZDhC1ZxBPSGeKhl3nl3ierDAGriKsC56Vkn/D
 44X2Jda0qASPOOJHxSOPFZpYcl3a8MB5BXAdGmJB0LmG9c5pDhsKi9GOTvq1UCk2oL6T
 UWSOm1obPqpBzQShDXbZrAUJfbrUNhGOEC/bfSJSV3VJiKrkQRX7SfarhE7YkqM+y70I
 FL0vaPTgEF/9jBlXo83U2oIN0aKj9uLCVKbVwrEh9B9ljfdrBin1M3wchGmFZzQhf3bz
 j+AC+6pE1o33lns8Sj87gxED5QPCNWapPkHKPFXolyK+2bnYa79L4XiMRDHj92Hq6ZDE
 vOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006388; x=1745611188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksSqxXQXgKq3MEdL/jjg1tyq7wfP3KlJsiMdvfm/kDA=;
 b=wX5nYVmONiqKmaS+tU1UVEXkHRWLk+vPjgPr8qbf6zTBfW9wJVZl06to+wLsHrAgdQ
 ukab7kXt2xFnQdIftSlzU2K7TPF/tTWqUFv7HOFWXS7YxO0OnLa3z7ztKz4qaY0dd0nD
 ENWLRuBQkQ/jh87lJyvCBCLeXsVYtVeAbIN6bqdnFNRciJBoqx1pZrl4kL0f+sM8jxSw
 j8ai8zJywqr0i1wY2SebQLPBxI3KT8JHx7N9LZNLRCZP9FHlStUj0cOuQ+y5g17agHoZ
 87mOTZe1VVu86leXxfa7U2thTjl5L4gMvlsyW/4Lkg36s594vIG3++4ac9Mjl+U2Kx80
 omMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP0JvCCBvnkatL9EuB/+gGRILL5FFUcHHJtTWBwuUBDAQQo77yk4IUCSfgxlxI/73x5cOUFbXhzeYhpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzz6ngAoDfmMM0pZ29UqcwBQcjW/WbfjbxHBO/5oHyJqhkTYnPV
 XXN6/+XvRUlaGooLOmngRTucWNhHIbApFCnMFDWB+euDP6egWBxzncKMoyBORRo=
X-Gm-Gg: ASbGncvzZYJy1oHI6xYBHFe31VCujp3IwNU+FHZYGUo6MqsOmfBgXR3cSyh0pF3N8iH
 yM3Mpyjkp4jvs8te9Vn4jVQoAIjoRIH9gc3Jqd+SqDDyQavEaD/evkldW/iMhXERwcN8i3/7BuQ
 +EJrVmFA4Fk2F5mgqbSCX6XAxQlhXGcRH1NPOr2hJZDfbTDY09eBoV3VPc/B6ByGe859Gjvv4es
 huLzVZM5XwbCHN89pM3eA0SGPgmdYnCmXXMNqbCIVPxbSHkyHB2ybDBGmhEMnXTcJMYKE5cAJbx
 O0BtjTB0JKjC03culO9t2kXao8cz+9RNikUQibdYh0WSjco=
X-Google-Smtp-Source: AGHT+IFj8rQZMZvtPmVYvlswaBgMb9r1fm1cQCciAYKz5X9YEKQwhLXdNPStKbPWJNkdDXJj7/qY+g==
X-Received: by 2002:a05:6870:9e0d:b0:29e:671b:6003 with SMTP id
 586e51a60fabf-2d526e0b311mr3083100fac.32.1745006388641; 
 Fri, 18 Apr 2025 12:59:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:47 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:21 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-2-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2897; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=uGEGli6agFbSIEZPgrYVG1FE8mDYaDMCfJyp/lazgiE=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7vX8GGgAAxPwrJ/N9bdFji+tUrDObD7oWs0
 DvLOxngo0WJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu7wAKCRDCzCAB/wGP
 wPcDB/9Rn9JB9hcWF+vXoNFbgTyeYaeIohNCTpSNvM8pHIkYDyV+bTUeYPRDtYP+ubhiUNbAVy3
 3VZ841HJG9nqewSUOCOlBAE5AkziGAUm5bSrkL5ifXr3DSLzxkPnrQ3Ao3AiutbhF1sclOUJ3ye
 nheGCoAyzEluF3FJD2g70v8IDaD6bh6vaEe2yMQL8BSBuuaP5NZQw8HIM6Ek1xhsC1GWZ86urbo
 8Xxzad8bX2Qv8/zWuuH7qTCszseLNJdsXQXnyGDF5WJ/xCTvHU0VOpfaB/PB1RPj58Y97aA9QDD
 PTkAvQX6xnNlTfsPVMqA6uDJtbSh6vQzTQnrXLTEGHqPBUM2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 02/10] iio: adc: at91-sama5d2_adc: use struct
 with aligned_s64 timestamp
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

Use a struct with aligned s64 timestamp_instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 414610afcb2c4128a63cf76767803c32cb01ac5e..07ced924f7a6ae36fe538021a45adbf7d76c2e69 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
+#include <linux/types.h>
 #include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/iio/iio.h>
@@ -586,15 +587,6 @@ struct at91_adc_temp {
 	u16				saved_oversampling;
 };
 
-/*
- * Buffer size requirements:
- * No channels * bytes_per_channel(2) + timestamp bytes (8)
- * Divided by 2 because we need half words.
- * We assume 32 channels for now, has to be increased if needed.
- * Nobody minds a buffer being too big.
- */
-#define AT91_BUFFER_MAX_HWORDS ((32 * 2 + 8) / 2)
-
 struct at91_adc_state {
 	void __iomem			*base;
 	int				irq;
@@ -617,7 +609,10 @@ struct at91_adc_state {
 	struct iio_dev			*indio_dev;
 	struct device			*dev;
 	/* Ensure naturally aligned timestamp */
-	u16				buffer[AT91_BUFFER_MAX_HWORDS] __aligned(8);
+	struct {
+		u16 data[32];
+		aligned_s64 timestamp;
+	} buffer;
 	/*
 	 * lock to prevent concurrent 'single conversion' requests through
 	 * sysfs.
@@ -1481,14 +1476,14 @@ static void at91_adc_trigger_handler_nodma(struct iio_dev *indio_dev,
 		if (chan->type == IIO_VOLTAGE) {
 			val = at91_adc_read_chan(st, chan->address);
 			at91_adc_adjust_val_osr(st, &val);
-			st->buffer[i] = val;
+			st->buffer.data[i] = val;
 		} else {
-			st->buffer[i] = 0;
+			st->buffer.data[i] = 0;
 			WARN(true, "This trigger cannot handle this type of channel");
 		}
 		i++;
 	}
-	iio_push_to_buffers_with_timestamp(indio_dev, st->buffer,
+	iio_push_to_buffers_with_timestamp(indio_dev, &st->buffer,
 					   pf->timestamp);
 }
 
@@ -1643,7 +1638,7 @@ static void at91_adc_touch_data_handler(struct iio_dev *indio_dev)
 			at91_adc_read_pressure(st, chan->channel, &val);
 		else
 			continue;
-		st->buffer[i] = val;
+		st->buffer.data[i] = val;
 		i++;
 	}
 	/*
@@ -1691,7 +1686,7 @@ static void at91_adc_workq_handler(struct work_struct *workq)
 					struct at91_adc_state, touch_st);
 	struct iio_dev *indio_dev = st->indio_dev;
 
-	iio_push_to_buffers(indio_dev, st->buffer);
+	iio_push_to_buffers(indio_dev, st->buffer.data);
 }
 
 static irqreturn_t at91_adc_interrupt(int irq, void *private)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
