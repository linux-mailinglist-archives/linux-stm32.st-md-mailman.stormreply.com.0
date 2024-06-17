Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5292E90B027
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A5DFC78002;
	Mon, 17 Jun 2024 13:50:45 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5E14C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:43 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-797fb0b4832so218432685a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632243; x=1719237043;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
 b=iBO5/Mgqmyj7vfV/TEZGQ2K/bMJPF0vPKjLNbmdDPJlnhJU2zTnJB6xSkdH7zCr9Y2
 2PXKnGY+H/KyuANxLNlZIRUZVZsJPmeJWL2je0fJXt/uv7Sy6E8+h/tmfRZt0cBYIfja
 hrnWEu9kge3xFGKWiAI6x1WdoE+gcWch4E75UGUR7aBfVf50A9hHLZB0wJQIg2k11BW7
 rWlbBf5CV6cDlPZMOiLKiA3/OTPgRSL63e+K4BHF/9gak/c3dvJWeJuKWMu+jsVZTFB1
 oNqFrfPZBxRVB5EWL3tM/xxy/bfrxVyRk3yM8NxrMmpczSat9ysgaboWn2UwNkSXDH4y
 c7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632243; x=1719237043;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
 b=Vkl2QUMsgZ7dl2B1j0rsBgmeOa9/MgydKQpmI0YzrhVV7CbtnbilXx42foloTkT4kT
 orgin1XeVR1P/Uy3OJ+Xvtt5IkmJn/SrfS1IcCliT8jQvBBe540K6IUA0+ZUoIXeV4kY
 YfJWkejjuZfMj8hNDxx2ZBpGyNOFA88QyOPRhBT3VuHVRU7xhtJK56D8fW4KyWVxjyyX
 XXRT3fOTiV1bgy9jgRJ3ALnoSqi+Tui0Zfe2Lu+uMqgl4hZWFPjgtnxYnqiUBHGIoKJR
 8hPyFq0EGJo/vM4k7LwBQ+Con8WmQRh41p7tLEeq6JyPUUtVbT0+OuN4HZTs6KVxpFnq
 TB5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxUQHLup1t5IfGFl513POIKtcczlLPbrY10v0E3psSq2+DLyar0m3EratrhMOS6ZWln6WZxwHAJQXBRNIxBO+FJaqlcfuoa18C6B0txNQZLRozjRj9rXIQ
X-Gm-Message-State: AOJu0YwoVIOcd8XD0yG5+Lhf3IDyu+DTrKvPqs0jr1gHjIkghZCKU7n4
 i05Xo4eXZpJfoFYOQEA//xntdgGm9V4yd2/PzctL1mspF5VYMQO/fKAC3E/esqA=
X-Google-Smtp-Source: AGHT+IFGOx2s8Nnos2uW+1yz9gXjI96q1FUrsSHsvdHqjpAdDpOLj6w2PTD0THhqXhocLH6W1aVi0w==
X-Received: by 2002:a05:620a:46a1:b0:79a:2613:9b40 with SMTP id
 af79cd13be357-79a26139e04mr977624785a.50.1718632242836; 
 Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:07 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-27-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 27/41] iio: imu: inv_icm42600: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfYnVm
