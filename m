Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D2EC41459
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 19:23:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 662CCC290A0;
	Fri,  7 Nov 2025 18:23:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E23EEC35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 18:23:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1FF57C0FAA4;
 Fri,  7 Nov 2025 18:23:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21613606A6;
 Fri,  7 Nov 2025 18:23:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D09611851120; Fri,  7 Nov 2025 19:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762539819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HL/ia/gSVbKi3fiecZNeUOIq6+F0qjFPHUXwwTnWHW8=;
 b=nM01/8L7C97trD4ZO22+Zl1ZUMI4ARanhQNmuXKobVAYp93mHornwY1U1m1Aal/ZaiJEN0
 ZmfP1/zdd4aVjq/ZDnaSEXO00WPmCUWwpq8Kloz4McmuyHD9ENJuXnWhoIcxYHqYY78HZh
 p5DHDP8lNgaZAfvCcfDM1Po9/GgH/OMrIrwqXmMZCRGUTghjpKucx1dwDfclxkTmnY9X1u
 n5qjVn//S08Br5YZPu9NqjgnOe93QQwFQYODkZWu2PAMfUYUrHD/X7pdIjrQL44tFEp7W6
 yhrXvGMp0jBec4LpLwZo8w7GRazlJuKZXNW7z/W+J1lQEY4nNUZxA4lvnp0YWA==
Message-ID: <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
Date: Fri, 7 Nov 2025 19:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
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

Hi Russell,

On 07/11/2025 15:29, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 26 +++++--------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> index 7b6b048e1be0..9497b13a5753 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> @@ -42,10 +42,6 @@
>  
>  #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
>  
> -#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
> -#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
> -#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
> -
>  struct visconti_eth {
>  	void __iomem *reg;
>  	struct clk *phy_ref_clk;
> @@ -150,22 +146,12 @@ static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmac
>  {
>  	struct visconti_eth *dwmac = plat_dat->bsp_priv;
>  	unsigned int clk_sel_val;
> -	u32 phy_intf_sel;
> -
> -	switch (plat_dat->phy_interface) {
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
> -		break;
> -	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
> -		break;
> -	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
> -		break;
> -	default:
> +	int phy_intf_sel;
> +
> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
>  		return -EOPNOTSUPP;
>  	}

Probably not too big of a deal, but don't we now incorrectly accept the
"gmii" mode ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
