Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24590B035
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79FEFC78014;
	Mon, 17 Jun 2024 13:51:05 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D8BEC78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:03 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5b96a78639aso1726258eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632262; x=1719237062;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
 b=hA2AEboDT8KcEtP080GvFGw/UVnombaUbz8TSkzm34E547Za1HtW257iYDOu5FOhoR
 OigB2zbdV3e0JBdw+0vj5O/aLTP3NBJjyw6iXS9cAztnTqIa7QAKRRUh2nAqzLLrIvVl
 nv3IQVZBZOu23OzXLbtjGYEJCJQMwkk3CYtFE240CcO6cZ07aG0mpK4Zl3C430LGvf0i
 OPvUFtzUSFH9qZGKWmSlzyBAMQ3V6NgE1ofvtXoE1aUlyhWFw5Sd+0ANTSK3PrC/7jwG
 zZsJE77YolhwS8XMvNyK9zt6F2XFyl0ZHXzJeQBqdsiQJkAw5wpRxkQtaoV2c5bb7R3P
 EAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632262; x=1719237062;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
 b=JKs3IK3wfDDUDSLxVW87GABPMF9dW3u99khWifVdEBvqmVFs0LBpPrMdQJ/oOt/YuB
 mLFA5tS0mR3B3ccmhL9dkWs+WkKas8mPv798jkXEPqIbFKYoY/lk6o4g2lVmQ74tYEBf
 24QE+LAjkqFJbFjGUWsbG3oiLYj3NjOpuJKHxEWpXRXK2ZouSEFVM5aTHOWW57BJ0lKk
 evoC2rsyxNWm2Pjm229kokRBrKHrg5tm/iL3OSEKGoDW+mokFBBvZj6+i1oGSkAkkpBj
 7j4W9BsfUmlwbxFe8vxauOCrWib0lb2GJvsCfUqb81Lg1wzD27QMN5q4lYetumeWYaJ8
 W3rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpMGbBF+JTEyXSESxsGB73nbmnohrqzoRAyZNkazzdak/vXs8hnEcsFTJU9Bs8hC8xRulbLdkB8/9m33Ht5/BOkEXAVZMcakKxj5xyoxhlcp5ixrJnOrUe
X-Gm-Message-State: AOJu0YyK634Iq04HnGs5lgEZTIH9N4wB5Z1DBrLE66SeLmY/k4fa5EIK
 jdyU+IzYxzAAEygeBU3udmNM0ke2ozws00YMKxeKzoLPoqNpkaEZrMqw+eQ/4QQ=
X-Google-Smtp-Source: AGHT+IFPuCaLYR0OC2CKxxs6bVWzV0l0Y4GqKpcVsLYm2jLp2HnQirR7TaXtLxRY2U4vfGwAEVGQmA==
X-Received: by 2002:a05:6870:89a4:b0:254:7471:56b7 with SMTP id
 586e51a60fabf-25842853b1bmr11345694fac.11.1718632262042; 
 Mon, 17 Jun 2024 06:51:02 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:51:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:16 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-36-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 36/41] iio: proximity: sx9324: make use of
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
aW1pdHkvc3g5MzI0LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkz
MjQuYyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzMjQuYwppbmRleCBhYTBkMTRhNDlkNWUu
LjYyOWY4M2MzN2Q1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTMyNC5j
CisrKyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzMjQuYwpAQCAtODM1LDkgKzgzNSw4IEBA
IHN0YXRpYyBpbnQgc3g5MzI0X2luaXRfY29tcGVuc2F0aW9uKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYpCiAJaW50IHJldDsKIAogCS8qIHJ1biB0aGUgY29tcGVuc2F0aW9uIHBoYXNlIG9uIGFs
bCBjaGFubmVscyAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNY
OTMyNF9SRUdfU1RBVDIsCi0JCQkJIFNYOTMyNF9SRUdfU1RBVDJfQ09NUFNUQVRfTUFTSywKLQkJ
CQkgU1g5MzI0X1JFR19TVEFUMl9DT01QU1RBVF9NQVNLKTsKKwlyZXQgPSByZWdtYXBfc2V0X2Jp
dHMoZGF0YS0+cmVnbWFwLCBTWDkzMjRfUkVHX1NUQVQyLAorCQkJICAgICAgU1g5MzI0X1JFR19T
VEFUMl9DT01QU1RBVF9NQVNLKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40
NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
