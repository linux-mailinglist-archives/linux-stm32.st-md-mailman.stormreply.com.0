Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A9B0DB1D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 15:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8706C3F93F;
	Tue, 22 Jul 2025 13:40:30 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 112C6C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=J8qiQBG36WBSmQUwYyp0uzxMsuI5XvwcDQhc2TTCUsM=; b=1+uOPwRXEBL1bsymdavVsthvYW
 PIxAm0lVjGxP5QIRq9kR9moqG69iPLRejLM6DR8ey+R6MoRoChI7PhS95xy5RDt21pHF5hI0Lnbpm
 /MRewzSUzB7pzCLs42MWPvp1XDtZuWHHwPs+XSCnNM5XnUzm6Rc+gzje3gyTJ3ixqr7k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ueDE8-002TAs-HI; Tue, 22 Jul 2025 15:40:16 +0200
Date: Tue, 22 Jul 2025 15:40:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
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

I know Russell has also replied about issues with stmmac. Please
consider that when reading what i say... It might be not applicable.

> Seems like a fair and logical approach. It seems reasonable that the
> MAC driver relies on the get_wol() API to know what's supported.
> 
> The tricky thing for the PHY used in this patchset is to get this
> information:
> 
> Extract from the documentation of the LAN8742A PHY:
> "The WoL detection can be configured to assert the nINT interrupt pin
> or nPME pin"

https://www.kernel.org/doc/Documentation/devicetree/bindings/power/wakeup-source.txt

It is a bit messy, but in the device tree, you could have:

    interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>
                 <&pmic 42 IRQ_TYPE_LEVEL_LOW>;
    interrupt-names = "nINT", "wake";
    wakeup-source

You could also have:

    interrupts = <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
    interrupt-names = "wake";
    wakeup-source

In the first example, since there are two interrupts listed, it must
be using the nPME. For the second, since there is only one, it must be
using nINT.

Where this does not work so well is when you have a board which does
not have nINT wired, but does have nPME. The phylib core will see
there is an interrupt and request it, and disable polling. And then
nothing will work. We might be able to delay solving that until such a
board actually exists?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
