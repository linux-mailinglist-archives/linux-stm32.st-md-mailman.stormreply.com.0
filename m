Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNCrDn4GCmq9wAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC7156300D
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A43F7C8F28B;
	Sun, 17 May 2026 18:18:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F6D9C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:36 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-41576c5c01cso1106712fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041915; x=1779646715;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
 b=iCN09Nmn1P53vc1p+Vn4DlmogXa/iVJXExohYuzRCDy+eK5cRtpbkphSI0vZ22dS4U
 YZOdD8PsKRbqPGHC7aAmi1+MsJWrzZkEUTNH8aQ9vmIbt/rsGD+plJef9/Ad5iwyyh2W
 m9MVXgjEOVEjxvlqlmv2rMNMBAQD+x3Wg8bWUmGVdwaZ2mJMnz+c4nct3aMUV6k1K4Go
 bdcih6l7T4dq6LDQlNc6AhcCELNCQRj1dxsvFmQ1maQAg4px0JN0JnzB0wB15W1jnNPE
 Vc78bs95uX2NOTIptvUI5SZ6nEc1Na0p8c24jFmWAu9P/j+IA2TsTORdEfjji+pEKHNG
 N/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041915; x=1779646715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I2YBZV5VY50zazhprv+CHf43mI977/3cuLsJa6SWAdE=;
 b=Iryrw62kTp1B/ZXFZy1DVDIw4cC2zoIZHzE5FjDHU2kORbjFXASCY/dfg3X28z30A3
 Ps807vl/mXi8xn5Fph8FqIJuxxxQyIqoEzDhNJpdgbK5dlJLEVj4LpbFDkmRTJPBqZ8W
 3HLNOKuW9cKiGc/Vepac6H2RUcOXgoKzKJJ6PEkzDFjw2jHe/cqbIrcwWT7ikdodbOab
 cUXT8GG19YdAtjQQdOWOKj89+xHaoQ2+D0XlX3mQRM29kS5fmMwWQKDJhwrp2jr+cn4g
 Ssf35nnaaAktzetRKVnhM7Q+AmMKIwp2m5ai6izXiEbNVLCwjTv2t0oFOd3l4LTufxwY
 TxvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9gOE6XnZW64M5AR85DwHRd5fviMjgynqL7uupRLz8hx0w4pYL0EmNz5htKbg8ZPpij/0EJqVc/279ZBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrgzRT1QoWOxqoK75UMy200hSdfAHx+EOiL6k0KxxacruJzSZh
 d6LwZ5MKTZTF/LwavoNMmshrQlhmS8kCbUZQPEYTbOsYp7IQ2QYSy926k8kUbeLkTis=
X-Gm-Gg: Acq92OFfpVkeNhG+GLihN7Us/Ssl3uDN91anvAoOHyMvMtzC6ZikSxZhZ/2bUbjkhz8
 SbC1Qb4Quh4k0bg4+bx+dewisse9GG4N+/up2wB48tvfZFrOrqWbkgQN2rYlryOkIKZBml66LAn
 usmT/yQGyxEcx5+nGgqTpn7NNePYg28FOiIQGO5hs61awQcfXE0rBfZFomJbqVrUMaxUp92vt3X
 V57JoXxv21sNXjHyLwGtympwqorOhlHj1hr2L3HeX0C8FIwamxfPcSiJp+xhrM08R208uV6JRp3
 f/U6A9eORgq5V0d59gx9ANyJIMERU4mJoVhoXRG6ESebr6V+jHEh40ZnCs2VswE0e/YqggLGY5/
 S+bafsH0V/amX5gXj++YSDLgZ8r4WDWARZIKnq2Had1aP/Jm4mJfWyjyjgaY2e35XqtOIXqjzzd
 SiT+zAplzdQ2zGCwv44qf62KDH+g8=
X-Received: by 2002:a05:6870:249c:b0:439:cf80:6393 with SMTP id
 586e51a60fabf-43a2d9e7bfcmr7616057fac.14.1779041915129; 
 Sun, 17 May 2026 11:18:35 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:23 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-6-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=iS4Jf6/jCwjgAYz7f9Ed6IRXIvpMwekq5NKW96Q/f8c=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZY5lNWSWQqxQfk4uVR1kmyHsPoVsVNYqIx+
 qnGwFvJ+n2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGWAAKCRDCzCAB/wGP
 wPePB/9RG04S1WGAlHEaFY+gM7XX9kJzGfYQvsVLrnb9HziWNIBAox4TGSaD20qYJkSvGsvZU9u
 1Sl57NFRld907Z4ohEajFprIB5hxn76yqOQFag/p4BnUDTBIokjTMi/SQ7+FIy6EK9/q4oT0wCq
 RRZQWdwIjdANiLo+eUBFPSDrslKvprqg6kgLwku9TCLrwbplgFed/uOiDPdZEBoGtuMq0N/CMkA
 FABssCiGug7FzwbCfnfJW8Z5c+Q+DPClR63Xbc2tWTRYdFtuKVf+SIJHb0QMaazTaRHX9ew7IzN
 bI2icbiholgNnAiJFhgHwR6XOd7ByyqUTiseleiH1zZWvil4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/8] iio: common: cros_ec_sensors: simplify
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
X-Rspamd-Queue-Id: DAC7156300D
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
	NEURAL_SPAM(0.00)[0.742];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,baylibre.com:mid]
X-Rspamd-Action: no action

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
index 6e38d115b6fe..802c811dcf75 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(index);
 
 	indio_dev->channels = st->channels;
 	indio_dev->num_channels = index + 1;
diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index f34e2bbba2d1..bf49453fc051 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(CROS_EC_SENSOR_MAX_AXIS);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_SENSORS_MAX_CHANNELS;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
