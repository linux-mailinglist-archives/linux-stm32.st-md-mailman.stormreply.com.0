Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E9B0D583
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jul 2025 11:14:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C40F6C3F93D;
	Tue, 22 Jul 2025 09:14:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83276C3F93C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xnES4CkHik4n+XCGU7bJoql3BaxRdweXbLtakclHrz4=; b=u/nfxHQbWSa54l6Q24jW2OAPoX
 6Yj4+uH0hBvTF+kb6dENrFod4oSsYqikrJzzCEzGxBoEtih/Zm5LtJDHAZz3mPqIYIyTZbZC9AVts
 FJgoWVYUEL3EqlXJthKYUSxUQadSpYz9xqY5TxZha6h/I5HPyPMMdU9YzX96ch9JsIWpPGG2XI/mh
 rTntgtN0DsVjmK1lSXDYXlUc8IdGkV68hmBuwOltT9+ymQhFFnlomQHoapJWhQ19w1VhArh0+OsC6
 PAOLE2tr9DgBWoaryTp/9sVO06DPoEhKUEZYZdVabSXOt3rgWY/yjJCERjHz+n+XhKh8UP53zYLtJ
 cFjESOiw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36626)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ue94M-00088E-02;
 Tue, 22 Jul 2025 10:13:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ue94H-00072H-35;
 Tue, 22 Jul 2025 10:13:49 +0100
Date: Tue, 22 Jul 2025 10:13:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aH9WTYwty-tso66J@shell.armlinux.org.uk>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
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

On Mon, Jul 21, 2025 at 07:07:11PM +0200, Andrew Lunn wrote:
> > Regarding this property, somewhat similar to "mediatek,mac-wol",
> > I need to position a flag at the mac driver level. I thought I'd go
> > using the same approach.
> 
> Ideally, you don't need such a flag. WoL should be done as low as
> possible. If the PHY can do the WoL, the PHY should be used. If not,
> fall back to MAC.
> 
> Many MAC drivers don't support this, or they get the implementation
> wrong. So it could be you need to fix the MAC driver.
> 
> MAC get_wol() should ask the PHY what it supports, and then OR in what
> the MAC supports.
> 
> When set_wol() is called, the MAC driver should ask the PHY driver to
> do it. If it return 0, all is good, and the MAC driver can be
> suspended when times comes. If the PHY driver returns EOPNOTSUPP, it
> means it cannot support all the enabled WoL operations, so the MAC
> driver needs to do some of them. The MAC driver then needs to ensure
> it is not suspended.
> 
> If the PHY driver is missing the interrupt used to wake the system,
> the get_wol() call should not return any supported WoL modes. The MAC
> will then do WoL. Your "vendor,mac-wol" property is then pointless.
> 
> Correctly describe the PHY in DT, list the interrupt it uses for
> waking the system.

This would be a good idea if we were talking about a new PHY and MAC
driver, but we aren't.

Given the number of platform drivers that stmmac has with numerous
PHY drivers, changing how this works _now_ will likely break current
setups. Whether PHY-side WoL is used is dependent on a
priv->plat->pmt flag which depends on MAC capabilties and also
whether the platform glue sets/clears the STMMAC_FLAG_USE_PHY_WOL
flag.

Yes, it's a mess, and it could do with being improved, which will
likely take considerable time to do to shake out any regressions
caused - both in stmmac and PHY drivers.

I bet there are _numerous_ PHY drivers that report and accept WoL
even when the hardware isn't wired to support WoL. For example,
AT8031 reports that it supports WAKE_KAGIC irrespective of whether
WOL_INT is wired, and whether or not the INT pin is capable of
waking the system. I don't think we have any way that a driver can
determine whether a particular interrupt _can_ wake the system.

The problem for stmmac is that the PHY driver may support WAKE_MAGIC,
but so can the MAC core. If the PHY isn't electrically capable of
waking the system for whatever reason, but the PHY driver still
reports that it can (like AT803x) and we don't program the MAC core,
then under your idea, WoL will no longer work.

The only thing I can think we can now do is to have yet another
STMMAC_FLAG_xxx which platform glue can set to enable a new behaviour.
Yay, a driver with multiple different behaviours depending on flags
for the same feature.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
