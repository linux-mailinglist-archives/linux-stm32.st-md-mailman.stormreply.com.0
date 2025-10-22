Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287EBFC3B7
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 15:43:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC7BBC58D40;
	Wed, 22 Oct 2025 13:43:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5434C57B64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 13:43:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 779E24E4113D;
 Wed, 22 Oct 2025 13:43:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E3B6606DC;
 Wed, 22 Oct 2025 13:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 860B5102F242F; 
 Wed, 22 Oct 2025 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761140607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GBJUNGHNoCsZ2OCx56e6rdnetXjqjXfaSWdUSlMOnE4=;
 b=E34GmBMaVokVRFK9/DcbPWDvEDixYvzU/DHT/1OEDLbtWJFAnPGC1EHS/MxGfWSnM9PgkL
 SXUV+mfvrCrAG9D8UIVahsR0HZuwrhkfxR2amBTyvS+XLjusMJ19Fq41f8eSa3d14QVMmQ
 LVl+gTbgKkIjhkbuclL0SYlTqQAA0y4znWe0Ot047ghc71tmrY+AcE+nckzSTy/BtJFFIL
 ZFCwFuGTDhGKHEFKFTrxCCSxqJUAXCh14aIg52tKcon3o3lLQiz4MK3IRYeg9PG7IQKpp3
 zj/58g+NPeZGFWHsc5MioHlSQI69YMiLiaUXGrwUJXDhMPc0RYzpCIaF3r1lzA==
Message-ID: <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
Date: Wed, 22 Oct 2025 15:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: phy: add
	phy_may_wakeup()
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

On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> when the PHY driver has marked the device as wakeup capable in the
> driver model, otherwise use phy_drv_wol_enabled().
> 
> Replace the sites that used to call phy_drv_wol_enabled() with this
> as checking the driver model will be more efficient than checking the
> WoL state.
> 
> Export phy_may_wakeup() so that phylink can use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phy_device.c | 14 ++++++++++++--
>  include/linux/phy.h          |  9 +++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 7a67c900e79a..b7feaf0cb1df 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -251,6 +251,16 @@ static bool phy_drv_wol_enabled(struct phy_device *phydev)
>  	return wol.wolopts != 0;
>  }
>  
> +bool phy_may_wakeup(struct phy_device *phydev)
> +{
> +	/* If the PHY is using driver-model based wakeup, use that state. */
> +	if (phy_can_wakeup(phydev))
> +		return device_may_wakeup(&phydev->mdio.dev);
> +
> +	return phy_drv_wol_enabled(phydev);
> +}
> +EXPORT_SYMBOL_GPL(phy_may_wakeup);
> +
>  static void phy_link_change(struct phy_device *phydev, bool up)
>  {
>  	struct net_device *netdev = phydev->attached_dev;
> @@ -302,7 +312,7 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
>  	/* If the PHY on the mido bus is not attached but has WOL enabled
>  	 * we cannot suspend the PHY.
>  	 */
> -	if (!netdev && phy_drv_wol_enabled(phydev))
> +	if (!netdev && phy_may_wakeup(phydev))
>  		return false;
>  
>  	/* PHY not attached? May suspend if the PHY has not already been
> @@ -1909,7 +1919,7 @@ int phy_suspend(struct phy_device *phydev)
>  	if (phydev->suspended || !phydrv)
>  		return 0;
>  
> -	phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
> +	phydev->wol_enabled = phy_may_wakeup(phydev) ||
>  			      (netdev && netdev->ethtool->wol_enabled);
>  	/* If the device has WOL enabled, we cannot suspend the PHY */
>  	if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3eeeaec52832..801356da1fb2 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1391,6 +1391,15 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
>  	return device_can_wakeup(&phydev->mdio.dev);
>  }
>  
> +/**
> + * phy_may_wakeup() - indicate whether PHY has driver model wakeup is enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting.

That's not exactly what's happening, this suggest this is merely a
wrapper around device_may_wakeup().

I don't think it's worth blocking the series though, but if you need to
respin maybe this could be reworded.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
>  void phy_resolve_aneg_pause(struct phy_device *phydev);
>  void phy_resolve_aneg_linkmode(struct phy_device *phydev);
>  

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
