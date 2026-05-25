Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHz9DGaoE2opEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CD5C5317
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62B38C87ED8;
	Mon, 25 May 2026 01:39:49 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11AE5C87EC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:47 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7de46b8e432so8544458a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673186; x=1780277986;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
 b=blAMqO7Fmh0Bv9b4AjpZHzdIwtkYZ7/kUMStg6UT4QLg0QxfqtJaEH6g7MfP/r2HvU
 BRrTZiav2Um39yJck5UgGid163LsHo3xodOegGFvZ4RPcH5U2eQRyzrCiZtcVZT6UaMh
 /YEAF+CaFUIyFy5z2Hsurb02lDQ/yugMJc49cmeFGt54ItI5VIYE+MnFqe4Pj155ZoeG
 SEmJxcvriMunKbXgoeAskZbJtKYlt3on7mfbxtbaYv0UuFJKZQHUxnWyyqZL1XAUz/H1
 3DLXe2W/mvPI68CGoW+lTyXViG/f9tUY6jKrC8JwzfqRQdNkRApegS6cn1QOEBaGLs7U
 OJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673186; x=1780277986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+sqYdvGVyKC5T85bHR3ghgWWsyGPZVu/btJbvGFyKsw=;
 b=Osyj5Jzi51fs/7IkTa+bNMuhIsAfVOf1j+Gcn8EZaD2EAVj2//eNR4qsYwuXOV1fKg
 41gixoyGHKTf1YZipOcbPOfRP9e3TSXWTAPlsPhngojgIqg+Xm8hU2P8YeQuXmTuUGA4
 IXKmWB4z2gP+ZV6h3Un+h/iTHUF4vQ3vcvXr3e89WucMNpXnRMhAm6eFXqxS7DeCJMbv
 iGBtU74Tis+etm5VjOx8p0uVMwYO1QJLzBUdegeLHXqMSZql6depTpilni+qFr7ecitO
 3VQB5n9HNRNLCdGMfwobAG+vhodPHE+aYGoolGB2tqcyf1d8LJH2FbhJxPy6dUYN5lth
 ZYug==
X-Forwarded-Encrypted: i=1;
 AFNElJ8e/QuqS75BUjhVewRJn7hGzWfAyTDt7kXUm1K7WNLD41rZs5n2YDi38I+R+tzyhkHT/Fl/xT4YsOOp2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9Lf9JMN7uGaA71Z1XrM+oKyVPc02LpDGA4IKfX5NXKID5lQiB
 WU1C8AJMCWXWfYAP2IfiJ2WWAWMy5xiJFxgMdJsNQtX6ll24/p1bNVzDVaU7JkuNCjE=
X-Gm-Gg: Acq92OHnAHwjQ7mam7Y896hCN7guUDshZKCtUND2G72zcowQ/PBj+Jd6xysk2n2dxEf
 1pOippPmnEa5NmdEyVhCO3vFXyNm1xIatoh67drwZx6lThrE2ZI9iSbUq1SZ109C3kYpIwcxH/8
 LxF8YaOxsNOZvByAW2I/XuMPgX7R5+1xToLrHoQpYJBLWL0XJyXHBrdQ7DdYJmu74eYXOVdLENe
 bwcnU5+ulb9zNB4G+/NT171q+BFazCHphs81mfz9E5y23XFK4L8KzYtDhJZ/uaRjv5vM++1ZiCq
 IN6WZtdr6XdWXacZ6bBfJn538xbt7VDY/3CBMcz87HUQR/gwuWWD8fBqJo1JLJO+P2ytoKYdYOF
 EzX3MjlbhP0kZ3QI61TTkLbXYIcw+sao/0rAQyQrhU2UqjgKVYndTN4+V++tvqIP+J5miu7bDDl
 x0MyBcJHGj3vjm46QFIyk1GWlTjdBY1ysKVzc3qVE=
