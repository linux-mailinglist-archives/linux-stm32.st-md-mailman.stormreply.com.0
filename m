Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B290B011
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65070C78002;
	Mon, 17 Jun 2024 13:50:11 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96203C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-80b58104615so1242631241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632208; x=1719237008;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
 b=Ij0urd2vz4Eh0ZRJX6iFxMwgLSZtv7glKwg7PUqCMuDdXB68btn2XTBuSlTRhq9mNq
 0y1yoQ/pYIPE+yj0GPVTNG8lwkyKg/YwO1XSRGdmRj2dMI6+rzOKNcpcMw66S5zvtgQy
 cI4LCyIhnwFxKjr74EIRLGwidi2aP4cMhdO36YVwksfoYHVMDNH+W55PkBqmd9txdcBd
 3lrFYHvJTaoKKAuzPMcENX1dTyWKaTXH4zduMEFneLXTxvUfgBO6G4OiECKQK8ss2OIJ
 esURrpJ2xi8ztXyFiP2k/IZCgVRxMgJW2YDKnTtekXPKxECOibs8AuiG1I+OuA7BZigk
 0crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632208; x=1719237008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
 b=XcUUgtkaOWebRVAYjsOZsvLqY4AkOJBlQ9tTW+1QmlGl7/NQZnc5b3ZOwN8d4CAD4D
 YexsRCeoKVOP3X9k32IuyNLwtGX/7pA+q/doYxWYIXo78xjO+UMUPeK1zY6Rb5ZYFtzo
 PiR2HwspYyWYyvXCHO0IMEm9N07XMbaf6vEqGJLPytMFTbZsy6RjUpCikWXFr6GUsFpo
 1/2P9mSHpfEjYeoEvP6BK+K3i8QSNUz2bDV/bExtXgAG+wXDEHfXiTLKHxy2wQdnEV8e
 p3oI+Yl+X+CPD4Debk2YKY29K0p28N0b5Ml5BLD8hOigbF1OZgsrq1wNvPJKN66jQksu
 eU3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/EnpNi6wMdaknUhVpB3lUmRfXnR8tS+4QvOXJYcPTLJLqsnbnLEUwrfSsPkTQMehOqwNudsB/4mukKal1q9pGWcmA+ZoouLI5TS5yuT1JPnTQBM+/m/wu
X-Gm-Message-State: AOJu0YxOqc/9+lTHgchmcXNezxkAOOLfDAjOg82pWrhLUb99clXh1j0c
 MO6I9ssDKxMEGR1eo0QK+eYuekhQ4YETgGBiPzBF+ozSR4KjAQwrVezE/Tkyms8=
X-Google-Smtp-Source: AGHT+IExs5o6BBy2GiVBbRbl5RTcmAHYS/6pj70WZUFQ8c7/pJkIjoippgtnc/biSc9YFfMmt2B/ig==
X-Received: by 2002:a67:f783:0:b0:48d:9b03:3ff4 with SMTP id
 ada2fe7eead31-48dae3e1559mr9042383137.28.1718632208483; 
 Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:51 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-11-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
X-Mailer: b4 0.13.0
Cc: Trevor Gamblin <tgamblin@baylibre.com>, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 11/41] iio: adc: ina2xx-adc: make use of
 regmap_clear_bits()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2luYTJ4
eC1hZGMuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2luYTJ4eC1hZGMuYyBiL2RyaXZl
cnMvaWlvL2FkYy9pbmEyeHgtYWRjLmMKaW5kZXggOWU1MjIwNzM1MmZiLi43MjdlMzkwYmQ5Nzkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9pbmEyeHgtYWRjLmMKKysrIGIvZHJpdmVycy9p
aW8vYWRjL2luYTJ4eC1hZGMuYwpAQCAtMTA0Niw4ICsxMDQ2LDcgQEAgc3RhdGljIHZvaWQgaW5h
Mnh4X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWlpb19kZXZpY2VfdW5yZWdp
c3RlcihpbmRpb19kZXYpOwogCiAJLyogUG93ZXJkb3duICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0
ZV9iaXRzKGNoaXAtPnJlZ21hcCwgSU5BMlhYX0NPTkZJRywKLQkJCQkgSU5BMlhYX01PREVfTUFT
SywgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoY2hpcC0+cmVnbWFwLCBJTkEyWFhfQ09O
RklHLCBJTkEyWFhfTU9ERV9NQVNLKTsKIAlpZiAocmV0KQogCQlkZXZfd2FybigmY2xpZW50LT5k
ZXYsICJGYWlsZWQgdG8gcG93ZXIgZG93biBkZXZpY2UgKCVwZSlcbiIsCiAJCQkgRVJSX1BUUihy
ZXQpKTsKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
