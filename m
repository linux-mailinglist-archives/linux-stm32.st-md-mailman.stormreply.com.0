Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIVJDXWoE2ptEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:40:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32A5C536C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:40:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7134C87EC4;
	Mon, 25 May 2026 01:40:04 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE8BDC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:40:03 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7dcdd23fcdfso4829214a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673203; x=1780278003;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
 b=GJ0jlJLruX0YLoduZ1CvmqCBZpkwe8eNnLxKipdHqPSJN7Cuzi+HZWAB762byoaCyD
 fnrvUslwEWG65J6I+TjnjhdfQyzx88GaXZV9yFEuyzXVmxtbQUO4R4UnLIEUFrcu0oTp
 1tXYEacdK5vneuS83HWprTw6OkUkASKqK1Xly58BVsgi+L71Z8PoDjj+ErXhmtrrHz7I
 oWR2ny4bbUYyYrPO13zSA+OQNl1JiI4b5E8EnUc2uRim3oBmzAKL+P2V9QHR4Jd1pwcb
 g8j22SpyX3hz47rUr38T1pRn6zxQkbRGe5S3BJbI5c1gfaIzxv0Xyy3Sguloa1IUk7ze
 Y5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673203; x=1780278003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
 b=P1sNUnxVhet/nFmRVZvAd7n3/g3yyxgyu+0x+lCxiUw+A/jtMZVgq92tkjpoa/+QI+
 zP1J6sRCjI2uVHyGA3KtakQxtpOyt6XN+aTll7z017Fm2fnnojc22NB9/gHS6QRA9F8d
 85KfId59ogepu/8MroHczvEdMi/9ziWeg8f4ug3jBl95C/c1nOMKKGvGaoiytvMJWNid
 9zfa38Lbcd7TAmUeSB9Jugc4uIzV3LSIvhjTaPFIJb/rd1xhqdIzEJHicTL4qaEkmWt6
 RqMQoKQBjVIi2ncuvlRME/ImFsCy5MON6He/9m214AND01U/PosSUFbt/GrZT9+NTRk6
 E9JQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ83PQupZ0O3OOQJh+K+0S0eB1TK3+NZ/rByLtJdmPROwzAJooChRa8YFTLJf6g+cM1przO55GsyUl4oTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVaWrT6WbbAiLsBTfDgSwOpso+2DAbifA8O9+8deiB09HRQZf8
 cDUKzBxGLk2ssBqr7IEKsxYaqUxqRWHokkgQRvGiijpvvBvYyYGLYcGms2zQiMhsZ/w=
X-Gm-Gg: Acq92OHPD+4LETHr5uXW8B2nMBkXYElp0c59h5hnC/SIvdbEXOZThE5X8LFqfuux/yv
 XccVxBljH7xfuOKsJuuNFzrqLOxO2jhhUzFRYGSSMvmSfy4gc0LktqjDIZ+aMlpmNmQmBGhjxqG
 QW0IJl7g/I0Nel6Fbh+8i36bOVlRIRJmMTThV0rpv0rBFrPaxQCTg04i0qmJJFvf9DU3AsVicmA
 5WAVCWRBgRshIMUJNKgC6n8kuY7ukghAR9DFbA7Ep7sBcAevghs6LWef+bzr3a/lllLUGSZ2YH4
 fRT9bfQFxm8Xaw4BmZrSL5qerNIugsHwLDrhlZnOLhGruSNDKBI+puGwjqQ3Z/UFjDT3MuBIkLo
 mBZzBwz7dHV1Wh0iCnJSbYK12S9vpLMKnuYXm10DzDG4UFKxYOgnsvQJZ03vjTydJdN0+ql6GxN
 Tjx1N8TWsqcNYc9J4wzOZqRiguSbzr
X-Received: by 2002:a05:6830:6b0d:b0:7d7:da05:f2d2 with SMTP id
 46e09a7af769-7e5fee1654emr7987729a34.16.1779673202703; 
 Sun, 24 May 2026 18:40:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:40 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-8-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=7C8/5+5gnNT6M2AlhPrzghavej9n+bAnqS/RcFC9G6U=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hSvUsVar0/xUDDV+QUJ/9QMjDeZul6qiVC8
 FnvZCNDU8CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoUgAKCRDCzCAB/wGP
 wGyxB/0Qj/N6aCMaKcrDRbJ5BmZ+vj037ba3Q6iW+PZkKjvGsd9n4PoFI7wD6diSeSxvG2GERAV
 0x7y5cPwTJeGgFrLU4Qo8z9NcqmY/opoPqkC68DGf1g4gTHMT2AFHuEgfGeY7XqOwhRn02ByyZ7
 +BgbYfMmx9PIrdrvLqgkhF11SndRrlvItLg165vQBWRtZa5DSb8jybr8+fyduA8COR7s0xmuXU5
 PQaOeq17CpIVkbeYd+2zJNY5zR//JrrRaAgbcQ1iXR86OAIlopDA2T+cAjRX1sezQfNGetxEBw8
 nhehymX7MVyKCKWxDzyMp+MovU+rt5IIKdRMjaV9OqcsI0Pj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 8/9] iio: light: cros_ec_light_prox:
 simplify timestamp channel definition
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
	NEURAL_HAM(-0.00)[-0.637];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1D32A5C536C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cros_ec_light_prox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..d09dea9c0782 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -223,14 +223,8 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
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
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
