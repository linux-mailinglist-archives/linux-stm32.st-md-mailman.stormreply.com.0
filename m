Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42090B026
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B87C78002;
	Mon, 17 Jun 2024 13:50:43 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C40ECC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:41 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7955f3d4516so481906485a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632241; x=1719237041;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
 b=QbdIfVEGbGwiWeRKYwNCu1sYyeS6jlZerJySf/9VEsqHk84Kc6SDp9ibiyed/UA/L4
 iV+2LIGfgnJQ9zN8IVrNHm4NBVb4mmDDuuyz92QSrvynhsDMA5tYaTRuwnvKBRiDoA6c
 xMbXju5i+P2rNKMHLO6i1Vf2gl/wGhh4HkRvLDD7lGW+V/MchvVFgGpw4OXIyqb/toyD
 48FuZ6JDA2rwpzqrqsLxTdH+mg0YUB85MDRcnhNUGxW+ZsUTstrzOn4dsBWLGT4J0syp
 rY1Pq+rYqF3UA/69Wo6HzF3UFriKCclW+nLSfllifN8qi2IdG7z+RMOLXWLK9Kn9mWRQ
 i7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632241; x=1719237041;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
 b=YiPpv7SRVsv4wnCzVQnusNrHohfHhBBY3p5Wf2TwwXtbrdosX5C4CBa0/WwWGiJc5a
 xfBvjVmKXtgOkTMxUa1Yn+yGeJsElpK4tT+B5N6juKGqhx2drW/uxbtMKvag9Iyhgi+f
 +hrH764QaE3jza/potupIZJU6pujAIYh3eSmoZB6cTGvRiQziPXctoENvJ3YL+I0f2Xf
 FXQsU8vyI77IQomDTiY51zhzNPSVCnFdB4POIdg4rWB6PdQV2pxLibPIp/9eHevrUMMG
 oC6kpaw0UMZpM/M2zweFIcXCLbRmWeOAQTCAMPSr+S/ZvzpUyZMUTo9XBtj1MaiDfXMU
 o+Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWjaZ7SOFBtm/lIjMmapi35iCAfjhKoOqnX8SxpogABIvKMiizK4oJFh1my6oUiHgRp40hw2f5K4LqbrGyYNtoDkGOQlw5U6u4tjvPEhvb7FrKJEY6/ZzY
X-Gm-Message-State: AOJu0Yz0w8W51Q5pyuiCUjuY6s7KLlA6u5l55mAF/w3zWIO342on8YnD
 5CN64iHEXRoyfO52Z1vgFEDvkyTWXF6d4moGFJ7yh+zAJ7A5E1MLHpmv4y1fC3g=
X-Google-Smtp-Source: AGHT+IEvNWEsHTIz+Kh5SLMDJk99l/NCyLAOM78IKPUk0tI5a9ZCslYv7WlkhqmAtTcQfPh0VS34pA==
X-Received: by 2002:a05:620a:2981:b0:795:5469:1b32 with SMTP id
 af79cd13be357-798d0242f64mr1752044785a.18.1718632240726; 
 Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:06 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-26-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 26/41] iio: health: max30102: make use of
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
dGgvbWF4MzAxMDIuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAy
LmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDIuYwppbmRleCA2NjE2NzI5YWY1YjcuLjA3
YTM0M2UzNWE4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAyLmMKKysr
IGIvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAyLmMKQEAgLTQ0OCw5ICs0NDgsOCBAQCBzdGF0
aWMgaW50IG1heDMwMTAyX2dldF90ZW1wKHN0cnVjdCBtYXgzMDEwMl9kYXRhICpkYXRhLCBpbnQg
KnZhbCwgYm9vbCBlbikKIAl9CiAKIAkvKiBzdGFydCBhY3F1aXNpdGlvbiAqLwotCXJldCA9IHJl
Z21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIE1BWDMwMTAyX1JFR19URU1QX0NPTkZJRywK
LQkJCQkgTUFYMzAxMDJfUkVHX1RFTVBfQ09ORklHX1RFTVBfRU4sCi0JCQkJIE1BWDMwMTAyX1JF
R19URU1QX0NPTkZJR19URU1QX0VOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVn
bWFwLCBNQVgzMDEwMl9SRUdfVEVNUF9DT05GSUcsCisJCQkgICAgICBNQVgzMDEwMl9SRUdfVEVN
UF9DT05GSUdfVEVNUF9FTik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKCi0tIAoyLjQ1LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
