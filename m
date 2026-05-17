Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPbiJHIGCmqNwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957D562FDB
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 449D2C8F286;
	Sun, 17 May 2026 18:18:26 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6412C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:25 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-69b4f7d66e2so237540eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041904; x=1779646704;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
 b=UfBYgov5Q2FoHtR01F26ZKDwo/ZLZmp89zn46YPGDZYsOf9SMkNdOHTY7BvM47NB8S
 zgDtEg/Zt9zlYyurE3ReDKEDwaSNWH21KAU36ZI7dNfH9ht7G+Z1FcwEqBYZ4iKFng+9
 TeEinPrcQeaNLcYrgVnYz6SCcDxhUV2B/PAMLLbIWW//2XT1yucib+q/NE/HOtC9SvMc
 mdM2VkuM9UB5CMJcZFbznKYefRsbFSVWhKGjxg+Lqamp+wWLFbImDWKcKPbgxKIn6haS
 wc4LH0BqzmfZyV8nxD0PR1l2x1L2JxVMHpbxlvKL6Jw3Fro8aPD2db0OIODkpLassmf2
 ZFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041904; x=1779646704;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R5md7O2xvTV43+eK3/wu5mO/23eGXmmz5QIIajGxZX4=;
 b=noN4p8D9NZ2oUpFBbVaSD9Y9oD3M+gPvD4qZcQliZ9X3Sra7ryjkYvNl6RrHEteWkF
 wwR4p0r35jjgQqFBDRXKJ3pXrCudkEoMpCzblk1TUd0FYQqqVMyY/orInDFk+P9GR9h7
 ZSH896GGABliY5xcw3qiZBMxzSI/tJPchrmLStpBVfd9c4b7tpVQDFBxj7V0qTl2SJ4O
 jhBMjCmmivRI8B4RFW2G2gfpm0M2CBRe8NwdIoJI27tRPZb1xl65qmT+NMCmlyP1Psp8
 Kajt0NZnrcdlsQ2lAT7pO2Kq46Th/QbNqgvvak8KJwIPYWrEmVWEd0KuA4eDThXJlnAB
 QxBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/YS03m8y2ZbFeNamq+aKbSycNMeRRFVfdIHhJ60MCleklAPXgu6OF0rxMsrs/wOvq9vY1tmh7eExwQEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyblVo0qQTVhVgHdngBhD516CLlUPf3lKNJvRU3wy90I4gzT4/u
 yF0khionCVeB9lLPEsjgRMLzJhrnWP4EikLgfLaFQC7hh57m/U/r3PNc+0H/Nb1C6p0=
X-Gm-Gg: Acq92OGMSdu+1OEBHqQl54OIx2NnzhHLyXitFu/XUKFBcIrL4jyS8wPCnxOtvEaDXix
 hXl3f9oRNcf7IjXiJIIy85H4873yI0K2hjIo4QGR9hgDQJdRIgCRKEWooKD/156F7ukdRwdWSTU
 YsCYS2EDWI0K0pyj92r36h8LaxMr6ub49k0qKlFzxzVv+VFDgW4pgIYc2ZPTL27UGMobaaa17fp
 uRSuaJMw68ekVJ3RJ9O/7oQ0UO62Gus8WjeWIE7zmW1RfyMI/v8IO1dLgWBmiYAgkwFYi0qBTAP
 zkKmYF3UrqyOLfi3i5Wwua6i0kXeKC73xCAwpKj7BhwBtmuIPoyF/xMvKvwwJC6pT0IF0i591yY
 2DNpvVi2ChoLiztqVCED1c9AWSxsXZMKhNvYUlEFmC3/DC+RiWEgFfMKp7gmBIaWXoK3WGwGvyq
 B4IcNTF/6M6Xb58WVJAo7E1nV8NPEKzFXdgUQqWg==
X-Received: by 2002:a05:6820:4c87:b0:694:9707:4e59 with SMTP id
 006d021491bc7-69c953dd3b3mr6941197eaf.46.1779041904452; 
 Sun, 17 May 2026 11:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:23 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:18 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-1-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=YHpI50wSYZTXW1ieL+zX+tDCAyrdW9auMcLS2k6lfoQ=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgY2aTT2VX5TYgMCbz8OOiBDnYFmV3i0a+6HO
 ro398kMNK6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGNgAKCRDCzCAB/wGP
 wOFCB/4xQ4eSKQgFfsKouXQR3vu8NexauORSshAXou2t3MRLSZK5t6EF9VUuh0inu/5WRCWFGej
 u4u1nzKt/RtnOitc15cyY9Nnn7nkczdAzczNckuYghWXqK91XhaJgcRwG/HFuNtLIj4lKoxm+Sf
 q0Pu9iIKleW9yv4r8X+98Kbv5DjrCSCaPYDHTexcSLUAT8wJohTJAL71EMnB6FODtdCObmx812I
 rURmDEmfF633QDjdS0XJe4MEqg1T4IkiUhtfcGY8NszNTCxYMwSfI7i0oUR13FIruJz1m3VsXVT
 jK2zkSF2GmXef8vaZjcYIebODvZ4ngMnNUIx3PtA78Mw9WPo
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] iio: common: scmi_sensors: simplify
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
X-Rspamd-Queue-Id: 7957D562FDB
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
	NEURAL_SPAM(0.00)[0.749];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

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
index 5136ad9ada04..86e1782deee5 100644
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
+	iio_channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
 	iiodev->channels = iio_channels;
 	return iiodev;
 }

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
