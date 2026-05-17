Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGXaBoEGCmqNwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05693563014
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C25E2C8F28B;
	Sun, 17 May 2026 18:18:40 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42F3AC8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:39 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-439a7e828b1so2303140fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041918; x=1779646718;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
 b=ElLZnJcbUFSUW/YL8Z+Tx5NdlCgt4Xs/qZW8wbg8eTFkvvQxmwKGAaSDhWt7/rqSUf
 yolSLAcmVC4T4y8bhQxyse7MjOG3ZgfbWIRvYqottqu1Qzt77/VUenn37xkHZvqexMiY
 Bfe1QRD6FF4sFu9Q/nMHkWcq9ZX03PiUo8RONerhvC1BBiif7zx614lJcw/paX/AJBR5
 v4n+Wzr2Sta4cVFiPZ9I1PaUrbS1kOGD9UFOqwWJtKbPMraAsUOswyvcDtfsqihN5okU
 TQf8LUfIao0fBxys5kjoVStduG/oz7Q692wWpijjPGgqx/18vDN+hSbSwPzna1bSolM+
 mJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041918; x=1779646718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ez1Xhq1H9VVtiiULLv6l2O+VSNqbdV04NQCVQ2RP6/g=;
 b=qridHz3B9qt1mDN8ktcTWo/v5Xk7ws+lpmSKGAr4OiRBzbqnr8t3oDeew2ZK5hvpPy
 xP2aJ55zK+tWJDyU6fBglfVu7a/yKYyQWpjRCK3mR91RTRxYNhRz7xRjkGgtgP71vjHk
 Oyix1W+BFuohyQ1NmqKa0y6Cs0avdYOI5yaXvO2XPalSAicwlGUDx2KezOcDHLQpPW2K
 JxDwJRBe6duAGX1RRIWzXj1PFE8pf4oPDpzCh/Cj/gKZ7KwuUoeux/Yv0vBhgrYoK7Ky
 XIZgOPQ/IpBzBHAcoGnSkUsEBz9dFRSJWRQ1ak7UunyXbL3r4SOcPwQ7KczyNeHmMAsj
 HIfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sPdCngyz5shVjIUlEz4cbQa5+cn4x0qnVBv+Cl5eumMUsXbYvojKP0tUsr+wV3pJ+ZuDCs4tBFhiJZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9XzDQFURbf3Tr6bCncJfcfgSOHtS5KwuZwWfouV57r+wel/Ua
 tiCsofFFEMQRRwo/JdrJQoQZsuJs2hTisOEUV+TJGrWbDqC0JqiocY0OLcrAY3Guma0=
X-Gm-Gg: Acq92OFQPYPFx743sZy6DF5g22oFohrzrPeeE3Sb17mwFtpIyDJD5DPV33XSOO5zk1+
 Dhc92oy/vvl/3pjXdxat65N48ReOAcfy9PX5GnDQhhFPcJK5XcqMOvahZGjxcJYkjGUz8M1EePw
 OC6g6p/EH0lt5/lxBRv8qYflsTQo8ufOQn69Lso++XfRuqqfpwZ48gDRtpCCA27npvkuQ6BQfon
 8oRFUx4l+5tYASf2v6h/M2G9PhJn5i7TQBzq7bg+kA1h1bWiNoMGTOcpedcGXR6fK36FQCQUDLG
 bfLldI9wmaTXhIRRy1G5+tMJeJdCUXhp65tDcoKZXnCRi5AI8IbN7V8o+nM2yUXVNJN3/GSs0YR
 GGaHla7km1O7liZdV8ciKcYutmnlxHlq+UdXCM+oiEA0zKlHjL/V0XLMYH5BAgl+6i1jOzS14ey
 p9Zhcr17PfhNf3A5Ods8oO+1WF+rWgbJyb0Fa48w==
X-Received: by 2002:a05:6870:1750:b0:404:1843:e5bf with SMTP id
 586e51a60fabf-43a2dddeb0fmr7311064fac.18.1779041918076; 
 Sun, 17 May 2026 11:18:38 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:36 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:24 -0500
MIME-Version: 1.0
Message-Id: <20260517-iio-timestamp-cleanup-v1-7-61fb908c11c7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=zB7k3lhSdqbVTwNkTinjxGrJXZtNT6Oek8UbqFGJVDE=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgZfqM0vragiRqGTD7eEpg/krmTzQCfTGXB1h
 0z3rSgndWeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGXwAKCRDCzCAB/wGP
 wN/7B/9mbxgZ1arMG7zmnev/BZ3+8rddj+Wn7ufPv6TcTQVYZzFDkOaHVzTOdhOhQywA7LeEEEV
 IYxyzLebUsY7Cvp2hJfywA+NbN6mvVmcxj3d7MNcdTYL9x4UdjBbqkIPV6CTxo2VyRM4/QG2Rk8
 nXeiJ7FNalUuj/gJKBAdAsEbnZbV2jUTYylcaR7OcLTK3VbQ/uPpePkxwsx10WIjNYsUvt/g0eG
 DwEXz3vbLZSJCMhlKhEIdi/N4wcK8Q4Rdaa1PF4w36R70uw/HT3E6MFRjz5JnYuCyliNZUqykHp
 FNKiie0h+NYOJQVharYkgWkfNDV7xWjPxN6K248678aKDb6Q
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 7/8] iio: light: cros_ec_light_prox: simplify
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
X-Rspamd-Queue-Id: 05693563014
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
	NEURAL_SPAM(0.00)[0.713];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:email,baylibre.com:mid]
X-Rspamd-Action: no action

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cros_ec_light_prox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..6c8746236030 100644
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
+	*channel = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
