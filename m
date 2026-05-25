Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDDXBmmoE2opEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02C5C5331
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8031CC87EC4;
	Mon, 25 May 2026 01:39:52 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC317C87ED4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:50 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7e61da76fd9so1073276a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673189; x=1780277989;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
 b=SABp5pXDSuc06GB7r6EJvwvPSEr9HrIew0VoHBtzPkb24v4xiuMhN1dBK+3P3Uo4H5
 jljIZlhNBp504I3MzyX5u2NfXN7RuFnQh5LfLcLcaDaAsSdOanrnDDfIAl5w13I56ko9
 dP6j+3vgvsY3Ron34NyfDRqwA4B3hA2aA0TgHHQtbjQjqTJoFJLUvC28Gs6Qh6Gv56VZ
 bCcmgKAo1sDpDFKnsK7bIMAr5gUD0TNSBYs9256rTNfUC9iABProFRl9lh/EBtmZL+BM
 bJTJXY6FWtjmypH/VDUoR85wmpuvXbxpQQWfLn7irCMkh1op8bOj09wmyd0WetmOK1MO
 pk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673189; x=1780277989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OMUE3/7kINiPQNa3IbX9MLqOrJoUgIbbeots1aiBMpQ=;
 b=nGG7OzW8dioo9S1oWIA3ouZru5ZTw3qc1SIBO/wkCmMQdzFY2B3z17jsjULPY9iYLd
 KidERxZ/y832FWEmc5WJbHSZsXLctsEu/xo2pWQU3bnqwBM6ER549vi/PY7nAYkt1rzf
 z/mZP5UKwLQmat604x3tT2BmHtksIDPceDeF+MFIUFq6VQNJ/M7LDC4D0qyG0rtTFLAK
 t2ASiD6iSXS0NzyODZKIcNPd7/y1eurIJorSHnIuQu7D7qC1THN2y10OcQ1BQ2QsgrZJ
 oPOY6Lfn+qAGbny+cwaRyysE+mgk430nFmBEFsOleCQw/P5tkSWiTHaeBYt61slFVb06
 UsgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SjRj3zdL/UkpRn8DjUhKcUz0JQg4WtFKO9zv8lfcQtUIZ3B1v3gkBKep62u9vOYiWg+GoVDlCiabrag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxOK7Ns/yBdwDD8pq+i9A0JGUlVkpI8WZwZd/iyaqo59rUiXQXW
 FK2XE7m4VhPsogTM8v9i2qzkssueQdhXSToAB9+bTZu+pFnHVUtS2sd1m6ezqdkr0+8=
X-Gm-Gg: Acq92OGF868XcRe/cR+Wg029F1IL1aEeLspFdsnNOGJ2vJRcbGqu6Sx6ZizVR40I3nM
 S1pERK49BBGpgtOH/b60f+K8TF/Fgeu5T3RxJECioBUGHbVrkxigfWhDWOMlNy5bwyatSjgZQE4
 HBObfZJzyGNR08PGEU+mILoQHNh6uFqBCeUHEnJNdIBUH3GQycNJrAcGycDExkiing8SdTHUKAi
 WVOkxl54kFcMDbKCAZFyjhdpvVnhF4y6lL1cnRK7wBJ8cd30Ez933jRBTR/EY76lroZK/C+xNAc
 6uVhEN3IEJjGd5bb0MYO9CcWUYTjxLkEGb8N+GuG6HB4FF2CXFKlaQAQz5smQXWZ3H/d+minNUI
 uacZEJzvVGaWgGtwcViQhdH+VGt1QfogiduJdLs5PaPma1ovsZIcbdJpU/3a/kTXWPJ/3xm8GyI
 zKzitnZ93SVcqWzh4Gqv02pFqgf3A5bEdnbVZMfIB+82pVEP6bcw==
X-Received: by 2002:a05:6830:438e:b0:7dc:db3c:1d63 with SMTP id
 46e09a7af769-7e5fef8778bmr7211293a34.24.1779673189590; 
 Sun, 24 May 2026 18:39:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:49 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:35 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-3-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=au3KpLqYbepgVrQAt2RX8cSSLgzx8HL8SFAfmcOoutc=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gxGpINpNsbfXFkHrF+BjDlueBxKNBZdolVS
 wzGu4LBeumJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoMQAKCRDCzCAB/wGP
 wLvKCACg/4GawBxVUGhqi1U/lCBImoTuAHgKA58qiBGlLscoWThFgoEqehSdU1vluTATvJPVJ/K
 NVMe+3HlBGTZh6GZAkNWuxDKm9UU3/i7rMdPqRprTryF7XmJRy7erIWRS18FKuuH28SSwe5PqTH
 pI1+U6/YZwgRhnxI0QItWzNlicfPd++Q4bY0+NYUpeiUw6X1UI5+4c5Nk1+nOen0W9Dp02eJN86
 1ZFb3HpwxHPCUDld5p/mxWNeOgNQ2WqmCRdbUW1LsUBwRtXoVdrvXl7Dp3gGzlrDoEZpQXG+06a
 Mj8/bPi9uEawWuM+whYNIKUpoNvmPLjYStWdmvzai+z5laQk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/9] iio: adc: dln2-adc: simplify timestamp
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DKIM_TRACE(0.00)[baylibre.com:-];
	NEURAL_HAM(-0.00)[-0.518];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:mid,baylibre.com:email,st-md-mailman.stormreply.com:rdns,lval.channel:url]
X-Rspamd-Queue-Id: BF02C5C5331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b01c6f5a73b1 100644
--- a/drivers/iio/adc/dln2-adc.c
+++ b/drivers/iio/adc/dln2-adc.c
@@ -444,16 +444,6 @@ static int dln2_update_scan_mode(struct iio_dev *indio_dev,
 	lval.scan_type.endianness = IIO_LE;				\
 }
 
-/* Assignment version of IIO_CHAN_SOFT_TIMESTAMP */
-#define IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(lval, _si) {	\
-	lval.type = IIO_TIMESTAMP;			\
-	lval.channel = -1;				\
-	lval.scan_index = _si;				\
-	lval.scan_type.sign = 's';			\
-	lval.scan_type.realbits = 64;			\
-	lval.scan_type.storagebits = 64;		\
-}
-
 static const struct iio_info dln2_adc_info = {
 	.read_raw = dln2_adc_read_raw,
 	.write_raw = dln2_adc_write_raw,
@@ -614,7 +604,7 @@ static int dln2_adc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chans; ++i)
 		DLN2_ADC_CHAN(dln2->iio_channels[i], i)
-	IIO_CHAN_SOFT_TIMESTAMP_ASSIGN(dln2->iio_channels[i], i);
+	dln2->iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
