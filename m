Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D256678B21B
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 15:40:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D559C6A61D;
	Mon, 28 Aug 2023 13:40:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66824C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 13:40:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-500aed06ffcso3444295e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693230023; x=1693834823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yhXqmBfkWu2HDIuTC08kUGflD20qYcRYbObZBFSabWw=;
 b=pTEQOkvTOqx4jmQFEV2f4eL+xsgHXTvC4vvCpwTeoCVPRRu+97BFuUi5/7/IVyp2yb
 vDu5jkn7VXKJlE2FclUa02+GiSJ5dcum3s3nL1PtG0flIRIrffIUYWv8aYQwOefZxiBZ
 GbIv4lxNTOJ+SYoSoYNqBjwFYGk/YWCjgTUWo6nkHlOrZmc6Z+Z1cSolUPshK5q9/L/X
 Y4WmIBCkH78I0G7uVHx+Y+NI41hemWwJdoyrMgRqy+gzoS6bkKqK7WRkvCktTIedTj2d
 0c+Z177IwJ1D/z3u/icY2JoCgI/kRDVN3FXiT/CYxsEM7/iEXoxGa53huWV7cuYtOuHU
 ycbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693230023; x=1693834823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhXqmBfkWu2HDIuTC08kUGflD20qYcRYbObZBFSabWw=;
 b=RObMRkpymdM8duX2gLLMFGy0dZ2pJ5fJG1922LetH/6B3XEMEpAXGe44NUmTXjsFWA
 MDSWM6U+HDJ1G57xlPDmiC/f4cPj8VPG8BcYCEn0UG5ZaOtaIiVFSDh5+BEuFAoVyqV/
 m9Nd8x8gAgOzI3v4Dt9YxCKNl5kChrYcATeoVbO90oBJyvWXyEN+I3G4CgxNMvlRpWYo
 YeAPNR8wmv6ZiVxgeimCLVsc4we6qXbu8DVE0rysfan6+sI0oFc22EOacZkDGY7KniqL
 jGb+rrQ5IvY3xr11AfUFwSpeElb7nUc3npL/GF1/vmFnaXyGv4DrwhgGChWNQyFcGo8o
 gMQQ==
X-Gm-Message-State: AOJu0YzzuDr6TttZ7wTnDDOe2gci/SfYflgR7+gbMrjm+aGk2LdBMJS6
 mBYrtLbuMfrInPcZUvtKJ/A=
X-Google-Smtp-Source: AGHT+IG7KNTcxXzgMfuLkjHcdmWdzGVbZVp0SfSbqgA4+JTQaOHX/wehu97KHkC2AaS96XGUltCynA==
X-Received: by 2002:a05:6512:3b92:b0:4fe:7e1f:b044 with SMTP id
 g18-20020a0565123b9200b004fe7e1fb044mr20910444lfv.15.1693230023231; 
 Mon, 28 Aug 2023 06:40:23 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a197501000000b004fdbb36a677sm1585902lfe.288.2023.08.28.06.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 06:40:22 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:40:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <maj7mkdtkhp3z7xzcwvopnup3lhm5h5wyxz3j2ljryjbwpwilx@xdizgwctqukn>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827091710.1483-4-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Maxime@web.codeaurora.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Coquelin@web.codeaurora.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: add glue
 layer for T-HEAD TH1520 SoC
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

On Sun, Aug 27, 2023 at 05:17:10PM +0800, Jisheng Zhang wrote:
> Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
>  3 files changed, 314 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 06c6871f8788..1bf71804c270 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -216,6 +216,17 @@ config DWMAC_SUN8I
>  	  stmmac device driver. This driver is used for H3/A83T/A64
>  	  EMAC ethernet controller.
>  
> +config DWMAC_THEAD
> +	tristate "T-HEAD dwmac support"
> +	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for ethernet controllers on T-HEAD RISC-V SoCs
> +
> +	  This selects the T-HEAD platform specific glue layer support for
> +	  the stmmac device driver. This driver is used for T-HEAD TH1520
> +	  ethernet controller.
> +
>  config DWMAC_IMX8
>  	tristate "NXP IMX8 DWMAC support"
>  	default ARCH_MXC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 5b57aee19267..d73171ed6ad7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> +obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
>  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_GENERIC)	+= dwmac-generic.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> new file mode 100644
> index 000000000000..85135ef05906
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD DWMAC platform driver
> + *
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "stmmac_platform.h"
> +
> +#define GMAC_CLK_EN			0x00
> +#define  GMAC_TX_CLK_EN			BIT(1)
> +#define  GMAC_TX_CLK_N_EN		BIT(2)
> +#define  GMAC_TX_CLK_OUT_EN		BIT(3)
> +#define  GMAC_RX_CLK_EN			BIT(4)
> +#define  GMAC_RX_CLK_N_EN		BIT(5)
> +#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
> +#define GMAC_RXCLK_DELAY_CTRL		0x04
> +#define  GMAC_RXCLK_BYPASS		BIT(15)
> +#define  GMAC_RXCLK_INVERT		BIT(14)
> +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> +#define GMAC_TXCLK_DELAY_CTRL		0x08
> +#define  GMAC_TXCLK_BYPASS		BIT(15)
> +#define  GMAC_TXCLK_INVERT		BIT(14)
> +#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> +#define GMAC_PLLCLK_DIV			0x0c
> +#define  GMAC_PLLCLK_DIV_EN		BIT(31)
> +#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
> +#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> +#define GMAC_GTXCLK_SEL			0x18
> +#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
> +#define GMAC_INTF_CTRL			0x1c
> +#define  PHY_INTF_MASK			BIT(0)
> +#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
> +#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
> +#define GMAC_TXCLK_OEN			0x20
> +#define  TXCLK_DIR_MASK			BIT(0)
> +#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
> +#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
> +
> +#define GMAC_GMII_RGMII_RATE	125000000
> +#define GMAC_MII_RATE		25000000
> +
> +struct thead_dwmac {
> +	struct plat_stmmacenet_data *plat;
> +	struct regmap *apb_regmap;
> +	struct device *dev;
> +	u32 rx_delay;
> +	u32 tx_delay;
> +};
> +
> +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		phyif = PHY_INTF_MII_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->interface);
> +		return -EINVAL;
> +	};
> +
> +	regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> +
> +	return 0;
> +}
> +
> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->interface);
> +		return -EINVAL;
> +	};
> +
> +	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> +
> +	return 0;
> +}
> +
> +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	struct plat_stmmacenet_data *plat = dwmac->plat;
> +	unsigned long rate;
> +	u32 div;
> +
> +	switch (plat->interface) {
> +	/* For MII, rxc/txc is provided by phy */
> +	case PHY_INTERFACE_MODE_MII:
> +		return;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:

> +		rate = clk_get_rate(plat->stmmac_clk);
> +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> +		    rate % GMAC_MII_RATE != 0) {
> +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> +			return;
> +		}
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> +
> +		switch (speed) {
> +		case SPEED_1000:
> +			div = rate / GMAC_GMII_RGMII_RATE;
> +			break;
> +		case SPEED_100:
> +			div = rate / GMAC_MII_RATE;
> +			break;
> +		case SPEED_10:
> +			div = rate * 10 / GMAC_MII_RATE;
> +			break;
> +		default:
> +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +			return;
> +		}
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);

