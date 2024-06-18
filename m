Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 990C390C8AB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 13:12:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F1D4C78001;
	Tue, 18 Jun 2024 11:12:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C15CAC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 11:12:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cc1528c83so1062400e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709157; x=1719313957;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
 b=jeDEWanZ2AwgocSvtsRDRvrCZs2WbTSZqoHXzyTfnP3CcWlA25t/Poy6UrupAVFMm2
 2ZADbWUyTbR8sXY7HiVg99w1aR3uv7ZI6cK4PurwkGefvqPWUOM3V2jiGClTyxhbH2gS
 +A+JciSPYMR3gDG4MIyrrhPRxgdy54iZMbW+5XlDhnd2j3hJU6gtWwJQOfjAABPT3+X3
 7SHtIGhne4fTR+gW0iWN5VDvfc6dA+kEE07xOYixokdVbaNaGGv2TdwVjDL1ZwV8s27z
 odjnraVu4lqOMuSTnEESp8P8yyA6wGJIOzsUH6mOxZaGU4dzMq7fNYBfC+2rh10urNHc
 cIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709157; x=1719313957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
 b=d9rRknse6/ZW/BnK3oL/yOSs9hCqP509fttpD3EZGDLMREObB3oEGQFxLnWfWlaiPM
 QMkcex3B5jC0mKpnIvBIgO8V7suoH04v4G9HBocC1EYiu/lABhtfEXxaA0kEsn/YDLAN
 bELOdhU8rf6wEgCC3kQXNtehQ6sosgPAxm3PjD82ZckuvXhs1ybRXB8xgdDoStQaxwla
 7R0gZt01po2b6ejf+jcqoUYxBZ4r0VOFUKcRatnvDXuMpZ6yi1ZTcGC6kTlzdOyJHGAt
 rB9RPHRUriCbgprsn3/uW9Bw+kfnTKQel7dm5ItByDaY8SiRFpnvtZi2dNALpV9gClBI
 iwXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG00lENN1wvfKHtnVkOYagPMPCv+fcRl3yumcfGwfufFyZYEHGBT5H9fTChRfaExh7QxmbQ/L0w9eeo7luumurcQu9+XQiXPZLIpM4rzwS0vrKfp/ZkFZV
X-Gm-Message-State: AOJu0YxtZrOYGKWsEoDYnn6zQxhjWqvacQSvWV5flJJGhXjYQhBtTSiQ
 Dq2l1jrTcGxzvDd9L+qPyvqDqfqW1I1kQ0ZZw2a2p5ckIMeRUHEpun6paunyroIUehrgi9bqDFB
 hfVsFj64dm/Qz0WDk4EYyVgagT7xqXlJHI4eazg==
X-Google-Smtp-Source: AGHT+IFCeIOoRy25rTwUHZ/n6vBdkCPzCkJ8a//pB4Qa6c+3jDe2XeC/62v2ldwWc8Yh5JI+ho23V5WmsKqsRfZrbxc=
X-Received: by 2002:ac2:5307:0:b0:52c:998a:77ba with SMTP id
 2adb3069b0e04-52ca6e6e5f2mr6662065e87.36.1718709157060; Tue, 18 Jun 2024
 04:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-35-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:12:26 +0200
Message-ID: <CACRpkdYchu+muvbinPpUFvppMMQCFe9zTcApj46ip4PYUGUhVg@mail.gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 35/41] iio: pressure: bmp280-core: make
	use of regmap_clear_bits()
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzo1MeKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHZhbCA9IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4K
PiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
