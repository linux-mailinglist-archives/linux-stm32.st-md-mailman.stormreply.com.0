Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8790B01C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED10C78002;
	Mon, 17 Jun 2024 13:50:27 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B3BC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:26 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3d226aff122so2395644b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632225; x=1719237025;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
 b=ikBAIHO6tarppM1iT1Hl54JBL1P+o+UMNHFFT3pl6XCP0kxLRdl8FH4YoNjHYd2gKW
 d3wLd/ZkhydYxShuylii0pmZN113XbxnMARJVY33H3nav0z76dJzQuBOzomutmBCU8/X
 VluZba+ZSOIPmZUI2KAdgAguNwgrzL28hm/mJz2k91KPs4lk5iQhjgNTGAKw1cA4t3YG
 YO4xz3Y7BfDpyZDEE2PtKQahqUmqAYKGf5KZV5+o3WI8vUpgCnJ+bRvLfD2FoqKYXZ1X
 hez194yKnl3QK/GdJRxytYFjPLBcI/9PxCmnH83FsJMixctPiINuA0yrpW6mjKZqLPhi
 zLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632225; x=1719237025;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
 b=csz2ri9jf45gjdMQ0POo1ze2d396UebG5tYtiEL3w5mado/ahmZ+9ZSv7hXzZK4YHQ
 j6C3uoUYeDjWi0Rks7+jYyyJ2+1gMA6PCiiCHovtf1xHeQBhlL6E18e0pU9M4ByzqURu
 wXlNVRaYoxQrka7hCrFEFy5IgnCoBAzNvJvLd1LA8Zr+DPsXxvSPGzvUO3psxSyPLc/X
 S5BjK40nOqEMYWakMYvlm2l8YI4V+KbQBHewUQiWAlNYzT+UMKx7w713J8NCtF4mWVRb
 pw8reKoMds7GXB+jDhsYc5CGhWqHI/BLmwnnx2XLNw1A3DLOdg/yd6OO4laHmuGFs0Jk
 f11g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVt0yEVrXkDczNAqkGXpl1e9LBf7FWfK8SR69Tj05rOmhSlTyR2x8mFg+Yb7rwYTNgLQyzfN8zOl/NYEWV3wAilQgDUM/or//tw0kv9orOlr90H0Hp9776
X-Gm-Message-State: AOJu0YxAELUsIDCIo/X4g2W2s//BQW4W9DQtBd/1ftmvq3vPbA83ukxo
 pVmUB3vx9g1QVbd0Yo8J9Ehv63TRNwBZ+T0GZZ+/smtG7QpsVCiHj7N+o0Gf4IM=
X-Google-Smtp-Source: AGHT+IFvblxIubOLu7csKqd2DaYsYhFE9mHOS6tHSYRNjsfIzum/J8kKl7oiGVOQ0fHTuqtXTzPk8w==
X-Received: by 2002:a05:6870:d383:b0:254:ac99:1152 with SMTP id
 586e51a60fabf-25842baade0mr8855321fac.58.1718632225631; 
 Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:59 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 19/41] iio: dac: ltc2688: make use of
	regmap_set_bits()
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9kYWMv
bHRjMjY4OC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9kYWMvbHRjMjY4OC5jIGIvZHJp
dmVycy9paW8vZGFjL2x0YzI2ODguYwppbmRleCBjNGIxYmEzMGY5MzUuLmFmNTBkMmE5NTg5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZGFjL2x0YzI2ODguYworKysgYi9kcml2ZXJzL2lpby9k
YWMvbHRjMjY4OC5jCkBAIC04NjAsOSArODYwLDggQEAgc3RhdGljIGludCBsdGMyNjg4X3NldHVw
KHN0cnVjdCBsdGMyNjg4X3N0YXRlICpzdCwgc3RydWN0IHJlZ3VsYXRvciAqdnJlZikKIAkJLyog
YnJpbmcgZGV2aWNlIG91dCBvZiByZXNldCAqLwogCQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAo
Z3BpbywgMCk7CiAJfSBlbHNlIHsKLQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHN0LT5yZWdt
YXAsIExUQzI2ODhfQ01EX0NPTkZJRywKLQkJCQkJIExUQzI2ODhfQ09ORklHX1JTVCwKLQkJCQkJ
IExUQzI2ODhfQ09ORklHX1JTVCk7CisJCXJldCA9IHJlZ21hcF9zZXRfYml0cyhzdC0+cmVnbWFw
LCBMVEMyNjg4X0NNRF9DT05GSUcsCisJCQkJICAgICAgTFRDMjY4OF9DT05GSUdfUlNUKTsKIAkJ
aWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQoKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
