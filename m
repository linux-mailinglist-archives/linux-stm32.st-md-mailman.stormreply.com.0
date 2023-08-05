Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC89771223
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 22:36:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C748C6B46E;
	Sat,  5 Aug 2023 20:36:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F03DC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 20:36:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA47660EEA;
 Sat,  5 Aug 2023 20:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8402EC433C7;
 Sat,  5 Aug 2023 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691267773;
 bh=HV9N1662vFNg45/injmUeZzoXqqRaYKc6xS67ObhrCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T8b37KpHrfdrHcPTjbp9eehNf/qy/zQ094uspwpe3knxbV/SAwFyOO+iL6poGeRt5
 mmN2THgQL8TANiBbUZTIqmUiv0S7zyq3SAoSc1CzwM7lN991SYLqic8rCimc7bWwRI
 Vu7ZXvkbMfRfxqG+wpJINgbL+2KpSYU+uMd2Pk44r5RPsQzRq94XsuoRFZfLcF3djQ
 F5MggUSz0nkmmAejuORlF5VcmTYFbpwgyjqW04dzJAO9QAMzfqz5myArTvUzYEHRfd
 0AdEI801aM4xbN8FAEhz4+QIYaCxO1e4lYxIngw3YRdHEiuSSaRBpD/K+KyiSmsD0z
 8QDHViYep2Zwg==
Date: Sat, 5 Aug 2023 22:36:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230805203610.jl7eea2lasmg2as2@intel.intel>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
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
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Uwe,

On Fri, Aug 04, 2023 at 04:27:06PM +0200, Uwe Kleine-K=F6nig wrote:
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> =

> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a

/practise/practice/

> module.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Andi Shyti <andi.shyti@kernel.org> =


Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
