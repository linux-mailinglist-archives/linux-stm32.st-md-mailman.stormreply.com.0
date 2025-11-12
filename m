Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1537C532FF
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:52:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C4BBC628AC;
	Wed, 12 Nov 2025 15:52:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50A47C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:52:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 21B0EC0F56F;
 Wed, 12 Nov 2025 15:52:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B917D6070B;
 Wed, 12 Nov 2025 15:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14C42102F1C6A; Wed, 12 Nov 2025 16:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762962751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=r4KXq6vkaTt39JXbcQflKkjoNE2v/KM+S0WlsXZAnWY=;
 b=mH4S60asMSlrYa5LEl6HMPEaLrLHp3nTRcdY789GHstthPo+1ZKZOasDuBrvb/B7xSIJEn
 gLzFsmmQ0/YWMUZHd/Z8nE9LwO7kahUfw3IPS08jPLIbyJ1yFIKoMI2HU9OGN5Vztdt57z
 obPJXopwHPqceIemoztIMNv9uBZZYwgqEEGBlbSxJkL78OokCAW/aHVsokKNEOg1DXfpY4
 SqWYxCOGnZoqaZ9zVjUpQxVeBTpLPYJ0PY4dkUZ6rS3UkYEtghKVjpNqjJgew8uhSYn1Fa
 ljP0wuCUmm4Jp1567gNaGadL5i/B1bXOwL1NTRRMtnsEKZp0j9AqTV3k5nc9cA==
Message-ID: <a4dfe008-a7e2-4323-bed5-a444dcc6aa3d@bootlin.com>
Date: Wed, 12 Nov 2025 16:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/13] net: stmmac: mediatek:
 simplify set_interface() methods
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
> Use the phy_intf_sel field value when deciding what other options to
> apply for the configuration register.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
>  1 file changed, 12 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 0f32732efb75..1f2d7d19ca56 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
>  static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = phy_intf_sel;
>  
> -	intf_val = phy_intf_sel;
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= RMII_CLK_SRC_RXC;
>  	}
>  
>  	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
> @@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
>  static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  				u8 phy_intf_sel)
>  {
> -	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
> -	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
> -	u32 intf_val;
> +	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
>  
> -	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
> -
> -	/* select phy interface in top control domain */
> -	switch (plat->phy_mode) {
> -	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= rmii_rxc | rmii_clk_from_mac;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -		break;
> -	default:
> -		dev_err(plat->dev, "phy interface not supported\n");
> -		return -EINVAL;
> +	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
> +		if (plat->rmii_clk_from_mac)
> +			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
> +		if (plat->rmii_rxc)
> +			intf_val |= MT8195_RMII_CLK_SRC_RXC;
>  	}
>  
>  	/* MT8195 only support external PHY */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
