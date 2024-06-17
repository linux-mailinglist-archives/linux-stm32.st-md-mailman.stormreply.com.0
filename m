Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD890B025
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 086B0C78002;
	Mon, 17 Jun 2024 13:50:41 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0CF0C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:39 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-795502843ccso252193185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632238; x=1719237038;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
 b=gNWBNkTdmPAU9ZQf3EmnXkhqsYZtQWq60iTs3HvrsOujd58neqlK4RS1JtOx+OnbHT
 TpmaJXlyIZKu2LQSe9qVkVCUJkuffY+68xXZEKwywkML7D7B6t/1CZsb2K2OuSNrTXSw
 jBJvggGbYFQZ7rmeQArCVwH08wsVNGrQlLhB2e4u79mZUlNtnFm3m/2xIbW4NjRfKUPV
 CX3HQ9tB5PjADcXO6oy4HKPZ5JREIo3VZM1o79ZK0zM6mZFpCJcQnS1grkhL+hpR+mlF
 JElN72vH1VzFEpm3MYKFFPnOS/uJqgsZfYnSF3LTtpA7YolnO1QGPBSfeJ8Einrf+p8N
 CHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632238; x=1719237038;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
 b=R9qPkFWO+78OtDJmm4XOo9Od7TYm+A931SiItGbCnyH7Fnncr+C5tLnDnFuUqkpnaK
 1ePG9UNVv91NW5THLWpHeiCnJiMenyot39vk8tRbYdTVYvKDk2deu9FBV3jTIAtt8Wbp
 3/xtW9VUlsgQ8R1xIVJY86/yQhFEz51o6MWkFzArI2FKSaPC09Mdk79e73oj/KtPXAO9
 H53Hwm6FK3sKUY0Z9vu4zFjovpILPfOTwIsOjNajQDEz3Ebp0WkOpOxKsCANYzLxEY+5
 soXN4BAnIL+U/Fz+MjZpdOigEJmUf6oFVQy2IWhBFM/MT3zWONX/lEdvNBFQNoiOYQXo
 QsjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKxktak9Fnb1Ezie+GM3fPQI0fjCKPdAukN2xYV1ZKnYYwpJ0qAEVQihONZiEewkX1+c4qpTkCORTWMpZa9O8zn2yM/sr2B4M94YbXTTzjKO+6ojJmBPxr
X-Gm-Message-State: AOJu0YxpuRCpoSIxGPDg7W6ZtyBNLm1kdub5pY6mjvkIlH/sXadQET9E
 Mfsvc395e/FUdco2lcwp862sWUZRbMKDCioRj13aTvBsajSox7HH9p1fKsCXf+o=
X-Google-Smtp-Source: AGHT+IFPBsXk8OC1fXhOsjN5sQEyfL0NaDJoRNSti0BCnQHlNJa0XX2KPq4TD0tgoqruv2mBvc8G+w==
X-Received: by 2002:a05:620a:2947:b0:795:60b0:3f5 with SMTP id
 af79cd13be357-798d2430e27mr984123785a.34.1718632238585; 
 Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:05 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-25-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 25/41] iio: health: max30100: make use of
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9oZWFs
dGgvbWF4MzAxMDAuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAw
LmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDAuYwppbmRleCA2MjM2YjRkOTYxMzcuLmMx
ODY3YzJlZjhlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAwLmMKKysr
IGIvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAwLmMKQEAgLTM2Myw5ICszNjMsOCBAQCBzdGF0
aWMgaW50IG1heDMwMTAwX2dldF90ZW1wKHN0cnVjdCBtYXgzMDEwMF9kYXRhICpkYXRhLCBpbnQg
KnZhbCkKIAlpbnQgcmV0OwogCiAJLyogc3RhcnQgYWNxdWlzaXRpb24gKi8KLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBNQVgzMDEwMF9SRUdfTU9ERV9DT05GSUcsCi0J
CQkJIE1BWDMwMTAwX1JFR19NT0RFX0NPTkZJR19URU1QX0VOLAotCQkJCSBNQVgzMDEwMF9SRUdf
TU9ERV9DT05GSUdfVEVNUF9FTik7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJlZ21h
cCwgTUFYMzAxMDBfUkVHX01PREVfQ09ORklHLAorCQkJICAgICAgTUFYMzAxMDBfUkVHX01PREVf
Q09ORklHX1RFTVBfRU4pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
