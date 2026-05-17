Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGWEOXsGCmq9wAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C50563006
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97232C8F28B;
	Sun, 17 May 2026 18:18:35 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E012C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:34 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-699a23b2b08so333231eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041913; x=1779646713;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
 b=nIHKsgseeHwaYzOYHkX0DGgXTwLb6kgjSqtOg1LCNwERSJhBSLDyDrN1c65PfgCFsi
 kcUias76l/amNRNc0ueZZ9X/mzBowaGF3inc94FwNtFyH+TIVCyRP8+5Xhg7SCk/v5+S
 q5mJfCngJuYsWovPy4xoFzH2nfJJexJ3qUDsSnmrmvL6S3DJrFjJ3lGWe2rJyg06QBAV
 QCx8OfWi3A5ayJXKaP+PB4FM0Xmf/eUtCVlkirfu4uiTpNnvU3dgEQaOP4+T0cNcZ8tO
 +UM6WCze7EsytfoukHcOtflHC9clJwHqBdbjQipubvgCDK6bEu/ksnJqNQvLYICHdK5r
 /GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041913; x=1779646713;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bsMbxEfC0uMa+kHsY4taTb0VH/LIItEw6BfVK+qBf2E=;
 b=EQsaqeNOjOhyuxQldHWphTXWtXuHT4FowFEOOyyhmBZxISCffsdyp9PQeK+iRtynN/
 74N26165mKlk4TLLXZKER3sZ6t3K71fQUjDUeRpzHGNR3h+qV6XvHUcbfCHaJzUWGb+H
 lvv4iPyKSxeZEM8TvS6jFwHCmC/RNyJpZ/XcIhwru+lTrz4RGD+LroFU8Tgpbg7TsN9t
 bu8+gwDxyD/Dh7aEa9wSyP7EFQfZT3/l7eZD5iZtx9UOqRuLTmgpGWYUkgHdKHz4l6Ef
 nyBnQXS/cQaFS38h6q4fzC2MQSv4N4TnIFXm+FdQZO6WJKg3kWb8lwJzNuhZkc4HJ1NQ
 JpQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TmJFs1CSL/FKJbN9t8SZi5xJqcKX3ge8Cn5PdwHn8IvF1jk9mcLjROcMA6xAHZYH2ASx9TV2vsqnO+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyZtIyBoNr6ENCCSxwFqDGzNRWbVQOKx9EfFidTIfbtks6yrPTR
 AsF7fyc8IaMLO1W3x+k8t0E8uGTulD5tULySduqCNj4wFQy3keH5vYkc466u3uIUiLY=
X-Gm-Gg: Acq92OGnHKBevXyo/sUdhS3cxSY0ie7YDw9fY70ppQJfmTCK8ZaRji7mkgSx2EWPXXW
 zGjY6478kTmHJ3AB/unlSXh6hZ/Fn7vMB+GfNwJwJDPzsxCM9TzQRPVlmzLhUl2lqbpywLccpna
 mdIJfKKRaMoYigAF2+P/SzLOYA9r50F4RSFwmz0ygEj8TfFzVF6V3rt5ccWEDuGZxQ7hJJGnoDk
 CEmE7WxP1piRNBmyIuZVy2V03ywBDOqkzbZaXMTq5puqD+mr/IKyVgvKarbSS32UonrPt5am28g
 KCrBBWsRwlWCpuj3vmFm/hqeiReYHfjtUbPvr/7p7QeT8hSTuXOzKZ/xXpftVcteuDBC68xbEzj
 Kq7lHly7noRAmphiJ4jjB1u++qeGwr2WA26pJ5kY7hAxKM19jK7L2RnPt7xqQ8eIv2fM+F9XYsl
 zJaKMVpSIoLbjBzcaKLvnNRTxBcdk=
X-Received: by 2002:a05:6820:16a6:b0:69b:196a:de62 with SMTP id
 006d021491bc7-69c94377590mr7647901eaf.27.1779041913148; 
 Sun, 17 May 2026 11:18:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:22 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-5-61fb908c11c7@baylibre.com>
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=G7Szwiws6C+kXgCk6xisivu6OlVDwdV0dSr7Bj27sJk=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZRVFRaQSBdSkHoxJ6yR/B8XlsRDlUP3cMKz
 CVIMrFdEM+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGUQAKCRDCzCAB/wGP
 wOtRB/95xIxW8VGaKMif9Izi7JG162j0YqsXHso5T7C3wBxKCbha4uf4X+4lM2uAPDCUAIYTa1e
 hRZUTSXFWZfvnvqS+25laf5z31Wa+ybT61fYxb87EXbWlhwPPlfS/BvXjYKeWljsJNw+/VvC5cE
 DY5MR93FTBEW0Oy51IA+PzInlkVDYO5NvhgDF4UBBXxQw9UdzVO1dcHe5f2Uv2NRgPokVx8OX3G
 +70ao6CG97J+tL6sk0SbhbajYAYyM3KBEQ0JsuymiWfyKo5HvxpGtSjjB6wk9WjOYQ+sKnsnxv4
 YmYMoLuBNLjDgWWPLV1doL8ycCy/rp+0lVvXbLzXCC9R0pJh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/8] iio: adc: stm32-adc: simplify timestamp
 channel definition
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
X-Rspamd-Queue-Id: D1C50563006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.717];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,baylibre.com:email,baylibre.com:mid]
X-Rspamd-Action: no action

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..bf68f28e7c3a 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,14 +2443,8 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
+		channels[scan_index] =
+			(struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 
 		scan_index++;
 	}

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
