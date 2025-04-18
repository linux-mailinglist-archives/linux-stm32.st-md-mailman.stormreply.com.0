Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D0A93E82
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 22:00:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A31CC7803A;
	Fri, 18 Apr 2025 20:00:03 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E469C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 20:00:01 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2d0920ce388so461841fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006400; x=1745611200;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
 b=dANGEYef+U02t3x2cCfIoj8iIf1E0JxhOUX6S4homlr0y7O9k+cJaKMzqnkw9hjLx8
 Y5GlhbiwuKFtAwGdtCr9hd4CwRz47stn9wkNCjk9x0FV0ShczJ3RKVI977l/zS5JWjIo
 CX12qX1JyehmQPWgkeQeBeDeIwg8hc0l2fOrzkvQ0/zD1W36zYfcoS8im8F6FGIW65m1
 ot1jqZ7WmRFHvUMPt+kabx6plVZpXeq+CDKMS63XXM24BDQsdbmKZweF70v3FZaGNaON
 cosoNg0sOwP8xIMpTRVJ5sKlHNcabZQcsdc7jf3hk3/TcmyMWNFhQMWLwIV5Fu1pK8Fz
 eQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006400; x=1745611200;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1rBDR1U//AMtHVJOkZ/ynz5adiM1MIpFrbiMNuOexx0=;
 b=rT8QiPH7MB/lRd/sz/EL4aQ9M9Cpnr/7Ya35Cm9fmbmHxL8EOfv1iS+4VsfFdPxhwH
 NkcRuSz3fwShJ0EZkgh9g53YtvGMbk+QUpEh+aoEgsRhqxi6M2Q+grWzKOzYpCEjeEgQ
 UbBGXLeuoz+c9njJWapF2RRW5435IXOpkzCBf3b/LgnUfFtd+M3OIYlL6FLgT1ymxn4C
 EwkdlZykLxPmo+YVtmSZqJ5Z0BBGG+d7EeLjkSO//BobaQG7TGwIHAdcK5UgKEPGn0Qn
 cp/Gny4fxr790N37l7l2wRXfl2wkl7IotI6Hqz+zPTcBLWjSTOt63QZTiahvvG2dbps1
 AD1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQSfSs5o24iaEDwbOieXkxE2Xke3xdv8atOquDGJDPJKiRGPNsLOAbnHXvqskXkMB3LrLM8sQPDPQo6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywv3/5+xAuCAOEwYa6Nj4t7WjfTk9oQek1qbA/y57WIKc7MBhpe
 l8dzkUKB8umhFFxIpnehh2pxvAQcBO9OHknqv/SPscL3KAVV6TkU4ygAyTZRq8Q=
X-Gm-Gg: ASbGncte9QBlAbrMJ2BrzH89LEfAIrGfSfmc4fT5OHmnFHfJFJNqM5TzRd5ksx7Png5
 70Edct5sjNm3zU/ilt3klEyV19ktqLZn+EUPvQLLgnYcfI7Id8knYTGx5tAGwP7Dyfzrr3fTt85
 uOMiwTsThwgozboEhbGMHjMgKv0KhRb+10qGXNQoOzfRefdR6F484JPPqL3MDTFei/jG4b7JMcv
 Hxn0jW6Df4EGohtgmn7gszhM/OOv8EBnOGtu6M2QFoR+Mt0ILp42/XOQJNzngKgEOXsHA2Lj7vB
 yidezrZsDg2duMdY+dR2zQW+oBJ+qsC2NX4grmAayrS5Ot0=
X-Google-Smtp-Source: AGHT+IFESQi/ZfA50kegJe4RtMSS4PZyQ9d46ZiXlLlHIdLoF/HU+gKoBW8lEVWEJo4/bW8fFvnACw==
X-Received: by 2002:a05:6870:ac10:b0:29e:2bbd:51cb with SMTP id
 586e51a60fabf-2d526d6e952mr2256820fac.24.1745006400470; 
 Fri, 18 Apr 2025 13:00:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:59 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:26 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-7-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=s4l8P5OcPMgo24O003DNQ+152ZESYZRIhpn5OwsYUsI=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8Sfs2AclmrDLeJi56Pk//ih6Hw7R97L6d4q
 buJJAK8DOyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvEgAKCRDCzCAB/wGP
 wNv2B/9ot5lFQsMp+EgjDd/QqmcvuIydEgfUNbhAvAbPepUmk89W4MY9JTUT4zxZqWE11B6m2F0
 3zIVrrIDDZ3e56OlvCdt+U/BqUKLhOsnt7igGBmtKpP4ySz0oU2RYl8BXUeKuguiIw3XupttbFi
 Ud5X97R0RJStNPy0+C0JjSr57E5J3u491cFFhlTvKsUyIMaK6HYbPkpCBGv6hdWrAhBbiabbSc6
 alXYEmMVK+RiMRZLEJr6bRGjTVLLmbdbPxrlSC0y8KZMqtcCsp066Fsuz9VN4sGrWXrTyiwPLwr
 dyjbqaoUlUuymOoPka1GF4PxTtk/WfwzI4cG7/T/LHnfv+HX
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/10] iio: adc: ti-adc12138: use struct with
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
 drivers/iio/adc/ti-adc12138.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-adc12138.c b/drivers/iio/adc/ti-adc12138.c
index 9dc465a10ffc8d9f596e34215af685999235d690..27cafc2954e8956fbd674eb2bc32c59980ffb746 100644
--- a/drivers/iio/adc/ti-adc12138.c
+++ b/drivers/iio/adc/ti-adc12138.c
@@ -19,6 +19,7 @@
 #include <linux/iio/triggered_buffer.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #define ADC12138_MODE_AUTO_CAL			0x08
 #define ADC12138_MODE_READ_STATUS		0x0c
@@ -53,7 +54,10 @@ struct adc12138 {
 	 * Less may be need if not all channels are enabled, as long as
 	 * the 8 byte alignment of the timestamp is maintained.
 	 */
-	__be16 data[20] __aligned(8);
+	struct {
+		__be16 data[16];
+		aligned_s64 timestamp;
+	} buffer;
 
 	u8 tx_buf[2] __aligned(IIO_DMA_MINALIGN);
 	u8 rx_buf[2];
@@ -351,7 +355,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		reinit_completion(&adc->complete);
 
 		ret = adc12138_start_and_read_conv(adc, scan_chan,
-					i ? &adc->data[i - 1] : &trash);
+					i ? &adc->buffer.data[i - 1] : &trash);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to start conversion\n");
@@ -368,7 +372,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 	}
 
 	if (i) {
-		ret = adc12138_read_conv_data(adc, &adc->data[i - 1]);
+		ret = adc12138_read_conv_data(adc, &adc->buffer.data[i - 1]);
 		if (ret) {
 			dev_warn(&adc->spi->dev,
 				 "failed to get conversion data\n");
@@ -376,7 +380,7 @@ static irqreturn_t adc12138_trigger_handler(int irq, void *p)
 		}
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
