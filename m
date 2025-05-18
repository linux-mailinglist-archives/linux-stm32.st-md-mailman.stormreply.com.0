Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B015BABACF7
	for <lists+linux-stm32@lfdr.de>; Sun, 18 May 2025 03:12:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59C53C7128F;
	Sun, 18 May 2025 01:12:49 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46EBDCFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 May 2025 01:12:48 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-476ae781d21so35582931cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 May 2025 18:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747530767; x=1748135567;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Stj7XRN1t+oCrImVFuhpTiatxFSWHyiqWK4ar3jhLs=;
 b=RSAti+eDe5FWiHBgl1EKJ8kNCk8uODrYTO0sJa780ummMA63BQD+EfvTOrOv0OwjVB
 5iLU49PPuXs6CYSiViXIrUGjMCf0VJ//FTEWnn/9HozE6JjgK/qdeZq6N1dbz9PkFYNn
 lN7Llu/GK3OA4LjPu3JaD1dPqcm46aiPxO3zI3PTfs8SxjQRDRYI/zQG8XvZGetJCdZb
 ZXzzYR2/krzX8nX+3Lv44Q0L529JawIdpdwvTy9ha34BqNIweSLfH3ygQVFc0n/Z6QcB
 6q8ktDiXPdk5WcApYXSd+Dfx/ehymXoErdW1fUT9r6jairNKinzqQphirzgNKrNC8rMO
 VRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747530767; x=1748135567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Stj7XRN1t+oCrImVFuhpTiatxFSWHyiqWK4ar3jhLs=;
 b=L+L2wV4OgkeTBCWH+ac+kllM3CLvqDjK6ccyJNtmpMHLpXs9H6uF4HuAESrI1JXWds
 FxwptcV2wwneYCiJtf1LKl1gLolX+BOdBg9cXMo0kg0T1JVXUJcr/r7FndEfCfWhv7zB
 IUsSgLtmqAJfKCbmRxSMsaVY1hcTFLfH6VKqriIvSkyW/MJxI47GiwQ6mPgXVDpE0qzs
 +VttrmUpGhci8tq6KjzzvXqNvoAYsmoPf0GvQcxE7NhWSy7M4aI4eOxJgQtsWAyXoOqL
 plfhryWgdlHUscovhNx87iVRbEQ/wFx+Ce3XDfhYNX/QJmCrR5LhzVO9Ev3hknCHpKU/
 mMgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcDjp4rMYcz2fjxwMYKnNIE1v4PJy87wVsKzEGRt7YB0KzesvCfqdDrAdq/xZ6lfMO6Xqa1ecMC0pSVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkIaLGeWz8mJlJJpjl1yVQ7M+TXOJ2hpyjfJRVlFI2kwDIWfdA
 aFyzL12plY2M2iaomDv5ABFJbjkHC7dbi36IC7KRohVi5Kyp0PTITwsG
X-Gm-Gg: ASbGncugpQYkgyWfm/YFRXFbggS8pMNi0KdB2DCZ6nAX9g170ZT3kyMlOfJ7SVOSe57
 m5ryTKx/b/HvwnRGqSM8IxXIsn2onVeLVr/KzdxePLBUqf4oiGDDqicpFjOk36LTtOV8WcxVgTs
 VObY2zJxhu3xIui6Zw5PvM6IaE1RA7jhGypahFpqJmc+OAOg9qydaWKSxRnL56f3Kg8d9QueKRW
 xxvaSJVoC2y/OmkkvpdeR/HF9PHL6vkajUB1Za4PgOrkqwlxFo/s041CTp/a7BVcP+dHXNgRJ/T
 phYr+NAjB300NCmLrGWcMyDtt3k=
X-Google-Smtp-Source: AGHT+IEqpUoSLF4xMgehWhpJ/51Ri1bqGkDmQ3BY1ft3floCcjBj/opJDzbop8Lbtw0QfROAzDbS7A==
X-Received: by 2002:a05:622a:5c1a:b0:476:8eb5:1669 with SMTP id
 d75a77b69052e-494b0939b32mr148900261cf.32.1747530766850; 
 Sat, 17 May 2025 18:12:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-494ae528b60sm32316441cf.74.2025.05.17.18.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 18:12:46 -0700 (PDT)
