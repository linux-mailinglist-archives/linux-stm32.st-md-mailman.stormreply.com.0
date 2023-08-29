Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B228978C459
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Aug 2023 14:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 377F5C6A613;
	Tue, 29 Aug 2023 12:38:37 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550F2C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Aug 2023 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1693312715; x=1724848715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jzzpEtb6XFqiO15vT81Dtv6J1/Ecg0IfN8+3JmYrhk=;
 b=k23l/Jmr2YT3I44MZjxwwkyWj7UNP2o6VmLsAh3r0PcLGWd7Hw5mxj8K
 c/xFsfheJLkb8jPCmhJRZCMf+nrgdiRBZop93lK5SRaIMqCfkuVYtYT5p
 Es02guNzPBvt2pNKM/kBjWYrTMkMPRNWxWlE94nMTE3s0wFysgTVyDL4d
 8ViSshgWlqbmDPsh+jJnb+xt+jUzbhcy5kD+WKDkraGHkm0IXk1kRzepS
 ljpWP2xOULC0xqWw/L1DXeHBxyAYpBlMG3LKDBZvqAPlpettQKpENfeeT
 p31mYWpMwIVD9BJNPxZIrZT4IRES3KR87+gH9PYGWN6W0csuPTwFGic2u g==;
X-IronPort-AV: E=Sophos;i="6.02,210,1688421600"; d="scan'208";a="32677373"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 29 Aug 2023 14:38:34 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F3295280045;
 Tue, 29 Aug 2023 14:38:33 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 29 Aug 2023 14:38:33 +0200
Message-ID: <12274852.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Feiyang Chen <chenfeiyang@loongson.cn>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: clarify difference
	between "interface" and "phy_interface"
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

Hi Russel,

Am Samstag, 26. August 2023, 12:02:51 CEST schrieb Russell King (Oracle):
> Clarify the difference between "interface" and "phy_interface" in
> struct plat_stmmacenet_data, both by adding a comment, and also
> renaming "interface" to be "mac_interface". The difference between
> these are:
> =

>  MAC ----- optional PCS ----- SerDes ----- optional PHY ----- Media
>        ^                               ^
>  mac_interface                   phy_interface
> =

> Note that phylink currently only deals with phy_interface.
> =

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> =

> One last patch before Sunday - I would like to get this merged as it
> touches multiple stmmac platforms before any further are added.
> =

> This patch merely renames the "plat_dat->interface" to "->mac_interface"
> but doesn't change which any code uses.
> =

> All code which uses plat->interface (now plat->mac_interface) are
> determining the interface from the MAC side not the PHY side. These
> need a code review against the docs to check whether that is correct.
> Essentially, every .c file touched by this needs a code review. This
> code review should not affect whether this patch is merged.
> =

>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 14 ++++++-------
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 20 +++++++++----------
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  4 ++--
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  |  4 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c |  8 ++++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +++---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 ++++--
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  6 +++---
>  include/linux/stmmac.h                        | 15 +++++++++++++-
>  12 files changed, 52 insertions(+), 37 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c index
> 535856fffaea..df34e34cc14f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -70,7 +70,7 @@ static int imx8mp_set_intf_mode(struct
> plat_stmmacenet_data *plat_dat) struct imx_priv_data *dwmac =3D
> plat_dat->bsp_priv;
>  	int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		val =3D GPR_ENET_QOS_INTF_SEL_MII;
>  		break;
> @@ -87,7 +87,7 @@ static int imx8mp_set_intf_mode(struct
> plat_stmmacenet_data *plat_dat) break;
>  	default:
>  		pr_debug("imx dwmac doesn't support %d interface\n",
> -			 plat_dat->interface);
> +			 plat_dat->mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -110,7 +110,7 @@ static int imx93_set_intf_mode(struct
> plat_stmmacenet_data *plat_dat) struct imx_priv_data *dwmac =3D
> plat_dat->bsp_priv;
>  	int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		val =3D MX93_GPR_ENET_QOS_INTF_SEL_MII;
>  		break;
> @@ -125,7 +125,7 @@ static int imx93_set_intf_mode(struct
> plat_stmmacenet_data *plat_dat) break;
>  	default:
>  		dev_dbg(dwmac->dev, "imx dwmac doesn't support %d =

interface\n",
> -			 plat_dat->interface);
> +			 plat_dat->mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -192,8 +192,8 @@ static void imx_dwmac_fix_speed(void *priv, unsigned =
int
> speed, unsigned int mod plat_dat =3D dwmac->plat_dat;
> =

>  	if (dwmac->ops->mac_rgmii_txclk_auto_adj ||
> -	    (plat_dat->interface =3D=3D PHY_INTERFACE_MODE_RMII) ||
> -	    (plat_dat->interface =3D=3D PHY_INTERFACE_MODE_MII))
> +	    (plat_dat->mac_interface =3D=3D PHY_INTERFACE_MODE_RMII) ||
> +	    (plat_dat->mac_interface =3D=3D PHY_INTERFACE_MODE_MII))
>  		return;
> =

