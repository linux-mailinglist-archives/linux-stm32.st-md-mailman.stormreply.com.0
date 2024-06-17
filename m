Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162C90B010
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D388C78012;
	Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41F76C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:07 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-796df041d73so313356085a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632206; x=1719237006;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
 b=mhHPTriKATLuBM0FOaw4V0T/1tgESUA8aS5u3ucLT7KKfWHqJa+m+iIXR6FVHJ5QdB
 Owud7IDLg1YzH1r1T6jYkl0E70xyozdg/Q2Arn6KAurppkQBaFpwEk4iKqIVLtpjddPm
 4sypfRVyARTFzjYn5wBt7AVF2Xr2QelkeJjpUz4qXWPd9P/CUeACyhpHdmtR+dDr1+C9
 JLwdq92/UvIuMdaiLGZHEyV0GhUUDv1BabxnbJID47btlHwhgUawnyD+yrNhYtUfj1Vk
 y+cmEJw6sct8SCe5UgcUXTXYF9/HH2McnCanMiwZMEZK7V9Y4gIi3p0YiZCD4rmrhVbt
 Wxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632206; x=1719237006;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
 b=W1uSmerBTkhcYOHy8/1vip6Bi39bp3E87XIC2yxqE/U0sdttQH5hdpmd+6i4BGUjqk
 F8YHpwFYeYKndTtztBY6pa3ogvOIhPveO1lTNgFPuN3HTdz03BddOEH9YWilHM/HhVPW
 Ha2EXVx2ohOqN0thxeAvqCCD34akcrq3D7Dgf0OxLVRjnYmWJdf9zUQoqJ3xcF7n1a52
 OG52H+btPurPnzfIOth2MsDhn0GJtQjqPz2HDm9YhjqoknJ944wrwGxy3LHfDKC6RMDk
 K75GXt+IY8Q5VH9u5ejVgko73p07PEFjpeJgwA60lDkNUN8re9HF3wFrR5fcVjiYsxO6
 2RLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8i5tvWtED09lvC6/BeLJJ2aqLI7EMSSlTqba4nr4pKl8/jwzb7amzXvpe7lC8wwJSHKrcU/RbLDT13O69HuP/R2N2VGyrMRaXoeV03vrIHxMbBhfm6aX5
X-Gm-Message-State: AOJu0Yx6MN4PLHNjBgWqGQ2X/BFuV7nuOMCVSoddN08kdakG4+LG6b69
 Iye2SwVLcsjpTmMaMhlCO8xsmSOQsP1fmnVT/Q5gjfQ/Ht4Aajj1ahMc1NyJ03I=
X-Google-Smtp-Source: AGHT+IEuE3X+Ttrgd1pciF1gOmiGqm6CNudwXH5GABygzdDAc5BXX3iLlJx1my8INZ4E7qgPOczVYA==
X-Received: by 2002:a05:620a:444f:b0:795:5815:2f9f with SMTP id
 af79cd13be357-798d241d00fmr1205475685a.25.1718632206164; 
 Mon, 17 Jun 2024 06:50:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:50 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-10-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 10/41] iio: adc: fsl-imx25-gcq: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYyB8IDE2ICsrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYyBiL2RyaXZlcnMv
