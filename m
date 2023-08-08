Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5E773A64
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 15:18:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12486C6B469;
	Tue,  8 Aug 2023 13:18:44 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0D60C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 13:18:42 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-d299ed34bacso9514330276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691500721; x=1692105521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
 b=iy7zswmtYx6ZYNzYmCG5rqHRjdv+HqB8GrEKYccjle/8dJ9x1OShHO9OgMow0zFYho
 RJhCC40wkFuTTf25ecgjND4T7pSlTzynELSybpF4Tq9lm0vpF/1WhH9PVjPDo3D92r0t
 vE0MwfGWmp5O6GeDRRPpN190ezwOTKyeDzoh+6spHPvGNcXvDC15NYX5Fh6AdODwNh9i
 u+xgCMzltAjprgtTTXUMnRSMUGU88rU5hQybpWcAAj9weIpW1fiVIhA90pqCkvmL6npO
 3XYinfPiJb8jbNTnaImLtOznhk/zT3v7clUSSq2VXwojFDvEIz4Ap+Wto2wlmlxEy3FT
 jTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691500721; x=1692105521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
 b=Uv0mptJXvD2lIZmZYn6lFFoS+iNJ9MvBGIu/aAbo0+o/xbJKV6MO6v2kR8i+sQ3+ek
 CJZC0QaVmsr8aaFDHXue/wmyPCV+th/d93UoyEUv2JwEgtLQl+OO84CZzJD+vTDgBUVi
 B+PypKgq00T6OqpoXzktnObu6louQuqDaAZhirTkMjL+qlibd60ZJ+zShO7WA0Brcf6P
 S1XufYdrGEm92N64iH2JZ5xGdh+Aj2N8r4HwVvwOoC1DSEUzxaWHlIVbJz/73Pj6UWOG
 Cnq6O9MvSfzYgY/gUIa9Nd+WEEDDaaO5joMcnM21AriCB9ArdeXubWSlndcWPWU/n1jx
 jO7g==
X-Gm-Message-State: AOJu0YzMllJHHnyV4ZviWdV2D2cMmNBpP7C9tv8hn8f2SDoBMHseXgay
 s84UE5e5M2RkXvrl9Hfb8cB3UV60Nvf87lmYaPu5pw==
X-Google-Smtp-Source: AGHT+IGCQegfute4wq8vuctRCNyh2F9D25HtOrYRCxA1KPyHbK9gB5btAs+lYOVd+Us7kHls2/CFh6KxK9tgT70dyU8=
X-Received: by 2002:a25:d14e:0:b0:cee:80e:23af with SMTP id
 i75-20020a25d14e000000b00cee080e23afmr3349036ybg.11.1691500721596; Tue, 08
 Aug 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Aug 2023 15:18:30 +0200
Message-ID: <CACRpkdZ4OqLywBhCkDmA6bEkf3rfHpCODba9Rhx36fuP8ywt6Q@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Shevchenko <andy@kernel.org>,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Walle <michael@walle.cc>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, greybus-dev@lists.linaro.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Benson Leung <bleung@chromium.org>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, linux-leds@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Sven Peter <sven@svenpeter.dev>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] pwm: Manage owner assignment
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA0OjI44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IChpbXBsaWNpdCkgdjEgb2YgdGhp
cyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cHdtLzIwMjMwODAzMTQwNjMzLjEzODE2NS0xLXUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZSAuCj4KPiBDaGFuZ2VzIHNpbmNlIHRoZW4gb25seSBhZmZlY3QgZG9jdW1lbnRhdGlvbiB0aGF0
IEkgbWlzc2VkIHRvIGFkYXB0IGJlZm9yZS4KPiBUaGFua3MgdG8gTGF1cmVudCBmb3IgY2F0Y2hp
bmcgdGhhdAo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCj4KPiBVd2UgS2xlaW5lLUvDtm5pZyAoMik6
Cj4gICBwd206IE1hbmFnZSBvd25lciBhc3NpZ25tZW50IGltcGxpY2l0bHkgZm9yIGRyaXZlcnMK
PiAgIHB3bTogY3JjOiBBbGxvdyBjb21waWxhdGlvbiBhcyBtb2R1bGUgYW5kIHdpdGggQ09NUElM
RV9URVNUCgpDbGVhcmx5IHRoZSByaWdodCB0aGluZyB0byBkbyEgTmljZSBwYXRjaGVzLgpSZXZp
ZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
