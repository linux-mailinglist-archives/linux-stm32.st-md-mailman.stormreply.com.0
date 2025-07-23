Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A0B0F530
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 16:24:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3B81C36B3F;
	Wed, 23 Jul 2025 14:24:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 699E9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=wGnkEZQrJ+KCotninbE6PxpnOQMilZmp9uMJbvlcMQ8=; b=g8TAycskRftknN7I5qk+Oh1vKa
 XMC4Bjn7iTfccsiY/vnnITO0PQk7GPx6zLqJLGwhzTxL6ojmsFudhTCkxcPWwZUefUvfMXt+R8PBp
 BUDjLcdZFuXBBGXSRzWF1jCV8F/TP/P6zPwioNQfXHGfuwfUx9PwuBmPesqPQ1gmisFU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ueaNv-002b7y-9m; Wed, 23 Jul 2025 16:23:55 +0200
Date: Wed, 23 Jul 2025 16:23:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <9f00a6cf-c441-4b4c-84ca-5c41e6f0a9d9@lunn.ch>
References: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
 <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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

> We can't retrofit such detection into PHY drivers - if we do so, we'll
> break WoL on lots of boards (we'd need to e.g. describe PMEB in DT for
> RTL8211F PHYs. While we can add it, if a newer kernel that expects
> PMEB to be described to allow WoL is run with an older DT, then that
> will be a regression.) Thus, I don't see how we could retrofit PHY
> WoL support detection to MAC drivers.

WoL is a mess. I wounder on how many boards it actually works
correctly? How often is it tested?

I actually think this is similar to pause and EEE. Those were also a
mess, and mostly wrongly implemented. The solution to that was to take
as much as possible out of the driver and put it into the core,
phylink.

We probably want a similar solution. The MAC driver indicates its WoL
capabilities to phylink. The PHY driver indicates its capabilities to
phylink. phylink implements all the business logic, and just tells the
PHY what it should enable, and stay awake. phylink tells the MAC what
is should enable, and that it should stay awake.

Is this going to happen? Given Russell limited availability, i guess
not. It needs somebody else to step up and take this on. Are we going
to break working systems? Probably. But given how broken this is
overall, how much should we actually care? We can just fix up systems
as they are reported broken.

I also think WoL, pause and EEE is a space we should have more tests
for. To fully test WoL and pause you need a link partner, but i
suspect you can do some basic API tests without one. WoL you
definitely need a link partner. So this makes testing a bit more
difficult. But that should not stop the community from writing such
tests and making them available for developers to use.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
