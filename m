Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D66C53266
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 16:47:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE523C628AC;
	Wed, 12 Nov 2025 15:47:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1044CC5F1D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 15:47:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 35151C0F56F;
 Wed, 12 Nov 2025 15:47:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC4FD6070B;
 Wed, 12 Nov 2025 15:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6690102F192F; Wed, 12 Nov 2025 16:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762962449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VhJK/nv+0ASiIHxO+Y11CbUntTVgMQKT69rk/ES1NxI=;
 b=VPNbNVWd/yU7bWsjlIzkW2w0EhFc/4gP4SYgqNN3fnjEQhk4Y3ArPU1hKZ9Uq4/z50CEYc
 IYtLbtP2csSaEN2yWQoWXFRrO/lnICI045SU4ETVnzYqK+g38R2Dijoo9xrCK55VYPTqJI
 sOjYXOdnanpEpY9uMu8zOENWzXrX91lnr48zJAHFEtDEqaw1tEraWOVoxNlawKwmD0xIjA
 y3DdwNG+xrrXceNfju/SKobXyCVYums5BCJDe+KyG8Z8ozXqssCvpFaf/BhMMbBL5CpxDK
 RqjOPD/uUBkVMe5SSiG4mEwV2CEHln8G34NxaHxPG8jPeYtZ7eZ4/KklYf8y1g==
Message-ID: <8ee62480-88bc-4b1c-a7d4-fd86819d0441@bootlin.com>
Date: Wed, 12 Nov 2025 16:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/13] net: stmmac: loongson1:
 use PHY_INTF_SEL_x directly
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
> Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
> converting them to the PHY_INTF_SELI bitfield when calling
> regmap_update_bits().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 09e2af1d778a..5f9f66fbc191 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -38,8 +38,6 @@
>  #define GMAC_SHUT		BIT(6)
>  
>  #define PHY_INTF_SELI		GENMASK(30, 28)
> -#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
> -#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
>  
>  struct ls1x_dwmac {
>  	struct plat_stmmacenet_data *plat_dat;
> @@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  	struct ls1x_dwmac *dwmac = priv;
>  	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
>  	struct regmap *regmap = dwmac->regmap;
> +	int phy_intf_sel;
>  
>  	switch (plat->phy_interface) {
>  	case PHY_INTERFACE_MODE_MII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_MII);
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>  		break;
>  	case PHY_INTERFACE_MODE_RMII:
> -		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> -				   PHY_INTF_RMII);
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>  		break;
>  	default:
>  		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
> @@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
>  		return -EOPNOTSUPP;
>  	}
>  
> +	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
> +			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
>  	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
>  
>  	return 0;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
