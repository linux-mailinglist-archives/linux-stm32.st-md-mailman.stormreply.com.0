Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BFD77B2B7
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 09:41:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4471DC6B472;
	Mon, 14 Aug 2023 07:41:27 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77EABC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 07:41:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fe2fb9b4d7so36302265e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691998886; x=1692603686;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
 b=c2ibWsrtxlpOl2l93H8I7dwO30O1xssdh4p/RrE2q8N2J8sUQOiLfPy4jrHUDNecWQ
 B9Xl7UbuevI0/fpeC3Cqz4JjJBdAc1fM3Sx+NRxxOWZwKyMRK3wSy1FRjBCN1vRcCJ3V
 iNaGpXWAcpuPTu7ilq8+T4iAp1Du1dTft6ZdWvtZ4YteQjS4RMAl8rEkUzkK3U48fPQ3
 Ta+6PDHsz/O7Bxk8FyAYZKsv9wLW0hBYeG+zmWBSRbPB9cFQZwP3sWc7W4O0II/GdFDH
 XLs0zYerpdo1H3GjEXSiYzl+d1vN7CnfVNDwP6MnTibEClBZjnwlup1Vh8wpi7JEvqyE
 zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691998886; x=1692603686;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
 b=ZEZySSshwcIIzzxqJiRgvb6KjQHt5rHUouL6UfzC392gpLU3HGxaJ557bt4G6bfCGg
 hNZZhpIuvoQmpKcVYbsrbuPcCWU6CEQKaNaaJK215m7tyD7qF2szgyudWSY5jfCkVZLH
 dMdoxRD5WzkOlu0FPstshZVoDfx71mXIucEh7iUS22ha/deB1VSW9mmLTqkRCpVdjrMg
 GhqU6BvHR1PfimCiIBiMuy3M3Ecad1/TB6Oe5v9JHg5EJAYBNCzZ1X7Pw/n6/KKHJPUC
 +WSQzGYW8U4/ZM6XL4UtRCeSOfevW3OKrKeK3jBSbkMaESJyWCrrPBOh7fA6xnbVaM11
 oppw==
X-Gm-Message-State: AOJu0YyViLwDN5qvpTF9zHUgtTHCH03ylHb+xCRrI2cS3yCUbj+RyDWm
 LeZjW6ix3fL03jg7KQzkq3Ds4Q==
X-Google-Smtp-Source: AGHT+IFYfAjXxtZPBAO6xzW1e3FH1h7mkoQ3yNtVsbL8sLdvSW5eTgH/X76mW18QMBp5iOQDIcXGqw==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id
 b7-20020adfee87000000b003175e0dc249mr6776837wro.35.1691998885785; 
 Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6283000000b00317643a93f4sm13507243wru.96.2023.08.14.00.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Message-ID: <81500a13-0fed-e9d4-7f51-552b888a98e1@linaro.org>