>  	switch (speed) {
> @@ -260,7 +260,7 @@ static int imx_dwmac_mx93_reset(void *priv, void __io=
mem
> *ioaddr) value |=3D DMA_BUS_MODE_SFT_RESET;
>  	writel(value, ioaddr + DMA_BUS_MODE);
> =

> -	if (plat_dat->interface =3D=3D PHY_INTERFACE_MODE_RMII) {
> +	if (plat_dat->mac_interface =3D=3D PHY_INTERFACE_MODE_RMII) {
>  		usleep_range(100, 200);
>  		writel(RMII_RESET_SPEED, ioaddr + MAC_CTRL_REG);
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c index
> e22ef0d6bc73..0a20c3d24722 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -89,7 +89,7 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_d=
ata
> *plat_dat) struct ingenic_mac *mac =3D plat_dat->bsp_priv;
>  	unsigned int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		val =3D FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, =

MACPHYC_TXCLK_SEL_INPUT) |
>  			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, =

MACPHYC_PHY_INFT_MII);
> @@ -118,7 +118,7 @@ static int jz4775_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) break;
> =

>  	default:
> -		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>interface);
> +		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -130,13 +130,13 @@ static int x1000_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) {
>  	struct ingenic_mac *mac =3D plat_dat->bsp_priv;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		dev_dbg(mac->dev, "MAC PHY Control Register: =

PHY_INTERFACE_MODE_RMII\n");
> break;
> =

>  	default:
> -		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>interface);
> +		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -149,14 +149,14 @@ static int x1600_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) struct ingenic_mac *mac =3D
> plat_dat->bsp_priv;
>  	unsigned int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val =3D FIELD_PREP(MACPHYC_PHY_INFT_MASK, =

MACPHYC_PHY_INFT_RMII);
>  		dev_dbg(mac->dev, "MAC PHY Control Register: =

PHY_INTERFACE_MODE_RMII\n");
> break;
> =

>  	default:
> -		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>interface);
> +		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -169,7 +169,7 @@ static int x1830_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) struct ingenic_mac *mac =3D
> plat_dat->bsp_priv;
>  	unsigned int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val =3D FIELD_PREP(MACPHYC_MODE_SEL_MASK, =

MACPHYC_MODE_SEL_RMII) |
>  			  FIELD_PREP(MACPHYC_PHY_INFT_MASK, =

MACPHYC_PHY_INFT_RMII);
> @@ -177,7 +177,7 @@ static int x1830_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) break;
> =

>  	default:
> -		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>interface);
> +		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>mac_interface);
>  		return -EINVAL;
>  	}
> =

> @@ -190,7 +190,7 @@ static int x2000_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) struct ingenic_mac *mac =3D
> plat_dat->bsp_priv;
>  	unsigned int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val =3D FIELD_PREP(MACPHYC_TX_SEL_MASK, =

MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, =

MACPHYC_RX_SEL_ORIGIN) |
> @@ -220,7 +220,7 @@ static int x2000_mac_set_mode(struct
> plat_stmmacenet_data *plat_dat) break;
> =

>  	default:
> -		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>interface);
> +		dev_err(mac->dev, "Unsupported interface %d", plat_dat-
>mac_interface);
>  		return -EINVAL;
>  	}
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c index
> a25c187d3185..2cd6fce5c993 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -117,7 +117,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev,
> const struct pci_device_id }
> =

