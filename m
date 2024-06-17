Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CC90B003
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:49:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1D3BC69067;
	Mon, 17 Jun 2024 13:49:53 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C71D1C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:49:50 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-48ed52b59acso531261137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632189; x=1719236989;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8Zs4CGtswXRcL4r5zLR2D5+LAoG+l8N82wbiM+7ownU=;
 b=B7HOJSTRxtdnffEjtSRh9zHt3yrI86NqDV2tv0s6o5Yl0vBGYbwBea0C18QRYmMJZ7
 4m8LG2cDVNlwS4drglXawEouZEm6zTAdCqqHhV3WmIswog6BbXsE9KQX2N0GFP+PTym6
 K9ZQxNxIfkMkCunCPK8zTHe4p2v9Q6dGHkinQe4zPUrGFx15+0hl9IW4SELheton62Cz
 fSPbqgNGRabm/MJYYVgxdyMf/97lxGUSVrwELNSxpTCq/e6+hLjNt+B3cR7neZy9omUD
 CxUM9StqmmGQuWU5hCKbA1ezXDeThL3uOtNz3r71B3ipn5SwYFEuKYtWY4mosucROJsu
 OqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632189; x=1719236989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Zs4CGtswXRcL4r5zLR2D5+LAoG+l8N82wbiM+7ownU=;
 b=O68NRfB3schj+TtJqkzw1w9Gr8h0mGZk3RfyiECi/HrRnhb2I83XA0oTenejyj3Zwp
 g7ONcAzARMsgR81Ye1xRc5Z1W28IKqDb68WmU9PshObWYuPChJLsz56txZkhgLtD6Acw
 qfmGr6G27SejhuvAkSiP0CNALVcsGur5uRdMztyNb6xqDl8rzLkNbwv1Zk4bJAqOYR/y
 /XYJsUxYhBAUWv6tjEmIdPXqtIXD//yyNBUsGd3JwXF8NUOE2H7sc0T9QvO9UI2N06EP
 4vp3eAjiU4u7+iipyv+S1lR+oo/rg6Hkw/0/Nk/hXPnIz0nw2wGo5YlcBt9YlIfPAjE3
 tbRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvpDS9X0CC6/miO3VmEm31YLDOisyrot/l0kLhfkSblCnzF8G1qQjkkWG1AEJoCztC+zMjYXCj1yqgTTdPXwJ0DToP3CwG0F0Te/GoG1rSzLN9o7HjqK3Z
X-Gm-Message-State: AOJu0YyuswOU5k5UMLgV2xifxsgkjzIsJjHjvj3NM6bSZ9TOBWPeVqby
 rF6taJuvbcsew0dnuIu3kHS8NbySYpGgRYdXSJ4EAB4SQDH6f5m8Wc75PfMv1O8=
X-Google-Smtp-Source: AGHT+IEFmgHtaGyOVxmPD/zpG+S8mAUnggR0FqGzztaCLAyq4bVNR5GtCNAnJm1CQv7c1xou1ffjIg==
X-Received: by 2002:a67:b902:0:b0:48d:7702:99e2 with SMTP id
 ada2fe7eead31-48dae3e00c7mr8793212137.31.1718632188950; 
 Mon, 17 Jun 2024 06:49:48 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:49:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:42 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 02/41] iio: accel: kxsd9: Make use of
 regmap_clear_bits()
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwva3hz
ZDkuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2t4c2Q5LmMgYi9kcml2ZXJz
L2lpby9hY2NlbC9reHNkOS5jCmluZGV4IGJhOTk2NDlmZTE5NS4uMDNjZTAzMmUwNmZmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lpby9hY2NlbC9reHNkOS5jCisrKyBiL2RyaXZlcnMvaWlvL2FjY2Vs
L2t4c2Q5LmMKQEAgLTM3MCwxMCArMzcwLDggQEAgc3RhdGljIGludCBreHNkOV9wb3dlcl9kb3du
KHN0cnVjdCBreHNkOV9zdGF0ZSAqc3QpCiAJICogbWFrZSBzdXJlIHdlIGNvbnNlcnZlIHBvd2Vy
IGV2ZW4gaWYgdGhlcmUgYXJlIG90aGVycyB1c2VycyBvbiB0aGUKIAkgKiByZWd1bGF0b3JzLgog
CSAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLAotCQkJCSBLWFNEOV9SRUdf
Q1RSTF9CLAotCQkJCSBLWFNEOV9DVFJMX0JfRU5BQkxFLAotCQkJCSAwKTsKKwlyZXQgPSByZWdt
YXBfY2xlYXJfYml0cyhzdC0+bWFwLCBLWFNEOV9SRUdfQ1RSTF9CLAorCQkJCUtYU0Q5X0NUUkxf
Ql9FTkFCTEUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
