Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FA90B037
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93453C78014;
	Mon, 17 Jun 2024 13:51:09 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A83AC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:07 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7953f1dcb01so389095485a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632266; x=1719237066;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
 b=bed7YAxsIAn8FTNWOOUbBP3vi6/nk2LT4iWA7IsNoIp6MSo/fMdLo02+v9vEJKgYRI
 nIbca3M08ZAfULddxPIu8M08GytKD9bzD6FyXiMOkFvgUtgIOMYWMD3zH40iGmujcDuH
 lgv5yfoY/AToWvsPBiRfUYPiKzlQw/IOmRrR8xbhshi0awlQRh4fbtanAdcj/0NGjrbT
 dUyxG1ZfyHeVaXNlAOzBqeFN4jUR7N3FZgKuXFiudjzQHd90swnqlQSKTcyA4NwB7hIc
 SsOb4zDeLK6Hiq1Oicr8aY8s39Yx42vDuw/00y9DnkUwksEMN9rzkrjDpnA3ZoPX692V
 /B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632266; x=1719237066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
 b=QKAbfR0v5hAs3mBaexM/TBgeabbLeiEhyUEECoMHQCu9I8fwZBd75KJBeolVCRvCDQ
 0KAR6SgRzUChMOToz8w2PUOkH8ldykEh0ZYEjdZ4UnFad0msVpXxVqqt0S7Zg+0UBxyE
 HrUssaR+HrqV/stdXvBzV+d0NA752DnzRT4YSb1mHzqIK2mYHspBAZxV/9iRPjwKFwYy
 fW9IAHjDzfEJWy83Zj3O6D0XMcSdjglgwklggdZmT+p+UMjn/pO2415x4rRGQHI4CiTA
 4TOHF6L/V8rAQIXPz4uuVy4eq/QLX44XOkxVru6iuVjyI4bv/Zh6sheGxKp0pUISTQX4
 1FFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg8qB9DmEor/GusixycGCKIyDGoGBin0mQkCFApEmo5kchMS+MBkmlRxJxMXgeTSW32nbYVmZUvB5w1YwUxQF8Lwv4tmBwNC/8pg7KHliX3/Dj0SN50+Tl
X-Gm-Message-State: AOJu0YxPFprX296J5I8dt7zadXqf8/Sd8EebA2hBseoAzRGQwz1NKxeU
 P224g3jKeuH5U3QmMFhpZxp12juw5nntP3afMtL69lbPfSeqRz84xNuWs+/ZBzk=
X-Google-Smtp-Source: AGHT+IEx2KbRAk7Gdof/baHhrw8Y3qRBi2Hyio6LTg74NUhbwR1HRET1Zcy3yDqPrTQiSKqEfswRkA==
X-Received: by 2002:a05:620a:1a86:b0:795:5d6f:8bbd with SMTP id
 af79cd13be357-798d26a4644mr1303274985a.73.1718632266285; 
 Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:18 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-38-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 38/41] iio: proximity: sx9500: make use of
 regmap_clear_bits(), regmap_set_bits()
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTUwMC5jIHwgMTIgKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDk1MDAuYyBiL2RyaXZlcnMvaWlvL3By
b3hpbWl0eS9zeDk1MDAuYwppbmRleCA1NTBlN2QzY2Q1ZWUuLjQ5ZjRjY2Q4YTVjNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTUwMC5jCisrKyBiL2RyaXZlcnMvaWlvL3By
b3hpbWl0eS9zeDk1MDAuYwpAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgc3g5NTAwX2lu
Y191c2VycyhzdHJ1Y3Qgc3g5NTAwX2RhdGEgKmRhdGEsIGludCAqY291bnRlciwKIAkJLyogQml0
IGlzIGFscmVhZHkgYWN0aXZlLCBub3RoaW5nIHRvIGRvLiAqLwogCQlyZXR1cm4gMDsKIAotCXJl
dHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCByZWcsIGJpdG1hc2ssIGJpdG1h
c2spOworCXJldHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCByZWcsIGJpdG1hc2sp
OwogfQogCiBzdGF0aWMgaW50IHN4OTUwMF9kZWNfdXNlcnMoc3RydWN0IHN4OTUwMF9kYXRhICpk
YXRhLCBpbnQgKmNvdW50ZXIsCkBAIC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGludCBzeDk1MDBf
ZGVjX3VzZXJzKHN0cnVjdCBzeDk1MDBfZGF0YSAqZGF0YSwgaW50ICpjb3VudGVyLAogCQkvKiBU
aGVyZSBhcmUgbW9yZSB1c2VycywgZG8gbm90IGRlYWN0aXZhdGUuICovCiAJCXJldHVybiAwOwog
Ci0JcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIHJlZywgYml0bWFzaywg
MCk7CisJcmV0dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJlZ21hcCwgcmVnLCBiaXRtYXNr
KTsKIH0KIAogc3RhdGljIGludCBzeDk1MDBfaW5jX2NoYW5fdXNlcnMoc3RydWN0IHN4OTUwMF9k
YXRhICpkYXRhLCBpbnQgY2hhbikKQEAgLTc5NSw4ICs3OTUsOCBAQCBzdGF0aWMgaW50IHN4OTUw
MF9pbml0X2NvbXBlbnNhdGlvbihzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQogCWludCBpLCBy
ZXQ7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRh
LT5yZWdtYXAsIFNYOTUwMF9SRUdfUFJPWF9DVFJMMCwKLQkJCQkgU1g5NTAwX0NIQU5fTUFTSywg
U1g5NTAwX0NIQU5fTUFTSyk7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJlZ21hcCwg
U1g5NTAwX1JFR19QUk9YX0NUUkwwLAorCQkJICAgICAgU1g5NTAwX0NIQU5fTUFTSyk7CiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKQEAgLTgxNSw4ICs4MTUsOCBAQCBzdGF0aWMgaW50
IHN4OTUwMF9pbml0X2NvbXBlbnNhdGlvbihzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQogCX0K
IAogb3V0OgotCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNYOTUwMF9SRUdfUFJP
WF9DVFJMMCwKLQkJCSAgIFNYOTUwMF9DSEFOX01BU0ssIDApOworCXJlZ21hcF9jbGVhcl9iaXRz
KGRhdGEtPnJlZ21hcCwgU1g5NTAwX1JFR19QUk9YX0NUUkwwLAorCQkJICBTWDk1MDBfQ0hBTl9N
QVNLKTsKIAlyZXR1cm4gcmV0OwogfQogCgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
