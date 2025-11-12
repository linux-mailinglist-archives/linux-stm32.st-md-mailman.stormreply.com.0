Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDEC532D8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:51:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65328C628AC;
	Wed, 12 Nov 2025 15:51:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38EF3C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:51:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1072BC0F56F;
 Wed, 12 Nov 2025 15:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89CD66070B;
 Wed, 12 Nov 2025 15:50:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36D47102F192F; Wed, 12 Nov 2025 16:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762962658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PE/by9xGlpliyTkU9/7ICSd2kT72lNbYlkzDGAbEjZc=;
 b=Rf52EPAv3ODh6rEa2D+DkHboNpH9TA7v+uh/li3aVbv7fRladsDLoyJgAI6HxP3Hk6C6W5
 IGZ+6yHtu4DrB/qEukmabXELTAlXzuXW7NIP8zBEv+3mg6jXK3TsC2OjEpapFBwbcx59wp
 H5KNfB0Aoh+HiicSaAy45d44XDzjHuUVNMuwNKI86smm5RZdZYHRErG6gnCO+rerHPkIog
 j/M1osJa7yPCH+GyisDOlOEHo8v5lgQVdpb6Z9MUJBQY6grbgfFIKTB4wAwSfs9tXYgXws
 6Qucm4a2vbXwvJYZNi8zak7TKlQK8PSlvHn0POq61xAecUBw1nPWwiTJYWKI8w==
Message-ID: <0383a8e8-1713-438e-86c6-69c8b01cfb48@bootlin.com>
Date: Wed, 12 Nov 2025 16:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-mediatek@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 05/13] net: stmmac: mediatek:
 use stmmac_get_phy_intf_sel()
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



On 11/11/2025 09:12, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result, and pass that into the
> implementation specific ->dwmac_set_phy_interface() method. Use this
> to configure the PHY interface selection field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index dcdf28418fec..0f32732efb75 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
>  };
>  
>  struct mediatek_dwmac_variant {
> -	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
> +	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
> +				       u8 phy_intf_sel);
>  	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
>  
>  	/* clock ids to be requested */
> @@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
>  
> -static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = phy_intf_sel;
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_SEL_GMII_MII;
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  		.tx_delay_max = 17600,
>  };
>  
> -static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
> +static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
> +				u8 phy_intf_sel)
>  {
>  	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
>  	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val = 0;
> +	u32 intf_val;
> +
> +	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> -				       PHY_INTF_SEL_GMII_MII);
> -		break;
>  	case PHY_INTERFACE_MODE_RMII:
>  		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
> +	case PHY_INTERFACE_MODE_MII:
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct mediatek_dwmac_plat_data *plat = priv;
>  	const struct mediatek_dwmac_variant *variant = plat->variant;
> -	int ret;
> +	int phy_intf_sel, ret;
>  
>  	if (variant->dwmac_set_phy_interface) {
> -		ret = variant->dwmac_set_phy_interface(plat);
> +		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
> +		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> +		    phy_intf_sel != PHY_INTF_SEL_RMII) {
> +			dev_err(plat->dev, "phy interface not supported\n");
> +			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +		}
> +
> +		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
>  		if (ret) {
>  			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
>  			return ret;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
