Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EF90B028
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283A2C78012;
	Mon, 17 Jun 2024 13:50:47 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15C65C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:46 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2550aa6f994so2726541fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632245; x=1719237045;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=no5e4JgYnxUL9VEAR0MyhLfYZ2Dji3NZkE6FFtqTn2Y=;
 b=RA3oHvYZ2wAArUwqxOX91/Q2yFYl0UTO6sjr4VSTir2iv4c5g2yKADfdlpSAFEKFlx
 cy5iqm9wLQA1JbvvHThYOM6tzwI312APiN5IP1PsPAOh2NkOGP2TNKfSiVUehXe2Eqvj
 9OFNNAp+xsZRFdhn/vxh5fwRBwqI1vBp6DZh8Ohbd2H7KO164sOUSACZivxwMCOWD+BA
 ILRl2bG8vXgLPcvtQwdUHLwYlz2jgJM2C9qUasubLWLPi+jYZ1x6Ovdf9y08r7Z5I5eH
 g6aS4ZCmKBcGHhapXytA7uU4OPDhbCIJh7MIC9Sd/2HJyrOJaUrJ/N0aNJk6Pe/mq4Ip
 Em2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632245; x=1719237045;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=no5e4JgYnxUL9VEAR0MyhLfYZ2Dji3NZkE6FFtqTn2Y=;
 b=AKMnRaMIqG69YJQ/sB2kXQwM/BENgylzY/1fCdUuRI1VoPFEywwXOlracS9hrcfbe3
 DMbBsPWtuWHE1H+gkPSrzlhzx6T30i0u4xhS6qmzfBDJDl2TKmme5huyU/voD2nXwrEV
 d4UoUe0LSH/gIrXM7fsqJqBs3U3WYk4Mh6aZFO+5MEH1oc+uK+t+T9opg+5GHywh8bYq
 /9exrXQlfT4DJqGHlzqrxzMyFpTEWoXmsh+ep7wVoPvq3bduxpuMtN6ExLrqtT4B1TGs
 DoIJChV0qhLqgdFmX7hMjzxea/1dfpkuwxccqkacpyIuHDBCQojZPWaORGJSmvumzYhg
 02VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhmB9OUEEI7jxIexzU81LAbO5J3I7bUUcIikC6BeW9p0Yf1Ct4ThAiL2FZ4b6wPhddlGY9BhtfYZnkcBalLUsKN9yjvbWr7W46sHjC5+SUR15cxzLhZdY+
X-Gm-Message-State: AOJu0YwZ8Tw04/vl5h1/9nH0ebAzAIXsg1EqGA4lgtcFv/5L0SsonoiV
 1QqOiCFtk3TcAiJg0JwPsfD63uIlW6FIKi/NnMaqH1JVE8N/InJqjop5IjUwxs0hOaByXS6zI2G
 NblE=
X-Google-Smtp-Source: AGHT+IGU9b+YnJX5hCRw1ClyleRAxjZc2rSg4p660bR5sIf4JFOEx4FbnA14YINHS71KeMJAZo8MSg==
X-Received: by 2002:a05:6870:472c:b0:24f:c95b:ab6 with SMTP id
 586e51a60fabf-2584288ca57mr11986485fac.8.1718632244964; 
 Mon, 17 Jun 2024 06:50:44 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:08 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-28-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 28/41] iio: light: adux1020: make use of
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvYWR1eDEwMjAuYyB8IDEzICsrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vbGlnaHQvYWR1eDEwMjAuYyBiL2RyaXZlcnMvaWlvL2xpZ2h0
L2FkdXgxMDIwLmMKaW5kZXggYWE0YTZjNzhmMGFhLi4zNDIzMGU2OTlkMjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaWlvL2xpZ2h0L2FkdXgxMDIwLmMKKysrIGIvZHJpdmVycy9paW8vbGlnaHQvYWR1
eDEwMjAuYwpAQCAtNTM5LDkgKzUzOSw4IEBAIHN0YXRpYyBpbnQgYWR1eDEwMjBfd3JpdGVfZXZl
bnRfY29uZmlnKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJCSAqIFRyaWdnZXIgcHJveGlt
aXR5IGludGVycnVwdCB3aGVuIHRoZSBpbnRlbnNpdHkgaXMgYWJvdmUKIAkJICogb3IgYmVsb3cg
dGhyZXNob2xkCiAJCSAqLwotCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBBRFVYMTAyMF9SRUdfUFJPWF9UWVBFLAotCQkJCQkgQURVWDEwMjBfUFJPWF9UWVBFLAotCQkJ
CQkgQURVWDEwMjBfUFJPWF9UWVBFKTsKKwkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJl
Z21hcCwgQURVWDEwMjBfUkVHX1BST1hfVFlQRSwKKwkJCQkgICAgICBBRFVYMTAyMF9QUk9YX1RZ
UEUpOwogCQlpZiAocmV0IDwgMCkKIAkJCWdvdG8gZmFpbDsKIApAQCAtNzQ4LDggKzc0Nyw4IEBA
IHN0YXRpYyBpbnQgYWR1eDEwMjBfY2hpcF9pbml0KHN0cnVjdCBhZHV4MTAyMF9kYXRhICpkYXRh
KQogCiAJZGV2X2RiZygmY2xpZW50LT5kZXYsICJEZXRlY3RlZCBBRFVYMTAyMCB3aXRoIGNoaXAg
aWQ6IDB4JTA0eFxuIiwgdmFsKTsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5y
ZWdtYXAsIEFEVVgxMDIwX1JFR19TV19SRVNFVCwKLQkJCQkgQURVWDEwMjBfU1dfUkVTRVQsIEFE
VVgxMDIwX1NXX1JFU0VUKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBB
RFVYMTAyMF9SRUdfU1dfUkVTRVQsCisJCQkgICAgICBBRFVYMTAyMF9TV19SRVNFVCk7CiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKQEAgLTc2NCw4ICs3NjMsOCBAQCBzdGF0aWMgaW50
IGFkdXgxMDIwX2NoaXBfaW5pdChzdHJ1Y3QgYWR1eDEwMjBfZGF0YSAqZGF0YSkKIAkJcmV0dXJu
IHJldDsKIAogCS8qIFVzZSBMRURfSVJFRiBmb3IgcHJveGltaXR5IG1vZGUgKi8KLQlyZXQgPSBy
ZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBBRFVYMTAyMF9SRUdfTEVEX0NVUlJFTlQs
Ci0JCQkJIEFEVVgxMDIwX0xFRF9QSVJFRl9FTiwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGF0YS0+cmVnbWFwLCBBRFVYMTAyMF9SRUdfTEVEX0NVUlJFTlQsCisJCQkJQURVWDEwMjBf
TEVEX1BJUkVGX0VOKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
