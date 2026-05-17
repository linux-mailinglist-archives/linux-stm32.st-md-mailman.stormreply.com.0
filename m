Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNbpIXIGCmqNwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBB562FDA
	for <lists+linux-stm32@lfdr.de>; Sun, 17 May 2026 20:18:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36734C87EDD;
	Sun, 17 May 2026 18:18:25 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5DCEC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 18:18:23 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-6948e6bc30cso211494eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 11:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779041902; x=1779646702;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
 b=kX+IaBesIYqNbTkLLUvVVN95xNPA5FwKm+6xiQ9/s7ZEpew1gOQjYRlW7tEPuE+9zk
 AhkSdzDyLQOOqrSSLywyPRRQkWV7Pht9HmC2ZjIS69Lp9bAtzYGcUFXyuNqF01YSykuB
 EAU+tpl/R7gQX+46xORRlkUDPoO0wiK7BBxGGL8P+HDrecSTlAJ5f+vjva+a0ciU+Jfd
 pX0m5/P+Uf86k5lRjK6yoBDnyY3TqsrY96S4mzMyj5oUvXSV0n6GtNyMQgitxK1gntJi
 cWhnY3nowx023lLk4RwHoe5IUwUwvTlDkFjly33+gKvTFGdU0gKZTGl5C9aIoyL/8pLC
 SRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779041902; x=1779646702;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsZdJm4r4wPMlOdbscvoNtCvMluN7DKgMfAmDRA1Fe4=;
 b=gPlkdFFmqWjxraA2f+ZSFO4BXYykgAak/T0lKWEoYH+BA+WAbC78buq85z2mrmjJ3u
 VeMn+1mWGn/66ol3V/lPzfr60Pj+k8N0TcaF5TEqA8znJMr82gHq0PN3G3l5r5HGf9ai
 xQ76v3Z0utjcGQ9VHkAnJiEEp4pygfiQOmbeZ1IUYxeuqPoEUlY5hbjeRFTAvUdKrNE8
 JyQnvXGNw9Fo5t2MFM4Bd3TGp9Ko0o6rhvmXlDK2Nxa8xAD9s2whYjy1qBoN7gZR4ynU
 jIjtNeNbMCD2tmhX9TkbSgmWdVQkcI3pjQsYQVLP22LKffBWcD/zAid/7VHG2jv4OBe8
 TRwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ82HxRy+4fkKy/TzTwGtzsLq4iGN0bEmgeEDVkNldjLE96m72/G8Fx68SWDhIPYEp6wksNbbgTdcdwkuQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyFkQUj4fGWzQZSY6XBg9xvruiD8LvbFaolGQFl3zYmKSTxKvhw
 al/nfY8c/xAyBF7OKrjGLAEiuLryJR3N7Hr11pDirN24X1sSkOmoiR+JNtshurK4/e8=
X-Gm-Gg: Acq92OH0dqriKdC0mvD1LbBbI5hOdyspnIdCM2vSdNby6KpoyKma1/JmOzjX233v+vh
 BwRM7kR0QL10X9+HmqeFXYwgu4A3vVPLVv8jyymRFHfSCrU+eogg9GdRWoW/wuSgQlv9Qe/zFKy
 BpKV+H3rFGZmfFI/dD6SjgQOT/6/brnbB0/ifufd1LK8hsYjcbZT+H72kUZeB70MJycVxi0Eu9l
 /eYFJZfmcIR6jv6BANnRbgjvT15auYbX4MOikxjm9BTn/bS4HitGZukqooTbLdkIGBnwYENhdl2
 90A84V9eiLqyATzai1sViMxR3dDt5Ylqm2AH3qcncfV6dGJ6BrnPY/52PEYmsn+3kobQJNPvIJf
 n5OvQo8r9a8gBhBWEZyESZ+fIFeG8K/ET9U4vlC9TQo2MXXm7hirRUx+H2Qq1sBe+7uS9rIUfNH
 y/g+HcLk/131CorcZg+DLtlcoCyxeEJtpqJOyb8JcC/gxKvuHE
X-Received: by 2002:a05:6820:2210:b0:69b:8ff9:f582 with SMTP id
 006d021491bc7-69c942ea069mr8317738eaf.14.1779041902495; 
 Sun, 17 May 2026 11:18:22 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-43a95766535sm2085539fac.15.2026.05.17.11.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 11:18:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 13:17:17 -0500
Message-Id: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWXcgCdgWryJdxPhXR2waMqkIp
 Xc31uW3eG8jRRYonZuNMt6issQK2zYUHj7ewXKrJmdcZ062Z5GFi8zQ4ufE4QUf18QWGNxkBut
 7Q7VNGZN8ju9l/FvX6xOh/Ga071+ddszSeQAAAA==
X-Change-ID: 20260517-iio-timestamp-cleanup-1ee82f081a70
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2130; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=MZIBkvx/lDO1bwCjTF68CpPH6+1oeby0gOD1GNgDaLg=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCgYvvz5e3v6t+m0Wx/sHGclkR4moFXIFRNL5j
 Yark2JG+RuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagoGLwAKCRDCzCAB/wGP
 wL2YCACJAC5NP41M0YnHAqSNkQZmeewP7XoDQMe6oGaErE+EeI/S4A/ytTbQDa6svMIA/r63BzZ
 uDS7S/8nbyVhwAsCra78MomRhRpjuZ+CbozTwamJHbIqHsw0MgU+tot4UZveWPlRLBNr/RMimSu
 QnGbYsInSPtIo8f0cQY458S6vcMkqGQwNoqfx4d8AZ+pX1FdO6axfFyMhOR4i05M/eh1uwCel1n
 RYmEHw/N6RX/1kq9CLVRQ1/l+m2rp+VYZ43fGdfmWrwXmgvAVNflkkSZqSs4vKkrk6UR3TxF1UR
 V8aTbiassPuhHkFYW2x/L5AvCqT5pn3gp5r/sgESNDAnSEyT
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] iio: timestamp declaration cleanup
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
X-Rspamd-Queue-Id: 21EBB562FDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_SPAM(0.00)[0.709];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

While looking around the code, I noticed that there are a lot of places
were we are manually filling all of the fields of an IIO timestamp.

This is error-prone (as seen in the first patch) and more verbose than
it needs to be.

I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
macro for doing a struct assignment. This does require a cast, which
makes it a bit more verbose, but we were already doing that in to
drivers, so I went with it anyway.

If we want to consider alternatives, we could make a iio helper function
or macro like the first and second patches did.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/stm32-adc.c                           | 10 ++--------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 9 files changed, 13 insertions(+), 76 deletions(-)
---
base-commit: 8678fb54958893818ddeccd05fea560a4e1fc759
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
