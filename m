Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F03C532A5
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:48:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6D79C62D32;
	Wed, 12 Nov 2025 15:48:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1616C628AC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B553FC0F56F;
 Wed, 12 Nov 2025 15:48:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A0AB6070B;
 Wed, 12 Nov 2025 15:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F5A4102F192F; Wed, 12 Nov 2025 16:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762962529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BxPWeNm+YRcGsylPmhFyIf8ssMNkrL6fNFfSq61DRNY=;
 b=AFIU84LVCv9aPJV/SF2tYePN20e+huFLqBLkCZ+66e6kwA1D+2c2BnsoklPeHAC0VQJ9ko
 Jt7TwxQ+npNn2lutRD3zK8ZYbXWgHWAYhpeScp8WhdWA0Yz2yXxLZoqxstpuOZAJtDSm4v
 syciLtpAjhPCI2a6BXgejWJM24YkPPr5z95u0BXlQ1BtH9+xDFHxNAyekzrNABRoTsg5a0
 iUz05/Qe1gycpcQVqKpsA0Ax2RE+lgvSM1PfD8jvi+ye0VjvQAlST/Xo5VlQnuw+0Jpk5s
 tFxrS6XQXFdG+vjipIb7Is4JXA4zuHmzptCiPChilTqbIxx1CeODkYMid718TA==
Message-ID: <4d203e8d-64ba-4b08-9152-a059426a8a79@bootlin.com>
Date: Wed, 12 Nov 2025 16:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 04/13] net: stmmac: mediatek:
 use PHY_INTF_SEL_x
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
> Use PHY_INTF_SEL_x definitions for the fields that correspond to the
> phy_intf_sel inputs to the dwmac core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c   | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index f1b36f0a401d..dcdf28418fec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -17,9 +17,6 @@
>  
>  /* Peri Configuration register for mt2712 */
>  #define PERI_ETH_PHY_INTF_SEL	0x418
> -#define PHY_INTF_MII		0
> -#define PHY_INTF_RGMII		1
> -#define PHY_INTF_RMII		4
>  #define RMII_CLK_SRC_RXC	BIT(4)
>  #define RMII_CLK_SRC_INTERNAL	BIT(5)
>  
> @@ -118,16 +115,16 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= PHY_INTF_MII;
> +		intf_val |= PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
> +		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= PHY_INTF_RGMII;
> +		intf_val |= PHY_INTF_SEL_RGMII;
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");
> @@ -297,17 +294,18 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
>  	/* select phy interface in top control domain */
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
> +				       PHY_INTF_SEL_GMII_MII);
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		intf_val |= (rmii_rxc | rmii_clk_from_mac);
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
> +		intf_val |= rmii_rxc | rmii_clk_from_mac;
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
>  		break;
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> -		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
> +		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
>  		break;
>  	default:
>  		dev_err(plat->dev, "phy interface not supported\n");

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
