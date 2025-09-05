Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0AEB45341
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 11:36:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B0E4C35E2E;
	Fri,  5 Sep 2025 09:36:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B2BC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 09:36:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso3260895a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757064970; x=1757669770;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqf6D6Y//+lOVA7z+yQJwo2jJaSIwyijSnsvcGjMTK4=;
 b=SMw8Zq76pV8Nda+0ykLpLRqfgX79GCtOGU7klA/dvzrCIrv730OQTBn6JJQEg2gKyf
 Rv2TKUCKLEkP5g6cQabkg8QSowxijmZggOJP2Hs9JXYGmRAWimnQ6vYnI5U3cLQm1ghe
 WMCtQJGO0GQuAyoD+QK63M4KAuTg23lVkHHPlLeOhm/6sFbtLp40dYEo5mAivWGybMRt
 W9BVGf666Je+g4NUh3CKCerhtJkmEsajgEZNoJWWGoaJ6FRAov2oZJSybHgVwKkIzrgC
 SDuS57IHs/xednjBKsqQ81jz/ujXWhFHG2U/6lM8QSUgBtLdAT2GWOdAqJtOyP5VsiW3
 RilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757064970; x=1757669770;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqf6D6Y//+lOVA7z+yQJwo2jJaSIwyijSnsvcGjMTK4=;
 b=aCSXv87D2X/bkEkCUpkfSjzmigaGHfp2xWhQ1dgRJ6Y9VgFrwHVduCduzWph4l35ux
 YovCE0oEGZfP/gCzst23TEBvq833BpO/q2IBYKf3cMb+J9RGSB0IzJqNT19Gk8WuoCCF
 DehcygkHQil5I11T/wHhL5Why4bNZaFStYCytLkt+4almt3OWXy45wH+4yL43dkGObRO
 wuKTLrNuUm6c3uwwemwzTLshOU3KX4RxYDrcZHxxxK+MivMRItOTIB580WdbG16N6wAd
 fxggtxYD4NRRcThhpHmeoacxSLTc0964BjoDx9eKkFJQNX1xQyKMLoUzFOgp8RrX6W4O
 lGAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl7f5IZwaCIvQ1hM3Mg5FByvkvBCMpS4y8aCMVJr95Pffxrkq6eG9cOU5K7G36SEm3mGsEV8WiMy5mLA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysQ5VtMFM4PRZjNfjQRmHXAs40Qb5Z0F0sqEkU4F290t9tmN+K
 puP6KWvlIFfnTa9zlZuWRMubRCJzwK+ZYTk+9/Wtp6r8vmUMtC7moJ86mKgNKzOTkqeNpqJ/zi2
 mnP+PsJ4INNJAaZ9H1tGqkHwwy3+P47s=
X-Gm-Gg: ASbGncuSjCXeauha6V9FvamTHvzWRLE8wradPVwBh2T0XiJrFtq/6p5r63oL8JXwIbV
 /cSR4vQyfW0iyh9xWwdu7t/gAOdPl4Qx+CisOujCcMYu68exyC3kxPljcCL4sSDRVQ8Z8R2oBCa
 Gef+19pnm+58NGSSgwddZ9LJPMxLBorRSj1jwostOyOSNf1vo0hzYJMGmjdJg5RYhBalMPJYeWX
 IML5S10VtKnkbTd1/V5
X-Google-Smtp-Source: AGHT+IH7OMu1dd1ZlYosPz3SPqptVrWuN6c3SeVJCBYbCfoyYDh6z1nFqhk/368zJOb4WYqLr166BLEihh9LvFYDNYs=
X-Received: by 2002:a17:906:48c9:b0:b04:10d9:48d4 with SMTP id
 a640c23a62f3a-b0410d9523dmr1630508566b.35.1757064970102; Fri, 05 Sep 2025
 02:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-2-zhao.xichao@vivo.com>
 <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
In-Reply-To: <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:35:33 +0300
X-Gm-Features: Ac12FXxkIEGZA5-qHqK-CmbOa_oJh7A8t90OuTImqynr4N5GOyYLVDsnRsxsyg0
Message-ID: <CAHp75VdRn1qnoiCr7aeZfHF9GEyQshOA5awTjiJ9oJiY6Q+Gsw@mail.gmail.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 David Lechner <dlechner@baylibre.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Talel Shenhar <talel@amazon.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko <andy@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Keerthy <j-keerthy@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 01/12] thermal: of: Add error handling in
	devm_thermal_*_register()
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

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCAxMjozM+KAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5z
aGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBTZXAgNSwgMjAyNSBhdCAxMDoy
NeKAr0FNIFhpY2hhbyBaaGFvIDx6aGFvLnhpY2hhb0B2aXZvLmNvbT4gd3JvdGU6CgouLi4KCj4g
PiAgICAgICAgIHB0ciA9IGRldnJlc19hbGxvYyhkZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWxlYXNl
LCBzaXplb2YoKnB0ciksCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVM
KTsKPiA+IC0gICAgICAgaWYgKCFwdHIpCj4gPiArICAgICAgIGlmICghcHRyKSB7Cj4KPiA+ICsg
ICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSBkZXZpY2UgcmVz
b3VyY2UgZGF0YVxuIik7Cj4KPiBXZSBkbyBub3QgYWRkIGVycm9yIG1lc3NhZ2VzIGZvciBFTk9N
RU0uCj4KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPgo+IEV2
ZW4gaWYgeW91IHdhbnQgc28gZWFnZXJseSB0byBkbyB0aGF0LCBpdCBzaG91bGQgYmUKPgo+ICAg
IHJldHVybiBkZXZfZXJyX3Byb2JlKCk7Cj4KPiBCdXQsIGl0IHdpbGwgaWdub3JlIHRoZSBFTk9N
RU0gZXJyb3IgY29kZSBmb3IgcHJpbnRpbmcuCj4KPiA+ICsgICAgICAgfQo+Cj4gU28sIHRoZSBi
b3R0b20gbGluZSwgbm8gbmVlZCB0byBhZGQgdGhpcyBtZXNzYWdlIGhlcmUuCgouLi4KCj4gPiAg
ICAgICAgIHR6ZCA9IHRoZXJtYWxfb2Zfem9uZV9yZWdpc3RlcihkZXYtPm9mX25vZGUsIHNlbnNv
cl9pZCwgZGF0YSwgb3BzKTsKPiA+ICAgICAgICAgaWYgKElTX0VSUih0emQpKSB7Cj4gPiArICAg
ICAgICAgICAgICAgZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIodHpkKSwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gcmVnaXN0ZXIgdGhlcm1hbCB6b25lIHNl
bnNvclslZF1cbiIsIHNlbnNvcl9pZCk7Cj4gPiAgICAgICAgICAgICAgICAgZGV2cmVzX2ZyZWUo
cHRyKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gdHpkOwo+Cj4gSSBkb24ndCBzZWUgaG93
IHB0ciBpcyByZWxhdGVkIHRvIHRoZSBtZXNzYWdlLiBDYW4ndCB3ZSB1c2UKPgo+ICAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKC4uLiksIC4uLik7Cj4KPiBpbnN0ZWFkPwoKT24g
dG9wIG9mIHRoYXQgY2FuIHdlIGFjdHVhbGx5IHVzZSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
KT8KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
