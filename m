Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6E7A2E87
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 10:10:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C3FDC6B47C;
	Sat, 16 Sep 2023 08:10:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC44C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 08:10:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F278608C0;
 Sat, 16 Sep 2023 08:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE5EC433C8;
 Sat, 16 Sep 2023 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694851830;
 bh=Vn2DREJrAn8aRUxiz3WQryX63T4UuS6DU0+Ekb7wTm4=;
 h=From:To:Cc:Subject:Date:From;
 b=n/BOcYygBC0G4RcSGiatuCr/r8q4kLlIb9Oibd9j78tGln5AE7VUXlKzUGv3oZoNe
 yZkB2iu0/WGky4eM/U3qo0reTujDlH0LCjfJd6NKB1BztVhzQc/jTLP9JhYsCVNGB5
 xc4hpPrN4FPCFKfdktUEMdT46R/j6pjWt9Eisaw4JQOs3thUJmzZQY3nrgKSEzYShd
 AGDnPuV4q97Ka6oajzo+OnYG8rEjS/kKyl1ZvnR/ff6K7djRnbTC01GhRabGmls9I2
 ST6JK+dDTWDbGe6jr2DkerJrghE3QC2l+ErthmzjWKTak7ZhGHgAr479NyhLAZFLR8
 QctLBFjj0spCQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Sat, 16 Sep 2023 15:58:06 +0800
Message-Id: <20230916075829.1560-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 00/22] convert to
	devm_stmmac_probe_config_dt
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

Russell pointed out there's a new devm_stmmac_probe_config_dt()
helper now when reviewing my starfive gmac error handling patch[1].
After greping the code, this nice helper was introduced by Bartosz in
[2], I think it's time to convert all dwmac users to this helper and
finally complete the TODO in [2] "but once all users of the old
stmmac_pltfr_remove() are converted to the devres helper, it will be
renamed back to stmmac_pltfr_remove() and the no_dt function removed."

Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]

Since v1:
 - rebase on new net-next
 - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.

Jisheng Zhang (23):
  net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
  net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
  net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
  net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
  net: stmmac: make stmmac_{probe|remove}_config_dt static

 .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
 .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
 .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
 .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
 22 files changed, 127 insertions(+), 317 deletions(-)

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
