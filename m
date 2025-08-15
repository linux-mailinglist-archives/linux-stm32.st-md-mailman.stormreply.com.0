Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE105B2822A
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Aug 2025 16:42:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B44C9C32EBF;
	Fri, 15 Aug 2025 14:42:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640C7C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Aug 2025 14:42:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DEA18439C8;
 Fri, 15 Aug 2025 14:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B35C4CEEB;
 Fri, 15 Aug 2025 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755268931;
 bh=3eUf4UXirGpUX0gw3VvalDgnQQxUYuzOa7d+Bn86Fb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QGhHpuiSTtGAbt/6dlTCnnoTA4ZplxFC8Tro0GJAdbAh12tMNEUSLu07z11OvQBvk
 oHTf5TJS/YKStrrrPHeWRzwJ0jGE6j5AZ1tbRvaZy3dDmEE9KCuVb15MPpzSH6J/gw
 2nlRciQR5ILTUmZcjfPb8Wftcr9/dguuRdUZKw9cWJDeaG76YAPPH1GvTVv9P/kSEx
 wLYcS3eJZ7unChNgWOYh7wQNPjdRjal2zeZDCWKyPnLkisSlJQ+WGVCBgVhn2LIrAt
 +qG7XHhqCY/zS15DuM72YtrsT2tpKSGGxqzGtUU2p/oH3AF5g3+H8o04kc5YGhgMBJ
 knwp+/59e078g==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Fri, 15 Aug 2025 09:42:02 -0500
Message-ID: <175526892008.370600.8859545110801188375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
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
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-rtc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-input@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Fu Wei <wefu@redhat.com>,
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
 Patrick Venture <venture@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org
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

Applied, thanks!

[18/21] soc: remove unneeded 'fast_io' parameter in regmap_config
        commit: 5d8a9c8401648d338d072a488d455ed4611c5d4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
