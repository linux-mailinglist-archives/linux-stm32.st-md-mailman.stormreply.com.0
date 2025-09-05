Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB60B45331
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 11:34:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A38C35E2E;
	Fri,  5 Sep 2025 09:34:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1551C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 09:34:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b0472bd218bso341401266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757064870; x=1757669670;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZXKC69S7By8Ya1ZMREMZuen7JwS2/FHlmhonyDWpnQ=;
 b=KeQd/5UGLVjSWcZlvCDWfq72kVeodzsgJfxMFJurIWmSv2/8+E76wgHEa+WZcU3mWs
 iv///bt3NspudfMu4ihA+5VsD8/rVaYg1m37CrxfkIYMqjMzZMQ6XdqDpPVNZwxeUU7K
 i20w+FevoeVlnzxMtkmajylGwXU4LjZvrnjL45drr3pchL8I4nlt8+2YisvoGczGLNBY
 PCXNqvqmvmtbddMawhnB486nwWNi8VXtINEWD3Ow0GUVaZiElEDlo0u8eqVl9iICf59n
 2JE/2VhOOCj+pHrYPfy0sOqKSr+Ovd5xLGIc2oX2Y5ZFzHTOyREt4T43OFaeY47QU6Ob
 9sDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757064870; x=1757669670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZXKC69S7By8Ya1ZMREMZuen7JwS2/FHlmhonyDWpnQ=;
 b=Wti0IVXncMdYTMISpcYe9jB192iiLFjS5ai5N3/FnKHQ7VlHz0Pr5hscZZqkYSVWOR
 lO300fap5ltzOF+AOCPKv0I62bsvK70IVBswKOFVgxlOUZ88p/t2HZwF5HaPEGidpblK
 ig1GTUqzhFoG4RxJo6EAwtDz3niEQd69r92SPBXIgO3ruwbKSAsuKvbhs5sOjLwATO7s
 vW+AAmJqeP7mg6uD0Xb20/Z9DbeyUvgHhuyRHvFmxuhVKA40JRWb3HhDaPQQOs0sBLlz
 KyYzSUUJFML/hBN9Eud8g51ZLphaDH7UPsQ+EsGpRzzCVdy4SAotax9+kBgQOtQJpfev
 DxmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3hEJXaprUxg9f6TETWYhhs4jM8qoKJ6lSuJno0cPG/LZZ8s95KoPz8F1F53SkdhFJ5tIT9hAcuHvY0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxgv3Ew0zwUlCKLOAzBos5BtfX+B7mk/nseuJYiOuU3sA96w4fO
 jBBf9r2TfTtvb7TEZm8nGIeircG76UT01/i90KfNXEbq2Es59wBDpuDBa71BBXELRl1cqbkeYSX
 A9IynlGSDkP5LXWO+klBAY7RBPOuqGH4=
X-Gm-Gg: ASbGncvbZ1uZ8Pz+A6GW40dl2gX0pq2O93TFOYX+xrBbZGO6ErvRfsXAYbDaN95CbEU
 dWOI/0fdP4VDjNv0H8tjymzWfHrXMpEwRcXGFfrgkT08kxrDK2Vek0VAzi9Oolnrlulv1pD9Ru+
 OVpMUqaTIO3v36EtpM8xcFimbZTRgUcMLgkdz1BtjO5dIwgpph7yxXq8MkfJCwVK/Cxc9K8kh4x
 qFnNT21FHxtO6mmeIne
X-Google-Smtp-Source: AGHT+IFNrkynh+/Ymp/HCHyA5XGYRylr5jF6GjIL2qDKGYyZpbM+uW2yDfuf4gc8lpHjzkwCg5YwNrLoynQjYkyhMFI=
X-Received: by 2002:a17:907:928a:b0:b04:5b3d:c31f with SMTP id
 a640c23a62f3a-b045b3dc692mr1195506366b.49.1757064869658; Fri, 05 Sep 2025
 02:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-2-zhao.xichao@vivo.com>
