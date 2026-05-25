Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPJbAXSoE2opEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:40:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB15C5365
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:40:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9EADC87EC4;
	Mon, 25 May 2026 01:40:02 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F934C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:40:01 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7e61da76fd9so1073350a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673200; x=1780278000;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
 b=VsOh7ucdN+ANkNSoL6f/zlZ/Pf5CIR3HB5I0+l55VzB0kok2O1MV5jKbmzzewMhdlW
 LdLdfE2c46doDZxs3dDE2KP3tCs0NQWqeUnBpkoFzxGuPWA4EQub5aC++nyDZaNNTdsZ
 vzSCV2Pg+67Qhlralhrtpcm97Ov0XyeK8SS0P0Wk7T92fRY6cwhfVGSdSBLmdxjnPnwg
 AQc7X0LYhIEysnOkfkwRyqjiiEDnIc/norZNOrWfeV70QsqBkqgorJ8bqDEtsfFSJLlS
 ZZoM1zo2tsGKh1V3eT765CeklvIsBH+KPrmoTZcwkYRfTrXGpaDijxMEy/M5u/Ay9RR4
 OpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673200; x=1780278000;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qAuC+S48oKndwyYOp8JJtJ7EFoaTestnDBoMKOxyMfY=;
 b=S6fG3+kkaVapdfYF7OSu54ckp2CPqcNi8v995Cu36l1mr8gndvu3mKOGoaG4Kn0bG3
 XSQKIfE6swd/gMwv7Ri/yPOoBtiwjvy+vcZ5MOcsAJcIIIpu6BOv/PN+16aNOqQCWXl+
 cH+1B1P7Y0m1Xozr1PZjFpOfh68f4mYxAG+mbyp/lXq6BSKih78Wxosf8TNHVSW6euon
 RLP5nHceqmVDp6BtIChc0ziBpE/RKxCAnH41E8i9sWaisySKKGSXidHtT+JeMMYzNR70
 8swPsdC5wT8QLvw2WsWBGykgu4d7Bz6eESAcqUg8GdGqD5zkOayk7XuDH27YdBsaHsow
 egdQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8iiESsd2XHoGNX9hmBAGQFDxC3f5zmduHiIlDLgicxQfDCGhH2fOc6HFqy2v66EBlpuotJN27KjxnDFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoTwaAY4JOoiXak5DXPdKsowVLHlJNX4qU7MTayyjXGwxG7cEG
 67lDLvUuhxDKP1WjVDcOTtBLyqtiw7B768N8WMhQnctycWooymH/yRkDgDLYHe/V/5w=
X-Gm-Gg: Acq92OFnz8eHQI+KwgC3OsgjRJig+Bi9SUp27gmtfHk0FY7F/wXm0SpASjJ3ae5nvPz
 ue7d3hZc5DHhPiHnHA49SxmTqKLCGv0zYyrqTJBxuo77nS7r2IqswhjHZ//Se6U5Gk/RxfR2IGe
 ZN9CFg2usDct6nyNaB9VJ57WgbPJCuPoLFTV9CVpY1RuuXtj6DDU863a1vaESZfl4RyIEKNp47w
 a8DAUm5kwHu92BxVX52raOWZE+m8wJEwruyo+Sdln0Hj8X5EejuwBJnU7szBwFFd/SFQS8sg6u9
 g+ADJuI9JAtHiv928lI+lfvH9hhJNF4VBr1Xs+RI/vtNivxNIKhQAkKe7tO6/VYeMW+m5q8+CTx
 iE11AcgVZ8TO+kGM7aIxLPSUOlXbS0s8Fvbros0B4QSYnpa7X7ykLOtLn96wJhKi8qEGYMlPI+f
 /zQPD4MCcul07nZIGblDsEIZ0JvYa+FVXtDKz/eoI=
X-Received: by 2002:a05:6830:6182:b0:7dc:cd0b:58ac with SMTP id
 46e09a7af769-7e5feda98ccmr8635037a34.9.1779673200405; 
 Sun, 24 May 2026 18:40:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:39 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-7-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=ZT+q1uIcB6+NTxZJlpCOAl/a9R7GwZgj1SBW0pmx/qQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hM39CnRhd7ZB2gP19BJ4GLnYKluJq5+aC4X
 i8XRKRITNSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoTAAKCRDCzCAB/wGP
 wAskCACfNSL5Vz4Cx1MbQaKk90iMp4pl1QLQYrJOWI95BPLFaXenWsYkLPkTMIjVPhfG9LBUqi7
 BIIzwLhw03+63ZtMhBxMIK8+lf/QcMewhBjifvxlt35sb49gsX+MVkKjUhZf3NYHeBjw49PiCEo
 2ek/mmaAv2Q4Y768kMkOKz0BjszAZSWygmYZBUKEO1pYKXECEBGTz+eeGwEuHrqcyw/kb1nCQ/Y
 a+oX3tZKu7pSI2yIoR8FPd9ue+uDqxisYZFGiifQgGkD+WoXw07zgBvRLEvYmJ9WocRMkN+iq1w
 GG6J7I+0XDN9HYbw17EULER6YA+vgzT6NaSrOGJYjEogLbRM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/9] iio: common: cros_ec_sensors: simplify
 timestamp channel definition
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
	NEURAL_HAM(-0.00)[-0.706];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: A0EB15C5365
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c | 8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  | 8 +-------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
index 6e38d115b6fe..6762685e6876 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		channel++;
 	}
 
-	/* Timestamp */
-	channel->scan_index = index;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..651632ccfe0d 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -279,13 +279,7 @@ static int cros_ec_sensors_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Timestamp */
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = CROS_EC_SENSOR_MAX_AXIS;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
