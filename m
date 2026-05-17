Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DTKNOnUGCmq9wAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A115D562FE8
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A375C8F28B;
	Sun, 17 May 2026 18:18:29 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E216C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:28 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-404254ffe8aso1347210fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041907; x=1779646707;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
 b=VcU/jgatw/ROGI2pocslbL+ZZq8UnyL2uMF0LsaZr1ycta8p/YynNBVeWSGl9rgVQA
 EabyRF5WnO2VssPj4/xO9HUewHyPbxdVywhkOXAG57NPeuGlNg5xcDgcfXY4PWvDfEXe
 UzWV/+gZ52z+XiHvByGFOitH9rekmwEBlj4GuDqtbrqAvyKw1OAN2TyiNPf2C2CIbvtl
 dzhLuYGiAzi0xS4ofzRrhiA9ZXqBDkk/xYs46mV/CRcdYFyaipNCfuD4N2D3kBj99fIE
 PaSz1QuzIGJABSJ1WN2CtSFy99CDWvbMEPPqek3nJ5Mu3KecXhTzc9shWxXnZNYGIO75
 L8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041907; x=1779646707;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8MRGfKr8H7ah4yZfqeoPinkYJCKeiXt9tjcXW8VOiYM=;
 b=mvbxNTrOeAjPoAJItzAnrN88Y+A1nkEKum87WF2Q/ppomCcg3/6QY20Yt2dA0KJZ1J
 GlY+xYFlNRvFqtpnkUcUqsgog/m/b+cdYjjh3+fnoKpTEzPdZPHzvSZUwrIOCGBtam8X
 MhPLqeq42QWlJq6jmn6TtqAgmIs8CaoLbIFZQ5V3E/e8f7ctuyRV/MXJwslXrzxW/QMN
 EMCn8ZL13NK1vU0APK7evX9YDEh9YTaSB21aFMwDSt2J1abIe5xkIMxxcs7XcXziMkgX
 LEmNSpULfQF+XMnPo3tzN8c+UFThQ3pmeq83g1+2Qea8S6JMPGWa0vm4l/QDhMMVV+ug
 EE+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ88TTRRXURlbAKwZB+ahiqV/VAiYZc/MZhhzBT0Ra5jLONDhIJlqRklg9zTnR83o6OWSheo+/mYpZuRDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwITf6TUO5UmOr/5f/XB/P0O9zNYUUVybzKsfyxzyyL5akDVOlX
 3gha87gxUGDYDdGjKhLM2CnfYmwbidZK13w5L4iX1FlBK+WpXpDJsur9Mti2f2ZndUU=
X-Gm-Gg: Acq92OHp6m8uC6p3eAx2PUbTdFTuPUSIHkgh0yAur5n0bewiC6BYirdvpBX62qfiKfs
 BPK+D3+YrkKGwVDyWDrDNgo9T0qMPa+bhIw9qvHGqhcJMcOrJQaWFs3bdMYE9bYNdZAw8ko1a8C
 oTxz9LzZstvoek36zaCeGrcaetABP3q8a4DRuzdqN3ndoFdv0JYPT93+SD4gelGWD7o/q+kpy1o
 6he5b1r+UfzU7Zc6HusHP1VYJeEhBLZKiMS/vvekyhHmLK5qJt1L2gxtuQFZ7wmI2XuP/wMFSDU
 7TGSlLhUT7vB6GRRx2rYkEw0F3k9cdAiiSe9BAIb3+S5b1dUhCeyp/JOF5KERxI/3AFlGjJyhwg
 Sbq52gdYC6QLzTAcNv1NvYuhS8GRtQ2go5HRAIqf8jhc9RycIRNCN1quk6BBuc0cDAELDGU3Bij
 6wxx9XQvgi+I2yaZKasrkjflhXRNLkD0RWkDiNrQ==
X-Received: by 2002:a05:6870:1797:b0:435:486c:f2fc with SMTP id
 586e51a60fabf-439f94bfe19mr8687343fac.18.1779041907408; 
 Sun, 17 May 2026 11:18:27 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:26 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:19 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-2-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=BwNLo5FYKl87iXnoZu+CcTxTzv1iNen3r6e4SjxMA7s=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY8TJDJ6Ft/FcVQ5VpLbl7I3sreJsrciaZuR
 YcR8uAF1CeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGPAAKCRDCzCAB/wGP
 wOqBCACLIOEEYmguYfD2EXtVfXwCV+RMMhWS2cj5j6FCUGhFAIT3c6jLdr4I9QvxORRNbgHFE+u
 8irHHh2DH8okhGX6jVbG4CmXaHnJQcresATqKmSXGuI/Y5g3mOXB69I/wgkefbvup1uazdswGAW
 GrFSQL0eYVZyNMZMWJn26wexmzWpk4waVuT6s87rOiIC1MGPCIRk7NO3le4sj8d9E2CWCjbycgf
 xq+7BVUqhUVWXYT2gbdFFdHRY2mFqcvldot7KGVW+0OrVUJd9I2oXmxfZ03O1XH5KNKNWA5CGgo
 BnO79x5kMgSBG1qUGXnvKcYFIOAi3JCqJz0ljFkZHqE2o7tV
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/8] iio: adc: dln2-adc: simplify timestamp
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
X-Rspamd-Queue-Id: A115D562FE8
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
	NEURAL_SPAM(0.00)[0.558];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,lval.channel:url]
X-Rspamd-Action: no action

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/dln2-adc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iio/adc/dln2-adc.c b/drivers/iio/adc/dln2-adc.c
index eb902a946efe..b7250fbe4fae 100644
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
+	dln2->iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->name = DLN2_ADC_MOD_NAME;
 	indio_dev->info = &dln2_adc_info;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
