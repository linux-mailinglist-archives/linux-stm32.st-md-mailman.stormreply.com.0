Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D5C3A257
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:15:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E38EBC349C4;
	Thu,  6 Nov 2025 10:15:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3F1FC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:15:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 592F5C0FA83;
 Thu,  6 Nov 2025 10:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66ADA6068C;
 Thu,  6 Nov 2025 10:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 886CC118507C0; Thu,  6 Nov 2025 11:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762424123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=oJC1ecETHQcoqSbhmGBKBQYTfQjbYdXTsCWcOEh1NPE=;
 b=Xu1/zo4oGkrhtXu+acmaU6SUTcYCqSnjGZK9EaFB6t0xEz/aKHfIMZoqoPdXM+pNlNhwt9
 +3XETErcxRA2C+Zvl6n9438ZXEtrqoLn0+rBcQKrosZj0i3hO449klUQgiUtN2NeKh1T0t
 G+0HO3djusOizRmF02Hf70ZROMwBMGgKRiNdwvwPfe9mWA84ai1AEAP4dgkgAm8E0WswpI
 TqC88ulR4tMIA7JhyhQbFOzW8sN9Tzx4rOwPXpeK6xPw5HrXQQ/zrQJtOpW/lfRMFj0sP9
 xsIi5VPFsSB3T3hoRPZ6vfOExUADsf8MGmQL3e6IGL6kmb43Q4cuQ6XGs1kpWg==
Message-ID: <60bd1571-e293-4748-adde-396bf193bac2@bootlin.com>
Date: Thu, 6 Nov 2025 11:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoZ-0000000DWp2-2cxj@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoZ-0000000DWp2-2cxj@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 08/11] net: stmmac: ingenic:
 simplify mac_set_mode() methods
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
> x1000, x1600 and x1830 only accept RMII mode. PHY_INTF_SEL_RMII is only
> selected with PHY_INTERFACE_MODE_RMII, and PHY_INTF_SEL_RMII has been
> validated by the SoC's .valid_phy_intf_sel bitmask. Thus, checking the
> interface mode in these functions becomes unnecessary. Remove these.
> 
> jz4775 is similar, except for a greater set of PHY_INTF_SEL_x valies.
> Also remove the switch statement here.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 50 +------------------
>  1 file changed, 2 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 539513890db1..7b2576fbb1e1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -75,22 +75,6 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_GMII:
> -	case PHY_INTERFACE_MODE_RMII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
>  	      FIELD_PREP(MACPHYC_TXCLK_SEL_MASK, MACPHYC_TXCLK_SEL_INPUT);
>  
> @@ -103,16 +87,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  {
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
> @@ -123,16 +97,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
>  
>  	/* Update MAC PHY control register */
> @@ -145,18 +109,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
> -	}
> -
> -	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> +	      FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
>  
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
