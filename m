Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF66B6CB0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 00:58:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BEF7C6A610;
	Sun, 12 Mar 2023 23:58:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AAC6C69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 23:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=0L7vTZLcerwnAyoI0HVYfhsjcRF+aysJp1HB0AOdCV4=; b=RigY3aTC9kT+QiKNzqRX38zVCH
 H9IyfEUEinWJxoVVOnQL7KViGfh7ztg4ru5NXEGuXPJCagcFhLsCPgYkFt0Kq4kJQ3Kjrxr03MMdr
 rJAatoXBJw2VG1GfOT1bgchjypQ3DpfV21hmdBXDLsOb6ziWbAAjef7IoVoF2hHdfhII=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pbVZI-0078fQ-FU; Mon, 13 Mar 2023 00:57:36 +0100
Date: Mon, 13 Mar 2023 00:57:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Message-ID: <04d0bf49-452c-472c-add4-a0d5bd944476@lunn.ch>
References: <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
 <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
 <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
 <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
Cc: linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: mdio: scan bus based
 on bus capabilities for C22 and C45
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

On Sun, Mar 12, 2023 at 04:15:41PM +0100, Klaus Kudielka wrote:
> On Sun, 2023-03-12 at 10:04 +0100, Klaus Kudielka wrote:
> > On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> > > 
> > > Correct. But their also should not of been any noticeable slow down,
> > > because there should not be any additional scanning when everything is
> > > described in DT. And the move of the MDIO bus registration from probe
> > > to setup should actually make it faster than before.
> > > 
> > 
> > But then, why *do* I see such a big difference on the Omnia?
> > 
> > mdiobus_scan_bus_c45() takes:
> > ~2.7 seconds without phy_mask patch
> > ~0.2 seconds with phy_mask patch
> 
> Following up myself, the answer is in the call path
> mv88e6xxx_mdios_register()
> 	 -> mv88e6xxx_mdio_register()
> 		-> of_mdiobus_register()
> 
> A child node "mdio" would be needed for the scan to be limited by
> the device tree. And this one is *not* in armada-385-turris-omnia.dts.
> 
> My (incorrect) understanding was, the child node "ports" would trigger
> that behaviour.

Yes, of_mdiobus_register() calls mdiobus_register() if there is no
MDIO node in DT. And that will result in a full bus scan, limited by
phy_mask.

And for completeness, there is one additional case. When there is a DT
description, reg = <> is optional for a PHY. Most cases, it is used,
but if you have a board designs which can take different pin
compatible PHYs, the address of the PHY might not be known. After
probing PHYs which are listed in DT with reg properties, it will scan
the bus for additional PHYs and assign them to entries which do not
have reg properties.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
