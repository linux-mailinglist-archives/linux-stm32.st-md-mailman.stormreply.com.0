Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741BC3A2F7
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:20:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46239C349C4;
	Thu,  6 Nov 2025 10:20:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE789C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:20:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1E5A64E41560;
 Thu,  6 Nov 2025 10:20:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D80676068C;
 Thu,  6 Nov 2025 10:20:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDB3A11850A23; Thu,  6 Nov 2025 11:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762424406; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=MrtELhIyCno0rfrMQS1AC+bze17pExz4ltwZ19FC44U=;
 b=Jq/9kXCPQZi2LzDTzoftGVWN7+cckHIqtyzVMRR+OGRvHKd9ng3fc1Ww4RwZWNYgL3/iEO
 1SHMwYqYyR+eFMuTAVJ/diFehwENPQCVuDAXOXGmKRj6WD2pcjv0TqnEEd+6feojc2cHyI
 Wc9UiBrCIEjvzBi5zwdB6O373RN7mTK77/y223e7olYEQjrciaf8zqWz94AFvakX6tQKXn
 kRPLRgHoO0wcsraSP9zWQjOOL+KIc8xUXUcjqtPN5JTLzZXfpaVCvEdNSXOnIKHy1Ss/UQ
 C4PLgJrZgIbXH12G321STQlM8+0iVrlFs+oCo6jXVHvxcJBFo+p+4c9BSzIvgQ==
Message-ID: <168cefb5-4a44-4836-8e55-c9c76e99f2aa@bootlin.com>
Date: Thu, 6 Nov 2025 11:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoe-0000000DWp8-37LQ@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoe-0000000DWp8-37LQ@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 09/11] net: stmmac: ingenic:
 simplify x2000 mac_set_mode()
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



On 06/11/2025 09:58, Russell King (Oracle) wrote:
> As per the previous commit, we have validated that the phy_intf_sel
> value is one that is permissible for this SoC, so there is no need to
> handle invalid PHY interface modes. We can also apply the other
> configuration based upon the phy_intf_sel value rather than the
> PHY interface mode.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++--------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 7b2576fbb1e1..eb5744e0b9ea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -122,39 +122,25 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> -			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		break;
> -
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		val = 0;
> +	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> +
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
> +		       FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> +	} else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
>  		if (mac->tx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
>  		else
>  			val |= FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
> -				   FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
> +			       FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
>  
>  		if (mac->rx_delay == 0)
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
>  		else
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
>  				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
> -
> -		break;
> -
> -	default:
> -		dev_err(mac->dev, "Unsupported interface %s\n",
> -			phy_modes(plat_dat->phy_interface));
> -		return -EINVAL;
>  	}
>  
> -	val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
