Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0538BC53279
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:48:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67EEC628AC;
	Wed, 12 Nov 2025 15:48:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCE30C5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:48:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 24EE84E4165B;
 Wed, 12 Nov 2025 15:48:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E7C2F6070B;
 Wed, 12 Nov 2025 15:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BC440102F1C26; Wed, 12 Nov 2025 16:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762962478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=p+HInJWYvj2EbsQSrQ08qaFvego5yMYy0Y/L5C536i8=;
 b=LnZMVGfYx4JIkgZ0Ij0YvUWtCZRvN4HKk6pXwIobuWFpTpxcBI9lfc8Tws8Zg4Dyd8b3k5
 LkzMbtgJ4Ef0ZgmANMNlmp6ENJAd+NpZ2ry/lM3aDENQytAuaRMP4GqLSei6QX63BvSGJ2
 eTSC/cw2nM6U2nWghrBpDforF1L5XcCQM866onJDZZecaj2TCiHCr/KbO8cVsZFA7jAnA/
 0Kdc2b4kVJeYheJNGtqM5yQxaBqdVzYAXirqATeEpI4AbKw7nGo578gTSvdFcJ0FCMWmvY
 x6s7BtQEM0BWunfkg/k8BALQhE6PXrlszHy4zMGP18q5B9MKxMZ7nbJsUC/hKA==
Message-ID: <69d274c0-8133-4646-bbac-d30e6573dda8@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/13] net: stmmac: loongson1:
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



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
> 
> Note that this will allow GMII as well as MII as the phy_intf_sel
> value is the same for both.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 5f9f66fbc191..894ee66f5c9b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -140,14 +140,9 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct regmap *regmap = dwmac->regmap;
>  	int phy_intf_sel;
>  
> -	switch (plat->phy_interface) {
> -	case PHY_INTERFACE_MODE_MII:
> -		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> -		break;
> -	case PHY_INTERFACE_MODE_RMII:
> -		phy_intf_sel = PHY_INTF_SEL_RMII;
> -		break;
> -	default:
> +	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
> +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
>  			plat->phy_interface);
>  		return -EOPNOTSUPP;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
