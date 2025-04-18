Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9CA93E78
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8A59C78F71;
	Fri, 18 Apr 2025 19:59:48 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3534C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:46 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-2d4f8c42f49so1137400fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006385; x=1745611185;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
 b=Oe4Oy9kODJj4koEoSr7QBOiGEKw/hDhPO9aiEyr/QM00A5Kioqm2RswxeeETJ2/3IO
 JSInXbbBwrefbfpp4X7JraYs8UOfVE4rWqGz8ikgfaHW2BkQC9P6lNIYBOXUSS2tAND0
 fK4luyOnElWnjr6PAN6gohOrNLCvG+V6WCkX3+M49wKh9sBXUGo0/skOiSvjyGsu1xmr
 krmfM5hWe+EG/JtoAYcEb4iTk/33jtC1zV2UcyBxaUM07LtN7OofeqO0AFDhoUC/YXC2
 EatLMHguwwu2/z2UG2eFrTitKE4TLjPLps2CHdFsN2VA4mRi0zgSw93+NZoNbO7V3xeC
 jZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006385; x=1745611185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlDI/QLmlPJuz1yS/XHu6VU6BQuOeAxWmCMkkw2CqXk=;
 b=KgYI0MekzwIvmO2mIiTJoGsVIFfIlbfiLq8vhN+ngzxXbcFRaDh12Cc31ASuyXSYOn
 GsyXLsXICX6Dle88RKJ95P4ET/XsBWNSZupTHNMPHDC/997bqM0a86UeytwR7+1g7FG3
 GilW7AXssZjs9q4Qrpt9TB5nn/RaTfVCu2XtKJrjhV7GPPgfTIMvDTM63bPXszt1xFPA
 JOOAvF66gBeCOvCVCM5eAg0AFt66j9lx1119gUlFZHGAV6lCHDE3b9Y0szglkQkJVaO8
 T2o+QhCpe7iZopV2/Vmd6kbolN8IGOk96nv4LisXDTC3WgGo/Omc3OsVffiKgLAKY7W1
 JIDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2tB4k5+knDfrKKVfPVh7CDr5c+tETSxoy0y0W2ag13ZeGPwEsWaQqeR+DfQtBATHK2c+ntCQI7TYuxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyaA+gJrBTiJ+4Jm+n+74ozqjuDk5Tf4GMA5Jh5h9PDuMM6a/97
 L0vhEX/KhuOK8GDF6wDVIU1QF1QCtUgHpuQ6Xk+zNOLtoGh20An/iF8T1f1IIrs=
X-Gm-Gg: ASbGncv1HIa+sOjyNA15zO3VtHMN7fsmOotk3r5XRXmLCzp/vif5Xng2crc0uu7ahi1
 YlgmtFTk4LlmVzTfpIUXrC0k0jeMNWUez1j3vlMCYu4yO+0UJPPRjbhAkHuCIESsDkiAli3vxuD
 BxfJf1P7yygwTeAq9sEfPq2Zq0eZTDr7xsHT8nPjFT9kSG14X0YeUp1iLR7/kbeQ+WpN9lVyQNT
 2ri86GzwbvVwD4e6hrfpT/FvJ/MleFrgdKHd1Bw87keH1QfFB0Z6qluxbN6ENCTM1IitcyvSZ1Q
 Eeb8OmEjpxUYPPE6UHJpkKcfWBhpNK0BZWqho+uiTrPZoDk=
X-Google-Smtp-Source: AGHT+IEZLt8vJ+Vea+VdNW6U5TrIwsCbEZj5notcgMOj7WZyAPb2+50/gNm/PtPTqMubaQMXt78WIA==
X-Received: by 2002:a05:6871:2208:b0:2d4:e101:13f1 with SMTP id
 586e51a60fabf-2d528764a94mr2112473fac.13.1745006385694; 
 Fri, 18 Apr 2025 12:59:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:20 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-1-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=atzk3KgpYuN7DI/cmia/uI2CCnJShxRg4I1+4wGuxyE=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq7pqs36/Uewg4GkPF0PtQe0BngPZ5CQYydvA
 pwIa4qdyciJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu6QAKCRDCzCAB/wGP
 wHfFB/9GtQnD4PldNnD2VgoEGzk7DgDePLxDOrYU32KN2nhp0QWkAaDNoNEYBhYQt2fv5gWVB9Z
 Xl15hL/X0IiIWQRQz0YQHmodc+DHZYkKl1DEl0fSOPzAHfvCGvbpGgRG+4Oi/RcZfLmeN1kcldK
 n12hAhtHqetBeEWIcKRs0mmQ/CiOAiWdd0XKJcRXQqdrIl578xkTzRhW8ZfgcDRJhO5REY+r49u
 G03D66fWWIAFlreYa769SW1MC9WJgtmcWExTXic/L5+NbF5GDRVAxt6cFwEUAnayJNtp/F1N/Z1
 EH5T41MtVfiXCOUB9ErI3MJ7H+yNku6IF9i6ZOXG3mKna/oO
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 01/10] iio: accel: sca3300: use struct with
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

Use a struct with aligned_s64 timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Changing the array part to s16 insted of u8 also lets us drop the cast
when it is used.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/accel/sca3300.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/accel/sca3300.c b/drivers/iio/accel/sca3300.c
index 1132bbaba75bcca525fac2f3e19f63546380fd4f..f04ad523f48abd598b1b2df37c51da894c0ce796 100644
--- a/drivers/iio/accel/sca3300.c
+++ b/drivers/iio/accel/sca3300.c
@@ -58,15 +58,6 @@ enum sca3300_scan_indexes {
 	SCA3300_SCAN_MAX
 };
 
-/*
- * Buffer size max case:
- * Three accel channels, two bytes per channel.
- * Temperature channel, two bytes.
- * Three incli channels, two bytes per channel.
- * Timestamp channel, eight bytes.
- */
-#define SCA3300_MAX_BUFFER_SIZE (ALIGN(sizeof(s16) * SCA3300_SCAN_MAX, sizeof(s64)) + sizeof(s64))
-
 #define SCA3300_ACCEL_CHANNEL(index, reg, axis) {			\
 	.type = IIO_ACCEL,						\
 	.address = reg,							\
@@ -203,7 +194,10 @@ struct sca3300_data {
 	struct spi_device *spi;
 	struct mutex lock;
 	const struct sca3300_chip_info *chip;
-	u8 buffer[SCA3300_MAX_BUFFER_SIZE] __aligned(sizeof(s64));
+	struct {
+		s16 channels[SCA3300_SCAN_MAX];
+		aligned_s64 timestamp;
+	} buffer;
 	u8 txbuf[4] __aligned(IIO_DMA_MINALIGN);
 	u8 rxbuf[4];
 };
@@ -492,7 +486,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct sca3300_data *data = iio_priv(indio_dev);
 	int bit, ret, val, i = 0;
-	s16 *channels = (s16 *)data->buffer;
+	s16 *channels = data->buffer.channels;
 
 	iio_for_each_active_channel(indio_dev, bit) {
 		ret = sca3300_read_reg(data, indio_dev->channels[bit].address, &val);
@@ -505,7 +499,7 @@ static irqreturn_t sca3300_trigger_handler(int irq, void *p)
 		channels[i++] = val;
 	}
 
-	iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+	iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 				    sizeof(data->buffer),
 				    iio_get_time_ns(indio_dev));
 out:

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
