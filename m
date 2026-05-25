Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCGkMWaoE2ptEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D745C5328
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 735E7C8F272;
	Mon, 25 May 2026 01:39:50 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D90D1C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:48 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7de7dc85b74so8942281a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673188; x=1780277988;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
 b=IJQYhIcGeeyadHsxOJIdHmMKudxdmyUMUa3KoG2I/uXHzzwKYkQ0bVPqlynt5tt5dW
 3ScUYEc6CkOKN/mgjQlVbre8TNN6jzl+qsICoHjIiGqiOt4twibpwSqkX+1U+GTRCb55
 P5+7kvA2JP6BGeT6Q6pYu0Ji+naTpZRzZvRAayhlfXODOjjhcLW/T/qV0PhBWNKm6PLD
 Vb72IsnJ2TjqbwAUiGe+EkKpgzO0nI60u0pWOb+JhUtWHaFOtJv0OmwpVw1YEVQ9fbaY
 jSPE5ba9VbOx0B19VN5lETQtGFLGSj4h0pTze656JaybXyNBQo4DyF0opdqs0KqlXoHL
 dh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673188; x=1780277988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SYbs/MKBJVpipjYP+IfAmb04OO4GAu3z1Fjn8q1WnZM=;
 b=e3xk5b5OBLCtMGdhEyEGm8nsB3hc9sEXSG8chGrp5g4YGQuISMeEwTJW0/Um6Jy8wB
 wciTlYMcOjUh6iV1F6nb/Nkc6lxMz1ZvG3wpbhQl6N/MLIVJ43bxJ3Klqe0CWpo4doga
 DurUhlrYkKRP1390i0S/Z8yDUjsVcvpnwKW94eIcwImE/BcazaY7AgUt96blvxuDh9Id
 Yg1cCjemHlax0bA1ws5TUsOUTKBAG9k4t4SmbllImgjvqiDFQraPidAiEVsqiuGeti9Y
 EysMas4K5cdO4ZCChr98Nsh3QTAPpLPgxveA+W3ncvbsv5YIF2aTcy/Qq6D3lSj0Xf3M
 mqyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ//RJkcj69alznWRDbBAj34Wurh48Q8Nlf5jJHT5bFLYUbh9WU/J8MeguPMk5nUW7F0LQhxOPYaEVgyCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTQ3q6VeMh09Js3l+KuUf/2HO/V8vOAVZL4Op252O9HwXCzOuX
 55320agPaWC2Q+yq8HYzq2PCGBaLqGubT4AXw9L4SumHppwtW/k8k7IzXQIkmHhkr4U=
X-Gm-Gg: Acq92OEuv2G2PYZNzsbK7LbAOHz4yK3TSo9sA817uS0rxKEHtCSMgXM7TkACHh6BZtq
 xQJl/GY8MsgJp7k6vdrao2fn7mRIpGzQ5+cf1VN4JugYlW6hgRQ8hU+won/sS46F6Q0yJiRrOMN
 1Xtelo335FtaQLrJZbBjkgvEM+nX9xjkjpYsp+/zjLTHko7ysUDVI8R6GXmv+ad5beSLXNFSuwA
 IZ9V81ZlW0LQJj0pY4COOTVQ5uNoBJpnJvp00EgyH8cloj8k2/mojNP8vp3At//ohN9Kba1tBX+
 9uFhQKoBtXEnoK+fpdGcnlPIJD5nvFGhrbq3sQdsyu632sK1uZSgMR95mv4S0qG3Y5gblJ21MXJ
 2S27cUBhvJfs3mcjV7y11/aaMcKcJlKBwW/wzMuTRzyVSQr74gJWWWOgK76MPGn1PZk1QBMEZM4
 tOLquRPqwHvK2fGdGvRP3YkyiZtRJm
X-Received: by 2002:a05:6830:3707:b0:7dc:cb67:cb57 with SMTP id
 46e09a7af769-7e5fee981d4mr7582287a34.16.1779673187667; 
 Sun, 24 May 2026 18:39:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:34 -0500
MIME-Version: 1.0
Message-Id: <20260524-iio-timestamp-cleanup-v2-2-c37c9408b7f7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=T4Bf5vbSPVSOe3vw9rQJwnz9U9F9C23dWoMfCegfy7I=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gq5kb7gqNIvRa1NfJv7HOorfQZ3sqHYlddI
 Jml3lPpMcCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoKgAKCRDCzCAB/wGP
 wNzjB/99KlgYJikZIqEx1VRYZkMM2mAJQ0if0DHyVfTAhaCsz+wJI+IQPEslFn5JAl9jhLjhmzi
 PYD3VGA6lBMGRcJSUCgM1OWVM7B7QltkL95q39cLNNpYOAVmZQx7i1YAgGsDZgyHGNZi7Ui9FbH
 7SDCW7Xyd6pJ/tgTruIR+eKKLvhkVd3GaEcUc3513TBTtXTIh5IJCAzBqKfNlH4YcvKZ7F8FYlz
 YbLeyrMG6PzwvU49sYkKLGrsU7+sg+hUQx5IcdbiTf9BDcAPq7thGaVSVGtoAdpTKnP7Q/l9ohs
 O9uFitSD/dtrvSvYhnJy7skna6h2/a4L6D9etMkFCdEGvdUM
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/9] iio: common: scmi_sensors: simplify
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
	NEURAL_HAM(-0.00)[-0.644];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,baylibre.com:mid,baylibre.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B4D745C5328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

In fact, there was an error here as the sign should be 's' instead of
'u' which is now changed to 's' by using IIO_CHAN_SOFT_TIMESTAMP().

If we find that this breaks userspace, we will have to revert this
change, but seems unlikely since the timestamp channel is well-known to
be a signed 64-bit integer globally.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/common/scmi_sensors/scmi_iio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iio/common/scmi_sensors/scmi_iio.c b/drivers/iio/common/scmi_sensors/scmi_iio.c
index 5136ad9ada04..442b40ef27cf 100644
--- a/drivers/iio/common/scmi_sensors/scmi_iio.c
+++ b/drivers/iio/common/scmi_sensors/scmi_iio.c
@@ -419,17 +419,6 @@ static const struct iio_chan_spec_ext_info scmi_iio_ext_info[] = {
 	{ }
 };
 
-static void scmi_iio_set_timestamp_channel(struct iio_chan_spec *iio_chan,
-					   int scan_index)
-{
-	iio_chan->type = IIO_TIMESTAMP;
-	iio_chan->channel = -1;
-	iio_chan->scan_index = scan_index;
-	iio_chan->scan_type.sign = 'u';
-	iio_chan->scan_type.realbits = 64;
-	iio_chan->scan_type.storagebits = 64;
-}
-
 static void scmi_iio_set_data_channel(struct iio_chan_spec *iio_chan,
 				      enum iio_chan_type type,
 				      enum iio_modifier mod, int scan_index)
@@ -629,7 +618,7 @@ scmi_alloc_iiodev(struct scmi_device *sdev,
 					 "Error in registering sensor update notifier for sensor %s\n",
 					 sensor->sensor_info->name);
 
-	scmi_iio_set_timestamp_channel(&iio_channels[i], i);
+	iio_channels[i] = IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
