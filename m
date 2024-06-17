Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C690B00E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52905C78012;
	Mon, 17 Jun 2024 13:50:07 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FA63C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:05 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7954f8b818fso290875685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632204; x=1719237004;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
 b=BtU1dqJ3/BXlR9v4UNYXnGBFqux2dSbrw0x/48pn384t/WWr0h55s32bUsJeqmISpC
 wZciqeL8CXy4xI7WZSAickFbhCiClg/XAUjbsLwYTpUsJQPtjvDIE3Z/D7xAb21dNZwH
 FxWOC4m3ZYGYU8ul3L27naDReuyFxPlgvAShRQX0VsvjwIcoQT/P02/oXD2FiPGGdBQW
 DLewt5rXi8JdPiVEbDRwaFL2YaDcCi/2buo+8/mHQnHkGAtUtq23Kldhxx+PXg6jfJTY
 BXL3R+PG/riurZ7+qztxpzIMcBdp1e/V3hLnP70rE40WTvdPEhwGYD5jJPbcTp4kxzYd
 GnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632204; x=1719237004;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
 b=eSxAuhRmwXmRAndv4k+JXN9w5XaiyJR+YZQGaQdIfJQmD08WdBNVc8gXs2cVchbL+Y
 7tJ4KJLwRH2MU9PLfvLn3d2Cvtyu6EK19qqopPQtdPe9LJyak/Y0EA1VKpzlPyiZeFgX
 lRpa+pgRk/kH/qX9U8f9FAql3R29tef2TaWdGkYGAqpFEFvwhkvRebI64ut6pEuc0OGG
 DAE2HG2zHzDiaUbjHJpAXaZTTege83StEPibtmzb+e9ZFcFLSLoONHhfuCePIaixXVlF
 wp/d0RmRxWPZxwya6uEvov7Qf83pRxPQZezpjnTKdBBzjbtfx7ZHVDhepswrXCk/f+O8
 BsHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNcM8Fb/wO4MreBSZrb15lXhvKsER9JSYM6lXkMriUsyrTs3WjNhysXQrGRopEEnY7Fz4ldSxUpo+Cf4bJGWrhI5IxySb6IAPeSSp2/Kfj7qPztgrDtQLe
X-Gm-Message-State: AOJu0Yyz03zCtKp3h9r20ATIuYhs9gQX8M/jywRUJDYrVG8XvEgjvHOv
 QwBv4kMHmFBNyIQpBatBQ3/d5EANmcTE0iRcVmum5k4z4oJKRnM0dvHmXAReg5A=
X-Google-Smtp-Source: AGHT+IGEJP+y4ORB/qQsSLGS1aQN67uw6XFJYR5D2HpTVdZajfNzX+EcKLbp10S7XC6/Qne2Ev/fMQ==
X-Received: by 2002:a05:620a:4721:b0:795:55a1:9dd3 with SMTP id
 af79cd13be357-798d23c4382mr1195766785a.16.1718632204033; 
 Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:49 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-9-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 09/41] iio: adc: cpcap-adc: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jIHwgNDYgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L2NwY2FwLWFkYy5jIGIvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jCmluZGV4IGI2YzRlZjcw
