Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CB57CCF6
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Jul 2022 16:13:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1F8BC03FD6;
	Thu, 21 Jul 2022 14:13:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B705FC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 14:13:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0652A61F81;
 Thu, 21 Jul 2022 14:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C56C3411E;
 Thu, 21 Jul 2022 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658412821;
 bh=EPecOnRHvam2B9sAJCT0OBa+3aX5JmCDR+0inavW5vo=;
 h=From:To:Cc:Subject:Date:From;
 b=oRQ70x6nGh2glXxglojpBQHnTR4hurQ2zeuuLjLqKvR+Q+2JXmkt2I+S3jcBy2078
 h0eDVZac7ctNYah6Fa3Ne06zk/tm4v+8KdKJl4NAYp19fNSGpySE/VFc1YuK61+eCe
 RrcwtuQ10LYRWhb67YeUB/8htFx4d3ljOCC1wWjs8c4+nOfg6BkwJbW+3diPc4OUee
 rK7mewt4yfy/EHoiO84A0upUYiYWfuFzB8dDkUfLD0FR5i/Ysfn24GI4bOfJgFPEht
 pSDfiIXyTC6ZI4zWEmq7fGY6s9e8vzbP9g5TWaECjcTQIix1PW+z5fTe/0o7A9sXvr
 r1IRTYd3cTVjQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 21 Jul 2022 16:13:19 +0200
Message-Id: <20220721141325.2413920-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Will Deacon <will@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-sh@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [Linux-stm32] [PATCH 0/6] ARM: defconfig cleanups
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

From: Arnd Bergmann <arnd@arndb.de>

In the process of deprecating board files, I had to modify some defconfig
files and ran into the same problem as everyone else that a lot of
them are rather outdated. With some scripting, I managed to split out
a preparation patch that puts all lines into the expected order without
actually changing the contents.

This helped doing the cleanup separately per Kconfig option that needed
to be addressed. I only did a small portion of the follow-up changes
to get to the point of being able to rebase my board changes on top,
but I did manage to address some bugs that have crept in.

If there are no objections, I'd apply this set to the arm/defconfig
branch of the soc tree directly.

      Arnd

Arnd Bergmann (6):
  ARM: refresh defconfig files
  ARM: defconfig: remove irda remnants
  ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
  ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
  ARM: defconfig: remove broken CONFIG_THUMB disables
  ARM: defconfig: kill remnants of CONFIG_LEDS

