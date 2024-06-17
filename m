Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7833F90B02C
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A89EC78002;
	Mon, 17 Jun 2024 13:50:51 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C186C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:50 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79776e3e351so312739185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632249; x=1719237049;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qNtak+2SP0bqKcAwBmLBKZAak83BgIl2xc15imfy8nI=;
 b=oU4XxZgGNwAnKMmOfORIVL20yHKBb6jqNZFWeUHzz8sgWrxRauEP/4aJX+Dy+ZTbPT
 XYVX1bTLEFk+J+0Yod/XYD2FHOh3NxoBw+h4YceQ7pU6m1BGhFRaFyBlzreV9L2usGad
 ib7nCfofBMD6gWCaZNK4AtFlagUatOgE9Bcx1PB7uLCrH722KRP4FBauHF/v63JKJ26Y
 Vuynz+H2vv1pXCgMJMgh2jCaCL/PldGdayn3RrwcOThzsKkbmd5yhSfh4X71J/Ep3Zxw
 0O4rtRfDVOz4YhmXnGhPFW7VQccu54o2xm/hZeV3N9sESMlQOtO9YKsImviVRDwhcfan
 OIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632249; x=1719237049;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNtak+2SP0bqKcAwBmLBKZAak83BgIl2xc15imfy8nI=;
 b=TkexmFQDyXYQi8AfEa+ajuCxtM2bk44TD4HP5agbgPHVyt5T27+PHFdHfFFYdIjVYU
 Exf+lDpynzTR/5lPitI0aexjVlq2mGT6RNqxa6q3moY52EhCX1ckEDQXJcOq3rhD4KAJ
 PUYGkJo9BHtVw8vTuA6t+rB8PDIYEwF+RmB8K9fMK/Z6hlK+a1kI+x++GPtvUPrMcG7+
 lm4++GRJsOy/02xRA/WByzI5V2Ktf4B/HyVqxDK3Mlyx7Pt2vOQHbdyNZ/L1OC3j2iIN
 8mJT0jFAgIbwgMI0OVOZcIdEf8JsPWtmFj8gCwaVBH/+f+YsZprF8ju4vLdkNgB7E8Cp
 5lmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV57iRRxiquDFuCHj9QN+JX83jxA+BuwlKFWad05z/ClbXZEQnWK8jsHMrSWubQZY8gluriAhqAB8RTdhfLJaZ10/oenXWAavWzGUrzlJ/hNQ1iDchWtkyK
X-Gm-Message-State: AOJu0YwgBoFhzPxV+l14g+zke1nM6LEAMdLcxwnh8y5NrpZzeoSjNGf5
 cIP09MCAPE4UsdxZTiYdnS4dbDwWgoN2ogWYjEts+CTGJlj4FUb18gqt9YHr9uQ=
X-Google-Smtp-Source: AGHT+IEff9Dln+tnuVCEmbJAGpzplXAkkgqJD6yK1MHCx8a+d/cYhrzz8V7ALZ8zTjCZj6a+ffKadQ==
X-Received: by 2002:a05:620a:4088:b0:797:d55a:5166 with SMTP id
 af79cd13be357-798d258dd41mr1141019385a.58.1718632249174; 
 Mon, 17 Jun 2024 06:50:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:10 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-30-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 30/41] iio: light: isl29018: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvaXNs
MjkwMTguYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2xpZ2h0L2lzbDI5MDE4LmMgYi9k
cml2ZXJzL2lpby9saWdodC9pc2wyOTAxOC5jCmluZGV4IDQzNDg0YzE4YjEwMS4uOGRmYzc1MGU2
OGMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9saWdodC9pc2wyOTAxOC5jCisrKyBiL2RyaXZl
cnMvaWlvL2xpZ2h0L2lzbDI5MDE4LmMKQEAgLTU1MCw5ICs1NTAsOSBAQCBzdGF0aWMgaW50IGlz
bDI5MDE4X2NoaXBfaW5pdChzdHJ1Y3QgaXNsMjkwMThfY2hpcCAqY2hpcCkKIAkJCXJldHVybiAt
RU5PREVWOwogCiAJCS8qIENsZWFyIGJyb3dub3V0IGJpdCAqLwotCQlzdGF0dXMgPSByZWdtYXBf
dXBkYXRlX2JpdHMoY2hpcC0+cmVnbWFwLAotCQkJCQkgICAgSVNMMjkwMzVfUkVHX0RFVklDRV9J
RCwKLQkJCQkJICAgIElTTDI5MDM1X0JPVVRfTUFTSywgMCk7CisJCXN0YXR1cyA9IHJlZ21hcF9j
bGVhcl9iaXRzKGNoaXAtPnJlZ21hcCwKKwkJCQkJICAgSVNMMjkwMzVfUkVHX0RFVklDRV9JRCwK
KwkJCQkJICAgSVNMMjkwMzVfQk9VVF9NQVNLKTsKIAkJaWYgKHN0YXR1cyA8IDApCiAJCQlyZXR1
cm4gc3RhdHVzOwogCX0KCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
