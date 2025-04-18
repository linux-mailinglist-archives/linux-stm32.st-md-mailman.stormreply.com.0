Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15945A93E7D
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 21:59:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF47AC7802C;
	Fri, 18 Apr 2025 19:59:53 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5133C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 19:59:52 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-2d4e91512b4so1165960fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 12:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006391; x=1745611191;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
 b=z9kZ8IR83sJumbyJuxENSt8xDDWQsYuIKnx6ZfbWyM2Icw9AO0WC3TDhX9f5ItPCDI
 N2+oeKk0Ui7xFfFyzPtIxnR0BkoII7kZm1UsHK3ReG8AOBpN0m7dFakkkjDR5X2hSa/n
 qqGonXyna8VMIjSfo0XzjVQGxNYsw2j39LcbjteKX+7rE1l8NOTcqo1AyyPXwTtIu2UZ
 hvOrFUq0A247lUw9MrtIGf00Bk1B9CbaMS4bOwUhFSgcA1rt6YalUos3a/4G0PFF9mOm
 Yzzk0VO455+u9pM1BO+MG3v9VWAqoxfF2YVpJseAKbxaxlwV2U4RpKPpVx4rTcbgldjd
 0nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745006391; x=1745611191;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsIMZendqa8DaCGwLwJ/VzIDH8OWSK+LqGllC/PCXxs=;
 b=Y67xlAgPsZMoIG7y15ug7lOY4ehzx+QYGXZ619l7Iv6rxnc2R9MHn118B9BcgLPE6k
 JKRUMjBFZxE9t7KjPww+RbxVcHRVb1BgmlEkoL8ymse+USOk8vPy5fHnq58kbTW8NdYQ
 F9WawwhQill1oJIfJkeZ6Ki8O1S1f3jeeXz2wevEoPG7uKTBlDSp4dC5FchkqcSDjXpQ
 IPLpd2x5JgtdY2jkOt5o5Xl/dv2yuOMM8rOfoB8g4gNLDICxgOk0jBZgWDVpf8u6v/aW
 T6iRO3s8VQxnwzrXhSjr+UbbEIt3dUBS67ittMx+kL4OErS0uab8mua8dF3aTxmreYSy
 7EjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeSequjvhxokSVtnxjKXukLEpV1drsGYawSTXsFmlZm7um0sSNze633AtroU3O8qFVgV3DpMHMnFJjqA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4MDgk/hogiZmXEDWwhJ5F0s+ZHd3zjhDwcZ0bPpZfdrQTh7Yv
 9cjIN8AE1P1bWjFhUbBZY9re5pmqHKbBqYvhFl5ffwcS0icgyFbsIpwdYnS38Zw=
X-Gm-Gg: ASbGncvXFsEqKtorf/8l0AkI7MYOZgxUSDciy6MBmHLORRFjbOIpVNcHsRRaDvYC4lP
 nHHWKq2Yu9V544vovN0VnEB59ymHYPc4bXIyiwzREN0X/9U67yT+63iN1uEjO2k7iNE3mlJWNhL
 W1IrPowLuG7YEHVp8Hn8fSNoI6SqU8gsHkVJaLa1M3WsxpYL+8lH3yrlHQl4nZl9O9jcY/9sJ9X
 u8TLar+w8B2duNRqd7dVqiHsN20v/H9LciY7uZ6y4UjT6kE7PAcEniTSvgBvNQaNdammDIZqruN
 pnqZ76No6LfQL3Uqpl+fYLW3Czh8K+c2lrbBDkYD7TWmMr0=
X-Google-Smtp-Source: AGHT+IGTd+UcoiQqg98qqmDzGZdASpO+rjK08cJZPLUbdLs/qVHjgA1d1/DCHAAtJdt7FeGJ2N7IOw==
X-Received: by 2002:a05:6871:20c3:b0:2d4:ea06:b11 with SMTP id
 586e51a60fabf-2d526974c88mr2268314fac.7.1745006391551; 
 Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 12:59:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:23 -0500
MIME-Version: 1.0
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=iRPzfo7zOSrCZBlrpd/I0/sbvP0TP23KOBXM/qSN7Jw=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq79D0iiaEJ7LNLOItStpJpxJqxn63IdcoEt/
 O8MZKI+HdOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKu/QAKCRDCzCAB/wGP
 wFryCACU4cYnN65V5Ne/n/6z/OCfHfoj4mdaoDqdml74vivWqgwTQqSV08oOzwAmNdPjVpxHSXD
 0nV50P/Y20VUEYVHpoJpuUArnFK3lj7jB0SBcX1rOuNCiqtNyuYHA1oH7V+l8/ctZyprtDBzN+k
 gK/IXGShh2E9A4LnYDTDmcfYOS8PHX4JG2NLolVn1LtspWso3m0L/YQH3GfD4+YmyH04/gl4e90
 s36RYJHqALm6OosMFi88MgyyV+9swKXmDAnPnEwmPidTyoIw8bCSdq43K+35GA+BJhDJof0YEmY
 2jSaIuf0L/a+vzPf70hFBbjXqtsIsUHiJSzg6uij9QXSqVg3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct
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

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mxs-lradc-adc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index 92baf3f5f5601b863c694eb03b6d8f287e4fe6ab..73e42f0ebcaeaaa437ba5c64ecdd7759a1191e6c 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -116,7 +116,10 @@ struct mxs_lradc_adc {
 
 	void __iomem		*base;
 	/* Maximum of 8 channels + 8 byte ts */
-	u32			buffer[10] __aligned(8);
+	struct {
+		u32 data[8];
+		aligned_u64 ts;
+	} buffer;
 	struct iio_trigger	*trig;
 	struct completion	completion;
 	spinlock_t		lock;
@@ -418,14 +421,14 @@ static irqreturn_t mxs_lradc_adc_trigger_handler(int irq, void *p)
 	unsigned int i, j = 0;
 
 	for_each_set_bit(i, iio->active_scan_mask, LRADC_MAX_TOTAL_CHANS) {
-		adc->buffer[j] = readl(adc->base + LRADC_CH(j));
+		adc->buffer.data[j] = readl(adc->base + LRADC_CH(j));
 		writel(chan_value, adc->base + LRADC_CH(j));
-		adc->buffer[j] &= LRADC_CH_VALUE_MASK;
-		adc->buffer[j] /= LRADC_DELAY_TIMER_LOOP;
+		adc->buffer.data[j] &= LRADC_CH_VALUE_MASK;
+		adc->buffer.data[j] /= LRADC_DELAY_TIMER_LOOP;
 		j++;
 	}
 
-	iio_push_to_buffers_with_ts(iio, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(iio, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 
 	iio_trigger_notify_done(iio->trig);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