Cc: Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Alexander Shiyan <shc_work@mail.ru>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
Cc: Takao Orito <orito.takao@socionext.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-oxnas@groups.io
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: linux-sh@vger.kernel.org

 arch/arm/configs/am200epdkit_defconfig    |  28 ++---
 arch/arm/configs/aspeed_g4_defconfig      |  17 ++-
 arch/arm/configs/aspeed_g5_defconfig      |  17 ++-
 arch/arm/configs/assabet_defconfig        |  19 ++-
 arch/arm/configs/at91_dt_defconfig        |  10 +-
 arch/arm/configs/axm55xx_defconfig        |  26 ++--
 arch/arm/configs/badge4_defconfig         |  17 +--
 arch/arm/configs/bcm2835_defconfig        |  38 +++---
 arch/arm/configs/cerfcube_defconfig       |  24 ++--
 arch/arm/configs/clps711x_defconfig       |   6 +-
 arch/arm/configs/cm_x300_defconfig        |  28 ++---
 arch/arm/configs/cns3420vb_defconfig      |  20 ++--
 arch/arm/configs/colibri_pxa270_defconfig |  41 +++----
 arch/arm/configs/colibri_pxa300_defconfig |  12 +-
 arch/arm/configs/collie_defconfig         |  22 ++--
 arch/arm/configs/corgi_defconfig          |  51 ++++----
 arch/arm/configs/davinci_all_defconfig    |  28 ++---
 arch/arm/configs/dove_defconfig           |  32 +++--
 arch/arm/configs/ep93xx_defconfig         |  18 ++-
 arch/arm/configs/eseries_pxa_defconfig    |  36 ++----
 arch/arm/configs/exynos_defconfig         |  24 ++--
 arch/arm/configs/ezx_defconfig            |  74 ++++++------
 arch/arm/configs/footbridge_defconfig     |  31 ++---
 arch/arm/configs/h3600_defconfig          |  16 +--
 arch/arm/configs/h5000_defconfig          |  20 ++--
 arch/arm/configs/hackkit_defconfig        |  12 +-
 arch/arm/configs/hisi_defconfig           |  24 ++--
 arch/arm/configs/imx_v4_v5_defconfig      |  10 +-
 arch/arm/configs/imx_v6_v7_defconfig      |   8 +-
 arch/arm/configs/integrator_defconfig     |   2 +-
 arch/arm/configs/iop32x_defconfig         |  23 ++--
 arch/arm/configs/ixp4xx_defconfig         |   1 -
 arch/arm/configs/jornada720_defconfig     |  16 +--
 arch/arm/configs/keystone_defconfig       |  64 +++++-----
 arch/arm/configs/lart_defconfig           |  21 ++--
 arch/arm/configs/lpc18xx_defconfig        |  16 ++-
 arch/arm/configs/lpc32xx_defconfig        |  12 +-
 arch/arm/configs/lpd270_defconfig         |  11 +-
 arch/arm/configs/lubbock_defconfig        |  21 ++--
 arch/arm/configs/magician_defconfig       |  41 +++----
 arch/arm/configs/mainstone_defconfig      |  15 ++-
 arch/arm/configs/milbeaut_m10v_defconfig  |   6 +-
 arch/arm/configs/mini2440_defconfig       |   8 +-
 arch/arm/configs/mmp2_defconfig           |  32 +++--
 arch/arm/configs/moxart_defconfig         |  20 ++--
 arch/arm/configs/mps2_defconfig           |  18 ++-
 arch/arm/configs/multi_v4t_defconfig      |   6 +-
 arch/arm/configs/multi_v5_defconfig       |  14 +--
 arch/arm/configs/multi_v7_defconfig       |  62 +++++-----
 arch/arm/configs/mv78xx0_defconfig        |  36 +++---
 arch/arm/configs/mvebu_v5_defconfig       |  32 +++--
 arch/arm/configs/mvebu_v7_defconfig       |   4 +-
 arch/arm/configs/mxs_defconfig            |   6 +-
 arch/arm/configs/neponset_defconfig       |  30 ++---
 arch/arm/configs/netwinder_defconfig      |  18 +--
 arch/arm/configs/nhk8815_defconfig        |   8 +-
 arch/arm/configs/omap1_defconfig          |  80 ++++++-------
 arch/arm/configs/omap2plus_defconfig      |  17 ++-
 arch/arm/configs/orion5x_defconfig        |  36 +++---
 arch/arm/configs/oxnas_v6_defconfig       |  14 +--
 arch/arm/configs/palmz72_defconfig        |  16 ++-
 arch/arm/configs/pcm027_defconfig         |  24 ++--
 arch/arm/configs/pleb_defconfig           |   8 +-
 arch/arm/configs/pxa168_defconfig         |  22 ++--
 arch/arm/configs/pxa255-idp_defconfig     |  21 ++--
 arch/arm/configs/pxa3xx_defconfig         |  20 ++--
 arch/arm/configs/pxa910_defconfig         |  26 ++--
 arch/arm/configs/pxa_defconfig            | 140 ++++++++++------------
 arch/arm/configs/qcom_defconfig           |  62 +++++-----
 arch/arm/configs/realview_defconfig       |   8 +-
 arch/arm/configs/rpc_defconfig            |  20 ++--
 arch/arm/configs/s3c2410_defconfig        |  12 +-
 arch/arm/configs/s3c6400_defconfig        |   4 +-
 arch/arm/configs/s5pv210_defconfig        |   6 +-
 arch/arm/configs/sama5_defconfig          |   8 +-
 arch/arm/configs/sama7_defconfig          |   8 +-
 arch/arm/configs/shannon_defconfig        |  10 +-
 arch/arm/configs/simpad_defconfig         |  29 ++---
 arch/arm/configs/socfpga_defconfig        |   8 +-
 arch/arm/configs/spear13xx_defconfig      |  18 +--
 arch/arm/configs/spear3xx_defconfig       |  12 +-
 arch/arm/configs/spear6xx_defconfig       |  10 +-
 arch/arm/configs/spitz_defconfig          |  51 ++++----
 arch/arm/configs/stm32_defconfig          |  18 ++-
 arch/arm/configs/sunxi_defconfig          |   2 +-
 arch/arm/configs/tct_hammer_defconfig     |  14 +--
 arch/arm/configs/tegra_defconfig          |  20 ++--
 arch/arm/configs/trizeps4_defconfig       |  66 +++++-----
 arch/arm/configs/u8500_defconfig          |   2 +-
 arch/arm/configs/versatile_defconfig      |   4 +-
 arch/arm/configs/vexpress_defconfig       |   8 +-
 arch/arm/configs/vf610m4_defconfig        |   2 +-
 arch/arm/configs/viper_defconfig          |  30 +++--
 arch/arm/configs/vt8500_v6_v7_defconfig   |   2 +-
 arch/arm/configs/xcep_defconfig           |  32 +++--
 arch/arm/configs/zeus_defconfig           |  28 ++---
 arch/arm64/configs/defconfig              |   2 +-
 arch/sh/configs/ecovec24_defconfig        |   2 -
 100 files changed, 989 insertions(+), 1189 deletions(-)

-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
