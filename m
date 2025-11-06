Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F4C3A083
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:05:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D73CC349C4;
	Thu,  6 Nov 2025 10:05:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0679EC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:05:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1164B4E4155D;
 Thu,  6 Nov 2025 10:05:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DA04C6068C;
 Thu,  6 Nov 2025 10:05:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A255611850861; Thu,  6 Nov 2025 11:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762423532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CRpXhhkIPMjFH3h5RapUBS8iw34S2D1EH/TxwZIqBzY=;
 b=TMoJeyI6P8u2/CTYIEpP8w3bd8Ycd61GlWyBIE/GYjMJh6phwkcq5jMZQjnZR0Gmeln14h
 vojfgQ/tuSRw+IC/vLIU5I6wHxKYC+Vi8ED7Cya9IGlRu7xBTFEJFjZSGvw1fJbBiqECgq
 lrGPs5jNwsnzs4x7YnP8GhY5GEDJN3g/blWQcVqFWMdqkVzQKM+0qqMvHph2MeL7qjwPoG
 qm82aYr7W9TWcfinFI8F2Lr+Qj+elFQNxp15TMSqtnN0HB7zTM8Eo3w8kYwsWJdt9ZrOtQ
 NfmF/Q0AEsEwR4PFZ74u0QLPQwYy5toAuqSlZ3TVE1VWloZl9ITCEdaLzUhCYg==
Message-ID: <e9a03b93-50e2-4d1c-a20a-ad243366ebd9@bootlin.com>
Date: Thu, 6 Nov 2025 11:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoP-0000000DWon-1cOI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoP-0000000DWon-1cOI@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/11] net: stmmac: ingenic:
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


On 06/11/2025 09:57, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result against the SoC specific
> supported phy_intf_sel values, and pass into the SoC specific
> set_mode() methods, replacing the local phy_intf_sel variable. This
> provides the value for the MACPHYC_PHY_INFT_MASK field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

This looks correct to me :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 55 ++++++++++++-------
>  1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 6680f7d3a469..79735a476e86 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -64,28 +64,27 @@ struct ingenic_soc_info {
>  	enum ingenic_mac_version version;
>  	u32 mask;
>  
> -	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
> +	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
> +
> +	u8 valid_phy_intf_sel;
>  };
>  
> -static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			       u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_GMII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -93,7 +92,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		phy_intf_sel = PHY_INTF_SEL_RGMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
> @@ -110,7 +108,8 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  
> @@ -129,15 +128,14 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
>  
> -static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -153,16 +151,15 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -178,17 +175,16 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> +			      u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
> -	u8 phy_intf_sel;
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
> @@ -197,8 +193,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  		val = 0;
> -		phy_intf_sel = PHY_INTF_SEL_RGMII;
> -
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
>  		else
> @@ -229,10 +223,21 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  {
>  	struct ingenic_mac *mac = bsp_priv;
> -	int ret;
> +	phy_interface_t interface;
> +	int phy_intf_sel, ret;
>  
>  	if (mac->soc_info->set_mode) {
> -		ret = mac->soc_info->set_mode(mac->plat_dat);
> +		interface = mac->plat_dat->phy_interface;
> +
> +		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
> +		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
> +		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
> +			dev_err(mac->dev, "unsupported interface %s\n",
> +				phy_modes(interface));
> +			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> +		}
> +
> +		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
>  		if (ret)
>  			return ret;
>  	}
> @@ -309,6 +314,9 @@ static struct ingenic_soc_info jz4775_soc_info = {
>  	.mask = MACPHYC_TXCLK_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = jz4775_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_GMII_MII) |
> +			      BIT(PHY_INTF_SEL_RGMII) |
> +			      BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1000_soc_info = {
> @@ -316,6 +324,7 @@ static struct ingenic_soc_info x1000_soc_info = {
>  	.mask = MACPHYC_SOFT_RST_MASK,
>  
>  	.set_mode = x1000_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1600_soc_info = {
> @@ -323,6 +332,7 @@ static struct ingenic_soc_info x1600_soc_info = {
>  	.mask = MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x1600_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x1830_soc_info = {
> @@ -330,6 +340,7 @@ static struct ingenic_soc_info x1830_soc_info = {
>  	.mask = MACPHYC_MODE_SEL_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x1830_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static struct ingenic_soc_info x2000_soc_info = {
> @@ -338,6 +349,8 @@ static struct ingenic_soc_info x2000_soc_info = {
>  			MACPHYC_RX_DELAY_MASK | MACPHYC_SOFT_RST_MASK | MACPHYC_PHY_INFT_MASK,
>  
>  	.set_mode = x2000_mac_set_mode,
> +	.valid_phy_intf_sel = BIT(PHY_INTF_SEL_RGMII) |
> +			      BIT(PHY_INTF_SEL_RMII),
>  };
>  
>  static const struct of_device_id ingenic_mac_of_matches[] = {

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
