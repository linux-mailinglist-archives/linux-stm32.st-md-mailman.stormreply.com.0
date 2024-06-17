Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66490B019
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C56CC78002;
	Mon, 17 Jun 2024 13:50:20 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37819C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:20 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-797f1287aa3so342732485a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632219; x=1719237019;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
 b=lDxSt4XJ5Hw16uTkpNhR4PYQDu3khrbk/bdLn7KVibQiUsInQFAWGbaHEiOvyyzIik
 1X5gDY0Gu4QHNaWQpZNfH4zatBJtGecXxQ2l0BXXoqyI24JrUq9F012sko39xpd1VA/C
 mePNrFDUMJzhTLJGI6TSLB6uLhRKrpg2C6JLPmjz1c6NKxWQSZqDem7nSEE7bLC236d9
 HgwysX2sjgPbjnzmQuXNyZqCH1uSitHU4TpriyE6SK1pEEQXMV/0UwxXkC3OxUIuC9WL
 2c2gPULiWTzpfXPRqtPNpc9gqbQvZ2AzWAcRqv4noIGRkK8UoRwQLn55UmPtqXkj57vw
 owKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632219; x=1719237019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
 b=d+COTBo9BNHoi4nbgCq8LuoO+iMY6kao7t98zT6ZPgdT7bF8mBdVdCv7U/8tqiKbXi
 68O4XCihKUCvWS62JqVGX/XkRLlyXdVYTwvrE91Wq7lZeto9rip/NcvCTwDgj2G6VEbC
 csi5qOT5rmwSWPrQgLovh8zXu8LHphNZdUpLBrGcdOVWQKv1qIdniOindE5WvdI/kyNz
 CiyPmyqIrgNbrK+46cZHcENVaWP9UmO+PgVDOMGUdaWM1BrW4QSpFZZvwb+/wwluvjsp
 xknaY/3PqEPykYkYtsjzIKtNqJ4KLxNj/Q+HXnFtHJyzGtlFHryca0yWi3E8XRo/ZSck
 v8wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEfjAXowWz+VjuiGsIWld7rVDyBz10Fr7TSOcLHMvk1jDyUeRZl/lUeWo0RgJgWwkhDHQmRktakb8MxXl+a34BJmn7mnfV5IedB9iutiS49zyBYG/Jp/XJ
X-Gm-Message-State: AOJu0YzfcKzlTq6wDk/w12Z4I1ABwjS/OE9gXxn283Gdd9uJPMHJtg0/
 NticHRPKahXI9Qg7XXTJ7TjhLyf1VGsp4SyGJseC6r8jTzZG2SyJi0gUGNFFu3s=
X-Google-Smtp-Source: AGHT+IEhAnjjomgk19gOfh4FY6+tmL+ftVg/dpR5n10Qt2NpVGAkWAorRIXV5RllBFaajmvErpGqLg==
X-Received: by 2002:a05:620a:370d:b0:796:842c:77f1 with SMTP id
 af79cd13be357-798d243aaa6mr1278103785a.36.1718632219186; 
 Mon, 17 Jun 2024 06:50:19 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:56 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-16-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 16/41] iio: adc: rn5t618-adc: make use of
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
cm41dDYxOC1hZGMuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRj
LmMgYi9kcml2ZXJzL2lpby9hZGMvcm41dDYxOC1hZGMuYwppbmRleCA2YmYzMjkwN2YwMWQuLmNl
NWYzMDExZmUwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRjLmMKKysr
IGIvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRjLmMKQEAgLTEzNyw5ICsxMzcsOCBAQCBzdGF0
aWMgaW50IHJuNXQ2MThfYWRjX3JlYWQoc3RydWN0IGlpb19kZXYgKmlpb19kZXYsCiAKIAlpbml0
X2NvbXBsZXRpb24oJmFkYy0+Y29udl9jb21wbGV0aW9uKTsKIAkvKiBzaW5nbGUgY29udmVyc2lv
biAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhhZGMtPnJuNXQ2MTgtPnJlZ21hcCwgUk41
VDYxOF9BRENDTlQzLAotCQkJCSBSTjVUNjE4X0FEQ0NOVDNfR09ET05FLAotCQkJCSBSTjVUNjE4
X0FEQ0NOVDNfR09ET05FKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoYWRjLT5ybjV0NjE4LT5y
ZWdtYXAsIFJONVQ2MThfQURDQ05UMywKKwkJCSAgICAgIFJONVQ2MThfQURDQ05UM19HT0RPTkUp
OwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40NS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
