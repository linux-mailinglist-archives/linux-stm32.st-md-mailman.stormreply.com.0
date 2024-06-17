Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30090B021
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB20BC78002;
	Mon, 17 Jun 2024 13:50:33 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3943CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:33 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-254fa9fe36eso2187431fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632232; x=1719237032;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
 b=AcEJZ+Sr8KAXeD7F9jwynTrnn8kBNW4/WAGBXz6MIyJHpUT2MgicgmeYcgAvDDjjIC
 cahWQZjiE+SD0pHoJdjthnIpLRa2lxNgHX4kUrir8qExKoEqHjCMa5AOBqdT3jyCwFJL
 bck9Xw4xo/l3B1vZt/k78Tixji86l++fNSOgyPiiao1r7yu/0NBTwM6hiXYf0TGr6Ry9
 ZoWyiMzfO6nzPlDgh7X6Y3yjnXgdh+3mCYNtZSHyVsKYMtXMhClcyZQVJWW8v9t/wrnI
 xwaPutHW8j/XeZo/4h+H3F/xlpLOW++sDpk1ORW20yfgqtGGDUqnArkCD6BiKWChXsW0
 7xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632232; x=1719237032;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
 b=wF4zIqbcGEiGzORxPNMMy/8cLNWPf+dfguNS7K5U2meSIcah01NZb5rodAK0Nkyr6w
 2IJD9ls/Vm5Fr+lWA/b9s0zuTQPXLl7jbMYLbJdSRh1Xvhh06daj9ewNnS3CuHx8rWjJ
 pBYRjmimi7UIM0cH53tz7m1qWzbK84Kz9MENRW4sY7HRRGAIaogjIPQ/O/Pl+kRH5QSk
 BWoYxb/P7XtNZxFkh2eT/EGGf1Jc3uheIypwFPFRi7vIkBJiCBknsFydxhXAUk3WBYX2
 FzsF/gC/5krJ10vDcqFZCGGt8O05+xp6OyhgVYyPKPzMlwYBR1VL0OodSj1WyKPEhhD3
 J0Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhY7m4H69HzUuhXEKzTHga8JbbDblpvHFrbu9YuLE0B7lZjyvbngv5oE5qUH/FRtKjZwT3scrAbgEHr1LyEXIzKXRvNkWbUpKO+161RdzaS1UBI6v6r46u
X-Gm-Message-State: AOJu0YwC58Tjfyxg9ZxaQD4V6K9oinZEU4Vw2fP94f0zCLbXH8R090Ng
 sMnChl1CoUAmdyj8KCgqkXhW258HSjoOxrVCYXjpcwdLCTNZNKq2mjf6eCX67tk=
X-Google-Smtp-Source: AGHT+IESOlQlf6WzweXkTkf8MrnVQGCcG3xC67OqCrm+RTbQElgJSgw2YCA/KexywnTT/s9UGGqyWA==
X-Received: by 2002:a05:6870:c1d4:b0:24f:dd11:4486 with SMTP id
 586e51a60fabf-25842ba209bmr11672904fac.36.1718632232087; 
 Mon, 17 Jun 2024 06:50:32 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:02 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-22-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 22/41] iio: gyro: mpu3050-core: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vZ3lyby9tcHUzMDUwLWNvcmUuYyB8IDMzICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2d5cm8vbXB1MzA1
