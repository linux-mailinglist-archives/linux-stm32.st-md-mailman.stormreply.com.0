Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1F90B038
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DB0CC78014;
	Mon, 17 Jun 2024 13:51:11 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7236AC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4415e623653so39613441cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632268; x=1719237068;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
 b=oMMoXwRRWH2DKJaZfK+2GjGFkkwmXG8a6NEOl5JuO88rKpUoMMMywPWwdA1FQw5LlV
 sIST7g5Iy+t4OkBLF1V110OnErEqZmPGt8Sdhv2076hZqoPqPOxeiXWP+EMHmhun8YIb
 a/VQZYXHMaJN4NtMpaRElh6moRi6ihUU0J0PbF6MGPfAsPWYQWbjp7lPoaCjGAta/j88
 5njimGsSOXmJmzE820QXntmse3HLZ2kvVe80WSlArAG5qRsBRPpcQ0X5mkdSo33+HymH
 i2Fag0OKAz84CSRWrqan0L0UnhiJSAngyDaKDTZPQ8l7pxpJWiZHuygTg1vHIMzUuApw
 ALUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632268; x=1719237068;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
 b=i1At5blLQ80dZWGAOnqxkG9t3LlhbJMvhQL+zq0jgDVVmpIz4k/UwW/elH36wOBfgJ
 P9dl0tzykUFVgbT/Wm0Mjq7PNkRrzzV+wdrnWY3gGhPBA+MTtY+lHg/GOu6YQPPEaEWS
 Rq9dgjrUCkBqGHqxM8PKuWl6sLC3Jm8c/FA2eUPLL42atr+VOJa08xG0EptKUjB2VOWq
 8p79kuASSm93A5hketjhM9LTv6JnB0S5eEQ0CPOtVt7nd197Qghz8n5REFcxS1fEuz7a
 XISqHWaIh2q3RqWlqzevsy5RH6WIhWcCzNVAx3tsZ3JPeqNRFPCFYjdF5UPgltW16ifm
 IIdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWorUsp20SUKk/Tst2Fp41BCeAmYs0I0Qr7HcTfFzVVR/Fs/u3AtM/xEnXs75Rpbp/XZXn1oP76k4Lj2Q85jrsYV5YIJ2lTtIuZ1C1Je7SFPmyjE3N71wU9
X-Gm-Message-State: AOJu0YyQwCxx1xubPq1w+URFyzeIadnzIFMediBfGdnHndeOdqyPuNM2
 P52NsGeHLp3mrRazVYG1sbcw65NLbFKrCSY4Re63HdJhmQycesqvtlwgqikhwMI=
X-Google-Smtp-Source: AGHT+IGCNTX7XI85nrdMwm8HgjdhSBF2upAbofRDQ4N0lo0/7MseIEDdacRNTzR/tFRJhwns3PxO2A==
X-Received: by 2002:ac8:71d7:0:b0:442:198e:cb9 with SMTP id
 d75a77b69052e-442198e0e4bmr132788711cf.27.1718632268400; 
 Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:19 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-39-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 39/41] iio: proximity: sx_common: make use
 of regmap_clear_bits(), regmap_set_bits()
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jIGIvZHJpdmVycy9paW8v
cHJveGltaXR5L3N4X2NvbW1vbi5jCmluZGV4IGZlMDdkMTQ0NGFjMy4uYTk1ZTk4MTRhYWYyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2lpby9wcm94aW1pdHkvc3hfY29tbW9uLmMKKysrIGIvZHJpdmVy
cy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jCkBAIC0xMTEsMTcgKzExMSwxNiBAQCBzdGF0aWMg
aW50IHN4X2NvbW1vbl9lbmFibGVfaXJxKHN0cnVjdCBzeF9jb21tb25fZGF0YSAqZGF0YSwgdW5z
aWduZWQgaW50IGlycSkKIHsKIAlpZiAoIWRhdGEtPmNsaWVudC0+aXJxKQogCQlyZXR1cm4gMDsK
LQlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+Y2hpcF9pbmZv
LT5yZWdfaXJxX21zaywKLQkJCQkgIGlycSA8PCBkYXRhLT5jaGlwX2luZm8tPmlycV9tc2tfb2Zm
c2V0LAotCQkJCSAgaXJxIDw8IGRhdGEtPmNoaXBfaW5mby0+aXJxX21za19vZmZzZXQpOworCXJl
dHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5jaGlwX2luZm8tPnJlZ19p
cnFfbXNrLAorCQkJICAgICAgIGlycSA8PCBkYXRhLT5jaGlwX2luZm8tPmlycV9tc2tfb2Zmc2V0
KTsKIH0KIAogc3RhdGljIGludCBzeF9jb21tb25fZGlzYWJsZV9pcnEoc3RydWN0IHN4X2NvbW1v
bl9kYXRhICpkYXRhLCB1bnNpZ25lZCBpbnQgaXJxKQogewogCWlmICghZGF0YS0+Y2xpZW50LT5p
cnEpCiAJCXJldHVybiAwOwotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBkYXRhLT5jaGlwX2luZm8tPnJlZ19pcnFfbXNrLAotCQkJCSAgaXJxIDw8IGRhdGEtPmNoaXBf
aW5mby0+aXJxX21za19vZmZzZXQsIDApOworCXJldHVybiByZWdtYXBfY2xlYXJfYml0cyhkYXRh
LT5yZWdtYXAsIGRhdGEtPmNoaXBfaW5mby0+cmVnX2lycV9tc2ssCisJCQkJIGlycSA8PCBkYXRh
LT5jaGlwX2luZm8tPmlycV9tc2tfb2Zmc2V0KTsKIH0KIAogc3RhdGljIGludCBzeF9jb21tb25f
dXBkYXRlX2NoYW5fZW4oc3RydWN0IHN4X2NvbW1vbl9kYXRhICpkYXRhLAoKLS0gCjIuNDUuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
