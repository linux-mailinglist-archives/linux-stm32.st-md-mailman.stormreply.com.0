Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2FBB45002
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 09:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C825C36B3C;
	Fri,  5 Sep 2025 07:37:44 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0898EC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 07:37:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-55f68d7a98aso1947176e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 00:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757057860; x=1757662660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HUDpg8P80ENhLzXkkjoWR5Wm8BjOXjAXH7uDrrOc9Oo=;
 b=Ipn8HEDStc5Vv8iB39kjT9Dh2PmWYUlrJPent2tBGn7ZuljyNRjyXnLI6ejeNbeYXj
 fB+jkOzttapBKkBu0yZmW0ejQ/tLgt2bTeJ+3NZ1ng6QqsptwhI7M8c1dMRv82Vw/cFW
 e67tTJWv5R9MGeZ2plii4H/cW2ct/+R2TlWfF7cZGw0UylbWwkO3P4B2ZlYac1rxOBM1
 hK+S9E/gBW7qNC7VEdIDMnCLAIk1TcKadx+UwzF7768JBFsqdzNdqltDG6D9stHftEEJ
 iY0N48vPAhwitn2griP53jpi7M+YfFST/cz2W1L8pOIiudD7FwHvjkPYcUBAcawEwCMr
 Hfww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYT93n6YH9+C3lKhyf/+uGhGfUi3ePuMVFjR0LbOmkCyNhcRSayhFueqSziVAGhhy3PdtFeysi5A5z1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxZqousXxG0Iaem++pygS4WOecHjIc+JRpOsHG5Kt8uDUEsN27
 We1mmu/zF7SLrVD3B6o0yR3OTvcXxD4LRSceai7m3gRQOi2zxBSWRq2O/BjqCvWxmKM=
X-Gm-Gg: ASbGnctKVH0KUoT2qhNwnds4NNC7IWmdyRePwFOCYc1i93vTgFOGnWPoRpZWK7LGM0z
 yPxiqk/pg7TEmBL62QAPH35c6PRHHbSdbHkCgGuSofUB5yzKb48RkQLHUIqtdIOfWbC/1DvDdb9
 emg1BnUC6ltcypLrdD65WqCPdaCNrSti4wmmInxH0E9Dx1kD4hqDfA5/Tn1YeKgkRr/YaoOjN4y
 iXg9mmsIz3nseH0wc7IBvr0PLoDJsMJePgNRpXvpu2RBr/HwMSWP5iM9rmR50Eu64ER8FjnkQ06
 tzKE6EassBfvKadj9xgwPOCcP5wN6zUhhTStYPWWVBqhBO66Q6Sss9+nYYzUErDfjrxOKJfxJcR
 DDOz5bPZ8G+O29kYju/GqAY3IBtoNawe4GUYGYRkfTRvuZkegXWEE40o=
X-Google-Smtp-Source: AGHT+IG7VqjQJEh09/FBuVXPLdzk+qNgxWgVWXle1wK3lD7YunA4SKRbAkBcjPWzW5A7mCJqIjn9zg==
X-Received: by 2002:a05:6512:4409:b0:55f:4746:61d6 with SMTP id
 2adb3069b0e04-55f708b6c18mr7311466e87.16.1757057860180; 
 Fri, 05 Sep 2025 00:37:40 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad25e15sm1656109e87.126.2025.09.05.00.37.37
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:37:39 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-336af63565dso15849191fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 00:37:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXTcrb+mjc1gWolBkzjM4L9fMi9EkKdSkHbgM0DNsujMryzmM7r8ASh8P0BRKzZaCTfYbLIMPKfCkTBhg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:1545:b0:337:ed76:7212 with SMTP id
 38308e7fff4ca-337ed767a08mr38641871fa.40.1757057857304; Fri, 05 Sep 2025
 00:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-4-zhao.xichao@vivo.com>
