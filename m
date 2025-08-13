Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25321B25553
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 23:28:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7514AC36B2E;
	Wed, 13 Aug 2025 21:28:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B5A4C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 21:28:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 068F2601D6;
 Wed, 13 Aug 2025 21:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038F0C4CEEB;
 Wed, 13 Aug 2025 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755120527;
 bh=w6o+Mcmx0kfk0qJVojOnLq3WRRaroXEK6NqPwh8WeEA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tW0weATX4jZ11jXl3He1Ule5FSJuMatBGd51oT3bMN01eb3cT3/18BB0KpS64oSbV
 6A4QDHJDbE2i5JqtnfsyVBALsh6Bm5ABrlcwIeEaVVJKF8Ys4lmXD08V4Cf547I5mm
 6sCZgBGCfMRs6QPVrGxU4nTnD7f31+rWw2qkW80zdobtK+0W0QNMcTpZiJJZuxp3e3
 f72jB75x9bqVrnObcwmG+vOT476m4B3xoHJM2Tk0dvct2jHtt8v2WNoP/JeukhjYFa
 P4b7UnXzBQig+oKbLe5NjU5NaUCh5y3uOUysgIl6JhmCWTjHv+RyKuGvEMG/hhDxtg
 oUrRFt19OPnjQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Message-Id: <175512050873.352044.97744864083041762.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 22:28:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Guo Ren <guoren@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 David Lechner <dlechner@baylibre.com>, linux-sunxi@lists.linux.dev,
 Tali Perry <tali.perry1@gmail.com>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>, linux-spi@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Drew Fustini <fustini@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Samuel Holland <samuel.holland@sifive.com>,
 Simona Vetter <simona@ffwll.ch>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vasily Khoruzhick <anarsoul@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-media@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Jonathan Cameron <jic23@kernel.org>,
 imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Fu Wei <wefu@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, linux-riscv@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, openbmc@lists.ozlabs.org,
 Zhang Rui <rui.zhang@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] (subset) [PATCH 00/21] treewide: remove unneeded
 'fast_io' parameter in regmap_config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 13 Aug 2025 18:14:46 +0200, Wolfram Sang wrote:
> While working on a driver using regmap with MMIO, I wondered if I need
> to set 'fast_io' in the config. Turned out I don't need to, so I added
> documentation for it with commit ffc72771ff6e ("regmap: Annotate that
> MMIO implies fast IO").
> 
> This series fixes the existing users in the tree which needlessly set
> the flag. They have been found using this coccinelle script:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[15/21] regulator: remove unneeded 'fast_io' parameter in regmap_config
        commit: 37533933bfe92cd5a99ef4743f31dac62ccc8de0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