>  	plat->phy_interface =3D phy_mode;
> -	plat->interface =3D PHY_INTERFACE_MODE_GMII;
> +	plat->mac_interface =3D PHY_INTERFACE_MODE_GMII;
> =

>  	pci_set_master(pdev);
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c index
> 18e84ba693a6..d0aa674ce705 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c
> @@ -50,9 +50,9 @@ static int lpc18xx_dwmac_probe(struct platform_device
> *pdev) goto err_remove_config_dt;
>  	}
> =

> -	if (plat_dat->interface =3D=3D PHY_INTERFACE_MODE_MII) {
> +	if (plat_dat->mac_interface =3D=3D PHY_INTERFACE_MODE_MII) {
>  		ethmode =3D LPC18XX_CREG_CREG6_ETHMODE_MII;
> -	} else if (plat_dat->interface =3D=3D PHY_INTERFACE_MODE_RMII) {
> +	} else if (plat_dat->mac_interface =3D=3D PHY_INTERFACE_MODE_RMII) {
>  		ethmode =3D LPC18XX_CREG_CREG6_ETHMODE_RMII;
>  	} else {
>  		dev_err(&pdev->dev, "Only MII and RMII mode supported\n");
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c index
> 7580077383c0..cd796ec04132 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -587,7 +587,7 @@ static int mediatek_dwmac_common_data(struct
> platform_device *pdev, {
>  	int i;
> =

> -	plat->interface =3D priv_plat->phy_mode;
> +	plat->mac_interface =3D priv_plat->phy_mode;
>  	if (priv_plat->mac_wol)
>  		plat->flags |=3D STMMAC_FLAG_USE_PHY_WOL;
>  	else
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c index
> 7db176e8691f..9bf102bbc6a0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -236,7 +236,7 @@ static int socfpga_get_plat_phymode(struct socfpga_dw=
mac
> *dwmac) struct net_device *ndev =3D dev_get_drvdata(dwmac->dev);
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> =

> -	return priv->plat->interface;
> +	return priv->plat->mac_interface;
>  }
> =

>  static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enabl=
e)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c index
> 892612564694..9289bb87c3e3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -60,7 +60,7 @@ static int starfive_dwmac_set_mode(struct
> plat_stmmacenet_data *plat_dat) unsigned int mode;
>  	int err;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		mode =3D STARFIVE_DWMAC_PHY_INFT_RMII;
>  		break;
> @@ -72,7 +72,7 @@ static int starfive_dwmac_set_mode(struct
> plat_stmmacenet_data *plat_dat)
> =

>  	default:
>  		dev_err(dwmac->dev, "unsupported interface %d\n",
> -			plat_dat->interface);
> +			plat_dat->mac_interface);
>  		return -EINVAL;
>  	}
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c index
> 3a09085819dc..26ea8c687881 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -171,7 +171,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_d=
ata
> *plat_dat)
> =

>  	clk_rate =3D clk_get_rate(dwmac->clk_eth_ck);
>  	dwmac->enable_eth_ck =3D false;
> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		if (clk_rate =3D=3D ETH_CK_F_25M && dwmac->ext_phyclk)
>  			dwmac->enable_eth_ck =3D true;
> @@ -210,7 +210,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_d=
ata
> *plat_dat) break;
>  	default:
>  		pr_debug("SYSCFG init :  Do not manage %d interface\n",
> -			 plat_dat->interface);
> +			 plat_dat->mac_interface);
>  		/* Do not manage others interfaces */
>  		return -EINVAL;
>  	}
> @@ -230,7 +230,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_d=
ata
> *plat_dat) u32 reg =3D dwmac->mode_reg;
>  	int val;
> =

