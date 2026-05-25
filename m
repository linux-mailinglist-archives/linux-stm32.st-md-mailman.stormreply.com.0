Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA8WFG6oE2pvEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8975C535B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAF4DC87EC4;
	Mon, 25 May 2026 01:39:57 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3BDBC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:56 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7e4de538f83so5186277a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673195; x=1780277995;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
 b=K8A1tPr/pwRlZYjaDy/Ht3EYO3cOiNO/oxmSWDQMGTRRmwDt+nCEFqGDn9Gmz2/poQ
 RS8DtFhkHWIDTSBL4Ilmv5uoCxFAam1neZ64Y1U54udqCm5XVSm7/C6pDhg1CqLOnTip
 0XrcbfIEOzkbiMSmuWQej4DznSHt/50MeGxra0R1lGp1CodQFFXeD8M8IuSSlDBwjm5t
 QBTGTnWTjfZqzZsuo6ozVUArcA8Sz/+tmTp7wqRJ/25peLeQ683FXiZba9kquD6Yg97O
 S+0BRfGiapRZxyNnR0M1sQimZbjW8ZssyTAeUxYOLz2sAbqTdgD/PdALEZIZRYLRA2TC
 FjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673195; x=1780277995;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9XIM9OnRzGFA/35nH6Wlvv7D5+fTDWpMhEIG9GUqhfM=;
 b=qql0Xpt5muE1OhLk5Ld3C6rX+okPygdztZwuOscHMywDtKYWdJxlp9L3R5Rsr9atkK
 fXcNpbIZ5Ed1n+oDRm2UhnQhkFgJ9t9q4pGECLG4/kSywqfTgMjdIJWr9ks5PYu6du7t
 erwYSwfI7zW4PU98KrqGzFmiXEPrwVFvxLxzWTq0xVCyUHooQlbHL0I5cFC/7qnD1yXK
 eAx2c1cahuNsmhUl9Bp6a9/Wb+IyXg7YET6+00Ue0G15785kD31kRQWY1uoz+GhvyIFT
 Jy4vLKOg7yKTbtipcnWbJqNalXOj67WkCemhzOmJbUe9QFHKRd8/kl7owA5KE533G2Di
 +maQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+D8sTIvDqD2/SS7N46+HPnFSyAqcWiqkmP4N+cUypjShkd8+hqgA10bU39n2JFNBCoEu6H/ZZ7jctExQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7Va6MjJIGWCMXVB1dqNrNzr2/9O4pj+n9LkfB4/VbUikOD4oS
 VY0WBKFFn1gGqQqzsYDy9pOW6FRnToG3B8dsJ1ksu4K/UysGXG04Jwinr9ZMPHmcAmc=
X-Gm-Gg: Acq92OExikXzSvDPQhCQLHy2jlrjxEnG5v33yctd8qnI7nnRMgIAAr1+2uswRQdAEqc
 fLYsL5xKr9Sptkx/9yWtg+u7cGPZSik/zx1rnATYIYjvE0tfLqZiTEITjqeeGEZoayjbfaHUtHg
 sGFnHJip8yxMBCCi0vAgX4H5GEJT3XsUJ/WNbRi9nBM8zYcv4H9Hqc3/gtt3lZhiVBFQxqXpROU
 i1dbCM0vTXYugzO6dZab4F4vtp0J4A5YESseM0L2B2F3mTpiW4RFry6fODMwg7nEpLshrtbzPFp
 NGJdRStV4H0MMBAL+2QKZN3JJ0tQAidTxm4m/QsMsy5jxJmwPi9e5Ofw7LA0UT5CXnCHCqLb5I/
 L1J9FBs4cFoAVdU1ad5hzd1DYwtOHjCcHNUr3hs3W0Pz12UHjsn7O1MKeMWPZv33CPa8Erd2fhV
 TxhW9mxldZTiqBUL5b+/vhyP6a197y
X-Received: by 2002:a05:6830:2b28:b0:7e5:68ca:8856 with SMTP id
 46e09a7af769-7e5ff0cd9a8mr7659996a34.26.1779673195498; 
 Sun, 24 May 2026 18:39:55 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:38 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-6-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=YS6jCjPN/UIoggB95tUfxTv9uEHe7AlMRn11CmiFLdc=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hFHAQyCONXja9H0qJtqJqKBq0yFqO1V5bYl
 UUyScLbRw+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoRQAKCRDCzCAB/wGP
 wErzB/wMCUV6Kulh51VMVLYxbDxRqv2BQZyM4BEr7RGpkMe/7Sr5HhXXNKGKeXJlc5yf57l7AsA
 vEsbN8YovaCmH8igLt9085Ee1QmvXe7rqmLPxILVsisABoUotxEWojib1VpHUyh0y+5oKbvCkFI
 un9trVfnhd2Fkr/rMxT6n347Q6AgHgxxzlckMEsMl8COcXXQGhHNuk+yxIcrU3Pom7uFoleeXXb
 ZLcYLd8BJMp+OBmBH0kreyAOK7vuqjllPoTjNkQnZRLUYY/HtjMCQGYwC6UZm4XYtO1aP9kGOyK
 JJaCG5ByQgdUjZh0Z6DER1eRR/h5VNepua6TfjsZTrje3fw8
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/9] iio: adc: stm32-adc: simplify
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
	NEURAL_HAM(-0.00)[-0.670];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 3C8975C535B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 46106200bb86..5c5170b19b56 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2443,15 +2443,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 	scan_index = ret;
 
 	if (timestamping) {
-		struct iio_chan_spec *timestamp = &channels[scan_index];
-
-		timestamp->type = IIO_TIMESTAMP;
-		timestamp->channel = -1;
-		timestamp->scan_index = scan_index;
-		timestamp->scan_type.sign = 's';
-		timestamp->scan_type.realbits = 64;
-		timestamp->scan_type.storagebits = 64;
-
+		channels[scan_index] = IIO_CHAN_SOFT_TIMESTAMP(scan_index);
 		scan_index++;
 	}
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