X-Received: by 2002:a05:6830:3c8c:b0:7dc:e0d4:70c5 with SMTP id
 46e09a7af769-7e5fef83672mr7641141a34.25.1779673185757; 
 Sun, 24 May 2026 18:39:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:33 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-1-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=fKuBtJfAfzCPrk3RdMloY3OvsD35TA24knEc3HPqxbI=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gkbp2XpLy55TfXwCfXUXCOiKIRuOMxo3k8B
 SKcIFfNBt6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoJAAKCRDCzCAB/wGP
 wGJ0B/sF6GcNKoszGrdS3K3qVjnpXeZGkJO10bpDXR4Y3SRxc7dVTNe9sllJCpyKPQhdmnCCdbJ
 8MYmZ77vnGZLM3YPs09/4cO6Oz6yDoJdjxh7zlvnMcmgzm6Dj5l0P/a5r3Uh0V2wvH2dex7ggHd
 SaF2Oi0IeM0dI26Bx0hksIsaLx2dTD8BLZqrx+y6qY4bVH9v0EmzoSsAmfE7WKnvYGyxdGtFB+2
 UvMVrh/rhy3kOiOk0JJNOyIo2OsCanJ/fKxsfW12+iDCn6TSQXXQZG9iH8086GSo3wlX5XRc77q
 SCocumfHN0Fis55ywvYaqhtzzSiGdfFfcIICVJQWNs/3mTWy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] iio: Convert IIO_CHAN_SOFT_TIMESTAMP()
 to be compound literal
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,analog.com,microchip.com,bootlin.com,tuxon.dev,gmail.com,foss.st.com,chromium.org];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:jbhayana@google.com,m:jic23@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:bleung@chromium.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:andriy.shevchenko@linux.intel.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dlechner@baylibre.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.656];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,intel.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: BF7CD5C5317
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Currently IIO_CHAN_SOFT_TIMESTAMP() can only be used to fill the static
data.  In some cases it would be convenient to use it as right value in
the assignment operation. But it can't be done as is, because compiler
has no clue about the data layout. Converting it to be a compound literal
allows the above mentioned usage.

While at it, tidy up the indentation.

We also have to change existing uses of compound literal at the same
time to avoid compiler errors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: David Lechner <dlechner@baylibre.com> (fixed compile errors)
---
 drivers/iio/adc/ad7606.c   | 2 +-
 drivers/iio/adc/max11410.c | 2 +-
 include/linux/iio/iio.h    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index d9271894f091..cebb8ed8dcb1 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1475,7 +1475,7 @@ static int ad7606_probe_channels(struct iio_dev *indio_dev)
 	}
 
 	if (slow_bus)
-		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
+		channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 
 	indio_dev->channels = channels;
 
diff --git a/drivers/iio/adc/max11410.c b/drivers/iio/adc/max11410.c
index 69351f4f10bb..dc1b96356592 100644
--- a/drivers/iio/adc/max11410.c
+++ b/drivers/iio/adc/max11410.c
@@ -804,7 +804,7 @@ static int max11410_parse_channels(struct max11410_state *st,
 		chan_idx++;
 	}
 
-	channels[chan_idx] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
+	channels[chan_idx] = IIO_CHAN_SOFT_TIMESTAMP(chan_idx);
 
 	indio_dev->num_channels = chan_idx + 1;
 	indio_dev->channels = channels;
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 96b05c86c325..711c00f67371 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -353,15 +353,15 @@ static inline bool iio_channel_has_available(const struct iio_chan_spec *chan,
 		(chan->info_mask_shared_by_all_available & BIT(type));
 }
 
-#define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
+#define IIO_CHAN_SOFT_TIMESTAMP(_si) (struct iio_chan_spec) {		\
 	.type = IIO_TIMESTAMP,						\
 	.channel = -1,							\
 	.scan_index = _si,						\
 	.scan_type = {							\
 		.sign = 's',						\
-		.realbits = 64,					\
+		.realbits = 64,						\
 		.storagebits = 64,					\
-		},							\
+	},								\
 }
 
 s64 iio_get_time_ns(const struct iio_dev *indio_dev);

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
