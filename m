Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E831790B03A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B149BC78012;
	Mon, 17 Jun 2024 13:51:15 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E7B7C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:14 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-4ee5662fde8so942858e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632273; x=1719237073;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AKnuVsDBtdHGm81QL99oZtdVbIW3JEVTOu6hlNZPjXg=;
 b=J8XWYrow8VqA9ydvVVWD1JOUqlo4W9MDNLLZIYkj/u6Nni1OI88w5mQkzVW8NZgnjH
 Fux+7Xap1zzp5qAdtJiWgPdKKbkTIInCzysvyr3hmrk0b0Kx1Efi25dOv9F6LIxCDiUP
 AQA/2IaxpIrqHu48QtYQvg7tY+Gd6FdG+tefCgGQejyRoORuQpx8snbSp63ULmPDdBxp
 cLcK8/4mqWKGP4VeLAKUtueOKW7BfysdT/N+WpD3AWKB6VmWKaDMLWU4IGiJQv63bGHe
 C7N1T3jHd7blHne+v2BU3cadXgyMeD7U9GV/5LWvHeLwvvfLjrl3IOzQ9rdJdafpVjyI
 ES8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632273; x=1719237073;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKnuVsDBtdHGm81QL99oZtdVbIW3JEVTOu6hlNZPjXg=;
 b=SBPJRNRgmsBFg2IH95nOLY0GfPB5uCf9ZKvnZRWpAOaMDx0HgxjUMQRzXgITP4fBLF
 1NG7efdtUJFPCBlw3rJWEEEGPxSbG3JUL4XLCxRrSNSYW29EAinJH+LYwPDBTzuRvId2
 N6LF7ZNgPI+Sa0/Q7pmIdK0EjpG29RcBP2nA8dI0ll7H86ZYvmWZXWhIg+M9vQjb+Meg
 YWQV++30tf8uI1mdtKZGReJlY/ZXx8RL9mq9BY5jI4nHWPO1S/W3MyHqcqHQ/NxwLCCG
 KCctPBoP7jjiuiMjUgCGPC+ytkRkP9SnPooMaCBiNSp4OavmWDhoKR3GQkTEwz3NEIUb
 novg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX9rzEiRPCvnqNI5SyoKX3KmbU7pIPN2R6xKIQ1ij72M3PbmMtrcUMEX6a1d7mKzJiEXUEgryIMFbyObrKaCD23kMpV2bI7Jz7/bBdjE7r6sdfPBYhE57A
X-Gm-Message-State: AOJu0YyGAxzVLiVmCuRHIZOZTvS/uhDirsqejBx2IylUPfVtejWL2ner
 zbj4Dhjw72h48S4qOKWEKocfSF5YR0QesHZSMMWKm1eSenP4EK9+z0bvSi0uhac=
