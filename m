Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKtBEGaoE2ptEgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C38D55C5318
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 03:39:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A395C87EC4;
	Mon, 25 May 2026 01:39:49 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FB20C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 01:39:46 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-47c918c62b4so6042600b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2026 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779673185; x=1780277985;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
 b=IwCEqJSX2EKjFLzQUXqeLPhO8D57xa9n0vwsaSm5yjFXL5o8yBlP8vUgIS2i6MGSt1
 P7zKQRrkL73akgouypJqx/riErySmvDlPk7W/6vIJaaxPEjgeGan8Vd0PBimV3/ipc7A
 99sVo8u/xhLAin242fqV5V956uggYU9gAVMCzQEXmM/1DaUmqya3MGBXb64FDh4Ly6ZF
 B4mdPCEhcXqfG+y5h5EOrUp+liB0fvUj/kqd3hYucjpN3gSW44aziXY7QWPZYYASdZna
 vdzTSE9EO6GmdJTW7/jYKELpWLBtK+eVMhxiemwfLU20XCf9BA1cYc+yQl5EhZtw2ria
 +q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779673185; x=1780277985;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ugzb2uhvCgbHvggVe5Xy5Mt/HBvzlMq1ELLD59c9p5s=;
 b=j4m+13GWKa7ANV6ev/MEYd8ltmj4r5d9Xc4rBYb7dMncC2XUreGEOFMpyEYmrtOikT
 aU2H1+0ArErl6f+JcVShk/pznDVyDOg2D4gEP+9rSQg/Em6j+JYTlIctpbChy9cHDEqk
 aqZtwkAmw0J3RD55L9ZGptsbLCZIbl4IB9qMK039iVyJGxunpYpPMDIrBVxPzVs3xP61
 zjT4QsAGbHbA3MnnkW/0+Epk+vmQc/28LmRd4HlTUd8pfpo81WCfDr1WR585vM1owvYc
 xegg8J861oQlvQrR7K3omhaCO+zWg/A5nnjgRBMDicmsV6nhYqgkRdhnZCH/MVZUrqql
 IC4w==
X-Forwarded-Encrypted: i=1;
 AFNElJ91u0f2LLjO2tbOQB3eec/XOsoUwnsKbbvoDYBR4t3E2YCOWwoT5Ng5XrVhbKH4BjwsgMuUWdTa7Ycp0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCpLl9a3VTkPTk8fdwkC6WfFapgzh7DAS3Wt1jxKnnuiC/cQB/
 fzoTFYeBE4G2QT7qOM12uFX/hOgoytN4gblKjqhvjzvztDsd9s/Pik+mr7eb1B2o3iE=
X-Gm-Gg: Acq92OGGyhubGeg4gbf7h+wStmkioHSygYlJeCfWtBWj0pCsq8+p+2iV1k1BIVuHLh4
 Can7hxb+DsXiy6vB0dFIa5u7/GS/UNGO//oViu5v2p7bpg51XZ5/7TgHhSFfw4ead41ex9v2MrM
 XlsckkzlVDIpv9O5pi6FxdS+jRBeSiO/zyXjz9G99siPuGFGBevcX59SzFw0tK1t3vl+vDtww2U
 TQt6YSQ1EfLwF1fatDYLll5hM+PHbnfpQYN40tanQXE0JaV6G20uQxX57J4uKzpFUPllmcytmVm
 huzBxuWEkzuRaHky0pEUGR1/7wW3U61WTVmfx+9qrjBJ59p0p6CfnL3UdnK3q2CTyk+h0zRY+ty
 FuJukgArQPiHGIGB6J1q/ioED877fVnz/BmhmWziC2Mnr8/OKgcYyUiy/+uJOhUp1a6BBoaXFq3
 HLC5+QHSVmOr4ngU0YuK+XwyeNr6nK20VpAf59v68=
X-Received: by 2002:a05:6808:6d91:b0:482:6617:d48c with SMTP id
 5614622812f47-4854a3fa3ecmr7151437b6e.25.1779673184828; 
 Sun, 24 May 2026 18:39:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2026 18:39:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:32 -0500