> -	switch (plat_dat->interface) {
> +	switch (plat_dat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		val =3D SYSCFG_MCU_ETH_SEL_MII;
>  		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
> @@ -241,7 +241,7 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_d=
ata
> *plat_dat) break;
>  	default:
>  		pr_debug("SYSCFG init :  Do not manage %d interface\n",
> -			 plat_dat->interface);
> +			 plat_dat->mac_interface);
>  		/* Do not manage others interfaces */
>  		return -EINVAL;
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c index
> c23420863a8d..01e77368eef1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1016,7 +1016,7 @@ static int sun8i_dwmac_set_syscon(struct device *de=
v,
>  	if (gmac->variant->support_rmii)
>  		reg &=3D ~SYSCON_RMII_EN;
> =

> -	switch (plat->interface) {
> +	switch (plat->mac_interface) {
>  	case PHY_INTERFACE_MODE_MII:
>  		/* default */
>  		break;
> @@ -1031,7 +1031,7 @@ static int sun8i_dwmac_set_syscon(struct device *de=
v,
>  		break;
>  	default:
>  		dev_err(dev, "Unsupported interface mode: %s",
> -			phy_modes(plat->interface));
> +			phy_modes(plat->mac_interface));
>  		return -EINVAL;
>  	}
> =

> @@ -1231,7 +1231,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) /* platform data specifying hardware features and callbacks.
>  	 * hardware features were copied from Allwinner drivers.
>  	 */
> -	plat_dat->interface =3D interface;
> +	plat_dat->mac_interface =3D interface;
>  	plat_dat->rx_coe =3D STMMAC_RX_COE_TYPE2;
>  	plat_dat->tx_coe =3D 1;
>  	plat_dat->flags |=3D STMMAC_FLAG_HAS_SUN8I;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c index
> e52ae165c968..c92bab6e2341 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1119,7 +1119,7 @@ static const struct phylink_mac_ops
> stmmac_phylink_mac_ops =3D { */
>  static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
>  {
> -	int interface =3D priv->plat->interface;
> +	int interface =3D priv->plat->mac_interface;
> =

>  	if (priv->dma_cap.pcs) {
>  		if ((interface =3D=3D PHY_INTERFACE_MODE_RGMII) ||
> @@ -1214,7 +1214,9 @@ static int stmmac_phy_setup(struct stmmac_priv *pri=
v)
>  		priv->phylink_config.ovr_an_inband =3D
>  			mdio_bus_data->xpcs_an_inband;
> =

> -	/* Set the platform/firmware specified interface mode */
> +	/* Set the platform/firmware specified interface mode. Note, phylink
> +	 * deals with the PHY interface mode, not the MAC interface mode.
> +	 */
>  	__set_bit(mode, priv->phylink_config.supported_interfaces);
> =

>  	/* If we have an xpcs, it defines which PHY interfaces are =

supported. */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> ff330423ee66..35f4b1484029 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -419,9 +419,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, =
u8
> *mac) return ERR_PTR(phy_mode);
> =

>  	plat->phy_interface =3D phy_mode;
> -	plat->interface =3D stmmac_of_get_mac_mode(np);
> -	if (plat->interface < 0)
> -		plat->interface =3D plat->phy_interface;
> +	plat->mac_interface =3D stmmac_of_get_mac_mode(np);
> +	if (plat->mac_interface < 0)

This check is never true as mac_interface is now an unsigned enum =

(phy_interface_t). Thus mac_interface is not set to phy_interface resulting=
 in =

an invalid mac_interface. My platform (arch/arm64/boot/dts/freescale/imx8mp-
tqma8mpql-mba8mpxl.dts) fails to probe now.

Best regards,
Alexander

> +		plat->mac_interface =3D plat->phy_interface;
> =

>  	/* Some wrapper drivers still rely on phy_node. Let's save it while
>  	 * they are not converted to phylink. */
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index b2ccd827bb80..ce89cc3e4913 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -223,7 +223,20 @@ struct dwmac4_addrs {
>  struct plat_stmmacenet_data {
>  	int bus_id;
>  	int phy_addr;
> -	int interface;
> +	/* MAC ----- optional PCS ----- SerDes ----- optional PHY ----- =

Media
> +	 *       ^                               ^
> +	 * mac_interface                   phy_interface
> +	 *
> +	 * mac_interface is the MAC-side interface, which may be the same
> +	 * as phy_interface if there is no intervening PCS. If there is a
> +	 * PCS, then mac_interface describes the interface mode between the
> +	 * MAC and PCS, and phy_interface describes the interface mode
> +	 * between the PCS and PHY.
> +	 */
> +	phy_interface_t mac_interface;
> +	/* phy_interface is the PHY-side interface - the interface used by
> +	 * an attached PHY.
> +	 */
>  	phy_interface_t phy_interface;
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	struct device_node *phy_node;


-- =

TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
