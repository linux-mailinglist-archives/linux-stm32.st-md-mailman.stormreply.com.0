Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69A90C8A5
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 13:12:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E35C78001;
	Tue, 18 Jun 2024 11:12:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7829CC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 11:12:04 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ead2c6b50bso58442381fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709124; x=1719313924;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
 b=BoEo98RwJb/R+EL+J3AJeX0rBU20b7U+Nlez2Hp1wmmzfa8SRTRMF9rOJgrSPJJqoW
 hhfrteAV+WanhvjmOQSc1tzbe0pQVsRxt1vHJdVtfgSRpXqGTM3AGshaEF/SwxeGAEzg
 u85b3FlSrj60rkdIvhTdgXXB53vFv7K0csmPS9dgoHYYEWKpkYbKx+D3/BrgzoUHiBfn
 E+0rWNukJUlaDXDRGMbO+Q1WyDd0wx4MeumWqi0ICBdFUO6fP/HoIBs6xufBFqkEfQkv
 8hK/RWRb+y2FoFr3YUru9oOrR0vIc1D7tYZFWtEOVG39iN2qV+lXpRCMSsquC24S+hW4
 C8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709124; x=1719313924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
 b=bap/sDqvdP9uVEnOrVRf6BMov1+BeJzvR7HrijplByrny6oNpqmPTgWjPqfy6x83yk
 AWFMBZ0RxUpeACXF8t/f5iScb+wqhdoC7aj3xJ0tokxyMR2TxULt/S6TKgxPfYs4nx7v
 ZSaCH3uW7U1Sgi2u2Cp3tP+nvBBcsiVW0ITCmLHYMgWc/5jhN35TrxyJYZm9bKHUblx7
 3lxVpCdhylWPGFApZkH9QgOSh+rRSnwJgyhD3njpXjCfgg16W7AxFmIrL4ouB9ZcUQ1V
 fBVZB6A96AWZnZSlN1Iyx5Q2Y+Fy6vffzd4whhPRQ0a6T6bydmQfPvxUxyhCqcVG8/nu
 IlwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7e3scwAtNTcMV7NlUImwm5Kn0hzJIUCEw/rMBIX6fvoxqPztuiSvctSarhkqBzYWf88arZ1QZtToCabZx8LHQSoBSg2povDco2cqvaeBPzu4pcKlJ4O4
X-Gm-Message-State: AOJu0Yy7vTVZm9W32D0JWrD+W99waTPybRYzTXA12K4lYHPQql3ukMoZ
 J4KxVFqJYXFZLmPt/GukuMS9QCurcH+WyK/EyPv6jLQeCcipmjn6Rw/HZbOBe+O/uHJE048PbKS
 gMa9/Y++qQFtrNkZhbzfOgEXfM4O+QyTlO6QiyA==
X-Google-Smtp-Source: AGHT+IHXkf3ljqAhrm9EuvRTPL71FiQZJIgLs0Bh9F/FREvRGl6HEr1C7BhvQe/yk1MwI0e0CuEwwH242Rm+FHCeyyY=
X-Received: by 2002:a05:6512:45c:b0:52c:8289:e890 with SMTP id
 2adb3069b0e04-52ca6e55c92mr8109856e87.4.1718709123676; Tue, 18 Jun 2024
 04:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
 <20240617-review-v3-33-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:11:52 +0200
Message-ID: <CACRpkdZjPrG4kUBxc+r7NzUt9UZSdiF7KWT6AWAd+vpuLSWk1w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 33/41] iio: magnetometer: ak8974: make
	use of regmap_set_bits()
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzo1MOKAr1BNIFRyZXZvciBHYW1ibGluIDx0Z2FtYmxp
bkBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVf
Yml0cygpIGFuZCBwYXNzaW5nIHRoZSBtYXNrIHR3aWNlLCB1c2UKPiByZWdtYXBfc2V0X2JpdHMo
KS4KPgo+IFN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJh
eWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
