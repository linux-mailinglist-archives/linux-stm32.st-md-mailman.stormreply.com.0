Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09390B01B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B542CC78013;
	Mon, 17 Jun 2024 13:50:25 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86131C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:24 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7979198531fso327514985a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632223; x=1719237023;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
 b=Dn4kT6LUV9qN1WF4UInSVD3DlEbygr+gZ8E2dilZ+5kmicu+aYVeg2RadgsqD0ZMMi
 W/eVj5se2dPijts5qavUtmaUaUqBqV77SbOLPzbGN8l3QoO0TGtDhT++7q782EUBjOCR
 dZeJMUib6+9opk1r5CdKt7wz9z7m3xXWuYOPzP1wgoto/PYMChNOnYUr/6CzsJv4LyqQ
 Sjj9S0BgUbWcu2iibqPkJHmRupPnhtCjx5XZXtZav129wt7OZA0MtB59l5pid2WDj1J3
 HcFvSvn6wpyjwTOFzxr4WD2mLhTbumeiGVfm09DIww4lciNOdfJzUKESyoeQ/VypIagq
 nE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632223; x=1719237023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
 b=bDCKsi1FCJIiEtjYPUpq7m8AoXxFuNcbWZzoczQ6nTw7P6LO4PVeuMRWuI9KjWOYQp
 thqSGR6MdO9Yxf2q1dLCUKccY689GA4R2MJf79d4KHRnl0mu+paEm7MnRoQCmsA2QPlo
 0UsSSS8JsBwp0v4XuFPVv5wbnnNCnCgi4dBUL2w9i+y+H46bJTVFXwaw2qWmG9/cFQaD
 MrbnSmAW+ESi2WYpqOdNcqaR7w9+cj733t/zBHOwn7VRYh4TbxS5ygsUPVdi8h1/FoAG
 n116FvbomhLQmzNrONg+wxkyRhWlcE/GHJdAirVuWUQMrxGVIwRDDQi+GndStrokuZon
 2WhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX01IdWAwXUC2LkiJptYI0W8G4rMtZ9QaQSJzuDgYzV91uDPp+MmX03SXe1DqEw3bQrsWRSrAhHfvzyX7DukphwqZ3o8pXN7yy8l+IpIdr496s2Kd0fv1En
X-Gm-Message-State: AOJu0YzvMAS0yAYCakmYsq4lGrvsubrUneBsgO8j/Ev+m6OYTkBXfqej
 i9JV7gWlg1wHkXdQVOWiy/d5gZ077U+hiCHImdwz2SIIs7Q6XTstuxwZJwkJvZo=
