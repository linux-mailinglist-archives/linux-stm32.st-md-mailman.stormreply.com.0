Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697315FA490
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Oct 2022 22:15:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECC78C65040;
	Mon, 10 Oct 2022 20:15:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADA55C6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665432900; x=1696968900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hoHtp7ua/tOZfAXpLOK1gBSb/sEyQkWFQ6Xh4kF5nfY=;
 b=bJk5QqHKGc3w9yeyTTLT6g7Q8wL7z9dit/oIYTNLguRUEp7xF6neEUTu
 gPeEt5z0YaACQ/92085xQrQjMQqt7OaQuU8CSqEm4BquYgXqLD+6Z+N2x
 i9j60NHgQUGyZlr0LcV8GG6mozX3be+my0/9cIlejPldiGtmx+xsaebPe
 bHlnlBpYOwDw///FK/hO5+YGiStfAqu73rg4FsQ5YcQ0mOQRxjipPjDbB
 gUIzRgNEyMV8nbnA6332DOy80mBnjs6f/mtk1ijc5Xf3o4liXaNweXzC9
 mKLWyeSLikVgQj8GIb0y0rrTjs2QCwyoZI+aK4DT5uQSYcQlCHZvv+1bP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="287590317"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="287590317"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 13:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="603862730"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="603862730"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 10 Oct 2022 13:14:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8E95D1C8; Mon, 10 Oct 2022 23:15:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Zyngier <maz@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Prathamesh Shete <pshete@nvidia.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Mon, 10 Oct 2022 23:14:16 +0300
Message-Id: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jacky Bai <ping.bai@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, soc@kernel.org,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Avi Fishman <avifishman70@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Linux-stm32] [rft,
	PATCH v2 00/36] pinctrl: Clean up and add missed headers
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

Currently the header inclusion inside the pinctrl headers seems more arbitrary
than logical. This series is basically out of two parts:
- add missed headers to the pin control drivers / users
- clean up the headers of pin control subsystem

The idea is to have this series to be pulled after -rc1 by the GPIO and
pin control subsystems, so all new drivers will utilize cleaned up headers
of the pin control.

Please, review and comment.

Changelog v2:
- added preparatory patches: all, but last (LKP)
- added missed forward declaration to the last patch (LKP)

Andy Shevchenko (36):
  gpiolib: tegra186: Add missed header(s)
  gpiolib: cdev: Add missed header(s)
  media: c8sectpfe: Add missed header(s)
  pinctrl: actions: Add missed header(s)
  pinctrl: aspeed: Add missed header(s)
  pinctrl: at91: Add missed header(s)
  pinctrl: axp209: Add missed header(s)
  pinctrl: bcm: Add missed header(s)
  pinctrl: cygnus-mux: Add missed header(s)
  pinctrl: imx: Add missed header(s)
  pinctrl: ingenic: Add missed header(s)
  pinctrl: k210: Add missed header(s)
  pinctrl: lochnagar: Add missed header(s)
  pinctrl: mediatek: Add missed header(s)
  pinctrl: mvebu: Add missed header(s)
  pinctrl: npcm7xx: Add missed header(s)
  pinctrl: ocelot: Add missed header(s)
  pinctrl: qcom: Add missed header(s)
  pinctrl: renesas: Add missed header(s)
  pinctrl: samsung: Add missed header(s)
  pinctrl: single: Add missed header(s)
  pinctrl: spear: Add missed header(s)
  pinctrl: sprd: Add missed header(s)
  pinctrl: st: Add missed header(s)
  pinctrl: starfive: Add missed header(s)
  pinctrl: stm32: Add missed header(s)
  pinctrl: stmfx: Add missed header(s)
  pinctrl: tegra: Add missed header(s)
  pinctrl: ti-iodelay: Add missed header(s)
  pinctrl: uniphier: Add missed header(s)
  pinctrl: zynqmp: Add missed header(s)
  pinctrl: cherryview: Add missed header(s)
  pinctrl: lynxpoint: Add missed header(s)
  pinctrl: merrifield: Add missed header(s)
  pinctrl: intel: Add missed header(s)
  pinctrl: Clean up headers

 drivers/gpio/gpio-tegra186.c                  |  3 +-
 drivers/gpio/gpiolib-cdev.c                   |  6 ++--
 .../st/sti/c8sectpfe/c8sectpfe-core.c         |  8 +++--
 drivers/pinctrl/actions/pinctrl-owl.c         | 10 +++---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c        | 13 +++++---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c      |  9 ++++--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c      | 12 ++++---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c         |  8 +++--
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c         |  8 +++--
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c    |  6 ++--
 drivers/pinctrl/core.c                        | 19 ++++++------
 drivers/pinctrl/core.h                        | 12 ++++++-
 drivers/pinctrl/devicetree.h                  |  6 ++++
 drivers/pinctrl/freescale/pinctrl-imx.c       |  8 +++--
 drivers/pinctrl/intel/pinctrl-cherryview.c    |  6 ++--
 drivers/pinctrl/intel/pinctrl-intel.c         |  6 ++--
 drivers/pinctrl/intel/pinctrl-lynxpoint.c     |  6 ++--
 drivers/pinctrl/intel/pinctrl-merrifield.c    |  4 ++-
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  3 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  5 +++
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         | 14 +++++----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 11 ++++---
 drivers/pinctrl/pinconf.h                     | 10 ++++++
 drivers/pinctrl/pinctrl-at91-pio4.c           | 10 ++++--
 drivers/pinctrl/pinctrl-at91.c                | 16 +++++-----
 drivers/pinctrl/pinctrl-axp209.c              |  8 +++--
 drivers/pinctrl/pinctrl-ingenic.c             | 10 +++---
 drivers/pinctrl/pinctrl-k210.c                | 12 ++++---
 drivers/pinctrl/pinctrl-ocelot.c              | 10 +++---
 drivers/pinctrl/pinctrl-single.c              |  5 ++-
 drivers/pinctrl/pinctrl-st.c                  | 21 ++++++++-----
 drivers/pinctrl/pinctrl-stmfx.c               |  2 ++
 drivers/pinctrl/pinctrl-utils.h               |  5 +++
 drivers/pinctrl/pinctrl-zynqmp.c              |  4 ++-
 drivers/pinctrl/pinmux.c                      | 17 +++++-----
 drivers/pinctrl/pinmux.h                      | 11 +++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  8 +++--
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |  8 +++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       |  4 ++-
 drivers/pinctrl/renesas/pinctrl.c             |  8 +++--
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 11 ++++---
 drivers/pinctrl/spear/pinctrl-spear.c         |  6 ++--
 drivers/pinctrl/sprd/pinctrl-sprd.c           |  6 ++--
 .../starfive/pinctrl-starfive-jh7100.c        |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c         | 16 +++++-----
 drivers/pinctrl/tegra/pinctrl-tegra.c         |  6 ++--
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c       |  8 +++--
 .../pinctrl/uniphier/pinctrl-uniphier-core.c  |  8 +++--
 include/linux/pinctrl/consumer.h              | 31 +++++++++----------
 include/linux/pinctrl/devinfo.h               |  6 ++--
 include/linux/pinctrl/machine.h               |  8 +++--
 include/linux/pinctrl/pinconf-generic.h       | 23 ++++++++------
 include/linux/pinctrl/pinctrl.h               | 18 +++++------
 include/linux/pinctrl/pinmux.h                |  5 ++-
 56 files changed, 328 insertions(+), 186 deletions(-)


base-commit: 9d157c89c5569f0ef560b7a5b2d7bf59ae98499c
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