Date: Sun, 18 May 2025 09:12:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 richardcochran@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, 
 p.zabel@pengutronix.de, yong.liang.choong@linux.intel.com,
 rmk+kernel@armlinux.org.uk, 
 jszhang@kernel.org, inochiama@gmail.com, jan.petrous@oss.nxp.com, 
 dfustini@tenstorrent.com, 0x1207@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
Message-ID: <6rzz5snt5c5flvqj7fgunfn73pw2r2iklns2cdunx2gjl7mtab@hxa5nsuk63no>
References: <20250516010849.784-1-weishangjuan@eswincomputing.com>
 <20250516011130.818-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516011130.818-1-weishangjuan@eswincomputing.com>
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v1 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

On Fri, May 16, 2025 at 09:11:28AM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add Ethernet controller support for Eswin's eic7700 SoC. The driver
> provides management and control of Ethernet signals for the eiC7700
> series chips.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 521 ++++++++++++++++++
>  3 files changed, 533 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..6a3970c92db7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -66,6 +66,17 @@ config DWMAC_ANARION
>  
>  	  This selects the Anarion SoC glue layer support for the stmmac driver.
>  
> +config DWMAC_EIC7700
> +	tristate "Support for Eswin eic7700 ethernet driver"
> +	select CRC32
> +	select MII
> +	depends on OF && HAS_DMA && ARCH_ESWIN || COMPILE_TEST
> +	help
> +	  This driver supports the Eswin EIC7700 Ethernet controller,
> +	  which integrates Synopsys DesignWare QoS features. It enables
> +	  high-speed networking with DMA acceleration and is optimized
> +	  for embedded systems.
> +
>  config DWMAC_INGENIC
>  	tristate "Ingenic MAC support"
>  	default MACH_INGENIC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 594883fb4164..c9279bafdbb1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -14,6 +14,7 @@ stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
>  # Ordering matters. Generic driver must be last.
>  obj-$(CONFIG_STMMAC_PLATFORM)	+= stmmac-platform.o
>  obj-$(CONFIG_DWMAC_ANARION)	+= dwmac-anarion.o
> +obj-$(CONFIG_DWMAC_EIC7700)	+= dwmac-eic7700.o
>  obj-$(CONFIG_DWMAC_INGENIC)	+= dwmac-ingenic.o
>  obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
>  obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> new file mode 100644
> index 000000000000..3483827e5652
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -0,0 +1,521 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Eswin DWC Ethernet linux driver
> + *
> + * Authors: Shuang Liang <liangshuang@eswincomputing.com>
> + * Shangjuan Wei <weishangjuan@eswincomputing.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/ethtool.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/stmmac.h>
> +#include "stmmac_platform.h"
> +#include "dwmac4.h"
> +#include <linux/mfd/syscon.h>
> +#include <linux/bitfield.h>
> +#include <linux/regmap.h>
> +#include <linux/gpio/consumer.h>
> +
> +/* eth_phy_ctrl_offset eth0:0x100; eth1:0x200 */
> +#define ETH_TX_CLK_SEL			BIT(16)
> +#define ETH_PHY_INTF_SELI		BIT(0)
> +
> +/* eth_axi_lp_ctrl_offset eth0:0x108; eth1:0x208 */
> +#define ETH_CSYSREQ_VAL			BIT(0)
> +
> +/* hsp_aclk_ctrl_offset (0x148) */
> +#define HSP_ACLK_CLKEN				BIT(31)
> +#define HSP_ACLK_DIVSOR				(0x2 << 4)
> +
> +/* hsp_cfg_ctrl_offset (0x14c) */
> +#define HSP_CFG_CLKEN			BIT(31)
> +#define SCU_HSP_PCLK_EN			BIT(30)
> +#define HSP_CFG_CTRL_REGSET		(HSP_CFG_CLKEN | SCU_HSP_PCLK_EN)
> +
> +/* RTL8211F PHY Configurations for LEDs */
> +#define PHY_ADDR				0
> +#define PHY_PAGE_SWITCH_REG		31
> +#define PHY_LED_CFG_REG			16
> +#define PHY_LED_PAGE_CFG		0xd04
> +
> +struct dwc_qos_priv {
> +	struct device *dev;
> +	int dev_id;
> +	struct regmap *crg_regmap;
> +	struct regmap *hsp_regmap;
> +	struct reset_control *rst;
> +	struct clk *clk_app;
> +	struct clk *clk_tx;
> +	struct gpio_desc *phy_reset;
> +	struct stmmac_priv *stmpriv;
> +	int phyled_cfgs[3];
> +	int phyaddr;
> +	unsigned int dly_hsp_reg[3];
> +	unsigned int dly_param_1000m[3];
> +	unsigned int dly_param_100m[3];
> +	unsigned int dly_param_10m[3];
> +};
> +
> +static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
> +				   struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 burst_map = 0;
> +	u32 bit_index = 0;
> +	u32 a_index = 0;
> +
> +	if (!plat_dat->axi) {
> +		plat_dat->axi = kzalloc(sizeof(*plat_dat->axi), GFP_KERNEL);
> +
> +		if (!plat_dat->axi)
> +			return -ENOMEM;
> +	}
> +
> +	plat_dat->axi->axi_lpi_en = device_property_read_bool(dev,
> +							      "snps,en-lpi");
> +	if (device_property_read_u32(dev, "snps,write-requests",
> +				     &plat_dat->axi->axi_wr_osr_lmt)) {
> +		/**
> +		 * Since the register has a reset value of 1, if property
> +		 * is missing, default to 1.
> +		 */
> +		plat_dat->axi->axi_wr_osr_lmt = 1;
> +	} else {
> +		/**
> +		 * If property exists, to keep the behavior from dwc_eth_qos,
> +		 * subtract one after parsing.
> +		 */
> +		plat_dat->axi->axi_wr_osr_lmt--;
> +	}
> +
> +	if (device_property_read_u32(dev, "snps,read-requests",
> +				     &plat_dat->axi->axi_rd_osr_lmt)) {
> +		/**
> +		 * Since the register has a reset value of 1, if property
> +		 * is missing, default to 1.
> +		 */
> +		plat_dat->axi->axi_rd_osr_lmt = 1;
> +	} else {
> +		/**
> +		 * If property exists, to keep the behavior from dwc_eth_qos,
> +		 * subtract one after parsing.
> +		 */
> +		plat_dat->axi->axi_rd_osr_lmt--;
> +	}
> +	device_property_read_u32(dev, "snps,burst-map", &burst_map);
> +
> +	/* converts burst-map bitmask to burst array */
> +	for (bit_index = 0; bit_index < 7; bit_index++) {
> +		if (burst_map & (1 << bit_index)) {
> +			switch (bit_index) {
> +			case 0:
> +			plat_dat->axi->axi_blen[a_index] = 4; break;
> +			case 1:
> +			plat_dat->axi->axi_blen[a_index] = 8; break;
> +			case 2:
> +			plat_dat->axi->axi_blen[a_index] = 16; break;
> +			case 3:
> +			plat_dat->axi->axi_blen[a_index] = 32; break;
> +			case 4:
> +			plat_dat->axi->axi_blen[a_index] = 64; break;
> +			case 5:
> +			plat_dat->axi->axi_blen[a_index] = 128; break;
> +			case 6:
> +			plat_dat->axi->axi_blen[a_index] = 256; break;
> +			default:
> +			break;
> +			}
> +			a_index++;
> +		}
> +	}
> +
> +	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
> +	plat_dat->has_gmac4 = 1;
> +	plat_dat->dma_cfg->aal = 1;
> +	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
> +	plat_dat->pmt = 1;
> +
> +	return 0;
> +}
> +

