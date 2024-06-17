Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BDC90B036
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83387C78013;
	Mon, 17 Jun 2024 13:51:07 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 515E5C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:05 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-24c9f630e51so2184993fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632264; x=1719237064;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
 b=YyYDh7mMfgwZDs1QqW9nPFtqWvISl3HDXt3906fbfGs4x4kW55tUkXCyQCCjEJoPMR
 t4NCkmWqeYOvxKjkDoRbRX8BZjE9CPwbRB6h+9/4s3K3SNUhV2utZBd2b0rYN4u7h4Nt
 VVvQsU5/EeWCOhhBK2RGr0Mvv3q2ii7CoikzIhTGjd3QoxgBp2NZg1MtqigOpDqxVeDs
 K+4SqS2uuduVDDeSgjk3gDYU2xZ/Z735zDnzxAnuPY7gGZIOy0j94BA9iM0wIA95qI06
 ATdBp6NR7zJ0vqr1uFfBtlGkSCXTAcpP3CbWTVL6c6I2H0EDcaTeaFzi9FTWcOjRLV41
 6fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632264; x=1719237064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MWd9RIrs8wL0I/TcIsG/QAgGB9T5+fxOkhv6E/dAdZI=;
 b=vjotP8cwaYzQQtNQkc7GxFDpjz2JCElHn28jTWqQXzPyK5Ssp84AxbchytYWNI3MBw
 bpR82LDrTmSZcJeAz0vWqA0FMgIqoWpcudCQfR60BYfR0wn7gahpn13oG9YvpuWo1lJI
 N7onpeIldeeoCvi2huUMlF3XvhRVdcP0MMdSSIiwwkrINUHWZjfqyEXx5fH/N0umWJpw
 nZ9rTFcGB7bQzyn1Kt+y+K5C/mcj864yl9t98ohh/qAPRsJTVeA5lYIqRJPZESL0IsMw
 gLrXQOvOcTHw9MtR2UZKr47ah1JWgNwVUPRYfvshwybDBGcrnT61z41cGnvKj/AHfzct
 zc8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNc8lm9PwAIAr9o+lwdYHWquIDvJXZaXIgk4vyVeaf0eZMzZa4+pkBDX8xQ99nAYHXdhXRuU08bs/ZWJ8CysOp3dNFN/BYgaEodnbeHk7YqwgZa/BiNQXH
X-Gm-Message-State: AOJu0YzVAZxXWwHAr3v3oTC/K9s1wIn8iPJm3XK2XYSgZ3osH5yjAfBe
 veNPZ4IMMNo85htlGcAHoGfIlFH8lePa1qnS8cgGfLKpnw3EC9NF68ux3SLDk/k=
X-Google-Smtp-Source: AGHT+IH8uTWV+X4VQg+Hvv7+Ss0V04PvnK1VdmrqhUaV/+VFOL4UdwUlA2xHiJMwUxJKiw4xuPCudA==
X-Received: by 2002:a05:6870:15d5:b0:254:8bb9:d0bf with SMTP id
 586e51a60fabf-2584298505cmr11157462fac.32.1718632264185; 
 Mon, 17 Jun 2024 06:51:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:17 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-37-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 37/41] iio: proximity: sx9360: make use of
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9wcm94
aW1pdHkvc3g5MzYwLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkz
NjAuYyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzNjAuYwppbmRleCA3NWExYzI5ZjE0ZWIu
LjJiOTBiZjQ1YTIwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTM2MC5j
CisrKyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzNjAuYwpAQCAtNjcyLDkgKzY3Miw4IEBA
IHN0YXRpYyBpbnQgc3g5MzYwX2luaXRfY29tcGVuc2F0aW9uKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYpCiAJaW50IHJldDsKIAogCS8qIHJ1biB0aGUgY29tcGVuc2F0aW9uIHBoYXNlIG9uIGFs
bCBjaGFubmVscyAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNY
OTM2MF9SRUdfU1RBVCwKLQkJCQkgU1g5MzYwX1JFR19TVEFUX0NPTVBTVEFUX01BU0ssCi0JCQkJ
IFNYOTM2MF9SRUdfU1RBVF9DT01QU1RBVF9NQVNLKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMo
ZGF0YS0+cmVnbWFwLCBTWDkzNjBfUkVHX1NUQVQsCisJCQkgICAgICBTWDkzNjBfUkVHX1NUQVRf
Q09NUFNUQVRfTUFTSyk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
