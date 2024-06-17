Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A056890B033
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 666DAC78012;
	Mon, 17 Jun 2024 13:51:02 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C98BAC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:58 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-797a8cfc4ecso274090085a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632258; x=1719237058;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
 b=hrxnCPsqeQZIw+lnvsgNJuGP8/q5G1UjxvFT7tJUwyhp9xASAK/5FGfT/X8aMe8xE4
 K2Tf02Z/a5owZ9CAWY5q05VQ0Kw2+bTNaK6WbGnQ9lVZJGctqkMo3NAk724ZxVPynLwd
 5fAeXUJLlxnPDZr4exJP7k7tdTmsQq8njLmQR4AF8pMTKFAZWNzKTa+6bMNB9A2bc0nX
 EaMxZNcnEouQ/wWa5ViN6e3w2BTHlaKwEn3pa+oH59qKUyzz1PvllacuUOg1sK3WLORj
 PkEuxHvBlfGQii+jd3lfOmZhhQYtnOYy9TV1ixBOzxpplgZ3UIVn3TvJnXjPpwPDLTfY
 NbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632258; x=1719237058;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
 b=oR4LVJWHS+PYodsQHjS0RRe+KhfzY9eQ3c3Ho/tYQoZIPHLk0LE4W0ajYEq8Csw3Zr
 9GTV8PNdUTBPeiRIlMNCANlL/SXM5oHM+lN6r0wd6z6Mj4+1q8Hr8/qbmXfB5K1B22tW
 IX0F2A9M0FSgK8rG2Pb6AzAKt2oEGS6BuoTm30n2J7QQ11zw5XeyZ8f+AgSA97eDHIle
 02B7hY+pwfgrUEnR4WTL1GL27UVPpzfhaqUyV91ZMHI4LKILfCMIS5C6xvr7VJJbu0ZA
 KMsuNcDWDRzaV8tCbtzA5Q4MyHM6NXJhK4P53a8VxZvv/zhZxWZ4HkKV3kL4a4LNauUl
 DfVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxOIkOvayYFeBu0uaqjBfnCtZnqF1XrM+Qx8NyaQJfNc1TZAgbwBhcZj9JP1sjwdFZH6PxQWORbdZnzivsrzQR7fgBHigs5ON5Zng9Ptn2kkIiToAQyI/g
X-Gm-Message-State: AOJu0Yy7TEXXu3a0gTzDQaBE2dV3Fwez+5X4vYaMPnQ9e9/cU729vSqm
 Q6erpC+in0uZf4CqPTmTwW4KOfjbWupUtUPhbtQ/rfgocaDEylTztxt9gvr5txU=
X-Google-Smtp-Source: AGHT+IHIgplKyy0pftg/5a2SG9pITo7fxr5SdNNjpCXiI/wTi4jbCSV+DPabl4pWpKgzNJgkUownfQ==
X-Received: by 2002:a05:620a:2684:b0:797:8ee3:9f01 with SMTP id
 af79cd13be357-798d2437ce1mr1017310785a.34.1718632257705; 
 Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:14 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-34-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 34/41] iio: magnetometer: mmc35240: make
 use of regmap_set_bits()
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
ZXRvbWV0ZXIvbW1jMzUyNDAuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vbWFnbmV0
b21ldGVyL21tYzM1MjQwLmMgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvbW1jMzUyNDAuYwpp
bmRleCA2YjlmNGIwNTYxOTEuLmVjMzVlOTU0M2E5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8v
bWFnbmV0b21ldGVyL21tYzM1MjQwLmMKKysrIGIvZHJpdmVycy9paW8vbWFnbmV0b21ldGVyL21t
YzM1MjQwLmMKQEAgLTE4Niw5ICsxODYsOCBAQCBzdGF0aWMgaW50IG1tYzM1MjQwX2h3X3NldChz
dHJ1Y3QgbW1jMzUyNDBfZGF0YSAqZGF0YSwgYm9vbCBzZXQpCiAJICogUmVjaGFyZ2UgdGhlIGNh
cGFjaXRvciBhdCBWQ0FQIHBpbiwgcmVxdWVzdGVkIHRvIGJlIGlzc3VlZAogCSAqIGJlZm9yZSBh
IFNFVC9SRVNFVCBjb21tYW5kLgogCSAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRh
LT5yZWdtYXAsIE1NQzM1MjQwX1JFR19DVFJMMCwKLQkJCQkgTU1DMzUyNDBfQ1RSTDBfUkVGSUxM
X0JJVCwKLQkJCQkgTU1DMzUyNDBfQ1RSTDBfUkVGSUxMX0JJVCk7CisJcmV0ID0gcmVnbWFwX3Nl
dF9iaXRzKGRhdGEtPnJlZ21hcCwgTU1DMzUyNDBfUkVHX0NUUkwwLAorCQkJICAgICAgTU1DMzUy
NDBfQ1RSTDBfUkVGSUxMX0JJVCk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAJdXNs
ZWVwX3JhbmdlKE1NQzM1MjQwX1dBSVRfQ0hBUkdFX1BVTVAsIE1NQzM1MjQwX1dBSVRfQ0hBUkdF
X1BVTVAgKyAxKTsKQEAgLTE5OCw4ICsxOTcsNyBAQCBzdGF0aWMgaW50IG1tYzM1MjQwX2h3X3Nl
dChzdHJ1Y3QgbW1jMzUyNDBfZGF0YSAqZGF0YSwgYm9vbCBzZXQpCiAJZWxzZQogCQljb2lsX2Jp
dCA9IE1NQzM1MjQwX0NUUkwwX1JFU0VUX0JJVDsKIAotCXJldHVybiByZWdtYXBfdXBkYXRlX2Jp
dHMoZGF0YS0+cmVnbWFwLCBNTUMzNTI0MF9SRUdfQ1RSTDAsCi0JCQkJICBjb2lsX2JpdCwgY29p
bF9iaXQpOworCXJldHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBNTUMzNTI0MF9S
RUdfQ1RSTDAsIGNvaWxfYml0KTsKIAogfQogCgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
