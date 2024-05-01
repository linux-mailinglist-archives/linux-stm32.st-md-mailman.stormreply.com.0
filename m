Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B18B8CD3
	for <lists+linux-stm32@lfdr.de>; Wed,  1 May 2024 17:23:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 666ABC71291;
	Wed,  1 May 2024 15:23:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB406C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 May 2024 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QZtc4ADsuFNoYEFTaxp6L+njnzX7pXdzg+EYMtUefqo=; b=FEf2ohJwKWmJjApy+pRB7qWNcL
 xvQoZk9HXAECcN0eOm1yRC04j+ZUnzyReFd10iFjXxEH3Gc8lO+9La8tg0Ms/8elH84/5WDQ01acn
 nMe70KXhqx3p7eZ4s9OBovy1fPwjCL9w+1O4iM75+zcxcY39SrEXi0AZO9zZ4Y9YT2n8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s2Bne-00EQz3-Vz; Wed, 01 May 2024 17:23:14 +0200
Date: Wed, 1 May 2024 17:23:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4fdf3a29-a380-4db7-b652-51214d5b15fb@lunn.ch>
References: <uz66kbjbxieof6vkliuwgpzhlrbcmeb2f5aeuourw2vqcoc4hv@2adpvba3zszx>
 <229b5a82-1086-40be-8ee5-16b7f3a03b30@lunn.ch>
 <ZjJddIUpXQqH/IA+@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjJddIUpXQqH/IA+@shell.armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org, hkallweit1@gmail.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] racing ndo_open()/phylink*connect() with
	phy_probe()
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

> > It seems unlikely, but one possibility is:
> > 
> > static int stmmac_xgmac2_mdio_read_c22(struct mii_bus *bus, int phyaddr,
> >                                        int phyreg)
> > {
> >         struct net_device *ndev = bus->priv;
> >         struct stmmac_priv *priv;
> >         u32 addr;
> > 
> >         priv = netdev_priv(ndev);
> > 
> >         /* Until ver 2.20 XGMAC does not support C22 addr >= 4 */
> >         if (priv->synopsys_id < DWXGMAC_CORE_2_20 &&
> >             phyaddr > MII_XGMAC_MAX_C22ADDR)
> >                 return -ENODEV;
> > 
> > Maybe if the interface is down, priv->synopsys_id has not been set
> > yet? Your devices are at address 8 and 10, so if priv->synopsys_id
> > where 0, this would give you the ENODEV.
> 
> Yes, I did look at that, but didn't read the DT snippet to realise
> that the addresses would be trapped by that. So, looking at where
> priv->synopsys_id is set... is in stmmac_hwif_init(), which is
> called from stmmac_hw_init(), which in turn is called from
> stmmac_dvr_probe(). This is the only path that leads here.
> 
> This all happens before the MDIO bus is registered, so the value of
> priv->synopsys_id should be set by the time the MDIO bus is registered.
> 
> So I'm unconvinced...

Me too. I just wanted to give an example of why it is important to
track down the source of the ENODEV.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
