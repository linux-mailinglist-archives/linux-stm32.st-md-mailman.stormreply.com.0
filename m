Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JhyO2moE2ptEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF215C5338
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0694C8F296;
	Mon, 25 May 2026 01:39:53 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D54EFC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:51 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7dcd17e19b6so5104641a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673191; x=1780277991;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
 b=oHra4246BmAnxf38IPL8rBDRQf//ENEE7Ha+PGOnezDNKryKMlUHOr4FrBmglMfCjZ
 X+cN8g3aUaG/3xGMFpcoBAfpdNrY1LYp25JlQUyA8L0Ii7874GvFVqNZ+3xG2yQmdxvA
 ECShrE0c54j41DWfA1hsu6+l0lB0oiqjbyJsViUq/D5gx6Gfh+6rHQLeVd+1l3XTqsTe
 JXVfWjgrfsIo6lEUe/E/sBA2Ec8TX11b3rCsLwWcsr1eti8EjxzAgVg+I//ZnsLZCnm0
 bK40WvoUPnirxRb5aJj+yN+rhZMckBiYs8bXrhfjt+hP+zAqkt+bf356MReGVX82RXw3
 Qn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673191; x=1780277991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qcM+8coPu4v1e9MEXIssy6i1P2Q9YXTHeGPSK4NKRC4=;
 b=Jt0m8ZbxtQcnbF+Pnj2bKkhhTQ+Ci7qPz15UL1fJULlaYi3h5c53RpzcFotDsjX5wm
 5Ol+uy9epVVPxjVQRm6JRDBg4gzXXJYeAOtdBvqQw4YzkwgaOJAL/TPA1pEkjx5dI2jA
 IgIdmi29tjqUZl0AhRckcSMUgBTKK4KkgGe9NLotEkg0ZuMoxhwdAPFvF836uNzfqu20
 6MjOHnRdf4YYHOO5ywRv4Hgos8OWwHqtZ2PSCWZoULDzn9IZQ+3h/8vinjhvQA7D0GsV
 OSvpudPtKqnkx57DPbJfdwS9U91xqGPwee1HCbOWZRf8FIhwme9W1Ob3Pa+qblugk5x8
 a1Uw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8MxpRuBnLEA0FOwiS3irP+s11q6U/Ng1RZt8BzXMb1vPqjfLlkV17GGAc0xFptRYtdtE9NcYGUgGGloQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzP00U2IG+/IzEwlBGKwa2JSKhF99zFGOZ5dmb8zna2KZoPVfbv
 /Nqthzg9eaocLGLATJnOTls4BGRRfcz1j9IHt2M2a+UpzznSQwxoJXjGzCNR0aBw/SU=
X-Gm-Gg: Acq92OH5Qa+neQ1me6fLG689WmLXIgIMUkvA7TGw/zjCZtJxHkgD5GoV2eQtHshtfnJ
 5JPNzdKmObQ8S1rJH1fsNduuMCgLHywdtRtcTv1yP13DTva8xzr6TEwS8n6qt/ytPegCchv7ftE
 ukGZzG0U9Q0vacomh3kx+U7O5/0qMqPMh3AHW2VuPW6FRuKvB/j/Wd/nY/VUZuttUxetmcO3ZNA
 mZTob7pW+2c4wg5tXHKz7xcj6i6ORkfIlBEzM8JDt0NUbKR+trt/BD+bVcQ7wRKW0kY0a/ayghn
 bchYnv6w22o9WrtY21XjmpkfB3rxpah4MV7QcLaO3VMoFtvxYeQ6lRMGEu755ogGklPpmc+2KE9
 ljRP//nzWmQ9krxK881HWCwMWcJsU/2eDr7+Jj5pGEGGn4NbTWl6E2PDGD6bT0D/gQq9FerZ1BR
 zOftQHfB9KNMuYNu1OS6V10QyaCl0s
X-Received: by 2002:a05:6830:6d0c:b0:7dc:d99c:c441 with SMTP id
 46e09a7af769-7e5fedc8241mr7219838a34.8.1779673190623; 
 Sun, 24 May 2026 18:39:50 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:50 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:36 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-4-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=kT7iBeb9XCkWmH0M5c7AuCVAJn+S9r0mo1T4JiYsl94=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6g4ZzvN+pLtbr0EtlFMYHDp7WfJxXmMKDzwC
 v9MYmHcbzCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoOAAKCRDCzCAB/wGP
 wM4kB/4oMi3qMB93dUQsrGEQKP3Ylxt+25M4VOOtJqdg7N8vJaJ1C6Lmi5F/KK6qCauA/lzIV4X
 si8btQlgwRRXDQ6XKwu3cWj/ai0R3djV9ReHCVfEGuiQQ0tUgB2QROHEnXiC0F4tBS6FWCVUlYJ
 I6DBZOM1nFp9tt6ap6GXFJ3BcwoZ7V/n5Z3GOC+N2BdEyABMsqK6hVrc8Db1ksyYyjbzIhaETVj
 tIJsfrSn2JjVJ5299p8Gm7hdyOXXZh/t2uRbe9QEeahWGaTwcNWvv9HlO4izEY1uM+pkipAIoh7
 Sdf1+Nlh+iWCpQuVbssgfyPaZxlw0P8K6guLhv28vVycI7U5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/9] iio: adc: at91_adc: simplify timestamp
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
	NEURAL_HAM(-0.00)[-0.672];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DBF215C5338
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 6e1930f7c65d..f610ad729bf3 100644
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
+	chan_array[idx] = IIO_CHAN_SOFT_TIMESTAMP(idx);
 
 	idev->channels = chan_array;
 	return idev->num_channels;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
