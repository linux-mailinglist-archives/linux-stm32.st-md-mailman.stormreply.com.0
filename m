Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B4A93E7E
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9871C7803A;
	Fri, 18 Apr 2025 19:59:56 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B8EEC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:55 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-72ecc0eeb8bso481428a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006394; x=1745611194;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
 b=x7CZx1uaNsI45Q7+GHWiJlxd9Fa457wrlAudJUTT5jPuDFJDayxjikT0thi7YjDZSd
 zaof9zWoUY0r1xsrlIIrMSKdHUaP4OzqdfjF1A6XUA70q0HOH88nURJsVwuZmFlZaqqo
 o3Inxdkv+1So1WmkRQJ5TK1T+PqGD7hcWLuIsQ1vlv++D6sMFvhhvZppIbGpz77XQajn
 UsZpAzJcqXmar1OhEtAwMD4sA+c9nJS0/Oe/Qw0HrsIzk016mvUMAQCRCsJxIzA7r8+u
 1LNKWZpHFdijuEWyI9BiIMd1RQET9ga5/frUf1TAbBdm86mfpT0c7bv/j9/GzKKd4l+J
 vEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006394; x=1745611194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
 b=r6CSrMEUybrmAd0LCc9wIbRKw6mmYr6CSnUTGWxeFuaZQW7Uu7Ke2uOzbMJv5Ki7bh
 hw8z83YX19UgHL8a5u2nyV9/QJuHW1JTRppMRR58SJeAtBwzHU9LTee+bi9IAqurmjtG
 P4sbthF28bt0m8AwIHmMHgAQ7VOekevxUuqJOjcpH+LP4dgknYQLZuuMO3mDPYuNFRV9
 +LJFJMHiaAgFEr0R/5sHt4rWqTmtjW1yrZFn8aslaBRnFsRbQjWTzOajU3q1HcfAbWNB
 TVjA2CC0kxQPu75FZcOQLdMVVdXVJwXmFFuxuPx077Osr/93qUuTc4Mueir5GRaladvJ
 mGFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVovWHXIasNBRCVldpkPYOSmF58c3WWij+zoyUeOduBghW5ylvc3Qyj7s7nFz2/VY5VnFd4mb3EXuW40w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxYN6n6IVnSNqm7+Y77m+Aym8O/zi9W+KYJyC1JWpqKp8+8ix3
 9Iimd2KYsSCgM57127MzHT1TU2Lt1YJtJ1/DP8EHgk8wClLHOpFxkpHSyALXtYA=
X-Gm-Gg: ASbGncvD2Fnc+M11AjkQWRz7P88Vo9wvJTsmi9kUEbrRfWJ+wfAGjlf3gvwb0ifk4bp
 +FZmql2xgHm36PKWYUdnaoknnT4UM0EhWceB3Vwx3/g8Qdey7f2iV1jyTmuPBK+cjCM/GdjQkjG
 ZzuSYQKNIn3zsFeV4q8hYkaNU/5768j5as5grxKoVA+P8pW5uTy1snHc0Z66GXSZA7Ok7i7dLhv
 wYiexBsWkQUsmrjEb5zjc4o1nAK8I9EE+FwdE8lmrMs9g/5aXTR/ufNlBISNBdnH1j2YhMKT4Wd
 CmDChb58O8HO95uNWmBdCBq9zwPax4DmYY+dLKY2yv8zX/s=
X-Google-Smtp-Source: AGHT+IHI4O5x+wPPGV+94eQGC4Hk/EXR2vmceT21i5pvhTSn8o+7MxvxGNT6vfB1NACqkNwl8RvUag==
X-Received: by 2002:a05:6871:7286:b0:2c1:4146:c556 with SMTP id
 586e51a60fabf-2d526d6841amr2433872fac.31.1745006394498; 
 Fri, 18 Apr 2025 12:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:24 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-5-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=lY3P/BHYMrMzt2KYi0LGUhjMzgl6dv5K0V1qFBaK3Yg=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8EXey7ghkTICKkPtv4/67AoklbnfdqMoKh7
 TTWqGpmphSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvBAAKCRDCzCAB/wGP
 wHs6B/4sTJvHSSz6HmN4Jpf1hTnTzsCIHEnlOXlpjG7Pghs62u4n3Ku3uOCaSRMJmW8aPzERMxP
 EjQlPRX6KJhN02AzJJoLomnrGGAlKj7GTMshKYPld4I1xWH/wO+bvbTFWweAMtCYcz4wQfNoFMg
 cwyrNg/zAqQRG3mlYiQnk4s2TJ5+eite0qbnYZPq7xEU7Ky8GDlFTjYDwSgQ10AeOc0vqOIzsB8
 kR71fIXS76ZP1eN+CPrzVIJrpUKXC8rZ7myCL61/wGjr6qdg4OINWKinpTupJdCvUVcKhD3/6GE
 fMhBvDLohiP4ePwyNH53ZIr20gZKjtDb0cKa93njGvhC4hl0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/10] iio: adc: stm32-adc: use struct with
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
 drivers/iio/adc/stm32-adc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5159908a2a6100b62e5e64b2b469378ad778c35d..81df0d45784553c87c92995934884138939ac899 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 #include "stm32-adc-core.h"
 
@@ -261,7 +262,10 @@ struct stm32_adc {
 	u32			offset;
 	const struct stm32_adc_cfg	*cfg;
 	struct completion	completion;
-	u16			buffer[STM32_ADC_MAX_SQ + 4] __aligned(8);
+	struct {
+		u16 data[STM32_ADC_MAX_SQ];
+		aligned_s64 timestamp;
+	} buffer;
 	struct clk		*clk;
 	int			irq;
 	spinlock_t		lock;		/* interrupt lock */
@@ -1447,7 +1451,7 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 	} else if (time_left < 0) {
 		ret = time_left;
 	} else {
-		*res = adc->buffer[0];
+		*res = adc->buffer.data[0];
 		ret = IIO_VAL_INT;
 	}
 
@@ -1559,7 +1563,7 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 
 	if (status & regs->isr_eoc.mask) {
 		/* Reading DR also clears EOC status flag */
-		adc->buffer[adc->bufi] = stm32_adc_readw(adc, regs->dr);
+		adc->buffer.data[adc->bufi] = stm32_adc_readw(adc, regs->dr);
 		if (iio_buffer_enabled(indio_dev)) {
 			adc->bufi++;
 			if (adc->bufi >= adc->num_conv) {
@@ -1858,7 +1862,7 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
 
 	/* reset buffer index */
 	adc->bufi = 0;
-	iio_push_to_buffers_with_ts(indio_dev, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
