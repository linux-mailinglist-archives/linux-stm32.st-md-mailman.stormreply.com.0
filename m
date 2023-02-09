Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F305690EA5
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 17:52:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E19CC6A5E9;
	Thu,  9 Feb 2023 16:52:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83225C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvGkVNR7Kt7J6/yu+Te1okCnObmv66IkihKqSceI0Dc=; b=Wj2hJZKPNL80bvox5/FV1a6sg5
 Oc+cEMQCo6GY/A4nxogX20wUKQYDJiERuH2xRHxBzBbkLuXoCsddt90ihfyDHkxWhd7PxT/5gJADB
 JH58J4KjZvv2zZVag82gdwKKWXA7HnJdgs11/UycXLdLd8IcPZIKTxX368aWP6/c1K2DeCLo2nKZv
 +6qeddXumJqwYVxsHqgcYGGlOtfutYBfLNKaxURyNPjKV4tHO21YEehqQ2pyojfoQJbRLduEvcTiF
 7rzX3GdM7Xy36SLQm7X3WSqHfGj6P1AKqclJTr9RyDRmt+MT/X+I8Sz/QNBhji4TIRYck4btkCtvQ
 36n4Xnhw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36484)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pQA9H-00089d-5m; Thu, 09 Feb 2023 16:51:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pQA9A-0004kb-Bs; Thu, 09 Feb 2023 16:51:44 +0000
Date: Thu, 9 Feb 2023 16:51:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Message-ID: <Y+UkoNpA9NiXlGmT@shell.armlinux.org.uk>
References: <20230208164203.378153-1-clement.leger@bootlin.com>
 <20230208164203.378153-6-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208164203.378153-6-clement.leger@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 5/6] net: stmmac: add support
	for RZ/N1 GMAC
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Feb 08, 2023 at 05:42:02PM +0100, Cl=E9ment L=E9ger wrote:
> Add support for Renesas RZ/N1 GMAC. This support uses a custom PCS (MIIC)
> which is handle by parsing the pcs-handle device tree property.
> =

> Signed-off-by: Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-rzn1.c  | 120 ++++++++++++++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index f77511fe4e87..be5429b7e192 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -153,6 +153,17 @@ config DWMAC_ROCKCHIP
>  	  This selects the Rockchip RK3288 SoC glue layer support for
>  	  the stmmac device driver.
>  =

> +config DWMAC_RZN1
> +	tristate "Renesas RZ/N1 dwmac support"
> +	default ARCH_RZN1
> +	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
> +	select PCS_RZN1_MIIC
> +	help
> +	  Support for Ethernet controller on Renesas RZ/N1 SoC family.
> +
> +	  This selects the Renesas RZ/N1 SoC glue layer support for
> +	  the stmmac device driver.
> +
>  config DWMAC_SOCFPGA
>  	tristate "SOCFPGA dwmac support"
>  	default ARCH_INTEL_SOCFPGA
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
> index 057e4bab5c08..53a0f74c1cb5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+=3D dwmac-meson.o dwmac-meso=
n8b.o
>  obj-$(CONFIG_DWMAC_OXNAS)	+=3D dwmac-oxnas.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+=3D dwmac-qcom-ethqos.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)	+=3D dwmac-rk.o
> +obj-$(CONFIG_DWMAC_RZN1)	+=3D dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_SOCFPGA)	+=3D dwmac-altr-socfpga.o
>  obj-$(CONFIG_DWMAC_STI)		+=3D dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)	+=3D dwmac-stm32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c b/drivers/n=
et/ethernet/stmicro/stmmac/dwmac-rzn1.c
> new file mode 100644
> index 000000000000..82118d8cb50e
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rzn1.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Schneider-Electric
> + *
> + * Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/pcs-rzn1-miic.h>
> +#include <linux/phylink.h>
> +#include <linux/platform_device.h>
> +
> +#include "stmmac_platform.h"
> +#include "stmmac.h"
> +
> +struct rzn1_dwmac {
> +	struct phylink_pcs *pcs;
> +};

I don't understand why you need this...

> +
> +static int rzn1_dt_parse(struct device *dev, struct rzn1_dwmac *dwmac)

You could pass a pointer to struct plat_stmmacenet_data into here, and
have it fill in your new ->pcs directly, and save the extra devm
allocations.

> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *pcs_node;
> +	struct phylink_pcs *pcs;
> +	int ret;
> +
> +	pcs_node =3D of_parse_phandle(np, "pcs-handle", 0);
> +	if (!pcs_node)
> +		return 0;
> +
> +	pcs =3D miic_create(dev, pcs_node);

Don't you need to put pcs_node?

> +	if (IS_ERR(pcs))
> +		return PTR_ERR(pcs);
> +
> +	ret =3D miic_early_setup(pcs, dev);
> +	if (ret) {
> +		miic_destroy(pcs);
> +		return ret;
> +	}
> +
> +	dwmac->pcs =3D pcs;
> +
> +	return 0;
> +}
> +
> +static int rzn1_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev =3D &pdev->dev;
> +	struct rzn1_dwmac *dwmac;
> +	int ret;
> +
> +	ret =3D stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	plat_dat =3D stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	dwmac =3D devm_kzalloc(dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac) {
> +		ret =3D -ENOMEM;
> +		goto err_remove_config_dt;
> +	}
> +
> +	ret =3D rzn1_dt_parse(dev, dwmac);
> +	if (ret)
> +		goto err_remove_config_dt;
> +
> +	plat_dat->bsp_priv =3D dwmac;

You could set this to point back to plat_dat.

> +	plat_dat->pcs =3D dwmac->pcs;
> +
> +	ret =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> +	if (ret)
> +		goto err_free_pcs;
> +
> +	return 0;
> +
> +err_free_pcs:
> +	if (dwmac->pcs)
> +		miic_destroy(dwmac->pcs);
> +
> +err_remove_config_dt:
> +	stmmac_remove_config_dt(pdev, plat_dat);
> +
> +	return ret;
> +}
> +
> +static int rzn1_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct rzn1_dwmac *dwmac =3D get_stmmac_bsp_priv(&pdev->dev);

... which means you get plat_dat back here...

> +	int ret =3D stmmac_dvr_remove(&pdev->dev);
> +
> +	if (dwmac->pcs)
> +		miic_destroy(dwmac->pcs);

and can still destroy the pcs.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
