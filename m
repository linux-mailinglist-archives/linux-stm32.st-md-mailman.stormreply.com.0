Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2E90B01E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C88B8C78002;
	Mon, 17 Jun 2024 13:50:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCFE2C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-797f222c9f9so258873185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632228; x=1719237028;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
 b=Y2VAZdc6abB0j/Kg6lyuTnKHp8o6EOeb/0+ogwsYI6zHIzrlRKnfRp119fG9Bq80SV
 323xP/mA/SIBjeeTjlSBuwJDz3RB6o0Rh4woCrVuppxrAMeHhlksS4qJZluikfvSS/cU
 XIg0xEpY4PiPEm7ywG1qT28oPs57QsVXNQsLpQWzeoBhNUpBRikmFIzqbjrPa6/RH09g
 7aQf+5aYPAxinijfnY5gARu+Hqj2niCsXbRZywZjgNrVvPHYrJARfY8HucAMitW8Mb7o
 muQoiGz75Rr+NPyK9b8XoGR90bTNGZJm5xB12GZnLFTOlqCmFFbmm0UwNg59jp+TxyuL
 /FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632228; x=1719237028;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XakTIALlxEv0HYj2MxlbOtZFxZOxjUYZWhXJH4zlh0=;
 b=kxvE8+3jsVJZ8OSpHIbk2imIMin+3oO/o79jgm/9QKdYw0gJhLqxNSvVeLx51cg4MM
 rbPxENcSq+/wA0UPwzNzwQ0Lxd8BVJGnMdJ2pr0dAFaCDKVXUyrskAjpgkK0EqK5CnWS
 DV/zR/i74NsbAVGsgdanX5UjlecUs33gTqveBwjPso3WprrOp1AG5EWB/uyljeRlmEtq
 WEG6VCKIlgtPCiYrdgniAIsxWL+MEmcTit3dYoYEKv7B49iGo03hlGGElUi17XDHmopB
 MkZbnNGnquqQ3ge6Jq6YIIdXbNlr0tRhKlzA6gg+4JMBmaxoUN2gpqELx2cWwgVAsDTw
 vcwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRwq1H66wp6Mkk4X+HbL/BRs9yfYiM1+rPPwteoU0Sim7kCzojB3syRUT717geqhZvsyQTG4yoi87DYuJ/phEFnk5/B5L+E6fEUZ/F9ow5RulCQ/XsJnA+
X-Gm-Message-State: AOJu0YyrgoZLappgyO0mE9/RBG5TUhL/+ooOtLyo8u8xTr0chw7KRdSu
 gG5gEZl/cJ0oucRInI9FXfAiAVcw0MmKbH3XLztkWPBqVElAqwcw7mKpx4n68J0=
X-Google-Smtp-Source: AGHT+IG8ABD9tEwAKr1/xa6bdVCx92iQnTrVgELPE/Lymo3q9zF8m5xvFoyu+g0K7+PoHeaETQDP6g==
X-Received: by 2002:a05:620a:29d1:b0:795:967d:b1f4 with SMTP id
 af79cd13be357-798d26b5261mr1162014985a.70.1718632227786; 
 Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:00 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-20-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 20/41] iio: dac: stm32-dac-core: make use
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9kYWMv
c3RtMzItZGFjLWNvcmUuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRh
Yy1jb3JlLmMgYi9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLWNvcmUuYwppbmRleCBlMTUwYWM3
MjkxNTQuLjJkNTY3MDczOTk2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRh
Yy1jb3JlLmMKKysrIGIvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRhYy1jb3JlLmMKQEAgLTIwMCw5
ICsyMDAsOCBAQCBzdGF0aWMgaW50IHN0bTMyX2RhY19jb3JlX3Jlc3VtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIAlpZiAocHJpdi0+Y29tbW9uLmhmc2VsKSB7CiAJCS8qIHJlc3RvcmUgaGZzZWwg
KG1heWJlIGxvc3QgdW5kZXIgbG93IHBvd2VyIHN0YXRlKSAqLwotCQlyZXQgPSByZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+Y29tbW9uLnJlZ21hcCwgU1RNMzJfREFDX0NSLAotCQkJCQkgU1RNMzJI
N19EQUNfQ1JfSEZTRUwsCi0JCQkJCSBTVE0zMkg3X0RBQ19DUl9IRlNFTCk7CisJCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhwcml2LT5jb21tb24ucmVnbWFwLCBTVE0zMl9EQUNfQ1IsCisJCQkJICAg
ICAgU1RNMzJIN19EQUNfQ1JfSEZTRUwpOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAl9
CgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
