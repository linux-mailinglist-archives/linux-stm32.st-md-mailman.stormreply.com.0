Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB490B02A
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 15:50:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31392C78002;
	Mon, 17 Jun 2024 13:50:49 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31817C78001
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 13:50:48 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-48c38cc7810so1292395137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632247; x=1719237047;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DclUw90neJHmAEodckLVU1MrMAClwpCF1mlaeSjcN+U=;
 b=L15rlvIIOzifkKPdUgA9pFo0fmpIp9DAJRuEgugwvIUqzvDpAtKJEeVRRNb093OVzy
 dbcAtr3E+HFvWvx5jyg0AaflEK4hwhMcEDk4D/Ml4wTyYBdriIr3uTFqehw5+OLgB1gs
 xPO3gh9TagwTjfNf3dQX4i4Kv87d9y4eascLtcCkF98kou1xe/VHFX52IFr+U5hSkqic
 7OxG0lvv/4Xtl8pJxmd/73YYGwunf66tWF+xuu31w96f7WkQwIQnhRFJ+vhmfJtpbWF7
 Auj2ZLvNj9mJ0EbxWPyWcWR+YjZ0cwEFYvUhM/W6cdnFhVr+8GlheKVJ/kTt8x9PRv1Z
 hDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632247; x=1719237047;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DclUw90neJHmAEodckLVU1MrMAClwpCF1mlaeSjcN+U=;
 b=qmOtcnX4pn2t/BnFNMiG4eyca1bqH9FJaF8BIcGk3yKhs6T50CIbDgYlSGpP8kQIap
 B/Z9ILB6hTaybEELgFLOTq2tSnOa9fDZ6dvvlqZZHOY86Lggi3PSp/3HDpi9zwGuLRPa
 TlbON+Imnz/aolheHfxtRJ6oZsGYMECetC+mSI7q8qZDcovM2BYsuotBET+e04OACDhC
 eTrOw1b/l/xLiX1Hlbvu2f3YlEFdknkoB4K6tg2c32e4JIpGElhsGVbPrA0n+KzBDIUy
 M1C2wOttn5ET6dkORmZL9YBL9YxrB8Ps6xBM/AC164Epmq/okjsRlU1J1heLWYmJvzCV
 nyxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5mfK3X7YhLL2TNlWkWV7CdY5tDXOsWVZwC9DUuI2eeLH9PtbnNnQzd7MfOAmCg/WQ9iCQSG/Td1mtVcOXQ1YX0vNS6PL1tlIbvwBDfW4ki0Rsc/E4BSG+
X-Gm-Message-State: AOJu0YzotdaY1bjPArkAQ3mlDoz0UB3CAKr13PhNHkwQhygoGHsBJOFP
 mm66dSeSKuCjJmtRorAsA9t1auyzAFKZcZzICHn1zIZnePEOIUp01kqnucTT+j8dnI2I4jXmm/9
 ERq0=
X-Google-Smtp-Source: AGHT+IEubRIeXP7Kagp49NVByjjGeveFz51rlB4BKjhqfHfpKBEa7G7VixyRzOvMhLylvoLMhbPrtQ==
X-Received: by 2002:a67:ec98:0:b0:48d:c0ab:ac20 with SMTP id
 ada2fe7eead31-48dc0abad12mr7057846137.7.1718632247057; 
 Mon, 17 Jun 2024 06:50:47 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net.
 [24.150.219.207]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:50:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:09 -0400
MIME-Version: 1.0
Message-Id: <20240617-review-v3-29-88d1338c4cca@baylibre.com>
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
Subject: [Linux-stm32] [PATCH v3 29/41] iio: light: iqs621-als: make use of
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvaXFz
NjIxLWFscy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYyBi
L2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYwppbmRleCAwMDRlYTg5MGE0YjIuLjZkZTMz
ZmVhZGEzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvaXFzNjIxLWFscy5jCisrKyBi
L2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYwpAQCAtODYsOCArODYsOCBAQCBzdGF0aWMg
aW50IGlxczYyMV9hbHNfaW5pdChzdHJ1Y3QgaXFzNjIxX2Fsc19wcml2YXRlICppcXM2MjFfYWxz
KQogCWlmIChpcXM2MjFfYWxzLT5wcm94X2VuKQogCQlldmVudF9tYXNrIHw9IGlxczYyeC0+ZGV2
X2Rlc2MtPmlyX21hc2s7CiAKLQlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGlxczYyeC0+cmVn
bWFwLCBJUVM2MjBfR0xCTF9FVkVOVF9NQVNLLAotCQkJCSAgZXZlbnRfbWFzaywgMCk7CisJcmV0
dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGlxczYyeC0+cmVnbWFwLCBJUVM2MjBfR0xCTF9FVkVOVF9N
QVNLLAorCQkJCSBldmVudF9tYXNrKTsKIH0KIAogc3RhdGljIGludCBpcXM2MjFfYWxzX25vdGlm
aWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCgotLSAKMi40NS4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
