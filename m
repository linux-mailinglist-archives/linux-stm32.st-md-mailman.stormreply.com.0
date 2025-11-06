Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B595DC3A330
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:22:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80832C349C4;
	Thu,  6 Nov 2025 10:22:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0774C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:22:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 563F61A18F2;
 Thu,  6 Nov 2025 10:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 254486068C;
 Thu,  6 Nov 2025 10:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8707311850A2F; Thu,  6 Nov 2025 11:22:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762424574; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=t5fJe9feAElneP/yta870eC//hgCpWA6xE5I2Oa5k7I=;
 b=ZQS17aoUlaouBr/Th7AG4xsr2oqMcu/GinPQqFkQmC3wjFGHIPu30a52ty9p2Q4qew1evE
 0uHxqGq5FRHTS2Gp6/WiT2uZXCPao8yiAmCEAFaWwqXbOD+H63m+VHZ9J12guey1poraFU
 W4SGyNZCJZzAmfuLAw4yUJCi3oSF0NcvWuYiBCjddbgoAT7P+ZLTv9ju4/PpqTApV8vppS
 OIspgVcfO0sFkL7CQlJRpohcS5djOzfo1lEhD1G+Y+UeSKJ9tI/V2bHUobpbe4fvTNKtMb
 l4NzZLq1bux1UE+pIbKvBrSpY6Z0aQs93ay8JMeyoX+CiJz5bRyW2JwP1ltIPQ==
Message-ID: <898f6533-2b6a-47d8-8102-1e89e1769c3e@bootlin.com>
Date: Thu, 6 Nov 2025 11:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoj-0000000DWpE-3b5C@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoj-0000000DWpE-3b5C@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 10/11] net: stmmac: ingenic:
 pass ingenic_mac struct rather than plat_dat
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
> It no longer makes sense to pass a pointer to struct
> plat_stmmacenet_data when calling the set_mode() methods to only use it
> to get a pointer to the ingenic_mac structure that we already had in
> the caller. Simplify this by passing the struct ingenic_mac pointer.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 25 ++++++-------------
>  1 file changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index eb5744e0b9ea..41a2071262bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -64,15 +64,13 @@ struct ingenic_soc_info {
>  	enum ingenic_mac_version version;
>  	u32 mask;
>  
> -	int (*set_mode)(struct plat_stmmacenet_data *plat_dat, u8 phy_intf_sel);
> +	int (*set_mode)(struct ingenic_mac *mac, u8 phy_intf_sel);
>  
>  	u8 valid_phy_intf_sel;
>  };
>  
> -static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			       u8 phy_intf_sel)
> +static int jz4775_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel) |
> @@ -82,19 +80,14 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
> -
>  	/* Update MAC PHY control register */
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, 0);
>  }
>  
> -static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1600_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> @@ -103,10 +96,8 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x1830_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII) |
> @@ -116,10 +107,8 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
> -			      u8 phy_intf_sel)
> +static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  {
> -	struct ingenic_mac *mac = plat_dat->bsp_priv;
>  	unsigned int val;
>  
>  	val = FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
> @@ -165,7 +154,7 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
>  			phy_modes(interface));
>  
> -		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
> +		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
>  		if (ret)
>  			return ret;
>  	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
