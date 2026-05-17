Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOkwNXkGCmq9wAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29AB562FFE
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB07C87EDD;
	Sun, 17 May 2026 18:18:33 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com
 [209.85.161.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59B59C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:32 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id
 006d021491bc7-6948ff6b006so726958eaf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041911; x=1779646711;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G6UxGHyqTBFAbz6gyJLQjZxvD5Vh1uuTNWv0BztIsXk=;
 b=Wjp/D/RyxACjk2+b1bqKBbnvUPjddnmyZQa4PoIdMjHFaUkilYWe6BJG/wbkZQtrlS
 SoiqUUFziDuvd1bV3L8nFeCw+EmlhvIue/u4Q3SoTZrqLUqJ5ebrll/OhwrAGZBS3aq0
 GA3AeaWO5wY0xfXfuhpkUrCbvp9gyAZJsRW/bbCejlKF4ma51787mmel4k2Rumr1ugnu
 uiwThet0GmtCg95G3n/cTiX3apsQQgPzJQs22MGnvDcCReZu+xgTrgAWPkQFEsQgzluW
 CKHMa3/88gWLRzQdMAzTSE4ujJySC1WQ/MwQmzlFESg/QEorawRKT+i6myLQ7yV9eJ+H
 L1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041911; x=1779646711;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G6UxGHyqTBFAbz6gyJLQjZxvD5Vh1uuTNWv0BztIsXk=;
 b=OVx3vO/yGdmLJMgbkngMS/yIjpJaf+GDXNInuGAQhM5Rl5aYB34FPzg/+CmO364uXq
 52ykErAA0+0t6/GEqTE7iEZeede0uNiJnAtEwbqLQ3p2bI6YouXYa0zafPOTbB4g0lQ0
 ZsYFws444E8oB6VCFIYj4qTIYIr1bEBi4L+DY4U/SRdbELEYltUWuWxWPdNrLn90VVm0
 Gu0xK67kusOQT0aS2WmO+erh0AQgumUNlMUcPz6dzDYsxn5yMYHsnDKgMTybPfz+BY1r
 7rHp89Utxut/7SZg3JLlXTJeG1D+ucafdtQD7UWZBnkdBbpkMRDr1h5ALTimE8aPssjD
 ZNhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/IiLTtSR7bMm95SMGG4c8CpLYzbGR+KoJWviDoGtomfOwN5x6i844xSc3ingBDlFuvhzDh6wWqkKJV9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5U4he5i79IqHqi/Lc000g8Qm5cOgM2IXGyZxpKoDvY//DRDRY
 coL1p7yuHEyhcbhN6SdgSepsCKDD5O7uI1CYr/ba7qd0HO4nEQ1h8GL4kG93PQBRxFU=
X-Gm-Gg: Acq92OH+3Ytc2r4Nf8CKwaIR/ATWrBGSO6VecGjM62m0pw/VBHk0ZLYLNoSwqlrM/XE
 nzX+o/Qw9bXtqCK3vFVvC5T5PZuhcJVrboWZSa05Abqqzn4kiglkq3tMsxTRkYUvqQfc2Aynop0
 MZMbyR52YNaDg9PvDfytUjOu0PsiImXimhc+uUiIh6N3+o55Wa4gzrCor9sHh71gCHEpv4J6SiF
 WfWbuV8CguwsPSU5ftP7E4E6Vpng0n0WNDTmE/LaQabMCJFhOaYl96GNfZ4plSpWJFJgktulwEm
 +r0aXVIOnQUO3Ely+SEEJBro0AyM5FXvVX6KW7ThE/+anrf8xsJrAp1uT20OPJsgAnLur8Lg3bZ
 Tb8deqjDQJaSe7mZNExI4P1jsA3R6G47GI7v99woCVNm6PuNTbHyD6r5v6mXHoVuT5IZxPhP89x
 yVnxV6cqRf7EjyG66PWYO4vjH1YwjV2C7N6b2Taw==
X-Received: by 2002:a05:6820:6ae5:b0:69b:94ac:da1d with SMTP id
 006d021491bc7-69c94373aa3mr7665754eaf.38.1779041911234; 
 Sun, 17 May 2026 11:18:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:21 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-4-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=jMaxL+lkdri/M+fKkvGNkjtPGnxhg7f3ihACoPlbHZ4=; 
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGLK42Lwuqlm/LFjzrVdp+58P61ccz7ZW2e2/qC23Qn9z3
 bJVJRxmnYzGLAyMXAyyYoosbyRuzkvia74250bGDJhBrEwgUxi4OAVgIlP62f/ZLFZfcLFibrc3
 L59V+K3MP4681b2Wy4+dNUxVc0yRUV3H/aJx8zJ1P7sj6lFPb562tff/oLnrSySLgKhv/mxTR7m
 nkhfDlfo0+sL5NizIzBdl+3rFy/2XxEvrnwUlzj9DXoSJ3r1toXztdeLZdS8Yw8KL0vLiPbVqwu
 Y+3yT/u//QlDc3ngocPe/GckMkWUxYSFq+5ar8aaZncVJRotZ3daYv/i9+kkW3sZKnL6M5SH837
 9RdT17PFssTckpp46z7c/2oiTZ/wiatj4Zrl/L4ZAifEK+QNHl42d/YO2nqvTPcUp6cX+ua3sXO
 7/onvHhaMOeZJtGpwbGqf6UyPe3FNVk27JE9czA1UuoxAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/8] iio: adc: cc10001_adc: simplify timestamp
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
X-Rspamd-Queue-Id: C29AB562FFE
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/cc10001_adc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/cc10001_adc.c b/drivers/iio/adc/cc10001_adc.c
index 2c51b90b7101..9ca6a6b33740 100644
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
+	chan_array[idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	indio_dev->channels = chan_array;
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
