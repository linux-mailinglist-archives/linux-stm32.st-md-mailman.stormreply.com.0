Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B93C8B0C934
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 19:07:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BDB8C32E8F;
	Mon, 21 Jul 2025 17:07:27 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3B77C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ATPRMv6WRS4ltcYjhWI+utSCYQ2pU0+YQZ54Mw2Wv9c=; b=X/7TOYbiNymO23APCZZzJWZm11
 8JWuJ8rAH5b6g52xjDQVrrwKBJyvzOj0yDTbRxXe46pU/cyK/RGilf8hLDFIfFnKS6RJGXlv8VNjW
 wt7HMYS/Vq8zsFgSpNfc+r1HGX0ov6+lSZwPlpzdgiKTlwnu+eMlz53omjI0l+fuHh2Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1udtyp-002Nch-Dr; Mon, 21 Jul 2025 19:07:11 +0200
Date: Mon, 21 Jul 2025 19:07:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
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

> Regarding this property, somewhat similar to "mediatek,mac-wol",
> I need to position a flag at the mac driver level. I thought I'd go
> using the same approach.

Ideally, you don't need such a flag. WoL should be done as low as
possible. If the PHY can do the WoL, the PHY should be used. If not,
fall back to MAC.

Many MAC drivers don't support this, or they get the implementation
wrong. So it could be you need to fix the MAC driver.

MAC get_wol() should ask the PHY what it supports, and then OR in what
the MAC supports.

When set_wol() is called, the MAC driver should ask the PHY driver to
do it. If it return 0, all is good, and the MAC driver can be
suspended when times comes. If the PHY driver returns EOPNOTSUPP, it
means it cannot support all the enabled WoL operations, so the MAC
driver needs to do some of them. The MAC driver then needs to ensure
it is not suspended.

If the PHY driver is missing the interrupt used to wake the system,
the get_wol() call should not return any supported WoL modes. The MAC
will then do WoL. Your "vendor,mac-wol" property is then pointless.

Correctly describe the PHY in DT, list the interrupt it uses for
waking the system.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