Date: Mon, 14 Aug 2023 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-riscv@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Jerome Brunet <jbrunet@baylibre.com>, Luca Weiss <luca@z3ntu.xyz>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Michael Walle <michael@walle.cc>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
 Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] pwm: Manage owner assignment
 implicitly for drivers
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDQvMDgvMjAyMyAxNjoyNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiByZXF1aXJpbmcgZWFjaCBkcml2ZXIgdG8gY2FyZSBmb3IgYXNzaWduaW5nIHRoZSBvd25lciBt
ZW1iZXIKPiBvZiBzdHJ1Y3QgcHdtX29wcywgaGFuZGxlIHRoYXQgaW1wbGljaXRseSB1c2luZyBh
IG1hY3JvLiBOb3RlIHRoYXQgdGhlCj4gb3duZXIgbWVtYmVyIGhhcyB0byBiZSBtb3ZlZCB0byBz
dHJ1Y3QgcHdtX2NoaXAsIGFzIHRoZSBvcHMgc3RydWN0dXJlCj4gdXN1YWxseSBsaXZlcyBpbiBy
ZWFkLW9ubHkgbWVtb3J5IGFuZCBzbyBjYW5ub3QgYmUgbW9kaWZpZWQuCj4gCj4gVGhlIHVwc2lk
ZSBpcyB0aGF0IG5ldyBsb3dsZXZlbCBkcml2ZXJzIGNhbm5vdCBmb3JnZXQgdGhlIGFzc2lnbm1l
bnQgYW5kCj4gc2F2ZSBvbmUgbGluZSBlYWNoLiBUaGUgcHdtLWNyYyBkcml2ZXIgZGlkbid0IGFz
c2lnbiAub3duZXIsIHRoYXQncyBub3QKPiBhIHByb2JsZW0gaW4gcHJhY3Rpc2UgdGhvdWdoIGFz
IHRoZSBkcml2ZXIgY2Fubm90IGJlIGNvbXBpbGVkIGFzIGEKPiBtb2R1bGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3Bpby9ncGlvLW12ZWJ1LmMgICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgIDEgLQo+ICAgZHJp
dmVycy9sZWRzL3JnYi9sZWRzLXFjb20tbHBnLmMgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0K
PiAgIGRyaXZlcnMvcHdtL3B3bS1hYjg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2
ZXJzL3B3bS9wd20tYXBwbGUuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20v
cHdtLWF0bWVsLWhsY2RjLmMgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1hdG1l
bC10Y2IuYyAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAg
ICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAg
ICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1iY20ta29uYS5jICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9wd20vcHdtLWJlcmxpbi5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1icmNtc3RiLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tY2xr
LmMgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWNscHM3MTF4LmMg
ICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAg
ICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDEg
LQo+ICAgZHJpdmVycy9wd20vcHdtLWVwOTN4eC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRy
aXZlcnMvcHdtL3B3bS1mc2wtZnRtLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3
bS9wd20taGlidnQuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWlt
Zy5jICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMg
ICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20taW14MS5jICAgICAgICAgICAg
ICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAgICB8ICAx
IC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgMSAtCj4gICBk
cml2ZXJzL3B3bS9wd20taXFzNjIwYS5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9w
d20vcHdtLWp6NDc0MC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1r
ZWVtYmF5LmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbHAzOTQzLmMg
ICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWxwYzE4eHgtc2N0LmMgICAg
ICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1scGMzMnh4LmMgICAgICAgICAgICAgfCAg
MSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAg
ZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jICAgICAgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ICMgcHdtLW1lc29uCgo+ICAgZHJpdmVy
cy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3
bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbXhzLmMg
ICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAg
ICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAg
fCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDEgLQo+
ICAgZHJpdmVycy9wd20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZl
cnMvcHdtL3B3bS1yYXNwYmVycnlwaS1wb2UuYyAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9w
d20tcmNhci5jICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXJlbmVz
YXMtdHB1LmMgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAg
ICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tcnotbXR1My5jICAgICAgICAgICAg
IHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0K
PiAgIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2
ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20v
cHdtLXNwZWFyLmMgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zcHJk
LmMgICAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tc3RpLmMgICAgICAg
ICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAg
ICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1zdW5wbHVzLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tdGVn
cmEuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAg
ICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAg
ICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tdHdsLWxlZC5jICAgICAgICAgICAgIHwgIDIg
LS0KPiAgIGRyaXZlcnMvcHdtL3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAgMiAtLQo+ICAg
ZHJpdmVycy9wd20vcHdtLXZpc2NvbnRpLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMv
cHdtL3B3bS12dDg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20t
eGlsaW54LmMgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
cHdtLmMgICAgICAgICB8ICAxIC0KPiAgIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAg
ICAgICAgfCAxMCArKysrKystLS0tCj4gICA2OCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCA4MiBkZWxldGlvbnMoLSkKPiAKCjxzbmlwPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+IGluZGV4IDI1NTE5Y2Rk
YzJhOS4uNWJlYTUzMjQzZWQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
Cj4gKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBAQCAtMzM1LDcgKzMzNSw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBtZXNvbl9wd21fb3BzID0gewo+ICAgCS5mcmVlID0g
bWVzb25fcHdtX2ZyZWUsCj4gICAJLmFwcGx5ID0gbWVzb25fcHdtX2FwcGx5LAo+ICAgCS5nZXRf
c3RhdGUgPSBtZXNvbl9wd21fZ2V0X3N0YXRlLAo+IC0JLm93bmVyID0gVEhJU19NT0RVTEUsCj4g
ICB9Owo+ICAgCj4gICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHB3bV9tZXNvbjhiX3BhcmVu
dF9uYW1lc1tdID0gewoKPHNuaXA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
