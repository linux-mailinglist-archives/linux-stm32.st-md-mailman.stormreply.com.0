Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBA90B023
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB9F8C78002;
	Mon, 17 Jun 2024 13:50:37 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E40BDC78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:36 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3d1bc6e5f01so2543408b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632236; x=1719237036;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
 b=LbH+Yxjq5wqeOz50Kzur3GiR1JV4XnLSHxbQjm3KfZG2Dfvc59rLImd5aU/lz4xIJ1
 ddomS+7KikJPjj4FMfhp3M/jXqLnHXnKpS8aPou13KHds0wnjuBKzKtaRgXmgCcznBDq
 ETE/XPIRGjcfmekui0/oRfK7IuxYhmMJ1ORGClBZkpPqcdEFhviBT95jCpW9tLq9MwKd
 Zhdp3UEReRDZ/moIpSNeQ9oe/j++bJmfFHd76GjEQZFs0OUMwILGT4NalZ7RAdm7V2EG
 KYuvKH63+zTi5IgBJm5/Gmp78GJXKmR7wSlF5FBJzsWSwpBcQCUpN7KhGSVocYH6whlX
 +29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632236; x=1719237036;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
 b=JiMmeTG8vWu9ynnJI/3JlxzdRZGemKdyaaABfM/GrH/WUj9Wao1Ps3loyfuSKeTS0b
 05EkrlrrDqWfJvPhDr2StpGbhMO6lscLLFWA10GXpO2YEEDsD0cJBLp8ZCZ91deFK7OG
 DA/4AW9UUBxqes+4Gy507wSTltNddFGqXWaY/p0mIMrZM7OWqVgKOIgAM6STLa5niO3P
 sCTczZntHwr7O0oy7ZCq9bOiOHmAc5RNEoHLaN0uBgXKecSLJMTTfgluIPTMJoedfxGh
 MuHoQ4s2S5cosAfDPBFg+GbzLiQbQqKo2BbitXgyCyrA4QuIPTek4jvaw6iIDBr0I1bu
 OQ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTspX4nRY77Pw0ay30JnO5OLBO9kljE5CSxoKGC0cxWgyH9Zhb1Y+CFxxTf+jdVP4j0uGDw9YwHWjREPo3yn2pce+ZdM0ddjyLyIvLhd+Z0WL+zq6D+PEv
X-Gm-Message-State: AOJu0YxOqnl/y+waTbUqtYtfp1Wy9negLQSNPiKNWaSxUzg+5s8b6axt
 j1hiBsqYVSKqq6zD9Nbh6Ccz0fZiC5QVa4VNhBawYCwctT+9PHiJsJR1paZKje/xqUWE1ibr+vQ
 4KUs=
X-Google-Smtp-Source: AGHT+IENHYKm3NgqHa1MPYUPJeZqzEGABKtYhMj6CIPi8s9CW+uIlwWgMeUoLMPd9TX2TqZf6pVe1w==
X-Received: by 2002:a05:6808:e83:b0:3d2:27d3:2928 with SMTP id
 5614622812f47-3d24e8f5deamr10493207b6e.28.1718632234195; 
 Mon, 17 Jun 2024 06:50:34 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:03 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-23-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 23/41] iio: health: afe4403: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vaGVhbHRoL2FmZTQ0MDMuYyB8IDkgKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDAzLmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvYWZl
NDQwMy5jCmluZGV4IDFkYmU0OGRhZTc0ZS4uNTIzMjZkYzUyMWFjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2lpby9oZWFsdGgvYWZlNDQwMy5jCisrKyBiL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDAz
LmMKQEAgLTQyMiw5ICs0MjIsOCBAQCBzdGF0aWMgaW50IGFmZTQ0MDNfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAJc3RydWN0IGFmZTQ0MDNfZGF0YSAqYWZlID0gaWlvX3ByaXYoaW5kaW9f
ZGV2KTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFw
LCBBRkU0NDBYX0NPTlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsCi0JCQkJ
IEFGRTQ0MFhfQ09OVFJPTDJfUEROX0FGRSk7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGFmZS0+
cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJICAgICAgQUZFNDQwWF9DT05UUk9MMl9QRE5f
QUZFKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC00NDksOCArNDQ4LDggQEAgc3Rh
dGljIGludCBhZmU0NDAzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NP
TlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsIDApOworCXJldCA9IHJlZ21h
cF9jbGVhcl9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJCUFGRTQ0MFhf
Q09OVFJPTDJfUEROX0FGRSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
