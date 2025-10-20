Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B0BF19B2
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 15:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D8E9C5A4EC;
	Mon, 20 Oct 2025 13:46:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CEECC5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 13:46:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B21A61F6F;
 Mon, 20 Oct 2025 13:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4AFC113D0;
 Mon, 20 Oct 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760967971;
 bh=KtOvr2CT2ZJfd+Wdd1NhPf0C0AhFoUXbwiHFwdYHSkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4s8JzE4+w9MiKIIMzTbYJec56T4vfL+sBHbkRo0o1iACbS9wjydWznV7ooaim84T
 AKDL0vLzOM8yb/W4hRv/4WjZeCAr0JofCsF5mRHU4zjF4I/l0bJNjE2kVjtl8XtS1n
 3c7YLb1hTKZWlKyGRfN1OyyZOkWF2vHmKUfwjPu0oxZJAo6+VicMbOt1NAWBgsvWBp
 ZLp5eXyYy4Cx+XQAm3JO2PY9EPYAMNzOh8OxVj/UBSIGpUHtbFi0aHaZNm9ZmqdJjY
 HrtmtrZHWkgXtfIcv63PhDcSgN2qIXNK5DYiKAjxRzN4RZjgMSNUHtBKtI5lj0PdNC
 /7dkyBEb9Ks3g==
Date: Mon, 20 Oct 2025 14:46:07 +0100
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aPY9H0zTwhCWTmXK@horms.kernel.org>
References: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: use
 phy_find_first to simplify stmmac_mdio_register
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

On Sat, Oct 18, 2025 at 08:48:07PM +0200, Heiner Kallweit wrote:

...

> @@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)

...

> +	phydev = phy_find_first(new_bus);
> +	if (!phydev || phydev->mdio.addr > max_addr) {

Hi Heiner,

Depending on logic earlier in this function max_addr may be PHY_MAX_ADDR (32).

>  		dev_warn(dev, "No PHY found\n");
>  		err = -ENODEV;
>  		goto no_phy_found;
>  	}
>  
> +	/*
> +	 * If an IRQ was provided to be assigned after
> +	 * the bus probe, do it here.
> +	 */
> +	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
> +		new_bus->irq[phydev->mdio.addr] = mdio_bus_data->probed_phy_irq;

And new_bus->irq is an array with PHY_MAX_ADDR elements.

So if phydev->mdio.addr and max_addr are both PHY_MAX_ADDR,
then the if condition above my first comment will not be met,
and it seems that the access would irq[] may overflow.

Perhaps this can't occur. But It does seem worth bringing to your attention.

Flagged by Smatch.

> +		phydev->irq = mdio_bus_data->probed_phy_irq;
> +	}
> +
> +	/*
> +	 * If we're going to bind the MAC to this PHY bus, and no PHY number
> +	 * was provided to the MAC, use the one probed here.
> +	 */
> +	if (priv->plat->phy_addr == -1)
> +		priv->plat->phy_addr = phydev->mdio.addr;
> +
> +	phy_attached_info(phydev);
> +
>  bus_register_done:
>  	priv->mii = new_bus;

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
