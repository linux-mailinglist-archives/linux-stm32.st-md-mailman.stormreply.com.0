Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JFqtOBSsE2r7EgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:55:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 814265C54A9
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:55:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C14BC87EC4;
	Mon, 25 May 2026 01:47:10 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C40EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:47:09 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-48544493bd1so1875529b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673628; x=1780278428;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
 b=W7ehg8Ikz1nEjSN7lqy5hXMJDbEmACj9V6w8G+48Cx2JK47Nrr0RHBgoUCjsG1c6gx
 QyZu2uoo0XONSUOvok0hAQMAFht/fJ+eCPzHSTcT9wQe+Ize6JZH5wvhlytBhRBKDK16
 g2MlphWm1UK39p63CDS+lSK4Vkl2TbmkE5c1TjsrF+cPiAeDlpkPqUNL/NRjT04R/nmK
 0Pklzb0fC2YH3r8FgktxamYDQaC6ueYhapySaW+lopwpPnIUKDfdhGrktuOQ28D8PWNr
 5seOJU//05v5iUpw7/n2TApE4RTlWvKuTKReGoaRR1Hb6Ai8x+GzbG7KI5o2Dwp3hmNQ
 LDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673628; x=1780278428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dl/suvXhKsrJ4+KHwf1f2NduFgl57g1mFMb6s3BomEY=;
 b=N6JKnS6K0MM5DJRpje3ABDR9ZWWzJvQD96ybK05fN9N/MDeBSj+/J8u2CoswtRcKiz
 Pk4CvFQbRQ2S/8QpkVFF/hL6kZLqqquemM7ks74KjdwQie7HOleccWqWAdVodnJ3Sezq
 TTc050TkLs4bf2dR5g8YkQCd25LDTxAfy8IQVd5YW9/AfpArzuCt+h6VynJzDSPtyHts
 iTUNDbS3fHWVy1RifAkQxYIQJadAZPkLTi6m7M1e4ixIdgmDouZYFoKvj1ZdDtLfqQYS
 iVniUkE99UvXd4RbbkYrVZdJk0SDjqK1HTMJFhGDD6YrhXwa1nKBlBeqCI47G8VJy5k8
 xvCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XbzsFhyUC9lPgoAiWLJNKPXBRjiBwjk+5XJOu+AacVlsyyCnBnZ5m9b7pJQpOWQejSMvA4tkf0+1eFg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxVUX8Aq6gBjQMQfGZZkNMLaLWBnv+/te0my5zyCoVsrwXe/Ji
 D4SGJY+FZkxnMsAP6cz0RmyZI8WL+uYK4jO6d0hGNZtAfHeBNq9WdkLz7aT7Tfjbu0w=
X-Gm-Gg: Acq92OEAq6gfy3gw3b0pbFq+aF+EQL1zmPBtTf7WQpMo22sjgaV4u4qN7mYTxoE+D01
 WZf1Itd5ZQeumXMvKSWKvyTpLsFjcuztlmNCDv72POUEgGQSY7emw79Uj/KT0ICuZT84bkGiiPM
 y+gzO7m4qIHHRqSSnzYRltVVCHNzIms4NT55Tty7+bIhxT8kXScyxxuJ7HnqZVs+HRdZ4rWQOTX
 Xngx46uO6radDmh1pTA8QLGHmgqoz7rlucPDiFDPAKLIx5PDualvVWrz/+j/xgaqNHNHdK44iP/
 aZX+k6sxTksqLxKjchzMPDNfFHftk+8ZWU8fSvC8fqMvSSb9Te3pvIveZKjGq2TxDUzdli7o7/P
 0kjY8bPbzAgSKCMJ+xzBL6b0K4HdkfchVLI/PaTPuHu2YLenOHzQPZcO6a9GRfsyCWxHCsEh3oR
 bEoapp4KAWyI37y5eBjL70bxB8eLiW8qIV733P
X-Received: by 2002:a05:6808:4fe7:b0:455:f0e4:4f89 with SMTP id
 5614622812f47-48549cfca75mr7320262b6e.3.1779673628014; 
 Sun, 24 May 2026 18:47:08 -0700 (PDT)
Received: from freyr.lan ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43b6350ad38sm9263431fac.1.2026.05.24.18.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:47:06 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Date: Sun, 24 May 2026 20:46:52 -0500
Message-ID: <20260525014654.2399354-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
References: 
MIME-Version: 1.0
Cc: chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: pressure: cros_ec_baro: simplify
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
X-Spamd-Result: default: False [4.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	NEURAL_HAM(-0.00)[-0.636];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 814265C54A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/cros_ec_baro.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/pressure/cros_ec_baro.c b/drivers/iio/pressure/cros_ec_baro.c
index c6b950c596c1..6cbde48d5be3 100644
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
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 	indio_dev->num_channels = CROS_EC_BARO_MAX_CHANNELS;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
