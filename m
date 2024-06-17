Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398D90B006
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:49:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED565C78002;
	Mon, 17 Jun 2024 13:49:53 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C62C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:52 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7965d034cedso284170485a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632191; x=1719236991;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+qpLBIScyQiW6pZURHAKIC6sw71J1lEFsgxMlm6mPzw=;
 b=WluYptxj1jDu81hEQ6mZiyR4xRlU63xv6V3aagv+n75dah3zB9cYqDBwyqnoyQpm5v
 b3Z/kV9O0qI2eWtp7WoJu2+vH4bf61Yq07X3+YDiMejYoeM/E2wCbM/HN8N8K1XjBBaw
 OjM+obZPIFNGK5NkL4ksHYfYuIISjKSNW5fJRc/445VS43l5uN2o+pDi8VbhPHwYVUdI
 xFf2Nzh/pYJVfWxBktJ0tALNnlCowRURLtBlfFSY3a6QYyLBaCi2OqR4a2ly9sOUTgH6
 bNQJI4RNbHxH3GeHI2Gmbj1x0Qkma+uML2coIQejEAUqzgnbw8MGYN64mImaJxQDw5JW
 auUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632191; x=1719236991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+qpLBIScyQiW6pZURHAKIC6sw71J1lEFsgxMlm6mPzw=;
 b=W8JwN1yyBXcHsCKImFHHyv3WR10DikA1/MwOsTaMPCXay8rowKwk3Q5taqSzUsNi1Z
 yfEwe2vThflpNjmw+bAFdRbqDqKwoz56qUQ4xZFqC+SFtdliMTa86J/KCKUTCA3EgPLq
 l32Eiep8pEqDRCx1iSaUm9HleQG1RgiP8MHj6Lv91NSFbivGQLsllXtPl7J5DN4wD1fg
 W9uJXNkyBlHuDJ1hz0dk1hjnyxhDPSiP+C61LBsZuVdMQKQt0KtndM076VnlRPIA68Ck
 tkwcXYXyPx0fcV81yqC+KbNnS4x0rklVq7BpdlrQvCg9IEc1/KgdDOkM8AKH0egIjBpC
 xZgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+FZ6/AKWgkEuE0QtsxX5UqIv6LPCMWC5FY0EndyivG9o4Loz2VgSunyS10ziD59F6hDOXkKnYj63a7ADTvarI8dgbgNAGsxRyTxWjYXKZpWlWodRjvRV
X-Gm-Message-State: AOJu0YwSkwTK0Hckiu7rmnFIRon46qQQbJxPWltS3f2MhY8VDbPAcUoU
 PuUAUhdFf0aoFr07DQnMj8eJXXsGYTBRTIJtZLX2binzbPQn+FsReqeCHRxQEnQ=
X-Google-Smtp-Source: AGHT+IECnYQvKUI7WwTgcSFed1zXdKR1H19TPysNu9rY9UY+uM67szMwUskr66DbaCdyM94wmFAuyQ==
X-Received: by 2002:a05:620a:372a:b0:797:b2a9:90a7 with SMTP id
 af79cd13be357-798d26b9321mr1211989385a.69.1718632191103; 
 Mon, 17 Jun 2024 06:49:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:50 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:43 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-3-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 03/41] iio: accel: msa311: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwvbXNh
MzExLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jIGIvZHJp
dmVycy9paW8vYWNjZWwvbXNhMzExLmMKaW5kZXggYjhkZGJmZDk4ZjExLi40Y2RiZjU0MjRhNTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL21zYTMxMS5jCisrKyBiL2RyaXZlcnMvaWlv
L2FjY2VsL21zYTMxMS5jCkBAIC0xMDM0LDEwICsxMDM0LDEwIEBAIHN0YXRpYyBpbnQgbXNhMzEx
X2NoaXBfaW5pdChzdHJ1Y3QgbXNhMzExX3ByaXYgKm1zYTMxMSkKIAkJCQkgICAgICJmYWlsZWQg
dG8gdW5tYXAgbWFwMC9tYXAxIGludGVycnVwdHNcbiIpOwogCiAJLyogRGlzYWJsZSBhbGwgYXhl
cyBieSBkZWZhdWx0ICovCi0JZXJyID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1zYTMxMS0+cmVncywg
TVNBMzExX09EUl9SRUcsCi0JCQkJIE1TQTMxMV9HRU5NQVNLKEZfWF9BWElTX0RJUykgfAotCQkJ
CSBNU0EzMTFfR0VOTUFTSyhGX1lfQVhJU19ESVMpIHwKLQkJCQkgTVNBMzExX0dFTk1BU0soRl9a
X0FYSVNfRElTKSwgMCk7CisJZXJyID0gcmVnbWFwX2NsZWFyX2JpdHMobXNhMzExLT5yZWdzLCBN
U0EzMTFfT0RSX1JFRywKKwkJCQlNU0EzMTFfR0VOTUFTSyhGX1hfQVhJU19ESVMpIHwKKwkJCQlN
U0EzMTFfR0VOTUFTSyhGX1lfQVhJU19ESVMpIHwKKwkJCQlNU0EzMTFfR0VOTUFTSyhGX1pfQVhJ
U19ESVMpKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVyciwgImNh
bid0IGVuYWJsZSBhbGwgYXhlc1xuIik7CiAKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
