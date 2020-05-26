Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C26321AF1AD
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Apr 2020 17:35:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54EB4C36B0D;
	Sat, 18 Apr 2020 15:35:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1337C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Apr 2020 15:35:11 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 300D4206D6;
 Sat, 18 Apr 2020 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587224109;
 bh=7FSVvEdwrwTbkIg9sAJryZ/mW5a3iveGq9GZOCEI/Lg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FI4KFkG9fsbS07+Uxu3p7PEbbX4lnyvpRM8XLY77qRkle+5Jtgzrr2TvDTkxSwjTN
 6SaEyFtxknhkzzC2COmpv+Tv87c4GYpXv0JZNU9q+nWHyOdU5DM2lgk0FzA8ReI16g
 uKZ3FOpPpZhd0GRB9Zz1sDDCQG4vmJY8qaudEQLc=
Date: Sat, 18 Apr 2020 16:34:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Hadar Gat <hadar.gat@arm.com>
Message-ID: <20200418163456.7c82d087@archlinux>
In-Reply-To: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
References: <1587030553-5990-1-git-send-email-hadar.gat@arm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko =?UTF-8?B?U3Q=?= =?UTF-8?B?w7xibmVy?= <heiko@sntech.de>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Stefan Agner <stefan@agner.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 sparclinux@vger.kernel.org, netdev@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 freedreno@lists.freedesktop.org, linux-omap@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Ofir Drang <ofir.drang@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2] of_device: removed #include that
 caused a recursion in included headers
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

On Thu, 16 Apr 2020 12:49:03 +0300
Hadar Gat <hadar.gat@arm.com> wrote:

> Both of_platform.h and of_device.h were included each other.
> In of_device.h, removed unneeded #include to of_platform.h
> and added include to of_platform.h in the files that needs it.
> 
> Signed-off-by: Hadar Gat <hadar.gat@arm.com>

Hmm.  I guess the chances of this causing merge problems are fairly low so
perhaps not worth doing additions of headers via individual subsystems and
actually dropping the header include after another cycle.

So on that basis

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio

> ---
> v2: add include to of_platform.h in more files. (reported due other builds)
> 
>  arch/sparc/mm/io-unit.c                           | 1 +
>  arch/sparc/mm/iommu.c                             | 1 +
>  drivers/base/platform.c                           | 1 +
>  drivers/bus/imx-weim.c                            | 1 +
>  drivers/bus/vexpress-config.c                     | 1 +
>  drivers/clk/mediatek/clk-mt7622-aud.c             | 1 +
>  drivers/dma/at_hdmac.c                            | 1 +
>  drivers/dma/stm32-dmamux.c                        | 1 +
>  drivers/dma/ti/dma-crossbar.c                     | 1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
>  drivers/iio/adc/stm32-adc-core.c                  | 1 +
>  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
>  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
>  drivers/iommu/tegra-smmu.c                        | 1 +
>  drivers/memory/atmel-ebi.c                        | 1 +
>  drivers/mfd/palmas.c                              | 1 +
>  drivers/mfd/ssbi.c                                | 1 +
>  drivers/mtd/nand/raw/omap2.c                      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  drivers/net/ethernet/ti/cpsw.c                    | 1 +
>  drivers/phy/tegra/xusb.c                          | 1 +
>  drivers/pinctrl/freescale/pinctrl-imx1-core.c     | 1 +
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
>  drivers/soc/samsung/exynos-pmu.c                  | 1 +
>  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
>  include/linux/of_device.h                         | 2 --
>  lib/genalloc.c                                    | 1 +
>  31 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
> index 289276b..5638399 100644
> --- a/arch/sparc/mm/io-unit.c
> +++ b/arch/sparc/mm/io-unit.c
> @@ -15,6 +15,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  
>  #include <asm/pgalloc.h>
>  #include <asm/pgtable.h>
> diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
> index b00dde1..9cbb2e7 100644
> --- a/arch/sparc/mm/iommu.c
> +++ b/arch/sparc/mm/iommu.c
> @@ -16,6 +16,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  
>  #include <asm/pgalloc.h>
>  #include <asm/pgtable.h>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 5255550..f549274b 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -12,6 +12,7 @@
>  #include <linux/string.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_irq.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 28bb65a..8c786da 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -11,6 +11,7 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
> index ff70575..12b8b0b 100644
> --- a/drivers/bus/vexpress-config.c
> +++ b/drivers/bus/vexpress-config.c
> @@ -8,6 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/vexpress.h>
>  
>  
> diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
> index 2bd4295..8cbb68f 100644
> --- a/drivers/clk/mediatek/clk-mt7622-aud.c
> +++ b/drivers/clk/mediatek/clk-mt7622-aud.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  
>  #include "clk-mtk.h"
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index 73a2078..388f8e10 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -20,6 +20,7 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_dma.h>
>  
>  #include "at_hdmac_regs.h"
> diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
> index 12f7637..b704896 100644
> --- a/drivers/dma/stm32-dmamux.c
> +++ b/drivers/dma/stm32-dmamux.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_dma.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> diff --git a/drivers/dma/ti/dma-crossbar.c b/drivers/dma/ti/dma-crossbar.c
> index 4ba8fa5..2c0fd44 100644
> --- a/drivers/dma/ti/dma-crossbar.c
> +++ b/drivers/dma/ti/dma-crossbar.c
> @@ -10,6 +10,7 @@
>  #include <linux/io.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_dma.h>
>  
>  #define TI_XBAR_DRA7		0
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index c4e71ab..f523254 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -6,6 +6,7 @@
>  #include <linux/interconnect.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> +#include <linux/of_platform.h>
>  #include <soc/qcom/cmd-db.h>
>  
>  #include "a6xx_gpu.h"
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 737453b..5034d40 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/of_irq.h>
>  #include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
>  
>  #include <sound/hdmi-codec.h>
>  #include "hdmi.h"
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 29295de..ddc9e85 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -8,6 +8,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/kthread.h>
>  #include <linux/uaccess.h>
> +#include <linux/of_platform.h>
>  #include <uapi/linux/sched/types.h>
>  
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 6e1270e..d038bae 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -12,6 +12,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 624437b..aa35757 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 2df88d2..3dc3453 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 76a60d9..e83848cb 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -20,6 +20,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> index 26e2011..f6a53ab 100644
> --- a/drivers/iio/adc/stm32-dfsdm-core.c
> +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 63a147b..3797caa 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -10,6 +10,7 @@
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> index 14386d0..272b1a8 100644
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -13,6 +13,7 @@
>  #include <linux/mfd/syscon/atmel-smc.h>
>  #include <linux/init.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/regmap.h>
>  #include <soc/at91/atmel-sfr.h>
>  
> diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
> index f5b3fa9..cca44bc 100644
> --- a/drivers/mfd/palmas.c
> +++ b/drivers/mfd/palmas.c
> @@ -19,6 +19,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/palmas.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  
>  static const struct regmap_config palmas_regmap_config[PALMAS_NUM_CLIENTS] = {
>  	{
> diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
> index 94f60df..72cd45a 100644
> --- a/drivers/mfd/ssbi.c
> +++ b/drivers/mfd/ssbi.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  
>  /* SSBI 2.0 controller registers */
>  #define SSBI2_CMD			0x0008
> diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
> index ad77c11..d851ec7 100644
> --- a/drivers/mtd/nand/raw/omap2.c
> +++ b/drivers/mtd/nand/raw/omap2.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  
>  #include <linux/mtd/nand_bch.h>
>  #include <linux/platform_data/elm.h>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 58e0511..d704d57 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -12,6 +12,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_mdio.h>
>  #include <linux/of_net.h>
>  #include <linux/phy.h>
> diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
> index c2c5bf8..6932945 100644
> --- a/drivers/net/ethernet/ti/cpsw.c
> +++ b/drivers/net/ethernet/ti/cpsw.c
> @@ -28,6 +28,7 @@
>  #include <linux/of_mdio.h>
>  #include <linux/of_net.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/if_vlan.h>
>  #include <linux/kmemleak.h>
>  #include <linux/sys_soc.h>
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index de4a46f..0eac1b8 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/phy/tegra/xusb.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> index c00d002..d1c171e 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> @@ -16,6 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
>  #include <linux/pinctrl/pinctrl.h>
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> index ca7bbe4..44974ac 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -19,6 +19,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_address.h>
>  #include <linux/bitops.h>
>  #include <linux/pinctrl/machine.h>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 17304fa..25129b0 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 1b0d50f..423cec3 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index 8d31e39..752999b 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -4,8 +4,6 @@
>  
>  #include <linux/cpu.h>
>  #include <linux/platform_device.h>
> -#include <linux/of_platform.h> /* temporary until merge */
> -
>  #include <linux/of.h>
>  #include <linux/mod_devicetable.h>
>  
> diff --git a/lib/genalloc.c b/lib/genalloc.c
> index 7f1244b..08e21eeb 100644
> --- a/lib/genalloc.c
> +++ b/lib/genalloc.c
> @@ -33,6 +33,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/genalloc.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/vmalloc.h>
>  
>  static inline size_t chunk_size(const struct gen_pool_chunk *chunk)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