Message-Id: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhOEwFdeQ/Doq2DjAFK2kIkh
 LsLeACXL3n//QUiB+EIt2yBwJNE8f0G+pSBa0z/YpTnxqCVztWFChTxmKTjmEw3oGvZ9OOAxFz
 qWpVkCgXbdghcy+foPqofx9G+2aU9thuNxOTDfBxPtHv/PiZChTnV9qpKR+SKuzVzKzbw2fkOq
 nVdvxzXaOTPAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=dlechner@baylibre.com; 
 h=from:subject:message-id;
 bh=SuM+0HC7hGWwJTXikbJW5wAJ2RsorksevrifGcg2M1E=; 
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6gdwg4bNuqtGlue/M8kGDelpLpEt8ocyZess
 h3XIm/Xy7KJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoHQAKCRDCzCAB/wGP
 wCjwB/0d574jaJgFsVylSeUV+cUbUscg33m5FcKKHwaNx155nm1c9St0Sx1qnegu8MScNk7qlwA
 IZrN6rt/OLuCilqv0tZ+d1G6OCOddqTXnSLNEqVwi2QcSqspOnK3p8s4LEmU2hfDTma2HoLK07a
 8uSQMkAKzKpihnbPSkv3DYVtXrwxkJS+s07b+b5m6RHgvNbI9hkAvvuSQ7yMGTv4bIiqSAjKf3W
 qEkUeE59f1oEoAAMCxzXop6HfJqY98nUdiw/+3H4Fiyw4fLZjpNQio3yNnqF29RH6WhY9cmozex
 MpuyplJC3Mf1xx9foHj3P6/L2IeIXEPXOysM7TmEc4r56XXQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
Cc: chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/9] iio: timestamp declaration cleanup
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
	NEURAL_HAM(-0.00)[-0.600];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,st-md-mailman.stormreply.com:rdns,msgid.link:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C38D55C5318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While looking around the code, I noticed that there are a lot of places
were we are manually filling all of the fields of an IIO timestamp.

This is error-prone (as seen in the first patch) and more verbose than
it needs to be.

Thanks to Andy's patch, we can just make the macro a compound literal
so it can be used directly in assignments and initializers.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Include Andy's compound literal patch.
- Drop explicity compound literal in later patches.
- Link to v1: https://patch.msgid.link/20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com

---
Andy Shevchenko (1):
      iio: Convert IIO_CHAN_SOFT_TIMESTAMP() to be compound literal

David Lechner (8):
      iio: common: scmi_sensors: simplify timestamp channel definition
      iio: adc: dln2-adc: simplify timestamp channel definition
      iio: adc: at91_adc: simplify timestamp channel definition
      iio: adc: cc10001_adc: simplify timestamp channel definition
      iio: adc: stm32-adc: simplify timestamp channel definition
      iio: common: cros_ec_sensors: simplify timestamp channel definition
      iio: light: cros_ec_light_prox: simplify timestamp channel definition
      iio: pressure: cros_ec_baro: simplify timestamp channel definition

 drivers/iio/adc/ad7606.c                              |  2 +-
 drivers/iio/adc/at91_adc.c                            | 12 +++---------
 drivers/iio/adc/cc10001_adc.c                         | 10 ++--------
 drivers/iio/adc/dln2-adc.c                            | 12 +-----------
 drivers/iio/adc/max11410.c                            |  2 +-
 drivers/iio/adc/stm32-adc.c                           | 10 +---------
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c |  8 +-------
 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c  |  8 +-------
 drivers/iio/common/scmi_sensors/scmi_iio.c            | 13 +------------
 drivers/iio/light/cros_ec_light_prox.c                |  8 +-------
 drivers/iio/pressure/cros_ec_baro.c                   |  8 +-------
 include/linux/iio/iio.h                               |  6 +++---
 12 files changed, 17 insertions(+), 82 deletions(-)
---
base-commit: e1a29334a9c043defe7a9363fa76d399d3fdfbec
change-id: 20260517-iio-timestamp-cleanup-1ee82f081a70

Best regards,
--  
David Lechner <dlechner@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