In-Reply-To: <20250905072423.368123-2-zhao.xichao@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:33:53 +0300
X-Gm-Features: Ac12FXxbms9z4N7jI4jHPwNjVwlV8d4OiE5hmfmL25yynmREhxdRP_mz9jzg-_c
Message-ID: <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
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

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCAxMDoyNeKAr0FNIFhpY2hhbyBaaGFvIDx6aGFvLnhpY2hh
b0B2aXZvLmNvbT4gd3JvdGU6Cj4KPiBkZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWdpc3RlcigpIGRv
ZXMgbm90IHByaW50IGFueSBlcnJvciBtZXNzYWdlCj4gd2hlbiByZWdpc3RlcmluZyBhIHRoZXJt
YWwgem9uZSB3aXRoIGEgZGV2aWNlIG5vZGUgc2Vuc29yIGZhaWxzCj4gYW5kIGFsbG9jYXRpbmcg
ZGV2aWNlIHJlc291cmNlIGRhdGEgZmFpbHMuCj4KPiBUaGlzIGZvcmNlcyBlYWNoIGRyaXZlciB0
byBpbXBsZW1lbnQgcmVkdW5kYW50IGVycm9yIGxvZ2dpbmcuCj4gQWRkaXRpb25hbGx5LCB3aGVu
IHVwcGVyLWxheWVyIGZ1bmN0aW9ucyBwcm9wYWdhdGUgdGhlc2UgZXJyb3JzCj4gd2l0aG91dCBs
b2dnaW5nLCBjcml0aWNhbCBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gaXMgbG9zdC4KPgo+IEFkZCBk
ZXZfZXJyX3Byb2JlKCkgaW4gZGV2bV90aGVybWFsX29mX3pvbmVfcmVnaXN0ZXIoKSB0byB1bmlm
eQo+IGVycm9yIHJlcG9ydGluZy4KCi4uLgoKPiAgICAgICAgIHB0ciA9IGRldnJlc19hbGxvYyhk
ZXZtX3RoZXJtYWxfb2Zfem9uZV9yZWxlYXNlLCBzaXplb2YoKnB0ciksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIXB0cikKPiArICAgICAg
IGlmICghcHRyKSB7Cgo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBh
bGxvY2F0ZSBkZXZpY2UgcmVzb3VyY2UgZGF0YVxuIik7CgpXZSBkbyBub3QgYWRkIGVycm9yIG1l
c3NhZ2VzIGZvciBFTk9NRU0uCgo+ICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5P
TUVNKTsKCkV2ZW4gaWYgeW91IHdhbnQgc28gZWFnZXJseSB0byBkbyB0aGF0LCBpdCBzaG91bGQg
YmUKCiAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCk7CgpCdXQsIGl0IHdpbGwgaWdub3JlIHRoZSBF
Tk9NRU0gZXJyb3IgY29kZSBmb3IgcHJpbnRpbmcuCgo+ICsgICAgICAgfQoKU28sIHRoZSBib3R0
b20gbGluZSwgbm8gbmVlZCB0byBhZGQgdGhpcyBtZXNzYWdlIGhlcmUuCgouLi4KCj4gICAgICAg
ICB0emQgPSB0aGVybWFsX29mX3pvbmVfcmVnaXN0ZXIoZGV2LT5vZl9ub2RlLCBzZW5zb3JfaWQs
IGRhdGEsIG9wcyk7Cj4gICAgICAgICBpZiAoSVNfRVJSKHR6ZCkpIHsKPiArICAgICAgICAgICAg
ICAgZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIodHpkKSwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiRmFpbGVkIHRvIHJlZ2lzdGVyIHRoZXJtYWwgem9uZSBzZW5zb3JbJWRdXG4i
LCBzZW5zb3JfaWQpOwo+ICAgICAgICAgICAgICAgICBkZXZyZXNfZnJlZShwdHIpOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gdHpkOwoKSSBkb24ndCBzZWUgaG93IHB0ciBpcyByZWxhdGVkIHRv
IHRoZSBtZXNhc2dlLiBDYW4ndCB3ZSB1c2UKCiAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQ
VFJfRVJSKC4uLiksIC4uLik7CgppbnN0ZWFkPwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5
IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
