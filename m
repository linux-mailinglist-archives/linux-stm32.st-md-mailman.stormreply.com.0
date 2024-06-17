Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56A90B030
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D82EC78014;
	Mon, 17 Jun 2024 13:50:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60204C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:52 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7955841fddaso361935085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632251; x=1719237051;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
 b=tCjTEsgoKqN6kIEomWjXye+cfG3q3IUXKJdSWECntvLdNR80EeRaU/qPjUZNZCIjaV
 RQ0gO8sd0m0tID1aS5mrpuDBkNwIXkr6xvoIcBmEZzeC4+SlSH0UapVWvLXapy4Abxna
 uFrNzgQdy9YEog2/YFoiUkrJvwkVRjn7VN+0eZSG75Gh+0vCBPd0NTqoe/ZSkUhhAgXJ
 vhP77Jx3aQDdi7Apbz2YQtkTkW1wPd84nLqGiJEMnIZeHe5/LbkgUnlhHUZs/t80O2jW
 5lAP7tI4Ko/axNOgV0Ky7Y4yoQj54KpYGMbnISXZZ28NCR+fEN9tmxHmRZy+nYbkcvGr
 K5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632251; x=1719237051;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+ymucZ3m6lrJGr3WTAeCvzidHKg4xOe2grvPyQxJhA=;
 b=Cs3M02/paDRQ6eVU94xFzmtLUT2sat3wIquo6zjw9nC0+foffudw1Oy7AvEt+ivxHw
 mV1+fKAxY12FnT7xXJJI4P6rsId+z/veI4TQpLe/KmiFW0B+3Y5yVmBgdfpsGMlsd/bR
 IJdEeBTz0caiiwSjruteQjvb7jurMjNJt0IAKSHHEtS8Nfv4ohUAIn2EMQRKLoV1sgGD
 Xm6uVBJPL9SFCtO8W0ZX/l52cIztf5rrRKUyBKjWcp9ItfgeDxeyKpAR6vRmQuypAcNh
 soCUjJ0DVio0eqyIkjY9/PDJJMu/KcKZ9hzbqzlYQPnBi41cBOUaMfBL00jMBXmCYaYI
 KsDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU11BP/VTRzMTHa30gmPAspKD3JA6lcdt6XGPBSvPON8eNlfKBPBEAK1CTuEz0DlJMocouv16rhXRNCRx3KNbbJmvyE61GDDmvtXoLRLTsyN752kWsM7uFx
X-Gm-Message-State: AOJu0YxDjoCJNIwz3KXYlBnSGFOeEmeY4IqkC/MqOImIC3YhADR+n0uU
 pPFjAQ3C0+vX5Ato6vlkdAIgfbGySW3Kk+qikQm+Dil5vk2DLVXrC9MyrKTyZe0=
X-Google-Smtp-Source: AGHT+IFhD2JefGeiJgsg6Ae7QRIe/BDndSP0Z/WiCRPC91zIn6+wpqBzLsiQzn3/JIP4kN+hagVe4g==
X-Received: by 2002:a05:620a:4056:b0:795:56a1:6c0a with SMTP id
 af79cd13be357-798d03b78c4mr1852443685a.30.1718632251285; 
 Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:11 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-31-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 31/41] iio: light: st_uvis25_core: make use
 of regmap_clear_bits()
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvc3Rf
dXZpczI1X2NvcmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9saWdodC9zdF91dmlzMjVf
Y29yZS5jIGIvZHJpdmVycy9paW8vbGlnaHQvc3RfdXZpczI1X2NvcmUuYwppbmRleCBkNGUxNzA3
OWIyZjQuLmZiYTM5OTc1NzRiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvc3RfdXZp
czI1X2NvcmUuYworKysgYi9kcml2ZXJzL2lpby9saWdodC9zdF91dmlzMjVfY29yZS5jCkBAIC0z
MzAsOCArMzMwLDggQEAgc3RhdGljIGludCBzdF91dmlzMjVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAJc3RydWN0IGlpb19kZXYgKmlpb19kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
IAlzdHJ1Y3Qgc3RfdXZpczI1X2h3ICpodyA9IGlpb19wcml2KGlpb19kZXYpOwogCi0JcmV0dXJu
IHJlZ21hcF91cGRhdGVfYml0cyhody0+cmVnbWFwLCBTVF9VVklTMjVfUkVHX0NUUkwxX0FERFIs
Ci0JCQkJICBTVF9VVklTMjVfUkVHX09EUl9NQVNLLCAwKTsKKwlyZXR1cm4gcmVnbWFwX2NsZWFy
X2JpdHMoaHctPnJlZ21hcCwgU1RfVVZJUzI1X1JFR19DVFJMMV9BRERSLAorCQkJCSBTVF9VVklT
MjVfUkVHX09EUl9NQVNLKTsKIH0KIAogc3RhdGljIGludCBzdF91dmlzMjVfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
