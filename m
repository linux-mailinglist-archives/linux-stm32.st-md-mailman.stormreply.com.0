Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMWINngGCmq9wAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D4562FF7
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79968C8F28B;
	Sun, 17 May 2026 18:18:32 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AC83C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:29 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-6841e6a5e51so641798eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041908; x=1779646708;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
 b=ciVvIlHxwOicyqlJcpriem8N+1Ww3wY2e50XpgJFYVYmtI73cAxcUl0ssltYotUSKn
 nzMz5W+p/l/gBKpz9k1YQWkGasTWLnE1MNApgXT0p0B8c961zLvRON+k8/lmOzotbKbW
 NLZc/o6IxK9GG7zUwJbEKSUjS3OsrQ1k2mvceJXUlW/5I45kztsEwBAqy4KMl5ufIGTM
 sL1jIiIjvuRyGs+ILHe3wjt1JBCTQRkOiNAktzTFdeZ02erWrR2w7xZkY/iG4fu6j5IQ
 byp8yHpnBsw9ZRUFp7X9lH2nPwkGev81SYNkGWYEyUIE2EO48VrrG7DJfpeyBK7UpFUY
 oz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041908; x=1779646708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ECANKKg4MTkRxfSENzBkwIS1NPIhToNwg5GYCZ/bh6o=;
 b=MyfqZ+oXpaizQ/cT3rKC/Q6x6EPebM2rOMBX25Tg3g4M3G9DNMDOp/nZOr6EOWuKlV
 hsm4GGJvK5NO4/zH+MHLoYxvyorpKYLW9DrxVw9zaEihJh9s5HNvZUyLY9I1VdPkUmof
 7ZYs3znmoc1Ncae9bz6Cp1NF8n6NRKBM/pRrvKRtsD0A6+J5oJ4zTOqExvnz4I8rW2i8
 MveFu7hMNSB4yqn915pz2mLDpSUWxvkboHD1z6mL3wVphjCzwTYfp1Uz+HTx7lJZVhSj
 X9aqdUlXJgpnvMviMmYxrz8rD8xcUvU9hpTUgAQyBazMvwo3iQP+ZIqwo2V6c1Yp3nwK
 M3ig==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yJ4QwMiQVHaszQ9fz5pQb/0DNWfycE1jZGhYCPDcucNbrcgZdhOYPmRMkFX1yjsr+6wlTSkcC/ODGMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFIddVdD3ca/mb86bbCjszBUIj1l8f2dp1n1NtNHy5c34uCALc
 po+VtJuB8kUQEGYtUDHlfuMaJJ/xABfPdS2nrmwTVVk/qlQgDVPYw/G9UMzOzdO6vFA=
X-Gm-Gg: Acq92OF88nJOx2VX7xK7PWBnhJbc0QK8jX0PQxQl1H+ECx+dsGC/uI3l5XOQiAfyEBr
 qNeOaFfaDJj/FIIXSeB9jAP9JZxo6jE/l2sk/Tu43udQ4F6ZzZ9xEngopQanyMQyGO703SvZfwK
 w5qQT3ozz16EFonBHmedoAtaWA0FMbTug/g53CZIY8PZNXAMBF44WBllPw9HL9t2343/YVd73+4
 RGJ9KP10YNBHvHEUaGphW97+eo15boV5OAWCgPC6q9ySiL4zot88l/QmAXyAE0Mrj05XiIPmeq8
 ERg1SrKKv+rorLN+SxsaY4b4erboJ1uRa88C/iqGn/G8X2UERkesgfXV3NwplGm84Jv2wbM4rx3
 +ekw1eIOp9RkdWfdbVE8YsDJitKel6sulx+IHBjw+Nk0B43Ujc61fZFP0etjxRHpeHnuHhhy/lw
 HynyN7Ifcu0GSA5FP5m9l6gHTjJZ0=
X-Received: by 2002:a05:6820:20e:b0:696:7697:647a with SMTP id
 006d021491bc7-69c942ef628mr8599698eaf.16.1779041908361; 
 Sun, 17 May 2026 11:18:28 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:28 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:20 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-3-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=C48Abd8eNikDaFfFId0eSCBHL6bq+0x5TvEL5GoFu8w=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZDEZ17zmDQ4U89aCy+DcS8oW4YodZ7dhEf8
 0qbBK+H7XGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGQwAKCRDCzCAB/wGP
 wJFGB/9B3fVze53U8lx+G9ghHy0Zh5HQ9zTEiq/MOyWnB+E6PZoNL92fCoc4WMGniCoaEyd6UCT
 S8/2ofgAd0JD6A+5gZ4A3Z6ioBLYgUhJB1cHu1KUM29AIBLuDxp4xU/9MsG4PhsURfN/lRehJMA
 TIBIIL84aV7F9kAT9F1FpaGDR/nQSJxXDhoEa8ITP6iA442nNGUPY34z1zkTKtuuSPA77R7r8+V
 RIzxuL++W+LZLHPnaWA91BW32quPK4BG2mAgCxFA5La2kmd/mk/1EYpzGp93fuc89AhgdccUHvZ
 2XE8TzX6pT/qCvLiY0eYEtpxXW7n17P6PId2jHScku1P7KKe
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/8] iio: adc: at91_adc: simplify timestamp
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
X-Rspamd-Queue-Id: BC4D4562FF7
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
	NEURAL_SPAM(0.00)[0.716];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 6e1930f7c65d..260e3e0c09fc 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -481,7 +481,7 @@ static irqreturn_t at91_adc_9x5_interrupt(int irq, void *private)
 static int at91_adc_channel_init(struct iio_dev *idev)
 {
 	struct at91_adc_state *st = iio_priv(idev);
-	struct iio_chan_spec *chan_array, *timestamp;
+	struct iio_chan_spec *chan_array;
 	int bit, idx = 0;
 	unsigned long rsvd_mask = 0;
 
@@ -519,14 +519,8 @@ static int at91_adc_channel_init(struct iio_dev *idev)
 		chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
 		idx++;
 	}
-	timestamp = chan_array + idx;
-
-	timestamp->type = IIO_TIMESTAMP;
-	timestamp->channel = -1;
-	timestamp->scan_index = idx;
-	timestamp->scan_type.sign = 's';
-	timestamp->scan_type.realbits = 64;
-	timestamp->scan_type.storagebits = 64;
+
+	chan_array[idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
