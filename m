Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDiXDIQGCmqNwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B556301B
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1EB2C8F28B;
	Sun, 17 May 2026 18:18:43 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22902C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:42 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-6948d7ccfbbso415463eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041921; x=1779646721;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
 b=GCc5+eyxUQOus8xl9rWEFT2UMHxlt1t5sjGN4WDWwJ7aJY7rk7IIqdMPiWRwedueY3
 J/LqFqwJettD/6h0UCnpXXlMgMXszy4moJUWBnszDOR8hsrrxVcYRlDRZg+BgtJnDpU2
 PgV5OYmrOjZYxtgzT5h8L61NcuuDrPpzJtruTU0xZ2aTEYzZ6ZHOumK4Hx8nwEJiZ/wB
 Lg5IZ5Ta9nrUAz4KDCbTp5gFHhN3p11vlDlrHYzYf5JvAytYyPe9A0TTs4h2aGx+/n1D
 EQOthD8AnK/++FEST1HU4Y1srX6Crvqahtxr7DT4icHRgkoD91NNZ74vrnYbzolwO5BP
 swBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041921; x=1779646721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nI9W/EpiOktwEYbn/tmzmd85CheUFzZnXvaR6Dsbb6c=;
 b=HL8gRPb7R+GlXSqWxK4/34Fril2U5ao5GxYiKnkETCHmZlhUjGUXvV3PFndPRGB36a
 lT5uFH05NHtLDap5udo4kakJELjxkdx6fyVeBLbR4FN8LhHLsx4kCGyAR8rjTf+x8bIr
 oKTBI8NLxxJC8Rsi3NedU2p7Y0EGuvl+xLa97rizSK6BGnJeE2YN4N2rSzZJQ2aD4YW4
 R+dNp3TWDi/U9pnYackMufXYSEshp9/iaAw+lBLMGVbYe8tXmzQNA+qY/Q9xjMVyh587
 55eO4AziCSHZgayCqAEArctlBKVn4sz3mMgVKUTNrvhVJj3CiFIhuFYQkuhykZTvaa5z
 i3qw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/U7yBv/SIlWZC9GmhM8aEv4m06f45/eSsv3qv22e1bDwDe/45fNI64B3UlxVLUZ/mcMidqdjp8wf2cyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyN19TJUiCxg0AhET/lOxkj2dDhof5M1nhpo2GiwIiPnlOBExbM
 S4RC2vqEa71rPiS/vxo6fZNYXH+QE2w6/sCFwRyo9uXkQ+yFan7dBTZV9aQYsOISNJA=
X-Gm-Gg: Acq92OGK8nZPolCzDUE62vFolcqADVAOantmIo0s/eHElJBJJQqNEdsKTTYKmxe0rnM
 9mcybS8iciK53JBY7vuy3nZBRZC/76pzwDcUNl3+4MQZ+BEi0VOJkudrWT9lrXC4TKW5A+Y63BW
 ENhG3SfVD8aWPFhcofby5+iHq6YLT/jklxC0j82mPM+zzZnDEjBOVo8s2X+U34DdXCxXtyx2THU
 WMlMLTaqZ4qv4Yw+ijBdyj503C0rQg1beOOtSRwYwwTVdQ6UcKtv0vP4oOZQTGAoQebcIVG4jDN
 525nCqIuR9ZuCHcokL4Soh/GmEJPVbTXaKIDaefE5tNnr5R5/iC1uGhRj5KwNjIJm6LZ8FY/q7f
 wQbqJkuFHHRmV1d6OvoZB5kj5n/M/+sdhA4ZaLD6GMLlSOUKvuWrBu3zUZJMYqcsdH4XVLyp7/a
 26IyaKeHQHoWI8koi0zfwHRHD0bfg=
X-Received: by 2002:a4a:ee08:0:b0:695:818c:e552 with SMTP id
 006d021491bc7-69c9c05b9c9mr7284877eaf.55.1779041921012; 
 Sun, 17 May 2026 11:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:25 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-8-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=wEIJJfBuuiW6SgTlxZD7EP4tAEv7nIycNrSYwH0kNGo=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZl3bTfr9cKcWM0WeSP7fcRq1+d7XYc1F4Xo
 RfDj35AQXSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGZQAKCRDCzCAB/wGP
 wCfGB/4t+2/7CSmhBVt8beV0zuarKfbCi7dFgQWBJMcDXDyATSw1geVjvr3oVWj41/EraJRsc0P
 yP14hy3N7EI9S4MtFZO1OXirmeuqdzAruQ9YsX8BXEsAkb8yxjRm9aLhx1ODw/swqjMF0rO1+qL
 VG14aCHgmOlFOlZNgT1MirGmj7wCjcn0FMGLgKR6eCLrMrceSAwZNlPjf2YLbtjvaKCBZT29m9h
 /oqz7p7LzT5A5Ipa5T9JKMUP4Vv9pMZRknOKxy2FqV3G7JTWU9YJn+ZkV/sfs/QhIzaKfYuh3F2
 kIvTmBUeRS3JujorXrnp7PVwsJ9fsL/CjuCUrNco4EmKWYp6
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/8] iio: pressure: cros_ec_baro: simplify
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
X-Rspamd-Queue-Id: 143B556301B
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
	NEURAL_SPAM(0.00)[0.707];
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
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..87eb9359928c 100644
--- a/drivers/iio/pressure/cros_ec_baro.c
+++ b/drivers/iio/pressure/cros_ec_baro.c
@@ -170,14 +170,8 @@ static int cros_ec_baro_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
