Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AAB24F3B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 18:16:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDFF4C36B16;
	Wed, 13 Aug 2025 16:16:10 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27B3DC36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=8r/LCX9rzyog3y
 rylwFjwRMpIaemTxzslMXi3Wwcda8=; b=QCJ48aONHnHPI67IOJ/3D8OQB3Cd/k
 va3dqQAxVecMFTPLNQfZkeRCBnr21f5AP85A+ko/Co2kn3d1vUsGdjjGnQSoqHT/
 XhtDURAzo7LNMG2Hw6aJkJP1nHKCJDt/I4UFOhqYSkFA3npSGKStA4S5hsN3gfb8
 C8iP/CLkf5T/WRnlry5E/M4rY/ikuUABioRBeFix0sZAgPzikWKDzZXwcrM/PlZn
 9QF5GBzn0iIdqib/tI3qtiZXmnTMTK2djC7YMTKPNRHBv7OXt7TeyHMZFzQFHHD9
 4yuXLJeM/fwFHXJlvGUnp8QGyn4bljRJZaBZSVKQgiNlixK49bkom2HA==
Received: (qmail 694422 invoked from network); 13 Aug 2025 18:15:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 Aug 2025 18:15:54 +0200
X-UD-Smtp-Session: l3s3148p1@6vOVeEE8NodtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 13 Aug 2025 18:14:46 +0200
Message-ID: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
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
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
 Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 00/21] treewide: remove unneeded 'fast_io'
	parameter in regmap_config
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

While working on a driver using regmap with MMIO, I wondered if I need
to set 'fast_io' in the config. Turned out I don't need to, so I added
documentation for it with commit ffc72771ff6e ("regmap: Annotate that
MMIO implies fast IO").

This series fixes the existing users in the tree which needlessly set
the flag. They have been found using this coccinelle script:

===

@ match @
expression dev, clk, regs;
identifier config;
@@

(
	regmap_init_mmio(dev, regs, &config)
|
	devm_regmap_init_mmio(dev, regs, &config)
|
	regmap_init_mmio_clk(dev, clk, regs, &config)
|
	devm_regmap_init_mmio_clk(dev, clk, regs, &config)
)

@ fix depends on match @
identifier match.config;
@@

	struct regmap_config config = {
-	.fast_io = true,
	};

===

It misses occasions where 'config' is an expression and not an
identifier. These are rare, though, I can fix them manually later. The
advantage of this approach is that it produces no false positives to the
best of my knowledge.

Please apply individually per subsystem. There are no dependencies and
buildbot is happy. Patches are based on 6.17-rc1

Happy hacking,

   Wolfram


Wolfram Sang (21):
  bus: remove unneeded 'fast_io' parameter in regmap_config
  clk: remove unneeded 'fast_io' parameter in regmap_config
  gpio: remove unneeded 'fast_io' parameter in regmap_config
  drm: remove unneeded 'fast_io' parameter in regmap_config
  iio: remove unneeded 'fast_io' parameter in regmap_config
  Input: remove unneeded 'fast_io' parameter in regmap_config
  mailbox: remove unneeded 'fast_io' parameter in regmap_config
  media: remove unneeded 'fast_io' parameter in regmap_config
  mfd: remove unneeded 'fast_io' parameter in regmap_config
  mmc: remove unneeded 'fast_io' parameter in regmap_config
  peci: remove unneeded 'fast_io' parameter in regmap_config
  phy: remove unneeded 'fast_io' parameter in regmap_config
  pinctrl: remove unneeded 'fast_io' parameter in regmap_config
  pmdomain: remove unneeded 'fast_io' parameter in regmap_config
  regulator: remove unneeded 'fast_io' parameter in regmap_config
  reset: remove unneeded 'fast_io' parameter in regmap_config
  rtc: remove unneeded 'fast_io' parameter in regmap_config
  soc: remove unneeded 'fast_io' parameter in regmap_config
  spi: remove unneeded 'fast_io' parameter in regmap_config
  thermal: remove unneeded 'fast_io' parameter in regmap_config
  ASoC: remove unneeded 'fast_io' parameter in regmap_config

 drivers/bus/bt1-apb.c                             | 1 -
 drivers/clk/actions/owl-common.c                  | 1 -
 drivers/clk/clk-axm5516.c                         | 1 -
 drivers/clk/nxp/clk-lpc32xx.c                     | 1 -
 drivers/clk/qcom/a53-pll.c                        | 1 -
 drivers/clk/qcom/a7-pll.c                         | 1 -
 drivers/clk/qcom/apss-ipq-pll.c                   | 1 -
 drivers/clk/qcom/clk-cbf-8996.c                   | 1 -
 drivers/clk/qcom/clk-cpu-8996.c                   | 1 -
 drivers/clk/qcom/hfpll.c                          | 1 -
 drivers/clk/qcom/ipq-cmn-pll.c                    | 1 -
 drivers/clk/thead/clk-th1520-ap.c                 | 1 -
 drivers/gpio/gpio-mvebu.c                         | 1 -
 drivers/gpio/gpio-sifive.c                        | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1 -
 drivers/gpu/drm/imx/dc/dc-cf.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c                    | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                    | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c                    | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c               | 2 --
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  | 1 -
 drivers/iio/adc/sun4i-gpadc-iio.c                 | 1 -
 drivers/input/touchscreen/fsl-imx25-tcq.c         | 1 -
 drivers/mailbox/qcom-apcs-ipc-mailbox.c           | 1 -
 drivers/media/cec/platform/stm32/stm32-cec.c      | 1 -
 drivers/mfd/exynos-lpass.c                        | 1 -
 drivers/mfd/fsl-imx25-tsadc.c                     | 1 -
 drivers/mfd/stm32-lptimer.c                       | 1 -
 drivers/mfd/sun4i-gpadc.c                         | 1 -
 drivers/mmc/host/sdhci_am654.c                    | 1 -
 drivers/peci/controller/peci-npcm.c               | 1 -
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c         | 1 -
 drivers/phy/ti/phy-am654-serdes.c                 | 1 -
 drivers/phy/ti/phy-j721e-wiz.c                    | 1 -
 drivers/pinctrl/pinctrl-rp1.c                     | 1 -
 drivers/pmdomain/imx/gpc.c                        | 1 -
 drivers/regulator/qcom-refgen-regulator.c         | 1 -
 drivers/reset/reset-intel-gw.c                    | 1 -
 drivers/reset/reset-qcom-pdc.c                    | 1 -
 drivers/reset/reset-th1520.c                      | 1 -
 drivers/rtc/rtc-meson.c                           | 1 -
 drivers/soc/qcom/llcc-qcom.c                      | 1 -
 drivers/soc/qcom/ramp_controller.c                | 1 -
 drivers/spi/spi-altera-platform.c                 | 1 -
 drivers/thermal/armada_thermal.c                  | 1 -
 drivers/thermal/sun8i_thermal.c                   | 1 -
 sound/soc/fsl/fsl_sai.c                           | 1 -
 53 files changed, 57 deletions(-)

-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