> +static void dwc_qos_fix_speed(void *priv, int speed, unsigned int mode)
> +{
> +	unsigned long rate = 125000000;
> +	int i, err, data = 0;
> +	struct dwc_qos_priv *dwc_priv = (struct dwc_qos_priv *)priv;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		rate = 125000000;
> +
> +		for (i = 0; i < 3; i++)
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_1000m[i]);
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[0]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	case SPEED_100:
> +		rate = 25000000;
> +
> +		for (i = 0; i < 3; i++) {
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_100m[i]);
> +		}
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[1]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	case SPEED_10:
> +		rate = 2500000;
> +
> +		for (i = 0; i < 3; i++) {
> +			regmap_write(dwc_priv->hsp_regmap,
> +				     dwc_priv->dly_hsp_reg[i],
> +				     dwc_priv->dly_param_10m[i]);
> +		}
> +
> +		if (dwc_priv->stmpriv) {
> +			data = mdiobus_read(dwc_priv->stmpriv->mii, PHY_ADDR,
> +					    PHY_PAGE_SWITCH_REG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, PHY_LED_PAGE_CFG);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_LED_CFG_REG, dwc_priv->phyled_cfgs[2]);
> +			mdiobus_write(dwc_priv->stmpriv->mii, PHY_ADDR,
> +				      PHY_PAGE_SWITCH_REG, data);
> +		}
> +
> +		break;
> +	default:
> +		dev_err(dwc_priv->dev, "invalid speed %u\n", speed);
> +		break;
> +	}
> +
> +	err = clk_set_rate(dwc_priv->clk_tx, rate);
> +	if (err < 0)
> +		dev_err(dwc_priv->dev, "failed to set TX rate: %d\n", err);
> +}