aWlvL2FkYy9mc2wtaW14MjUtZ2NxLmMKaW5kZXggYjY4MDY5MDYzMWRiLi5iM2YwMzc1MTBlMzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9mc2wtaW14MjUtZ2NxLmMKKysrIGIvZHJpdmVy
cy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYwpAQCAtODcsMTMgKzg3LDEzIEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBteDI1X2djcV9pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAlyZWdtYXBfcmVhZChw
cml2LT5yZWdzLCBNWDI1X0FEQ1FfU1IsICZzdGF0cyk7CiAKIAlpZiAoc3RhdHMgJiBNWDI1X0FE
Q1FfU1JfRU9RKSB7Ci0JCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FEQ1Ff
TVIsCi0JCQkJICAgTVgyNV9BRENRX01SX0VPUV9JUlEsIE1YMjVfQURDUV9NUl9FT1FfSVJRKTsK
KwkJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9NUiwKKwkJCQlNWDI1X0FE
Q1FfTVJfRU9RX0lSUSk7CiAJCWNvbXBsZXRlKCZwcml2LT5jb21wbGV0ZWQpOwogCX0KIAogCS8q
IERpc2FibGUgY29udmVyc2lvbiBxdWV1ZSBydW4gKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJp
di0+cmVncywgTVgyNV9BRENRX0NSLCBNWDI1X0FEQ1FfQ1JfRlFTLCAwKTsKKwlyZWdtYXBfY2xl
YXJfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FEQ1FfQ1IsIE1YMjVfQURDUV9DUl9GUVMpOwogCiAJ
LyogQWNrbm93bGVkZ2UgYWxsIHBvc3NpYmxlIGlycXMgKi8KIAlyZWdtYXBfd3JpdGUocHJpdi0+
cmVncywgTVgyNV9BRENRX1NSLCBNWDI1X0FEQ1FfU1JfRlJSIHwKQEAgLTExNSwxMSArMTE1LDEw
IEBAIHN0YXRpYyBpbnQgbXgyNV9nY3FfZ2V0X3Jhd192YWx1ZShzdHJ1Y3QgZGV2aWNlICpkZXYs
CiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9JVEVNXzdfMCwKIAkJICAgICBN
WDI1X0FEQ1FfSVRFTSgwLCBjaGFuLT5jaGFubmVsKSk7CiAKLQlyZWdtYXBfdXBkYXRlX2JpdHMo
cHJpdi0+cmVncywgTVgyNV9BRENRX01SLCBNWDI1X0FEQ1FfTVJfRU9RX0lSUSwgMCk7CisJcmVn
bWFwX2NsZWFyX2JpdHMocHJpdi0+cmVncywgTVgyNV9BRENRX01SLCBNWDI1X0FEQ1FfTVJfRU9R
X0lSUSk7CiAKIAkvKiBUcmlnZ2VyIHF1ZXVlIGZvciBvbmUgcnVuICovCi0JcmVnbWFwX3VwZGF0
ZV9iaXRzKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9DUiwgTVgyNV9BRENRX0NSX0ZRUywKLQkJCSAg
IE1YMjVfQURDUV9DUl9GUVMpOworCXJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FE
Q1FfQ1IsIE1YMjVfQURDUV9DUl9GUVMpOwogCiAJdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoCiAJCSZwcml2LT5jb21wbGV0ZWQsIE1YMjVfR0NR
X1RJTUVPVVQpOwpAQCAtMjcyLDkgKzI3MSw4IEBAIHN0YXRpYyBpbnQgbXgyNV9nY3Ffc2V0dXBf
Y2ZncyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJCSAgIE1YMjVfQURDUV9DRkdf
UkVGTl9NQVNLLAogCQkJCSAgIHJlZnAgfCByZWZuKTsKIAl9Ci0JcmVnbWFwX3VwZGF0ZV9iaXRz
KHByaXYtPnJlZ3MsIE1YMjVfQURDUV9DUiwKLQkJCSAgIE1YMjVfQURDUV9DUl9GUlNUIHwgTVgy
NV9BRENRX0NSX1FSU1QsCi0JCQkgICBNWDI1X0FEQ1FfQ1JfRlJTVCB8IE1YMjVfQURDUV9DUl9R
UlNUKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVncywgTVgyNV9BRENRX0NSLAorCQkJTVgy
NV9BRENRX0NSX0ZSU1QgfCBNWDI1X0FEQ1FfQ1JfUVJTVCk7CiAKIAlyZWdtYXBfd3JpdGUocHJp
di0+cmVncywgTVgyNV9BRENRX0NSLAogCQkgICAgIE1YMjVfQURDUV9DUl9QRE1TSyB8IE1YMjVf
QURDUV9DUl9RU01fRlFTKTsKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