ZmVyLmMgfCAxNCArKysrKystLS0tLS0tLQogZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9p
bnZfaWNtNDI2MDBfY29yZS5jICAgfCAgOSArKysrLS0tLS0KIGRyaXZlcnMvaWlvL2ltdS9pbnZf
aWNtNDI2MDAvaW52X2ljbTQyNjAwX2kyYy5jICAgIHwgIDQgKystLQogZHJpdmVycy9paW8vaW11
L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfc3BpLmMgICAgfCAgNCArKy0tCiA0IGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jIGIvZHJpdmVy
cy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfYnVmZmVyLmMKaW5kZXggNjNiODVl
Yzg4YzEzLi41MDlmZTZhM2FlOTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jCisrKyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jCkBAIC0yNjIsOSArMjYyLDggQEAgaW50IGludl9p
Y200MjYwMF9idWZmZXJfdXBkYXRlX3dhdGVybWFyayhzdHJ1Y3QgaW52X2ljbTQyNjAwX3N0YXRl
ICpzdCkKIAogCS8qIHJlc3RvcmUgd2F0ZXJtYXJrIGludGVycnVwdCAqLwogCWlmIChyZXN0b3Jl
KSB7Ci0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVH
X0lOVF9TT1VSQ0UwLAotCQkJCQkgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lO
VDFfRU4sCi0JCQkJCSBJTlZfSUNNNDI2MDBfSU5UX1NPVVJDRTBfRklGT19USFNfSU5UMV9FTik7
CisJCXJldCA9IHJlZ21hcF9zZXRfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9T
T1VSQ0UwLAorCQkJCSAgICAgIElOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZPX1RIU19JTlQx
X0VOKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQpAQCAtMzA2LDkgKzMwNSw4IEBA
IHN0YXRpYyBpbnQgaW52X2ljbTQyNjAwX2J1ZmZlcl9wb3N0ZW5hYmxlKHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYpCiAJfQogCiAJLyogc2V0IEZJRk8gdGhyZXNob2xkIGludGVycnVwdCAqLwot
CXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9T
T1VSQ0UwLAotCQkJCSBJTlZfSUNNNDI2MDBfSU5UX1NPVVJDRTBfRklGT19USFNfSU5UMV9FTiwK
LQkJCQkgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lOVDFfRU4pOworCXJldCA9
IHJlZ21hcF9zZXRfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9TT1VSQ0UwLAor
CQkJICAgICAgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lOVDFfRU4pOwogCWlm
IChyZXQpCiAJCWdvdG8gb3V0X3VubG9jazsKIApAQCAtMzYzLDggKzM2MSw4IEBAIHN0YXRpYyBp
bnQgaW52X2ljbTQyNjAwX2J1ZmZlcl9wcmVkaXNhYmxlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYpCiAJCWdvdG8gb3V0X3VubG9jazsKIAogCS8qIGRpc2FibGUgRklGTyB0aHJlc2hvbGQgaW50
ZXJydXB0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYw
MF9SRUdfSU5UX1NPVVJDRTAsCi0JCQkJIElOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZPX1RI
U19JTlQxX0VOLCAwKTsKKwlyZXQgPSByZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNN
NDI2MDBfUkVHX0lOVF9TT1VSQ0UwLAorCQkJCUlOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZP
X1RIU19JTlQxX0VOKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF91bmxvY2s7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYyBiL2Ry
aXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYwppbmRleCA5NjEx
NmE2OGFiMjkuLmJiMzAyZjU1NDBjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaW11L2ludl9p
Y200MjYwMC9pbnZfaWNtNDI2MDBfY29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYwpAQCAtNDM1LDkgKzQzNSw4IEBAIHN0YXRpYyBpbnQg
aW52X2ljbTQyNjAwX3NldHVwKHN0cnVjdCBpbnZfaWNtNDI2MDBfc3RhdGUgKnN0LAogCQlyZXR1
cm4gcmV0OwogCiAJLyogc2Vuc29yIGRhdGEgaW4gYmlnLWVuZGlhbiAoZGVmYXVsdCkgKi8KLQly
ZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRGX0NP
TkZJRzAsCi0JCQkJIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzBfU0VOU09SX0RBVEFfRU5ESUFO
LAotCQkJCSBJTlZfSUNNNDI2MDBfSU5URl9DT05GSUcwX1NFTlNPUl9EQVRBX0VORElBTik7CisJ
cmV0ID0gcmVnbWFwX3NldF9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYwMF9SRUdfSU5URl9DT05G
SUcwLAorCQkJICAgICAgSU5WX0lDTTQyNjAwX0lOVEZfQ09ORklHMF9TRU5TT1JfREFUQV9FTkRJ
QU4pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTUzMiw4ICs1MzEsOCBAQCBzdGF0
aWMgaW50IGludl9pY200MjYwMF9pcnFfaW5pdChzdHJ1Y3QgaW52X2ljbTQyNjAwX3N0YXRlICpz
dCwgaW50IGlycSwKIAkJcmV0dXJuIHJldDsKIAogCS8qIERlYXNzZXJ0IGFzeW5jIHJlc2V0IGZv
ciBwcm9wZXIgSU5UIHBpbiBvcGVyYXRpb24gKGNmIGRhdGFzaGVldCkgKi8KLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRfQ09ORklHMSwKLQkJ
CQkgSU5WX0lDTTQyNjAwX0lOVF9DT05GSUcxX0FTWU5DX1JFU0VULCAwKTsKKwlyZXQgPSByZWdt
YXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9DT05GSUcxLAorCQkJ
CUlOVl9JQ000MjYwMF9JTlRfQ09ORklHMV9BU1lOQ19SRVNFVCk7CiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZf
aWNtNDI2MDBfaTJjLmMgYi9kcml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYw
MF9pMmMuYwppbmRleCA4ZDMzNTA0ZDc3MGYuLmViYjMxYjM4NTg4MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfaTJjLmMKKysrIGIvZHJpdmVy
cy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfaTJjLmMKQEAgLTI4LDggKzI4LDgg
QEAgc3RhdGljIGludCBpbnZfaWNtNDI2MDBfaTJjX2J1c19zZXR1cChzdHJ1Y3QgaW52X2ljbTQy
NjAwX3N0YXRlICpzdCkKIAkJCSAgIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzZfTUFTSywKIAkJ
CSAgIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzZfSTNDX0VOKTsKIAotCXJldCA9IHJlZ21hcF91
cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVEZfQ09ORklHNCwKLQkJCQkg
SU5WX0lDTTQyNjAwX0lOVEZfQ09ORklHNF9JM0NfQlVTX09OTFksIDApOworCXJldCA9IHJlZ21h
cF9jbGVhcl9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYwMF9SRUdfSU5URl9DT05GSUc0LAorCQkJ
CUlOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzRfSTNDX0JVU19PTkxZKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2lu
dl9pY200MjYwMF9zcGkuYyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQy
NjAwX3NwaS5jCmluZGV4IGNjMmJmMTc5OWE0Ni4uZWFlNWZmN2EzY2MxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYwMF9zcGkuYworKysgYi9kcml2
ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYwMF9zcGkuYwpAQCAtMjcsOCArMjcs
OCBAQCBzdGF0aWMgaW50IGludl9pY200MjYwMF9zcGlfYnVzX3NldHVwKHN0cnVjdCBpbnZfaWNt
NDI2MDBfc3RhdGUgKnN0KQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRGX0NPTkZJRzQsCi0J
CQkJIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzRfSTNDX0JVU19PTkxZLCAwKTsKKwlyZXQgPSBy
ZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVEZfQ09ORklHNCwK
KwkJCQlJTlZfSUNNNDI2MDBfSU5URl9DT05GSUc0X0kzQ19CVVNfT05MWSk7CiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