check set_clk_tx_rate, and replace this with stmmac_set_clk_tx_rate
if possible.

> +
> +static int dwc_qos_probe(struct platform_device *pdev,
> +			 struct plat_stmmacenet_data *plat_dat,
> +			 struct stmmac_resources *stmmac_res)
> +{
> +	struct dwc_qos_priv *dwc_priv;
> +	int ret;
> +	int err;
> +	u32 hsp_aclk_ctrl_offset;
> +	u32 hsp_aclk_ctrl_regset;
> +	u32 hsp_cfg_ctrl_offset;
> +	u32 eth_axi_lp_ctrl_offset;
> +	u32 eth_phy_ctrl_offset;
> +	u32 eth_phy_ctrl_regset;
> +
> +	dwc_priv = devm_kzalloc(&pdev->dev, sizeof(*dwc_priv), GFP_KERNEL);
> +	if (!dwc_priv)
> +		return -ENOMEM;
> +
> +	if (device_property_read_u32(&pdev->dev, "id", &dwc_priv->dev_id)) {
> +		dev_err(&pdev->dev, "Can not read device id!\n");
> +		return -EINVAL;
> +	}
> +
> +	dwc_priv->dev = &pdev->dev;
> +	dwc_priv->phy_reset = devm_gpiod_get(&pdev->dev, "rst", GPIOD_OUT_LOW);
> +	if (IS_ERR(dwc_priv->phy_reset)) {
> +		dev_err(&pdev->dev, "Reset gpio not specified\n");
> +		return -EINVAL;
> +	}
> +
> +	gpiod_set_value(dwc_priv->phy_reset, 0);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 0,
> +					 &dwc_priv->phyled_cfgs[0]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get phyaddr (%d)\n", ret);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 0,
> +					 &dwc_priv->phyled_cfgs[0]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 1Gbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 1,
> +					 &dwc_priv->phyled_cfgs[1]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 100Mbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,led-cfgs", 2,
> +					 &dwc_priv->phyled_cfgs[2]);
> +	if (ret)
> +		dev_warn(&pdev->dev, "can't get led cfgs for 10Mbps mode (%d)\n", ret);
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "eswin,dly_hsp_reg",
> +						  &dwc_priv->dly_hsp_reg[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay hsp reg.ret(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-1000m",
> +						  &dwc_priv->dly_param_1000m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 1Gbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-100m",
> +						  &dwc_priv->dly_param_100m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 100Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_variable_u32_array(pdev->dev.of_node, "dly-param-10m",
> +						  &dwc_priv->dly_param_10m[0], 3, 0);
> +	if (ret != 3) {
> +		dev_err(&pdev->dev, "can't get delay param for 10Mbps mode (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	dwc_priv->crg_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							       "eswin,syscrg_csr");
> +	if (IS_ERR(dwc_priv->crg_regmap)) {
> +		dev_dbg(&pdev->dev, "No syscrg_csr phandle specified\n");
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 1,
> +					 &hsp_aclk_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get hsp_aclk_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_read(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, &hsp_aclk_ctrl_regset);
> +	hsp_aclk_ctrl_regset |= (HSP_ACLK_CLKEN | HSP_ACLK_DIVSOR);
> +	regmap_write(dwc_priv->crg_regmap, hsp_aclk_ctrl_offset, hsp_aclk_ctrl_regset);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,syscrg_csr", 2,
> +					 &hsp_cfg_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get hsp_cfg_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_write(dwc_priv->crg_regmap, hsp_cfg_ctrl_offset, HSP_CFG_CTRL_REGSET);
> +
> +	dwc_priv->hsp_regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +							       "eswin,hsp_sp_csr");
> +	if (IS_ERR(dwc_priv->hsp_regmap)) {
> +		dev_dbg(&pdev->dev, "No hsp_sp_csr phandle specified\n");
> +		return 0;
> +	}
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 2,
> +					 &eth_phy_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get eth_phy_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_read(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, &eth_phy_ctrl_regset);
> +	eth_phy_ctrl_regset |= (ETH_TX_CLK_SEL | ETH_PHY_INTF_SELI);
> +	regmap_write(dwc_priv->hsp_regmap, eth_phy_ctrl_offset, eth_phy_ctrl_regset);
> +
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "eswin,hsp_sp_csr", 3,
> +					 &eth_axi_lp_ctrl_offset);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't get eth_axi_lp_ctrl_offset (%d)\n", ret);
> +		return ret;
> +	}
> +	regmap_write(dwc_priv->hsp_regmap, eth_axi_lp_ctrl_offset, ETH_CSYSREQ_VAL);
> +
> +	dwc_priv->clk_app = devm_clk_get(&pdev->dev, "app");
> +	if (IS_ERR(dwc_priv->clk_app)) {
> +		dev_err(&pdev->dev, "app clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_app);
> +	}
> +
> +	err = clk_prepare_enable(dwc_priv->clk_app);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable app clock: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	dwc_priv->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +	if (IS_ERR(plat_dat->pclk)) {
> +		dev_err(&pdev->dev, "tx clock not found.\n");
> +		return PTR_ERR(dwc_priv->clk_tx);
> +	}
> +
> +	err = clk_prepare_enable(dwc_priv->clk_tx);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to enable tx clock: %d\n", err);
> +		return err;
> +	}
> +	dwc_priv->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, "ethrst");
> +	if (IS_ERR(dwc_priv->rst))
> +		return PTR_ERR(dwc_priv->rst);
> +
> +	ret = reset_control_assert(dwc_priv->rst);
> +	WARN_ON(ret != 0);
> +	ret = reset_control_deassert(dwc_priv->rst);
> +	WARN_ON(ret != 0);
> +
> +	plat_dat->fix_mac_speed = dwc_qos_fix_speed;
> +	plat_dat->bsp_priv = dwc_priv;
> +	plat_dat->phy_addr = PHY_ADDR;
> +
> +	return 0;
> +}
> +
> +static int dwc_qos_remove(struct platform_device *pdev)
> +{
> +	struct dwc_qos_priv *dwc_priv = get_stmmac_bsp_priv(&pdev->dev);
> +
> +	reset_control_assert(dwc_priv->rst);
> +	clk_disable_unprepare(dwc_priv->clk_tx);
> +	clk_disable_unprepare(dwc_priv->clk_app);
> +
> +	devm_gpiod_put(&pdev->dev, dwc_priv->phy_reset);
> +
> +	return 0;
> +}
> +
> +struct dwc_eth_dwmac_data {
> +	int (*probe)(struct platform_device *pdev,
> +		     struct plat_stmmacenet_data *data,
> +		     struct stmmac_resources *res);
> +	int (*remove)(struct platform_device *pdev);
> +};
> +
> +static const struct dwc_eth_dwmac_data dwc_qos_data = {
> +	.probe = dwc_qos_probe,
> +	.remove = dwc_qos_remove,
> +};
> +
> +static int dwc_eth_dwmac_probe(struct platform_device *pdev)
> +{
> +	const struct dwc_eth_dwmac_data *data;
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct net_device *ndev = NULL;
> +	struct stmmac_priv *stmpriv = NULL;
> +	struct dwc_qos_priv *dwc_priv = NULL;
> +	int ret;
> +
> +	data = device_get_match_data(&pdev->dev);
> +
> +	memset(&stmmac_res, 0, sizeof(struct stmmac_resources));
> +
> +	/**
> +	 * Since stmmac_platform supports name IRQ only, basic platform
> +	 * resource initialization is done in the glue logic.
> +	 */
> +	stmmac_res.irq = platform_get_irq(pdev, 0);
> +	if (stmmac_res.irq < 0)
> +		return stmmac_res.irq;
> +	stmmac_res.wol_irq = stmmac_res.irq;
> +	stmmac_res.addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(stmmac_res.addr))
> +		return PTR_ERR(stmmac_res.addr);
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	ret = data->probe(pdev, plat_dat, &stmmac_res);
> +	if (ret < 0) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to probe subdriver: %d\n",
> +				ret);
> +
> +		return ret;
> +	}
> +
> +	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
> +	if (ret)
> +		goto remove;
> +
> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +	if (ret)
> +		goto remove;
> +
> +	ndev = dev_get_drvdata(&pdev->dev);
> +	stmpriv = netdev_priv(ndev);
> +	dwc_priv = (struct dwc_qos_priv *)plat_dat->bsp_priv;
> +	dwc_priv->stmpriv = stmpriv;
> +
> +	return ret;
> +
> +remove:
> +	data->remove(pdev);
> +
> +	return ret;
> +}
> +
> +static void dwc_eth_dwmac_remove(struct platform_device *pdev)
> +{
> +	const struct dwc_eth_dwmac_data *data;
> +	int err;
> +
> +	data = device_get_match_data(&pdev->dev);
> +
> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	err = data->remove(pdev);
> +	if (err < 0)
> +		dev_err(&pdev->dev, "failed to remove subdriver: %d\n", err);
> +}
> +
> +static const struct of_device_id dwc_eth_dwmac_match[] = {
> +	{ .compatible = "eswin,eic7700-qos-eth", .data = &dwc_qos_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dwc_eth_dwmac_match);
> +

Use common stammac helper for you code, do not do this by yourself!!!
The only thing you should add is the vendor specific logic, not the
common one for the stmmac driver.

> +static struct platform_driver eic7700_eth_dwmac_driver = {
> +	.probe  = dwc_eth_dwmac_probe,
> +	.remove = dwc_eth_dwmac_remove,
> +	.driver = {
> +		.name           = "eic7700-eth-dwmac",
> +		.pm             = &stmmac_pltfr_pm_ops,
> +		.of_match_table = dwc_eth_dwmac_match,
> +	},
> +};
> +module_platform_driver(eic7700_eth_dwmac_driver);
> +
> +MODULE_AUTHOR("Eswin");
> +MODULE_AUTHOR("Shuang Liang <liangshuang@eswincomputing.com>");
> +MODULE_AUTHOR("Shangjuan Wei <weishangjuan@eswincomputing.com>");
> +MODULE_DESCRIPTION("Eswin eic7700 qos ethernet driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