X-Google-Smtp-Source: AGHT+IHFy1tuFMwxa7P6sFsjYvAHUS1dIKxzAj2HLRYOAmnW2Gug4qjgVMG/WpGom5Qua5PdHz8vPQ==
X-Received: by 2002:a05:6122:915:b0:4ec:efca:d2b with SMTP id
 71dfb90a1353d-4ee3e59c40amr7925275e0c.8.1718632272678; 
 Mon, 17 Jun 2024 06:51:12 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:12 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:21 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-41-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 41/41] iio: trigger: stm32-timer-trigger:
 make use of regmap_clear_bits(), regmap_set_bits()
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMgfCAz
NCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vdHJp
Z2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMgYi9kcml2ZXJzL2lpby90cmlnZ2VyL3N0bTMyLXRp
bWVyLXRyaWdnZXIuYwppbmRleCBkNzY0NDQwMzBhMjguLjA2ODQzMjk5NTZkOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMKKysrIGIvZHJpdmVy
cy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMKQEAgLTE1OCw3ICsxNTgsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX3RpbWVyX3N0YXJ0KHN0cnVjdCBzdG0zMl90aW1lcl90cmlnZ2VyICpw
cml2LAogCiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1BTQywgcHJlc2NhbGVyKTsK
IAlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1fQVJSLCBwcmQgLSAxKTsKLQlyZWdtYXBf
dXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUsIFRJTV9DUjFf
QVJQRSk7CisJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9B
UlBFKTsKIAogCS8qIEZvcmNlIG1hc3RlciBtb2RlIHRvIHVwZGF0ZSBtb2RlICovCiAJaWYgKHN0
bTMyX3RpbWVyX2lzX3RyZ28yX25hbWUodHJpZy0+bmFtZSkpCkBAIC0xNjksMTAgKzE2OSwxMCBA
QCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX3N0YXJ0KHN0cnVjdCBzdG0zMl90aW1lcl90cmlnZ2Vy
ICpwcml2LAogCQkJCSAgIDB4MiA8PCBUSU1fQ1IyX01NU19TSElGVCk7CiAKIAkvKiBNYWtlIHN1
cmUgdGhhdCByZWdpc3RlcnMgYXJlIHVwZGF0ZWQgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJp
di0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHLCBUSU1fRUdSX1VHKTsKKwlyZWdtYXBfc2V0
X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHKTsKIAogCS8qIEVuYWJsZSBj
b250cm9sbGVyICovCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwg
VElNX0NSMV9DRU4sIFRJTV9DUjFfQ0VOKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFw
LCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsKIAog
CXJldHVybiAwOwpAQCAtMTg5LDE5ICsxODksMTkgQEAgc3RhdGljIHZvaWQgc3RtMzJfdGltZXJf
c3RvcChzdHJ1Y3Qgc3RtMzJfdGltZXJfdHJpZ2dlciAqcHJpdiwKIAogCW11dGV4X2xvY2soJnBy
aXYtPmxvY2spOwogCS8qIFN0b3AgdGltZXIgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+
cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUsIDApOwotCXJlZ21hcF91cGRhdGVfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOLCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0
cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQVJQRSk7CisJcmVnbWFwX2NsZWFyX2Jp
dHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZ21hcCwgVElNX1BTQywgMCk7CiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElN
X0FSUiwgMCk7CiAKIAkvKiBGb3JjZSBkaXNhYmxlIG1hc3RlciBtb2RlICovCiAJaWYgKHN0bTMy
X3RpbWVyX2lzX3RyZ28yX25hbWUodHJpZy0+bmFtZSkpCi0JCXJlZ21hcF91cGRhdGVfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TMiwgMCk7CisJCXJlZ21hcF9jbGVhcl9i
aXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMiwgVElNX0NSMl9NTVMyKTsKIAllbHNlCi0JCXJlZ21h
cF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TLCAwKTsKKwkJ
cmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IyLCBUSU1fQ1IyX01NUyk7CiAK
IAkvKiBNYWtlIHN1cmUgdGhhdCByZWdpc3RlcnMgYXJlIHVwZGF0ZWQgKi8KLQlyZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHLCBUSU1fRUdSX1VHKTsK
KwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHKTsKIAog
CWlmIChwcml2LT5lbmFibGVkKSB7CiAJCXByaXYtPmVuYWJsZWQgPSBmYWxzZTsKQEAgLTQ5OCwx
MSArNDk4LDkgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudGVyX3dyaXRlX3JhdyhzdHJ1Y3QgaWlv
X2RldiAqaW5kaW9fZGV2LAogCQkJCXByaXYtPmVuYWJsZWQgPSB0cnVlOwogCQkJCWNsa19lbmFi
bGUocHJpdi0+Y2xrKTsKIAkJCX0KLQkJCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAs
IFRJTV9DUjEsIFRJTV9DUjFfQ0VOLAotCQkJCQkgICBUSU1fQ1IxX0NFTik7CisJCQlyZWdtYXBf
c2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJCX0gZWxzZSB7
Ci0JCQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NF
TiwKLQkJCQkJICAgMCk7CisJCQlyZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9D
UjEsIFRJTV9DUjFfQ0VOKTsKIAkJCWlmIChwcml2LT5lbmFibGVkKSB7CiAJCQkJcHJpdi0+ZW5h
YmxlZCA9IGZhbHNlOwogCQkJCWNsa19kaXNhYmxlKHByaXYtPmNsayk7CkBAIC01NTUsNyArNTUz
LDcgQEAgc3RhdGljIGludCBzdG0zMl9zZXRfdHJpZ2dlcl9tb2RlKHN0cnVjdCBpaW9fZGV2ICpp
bmRpb19kZXYsCiB7CiAJc3RydWN0IHN0bTMyX3RpbWVyX3RyaWdnZXIgKnByaXYgPSBpaW9fcHJp
dihpbmRpb19kZXYpOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX1NN
Q1IsIFRJTV9TTUNSX1NNUywgVElNX1NNQ1JfU01TKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+
cmVnbWFwLCBUSU1fU01DUiwgVElNX1NNQ1JfU01TKTsKIAogCXJldHVybiAwOwogfQpAQCAtNjgz
LDcgKzY4MSw3IEBAIHN0YXRpYyBzc2l6ZV90IHN0bTMyX2NvdW50X3NldF9wcmVzZXQoc3RydWN0
IGlpb19kZXYgKmluZGlvX2RldiwKIAkJcmV0dXJuIHJldDsKIAogCS8qIFRJTXhfQVJSIHJlZ2lz
dGVyIHNob3VsZG4ndCBiZSBidWZmZXJlZCAoQVJQRT0wKSAqLwotCXJlZ21hcF91cGRhdGVfYml0
cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQVJQRSwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUpOwogCXJlZ21hcF93cml0
ZShwcml2LT5yZWdtYXAsIFRJTV9BUlIsIHByZXNldCk7CiAKIAlyZXR1cm4gbGVuOwpAQCAtNzU3
LDkgKzc1NSw5IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3RpbWVyX2RldGVjdF90cmdvMihzdHJ1Y3Qg
c3RtMzJfdGltZXJfdHJpZ2dlciAqcHJpdikKIAkgKiBNYXN0ZXIgbW9kZSBzZWxlY3Rpb24gMiBi
aXRzIGNhbiBvbmx5IGJlIHdyaXR0ZW4gYW5kIHJlYWQgYmFjayB3aGVuCiAJICogdGltZXIgc3Vw
cG9ydHMgaXQuCiAJICovCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NS
MiwgVElNX0NSMl9NTVMyLCBUSU1fQ1IyX01NUzIpOworCXJlZ21hcF9zZXRfYml0cyhwcml2LT5y
ZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TMik7CiAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFw
LCBUSU1fQ1IyLCAmdmFsKTsKLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1f
Q1IyLCBUSU1fQ1IyX01NUzIsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwg
VElNX0NSMiwgVElNX0NSMl9NTVMyKTsKIAlwcml2LT5oYXNfdHJnbzIgPSAhIXZhbDsKIH0KIApA
QCAtODIwLDcgKzgxOCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3RpbWVyX3RyaWdnZXJfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogQ2hlY2sgaWYgbm9ib2R5IGVsc2Ug
dXNlIHRoZSB0aW1lciwgdGhlbiBkaXNhYmxlIGl0ICovCiAJcmVnbWFwX3JlYWQocHJpdi0+cmVn
bWFwLCBUSU1fQ0NFUiwgJnZhbCk7CiAJaWYgKCEodmFsICYgVElNX0NDRVJfQ0NYRSkpCi0JCXJl
Z21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOLCAwKTsK
KwkJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7
CiAKIAlpZiAocHJpdi0+ZW5hYmxlZCkKIAkJY2xrX2Rpc2FibGUocHJpdi0+Y2xrKTsKQEAgLTg0
MSw3ICs4MzksNyBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX3RyaWdnZXJfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX1NNQ1IsICZw
cml2LT5iYWsuc21jcik7CiAKIAkJLyogRGlzYWJsZSB0aGUgdGltZXIgKi8KLQkJcmVnbWFwX3Vw
ZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4sIDApOworCQlyZWdt
YXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKIAkJY2xr
X2Rpc2FibGUocHJpdi0+Y2xrKTsKIAl9CiAKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
