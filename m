Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED466B85A62
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 17:34:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05731C349C6;
	Thu, 18 Sep 2025 15:34:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1013C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=534+lwp2XT2+BE76GPOqNHw9H4NtzKsVjc9xzAvBcWw=; b=DQWGvp0pq6RVj00wUirYjFs+2y
 fORCEVeztn3KYnmhvxMZuL3pGJCZ5u2Pbwpx2PelEmLP3Bs/600/BAt624JQARAK0TjUifSWMdIcA
 wyxhY+8kEnaHts3bxEWdVPCtoTBxlw+oNDLdpClbdAl0TdQi/dm8aA/Zgun5JO+Ckuuw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uzGeY-008qQn-7z; Thu, 18 Sep 2025 17:34:34 +0200
Date: Thu, 18 Sep 2025 17:34:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <46f9bdf8-a35c-4e94-9d4d-c87219444029@lunn.ch>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72ad4e2d-42fa-41c2-960d-c0e7ea80c6ff@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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

> > Andrew has previously suggested that MAC drivers should ask the PHY
> > whether WoL is supported, but this pre-supposes that PHY drivers are
> > coded correctly to only report WoL capabilities if they are really
> > capable of waking the system. As shown in your smsc PHY driver patch,
> > this may not be the case.
> 
> So how can we distinguish whether a PHY that implements WoL features
> is actually able (wired) to wake up the system? By adding the
> "wakeup-source" property to the PHY node?
> 
> Therefore, only set the "can wakeup" capability when both the PHY
> supports WoL and the property is present in the PHY node?

There are layering issue to solve, and backwards compatibility
problems, but basically yes.

I would prefer to keep the phylib API simple. Call get_wol() and it
returns an empty set if the PHY is definitely not capable of waking
the system. Calling set_wol() returns -EOPNOTSUPP, or maybe -EINVAL,
if it definitely cannot wake the system. 

However, 'wakeup-source' on its own is not sufficient. It indicates
the PHY definitely can wake the system. However, it being missing does
not tell us it cannot wake the system, because old DT blobs never had
it, but i assume some work, and some are broken.

We need the PHY driver involved as well. If the driver only supports
WoL via interrupts, and phy_interrupt_is_valid() returns False, it
cannot wake the system.

There other tests we can make, like device_can_wakeup(). In the end,
we probably have some cases where we know it should work, some cases
we know it will not work, and a middle ground, shrug our shoulders, it
might work, try it and see.

> However, this does not solve the actual static pin function
> configuration for pins that can, if correct alternate function is
> selected, generate interrupts, in PHY drivers.
> 
> It would be nice to be able to apply some kind of pinctrl to configure
> the PHY pins over the MDIO bus thanks to some kind of pinctrl hogging.

I don't think it needs to be hogging. From what i remember of pinctrl,
when a driver is probed, pinctrl-0 is activated. It is not limited to
pins which the driver directly uses. So if LED2 is connected to a pin,
pinctrl can at least select the needed function for that pin.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
