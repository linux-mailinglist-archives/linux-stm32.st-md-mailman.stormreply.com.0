Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOe6DmuoE2opEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9D5C5346
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA08C87EC4;
	Mon, 25 May 2026 01:39:54 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5AA2C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:53 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7de7c57b52cso8103869a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673192; x=1780277992;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
 b=VZlvshD9jTIuxplWOYsIxkQ1QjDK3Ku1lMN9OgxeqExYt6ocYlQ6RKuQ011RQajpmP
 V0TWt3gYnV3Bb1gvsBU+bg5J50DZgu0frx1VGQXuyVuy6l64bQ/GwE7VsPfTscEYjQZH
 vm4zdCvwkSL6dfuOXPnJVmgbkbf+1WXep2OVtKdWVPTnmpZuN75gJ2/LJsinzwDBYZVl
 TkjnuA6P9lqjmzLqXep5tgoRiXNJRiJjXTAfwNZOBwnhEVFBwyYfPCEskcgiZmcZdVLO
 flyBGpCiFKjbBBkanOfb9/LP2V9v/U1EgwupW0wBmACnZeTIblPJFi5MoGOtmMjwcZeB
 gYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673192; x=1780277992;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FkaH77BKXkVbsk7oK6FTHGHPATCcUs5m7bHAn/ge5ys=;
 b=BxbvVy/Fxzkbgm2jOjwJYVtetIdcHBsmrIQ9RvuxuDCHF5eWRBR+yOJzDXjDih69xv
 R/7G3qFUNiLktIEoTIzT5yahRwGQNW++ygVwrOvvWNw13eW8aOGV9Kg4W0qyGcJFCIft
 k4B4D5PA0NJ7vz4a63/pFkZPSrSDhRTTs/SmE6ktUPSA4ScH2SRsUC+wKmwKB+ap0e4b
 zW/xFJKGWw80tlfbsOMtkf8CoHQxh8YHHRi+v4eykgP9pB+5/KZTxfXDif/5ikrEWCht
 SdBeu6lVbYw9+/MpHW6nDVYkcw/POgxNGK4KsJJBBJI7NXpIzth8AlNDl4sOGmwzrzzJ
 2dIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ULDyhycJkmqlDqDjeyCbkHRqFTDdHRKIboDu/DZaTHo8I8VlNqQ+4mXap8LdhAl3SFxwf87OXv7sevQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK9SztCU7FAXihlAxo9Gav+RIwkQlaw74XNqKINw2EycdJZWH4
 HsWWs+oOV7QJhlEi0itTplHYxvDv5Tp3p6NE6dEYxAwuuNsOVwfRik7ozmutUvZE8/LV5b5cK/D
 FCvSCWf8=
X-Gm-Gg: Acq92OGnerZOqdFMcb3HP5buzsOL2sAqIKEtSHMXbn1Ck5HMSKXIczwJ+CngFDOV7Wl
 3RNBMRAArJqlJn96TRDk8kt3y7mTwyCce4soOiQOYK79QdGTSNSL7DwHqwqgwaIuBzAmJ1ly0Me
 d/uoXxZ/dRZWlkXvcQ1zgWOHLTkzoN+3yjG8GZTDUvzq4YOEE+ty+dTD9giLkRGSwdC2muHSC2g
 Vr0DSD0gtFgczEwWH7+6cM+pXNyVq3jOxMSmHLjSFVKIXwxDKelu8uUPAtyKuLuRFEhM52g8E5g
 7PWYF2ycht67Hh8Op06puCpQUv3BjQC5sNMTaCeAossRrh1gAkUHcZZpk00YkzyQyFq4fbYQwTd
 nWHdmNajMQo6zmI1UwF13YKWi/TP9MT/Zu/FijY3vqEQ0taGpgxix+qLbTbIyCzJREbkCJhumAA
 IanExU9V8LL7PvQzRXmTuEFyj/+VZK
X-Received: by 2002:a05:6830:67eb:b0:7e3:d199:3164 with SMTP id
 46e09a7af769-7e5fedf1913mr8821807a34.11.1779673192588; 
 Sun, 24 May 2026 18:39:52 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:51 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:37 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-5-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=a5s5z+cub3SAmh1xynpckVoWZ22C7+19bL3gHnAgtKo=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g/yjb213zQLbMwk6iuHebY91dnjXtb+FUCD
 vvtjZPSn4+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoPwAKCRDCzCAB/wGP
 wPwgB/kBmXUguncTbHCacyEQoFcxVZzlf/TOYZUKfnV2TLLum71flgDtMY1b0gdyXRmp3fM/OyK
 GuIvva8ImnHI+QUy7DVup2FJijaxuRZL4liv8BzuDmz+jrk+tGdFxjou/iziU5yzpsxn3h0UReg
 crutlwGxtN4TM7gBRUBqtvDGeGuTAtMiyHz3lJidkFemL9Vnwdy11RXMoLo6xpspnIby3loNKcM
 rwkb03JkzYTPV90rUuc1zVI4NWRdGhcSJ6QcGg25nQV8e+pjnmj4ZPxBeI518VkgGwI2bg+ySOG
 7EkIojBOcPvtAZMyAu4+KQxGhDwPFUmM2l1bB+pLFJTdoSgq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/9] iio: adc: cc10001_adc: simplify
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
	NEURAL_HAM(-0.00)[-0.682];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E8C9D5C5346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/cc10001_adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..d42b747325aa 100644
--- a/drivers/iio/adc/cc10001_adc.c
+++ b/drivers/iio/adc/cc10001_adc.c
@@ -262,7 +262,7 @@ static const struct iio_info cc10001_adc_info = {
 static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 				    unsigned long channel_map)
 {
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	unsigned int bit, idx = 0;
 
 	indio_dev->num_channels = bitmap_weight(&channel_map,
@@ -289,13 +289,7 @@ static int cc10001_adc_channel_init(struct iio_dev *indio_dev,
 		idx++;
 	}
 
-	timestamp = &chan_array[idx];
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	indio_dev->channels = chan_array;
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
