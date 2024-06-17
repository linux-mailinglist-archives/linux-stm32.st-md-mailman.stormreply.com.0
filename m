Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2990B034
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:51:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F48C78015;
	Mon, 17 Jun 2024 13:51:02 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6841C78017
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:51:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-795569eedcaso228741485a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632260; x=1719237060;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
 b=jFQ7KPxfssmS+gCW4LQpkVoWs6edqqUXJdOl35xC8iNpRp96JMIxa+tKuv9FQG2qr3
 zPJcUaLHczXuP2lkLzG+JZ9tLGv3GkxiRpQVBsUGILrX9KkhcMZ1GDDeCW+EOFUz+i9D
 91SbsOkG4TaOjFP8357C1EKRJhUKEcEF9qct3WuwXgfd0EBCzu92pEfMFfnyo71JiNKx
 8SBYj7q4+QIxnupQ0pOXTdcJO/oIHyLtX1/hwtH4yBZ2TF2SGESlXZqr7a3fdBdY7ua4
 CCIwwy40i4FFOMcDLhFeFZaizBLqAm/FN4z/TNH5z36F3qFcY+9r98enrLYEe3OVNt4z
 wGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632260; x=1719237060;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
 b=V096NydxLfsXzKvxeDYwsHsI10aIaK+EXjOUCOgEkq2GNyWt++wjkEXJSI7B76Kgbf
 LfMm7X+rBZL4tNa9EPtHWtt0A/YeyTLR1UcyDPKXQqBk0KJph87Op91KnXzR0WDQBoX4
 LEgBiSi/+g3/XMCDa+ijYGx8Apvhzw4YVY/Gwg9TAoXZ3FtS/LPdcdBSNln++lTPT2yK
 tYX7coupfOkKNg1qVP6IIyexFss41bTL/WbsnA1t+xFI5kjroIRt3H3dxEm9yhsDdvCL
 OgvfVm0wmv6aXOdzCvg+Hbhw+DPRlEDCFVNS3Y4meKubwG7t+z3FzV5bymWwZxHX39iq
 YzoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGn8DsSX2lA9O2Ibr1XXbU/dYGvour3LpJivjuYFPMoVKaANmq2LuLMVAr9d4WPqTwpuDJ6Er+Du6GdEPQFi7Hxs25oWmGzS6uN9MRMa6TJ/5oMFtoAsJ+
X-Gm-Message-State: AOJu0YxINb4gwjbt1wKLclS8w047qvnerQnKrnTnjzUtbP/ZfJ4N1R8N
 2t12z/WoRfsw8WWKR0OiuZ20zJBxNYrT5Ybkk1QgHb12GxrcOxwHgq3x22aa4ys=
X-Google-Smtp-Source: AGHT+IENId7QjpgihvaST50kcENjvnWyxdiSnte4lhDV+Skn20e41tG2cguOi5hNHA7+JrD8WB9kUA==
X-Received: by 2002:a05:620a:1a29:b0:795:50fa:c0be with SMTP id
 af79cd13be357-798d243ab42mr1258423585a.39.1718632259895; 
 Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:15 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 35/41] iio: pressure: bmp280-core: make use
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJlc3N1cmUv
Ym1wMjgwLWNvcmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAt
Y29yZS5jIGIvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNvcmUuYwppbmRleCAwOWY1M2Q5
ODdjN2QuLmVmN2Y1NDY4MzllNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1w
MjgwLWNvcmUuYworKysgYi9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAtY29yZS5jCkBAIC0x
NTY2LDggKzE1NjYsOCBAQCBzdGF0aWMgaW50IGJtcDU4MF9udm1lbV93cml0ZSh2b2lkICpwcml2
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCiAJCQlnb3RvIGV4aXQ7CiAKIAkJLyog
RGlzYWJsZSBwcm9ncmFtbWluZyBtb2RlIGJpdCAqLwotCQlyZXQgPSByZWdtYXBfdXBkYXRlX2Jp
dHMoZGF0YS0+cmVnbWFwLCBCTVA1ODBfUkVHX05WTV9BRERSLAotCQkJCQkgQk1QNTgwX05WTV9Q
Uk9HX0VOLCAwKTsKKwkJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBCTVA1
ODBfUkVHX05WTV9BRERSLAorCQkJCQlCTVA1ODBfTlZNX1BST0dfRU4pOwogCQlpZiAocmV0KSB7
CiAJCQlkZXZfZXJyKGRhdGEtPmRldiwgImVycm9yIHJlc2V0dGluZyBudm0gd3JpdGVcbiIpOwog
CQkJZ290byBleGl0OwoKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
