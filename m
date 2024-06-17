Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003090B007
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:49:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16FE0C78001;
	Mon, 17 Jun 2024 13:49:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A6BC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:54 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-24542b8607fso2288430fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632193; x=1719236993;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
 b=spWC+WYwuiNf8ciEEk/z2FPnoBT7gulyJWdj31h/Ei6TSoy34DPHx/DHwS4gTDnuc7
 A71ct0lqInIMzd9wOpSnk0cBkPjnonbVPbKwnVyE3qDH9of8RdUwMIwZ7Ok2RQFTakxb
 Vy6jpTsKCZYvfTkEvwhJSPv7pYE8owSZaSs96LBjsYhDXdBkGUs2Mg1BWE7n62zNMMhf
 s1EVKPWV4tW7BAs+6PEHDriHuERB5ZS+6rgJvtaHAoOgVqAkb+NYwkvfrlSgt8Xqo403
 3pflTmnkn3WZH4R6nyweV4bZ1ySmT7h85hTTPvUVNuahnYyT7/jYr63nx8Qv+GCG00De
 IYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632193; x=1719236993;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
 b=salBv6YiQMyXr72DlS2sx/MJXqwWOubEFpBHwo2p48+jPXOdYKMSXbfkW4OBGO6ErW
 TLpFHcJkIzfhEwcv9Zh7EDG2TWX4pbUvUvCOsJ4Z1faGz7qobpO5KRmtvfGXv4jWrJoW
 n4aP1m+S/qbNxYGyd4Qzt8Cp3YW+ifyrCp8gyT1X0DkFWmMxtn2R+noT0TFyH873x0h4
 B47VuYLlTyxQFcfHPanlG9PBmp7dePmQ2opFlyQowtMkkn2yBppX2oG54L84FVkjQfji
 HRKR+YR6K6ppZQnkE0GcN1ca33IPKMFZZbhy3otz/4w58zymG+/PCxj9VVLvusl6Gs0I
 GnXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcf8t802fVf6a9mh00+4sBKSrJ/dlGMIPXymD1MEPZqjnATsk0El9sI+5xEGzrLg9U4UmMNYiVguYIrlcy7i6SValrQ/7tB1rYWPvDWY+V1WXnsHUoN4uM
X-Gm-Message-State: AOJu0YzBevyM2twG4//W/z4A+IIJxYSoGm+I2KyEPtrLpaWqvhHsGYee
 Hz1MV1kqHKZwr/91jK7ABcbx47otZWo2/pnRa+PQMQ828d+A0LHXbbvSWtARlfE=
X-Google-Smtp-Source: AGHT+IGzXK8LLO+jQf8g3iL5MCifYqjIipjPlFcW7eDQk67H8aKJxfmuoG4FYBXo33Z8PvtltK6jug==
X-Received: by 2002:a05:6870:4728:b0:24f:d9de:3bed with SMTP id
 586e51a60fabf-25842b793famr10756815fac.41.1718632193273; 
 Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:44 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 04/41] iio: adc: ad4130: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2FkNDEz
MC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hZDQxMzAuYyBiL2RyaXZlcnMvaWlv
L2FkYy9hZDQxMzAuYwppbmRleCBhYWYxZmIwYWM0NDcuLmUxMzRkNjQ5NzgyNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9paW8vYWRjL2FkNDEzMC5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9hZDQxMzAu
YwpAQCAtMTg4Myw4ICsxODgzLDggQEAgc3RhdGljIGludCBhZDQxMzBfc2V0dXAoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKHN0LT5yZWdtYXAsIEFENDEzMF9GSUZPX0NPTlRST0xfUkVHLAotCQkJ
CSBBRDQxMzBfRklGT19DT05UUk9MX0hFQURFUl9NQVNLLCAwKTsKKwlyZXQgPSByZWdtYXBfY2xl
YXJfYml0cyhzdC0+cmVnbWFwLCBBRDQxMzBfRklGT19DT05UUk9MX1JFRywKKwkJCQlBRDQxMzBf
RklGT19DT05UUk9MX0hFQURFUl9NQVNLKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCgot
LSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
