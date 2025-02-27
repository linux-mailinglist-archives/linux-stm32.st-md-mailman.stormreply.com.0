Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68AA4857F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 17:45:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75423CFAC45;
	Thu, 27 Feb 2025 16:45:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6292CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=HrBR9b6H7tZXfdjF/q6TjeiUJ561S6ADrqTX1DVsg3w=; b=2qay3PcgwSNUno19N5QZc2XmvW
 WGLOEDlugD42oZkbLK0PGD+G/lakTcGwmlVVHeWWeHL0xoL+yuKRrSBibh5I4ZZ8KBFo+cI7LweAf
 YGUe+YgLSzaP1vRo+v6td3PYbW8/mEotEyqXHzxQOCV+ZEbfx12XlO6oQhqWK08Iv7bA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tnh0x-000elu-F6; Thu, 27 Feb 2025 17:45:35 +0100
Date: Thu, 27 Feb 2025 17:45:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <16e3f674-0267-47c1-8825-7f15a379332c@lunn.ch>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tnf1S-0056LC-6H@rmk-PC.armlinux.org.uk>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/5] net: stmmac: simplify
 phylink_suspend() and phylink_resume() calls
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

> @@ -7927,13 +7925,9 @@ int stmmac_resume(struct device *dev)
>  	}
>  
>  	rtnl_lock();
> -	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> -		phylink_resume(priv->phylink);
> -	} else {
> -		phylink_resume(priv->phylink);
> -		if (device_may_wakeup(priv->device))
> -			phylink_speed_up(priv->phylink);
> -	}
> +	phylink_resume(priv->phylink);
> +	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> +		phylink_speed_up(priv->phylink);
>  	rtnl_unlock();
>  
>  	rtnl_lock();

Unrelated to this patch, but unlock() followed by lock()? Seems like
some more code which could be cleaned up?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