In-Reply-To: <20250905072423.368123-4-zhao.xichao@vivo.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Sep 2025 15:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v665Ukqdy2dxH7d=WKuLnWNz=Qwp3U+QxnrdfEPpwVL5mg@mail.gmail.com>
X-Gm-Features: Ac12FXwDAvrTIRtRT03_-9LcU10SU7B9zXfyLBZJD9DODV-PWNu2aOFrKkfI70k
Message-ID: <CAGb2v665Ukqdy2dxH7d=WKuLnWNz=Qwp3U+QxnrdfEPpwVL5mg@mail.gmail.com>
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
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 David Lechner <dlechner@baylibre.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH 03/12] iio: adc: Remove redundant error
	log prints
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCAzOjI24oCvUE0gWGljaGFvIFpoYW8gPHpoYW8ueGljaGFv
QHZpdm8uY29tPiB3cm90ZToKPgo+IGRldm1fdGhlcm1hbF9vZl96b25lX3JlZ2lzdGVyKCkgcHJp
bnRzIGVycm9yIGxvZyBtZXNzYWdlcyB3aGVuCj4gaXQgZmFpbHMsIHNvIHRoZXJlIGlzIG5vIG5l
ZWQgdG8gcHJpbnQgZXJyb3IgbG9nIG1lc3NhZ2VzIGFnYWluLgo+Cj4gU2lnbmVkLW9mZi1ieTog
WGljaGFvIFpoYW8gPHpoYW8ueGljaGFvQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lpby9h
ZGMvc3VuNGktZ3BhZGMtaWlvLmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L3N1bjRpLWdwYWRjLWlpby5jIGIvZHJpdmVycy9paW8vYWRjL3N1bjRpLWdwYWRjLWlpby5jCj4g
aW5kZXggNmI4ZDZiZWUxODczLi4zYjMzNDgwODEzZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
aW8vYWRjL3N1bjRpLWdwYWRjLWlpby5jCj4gKysrIGIvZHJpdmVycy9paW8vYWRjL3N1bjRpLWdw
YWRjLWlpby5jCj4gQEAgLTY0MCwxMiArNjQwLDggQEAgc3RhdGljIGludCBzdW40aV9ncGFkY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICAgKiBE
byBub3QgZmFpbCBkcml2ZXIgcHJvYmluZyB3aGVuIGZhaWxpbmcgdG8gcmVnaXN0ZXIgaW4KPiAg
ICAgICAgICAgICAgICAgICogdGhlcm1hbCBiZWNhdXNlIG5vIHRoZXJtYWwgRFQgbm9kZSBpcyBm
b3VuZC4KPiAgICAgICAgICAgICAgICAgICovCj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIo
aW5mby0+dHpkKSAmJiBQVFJfRVJSKGluZm8tPnR6ZCkgIT0gLUVOT0RFVikgewo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJjb3VsZCBub3QgcmVnaXN0ZXIgdGhlcm1hbCBzZW5zb3I6ICVsZFxuIiwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUl9FUlIoaW5mby0+dHpkKSk7Cj4g
KyAgICAgICAgICAgICAgIGlmIChJU19FUlIoaW5mby0+dHpkKSAmJiBQVFJfRVJSKGluZm8tPnR6
ZCkgIT0gLUVOT0RFVikKCkkgdGhpbmsgdGhlIGNvbW1lbnQgYWJvdmUgaXMgcHJldHR5IGNsZWFy
IHRoYXQgd2UgZG9uJ3Qgd2FudCBhIGZhaWx1cmUKb3IgYW4gZXJyb3IgbWVzc2FnZSB3aGVuIGl0
IGlzIGZhaWxpbmcganVzdCBiZWNhdXNlIHRoZSBEVCBpcyBtaXNzaW5nCnRoZXJtYWwgem9uZXMu
CgpDaGVuWXUKCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaW5mby0+
dHpkKTsKPiAtICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBk
ZXZtX2lpb19kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgaW5kaW9fZGV2KTsKPiAtLQo+IDIu
MzQuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
