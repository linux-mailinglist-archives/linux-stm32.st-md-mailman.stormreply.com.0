Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C521BEBB36
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 22:39:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65942C5A4C5;
	Fri, 17 Oct 2025 20:39:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 999EFC5A4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=g7QJB+xINYIsQBlH4P8xjK72iiBxzKUb4jGbIL9WGKM=; b=doQH97vYrTFMTqXGZCyGlT3B+j
 xzprKs3OzJqCJDpWHFWnlgBKEGS68a4eS1kt+GYWAbNo3no3RsoUUhTSRLtP6x48K5fW80b7g1lY8
 NnCXh9xEQG9bvgEnW35kLn2sy7zNhAbJgIOR6P29SktDtgvO+s3IdP39t32C9EwchR7Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1v9rE8-00BKFK-O9; Fri, 17 Oct 2025 22:39:04 +0200
Date: Fri, 17 Oct 2025 22:39:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <4a2d59c0-be25-4b83-b732-138d04f62292@lunn.ch>
References: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: use
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

> -	int addr, found, max_addr;
> +	struct phy_device *phydev;
> +	int addr, max_addr;
>  
>  	if (!mdio_bus_data)
>  		return 0;
> @@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)
>  	if (priv->plat->phy_node || mdio_node)
>  		goto bus_register_done;
>  
> -	found = 0;
> -	for (addr = 0; addr < max_addr; addr++) {

With this loop gone...

> +	phydev = phy_find_first(new_bus);
> +	if (!phydev || phydev->mdio.addr >= max_addr) {
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
> +		new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;

... what is setting addr to a value?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