MC1jb3JlLmMgYi9kcml2ZXJzL2lpby9neXJvL21wdTMwNTAtY29yZS5jCmluZGV4IGE3OTFiYTNh
NjkzYS4uZmYxYzgxNTUzMDQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9neXJvL21wdTMwNTAt
Y29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2d5cm8vbXB1MzA1MC1jb3JlLmMKQEAgLTE5Nyw4ICsx
OTcsOCBAQCBzdGF0aWMgaW50IG1wdTMwNTBfc3RhcnRfc2FtcGxpbmcoc3RydWN0IG1wdTMwNTAg
Km1wdTMwNTApCiAJaW50IGk7CiAKIAkvKiBSZXNldCAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVf
Yml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfUFdSX01HTSwKLQkJCQkgTVBVMzA1MF9QV1JfTUdN
X1JFU0VULCBNUFUzMDUwX1BXUl9NR01fUkVTRVQpOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyht
cHUzMDUwLT5tYXAsIE1QVTMwNTBfUFdSX01HTSwKKwkJCSAgICAgIE1QVTMwNTBfUFdSX01HTV9S
RVNFVCk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNTEzLDEyICs1MTMsOCBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgbXB1MzA1MF90cmlnZ2VyX2hhbmRsZXIoaW50IGlycSwgdm9pZCAq
cCkKIAkJCQkgIkZJRk8gb3ZlcmZsb3chIEVtcHR5aW5nIGFuZCByZXNldHRpbmcgRklGT1xuIik7
CiAJCQlmaWZvX292ZXJmbG93ID0gdHJ1ZTsKIAkJCS8qIFJlc2V0IGFuZCBlbmFibGUgdGhlIEZJ
Rk8gKi8KLQkJCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhtcHUzMDUwLT5tYXAsCi0JCQkJCQkg
TVBVMzA1MF9VU1JfQ1RSTCwKLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfAotCQkJ
CQkJIE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QsCi0JCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9G
SUZPX0VOIHwKLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsKKwkJCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCisJCQkJCSAgICAg
IE1QVTMwNTBfVVNSX0NUUkxfRklGT19FTiB8IE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QpOwog
CQkJaWYgKHJldCkgewogCQkJCWRldl9pbmZvKG1wdTMwNTAtPmRldiwgImVycm9yIHJlc2V0dGlu
ZyBGSUZPXG4iKTsKIAkJCQlnb3RvIG91dF90cmlnZ2VyX3VubG9jazsKQEAgLTc5OSwxMCArNzk1
LDggQEAgc3RhdGljIGludCBtcHUzMDUwX2h3X2luaXQoc3RydWN0IG1wdTMwNTAgKm1wdTMwNTAp
CiAJdTY0IG90cDsKIAogCS8qIFJlc2V0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1w
dTMwNTAtPm1hcCwKLQkJCQkgTVBVMzA1MF9QV1JfTUdNLAotCQkJCSBNUFUzMDUwX1BXUl9NR01f
UkVTRVQsCi0JCQkJIE1QVTMwNTBfUFdSX01HTV9SRVNFVCk7CisJcmV0ID0gcmVnbWFwX3NldF9i
aXRzKG1wdTMwNTAtPm1hcCwgTVBVMzA1MF9QV1JfTUdNLAorCQkJICAgICAgTVBVMzA1MF9QV1Jf
TUdNX1JFU0VUKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC04NzIsOCArODY2LDgg
QEAgc3RhdGljIGludCBtcHUzMDUwX3Bvd2VyX3VwKHN0cnVjdCBtcHUzMDUwICptcHUzMDUwKQog
CW1zbGVlcCgyMDApOwogCiAJLyogVGFrZSBkZXZpY2Ugb3V0IG9mIHNsZWVwIG1vZGUgKi8KLQly
ZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BXUl9NR00sCi0J
CQkJIE1QVTMwNTBfUFdSX01HTV9TTEVFUCwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMo
bXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BXUl9NR00sCisJCQkJTVBVMzA1MF9QV1JfTUdNX1NMRUVQ
KTsKIAlpZiAocmV0KSB7CiAJCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShtcHUz
MDUwLT5yZWdzKSwgbXB1MzA1MC0+cmVncyk7CiAJCWRldl9lcnIobXB1MzA1MC0+ZGV2LCAiZXJy
b3Igc2V0dGluZyBwb3dlciBtb2RlXG4iKTsKQEAgLTg5NSw4ICs4ODksOCBAQCBzdGF0aWMgaW50
IG1wdTMwNTBfcG93ZXJfZG93bihzdHJ1Y3QgbXB1MzA1MCAqbXB1MzA1MCkKIAkgKiB0aGVuIHdl
IHdvdWxkIGJlIHdhc3RpbmcgcG93ZXIgdW5sZXNzIHdlIGdvIHRvIHNsZWVwIG1vZGUKIAkgKiBm
aXJzdC4KIAkgKi8KLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUz
MDUwX1BXUl9NR00sCi0JCQkJIE1QVTMwNTBfUFdSX01HTV9TTEVFUCwgTVBVMzA1MF9QV1JfTUdN
X1NMRUVQKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BX
Ul9NR00sCisJCQkgICAgICBNUFUzMDUwX1BXUl9NR01fU0xFRVApOwogCWlmIChyZXQpCiAJCWRl
dl9lcnIobXB1MzA1MC0+ZGV2LCAiZXJyb3IgcHV0dGluZyB0byBzbGVlcFxuIik7CiAKQEAgLTk5
NywxMSArOTkxLDggQEAgc3RhdGljIGludCBtcHUzMDUwX2RyZHlfdHJpZ2dlcl9zZXRfc3RhdGUo
c3RydWN0IGlpb190cmlnZ2VyICp0cmlnLAogCQkJcmV0dXJuIHJldDsKIAogCQkvKiBSZXNldCBh
bmQgZW5hYmxlIHRoZSBGSUZPICovCi0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhtcHUzMDUw
LT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCi0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4g
fAotCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCwKLQkJCQkJIE1QVTMwNTBfVVNSX0NU
UkxfRklGT19FTiB8Ci0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsKKwkJcmV0ID0g
cmVnbWFwX3NldF9iaXRzKG1wdTMwNTAtPm1hcCwgTVBVMzA1MF9VU1JfQ1RSTCwKKwkJCQkgICAg
ICBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfCBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsK
IAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
