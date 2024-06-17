Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 873E290B02F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55395C78016;
	Mon, 17 Jun 2024 13:50:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60083C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:56 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-796df041d73so313416285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632255; x=1719237055;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
 b=v24Pth+R6ECjb+NlSgXj045I98Tu489si4vTE/Ueg/VdmSCWc5jcvYU9LACSq8J5+X
 sTgNwS4pjbG4/qqFQHWfHELsZbRsJrXCKNg5MkZoKasDa1j3qUCQBejZICCMXi/2tNh7
 XLsh8Ix+Jbgz6kiPCZrhF6J10wqoXaf/+l1gT6VvSlN4POHfH9N4rUaGj2M/+o2bx8F+
 yYzaG+qdeQvAX4gzYCizwHLd3XeLh9lZB/YHI0xEJ+XVH34GunBbciVHRNp+5jDKuqL3
 slu9V6nw2VNoVgvzLqM6Utve6zxLV89qtwQCiXGpmk5utm3aHhZu/XKjjKKTI9pDTS+f
 taIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632255; x=1719237055;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
 b=cwo0fDjDpVeT1huL7aPVlxVCIKv3vIaPVNjQ/fDem5MD3wy8mcoJrawDGiom2UEw9B
 WqvV4XjJsDzb/+SFjj+/c96FCN0R/ho+UyUC+wtHzq/u7km0spW3BAEmEsHrTNGwsPYN
 v2bN5YCIbhAwx8lEu2Kx4JEu+Bg3mXanqCyppsOqB6+bTpUycnUWFn+VDHYU3UEfH6O1
 uFsrCLE1jR9VLwq4Mv0OTP7jFRcBQf+927zkAwclNmhAowIG7K9rJVM1Gf6zx7OhRvAv
 ahPapABCEAy0CqxxZ8MnHXXxwtBTDU37n8wY6AClisiADtgCnvsBJI2py3mWK+Yt4jRC
 JQRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWQHYeFTLdyBRZnbzLthsg/5TSuQvmn6QMW71s2nwJ3JQR4dQ1Q0sXjWyAArV/gyA/bEe86zjadixUmpI2ZZqk7xOiFcBOU7yKAUgIcyJLOnPLBP8ZOIuh
X-Gm-Message-State: AOJu0YzL/w0q0yKQXuSafHFdiG0k2qzxTE9emzRP+onWRC0KrBJlMx8W
 rwb9PYAZ0pCJ9AeRlSe5nFW5VbSyzb+pJvjA2aA9+BiY5EtL5mfh8Bmp51PHzwE=
X-Google-Smtp-Source: AGHT+IEp5RQjN3OqXqNMmTgCMp6Y0MDh6HV8RUCzW71+lzqdiGZxksmwSY5WI1Xptssn8y0vJEqwfQ==
X-Received: by 2002:a05:620a:1921:b0:797:74ba:8ab with SMTP id
 af79cd13be357-798d26b4a64mr1132760985a.73.1718632255523; 
 Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:13 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 33/41] iio: magnetometer: ak8974: make use
 of regmap_set_bits()
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9tYWdu
ZXRvbWV0ZXIvYWs4OTc0LmMgfCAxMSArKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9tYWdu
ZXRvbWV0ZXIvYWs4OTc0LmMgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWs4OTc0LmMKaW5k
ZXggYzc0ZDExOTQzZWM3Li43MDE3MmI5MThlMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL21h
Z25ldG9tZXRlci9hazg5NzQuYworKysgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWs4OTc0
LmMKQEAgLTMyNywxMCArMzI3LDcgQEAgc3RhdGljIGludCBhazg5NzRfdHJpZ21lYXMoc3RydWN0
IGFrODk3NCAqYWs4OTc0KQogCX0KIAogCS8qIEZvcmNlIGEgbWVhc3VyZW1lbnQgKi8KLQlyZXR1
cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGFrODk3NC0+bWFwLAotCQkJCSAgQUs4OTc0X0NUUkwzLAot
CQkJCSAgQUs4OTc0X0NUUkwzX0ZPUkNFLAotCQkJCSAgQUs4OTc0X0NUUkwzX0ZPUkNFKTsKKwly
ZXR1cm4gcmVnbWFwX3NldF9iaXRzKGFrODk3NC0+bWFwLCBBSzg5NzRfQ1RSTDMsIEFLODk3NF9D
VFJMM19GT1JDRSk7CiB9CiAKIHN0YXRpYyBpbnQgYWs4OTc0X2F3YWl0X2RyZHkoc3RydWN0IGFr
ODk3NCAqYWs4OTc0KQpAQCAtNDM4LDEwICs0MzUsOCBAQCBzdGF0aWMgaW50IGFrODk3NF9zZWxm
dGVzdChzdHJ1Y3QgYWs4OTc0ICphazg5NzQpCiAJfQogCiAJLyogVHJpZ2dlciBzZWxmLXRlc3Qg
Ki8KLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoYWs4OTc0LT5tYXAsCi0JCQlBSzg5NzRfQ1RS
TDMsCi0JCQlBSzg5NzRfQ1RSTDNfU0VMRlRFU1QsCi0JCQlBSzg5NzRfQ1RSTDNfU0VMRlRFU1Qp
OworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhhazg5NzQtPm1hcCwgQUs4OTc0X0NUUkwzLAorCQkJ
ICAgICAgQUs4OTc0X0NUUkwzX1NFTEZURVNUKTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoZGV2
LCAiY291bGQgbm90IHdyaXRlIENUUkwzXG4iKTsKIAkJcmV0dXJuIHJldDsKCi0tIAoyLjQ1LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