This chunk looks like a hard-coded implementation of the
CLK_SET_RATE_GATE Tx-clocks rate setup which parental clock is the
"stmmaceth" clock. I suggest to move it to the respective driver, add
a "tx" clock to the bindings and use the common clock kernel API
methods here only.

> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->interface);
> +		return;
> +	}
> +}
> +
> +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 reg;
> +
> +	switch (plat->interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		/* use pll */
> +		regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
> +

> +		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> +		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;

Similarly settings these flags looks like just clock gates which can
also be moved to the clock driver.

> +		break;
> +
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->interface);
> +		return -EINVAL;
> +	}
> +
> +	regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
> +
> +	return 0;
> +}
> +
> +static int thead_dwmac_init(struct platform_device *pdev,
> +			    struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	int ret;
> +
> +	ret = thead_dwmac_set_phy_if(plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = thead_dwmac_set_txclk_dir(plat);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> +		     GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> +	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> +		     GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> +
> +	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
> +
> +	return thead_dwmac_enable_clk(plat);
> +}
> +
> +static int thead_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct stmmac_resources stmmac_res;
> +	struct thead_dwmac *dwmac;
> +	struct device_node *np = pdev->dev.of_node;
> +	u32 delay_ps;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get resources\n");
> +

> +	plat = stmmac_probe_config_dt(pdev, stmmac_res.mac);

This can be replaced with devm_stmmac_probe_config_dt() so the
stmmac_remove_config_dt() invocation would be dropped.

> +	if (IS_ERR(plat))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> +				     "dt configuration failed\n");
> +
> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac) {
> +		ret = -ENOMEM;
> +		goto err_remove_config_dt;
> +	}
> +
> +	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
> +		dwmac->rx_delay = delay_ps;
> +	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay_ps))
> +		dwmac->tx_delay = delay_ps;
> +
> +	dwmac->apb_regmap = syscon_regmap_lookup_by_phandle(np, "thead,gmacapb");
> +	if (IS_ERR(dwmac->apb_regmap)) {
> +		ret = dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
> +				    "Failed to get gmac apb syscon\n");
> +		goto err_remove_config_dt;
> +	}
> +
> +	dwmac->dev = &pdev->dev;
> +	dwmac->plat = plat;
> +	plat->bsp_priv = dwmac;
> +	plat->fix_mac_speed = thead_dwmac_fix_speed;
> +

> +	ret = thead_dwmac_init(pdev, plat);
> +	if (ret)
> +		goto err_remove_config_dt;
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);

This can be replaced with:
plat->init = thead_dwmac_init;
ret = devm_stmmac_pltfr_probe();

> +	if (ret)
> +		goto err_remove_config_dt;
> +
> +	return 0;
> +

> +err_remove_config_dt:
> +	stmmac_remove_config_dt(pdev, plat);
> +
> +	return ret;

This can be dropped if devm_stmmac_probe_config_dt() is utilized.

> +}
> +
> +static const struct of_device_id thead_dwmac_match[] = {

> +	{ .compatible = "thead,th1520-dwmac" },

See my comment to the bindings about the compatible string suffix.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, thead_dwmac_match);
> +
> +static struct platform_driver thead_dwmac_driver = {
> +	.probe = thead_dwmac_probe,

> +	.remove_new = stmmac_pltfr_remove,

This can be dropped if devm_stmmac_probe_config_dt() and
devm_stmmac_pltfr_probe() are utilized.

> +	.driver = {
> +		.name = "thead-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = thead_dwmac_match,
> +	},
> +};
> +module_platform_driver(thead_dwmac_driver);
> +
> +MODULE_AUTHOR("T-HEAD");
> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");

> +MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
                              ^
                              |
Capitalize? ------------------+

-Serge(y)

> +MODULE_LICENSE("GPL");
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