X-Google-Smtp-Source: AGHT+IEh7KDprGK33BeeaVNTDiPQqvpWOrx7hEFjzf44w52REiEzqTJNM1IGPx8qlAanIRK9VBBUsQ==
X-Received: by 2002:a05:620a:4101:b0:795:dca5:e9b7 with SMTP id
 af79cd13be357-798d26b4948mr1182835585a.69.1718632223483; 
 Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:58 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-18-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 18/41] iio: adc: stm32-dfsdm-adc: make use
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jIHwgMjkgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZz
ZG0tYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tYWRjLmMKaW5kZXggOWE0N2Qy
Yzg3ZjA1Li5mYWJkNjU0MjQ1ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1k
ZnNkbS1hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tYWRjLmMKQEAgLTc1
OSw4ICs3NTksNyBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX3N0YXJ0X2NvbnYoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldiwKIAlyZXR1cm4gMDsKIAogZmlsdGVyX3VuY29uZmlndXJlOgotCXJl
Z21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJCSAgIERG
U0RNX0NSMV9DRkdfTUFTSywgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBERlNETV9D
UjEoYWRjLT5mbF9pZCksIERGU0RNX0NSMV9DRkdfTUFTSyk7CiBzdG9wX2NoYW5uZWxzOgogCXN0
bTMyX2Rmc2RtX3N0b3BfY2hhbm5lbChpbmRpb19kZXYpOwogCkBAIC03NzQsOCArNzczLDcgQEAg
c3RhdGljIHZvaWQgc3RtMzJfZGZzZG1fc3RvcF9jb252KHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYpCiAKIAlzdG0zMl9kZnNkbV9zdG9wX2ZpbHRlcihhZGMtPmRmc2RtLCBhZGMtPmZsX2lkKTsK
IAotCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJ
CSAgIERGU0RNX0NSMV9DRkdfTUFTSywgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBE
RlNETV9DUjEoYWRjLT5mbF9pZCksIERGU0RNX0NSMV9DRkdfTUFTSyk7CiAKIAlzdG0zMl9kZnNk
bV9zdG9wX2NoYW5uZWwoaW5kaW9fZGV2KTsKIH0KQEAgLTk1MSwxNiArOTQ5LDE0IEBAIHN0YXRp
YyBpbnQgc3RtMzJfZGZzZG1fYWRjX2RtYV9zdGFydChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2
KQogCiAJaWYgKGFkYy0+bmNvbnYgPT0gMSAmJiAhaW5kaW9fZGV2LT50cmlnKSB7CiAJCS8qIEVu
YWJsZSByZWd1bGFyIERNQSB0cmFuc2ZlciovCi0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhh
ZGMtPmRmc2RtLT5yZWdtYXAsCi0JCQkJCSBERlNETV9DUjEoYWRjLT5mbF9pZCksCi0JCQkJCSBE
RlNETV9DUjFfUkRNQUVOX01BU0ssCi0JCQkJCSBERlNETV9DUjFfUkRNQUVOX01BU0spOworCQly
ZXQgPSByZWdtYXBfc2V0X2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLAorCQkJCSAgICAgIERGU0RN
X0NSMShhZGMtPmZsX2lkKSwKKwkJCQkgICAgICBERlNETV9DUjFfUkRNQUVOX01BU0spOwogCX0g
ZWxzZSB7CiAJCS8qIEVuYWJsZSBpbmplY3RlZCBETUEgdHJhbnNmZXIqLwotCQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLAotCQkJCQkgREZTRE1fQ1IxKGFkYy0+
ZmxfaWQpLAotCQkJCQkgREZTRE1fQ1IxX0pETUFFTl9NQVNLLAotCQkJCQkgREZTRE1fQ1IxX0pE
TUFFTl9NQVNLKTsKKwkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGFkYy0+ZGZzZG0tPnJlZ21hcCwK
KwkJCQkgICAgICBERlNETV9DUjEoYWRjLT5mbF9pZCksCisJCQkJICAgICAgREZTRE1fQ1IxX0pE
TUFFTl9NQVNLKTsKIAl9CiAKIAlpZiAocmV0IDwgMCkKQEAgLTk4MSw4ICs5NzcsOCBAQCBzdGF0
aWMgdm9pZCBzdG0zMl9kZnNkbV9hZGNfZG1hX3N0b3Aoc3RydWN0IGlpb19kZXYgKmluZGlvX2Rl
dikKIAlpZiAoIWFkYy0+ZG1hX2NoYW4pCiAJCXJldHVybjsKIAotCXJlZ21hcF91cGRhdGVfYml0
cyhhZGMtPmRmc2RtLT5yZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJCSAgIERGU0RN
X0NSMV9SRE1BRU5fTUFTSyB8IERGU0RNX0NSMV9KRE1BRU5fTUFTSywgMCk7CisJcmVnbWFwX2Ns
ZWFyX2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLCBERlNETV9DUjEoYWRjLT5mbF9pZCksCisJCQkg
IERGU0RNX0NSMV9SRE1BRU5fTUFTSyB8IERGU0RNX0NSMV9KRE1BRU5fTUFTSyk7CiAJZG1hZW5n
aW5lX3Rlcm1pbmF0ZV9hbGwoYWRjLT5kbWFfY2hhbik7CiB9CiAKQEAgLTEzMDUsOSArMTMwMSw4
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMl9kZnNkbV9pcnEoaW50IGlycSwgdm9pZCAqYXJn
KQogCWlmIChzdGF0dXMgJiBERlNETV9JU1JfUk9WUkZfTUFTSykgewogCQlpZiAoaW50X2VuICYg
REZTRE1fQ1IyX1JPVlJJRV9NQVNLKQogCQkJZGV2X3dhcm4oJmluZGlvX2Rldi0+ZGV2LCAiT3Zl
cnJ1biBkZXRlY3RlZFxuIik7Ci0JCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0lD
UihhZGMtPmZsX2lkKSwKLQkJCQkgICBERlNETV9JQ1JfQ0xSUk9WUkZfTUFTSywKLQkJCQkgICBE
RlNETV9JQ1JfQ0xSUk9WUkZfTUFTSyk7CisJCXJlZ21hcF9zZXRfYml0cyhyZWdtYXAsIERGU0RN
X0lDUihhZGMtPmZsX2lkKSwKKwkJCQlERlNETV9JQ1JfQ0xSUk9WUkZfTUFTSyk7CiAJfQogCiAJ
cmV0dXJuIElSUV9IQU5ETEVEOwoKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
