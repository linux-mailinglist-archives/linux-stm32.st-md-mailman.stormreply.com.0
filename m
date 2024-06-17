Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361490B005
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:49:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA84C712A2;
	Mon, 17 Jun 2024 13:49:53 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CABF9C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:48 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-24cbb884377so2530297fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632187; x=1719236987;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
 b=BU/sbrDD6I7Yw/RYuloK7ZhN7c+rWqTYumT403N8H9HFNaBXca7lwivfbDTDL056qa
 26Drj7VRE9q/OjM52JvUbTS9wBXlNXy3Nxw9bebayEjgIMZdHj2Peq1RW9NKAUer5i5j
 yegvURTdjs8xF4Px/BeVpi5lIQ7AMGjCDMjqzpauoqQ2MwBc5WUUWSDapEme75Jzb9+M
 nIMpZkPA6H/BNOxA8t4CaqRPmsKwA0e8WeqCGH1ycP31Wi7XgZ40u4TPn24l0MQcwaxl
 gD05DjNjdAw+XFPdnEOe4t3BDXPLEWDo/FDLnCMnH8iVATvbmWrZ+D4b/3B+PMWKh8D6
 pLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632187; x=1719236987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
 b=wMQLjFPKZyrHUz5WgIC7CaKAcao9kB5R3gtw2oJ0c2RnD36rCUtZA0kMMuSB0CoD3e
 Sa6zx4SDgqD257sP9yNLgQyc4gbU3ewDeNMo9aEZDTDIdi/aWS88pT44fiynNfHdqGtR
 +lyooQ4Y+IDllxvyp/quSUP+o0jrYpOfT57sVFyFwzjwL6RXlVqmikvlywLuk8A7gXdq
 URFKKZz/FyBsBa/V6J4GNOe5m5Z7S1j9JY4+aKcpiXJY1esYGww4ud5ykq5lbuaMCDZP
 Z2E5bIif6Mx9FavXIKzr3SNLKuLJ63f2wDISES/D8lCpjmizoA1NleUnL6GMg0ax2/wg
 L4NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdogGGbUyzLdUD07tpWasjVlSnvg0aWkVlglyKoq+IECLAsDEjjuefrL2NamC1lxGinIwoXkhPLany+k3Y912v2EfPuvIwiGG36T6zGK02+UsBxuYspibN
X-Gm-Message-State: AOJu0YxJBiy0NGAJQXxBJLpHQwxN4aNE+p2QV1WR+2KA2MeCY1JlJQPi
 lY2PxwLxhymAFBMUUlvYurcttBO6K/zowLp3Hq4diHnVGGtaj0vSufY4HWEZ00E=
X-Google-Smtp-Source: AGHT+IFJGSJ8d0p4WXCzz2NyljOfF1k3KjSXOWFFs3OCSrxLmfdmtEDsU18y1hD0hfEhjyu+NXEwMw==
X-Received: by 2002:a05:6870:8188:b0:255:1bb8:85ec with SMTP id
 586e51a60fabf-2584288e46bmr10661973fac.12.1718632186790; 
 Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:41 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-1-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 01/41] iio: accel: fxls8962af-core: Make
 use of regmap_set_bits(), regmap_clear_bits()
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
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKSW5zdGVhZCBvZiB1c2luZyByZWdtYXBf
dXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMo
KS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwvZnhsczg5NjJhZi1jb3JlLmMgfCAxOCArKysr
KysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYtY29yZS5j
IGIvZHJpdmVycy9paW8vYWNjZWwvZnhsczg5NjJhZi1jb3JlLmMKaW5kZXggNGZiYzAxYmRhNjJl
Li5kMjVlMzE2MTM0MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYt
Y29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYtY29yZS5jCkBAIC0yMjgs
OCArMjI4LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX3Bvd2VyX29mZihzdHJ1Y3QgZnhsczg5
NjJhZl9kYXRhICpkYXRhKQogCiBzdGF0aWMgaW50IGZ4bHM4OTYyYWZfc3RhbmRieShzdHJ1Y3Qg
Znhsczg5NjJhZl9kYXRhICpkYXRhKQogewotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0
YS0+cmVnbWFwLCBGWExTODk2MkFGX1NFTlNfQ09ORklHMSwKLQkJCQkgIEZYTFM4OTYyQUZfU0VO
U19DT05GSUcxX0FDVElWRSwgMCk7CisJcmV0dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJl
Z21hcCwgRlhMUzg5NjJBRl9TRU5TX0NPTkZJRzEsCisJCQkJIEZYTFM4OTYyQUZfU0VOU19DT05G
SUcxX0FDVElWRSk7CiB9CiAKIHN0YXRpYyBpbnQgZnhsczg5NjJhZl9hY3RpdmUoc3RydWN0IGZ4
bHM4OTYyYWZfZGF0YSAqZGF0YSkKQEAgLTc4NSw5ICs3ODUsOCBAQCBzdGF0aWMgaW50IGZ4bHM4
OTYyYWZfcmVzZXQoc3RydWN0IGZ4bHM4OTYyYWZfZGF0YSAqZGF0YSkKIAl1bnNpZ25lZCBpbnQg
cmVnOwogCWludCByZXQ7CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBGWExTODk2MkFGX1NFTlNfQ09ORklHMSwKLQkJCQkgRlhMUzg5NjJBRl9TRU5TX0NPTkZJRzFf
UlNULAotCQkJCSBGWExTODk2MkFGX1NFTlNfQ09ORklHMV9SU1QpOworCXJldCA9IHJlZ21hcF9z
ZXRfYml0cyhkYXRhLT5yZWdtYXAsIEZYTFM4OTYyQUZfU0VOU19DT05GSUcxLAorCQkJICAgICAg
RlhMUzg5NjJBRl9TRU5TX0NPTkZJRzFfUlNUKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
CkBAIC04MzAsOSArODI5LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX2J1ZmZlcl9wb3N0ZW5h
YmxlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJZnhsczg5NjJhZl9zdGFuZGJ5KGRhdGEp
OwogCiAJLyogRW5hYmxlIGJ1ZmZlciBpbnRlcnJ1cHQgKi8KLQlyZXQgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGF0YS0+cmVnbWFwLCBGWExTODk2MkFGX0lOVF9FTiwKLQkJCQkgRlhMUzg5NjJBRl9J
TlRfRU5fQlVGX0VOLAotCQkJCSBGWExTODk2MkFGX0lOVF9FTl9CVUZfRU4pOworCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhkYXRhLT5yZWdtYXAsIEZYTFM4OTYyQUZfSU5UX0VOLAorCQkJICAgICAg
RlhMUzg5NjJBRl9JTlRfRU5fQlVGX0VOKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBA
IC04NTEsOCArODQ5LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX2J1ZmZlcl9wcmVkaXNhYmxl
KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJZnhsczg5NjJhZl9zdGFuZGJ5KGRhdGEpOwog
CiAJLyogRGlzYWJsZSBidWZmZXIgaW50ZXJydXB0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9i
aXRzKGRhdGEtPnJlZ21hcCwgRlhMUzg5NjJBRl9JTlRfRU4sCi0JCQkJIEZYTFM4OTYyQUZfSU5U
X0VOX0JVRl9FTiwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBG
WExTODk2MkFGX0lOVF9FTiwKKwkJCQlGWExTODk2MkFGX0lOVF9FTl9CVUZfRU4pOwogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
