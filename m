Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600AC3A209
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 11:13:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9335C349C4;
	Thu,  6 Nov 2025 10:13:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EF63C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 10:13:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 188FEC0FA83;
 Thu,  6 Nov 2025 10:13:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECFA46068C;
 Thu,  6 Nov 2025 10:13:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7297111850A0C; Thu,  6 Nov 2025 11:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762424002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5KYZxA4YJH9uVQqfnlIQeaSC+UTHBZf1ocK/1v86G9k=;
 b=GtiPL+uhuD6tubpnA1wX5x0gydoJzaIP/M2RCEs6N0EpDQUAyJwVJPNOyCNoRRTor4p0X7
 qKbiJpt7eDnPvdc3jveKsjXVmfXObYahALXWQxV67DJJBEymH/Yw3Jjmm59DrLUDbSuRKr
 86a4A2cS2rJ3ETB9OsEHW2O0M2a7IAeRGkDDXkQKW4F7/9A5hJ/XOOsxxdO7pjRSN2UTiy
 Jm6nGoChz1DGptw0qcIwMWiiNhLvmmW274HQALDPwrjc5ai+FShrnjWhbNXdZ2OOdp4cvG
 zp7VHXnU/EzuMWGVuWb/Ucb6qPd/322sTJDaNvFC2D8Z+/kssCtx5Xm9a7yMfA==
Message-ID: <a8147104-9799-4151-8469-ad05b0aa4a9c@bootlin.com>
Date: Thu, 6 Nov 2025 11:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoU-0000000DWot-29Rw@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGvoU-0000000DWot-29Rw@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 07/11] net: stmmac: ingenic:
 move "MAC PHY control register" debug
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
> Move the printing of the MAC PHY control register interface mode
> setting into ingenic_set_phy_intf_sel(), and use phy_modes() to
> print the string rather than using the enum name.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c    | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 79735a476e86..539513890db1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -77,22 +77,12 @@ static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_MII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_GMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_GMII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
> -		break;
> -
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
>  	default:
> @@ -115,7 +105,6 @@ static int x1000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -136,7 +125,6 @@ static int x1600_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -160,7 +148,6 @@ static int x1830_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	switch (plat_dat->phy_interface) {
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_MODE_SEL_MASK, MACPHYC_MODE_SEL_RMII);
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	default:
> @@ -185,7 +172,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  	case PHY_INTERFACE_MODE_RMII:
>  		val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
>  			  FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RMII\n");
>  		break;
>  
>  	case PHY_INTERFACE_MODE_RGMII:
> @@ -205,7 +191,6 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
>  			val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
>  				   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
>  
> -		dev_dbg(mac->dev, "MAC PHY Control Register: PHY_INTERFACE_MODE_RGMII\n");
>  		break;
>  
>  	default:
> @@ -237,6 +222,9 @@ static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
>  			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
>  		}
>  
> +		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> +			phy_modes(interface));
> +
>  		ret = mac->soc_info->set_mode(mac->plat_dat, phy_intf_sel);
>  		if (ret)
>  			return ret;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
