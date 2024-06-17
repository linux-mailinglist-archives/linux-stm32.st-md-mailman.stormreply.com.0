Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9190B00B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E42BC78012;
	Mon, 17 Jun 2024 13:50:00 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E7C9C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:58 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-48ed52b59acso531346137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632197; x=1719236997;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
 b=FcViR7kJNJzZvKv5OVZlNP9OEXLr1JQFzK6reAuD6iZGNURcDI0ws0VBqltujOAvI4
 xfU2vApQ/OZdlBPyqqWc/NO3aqnRPHdaZb2+L0THNWdjFvli4F80vIrkuPSR1rb7uS2m
 TklISe2/elR6SBOfseON0F5nkNbPTpgNWRx1zsvXpMTmuWoBlTcSqWv7IQxWfqsDBMwl
 XWAxzFoHC876WQWp9095VLGHLFtOBNVuVU8KQ3ksaZ7/wcHnmP/leuwOCOlBWGpZxrno
 xWSAaPtEH2kFIjYsfri1pdtlOdkTeiAQ32JN1Tsg45nN91yt7G12Gd9C1M4HmJxQ1+M8
 03ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632197; x=1719236997;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6UQvfPsoXnGJXINmWjQmEBO62NliLdepCpDJh/A7YM=;
 b=fZLZH5qaAzAOuFxkaCdzKKPUSzXimIMTuM10eRXrTQCPa5s8jMjdQMQKTbPOKleFI8
 0i8KIxWSLKT0nhqzlQntpQmgwW2bDWu1rDZ5Q1AHs9qxlzTkU+b7eL23pWkR4izRYFEd
 d7yW5SuJCKQguYwJzZCTvhiNthyEzhlnB1PtByyl7OdGXIZ2kZLVPyDDrT3+nB/CGd3S
 vs8r78OkrFKNLLT9RyP1WaRUHeN3UphhEK+U3elRTmYD0wRbiIEoj/Sp+x6ugDa4mw0f
 QrlZUOshtRx/NrHUyhNOJ5EKCvQTnxacB5jzBXA9gPykQUyFInQWJWEjZMwPNH/cuTFg
 e3kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULtjCy8iMMKZgALGnqNLmm9HQqsd5jVNuUUT8uXEAzCFTdclB6gU0KpZ3P7Gsm7NikpRt9E1WqkS4IG/gEJ9pCAtocRkWKa8w97lY7TABSgcmGZkwxLtzo
X-Gm-Message-State: AOJu0YzvZBSps3DH+l4CcGEoK8qCUroept1oM2mAXHN+DEYomRiTUn2e
 9UOd6+ZRPxC8se9TevD98/rFS8D182C5hM5CFKEWYKsnFBsyFjvovCm555LZS+w=
X-Google-Smtp-Source: AGHT+IHh1rKlzT8+664YalrD1JcHiwA7k7yzEL0kYz4H+P2//V4FMw+RVSrpyNsoJMn06TFOuuRyhA==
X-Received: by 2002:a67:f452:0:b0:48d:a159:dd80 with SMTP id
 ada2fe7eead31-48dae329fbdmr9819998137.12.1718632197524; 
 Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:46 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-6-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 06/41] iio: adc: axp288_adc: make use of
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
YXhwMjg4X2FkYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMg
Yi9kcml2ZXJzL2lpby9hZGMvYXhwMjg4X2FkYy5jCmluZGV4IDQ5ZmZmMWNhYmQwZC4uZjEzNWNm
MjM2MmRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvYXhwMjg4X2FkYy5jCisrKyBiL2Ry
aXZlcnMvaWlvL2FkYy9heHAyODhfYWRjLmMKQEAgLTI0Nyw4ICsyNDcsOCBAQCBzdGF0aWMgaW50
IGF4cDI4OF9hZGNfaW5pdGlhbGl6ZShzdHJ1Y3QgYXhwMjg4X2FkY19pbmZvICppbmZvKQogCQly
ZXR1cm4gcmV0OwogCiAJLyogVHVybiBvbiB0aGUgQURDIGZvciBhbGwgY2hhbm5lbHMgZXhjZXB0
IFRTLCBsZWF2ZSBUUyBhcyBpcyAqLwotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoaW5mby0+
cmVnbWFwLCBBWFAyMFhfQURDX0VOMSwKLQkJCQkgIEFYUDI4OF9BRENfRU5fTUFTSywgQVhQMjg4
X0FEQ19FTl9NQVNLKTsKKwlyZXR1cm4gcmVnbWFwX3NldF9iaXRzKGluZm8tPnJlZ21hcCwgQVhQ
MjBYX0FEQ19FTjEsCisJCQkgICAgICAgQVhQMjg4X0FEQ19FTl9NQVNLKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBpaW9faW5mbyBheHAyODhfYWRjX2lpb19pbmZvID0gewoKLS0gCjIuNDUu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