NDg0ZS4uYzIxOGFjZjZjOWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvY3BjYXAtYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jCkBAIC0zODUsOSArMzg1LDggQEAg
c3RhdGljIGlycXJldHVybl90IGNwY2FwX2FkY19pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRh
dGEpCiAJc3RydWN0IGNwY2FwX2FkYyAqZGRhdGEgPSBpaW9fcHJpdihpbmRpb19kZXYpOwogCWlu
dCBlcnJvcjsKIAotCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQ
X1JFR19BRENDMiwKLQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywKLQkJCQkgICBDUENBUF9C
SVRfQURUUklHX0RJUyk7CisJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEtPnJlZywgQ1BD
QVBfUkVHX0FEQ0MyLAorCQkJCUNQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAlpZiAoZXJyb3IpCiAJ
CXJldHVybiBJUlFfTk9ORTsKIApAQCAtNDI0LDIzICs0MjMsMTkgQEAgc3RhdGljIHZvaWQgY3Bj
YXBfYWRjX3NldHVwX2NhbGlicmF0ZShzdHJ1Y3QgY3BjYXBfYWRjICpkZGF0YSwKIAlpZiAoZXJy
b3IpCiAJCXJldHVybjsKIAotCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcs
IENQQ0FQX1JFR19BRENDMiwKLQkJCQkgICBDUENBUF9CSVRfQVRPWF9QU19GQUNUT1IgfAotCQkJ
CSAgIENQQ0FQX0JJVF9BRENfUFNfRkFDVE9SMSB8Ci0JCQkJICAgQ1BDQVBfQklUX0FEQ19QU19G
QUNUT1IwLAotCQkJCSAgIDApOworCWVycm9yID0gcmVnbWFwX2NsZWFyX2JpdHMoZGRhdGEtPnJl
ZywgQ1BDQVBfUkVHX0FEQ0MyLAorCQkJCSAgQ1BDQVBfQklUX0FUT1hfUFNfRkFDVE9SIHwKKwkJ
CQkgIENQQ0FQX0JJVF9BRENfUFNfRkFDVE9SMSB8CisJCQkJICBDUENBUF9CSVRfQURDX1BTX0ZB
Q1RPUjApOwogCWlmIChlcnJvcikKIAkJcmV0dXJuOwogCi0JZXJyb3IgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCSAgIENQQ0FQX0JJVF9BRFRS
SUdfRElTLAotCQkJCSAgIENQQ0FQX0JJVF9BRFRSSUdfRElTKTsKKwllcnJvciA9IHJlZ21hcF9z
ZXRfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURDQzIsCisJCQkJQ1BDQVBfQklUX0FEVFJJ
R19ESVMpOwogCWlmIChlcnJvcikKIAkJcmV0dXJuOwogCi0JZXJyb3IgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCSAgIENQQ0FQX0JJVF9BU0Ms
Ci0JCQkJICAgQ1BDQVBfQklUX0FTQyk7CisJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEt
PnJlZywgQ1BDQVBfUkVHX0FEQ0MyLCBDUENBUF9CSVRfQVNDKTsKIAlpZiAoZXJyb3IpCiAJCXJl
dHVybjsKIApAQCAtNDU1LDggKzQ1MCw4IEBAIHN0YXRpYyB2b2lkIGNwY2FwX2FkY19zZXR1cF9j
YWxpYnJhdGUoc3RydWN0IGNwY2FwX2FkYyAqZGRhdGEsCiAJCWRldl9lcnIoZGRhdGEtPmRldiwK
IAkJCSJUaW1lb3V0IHdhaXRpbmcgZm9yIGNhbGlicmF0aW9uIHRvIGNvbXBsZXRlXG4iKTsKIAot
CWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19BRENDMSwK
LQkJCQkgICBDUENBUF9CSVRfQ0FMX01PREUsIDApOworCWVycm9yID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MxLAorCQkJCSAgQ1BDQVBfQklUX0NBTF9NT0RF
KTsKIAlpZiAoZXJyb3IpCiAJCXJldHVybjsKIH0KQEAgLTYwMiwyNiArNTk3LDIzIEBAIHN0YXRp
YyB2b2lkIGNwY2FwX2FkY19zZXR1cF9iYW5rKHN0cnVjdCBjcGNhcF9hZGMgKmRkYXRhLAogCQly
ZXR1cm47CiAKIAlpZiAocmVxLT50aW1pbmcgPT0gQ1BDQVBfQURDX1RJTUlOR19JTU0pIHsKLQkJ
ZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAot
CQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywKLQkJCQkJICAgQ1BDQVBfQklUX0FEVFJJR19E
SVMpOworCQllcnJvciA9IHJlZ21hcF9zZXRfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURD
QzIsCisJCQkJCUNQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAkJaWYgKGVycm9yKQogCQkJcmV0dXJu
OwogCi0JCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19B
RENDMiwKLQkJCQkJICAgQ1BDQVBfQklUX0FTQywKLQkJCQkJICAgQ1BDQVBfQklUX0FTQyk7CisJ
CWVycm9yID0gcmVnbWFwX3NldF9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19BRENDMiwKKwkJ
CQkJQ1BDQVBfQklUX0FTQyk7CiAJCWlmIChlcnJvcikKIAkJCXJldHVybjsKIAl9IGVsc2Ugewot
CQllcnJvciA9IHJlZ21hcF91cGRhdGVfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURDQzIs
Ci0JCQkJCSAgIENQQ0FQX0JJVF9BRFRSSUdfT05FU0hPVCwKLQkJCQkJICAgQ1BDQVBfQklUX0FE
VFJJR19PTkVTSE9UKTsKKwkJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEtPnJlZywgQ1BD
QVBfUkVHX0FEQ0MyLAorCQkJCQlDUENBUF9CSVRfQURUUklHX09ORVNIT1QpOwogCQlpZiAoZXJy
b3IpCiAJCQlyZXR1cm47CiAKLQkJZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJl
ZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywgMCk7CisJ
CWVycm9yID0gcmVnbWFwX2NsZWFyX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAor
CQkJCQkgIENQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAkJaWYgKGVycm9yKQogCQkJcmV0dXJuOwog
CX0KCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
