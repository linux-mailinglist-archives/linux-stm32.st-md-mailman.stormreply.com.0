Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19F776152
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Aug 2023 15:38:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AD68C6B472;
	Wed,  9 Aug 2023 13:38:16 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19050C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Aug 2023 13:38:15 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 18516124F;
 Wed,  9 Aug 2023 15:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1691588293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Btky6tTdvG25ZLsauzNmPRJKTtp0p2jrZzqQzvClL8=;
 b=r4wKl3ihNbNJWLLG5hf4K10pWKB/qcqJZWT79pdX14Hwy6cFCNoDp523ysrGvSxR0hF0sV
 S19UUVxjs0tcqcFDwaa/NkVjQnAj2+cyBE5RQNYWGpyiW44j/FWxQygtTL+wtS+237ZPBi
 AtOsW9She/DFFxiMreuzoOh5io7RuXTgqIlbCCUn4LHHa90Z+A4PZo97sfdrSy4KQLmkYs
 hhFi301ZV0pK+bOMSJlqwINPWSXFfHk08E4h61f4wk1UScNwCWh6iBthi3AlIm+EDBA4U6
 GVakjg8rtPJGDbRJZnIXlKnvbOR8bknUPLybW2kI3kAAfIaJexJ1gSpJk2GYOw==
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:38:12 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Message-ID: <a6ba206a709b2f4f1c817df8c868a683@walle.cc>
X-Sender: michael@walle.cc
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Pavel Machek <pavel@ucw.cz>,
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
 =?UTF-8?Q?Jonathan_Neusch?= =?UTF-8?Q?=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgo+IEluc3RlYWQgb2YgcmVxdWlyaW5nIGVhY2ggZHJpdmVyIHRvIGNhcmUgZm9yIGFzc2ln
bmluZyB0aGUgb3duZXIgbWVtYmVyCj4gb2Ygc3RydWN0IHB3bV9vcHMsIGhhbmRsZSB0aGF0IGlt
cGxpY2l0bHkgdXNpbmcgYSBtYWNyby4gTm90ZSB0aGF0IHRoZQo+IG93bmVyIG1lbWJlciBoYXMg
dG8gYmUgbW92ZWQgdG8gc3RydWN0IHB3bV9jaGlwLCBhcyB0aGUgb3BzIHN0cnVjdHVyZQo+IHVz
dWFsbHkgbGl2ZXMgaW4gcmVhZC1vbmx5IG1lbW9yeSBhbmQgc28gY2Fubm90IGJlIG1vZGlmaWVk
Lgo+IAo+IFRoZSB1cHNpZGUgaXMgdGhhdCBuZXcgbG93bGV2ZWwgZHJpdmVycyBjYW5ub3QgZm9y
Z2V0IHRoZSBhc3NpZ25tZW50IAo+IGFuZAo+IHNhdmUgb25lIGxpbmUgZWFjaC4gVGhlIHB3bS1j
cmMgZHJpdmVyIGRpZG4ndCBhc3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90Cj4gYSBwcm9ibGVtIGlu
IHByYWN0aXNlIHRob3VnaCBhcyB0aGUgZHJpdmVyIGNhbm5vdCBiZSBjb21waWxlZCBhcyBhCj4g
bW9kdWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+CgouLi4KCj4gIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5j
ICAgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxs
ZS5jYz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
