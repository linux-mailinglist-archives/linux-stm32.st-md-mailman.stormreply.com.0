Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E9BFC852
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 16:28:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A451FC58D4D;
	Wed, 22 Oct 2025 14:28:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6B2C58D40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 14:28:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7319F1A15D6;
 Wed, 22 Oct 2025 14:28:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3D2A8606DC;
 Wed, 22 Oct 2025 14:28:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECA3C102F243E; 
 Wed, 22 Oct 2025 16:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761143309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Rile4f14cDJIakjmIfK3sT/0p2MCzB68TdqYyaWZuXk=;
 b=EfUfHj6TGyD85vx69BNLmM9lTYrjeeIyiEMZC+be04ailGl2Q8ZdwxWyqvaufndbyYjWUe
 ojVSXNeyQnT3Tl5zDP9APeAm1CcTdqL2qNBsUcKHuOiqpdYW+Xjy2b3vwMMZjJPGhfYC9X
 +yfzDHBiRPH44Vxw4VW3sLphgBtACQNXX2Vb6MJ/OP1ntVUOkywzDRiXDhZSm7G9ozY+Zz
 dMzKLxvBF/Tco4nJLoaCWhkcqwyX8EyLhFmjaJdvs48d/HDN533WWSx8kfoPGqNfcwMIE9
 Z7DFASR+DWFtEKW7wx/HqgSeum/GPR680fiQqq4RABycvJDJwUQiynS0Yva5bA==
Message-ID: <eb0d1b55-307b-4b51-953f-fdcc1a8fbe27@bootlin.com>
Date: Wed, 22 Oct 2025 16:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: phylink: add phylink
 managed wake-on-lan PHY speed control
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
> Some drivers, e.g. stmmac, use the speed_up()/speed_down() APIs to
> gain additional power saving during Wake-on-LAN where the PHY is
> managing the state.
> 
> Add support to phylink for this, which can be enabled by the MAC
> driver. Only change the PHY speed if the PHY is configured for
> wake-up, but without any wake-up on the MAC side, as MAC side
> means changing the configuration once the negotiation has
> completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 12 ++++++++++++
>  include/linux/phylink.h   |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 939438a6d6f5..26bd4b7619dd 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2576,6 +2576,12 @@ static bool phylink_phy_supports_wol(struct phylink *pl,
>  	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
>  }
>  
> +static bool phylink_phy_pm_speed_ctrl(struct phylink *pl)
> +{
> +	return pl->config->wol_phy_speed_ctrl && !pl->wolopts_mac &&
> +	       pl->phydev && phy_may_wakeup(pl->phydev);
> +}
> +
>  /**
>   * phylink_suspend() - handle a network device suspend event
>   * @pl: a pointer to a &struct phylink returned from phylink_create()
> @@ -2625,6 +2631,9 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
>  	} else {
>  		phylink_stop(pl);
>  	}
> +
> +	if (phylink_phy_pm_speed_ctrl(pl))
> +		phy_speed_down(pl->phydev, false);

Should this rather be phylink_speed_down, to take into account the fact
 that the PHY might be on SFP ? either here or directly in
phylink_phy_pm_speed_ctrl() above ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
